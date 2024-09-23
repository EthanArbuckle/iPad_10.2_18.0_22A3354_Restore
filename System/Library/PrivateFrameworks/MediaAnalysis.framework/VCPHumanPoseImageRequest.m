@implementation VCPHumanPoseImageRequest

- (VCPHumanPoseImageRequest)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v4, 2u);
  }

  return 0;
}

- (VCPHumanPoseImageRequest)initWithOptions:(id)a3
{
  id v4;
  VCPHumanPoseImageRequest *v5;
  double v6;
  VCPHumanPoseImageRequest *v7;
  int width;
  int height;
  void *v10;
  int maxNumOfPersonsForPose;
  unsigned int revision;
  unsigned int v13;
  VCPImageHumanPoseAnalyzerHolistic *v14;
  uint64_t v15;
  id *v16;
  void *v17;
  void *analyzerHolistic;
  VCPHumanPoseImageRequest *v19;
  objc_super v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VCPHumanPoseImageRequest;
  v5 = -[VCPRequest initWithOptions:](&v21, sel_initWithOptions_, v4);
  v7 = v5;
  if (v5)
  {
    width = v5->super._width;
    if (width < 1 || (height = v5->super._height, height < 1))
    {
      v10 = 0;
    }
    else
    {
      *(float *)&v6 = (float)width / (float)height;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7->super._maxNumOfPersonsForPose = (int)fmax((double)v7->super._maxNumOfPersonsForPose, 1.0);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      maxNumOfPersonsForPose = v7->super._maxNumOfPersonsForPose;
      revision = v7->super._revision;
      *(_DWORD *)buf = 67109376;
      v23 = maxNumOfPersonsForPose;
      v24 = 1024;
      v25 = revision;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHumanPoseImageRequest - max num of persons for pose = %d, _revision = %d", buf, 0xEu);
    }
    v13 = v7->super._revision;
    switch(v13)
    {
      case 3u:
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHumanPoseImageRequest - use holistic human pose detector", buf, 2u);
        }
        v14 = -[VCPImageHumanPoseAnalyzerHolistic initWithMaxNumRegionsPersons:forceCPU:sharedModel:inputConfig:]([VCPImageHumanPoseAnalyzerHolistic alloc], "initWithMaxNumRegionsPersons:forceCPU:sharedModel:inputConfig:", v7->super._maxNumOfPersonsForPose, v7->super._useCPUOnly, 0, &stru_1E6B1C190);
        v15 = 80;
        break;
      case 2u:
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHumanPoseImageRequest - use top-down human pose detector", buf, 2u);
        }
        v14 = -[VCPImageHumanPoseAnalyzerTopDown initWithMaxNumRegions:forceCPU:sharedModel:inputConfig:]([VCPImageHumanPoseAnalyzerTopDown alloc], "initWithMaxNumRegions:forceCPU:sharedModel:inputConfig:", v7->super._maxNumOfPersonsForPose, v7->super._useCPUOnly, 0, &stru_1E6B1C190);
        v15 = 72;
        break;
      case 1u:
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHumanPoseImageRequest - use bottom-up human pose detector", buf, 2u);
        }
        v14 = -[VCPImageHumanPoseAnalyzer initWithKeypointsOption:aspectRatio:lightweight:forceCPU:sharedModel:flushModel:]([VCPImageHumanPoseAnalyzer alloc], "initWithKeypointsOption:aspectRatio:lightweight:forceCPU:sharedModel:flushModel:", 1, v10, 0, v7->super._useCPUOnly, 0, 0);
        v15 = 64;
        break;
      default:
LABEL_25:

        goto LABEL_26;
    }
    v16 = (id *)((char *)&v7->super.super.isa + v15);
    v17 = *(Class *)((char *)&v7->super.super.isa + v15);
    *v16 = v14;

    objc_msgSend(*v16, "preferredInputFormat:height:format:", &v7->_preferredWidth, &v7->_preferredHeight, &v7->_preferredFormat);
    goto LABEL_25;
  }
