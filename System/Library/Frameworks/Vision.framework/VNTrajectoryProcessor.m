@implementation VNTrajectoryProcessor

- (VNTrajectoryProcessor)initWithFrameAnalysisSpacing:(id *)a3 trajectoryLength:(int64_t)a4
{
  char *v6;
  char *v7;
  __int128 v8;
  __int128 *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  VNDetectContoursRequest *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  VNParabolaDetection *v35;
  id v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  float v41;
  void *v42;
  BOOL v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  int maxFramesSkippedToContinueParabolaDetection;
  VNParabolaDetection *v63;
  void *v64;
  char *v65;
  CMTime time2;
  CMTime time1;
  objc_super v69;
  const __CFString *v70;
  void *v71;
  _QWORD v72[2];
  _QWORD v73[3];

  v73[2] = *MEMORY[0x1E0C80C00];
  v69.receiver = self;
  v69.super_class = (Class)VNTrajectoryProcessor;
  v6 = -[VNTrajectoryProcessor init](&v69, sel_init);
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 20) = 1065353216;
    *((_QWORD *)v6 + 9) = 1280;
    v8 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v6 + 13) = a3->var3;
    *(_OWORD *)(v6 + 88) = v8;
    time1 = (CMTime)*a3;
    v9 = (__int128 *)MEMORY[0x1E0CA2E68];
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    v6[160] = CMTimeCompare(&time1, &time2) == 0;
    v10 = *v9;
    *((_OWORD *)v7 + 7) = *v9;
    v11 = *((_QWORD *)v9 + 2);
    *((_QWORD *)v7 + 16) = v11;
    *(_OWORD *)(v7 + 136) = v10;
    *((_QWORD *)v7 + 19) = v11;
    *((_DWORD *)v7 + 21) = 1082130432;
    v12 = (void *)MEMORY[0x1E0C9DD90];
    v72[0] = *MEMORY[0x1E0C9DFC0];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = *MEMORY[0x1E0C9DF58];
    v73[0] = v13;
    v73[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contextWithOptions:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v15;

    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorAbsoluteDifference"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v17;

    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:keysAndValues:", CFSTR("CIColorThreshold"), CFSTR("inputThreshold"), &unk_1E459E6C8, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = v19;

    v21 = (void *)MEMORY[0x1E0C9DDB8];
    LODWORD(v22) = *((_DWORD *)v7 + 21);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = *((_DWORD *)v7 + 21);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filterWithName:keysAndValues:", CFSTR("CIMorphologyRectangleMaximum"), CFSTR("inputWidth"), v23, CFSTR("inputHeight"), v25, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v7 + 4);
    *((_QWORD *)v7 + 4) = v26;

    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:keysAndValues:", CFSTR("CIColorControls"), *MEMORY[0x1E0C9E1D0], &unk_1E459E6D8, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v7 + 5);
    *((_QWORD *)v7 + 5) = v28;

    v30 = objc_alloc_init(VNDetectContoursRequest);
    v31 = (void *)*((_QWORD *)v7 + 6);
    *((_QWORD *)v7 + 6) = v30;

    *((_QWORD *)v7 + 21) = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    objc_msgSend(*((id *)v7 + 6), "setDetectsDarkOnLight:", 0);
    LODWORD(v32) = 1.0;
    objc_msgSend(*((id *)v7 + 6), "setContrastAdjustment:", v32);
    objc_msgSend(*((id *)v7 + 6), "setForceUseInputCVPixelBufferDirectly:", 1);
    objc_msgSend(*((id *)v7 + 6), "setInHierarchy:", 0);
    v70 = CFSTR("parabolaLength");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = [VNParabolaDetection alloc];
    v36 = v34;
    v37 = v36;
    if (!v35)
    {
LABEL_27:

      v64 = (void *)*((_QWORD *)v7 + 22);
      *((_QWORD *)v7 + 22) = v35;

      v65 = v7;
      goto LABEL_28;
    }
    objc_msgSend(v36, "objectForKey:", CFSTR("FAFrameRate"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38 == 0;

    if (v39)
    {
      v35->_forestAlgoParams.FAFrameRate = 60.0;
    }
    else
    {
      objc_msgSend(v37, "objectForKey:", CFSTR("FAFrameRate"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      v35->_forestAlgoParams.FAFrameRate = v41;

    }
    objc_msgSend(v37, "objectForKey:", CFSTR("parabolaLength"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42 == 0;

    if (v43)
    {
      v46 = (int)(float)((float)(v35->_forestAlgoParams.FAFrameRate * 5.0) / 30.0);
    }
    else
    {
      objc_msgSend(v37, "objectForKey:", CFSTR("parabolaLength"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "intValue");

      if (v45 > 4)
      {
        if (v45 < 0x65)
        {
          v35->_forestAlgoParams.parabolaLength = v45;
          goto LABEL_13;
        }
        v46 = 100;
      }
      else
      {
        v46 = 5;
      }
    }
    v35->_forestAlgoParams.parabolaLength = v46;
LABEL_13:
    objc_msgSend(v37, "objectForKey:", CFSTR("minXDistanceFromLastPointOnParabola"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47 == 0;

    if (!v48)
    {
      objc_msgSend(v37, "objectForKey:", CFSTR("minXDistanceFromLastPointOnParabola"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v35->_forestAlgoParams.minXDistanceFromLastPointOnParabola = objc_msgSend(v49, "intValue");

    }
    objc_msgSend(v37, "objectForKey:", CFSTR("maxXDistanceFromLastPointOnParabola"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50 == 0;

    if (v51)
    {
      v35->_forestAlgoParams.maxXDistanceFromLastPointOnParabola = (int)v35->internalParams.maxDistanceForSolution;
    }
    else
    {
      objc_msgSend(v37, "objectForKey:", CFSTR("maxXDistanceFromLastPointOnParabola"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v35->_forestAlgoParams.maxXDistanceFromLastPointOnParabola = objc_msgSend(v52, "intValue");

    }
    objc_msgSend(v37, "objectForKey:", CFSTR("minYDistanceFromLastPointOnParabola"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53 == 0;

    if (!v54)
    {
      objc_msgSend(v37, "objectForKey:", CFSTR("minYDistanceFromLastPointOnParabola"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v35->_forestAlgoParams.minYDistanceFromLastPointOnParabola = objc_msgSend(v55, "intValue");

    }
    objc_msgSend(v37, "objectForKey:", CFSTR("maxYDistanceFromLastPointOnParabola"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56 == 0;

    if (v57)
    {
      v35->_forestAlgoParams.maxYDistanceFromLastPointOnParabola = (int)v35->internalParams.maxDistanceForSolution;
    }
    else
    {
      objc_msgSend(v37, "objectForKey:", CFSTR("maxYDistanceFromLastPointOnParabola"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v35->_forestAlgoParams.maxYDistanceFromLastPointOnParabola = objc_msgSend(v58, "intValue");

    }
    objc_msgSend(v37, "objectForKey:", CFSTR("maxFramesSkippedToContinueParabolaDetection"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59 == 0;

    if (v60)
    {
      maxFramesSkippedToContinueParabolaDetection = (int)(float)((float)(v35->_forestAlgoParams.FAFrameRate * 7.0) / 30.0);
      v35->_forestAlgoParams.maxFramesSkippedToContinueParabolaDetection = maxFramesSkippedToContinueParabolaDetection;
    }
    else
    {
      objc_msgSend(v37, "objectForKey:", CFSTR("maxFramesSkippedToContinueParabolaDetection"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v35->_forestAlgoParams.maxFramesSkippedToContinueParabolaDetection = objc_msgSend(v61, "intValue");

      maxFramesSkippedToContinueParabolaDetection = v35->_forestAlgoParams.maxFramesSkippedToContinueParabolaDetection;
    }
    v35->parabolaSearchBuffer.maxFramesSkippedForDetection = maxFramesSkippedToContinueParabolaDetection;
    *(_QWORD *)&v35->parabolaSearchBuffer.minRegionSizeX = *(_QWORD *)&v35->internalParams.minRegionSizeX;
    v35->UID_counter = 0;
    std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::destroy((_QWORD *)v35->internalParabolas.__tree_.__pair1_.__value_.__left_);
    v35->internalParabolas.__tree_.__begin_node_ = &v35->internalParabolas.__tree_.__pair1_;
    v35->internalParabolas.__tree_.__pair3_.__value_ = 0;
    v35->internalParabolas.__tree_.__pair1_.__value_.__left_ = 0;
    std::__tree<std::__value_type<int,ObservedParabola>,std::__map_value_compare<int,std::__value_type<int,ObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,ObservedParabola>>>::destroy((_QWORD *)v35->_observedParabolas.__tree_.__pair1_.__value_.__left_);
    v35->_observedParabolas.__tree_.__begin_node_ = &v35->_observedParabolas.__tree_.__pair1_;
    v35->_observedParabolas.__tree_.__pair3_.__value_ = 0;
    v35->_observedParabolas.__tree_.__pair1_.__value_.__left_ = 0;
    v63 = v35;
    goto LABEL_27;
  }
LABEL_28:

  return (VNTrajectoryProcessor *)v7;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_sRGB);
  v3.receiver = self;
  v3.super_class = (Class)VNTrajectoryProcessor;
  -[VNTrajectoryProcessor dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)_createCroppedAndScaledBufferFromVNImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 withOptions:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  float v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __CVBuffer *v25;
  CGRect v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = objc_msgSend(v13, "width");
  v16 = objc_msgSend(v13, "height");
  v27.origin.x = x * (double)v15;
  v27.size.width = width * (double)v15;
  v27.origin.y = y * (double)v16;
  v27.size.height = height * (double)v16;
  v28 = CGRectIntegral(v27);
  if (v28.size.width >= v28.size.height)
    v17 = v28.size.width;
  else
    v17 = v28.size.height;
  v18 = 1280.0;
  if (v17 <= 1280.0)
    v18 = v17;
  self->_maximumImageDimension = (unint64_t)v18;
  v19 = v17;
  self->_preScaleFactor = (float)(unint64_t)v18 / v19;
  v20 = (double)(unint64_t)v18;
  v21 = vcvtad_u64_f64(v28.size.height / (v28.size.width / v20));
  v22 = vcvtad_u64_f64(v28.size.width / (v28.size.height / v20));
  if (v28.size.width < v28.size.height)
    v23 = (unint64_t)v18;
  else
    v23 = v21;
  if (v28.size.width < v28.size.height)
    v24 = v22;
  else
    v24 = (unint64_t)v18;
  v25 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", v24, v23, 875704422, v14, a6, v28.origin.x, v28.origin.y);

  return v25;
}

- (id)_VNPointsFromCGPoints:(const void *)a3
{
  void *v4;
  uint64_t i;
  double v6;
  double v7;
  VNPoint *v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  for (i = *(_QWORD *)a3; i != *((_QWORD *)a3 + 1); i += 16)
  {
    VisionCoreNormalizedPointForImagePoint();
    v8 = -[VNPoint initWithLocation:]([VNPoint alloc], "initWithLocation:", v6, v7);
    if (v8)
      objc_msgSend(v4, "addObject:", v8);

  }
  return v4;
}

- (id)processVNImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 withOptions:(id)a5 warningRecorder:(id)a6 requestUUID:(id)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  void *previousFrameImage;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double HostTimeInMillis;
  __CVBuffer *v26;
  __CVBuffer *v27;
  void *v28;
  void *v29;
  CIFilter *absoluteDiffFilter;
  void *v31;
  CIFilter *v32;
  void *v33;
  CIFilter *thresholdFilter;
  void *v35;
  void *v36;
  double v37;
  float v38;
  CIFilter *dilateFilter;
  void *v40;
  CIFilter *v41;
  double v42;
  void *v43;
  void *v44;
  double currentImageWidth;
  double v46;
  double currentImageHeight;
  double v48;
  size_t v49;
  size_t v50;
  void *v51;
  VNImageBuffer *previousFrameBuffer;
  __CVBuffer *v53;
  void *v54;
  void *v55;
  CIImage *v56;
  CIImage *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  VNImageRequestHandler *v61;
  CMTimeEpoch v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  float v67;
  unint64_t maximumImageDimension;
  id v69;
  uint64_t v70;
  id v71;
  BOOL v72;
  id *v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t i;
  void *v78;
  void *v79;
  float v80;
  double v81;
  double v82;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  float v89;
  char *v90;
  unint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  __int128 v96;
  void *v97;
  _BOOL4 v98;
  VNParabolaDetection *parabolaDetector;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD *v102;
  _QWORD *v103;
  VNTrajectoryObservation *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  _QWORD *v109;
  _QWORD *v110;
  BOOL v111;
  double v112;
  void *v113;
  BOOL v114;
  double v115;
  unint64_t v116;
  double v117;
  id v119;
  unint64_t v120;
  void *v121;
  void *v122;
  VNImageRequestHandler *v123;
  void *v124;
  void *v125;
  id *location;
  uint64_t v127;
  void *v128;
  id obj;
  unint64_t v130;
  uint64_t v131;
  void *v132;
  id v133;
  id v134;
  void *v135;
  CMTime v136;
  CMTime v137;
  CMTimeRange v138;
  CMTime end;
  CMTime start;
  CMTimeRange v141;
  __int128 v142;
  uint64_t v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  void *__p;
  char *v149;
  char *v150;
  CMTime v151;
  id v152;
  float v153;
  float v154;
  CMTime rhs;
  CMTime lhs;
  CGAffineTransform v157;
  CGAffineTransform v158;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v160[5];
  CMTime time2;
  CMTime time1;
  __int128 v163;
  _OWORD v164[2];
  __int128 v165;
  __n128 v166;
  float v167;
  CMTime v168;
  CMTime v169;
  _BYTE v170[128];
  VNDetectContoursRequest *detectContoursRequest;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  _QWORD v175[4];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v175[1] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a5;
  v133 = a6;
  v134 = a7;
  v135 = v19;
  if (self->_processAllFrames)
    goto LABEL_6;
  if (v18)
  {
    objc_msgSend(v18, "timingInfo");
  }
  else
  {
    v166.n128_u64[0] = 0;
    v165 = 0u;
    v163 = 0u;
    memset(v164, 0, sizeof(v164));
  }
  time1 = *(CMTime *)((char *)v164 + 8);
  time2 = (CMTime)self->_nextFrameToBeAnalyzedPTS;
  if (CMTimeCompare(&time1, &time2) == -1)
  {
    previousFrameBuffer = self->_previousFrameBuffer;
    self->_previousFrameBuffer = 0;

    previousFrameImage = self->_previousFrameImage;
    self->_previousFrameImage = 0;
    v51 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
LABEL_6:
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v19, a8);
    previousFrameImage = (void *)objc_claimAutoreleasedReturnValue();
    if (previousFrameImage)
    {
      v21 = objc_msgSend(v18, "width");
      v22 = objc_msgSend(v18, "height");
      v160[0] = MEMORY[0x1E0C809B0];
      v160[1] = 3221225472;
      v160[2] = __109__VNTrajectoryProcessor_processVNImageBuffer_regionOfInterest_withOptions_warningRecorder_requestUUID_error___block_invoke;
      v160[3] = &unk_1E4548D28;
      v160[4] = self;
      if (+[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", v21, v22, v160, a8))
      {
        +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNTrajectoryProcessorOption_RequestState"), v19, a8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          v132 = v23;
          v130 = objc_msgSend(v23, "targetImageDimensionForContourDetection");
          if (self->_previousFrameBuffer)
          {
            HostTimeInMillis = getHostTimeInMillis();
            v26 = -[VNTrajectoryProcessor _createCroppedAndScaledBufferFromVNImageBuffer:regionOfInterest:withOptions:error:](self, "_createCroppedAndScaledBufferFromVNImageBuffer:regionOfInterest:withOptions:error:", v18, v135, a8, x, y, width, height);
            v27 = v26;
            if (v26)
            {
              self->_currentImageWidth = CVPixelBufferGetWidth(v26);
              self->_currentImageHeight = CVPixelBufferGetHeight(v27);
              v28 = (void *)MEMORY[0x1E0C9DDC8];
              v172 = *MEMORY[0x1E0C9E0A8];
              v173 = MEMORY[0x1E0C9AAB0];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "imageWithCVImageBuffer:options:", v27, v29);
              obj = (id)objc_claimAutoreleasedReturnValue();

              CVPixelBufferRelease(v27);
              absoluteDiffFilter = self->_absoluteDiffFilter;
              -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](self->_previousFrameImage, "imageByColorMatchingColorSpaceToWorkingSpace:", self->_sRGB);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[CIFilter setValue:forKey:](absoluteDiffFilter, "setValue:forKey:", v31, CFSTR("inputImage"));

              v32 = self->_absoluteDiffFilter;
              objc_msgSend(obj, "imageByColorMatchingColorSpaceToWorkingSpace:", self->_sRGB);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[CIFilter setValue:forKey:](v32, "setValue:forKey:", v33, CFSTR("inputImage2"));

              thresholdFilter = self->_thresholdFilter;
              -[CIFilter outputImage](self->_absoluteDiffFilter, "outputImage");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMaximumComponent"), MEMORY[0x1E0C9AA70]);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[CIFilter setValue:forKey:](thresholdFilter, "setValue:forKey:", v36, CFSTR("inputImage"));

              -[CIFilter outputImage](self->_thresholdFilter, "outputImage");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (double)v130;
              v38 = (double)self->_maximumImageDimension / (double)v130;
              self->_dilateRadius = v38;
              dilateFilter = self->_dilateFilter;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[CIFilter setValue:forKey:](dilateFilter, "setValue:forKey:", v40, CFSTR("inputWidth"));

              v41 = self->_dilateFilter;
              *(float *)&v42 = self->_dilateRadius;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[CIFilter setValue:forKey:](v41, "setValue:forKey:", v43, CFSTR("inputHeight"));

              -[CIFilter setValue:forKey:](self->_dilateFilter, "setValue:forKey:", v128, CFSTR("inputImage"));
              -[CIFilter outputImage](self->_dilateFilter, "outputImage");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[CIFilter setValue:forKey:](self->_contrastFilter, "setValue:forKey:", v44, CFSTR("inputImage"));
              pixelBufferOut = 0;
              currentImageWidth = (double)self->_currentImageWidth;
              v46 = (double)v130 / currentImageWidth;
              currentImageHeight = (double)self->_currentImageHeight;
              if (v37 / currentImageWidth >= v37 / currentImageHeight)
                v46 = v37 / currentImageHeight;
              v48 = fmin(v46, 1.0);
              v49 = (unint64_t)(v48 * currentImageWidth);
              v50 = (unint64_t)(v48 * currentImageHeight);
              if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v49, v50, 0x4C303038u, 0, &pixelBufferOut))
              {
                if (a8)
                {
                  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, CFSTR("Could not create intermediate buffer"));
                  v51 = 0;
                  *a8 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v51 = 0;
                }
                goto LABEL_101;
              }
              memset(&v158, 0, sizeof(v158));
              CGAffineTransformMakeScale(&v158, v48, v48);
              v124 = v44;
              -[CIFilter outputImage](self->_contrastFilter, "outputImage");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v157 = v158;
              objc_msgSend(v58, "imageByApplyingTransform:highQualityDownsample:", &v157, 0);
              v125 = (void *)objc_claimAutoreleasedReturnValue();

              -[CIContext render:toCVPixelBuffer:bounds:colorSpace:](self->_ciContext, "render:toCVPixelBuffer:bounds:colorSpace:", v125, pixelBufferOut, 0, 0.0, 0.0, (double)v49, (double)v50);
              +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v135, a8);
              v59 = objc_claimAutoreleasedReturnValue();
              v60 = (void *)v59;
              if (!v59)
              {
                v51 = 0;
LABEL_100:

                v44 = v124;
LABEL_101:

                v24 = v132;
                goto LABEL_102;
              }
              v122 = (void *)v59;
              v61 = [VNImageRequestHandler alloc];
              v123 = -[VNImageRequestHandler initWithCVPixelBuffer:options:session:](v61, "initWithCVPixelBuffer:options:session:", pixelBufferOut, v135, v60);
              CVPixelBufferRelease(pixelBufferOut);
              objc_storeStrong((id *)&self->_previousFrameBuffer, a3);
              objc_storeStrong((id *)&self->_previousFrameImage, obj);
              if (!self->_processAllFrames)
              {
                if (v18)
                {
                  objc_msgSend(v18, "timingInfo");
                }
                else
                {
                  v166.n128_u64[0] = 0;
                  v165 = 0u;
                  v163 = 0u;
                  memset(v164, 0, sizeof(v164));
                }
                *(_OWORD *)&self->_lastAnalyzedFramePTS.value = *(_OWORD *)((char *)v164 + 8);
                v62 = *((_QWORD *)&v164[1] + 1);
                self->_lastAnalyzedFramePTS.epoch = *((_QWORD *)&v164[1] + 1);
                *(_OWORD *)&lhs.value = *(_OWORD *)&self->_lastAnalyzedFramePTS.value;
                lhs.epoch = v62;
                rhs = (CMTime)self->_frameAnalysisSpacing;
                CMTimeAdd((CMTime *)&v163, &lhs, &rhs);
                *(_OWORD *)&self->_nextFrameToBeAnalyzedPTS.value = v163;
                self->_nextFrameToBeAnalyzedPTS.epoch = *(_QWORD *)&v164[0];
              }
              -[VNDetectContoursRequest setMaximumImageDimension:](self->_detectContoursRequest, "setMaximumImageDimension:", (unint64_t)v37);
              detectContoursRequest = self->_detectContoursRequest;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &detectContoursRequest, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = -[VNImageRequestHandler performRequests:error:](v123, "performRequests:error:", v63, a8);

              if (!v64)
              {
                v51 = 0;
LABEL_99:

                v60 = v122;
                goto LABEL_100;
              }
              -[VNRequest results](self->_detectContoursRequest, "results");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "firstObject");
              v121 = (void *)objc_claimAutoreleasedReturnValue();

              v66 = v121;
              if (v121)
              {
                v154 = 0.0;
                if (+[VNValidationUtilities getFloatValue:forKey:inOptions:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:error:", &v154, CFSTR("VNTrajectoryProcessorOption_ObjectMinimumNormalizedRadius"), v135, a8))
                {
                  v67 = v154;
                  maximumImageDimension = self->_maximumImageDimension;
                  v153 = 1.0;
                  if (+[VNValidationUtilities getFloatValue:forKey:inOptions:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:error:", &v153, CFSTR("VNTrajectoryProcessorOption_ObjectMaximumNormalizedRadius"), v135, a8))
                  {
                    if (v153 >= v154)
                    {
                      v152 = 0;
                      v72 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v152, objc_opt_class(), CFSTR("VNTrajectoryProcessorOption_ProcessingTargetFrameTime"), v135, a8);
                      v71 = v152;
                      if (v72)
                      {
                        v119 = v71;
                        objc_msgSend(v71, "getValue:size:", &v151, 24);
                        __p = 0;
                        v149 = 0;
                        v150 = 0;
                        v144 = 0u;
                        v145 = 0u;
                        v146 = 0u;
                        v147 = 0u;
                        objc_msgSend(v121, "topLevelContours");
                        v73 = (id *)objc_claimAutoreleasedReturnValue();
                        location = v73;
                        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v144, v170, 16);
                        v120 = maximumImageDimension;
                        if (v74)
                        {
                          v75 = 0;
                          v76 = 0;
                          v127 = *(_QWORD *)v145;
                          do
                          {
                            v131 = v74;
                            for (i = 0; i != v131; ++i)
                            {
                              if (*(_QWORD *)v145 != v127)
                                objc_enumerationMutation(v73);
                              +[VNGeometryUtils boundingCircleForContour:error:](VNGeometryUtils, "boundingCircleForContour:error:", *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * i), a8);
                              v78 = (void *)objc_claimAutoreleasedReturnValue();
                              v79 = v78;
                              if (v78)
                              {
                                objc_msgSend(v78, "radius");
                                v80 = v81;
                                *(float *)&v81 = v154;
                                *(float *)&v82 = v153;
                                if (v154 <= v80 && v153 >= v80)
                                {
                                  objc_msgSend(v79, "center", v81, v82);
                                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v84, "location");
                                  VisionCoreImagePointForNormalizedPoint();
                                  v86 = v85;
                                  v88 = v87;

                                  v89 = v80 * (float)self->_maximumImageDimension;
                                  if (v76 >= v150)
                                  {
                                    v91 = 0xAAAAAAAAAAAAAAABLL * ((v76 - v75) >> 3) + 1;
                                    if (v91 > 0xAAAAAAAAAAAAAAALL)
                                      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                    if (0x5555555555555556 * ((v150 - v75) >> 3) > v91)
                                      v91 = 0x5555555555555556 * ((v150 - v75) >> 3);
                                    if (0xAAAAAAAAAAAAAAABLL * ((v150 - v75) >> 3) >= 0x555555555555555)
                                      v92 = 0xAAAAAAAAAAAAAAALL;
                                    else
                                      v92 = v91;
                                    if (v92)
                                    {
                                      if (v92 > 0xAAAAAAAAAAAAAAALL)
                                        std::__throw_bad_array_new_length[abi:ne180100]();
                                      v93 = (char *)operator new(24 * v92);
                                    }
                                    else
                                    {
                                      v93 = 0;
                                    }
                                    v94 = &v93[8 * ((v76 - v75) >> 3)];
                                    *(_QWORD *)v94 = v86;
                                    *((_QWORD *)v94 + 1) = v88;
                                    *((float *)v94 + 4) = v89;
                                    v95 = (char *)__p;
                                    v75 = v94;
                                    if (v76 != __p)
                                    {
                                      do
                                      {
                                        v96 = *(_OWORD *)(v76 - 24);
                                        *((_DWORD *)v75 - 2) = *((_DWORD *)v76 - 2);
                                        *(_OWORD *)(v75 - 24) = v96;
                                        v75 -= 24;
                                        v76 -= 24;
                                      }
                                      while (v76 != v95);
                                      v76 = (char *)__p;
                                    }
                                    v90 = v94 + 24;
                                    __p = v75;
                                    v149 = v94 + 24;
                                    v150 = &v93[24 * v92];
                                    if (v76)
                                      operator delete(v76);
                                  }
                                  else
                                  {
                                    *(_QWORD *)v76 = v86;
                                    *((_QWORD *)v76 + 1) = v88;
                                    v90 = v76 + 24;
                                    *((float *)v76 + 4) = v89;
                                  }
                                  v149 = v90;
                                  v76 = v90;
                                  v73 = location;
                                }
                              }

                            }
                            v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v144, v170, 16);
                          }
                          while (v74);
                        }

                        objc_msgSend(v121, "topLevelContours");
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        v98 = (unint64_t)objc_msgSend(v97, "count") > 0xF9;

                        if (v98)
                        {
                          if (a8)
                          {
                            +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, CFSTR("Too many moving objects or noise detected which prevents trajectory processing."));
                            v51 = 0;
                            *a8 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            v51 = 0;
                          }
                        }
                        else
                        {
                          parabolaDetector = self->_parabolaDetector;
                          if (v18)
                          {
                            objc_msgSend(v18, "timingInfo");
                          }
                          else
                          {
                            v166.n128_u64[0] = 0;
                            v165 = 0u;
                            v163 = 0u;
                            memset(v164, 0, sizeof(v164));
                          }
                          v142 = *(_OWORD *)((char *)v164 + 8);
                          v143 = *((_QWORD *)&v164[1] + 1);
                          v100 = (_QWORD *)-[VNParabolaDetection processContoursForParabolas:withPTS:objectMinimumPixelSize:bufferWidth:bufferHeight:]((uint64_t)parabolaDetector, (uint64_t *)&__p, (uint64_t)&v142, vcvtps_u32_f32(v67 * (float)v120), self->_currentImageWidth, self->_currentImageHeight, *(int32x4_t *)((char *)v164 + 8));
                          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v100[2]);
                          v103 = (_QWORD *)*v100;
                          v101 = v100 + 1;
                          v102 = v103;
                          if (v103 != v101)
                          {
                            do
                            {
                              ObservedParabola::ObservedParabola((ObservedParabola *)&v163, (const ObservedParabola *)(v102 + 6));
                              v104 = [VNTrajectoryObservation alloc];
                              v105 = (void *)v163;
                              -[VNTrajectoryProcessor _VNPointsFromCGPoints:](self, "_VNPointsFromCGPoints:", &v164[1]);
                              v106 = (void *)objc_claimAutoreleasedReturnValue();
                              -[VNTrajectoryProcessor _VNPointsFromCGPoints:](self, "_VNPointsFromCGPoints:", (char *)&v163 + 8);
                              v107 = (void *)objc_claimAutoreleasedReturnValue();
                              v108 = -[VNTrajectoryObservation initWithOriginatingRequestSpecifier:requestUUID:trajectoryUUID:detectedPoints:projectedPoints:movingAverageRadius:equationCoefficients:confidence:](v104, previousFrameImage, v134, v105, v106, v107, *((double *)&v165 + 1) / (double)self->_maximumImageDimension, v166, v167);

                              start = v168;
                              end = v169;
                              CMTimeRangeFromTimeToTime(&v141, &start, &end);
                              v138 = v141;
                              objc_msgSend(v108, "setTimeRange:", &v138);
                              objc_msgSend(v51, "addObject:", v108);

                              ObservedParabola::~ObservedParabola((ObservedParabola *)&v163);
                              v109 = (_QWORD *)v102[1];
                              if (v109)
                              {
                                do
                                {
                                  v110 = v109;
                                  v109 = (_QWORD *)*v109;
                                }
                                while (v109);
                              }
                              else
                              {
                                do
                                {
                                  v110 = (_QWORD *)v102[2];
                                  v111 = *v110 == (_QWORD)v102;
                                  v102 = v110;
                                }
                                while (!v111);
                              }
                              v102 = v110;
                            }
                            while (v110 != v101);
                          }
                          v112 = getHostTimeInMillis();
                          v163 = 0uLL;
                          *(_QWORD *)&v164[0] = 0;
                          CMTimeMakeWithSeconds((CMTime *)&v163, v112 - HostTimeInMillis, 1000);
                          *(_OWORD *)&v137.value = v163;
                          v137.epoch = *(_QWORD *)&v164[0];
                          v136 = v151;
                          if (CMTimeCompare(&v137, &v136) != 1
                            || (objc_msgSend(v121, "topLevelContours"),
                                v113 = (void *)objc_claimAutoreleasedReturnValue(),
                                v114 = objc_msgSend(v113, "count") == 0,
                                v113,
                                v114))
                          {
                            v117 = (320.0 - v37) * 0.5 + v37;
                            if ((((unint64_t)v117 + 1) & 0xFFFFFFFFFFFFFFFELL) >= 0x140)
                              v116 = 320;
                            else
                              v116 = ((unint64_t)v117 + 1) & 0xFFFFFFFFFFFFFFFELL;
                          }
                          else
                          {
                            v115 = v37 + (v37 + -160.0) * -0.5;
                            if ((((unint64_t)v115 - 1) & 0xFFFFFFFFFFFFFFFELL) <= 0xA0)
                              v116 = 160;
                            else
                              v116 = ((unint64_t)v115 - 1) & 0xFFFFFFFFFFFFFFFELL;
                          }
                          objc_msgSend(v132, "setTargetImageDimensionForContourDetection:", v116);
                        }
                        if (__p)
                          operator delete(__p);
                        v71 = v119;
                      }
                      else
                      {
                        v51 = 0;
                      }
                      goto LABEL_97;
                    }
                    if (a8)
                    {
                      v69 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v70 = objc_msgSend(v69, "initWithFormat:", CFSTR("cannot perform analysis with minimum object radius of %f and maximum object radius of %f"), v154, v153);
                      +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:");
                      v51 = 0;
                      *a8 = (id)objc_claimAutoreleasedReturnValue();
                      v71 = (id)v70;
LABEL_97:

                      v66 = v121;
                      goto LABEL_98;
                    }
                  }
                }
                v51 = 0;
              }
              else
              {
                v51 = (void *)MEMORY[0x1E0C9AA60];
              }
LABEL_98:

              goto LABEL_99;
            }
          }
          else
          {
            objc_storeStrong((id *)&self->_previousFrameBuffer, a3);
            v24 = v132;
            v53 = -[VNTrajectoryProcessor _createCroppedAndScaledBufferFromVNImageBuffer:regionOfInterest:withOptions:error:](self, "_createCroppedAndScaledBufferFromVNImageBuffer:regionOfInterest:withOptions:error:", self->_previousFrameBuffer, v135, a8, x, y, width, height);
            if (v53)
            {
              v54 = (void *)MEMORY[0x1E0C9DDC8];
              v174 = *MEMORY[0x1E0C9E0A8];
              v175[0] = MEMORY[0x1E0C9AAB0];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, &v174, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "imageWithCVImageBuffer:options:", v53, v55);
              v56 = (CIImage *)objc_claimAutoreleasedReturnValue();
              v57 = self->_previousFrameImage;
              self->_previousFrameImage = v56;

              v24 = v132;
              CVPixelBufferRelease(v53);
              v51 = (void *)MEMORY[0x1E0C9AA60];
LABEL_102:

              goto LABEL_103;
            }
          }
        }
        v51 = 0;
        goto LABEL_102;
      }
    }
    v51 = 0;
  }
LABEL_103:

  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parabolaDetector, 0);
  objc_storeStrong((id *)&self->_previousFrameImage, 0);
  objc_storeStrong((id *)&self->_previousFrameBuffer, 0);
  objc_storeStrong((id *)&self->_detectContoursRequest, 0);
  objc_storeStrong((id *)&self->_contrastFilter, 0);
  objc_storeStrong((id *)&self->_dilateFilter, 0);
  objc_storeStrong((id *)&self->_thresholdFilter, 0);
  objc_storeStrong((id *)&self->_absoluteDiffFilter, 0);
  objc_storeStrong((id *)&self->_ciContext, 0);
}

NSString *__109__VNTrajectoryProcessor_processVNImageBuffer_regionOfInterest_withOptions_warningRecorder_requestUUID_error___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
