@implementation VCPImageHumanPoseAnalyzerHolistic

- (VCPImageHumanPoseAnalyzerHolistic)initWithMaxNumRegionsPersons:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 inputConfig:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  VCPImageHumanPoseAnalyzerHolistic *v9;
  VCPImageHumanPoseAnalyzerHolistic *v10;
  double v11;
  VCPANSTHandsBodyDetector *v12;
  double v13;
  double v14;
  uint64_t v15;
  VCPANSTHandsBodyDetector *ANSTPersonDetector;
  VCPCNNPersonKeypointsDetector *v17;
  VCPCNNPersonKeypointsDetector *personKeypointsDetector;
  uint64_t v19;
  VCPCNNHandKeypointsDetector *handsKeypointsDetector;
  uint64_t v21;
  NSMutableArray *results;
  void *v23;
  VCPImageHumanPoseAnalyzerHolistic *v24;
  objc_super v26;

  v6 = a5;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)VCPImageHumanPoseAnalyzerHolistic;
  v9 = -[VCPImageHumanPoseAnalyzerHolistic init](&v26, sel_init, *(_QWORD *)&a3, a4, a5, a6);
  v10 = v9;
  if (v9)
  {
    v11 = fmax((double)a3, 1.0);
    v9->_maxNumRegionsPerson = (int)v11;
    v9->_maxNumRegionsHands = 2 * (int)v11;
    v12 = [VCPANSTHandsBodyDetector alloc];
    LODWORD(v13) = 1068149419;
    LODWORD(v14) = 0.25;
    v15 = -[VCPANSTHandsBodyDetector initWithHandExtendRatio:inputRatio:maxNumPersonRegions:](v12, "initWithHandExtendRatio:inputRatio:maxNumPersonRegions:", v10->_maxNumRegionsPerson, v14, v13);
    ANSTPersonDetector = v10->_ANSTPersonDetector;
    v10->_ANSTPersonDetector = (VCPANSTHandsBodyDetector *)v15;

    v17 = -[VCPCNNPersonKeypointsDetector initWithForceCPU:sharedModel:]([VCPCNNPersonKeypointsDetector alloc], "initWithForceCPU:sharedModel:", v7, v6);
    personKeypointsDetector = v10->_personKeypointsDetector;
    v10->_personKeypointsDetector = v17;

    +[VCPCNNHandKeypointsDetector detector:sharedModel:modelName:enableHandObject:options:](VCPCNNHandKeypointsDetector, "detector:sharedModel:modelName:enableHandObject:options:", v7, v6, CFSTR("hand_keypoint_detector_lite.espresso.net"), 1, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    handsKeypointsDetector = v10->_handsKeypointsDetector;
    v10->_handsKeypointsDetector = (VCPCNNHandKeypointsDetector *)v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    results = v10->_results;
    v10->_results = (NSMutableArray *)v21;

    v10->_inputWidth = 640;
    v10->_inputHeight = 640;
    v23 = v10->_ANSTPersonDetector;
    if (v23)
    {
      v23 = v10->_personKeypointsDetector;
      if (v23)
      {
        if (v10->_handsKeypointsDetector)
          v23 = v10;
        else
          v23 = 0;
      }
    }
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (int)updateInputWidth:(int)a3 Height:(int)a4
{
  self->_inputWidth = a3;
  self->_inputHeight = a4;
  return 0;
}

- (int)convertSingleResultToDict:(CGPoint)a3[21] keypointConfidence:(float *)a4 box:(id)a5 leftHandsResults:(id)a6 RightHandsResults:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  uint64_t v33;
  float v34;
  CGFloat *p_y;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  double v44;
  float v45;
  float v46;
  double v47;
  float v48;
  float v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v64;
  double v65;
  double v66;
  double v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v73;
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[8];
  NSRect v77;

  v76[6] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v69 = a6;
  v68 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "minX");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v12;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "minY");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v14;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "maxX");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v16;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "maxY");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v76[3] = v18;
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "confidence");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v76[4] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "classIndex"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v76[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addObject:", v22);

  objc_msgSend(v10, "minX");
  v24 = v23;
  objc_msgSend(v10, "minY");
  v26 = v25;
  objc_msgSend(v10, "maxX");
  v28 = v27;
  objc_msgSend(v10, "minX");
  v30 = v29;
  objc_msgSend(v10, "maxY");
  v32 = v31;
  objc_msgSend(v10, "minY");
  v33 = 0;
  v66 = (float)(v28 - v30);
  v67 = v24;
  v64 = v26;
  v65 = (float)(v32 - v34);
  p_y = &a3->y;
  do
  {
    objc_msgSend(v10, "maxX", *(_QWORD *)&v64, *(_QWORD *)&v65, *(_QWORD *)&v66, *(_QWORD *)&v67);
    v37 = v36;
    objc_msgSend(v10, "minX");
    v39 = v38;
    objc_msgSend(v10, "maxY");
    v41 = v40;
    objc_msgSend(v10, "minY");
    v43 = v42;
    if (*(p_y - 1) == 0.0 && (v44 = *p_y, *p_y == 0.0))
    {
      v74[0] = &unk_1E6B71EF0;
      v74[1] = &unk_1E6B71EF0;
      *(float *)&v44 = a4[v33];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v52;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "classIndex"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addObject:", v56);
    }
    else
    {
      objc_msgSend(v10, "minX");
      v46 = v45;
      v47 = *(p_y - 1);
      objc_msgSend(v10, "minY");
      v49 = v48;
      v50 = v46 + v47 / 192.0 * (float)(v37 - v39);
      *(float *)&v50 = v50;
      v51 = *p_y;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v49 + v51 / 192.0 * (float)(v41 - v43);
      *(float *)&v53 = v53;
      *(float *)&v53 = 1.0 - *(float *)&v53;
      v75[0] = v52;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v54;
      *(float *)&v55 = a4[v33];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v56;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "classIndex"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v75[3] = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addObject:", v58);

    }
    ++v33;
    p_y += 2;
  }
  while (v33 != 21);
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v73, CFSTR("handsKeypoints"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "trackID"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v59, CFSTR("handsTrackingID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "groupID"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v60, CFSTR("handsGroupID"));

  v77.size.height = v65;
  v77.origin.y = 1.0 - v64 - v65;
  v77.size.width = v66;
  v77.origin.x = v67;
  NSStringFromRect(v77);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v61, CFSTR("handsBounds"));

  if (objc_msgSend(v10, "classIndex") == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "groupID"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v71, v62);
    goto LABEL_12;
  }
  if (objc_msgSend(v10, "classIndex") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "groupID"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKeyedSubscript:", v71, v62);
LABEL_12:

  }
  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  int Width;
  int Height;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
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
  float v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  uint64_t j;
  void *v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  void *v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  uint64_t v75;
  uint64_t m;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSMutableArray *results;
  void *v88;
  NSMutableArray *v89;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  uint64_t v97;
  float v98;
  void *v99;
  uint64_t v100;
  id *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  id i;
  id v107;
  void *v108;
  void *v109;
  id obj;
  __CVBuffer *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  int v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  const __CFString *v135;
  NSMutableArray *v136;
  const __CFString *v137;
  void *v138;
  uint8_t v139[128];
  uint8_t v140[4];
  double v141;
  __int16 v142;
  double v143;
  __int16 v144;
  double v145;
  __int16 v146;
  double v147;
  uint8_t buf[4];
  int v149;
  __int16 v150;
  int v151;
  _BYTE v152[128];
  _QWORD v153[3];
  _BYTE v154[128];
  _BYTE v155[128];
  _OWORD v156[5];
  int v157;
  uint64_t v158;
  NSRect v159;

  v158 = *MEMORY[0x1E0C80C00];
  v102 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = 0;
  memset(v156, 0, sizeof(v156));
  v134 = 0;
  Width = CVPixelBufferGetWidth(a3);
  v111 = a3;
  Height = CVPixelBufferGetHeight(a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = a5;
  -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
  v10 = -[VCPANSTHandsBodyDetector anstDetection:rotationInDegrees:detectingFullbody:detectingHands:handsRegions:personRegions:cancel:](self->_ANSTPersonDetector, "anstDetection:rotationInDegrees:detectingFullbody:detectingHands:handsRegions:personRegions:cancel:", v111, 0, 1, 1, v103, v104, v102);
  if (!v10)
  {
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v11 = v104;
    v97 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v130, v155, 16);
    if (v97)
    {
      v98 = (float)((float)Height * 0.75) / (float)Width;
      v100 = *(_QWORD *)v131;
      v99 = v11;
      while (2)
      {
        for (i = 0; i != (id)v97; i = (char *)i + 1)
        {
          if (*(_QWORD *)v131 != v100)
            objc_enumerationMutation(v11);
          v12 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "groupID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "addObject:", v13);

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[VCPCNNPersonKeypointsDetector analyzeFrame:withBox:keypoints:padX:padY:](self->_personKeypointsDetector, "analyzeFrame:withBox:keypoints:padX:padY:", v111, v12);
          if (v10)
            goto LABEL_49;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "minX");
          v16 = v15;
          objc_msgSend(v12, "minY");
          v18 = v17;
          objc_msgSend(v12, "maxX");
          v96 = v19;
          objc_msgSend(v12, "minX");
          v95 = v20;
          objc_msgSend(v12, "maxY");
          v94 = v21;
          objc_msgSend(v12, "minY");
          v93 = v22;
          objc_msgSend(v12, "maxX");
          v24 = v23;
          objc_msgSend(v12, "minX");
          v26 = v25;
          objc_msgSend(v12, "maxY");
          v28 = v27;
          objc_msgSend(v12, "minY");
          v30 = v29;
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109376;
            v149 = HIDWORD(v134);
            v150 = 1024;
            v151 = v134;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPImageHumanPoseAnalyzerTopDown - received padX = %d, padY = %d", buf, 0xEu);
          }
          v31 = v24 - v26;
          v32 = v28 - v30;
          if ((float)((float)(v24 - v26) / (float)(v28 - v30)) >= v98)
            v32 = v31 / v98;
          else
            v31 = v98 * v32;
          if (objc_msgSend(v109, "count") != 17)
          {
LABEL_48:

            v10 = -18;
LABEL_49:

            goto LABEL_51;
          }
          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          obj = v109;
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v154, 16);
          v91 = v18;
          v92 = v16;
          if (v33)
          {
            v34 = *(_QWORD *)v127;
            v35 = 0.0;
            while (2)
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v127 != v34)
                  objc_enumerationMutation(obj);
                v37 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
                if (objc_msgSend(v37, "count") != 3)
                {

                  goto LABEL_48;
                }
                objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "floatValue");
                v40 = v39;

                objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "floatValue");
                v43 = v42;

                objc_msgSend(v37, "objectAtIndexedSubscript:", 2);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "floatValue");
                v46 = v45;

                objc_msgSend(v12, "minX");
                v48 = v47;
                LODWORD(v44) = HIDWORD(v134);
                objc_msgSend(v12, "minY");
                v50 = v49;
                *(float *)&v51 = v48 + (float)((float)((float)(v40 - (float)(int)v44) / 192.0) * v31);
                LODWORD(v44) = v134;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(float *)&v53 = 1.0 - (float)(v50 + (float)((float)((float)(v43 - (float)(int)v44) * 0.0039062) * v32));
                v153[0] = v52;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v153[1] = v54;
                *(float *)&v55 = v46;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v153[2] = v56;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 3);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v57);

                v35 = v35 + v46;
              }
              v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v154, 16);
              if (v33)
                continue;
              break;
            }
          }
          else
          {
            v35 = 0.0;
          }

          objc_msgSend(v108, "setObject:forKeyedSubscript:", v14, CFSTR("humanKeypoints"));
          v159.origin.x = v92;
          v159.origin.y = v91;
          v159.size.width = (float)(v96 - v95);
          v159.size.height = (float)(v94 - v93);
          NSStringFromRect(v159);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "setObject:forKeyedSubscript:", v58, CFSTR("humanBounds"));

          *(float *)&v59 = v35 / 17.0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "setObject:forKeyedSubscript:", v60, CFSTR("humanConfidence"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "groupID"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "setObject:forKeyedSubscript:", v108, v61);

          v11 = v99;
        }
        v97 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v130, v155, 16);
        if (v97)
          continue;
        break;
      }
    }

    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v62 = v103;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v122, v152, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v123;
      while (2)
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v123 != v64)
            objc_enumerationMutation(v62);
          v66 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v66, "groupID"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "addObject:", v67);

          v121 = 0;
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v66, "minX");
            v69 = v68;
            objc_msgSend(v66, "minY");
            v71 = v70;
            objc_msgSend(v66, "maxX");
            v73 = v72;
            objc_msgSend(v66, "maxY");
            *(_DWORD *)v140 = 134218752;
            v141 = v69;
            v142 = 2048;
            v143 = v71;
            v144 = 2048;
            v145 = v73;
            v146 = 2048;
            v147 = v74;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "hand box minX = %f, minY = %f, maxX = %f, maxY = %f", v140, 0x2Au);
          }
          v10 = -[VCPCNNHandKeypointsDetector handKeypointsDetection:box:keypoints:keypointConfidence:handHoldsObjectConfidence:](self->_handsKeypointsDetector, "handKeypointsDetection:box:keypoints:keypointConfidence:handHoldsObjectConfidence:", v111, v66, buf, v156, &v121);
          if (v10)
          {

            goto LABEL_51;
          }
          -[VCPImageHumanPoseAnalyzerHolistic convertSingleResultToDict:keypointConfidence:box:leftHandsResults:RightHandsResults:](self, "convertSingleResultToDict:keypointConfidence:box:leftHandsResults:RightHandsResults:", buf, v156, v66, v114, v113);
        }
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v122, v152, 16);
        if (v63)
          continue;
        break;
      }
    }

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v107 = v105;
    v75 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
    if (v75)
    {
      v112 = *(_QWORD *)v118;
      do
      {
        for (m = 0; m != v75; ++m)
        {
          if (*(_QWORD *)v118 != v112)
            objc_enumerationMutation(v107);
          v77 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * m);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "objectForKeyedSubscript:", v77);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("humanKeypoints"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v80, CFSTR("humanKeypoints"));

          objc_msgSend(v116, "objectForKeyedSubscript:", v77);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("humanBounds"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v82, CFSTR("humanBounds"));

          objc_msgSend(v116, "objectForKeyedSubscript:", v77);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("humanConfidence"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v84, CFSTR("humanConfidence"));

          objc_msgSend(v114, "objectForKeyedSubscript:", v77);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v85, CFSTR("handsLeft"));

          objc_msgSend(v113, "objectForKeyedSubscript:", v77);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v86, CFSTR("handsRight"));

          objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, CFSTR("humanID"));
          results = self->_results;
          v137 = CFSTR("attributes");
          v138 = v78;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](results, "addObject:", v88);

        }
        v75 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
      }
      while (v75);
    }

    v89 = self->_results;
    if (v89)
    {
      v135 = CFSTR("HumanPoseResults");
      v136 = v89;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
      v10 = 0;
      *v101 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_51:

  return v10;
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ImageHumanPoseAnalyzerHolistic: maxNumPersons from options = %@", (uint8_t *)&v6, 0xCu);
  }
  if (v4)
  {
    self->_maxNumRegionsPerson = (int)fmax((double)(int)objc_msgSend(v4, "intValue"), 1.0);
    -[VCPANSTHandsBodyDetector updateMaxNumPersonRegions:](self->_ANSTPersonDetector, "updateMaxNumPersonRegions:");
  }

  return 0;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result;
  int inputWidth;
  int inputHeight;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = -50;
  if (a3 && a4 && a5)
  {
    *a3 = self->_inputWidth;
    *a4 = self->_inputHeight;
    *a5 = 1111970369;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (!result)
        return result;
      inputWidth = self->_inputWidth;
      inputHeight = self->_inputHeight;
      v9[0] = 67109376;
      v9[1] = inputWidth;
      v10 = 1024;
      v11 = inputHeight;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "preferredInputFormat:  width = %d,  height = %d", (uint8_t *)v9, 0xEu);
    }
    return 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_handsKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_personKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_ANSTPersonDetector, 0);
}

@end
