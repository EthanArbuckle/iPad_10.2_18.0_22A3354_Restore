@implementation VCPImageHumanPoseAnalyzerTopDown

- (VCPImageHumanPoseAnalyzerTopDown)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  VCPImageHumanPoseAnalyzerTopDown *v9;
  VCPImageHumanPoseAnalyzerTopDown *v10;
  VCPANSTHandsBodyDetector *v11;
  double v12;
  double v13;
  uint64_t v14;
  VCPANSTHandsBodyDetector *ANSTPersonDetector;
  VCPCNNPersonKeypointsDetector *v16;
  VCPCNNPersonKeypointsDetector *personKeypointsDetector;
  uint64_t v18;
  NSMutableArray *results;
  void *v20;
  VCPImageHumanPoseAnalyzerTopDown *v21;
  objc_super v23;

  v6 = a5;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VCPImageHumanPoseAnalyzerTopDown;
  v9 = -[VCPImageHumanPoseAnalyzerTopDown init](&v23, sel_init, *(_QWORD *)&a3, a4, a5, a6);
  v10 = v9;
  if (v9)
  {
    v9->_maxNumRegions = (int)fmax((double)a3, 1.0);
    v11 = [VCPANSTHandsBodyDetector alloc];
    LODWORD(v12) = 1068149419;
    LODWORD(v13) = 0;
    v14 = -[VCPANSTHandsBodyDetector initWithHandExtendRatio:inputRatio:maxNumPersonRegions:](v11, "initWithHandExtendRatio:inputRatio:maxNumPersonRegions:", v10->_maxNumRegions, v13, v12);
    ANSTPersonDetector = v10->_ANSTPersonDetector;
    v10->_ANSTPersonDetector = (VCPANSTHandsBodyDetector *)v14;

    v16 = -[VCPCNNPersonKeypointsDetector initWithForceCPU:sharedModel:]([VCPCNNPersonKeypointsDetector alloc], "initWithForceCPU:sharedModel:", v7, v6);
    personKeypointsDetector = v10->_personKeypointsDetector;
    v10->_personKeypointsDetector = v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    results = v10->_results;
    v10->_results = (NSMutableArray *)v18;

    v10->_inputWidth = 640;
    v10->_inputHeight = 640;
    v20 = v10->_ANSTPersonDetector;
    if (v20)
    {
      if (v10->_personKeypointsDetector)
        v20 = v10;
      else
        v20 = 0;
    }
    v21 = v20;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (int)updateInputWidth:(int)a3 Height:(int)a4
{
  self->_inputWidth = a3;
  self->_inputHeight = a4;
  return 0;
}

- (int)updateMaxNumPersons:(id)a3
{
  id v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ImageHumanPoseAnalyzerTopDown: maxNumPersons from options = %@", (uint8_t *)&v6, 0xCu);
  }
  if (v4)
  {
    self->_maxNumRegions = (int)fmax((double)(int)objc_msgSend(v4, "intValue"), 1.0);
    -[VCPANSTHandsBodyDetector updateMaxNumPersonRegions:](self->_ANSTPersonDetector, "updateMaxNumPersonRegions:");
  }

  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  int Width;
  int Height;
  int v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  uint64_t j;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  NSMutableArray *results;
  void *v60;
  NSMutableArray *v61;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  VCPImageHumanPoseAnalyzerTopDown *v69;
  uint64_t v70;
  float v71;
  uint64_t v72;
  __CVBuffer *v73;
  uint64_t i;
  id obj;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  const __CFString *v91;
  NSMutableArray *v92;
  const __CFString *v93;
  void *v94;
  _QWORD v95[3];
  uint8_t v96[128];
  uint8_t buf[4];
  int v98;
  __int16 v99;
  int v100;
  _BYTE v101[128];
  uint64_t v102;
  NSRect v103;

  v102 = *MEMORY[0x1E0C80C00];
  v79 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
  v10 = -[VCPANSTHandsBodyDetector anstDetection:rotationInDegrees:detectingFullbody:detectingHands:handsRegions:personRegions:cancel:](self->_ANSTPersonDetector, "anstDetection:rotationInDegrees:detectingFullbody:detectingHands:handsRegions:personRegions:cancel:", a3, 0, 1, 0, 0, v80, v79);
  if (!v10)
  {
    v73 = a3;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = v80;
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
    if (v70)
    {
      v71 = (float)((float)Height * 0.75) / (float)Width;
      v72 = *(_QWORD *)v87;
      v69 = self;
      while (2)
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v87 != v72)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[VCPCNNPersonKeypointsDetector analyzeFrame:withBox:keypoints:padX:padY:](self->_personKeypointsDetector, "analyzeFrame:withBox:keypoints:padX:padY:", v73, v11);
          if (v10)
            goto LABEL_31;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "minX");
          v14 = v13;
          objc_msgSend(v11, "minY");
          v16 = v15;
          objc_msgSend(v11, "maxX");
          v68 = v17;
          objc_msgSend(v11, "minX");
          v67 = v18;
          objc_msgSend(v11, "maxY");
          v66 = v19;
          objc_msgSend(v11, "minY");
          v65 = v20;
          objc_msgSend(v11, "maxX");
          v22 = v21;
          objc_msgSend(v11, "minX");
          v24 = v23;
          objc_msgSend(v11, "maxY");
          v26 = v25;
          objc_msgSend(v11, "minY");
          v28 = v27;
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109376;
            v98 = HIDWORD(v90);
            v99 = 1024;
            v100 = v90;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPImageHumanPoseAnalyzerTopDown - received padX = %d, padY = %d", buf, 0xEu);
          }
          v29 = v22 - v24;
          v30 = v26 - v28;
          if ((float)((float)(v22 - v24) / (float)(v26 - v28)) >= v71)
            v30 = v29 / v71;
          else
            v29 = v71 * v30;
          if (objc_msgSend(v78, "count") != 17)
          {
LABEL_30:

            v10 = -18;
LABEL_31:

            goto LABEL_32;
          }
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v81 = v78;
          v31 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
          v63 = v16;
          v64 = v14;
          if (v31)
          {
            v32 = *(_QWORD *)v83;
            v33 = 0.0;
            while (2)
            {
              for (j = 0; j != v31; ++j)
              {
                if (*(_QWORD *)v83 != v32)
                  objc_enumerationMutation(v81);
                v35 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
                if (objc_msgSend(v35, "count") != 3)
                {

                  goto LABEL_30;
                }
                objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "floatValue");
                v38 = v37;

                objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "floatValue");
                v41 = v40;

                objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "floatValue");
                v44 = v43;

                objc_msgSend(v11, "minX");
                v46 = v45;
                LODWORD(v42) = HIDWORD(v90);
                objc_msgSend(v11, "minY");
                v48 = v47;
                *(float *)&v49 = v46 + (float)((float)((float)(v38 - (float)(int)v42) / 192.0) * v29);
                LODWORD(v39) = v90;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(float *)&v51 = 1.0 - (float)(v48 + (float)((float)((float)(v41 - (float)(int)v39) * 0.0039062) * v30));
                v95[0] = v50;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v95[1] = v52;
                *(float *)&v53 = v44;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v95[2] = v54;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v55);

                v33 = v33 + v44;
              }
              v31 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
              if (v31)
                continue;
              break;
            }
          }
          else
          {
            v33 = 0.0;
          }

          objc_msgSend(v77, "setObject:forKeyedSubscript:", v12, CFSTR("humanKeypoints"));
          v103.origin.x = v64;
          v103.origin.y = v63;
          v103.size.width = (float)(v68 - v67);
          v103.size.height = (float)(v66 - v65);
          NSStringFromRect(v103);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKeyedSubscript:", v56, CFSTR("humanBounds"));

          *(float *)&v57 = v33 / 17.0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKeyedSubscript:", v58, CFSTR("humanConfidence"));

          results = v69->_results;
          v93 = CFSTR("attributes");
          v94 = v77;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](results, "addObject:", v60);

          self = v69;
        }
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
        if (v70)
          continue;
        break;
      }
    }

    v61 = self->_results;
    if (v61)
    {
      v91 = CFSTR("HumanPoseResults");
      v92 = v61;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_32:

  return v10;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result;

  result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      result = 0;
      *a3 = self->_inputWidth;
      *a4 = self->_inputHeight;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_personKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_ANSTPersonDetector, 0);
}

@end
