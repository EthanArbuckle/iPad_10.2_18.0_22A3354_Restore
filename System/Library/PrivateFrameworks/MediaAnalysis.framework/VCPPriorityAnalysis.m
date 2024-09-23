@implementation VCPPriorityAnalysis

- (VCPPriorityAnalysis)init
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;
  uint8_t buf[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)VCPPriorityAnalysis;
  v2 = -[VCPPriorityAnalysis init](&v20, sel_init);
  if (v2)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Start initializing", buf, 2u);
    }
    *((_DWORD *)v2 + 2) = 0;
    *((_BYTE *)v2 + 56) = 0;
    *((_QWORD *)v2 + 3) = 0;
    *(_QWORD *)buf = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)v2 + 32, (char *)buf, (uint64_t)&v22, 2uLL);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 20);
    *((_QWORD *)v2 + 20) = v7;

    +[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:](VCPCNNHandsDetector, "detector:forceCPU:sharedModel:inputConfig:revision:", 2, 0, 1, CFSTR("res_192x192"), 2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v9;

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Finished initializing hand detector", buf, 2u);
    }
    +[VCPCNNHandKeypointsDetector detector:sharedModel:modelName:enableHandObject:options:](VCPCNNHandKeypointsDetector, "detector:sharedModel:modelName:enableHandObject:options:", 0, 1, CFSTR("hand_keypoint_detector_lite.espresso.net"), 1, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v11;

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Finished initializing hand keypoint detector with hand_keypoint_detector_lite.espresso.net", buf, 2u);
    }
    +[VCPCNNFastGestureRecognition detector](VCPCNNFastGestureRecognition, "detector");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v13;

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Finished initializing gesture recognizer", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 16);
    *((_QWORD *)v2 + 16) = v15;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v17;

  }
  return (VCPPriorityAnalysis *)v2;
}

- (void)dealloc
{
  Rotator *rotator;
  objc_super v4;

  rotator = self->_rotator;
  if (rotator)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotator);
    MEMORY[0x1BCCA12BC]();
  }
  -[VCPCNNFastGestureRecognition planDestroy](self->_fastGestureDetector, "planDestroy");
  v4.receiver = self;
  v4.super_class = (Class)VCPPriorityAnalysis;
  -[VCPPriorityAnalysis dealloc](&v4, sel_dealloc);
}

+ (id)priorityAnalysis
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (int)addKeypointsToNSArray:(CGPoint *)a3 keypointConfidence:(float)a4[21] handBox:(id)a5 keypointsArray:(id)a6
{
  id v9;
  id v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  float v18;
  float v19;
  double v20;
  double v21;
  CGFloat *p_y;
  double v23;
  float v24;
  float v25;
  double v26;
  float v27;
  float v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  objc_msgSend(v9, "maxX");
  v12 = v11;
  objc_msgSend(v9, "minX");
  v14 = v13;
  objc_msgSend(v9, "maxY");
  v16 = v15;
  objc_msgSend(v9, "minY");
  v17 = 0;
  v19 = v16 - v18;
  v20 = (float)(v12 - v14);
  v21 = v19;
  p_y = &a3->y;
  do
  {
    if (*(p_y - 1) == 0.0 && (v23 = *p_y, *p_y == 0.0))
    {
      v38[0] = &unk_1E6B71FE0;
      v38[1] = &unk_1E6B71FE0;
      *(float *)&v23 = a4[v17];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v17, v33);
    }
    else
    {
      objc_msgSend(v9, "minX");
      v25 = v24;
      v26 = *(p_y - 1);
      objc_msgSend(v9, "minY");
      v28 = v27;
      v29 = v25 + v26 / 255.0 * v20;
      *(float *)&v29 = v29;
      v30 = *p_y;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v28 + v30 / 255.0 * v21;
      *(float *)&v32 = v32;
      v39[0] = v31;
      *(float *)&v32 = 1.0 - *(float *)&v32;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v33;
      *(float *)&v34 = a4[v17];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v17, v36);

    }
    ++v17;
    p_y += 2;
  }
  while (v17 != 21);

  return 0;
}