LABEL_26:
  if (v7->_analyzerBottomUp || v7->_analyzerTopDown || (analyzerHolistic = v7->_analyzerHolistic) != 0)
    analyzerHolistic = v7;
  v19 = analyzerHolistic;

  return v19;
}

+ (int)parseResults:(id)a3 observations:(id)a4 revision:(unsigned int)a5
{
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  VCPKeypoint *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  VCPKeypoint *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  void *v47;
  VCPHandObservation *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  VCPKeypoint *v53;
  void *v54;
  float v55;
  float v56;
  void *v57;
  float v58;
  void *v59;
  VCPHandObservation *v60;
  int v61;
  void *v62;
  NSString *v64;
  NSString *v65;
  NSString *aString;
  void *v67;
  void *v68;
  void *v69;
  unsigned int v70;
  id v71;
  VCPPersonObservation *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id obj;
  id v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;
  NSRect v102;
  NSRect v103;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v78 = a4;
  v75 = v7;
  if (v78)
  {
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    obj = v7;
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    if (v74)
    {
      v70 = a5;
      v76 = *(_QWORD *)v94;
      while (2)
      {
        for (i = 0; i != v74; ++i)
        {
          if (*(_QWORD *)v94 != v76)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("humanConfidence"));
          v79 = (id)objc_claimAutoreleasedReturnValue();

          v11 = v79;
          if (v79)
          {
            objc_msgSend(v79, "floatValue");
            v11 = v79;
            if (v12 >= 0.3)
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("humanKeypoints"));
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v73, "count") != 17)
                goto LABEL_49;
              v72 = objc_alloc_init(VCPPersonObservation);
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = 0u;
              v92 = 0u;
              v89 = 0u;
              v90 = 0u;
              v80 = v73;
              v15 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
              if (v15)
              {
                v16 = *(_QWORD *)v90;
                while (2)
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v90 != v16)
                      objc_enumerationMutation(v80);
                    v18 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
                    if (objc_msgSend(v18, "count") != 3)
                    {
                      v62 = v80;
                      goto LABEL_48;
                    }
                    v19 = objc_alloc_init(VCPKeypoint);
                    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "floatValue");
                    v22 = v21;
                    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "floatValue");
                    -[VCPKeypoint setLocation:](v19, "setLocation:", v22, v24);

                    objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "floatValue");
                    -[VCPKeypoint setConfidence:](v19, "setConfidence:");

                    objc_msgSend(v14, "addObject:", v19);
                  }
                  v15 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
                  if (v15)
                    continue;
                  break;
                }
              }

              -[VCPPersonObservation setKeypoints:](v72, "setKeypoints:", v14);
              v26 = v70;
              if (v70 == 3)
              {
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("humanID"));
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("handsLeft"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("handsKeypoints"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("handsLeft"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("handsBounds"));
                aString = (NSString *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("handsRight"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("handsKeypoints"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("handsRight"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("handsBounds"));
                v64 = (NSString *)objc_claimAutoreleasedReturnValue();

                if (v69)
                {
                  if (objc_msgSend(v69, "count", v64) != 21)
                    goto LABEL_54;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v87 = 0u;
                  v88 = 0u;
                  v85 = 0u;
                  v86 = 0u;
                  v71 = v69;
                  v37 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
                  if (v37)
                  {
                    v38 = *(_QWORD *)v86;
LABEL_23:
                    v39 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v86 != v38)
                        objc_enumerationMutation(v71);
                      v40 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v39);
                      if (objc_msgSend(v40, "count") != 4)
                        goto LABEL_53;
                      v41 = objc_alloc_init(VCPKeypoint);
                      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "floatValue");
                      v44 = v43;
                      objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "floatValue");
                      -[VCPKeypoint setLocation:](v41, "setLocation:", v44, v46);

                      objc_msgSend(v40, "objectAtIndexedSubscript:", 2);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "floatValue");
                      -[VCPKeypoint setConfidence:](v41, "setConfidence:");

                      objc_msgSend(v36, "addObject:", v41);
                      if (v37 == ++v39)
                      {
                        v37 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
                        if (v37)
                          goto LABEL_23;
                        break;
                      }
                    }
                  }

                  v48 = objc_alloc_init(VCPHandObservation);
                  -[VCPHandObservation setKeypoints:](v48, "setKeypoints:", v36);
                  -[VCPHandObservation setChirality:](v48, "setChirality:", 0xFFFFFFFFLL);
                  -[VCPHandObservation setGroupID:](v48, "setGroupID:", objc_msgSend(v67, "intValue"));
                  v102 = NSRectFromString(aString);
                  -[VCPHandObservation setBounds:](v48, "setBounds:", v102.origin.x, v102.origin.y, v102.size.width, v102.size.height);
                  -[VCPPersonObservation setLeftHand:](v72, "setLeftHand:", v48);

                }
                if (v68)
                {
                  if (objc_msgSend(v68, "count") != 21)
                    goto LABEL_54;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v83 = 0u;
                  v84 = 0u;
                  v81 = 0u;
                  v82 = 0u;
                  v71 = v68;
                  v49 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
                  if (v49)
                  {
                    v50 = *(_QWORD *)v82;
LABEL_34:
                    v51 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v82 != v50)
                        objc_enumerationMutation(v71);
                      v52 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v51);
                      if (objc_msgSend(v52, "count", v64) != 4)
                        break;
                      v53 = objc_alloc_init(VCPKeypoint);
                      objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "floatValue");
                      v56 = v55;
                      objc_msgSend(v52, "objectAtIndexedSubscript:", 1);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "floatValue");
                      -[VCPKeypoint setLocation:](v53, "setLocation:", v56, v58);

                      objc_msgSend(v52, "objectAtIndexedSubscript:", 2);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v59, "floatValue");
                      -[VCPKeypoint setConfidence:](v53, "setConfidence:");

                      objc_msgSend(v36, "addObject:", v53);
                      if (v49 == ++v51)
                      {
                        v49 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
                        if (v49)
                          goto LABEL_34;
                        goto LABEL_40;
                      }
                    }
LABEL_53:

LABEL_54:
                    v62 = v67;
LABEL_48:

LABEL_49:
                    v61 = -18;
                    goto LABEL_51;
                  }
LABEL_40:

                  v60 = objc_alloc_init(VCPHandObservation);
                  -[VCPHandObservation setKeypoints:](v60, "setKeypoints:", v36);
                  -[VCPHandObservation setChirality:](v60, "setChirality:", 1);
                  -[VCPHandObservation setGroupID:](v60, "setGroupID:", objc_msgSend(v67, "intValue"));
                  v103 = NSRectFromString(v64);
                  -[VCPHandObservation setBounds:](v60, "setBounds:", v103.origin.x, v103.origin.y, v103.size.width, v103.size.height);
                  -[VCPPersonObservation setRightHand:](v72, "setRightHand:", v60);

                }
                -[VCPPersonObservation setPersonID:](v72, "setPersonID:", objc_msgSend(v67, "intValue", v64));

                v26 = 3;
              }
              -[VCPPersonObservation setRevision:](v72, "setRevision:", v26);
              objc_msgSend(v78, "addObject:", v72);

              v11 = v79;
            }
          }

        }
        v61 = 0;
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
        if (v74)
          continue;
        break;
      }
    }
    else
    {
      v61 = 0;
    }