- (int)fastSignLanguageDetection:(float *)a3 ofPixelBuffer:(__CVBuffer *)a4 withMetadata:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  int v13;
  Rotator *rotator;
  int v15;
  int v16;
  void *v17;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int128 v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  int *begin;
  int v27;
  int *v28;
  int *end;
  int *v30;
  int *v31;
  int v32;
  int v33;
  BOOL v34;
  unint64_t v35;
  int dominantHand;
  int *v37;
  int v38;
  int v39;
  void *v40;
  int v41;
  NSDate *v42;
  NSDate *frameEndTimeStamp;
  double v44;
  double v45;
  NSDate *v46;
  NSDate *prevTimeStampHandDetected;
  float v48;
  float v49;
  NSDate *v50;
  NSDate *prevTimeSignLanguageDetected;
  void *v52;
  double v53;
  double v54;
  float v55;
  NSArray *v56;
  NSArray *prevFrameHandKeypoint;
  double v58;
  __int128 v59;
  id obj;
  uint64_t v61;
  id v63;
  void *v64;
  void *v65;
  int v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int16 v71;
  uint64_t v72;
  CFTypeRef cf;
  CFTypeRef v74;
  uint8_t buf[4];
  _BYTE v76[10];
  double v77;
  _BYTE v78[128];
  _BYTE v79[80];
  uint64_t v80;
  _BYTE v81[352];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v74 = 0;
  v72 = 0;
  v71 = 0;
  v80 = 0;
  memset(v79, 0, sizeof(v79));
  v63 = a5;
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("faceMetadataArray"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("realtimeFaceRoll"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_inputWidth || !self->_inputHeight)
  {
    self->_inputWidth = CVPixelBufferGetWidth(a4);
    self->_inputHeight = CVPixelBufferGetHeight(a4);
  }
  if (v10 - 226 >= 0x5A)
  {
    v13 = 0;
    if (v10 >= 0x2E && v10 - 316 >= 0x2D)
    {
      if (v10 - 136 >= 0x5A)
      {
        if (v10 - 46 > 0x59)
          goto LABEL_13;
        v13 = 270;
      }
      else
      {
        v13 = 180;
      }
    }
  }
  else
  {
    v13 = 90;
  }
  self->_rotationAngle = v13;
LABEL_13:
  rotator = self->_rotator;
  if (rotator)
  {
    if (rotator->var3 == self->_rotationAngle)
      goto LABEL_17;
    ma::Rotator::~Rotator((ma::Rotator *)self->_rotator);
    MEMORY[0x1BCCA12BC]();
  }
  rotator = (Rotator *)operator new();
  ma::Rotator::Rotator((uint64_t)rotator, self->_rotationAngle);
  self->_rotator = rotator;
LABEL_17:
  v15 = ma::Rotator::Rotate((ma::Rotator *)rotator, a4, &cf);
  if (v15)
    goto LABEL_20;
  Scaler::Scale(&self->_scaler, (__CVBuffer *)cf, (__CVBuffer **)&v74, self->_inputWidth, self->_inputHeight, 1111970369);
  v15 = v16;
  if (v16)
    goto LABEL_20;
  v15 = -[VCPCNNHandsDetector handsDetection:handsRegions:cancel:](self->_handsDetector, "handsDetection:handsRegions:cancel:", v74, v65, 0);
  if (v15)
    goto LABEL_20;
  if ((int)MediaAnalysisLogLevel() > 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend(v65, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v76 = v19;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Number of hand detected %lu", buf, 0xCu);
  }
  v20 = 21;
  do
  {
    objc_msgSend(v11, "addObject:", &unk_1E6B76980);
    objc_msgSend(v12, "addObject:", &unk_1E6B76998);
    --v20;
  }
  while (v20);
  if (objc_msgSend(v65, "count"))
  {
    self->_handDetectedInPreviousFrame = 1;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v65;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v21)
    {
      v61 = *(_QWORD *)v68;
      *(_QWORD *)&v22 = 67109632;
      v59 = v22;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v68 != v61)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          v25 = (int)((double)(int)(objc_msgSend(v24, "classIndex", v59) + 1) * 0.5);
          v66 = 0;
          if (v25 >= 2)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v76 = v25;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "indexMappedFromChirality = %d, out of range [0, 1]", buf, 8u);
            }

            v17 = 0;
            v15 = -50;
            goto LABEL_21;
          }
          if (!self->_dominantHand)
          {
            begin = self->_handChiralityCounter.__begin_;
            v27 = *begin;
            v28 = begin + 1;
            if (begin[1] + *begin < 1501)
              goto LABEL_51;
            end = self->_handChiralityCounter.__end_;
            v30 = self->_handChiralityCounter.__begin_;
            if (begin != end && v28 != end)
            {
              v30 = self->_handChiralityCounter.__begin_;
              v31 = begin + 1;
              do
              {
                v33 = *v31++;
                v32 = v33;
                v34 = v27 < v33;
                if (v27 <= v33)
                  v27 = v32;
                if (v34)
                  v30 = v28;
                v28 = v31;
              }
              while (v31 != end);
            }
            v35 = (unint64_t)((char *)v30 - (char *)begin) >> 2;
            self->_dominantHand = v35;
            if (!(_DWORD)v35)
            {
LABEL_51:
              if (begin[1] + *begin > 1500)
                goto LABEL_103;
              ++begin[v25];
              if (!self->_dominantHand)
                goto LABEL_103;
            }
          }
          if (objc_msgSend(v24, "classIndex") == self->_dominantHand)
          {
LABEL_103:
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              dominantHand = self->_dominantHand;
              v37 = self->_handChiralityCounter.__begin_;
              v38 = *v37;
              LODWORD(v37) = v37[1];
              *(_DWORD *)buf = v59;
              *(_DWORD *)v76 = dominantHand;
              *(_WORD *)&v76[4] = 1024;
              *(_DWORD *)&v76[6] = v38;
              LOWORD(v77) = 1024;
              *(_DWORD *)((char *)&v77 + 2) = (_DWORD)v37;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - dominant hand: %d, hand chirality counter: left: %d, right: %d", buf, 0x14u);
            }
            v15 = -[VCPCNNHandKeypointsDetector handKeypointsDetection:box:keypoints:keypointConfidence:handHoldsObjectConfidence:](self->_handsKeypointsDetector, "handKeypointsDetection:box:keypoints:keypointConfidence:handHoldsObjectConfidence:", v74, v24, v81, v79, &v66);
            if (v15)
            {

              goto LABEL_20;
            }
            if (objc_msgSend(v24, "classIndex"))
            {
              if (!*((_BYTE *)&v71 + v25))
              {
                v39 = objc_msgSend(v24, "classIndex");
                v40 = v11;
                if (v39 == -1 || (v41 = objc_msgSend(v24, "classIndex"), v40 = v12, v41 == 1))
                  -[VCPPriorityAnalysis addKeypointsToNSArray:keypointConfidence:handBox:keypointsArray:](self, "addKeypointsToNSArray:keypointConfidence:handBox:keypointsArray:", v81, v79, v24, v40);
              }
              *((_BYTE *)&v71 + v25) = 1;
            }
          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
        if (v21)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v42 = (NSDate *)objc_claimAutoreleasedReturnValue();
    frameEndTimeStamp = self->_frameEndTimeStamp;
    self->_frameEndTimeStamp = v42;

    -[NSDate timeIntervalSinceDate:](self->_frameEndTimeStamp, "timeIntervalSinceDate:", self->_frameStartTimeStamp);
    self->_singleFrameExecutionTime = v44;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v45 = self->_singleFrameExecutionTime * 1000.0;
      *(_DWORD *)buf = 134217984;
      *(double *)v76 = v45;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - frame interval %f ms", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_frameStartTimeStamp, self->_frameEndTimeStamp);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v46 = (NSDate *)objc_claimAutoreleasedReturnValue();
    prevTimeStampHandDetected = self->_prevTimeStampHandDetected;
    self->_prevTimeStampHandDetected = v46;

  }
  else
  {
    self->_handDetectedInPreviousFrame = 0;
  }
  if ((unint64_t)-[NSMutableArray count](self->_leftHandKeypointTracker, "count") >= 6)
    -[NSMutableArray removeObjectAtIndex:](self->_leftHandKeypointTracker, "removeObjectAtIndex:", 0);
  if ((unint64_t)-[NSMutableArray count](self->_rightHandKeypointTracker, "count") >= 6)
    -[NSMutableArray removeObjectAtIndex:](self->_rightHandKeypointTracker, "removeObjectAtIndex:", 0);
  if ((-[NSMutableArray addObject:](self->_leftHandKeypointTracker, "addObject:", v11),
        -[NSMutableArray addObject:](self->_rightHandKeypointTracker, "addObject:", v12),
        -[NSMutableArray count](self->_leftHandKeypointTracker, "count") == 6)
    && (_BYTE)v71
    && (v15 = -[VCPCNNFastGestureRecognition gestureDetection:score:](self->_fastGestureDetector, "gestureDetection:score:", self->_leftHandKeypointTracker, (char *)&v72 + 4)) != 0|| -[NSMutableArray count](self->_rightHandKeypointTracker, "count") == 6&& HIBYTE(v71)&& (v15 = -[VCPCNNFastGestureRecognition gestureDetection:score:](self->_fastGestureDetector, "gestureDetection:score:", self->_rightHandKeypointTracker, &v72)) != 0)
  {
LABEL_20:
    v17 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)v76 = *((float *)&v72 + 1);
      *(_WORD *)&v76[8] = 2048;
      v77 = *(float *)&v72;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - gestureScoreRightHand %f, gestureScoreLeftHand %f", buf, 0x16u);
    }
    if (*(float *)&v72 >= *((float *)&v72 + 1))
      v48 = *(float *)&v72;
    else
      v48 = *((float *)&v72 + 1);
    v49 = 0.0;
    if (v48 > 0.99)
      v49 = 1.0;
    *a3 = v49;
    if (v48 > 0.99)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v50 = (NSDate *)objc_claimAutoreleasedReturnValue();
      prevTimeSignLanguageDetected = self->_prevTimeSignLanguageDetected;
      self->_prevTimeSignLanguageDetected = v50;

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "timeIntervalSinceDate:", self->_prevTimeSignLanguageDetected);
    v34 = v53 > 1.0;
    v54 = 0.0;
    if (!v34)
      v54 = 1.0;
    v55 = v54;
    *a3 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v64);
    v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
    prevFrameHandKeypoint = self->_prevFrameHandKeypoint;
    self->_prevFrameHandKeypoint = v56;

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v58 = *a3;
      *(_DWORD *)buf = 134218240;
      *(double *)v76 = v48;
      *(_WORD *)&v76[8] = 2048;
      v77 = v58;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - gesture score = %f, priority score after thresholding = %f", buf, 0x16u);
    }
    v15 = 0;
    v17 = v52;
  }