LABEL_51:

  }
  else
  {
    v61 = -50;
  }

  return v61;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  void *v8;
  VCPImageHumanPoseAnalyzer *analyzerBottomUp;
  VCPImageHumanPoseAnalyzerTopDown *analyzerTopDown;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  VCPImageHumanPoseAnalyzerHolistic *analyzerHolistic;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  analyzerBottomUp = self->_analyzerBottomUp;
  analyzerTopDown = self->_analyzerTopDown;
  if (analyzerBottomUp)
  {
    if (!analyzerTopDown)
    {
      v25 = 0;
      v11 = -[VCPImageHumanPoseAnalyzer analyzePixelBuffer:flags:results:cancel:](analyzerBottomUp, "analyzePixelBuffer:flags:results:cancel:", a3, &v27, &v25, &__block_literal_global_137);
      v12 = v25;
      goto LABEL_6;
    }
LABEL_5:
    v26 = 0;
    v11 = -[VCPImageHumanPoseAnalyzerTopDown analyzePixelBuffer:flags:results:cancel:](analyzerTopDown, "analyzePixelBuffer:flags:results:cancel:", a3, &v27, &v26, &__block_literal_global_8);
    v12 = v26;
    goto LABEL_6;
  }
  if (analyzerTopDown)
    goto LABEL_5;
  analyzerHolistic = self->_analyzerHolistic;
  if (!analyzerHolistic)
  {
    v14 = 0;
    v11 = -18;
    goto LABEL_7;
  }
  v24 = 0;
  v11 = -[VCPImageHumanPoseAnalyzerHolistic analyzePixelBuffer:flags:results:cancel:](analyzerHolistic, "analyzePixelBuffer:flags:results:cancel:", a3, &v27, &v24, &__block_literal_global_138);
  v12 = v24;
LABEL_6:
  v13 = v12;
  v14 = v13;
  if (!v11)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19
      || (v20 = (void *)objc_opt_class(),
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HumanPoseResults")),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v20, "parseResults:observations:revision:", v21, v8, self->super._revision),
          v21,
          !v11))
    {
      a5 = v8;
      goto LABEL_12;
    }
  }
LABEL_7:
  if (a5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: failed to processImage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_12:

  return a5;
}

uint64_t __59__VCPHumanPoseImageRequest_processImage_withOptions_error___block_invoke()
{
  return 0;
}

uint64_t __59__VCPHumanPoseImageRequest_processImage_withOptions_error___block_invoke_2()
{
  return 0;
}

uint64_t __59__VCPHumanPoseImageRequest_processImage_withOptions_error___block_invoke_3()
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  int width;
  int height;
  double v9;
  void *analyzerBottomUp;
  int v11;
  int v12;
  void *v14;
  VCPImageHumanPoseAnalyzerTopDown *analyzerTopDown;
  int v16;
  int v17;
  void *v19;
  int v20;
  int v21;
  void *v23;
  objc_super v25;

  v6 = a3;
  width = self->super._width;
  height = self->super._height;
  v25.receiver = self;
  v25.super_class = (Class)VCPHumanPoseImageRequest;
  -[VCPRequest updateWithOptions:error:](&v25, sel_updateWithOptions_error_, v6, a4);
  analyzerBottomUp = self->_analyzerBottomUp;
  if (!analyzerBottomUp)
    goto LABEL_13;
  v11 = self->super._width;
  if (width == v11)
  {
    v12 = self->super._height;
    if (width < 1 || height == v12)
      goto LABEL_13;
  }
  else
  {
    if (v11 < 1)
      goto LABEL_13;
    v12 = self->super._height;
  }
  if (v12 >= 1)
  {
    *(float *)&v9 = (float)v11 / (float)v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(analyzerBottomUp) = objc_msgSend(analyzerBottomUp, "updateModelForAspectRatio:", v14);

    if ((_DWORD)analyzerBottomUp)
      goto LABEL_41;
  }
LABEL_13:
  analyzerTopDown = self->_analyzerTopDown;
  if (!analyzerTopDown)
    goto LABEL_27;
  v16 = self->super._width;
  if (width == v16)
  {
    v17 = self->super._height;
    if (width >= 1 && height != v17)
    {
LABEL_23:
      if (v17 >= 1)
      {
        LODWORD(analyzerBottomUp) = -[VCPImageHumanPoseAnalyzerTopDown updateInputWidth:Height:](self->_analyzerTopDown, "updateInputWidth:Height:");
        if ((_DWORD)analyzerBottomUp)
          goto LABEL_41;
        analyzerTopDown = self->_analyzerTopDown;
      }
    }
  }
  else if (v16 >= 1)
  {
    v17 = self->super._height;
    goto LABEL_23;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxNumOfPersons"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPImageHumanPoseAnalyzerTopDown updateMaxNumPersons:](analyzerTopDown, "updateMaxNumPersons:", v19);

LABEL_27:
  analyzerBottomUp = self->_analyzerHolistic;
  if (!analyzerBottomUp)
    goto LABEL_41;
  v20 = self->super._width;
  if (width == v20)
  {
    v21 = self->super._height;
    if (width < 1 || height == v21)
      goto LABEL_40;
  }
  else
  {
    if (v20 < 1)
    {
LABEL_40:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxNumOfPersons"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(analyzerBottomUp, "updateMaxNumPersons:", v23);

      LODWORD(analyzerBottomUp) = 0;
      goto LABEL_41;
    }
    v21 = self->super._height;
  }
  if (v21 < 1)
    goto LABEL_40;
  LODWORD(analyzerBottomUp) = -[VCPImageHumanPoseAnalyzerHolistic updateInputWidth:Height:](self->_analyzerHolistic, "updateInputWidth:Height:");
  if (!(_DWORD)analyzerBottomUp)
  {
    analyzerBottomUp = self->_analyzerHolistic;
    goto LABEL_40;
  }
LABEL_41:

  return (_DWORD)analyzerBottomUp == 0;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  VCPImageHumanPoseAnalyzer *analyzerBottomUp;
  VCPImageHumanPoseAnalyzerTopDown *analyzerTopDown;
  VCPImageHumanPoseAnalyzerHolistic *analyzerHolistic;
  double preferredWidth;
  double preferredHeight;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  analyzerBottomUp = self->_analyzerBottomUp;
  if (analyzerBottomUp)
    -[VCPImageHumanPoseAnalyzer preferredInputFormat:height:format:](analyzerBottomUp, "preferredInputFormat:height:format:", &self->_preferredWidth, &self->_preferredHeight, &self->_preferredFormat);
  analyzerTopDown = self->_analyzerTopDown;
  if (analyzerTopDown)
    -[VCPImageHumanPoseAnalyzerTopDown preferredInputFormat:height:format:](analyzerTopDown, "preferredInputFormat:height:format:", &self->_preferredWidth, &self->_preferredHeight, &self->_preferredFormat);
  analyzerHolistic = self->_analyzerHolistic;
  if (analyzerHolistic)
    -[VCPImageHumanPoseAnalyzerHolistic preferredInputFormat:height:format:](analyzerHolistic, "preferredInputFormat:height:format:", &self->_preferredWidth, &self->_preferredHeight, &self->_preferredFormat);
  preferredWidth = (double)self->_preferredWidth;
  preferredHeight = (double)self->_preferredHeight;

  v11 = preferredWidth;
  v12 = preferredHeight;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  VCPImageHumanPoseAnalyzer *analyzerBottomUp;
  VCPImageHumanPoseAnalyzerTopDown *analyzerTopDown;
  VCPImageHumanPoseAnalyzerHolistic *analyzerHolistic;

  analyzerBottomUp = self->_analyzerBottomUp;
  self->_analyzerBottomUp = 0;

  analyzerTopDown = self->_analyzerTopDown;
  self->_analyzerTopDown = 0;

  analyzerHolistic = self->_analyzerHolistic;
  self->_analyzerHolistic = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerHolistic, 0);
  objc_storeStrong((id *)&self->_analyzerTopDown, 0);
  objc_storeStrong((id *)&self->_analyzerBottomUp, 0);
}

@end