LABEL_21:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v74)
  {
    CFRelease(v74);
    v74 = 0;
  }

  return v15;
}

- (int)calculatePriorityScore:(float *)a3 ofPixelBuffer:(__CVBuffer *)a4 withMetadata:(id)a5
{
  id v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  float prevComputedScore;
  float v18;
  double v19;
  int v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (self->_handDetectedInPreviousFrame)
    v9 = 3;
  else
    v9 = 10;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v21 = 134217984;
    v22 = 1.0 / (double)v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Analysis subsampling ratio = %f", (uint8_t *)&v21, 0xCu);
  }
  v10 = (self->_frameCounter + 1) % v9;
  self->_frameCounter = v10;
  if (!v8 || v10)
  {
    prevComputedScore = self->_prevComputedScore;
    if (!v8)
      prevComputedScore = 0.0;
    *a3 = prevComputedScore;
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("faceMetadataArray"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("realtimeFaceYaw"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && ((int)objc_msgSend(v13, "intValue") > 315 || (int)objc_msgSend(v14, "intValue") <= 44))
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v15 = objc_msgSend(v14, "intValue");
          v21 = 67109120;
          LODWORD(v22) = v15;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Face yaw: %d", (uint8_t *)&v21, 8u);
        }
        v16 = -[VCPPriorityAnalysis fastSignLanguageDetection:ofPixelBuffer:withMetadata:](self, "fastSignLanguageDetection:ofPixelBuffer:withMetadata:", a3, a4, v8);
        if (v16)
        {

          goto LABEL_29;
        }
      }
      else
      {
        *a3 = 0.0;
      }

      v18 = *a3;
    }
    else
    {
      *a3 = 0.0;
      v18 = 0.0;
    }
    self->_prevComputedScore = v18;

  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v19 = *a3;
    v21 = 134217984;
    v22 = v19;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - output priority score = %f", (uint8_t *)&v21, 0xCu);
  }
  v16 = 0;
LABEL_29:

  return v16;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;
  int *begin;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_rightHandKeypointTracker, 0);
  objc_storeStrong((id *)&self->_leftHandKeypointTracker, 0);
  objc_storeStrong((id *)&self->_handKeypointTracker, 0);
  objc_storeStrong((id *)&self->_classIndexTracker, 0);
  objc_storeStrong((id *)&self->_frameStartTimeStamp, 0);
  objc_storeStrong((id *)&self->_frameEndTimeStamp, 0);
  objc_storeStrong((id *)&self->_prevTimeSignLanguageDetected, 0);
  objc_storeStrong((id *)&self->_prevTimeStampHandDetected, 0);
  objc_storeStrong((id *)&self->_prevFrameHandKeypoint, 0);
  objc_storeStrong((id *)&self->_fastGestureDetector, 0);
  objc_storeStrong((id *)&self->_handsKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_handsDetector, 0);
  begin = self->_handChiralityCounter.__begin_;
  if (begin)
  {
    self->_handChiralityCounter.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_DWORD *)self + 48) = 0;
  return self;
}

@end
