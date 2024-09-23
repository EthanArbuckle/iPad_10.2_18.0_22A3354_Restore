@implementation VNRectangleDetector

- (void)dealloc
{
  float *perMeshPtr;
  objc_super v4;

  perMeshPtr = self->_perMeshPtr;
  if (perMeshPtr)
  {
    free(perMeshPtr);
    self->_perMeshPtr = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNRectangleDetector;
  -[VNDetector dealloc](&v4, sel_dealloc);
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  BOOL v33;
  __CVBuffer *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float v43;
  id v44;
  int v45;
  CGRect v46;
  CGRect v47;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    goto LABEL_11;
  v21 = objc_msgSend(v19, "height");
  v22 = objc_msgSend(v20, "width");
  v23 = (double)(unint64_t)(double)v22;
  v46.origin.x = x * v23;
  v46.size.width = width * v23;
  v24 = (double)(unint64_t)(double)v21;
  v46.origin.y = y * v24;
  v46.size.height = height * v24;
  v47 = CGRectIntegral(v46);
  v25 = v47.origin.x;
  v26 = v47.origin.y;
  v27 = v47.size.width;
  v28 = v47.size.height;
  v45 = 0;
  if (+[VNValidationUtilities getIntValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getIntValue:forKey:inOptions:minimumValue:maximumValue:error:", &v45, CFSTR("VNRectangleDetectorProcessOption_Version"), v17, 1, 2, a8))
  {
    if (v45 == 2)
    {
      if (v22 < 5 || v21 <= 4)
      {
        VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, 5);
        v33 = 1;
        goto LABEL_17;
      }
      v29 = 256.0;
      if (v27 <= v28)
      {
        if (v27 <= 256.0)
          v29 = v27;
        v31 = v27 / v29;
        v43 = v28 / (v27 / v29);
        v30 = roundf(v43);
      }
      else
      {
        if (v28 <= 256.0)
          v30 = v28;
        else
          v30 = 256.0;
        v31 = v28 / v30;
        v32 = v27 / (v28 / v30);
        v29 = roundf(v32);
      }
    }
    else
    {
      v31 = v28 * 0.00390625;
      v29 = 256.0;
      v30 = 256.0;
    }
    v44 = 0;
    v34 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)v29, (unint64_t)v30, 1111970369, v17, a8, &v44, v25, v26, v27, v28);
    v35 = v44;
    *a7 = v34;
    v33 = v34 != 0;
    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("VNRectangleDetectorProcessOption_CropRect_X"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v37, CFSTR("VNRectangleDetectorProcessOption_CropRect_Y"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v38, CFSTR("VNRectangleDetectorProcessOption_CropRect_Width"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v39, CFSTR("VNRectangleDetectorProcessOption_CropRect_Hight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v40, CFSTR("VNRectangleDetectorProcessOption_OriginalScaleFactor"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v41, CFSTR("VNRectangleDetectorProcessOption_TargetScaleY"));

      -[VNDetector recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:", v17, v35, v20);
    }

  }
  else
  {
LABEL_11:
    v33 = 0;
  }
LABEL_17:

  return v33;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float64x2_t v35;
  float32x2_t v37;
  void *v38;
  void *v39;
  void *v40;
  float64x2_t *v41;
  double v42;
  float64x2_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  float v61;
  float v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v67;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v72;
  float64x2_t v73;
  float32x2_t v74;
  _BOOL4 v75;
  float *PerMeshForFFTSIZE;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  int v81;
  char v82;
  uint64_t v83;
  VNRectangleObservation *v84;
  float *v85;
  uint64_t v87;
  int v88;
  float *v89;
  float v90;
  float v91;
  float v92;
  float *v93;
  float *v94;
  float *v95;
  float *v96;
  VNRectangleObservation *v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i;
  float v102;
  float64x2_t v103;
  float v104;
  float64_t v105;
  double v106;
  float64x2_t v107;
  float64_t v108;
  float64x2_t v109;
  void *v110;
  void *v111;
  id v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  vImage_Buffer v118;
  int v119;
  _OWORD v120[2];
  uint64_t v121;
  int v122;
  float v123;
  float v124;
  int v125;
  float32x2_t v126;
  int v127;
  float v128;
  int v129;
  __int16 v130;
  float v131;
  vImage_Buffer v132;
  uint64_t v133;
  void *__p[3];
  void *v135[3];
  int v136;
  float v137;
  int v138;
  int v139;
  float v140;
  float v141;
  float64x2_t v142;
  char v143;
  int v144;
  _BYTE v145[128];
  uint64_t v146;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v146 = *MEMORY[0x1E0C80C00];
  v18 = a5;
  v112 = a7;
  v113 = a9;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v18, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v18, a8);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v111
      || (v144 = 0,
          !+[VNValidationUtilities getIntValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getIntValue:forKey:inOptions:minimumValue:maximumValue:error:", &v144, CFSTR("VNRectangleDetectorProcessOption_Version"), v18, 1, 2, a8)))
    {
      v20 = 0;
      goto LABEL_50;
    }
    if (v144 == 2
      && ((unint64_t)objc_msgSend(v111, "width") < 5 || (unint64_t)objc_msgSend(v111, "height") < 5))
    {
      v20 = (void *)MEMORY[0x1E0C9AA60];
LABEL_50:

      goto LABEL_51;
    }
    -[VNDetector computeDeviceOfTypes:forComputeStage:processingOptions:error:](self, "computeDeviceOfTypes:forComputeStage:processingOptions:error:", 1, CFSTR("VNComputeStageMain"), v18, a8);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v110)
      goto LABEL_48;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRectangleDetectorProcessOption_CropRect_X"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v108 = v22;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRectangleDetectorProcessOption_CropRect_Y"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v105 = v24;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRectangleDetectorProcessOption_CropRect_Width"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRectangleDetectorProcessOption_CropRect_Hight"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    v143 = 0;
    if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v143, CFSTR("VNRectangleDetectorProcessOption_HighAccuracy"), v18, 1, a8))goto LABEL_48;
    v31 = width;
    if (v31 <= 0.0
      || v31 > 1.0
      || (v32 = height, v32 <= 0.0)
      || v32 > 1.0
      || (v33 = x, v33 < 0.0)
      || v33 >= 1.0
      || (v34 = y, v34 < 0.0)
      || v34 >= 1.0)
    {
      if (a8)
      {
        v38 = (void *)MEMORY[0x1E0CB3940];
        VNHumanReadableCGRect(x, y, width, height);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("invalid region of interest: %@"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v40);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_48;
    }
    v37 = (float32x2_t)0x3F0000003F000000;
    if (objc_msgSend(v111, "getCameraOpticalCenterIfAvailable:", &v142))
    {
      switch(objc_msgSend(v111, "orientation"))
      {
        case 0u:
        case 1u:
          v35 = v142;
          goto LABEL_35;
        case 2u:
          _Q1.f64[0] = 1.0;
          v35.f64[0] = 1.0 - v142.f64[0];
          v41 = (float64x2_t *)&v142.f64[1];
          goto LABEL_30;
        case 3u:
          __asm { FMOV            V1.2D, #1.0 }
          v35 = vsubq_f64(_Q1, v142);
          goto LABEL_35;
        case 4u:
          v42 = v142.f64[1];
          v35.f64[0] = v142.f64[0];
          goto LABEL_34;
        case 5u:
          v47 = v142;
          goto LABEL_32;
        case 6u:
          _Q1.f64[0] = 1.0;
          v35.f64[0] = 1.0 - v142.f64[1];
          v41 = &v142;
LABEL_30:
          v35.f64[1] = v41->f64[0];
          goto LABEL_35;
        case 7u:
          __asm { FMOV            V1.2D, #1.0 }
          v47 = vsubq_f64(_Q1, v142);
LABEL_32:
          *(float32x2_t *)&v35.f64[0] = vcvt_f32_f64(v47);
          v37 = (float32x2_t)vrev64_s32(*(int32x2_t *)&v35.f64[0]);
          break;
        case 8u:
          v35.f64[0] = v142.f64[1];
          v42 = v142.f64[0];
LABEL_34:
          _Q1.f64[0] = 1.0 - v42;
          v35.f64[1] = _Q1.f64[0];
LABEL_35:
          v37 = vcvt_f32_f64(v35);
          break;
        default:
          break;
      }
    }
    v141 = 0.0;
    LODWORD(v35.f64[0]) = 0;
    LODWORD(_Q1.f64[0]) = 1.0;
    if (!+[VNValidationUtilities getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:", &v141, CFSTR("VNRectangleDetectorProcessOption_MinimumAspectRatio"), v18, a8, v35.f64[0], _Q1.f64[0]))goto LABEL_48;
    v140 = 0.0;
    LODWORD(v48) = 0;
    LODWORD(v49) = 1.0;
    if (!+[VNValidationUtilities getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:", &v140, CFSTR("VNRectangleDetectorProcessOption_MaximumAspectRatio"), v18, a8, v48, v49))goto LABEL_48;
    if (v141 > v140)
    {
      if (a8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VNRectangleDetectorProcessOption_MinimumAspectRatio value, %f is greater than VNRectangleDetectorProcessOption_MaximumAspectRatio value, %f"), v141, v140);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 4, v52);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_48;
    }
    v139 = 0;
    LODWORD(v51) = 1110704128;
    LODWORD(v50) = 0;
    if (!+[VNValidationUtilities getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:", &v139, CFSTR("VNRectangleDetectorProcessOption_QuadratureTolerance"), v18, a8, v50, v51)|| (v138 = 0, LODWORD(v53) = 0, LODWORD(v54) = 1.0, !+[VNValidationUtilities getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:", &v138, CFSTR("VNRectangleDetectorProcessOption_MinimumSize"), v18, a8, v53,
             v54))
      || (v137 = 0.0,
          LODWORD(v55) = 0,
          LODWORD(v56) = 1.0,
          !+[VNValidationUtilities getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:", &v137, CFSTR("VNRectangleDetectorProcessOption_MinimumConfidence"), v18, a8, v55, v56))|| (v136 = 0, !+[VNValidationUtilities getIntValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getIntValue:forKey:inOptions:minimumValue:maximumValue:error:", &v136, CFSTR("VNRectangleDetectorProcessOption_MaximumNumber"), v18, 1, 0x7FFFFFFFLL, a8)))
    {
LABEL_48:
      v20 = 0;
LABEL_49:

      goto LABEL_50;
    }
    std::vector<float>::vector(v135, 8 * v136);
    std::vector<float>::vector(__p, v136);
    v57 = v135[0];
    v133 = 0;
    v132.data = CVPixelBufferGetBaseAddress(a4);
    v132.height = CVPixelBufferGetHeight(a4);
    v132.width = CVPixelBufferGetWidth(a4);
    v132.rowBytes = CVPixelBufferGetBytesPerRow(a4);
    v58 = objc_msgSend(v111, "height");
    v59 = objc_msgSend(v111, "width");
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRectangleDetectorProcessOption_OriginalScaleFactor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "floatValue");
    v62 = v61;

    v131 = 0.0;
    objc_msgSend(v111, "getPixelFocalLengthIfAvailable:", &v131);
    *(float *)&v66 = v131;
    if (v131 < 0.0)
    {
      if (!a8)
      {
        v20 = 0;
        goto LABEL_87;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" PixelFocalLength value is out of bounds: %f"), v131);
      v67 = (id)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 4, v67);
      v20 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_86:

LABEL_87:
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v135[0])
      {
        v135[1] = v135[0];
        operator delete(v135[0]);
      }
      goto LABEL_49;
    }
    v69.f64[0] = (double)v59;
    v70 = vcvtq_f64_f32(v37);
    v69.f64[1] = (double)v58;
    __asm { FMOV            V1.2D, #-1.0 }
    v72 = vaddq_f64(v69, _Q1);
    _Q1.f64[0] = v108;
    _Q1.f64[1] = v105;
    v109 = _Q1;
    v103 = v72;
    v73 = vmulq_n_f64(vmlaq_f64(vnegq_f64(_Q1), v72, v70), (float)(1.0 / v62));
    if (!(_NF ^ _VF | _ZF))
    {
      *(float *)&v66 = v131 / v62;
      v131 = v131 / v62;
    }
    v74 = vcvt_f32_f64(v73);
    v106 = *(double *)&v74;
    if (v144 == 2)
    {
      v120[0] = xmmword_1A15FB5C0;
      v120[1] = xmmword_1A15FB5D0;
      v121 = 0x43F000000;
      v127 = v138;
      v128 = v137;
      v122 = v139;
      v123 = v141;
      v124 = v140;
      v125 = LODWORD(v66);
      v126 = v74;
      v129 = v136;
      v130 = 0;
      v119 = 0;
      v75 = QuadDetect(&v132, (uint64_t)v120, v57, __p[0], &v119);
      if (v75)
        v133 = v119;
      goto LABEL_61;
    }
    if (!self->_perMeshPtr)
    {
      PerMeshForFFTSIZE = createPerMeshForFFTSIZE();
      self->_perMeshPtr = PerMeshForFFTSIZE;
      if (!PerMeshForFFTSIZE)
      {
        LOBYTE(v75) = 0;
        goto LABEL_61;
      }
      *(float *)&v66 = v131;
    }
    *(float *)&v65 = v27 / v30;
    v118 = v132;
    *(float *)&v63 = v141;
    *(float *)v70.f64 = v140;
    LODWORD(v72.f64[0]) = v138;
    LODWORD(v64) = v139;
    LOBYTE(v75) = CCRectLowLevel((uint64_t)&v118, v66, v106, COERCE_DOUBLE(__PAIR64__(HIDWORD(v132.width), HIDWORD(v106))), v63, v70.f64[0], v72.f64[0], v64, v65, v62, v137);
LABEL_61:
    v77 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v78 = v133;
    v79 = (void *)objc_msgSend(v77, "initWithCapacity:", v133);
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRectangleDetectorProcessOption_TargetScaleY"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "intValue");

    v82 = !v75;
    if (!v78)
      v82 = 1;
    if ((v82 & 1) == 0)
    {
      v83 = 0;
      v84 = 0;
      v85 = (float *)v135[0];
      __asm { FMOV            V0.2D, #1.0 }
      v107 = vdivq_f64(_Q0, v103);
      do
      {
        v87 = 0;
        v88 = v144;
        do
        {
          if (v88 == 2)
          {
            v89 = &v85[v87];
            v90 = v62 * (float)((float)((float)v81 + -1.0) - v85[v87 + 1]);
            *v89 = v62 * v85[v87];
            v89[1] = v90;
          }
          *(float32x2_t *)&v85[v87] = vcvt_f32_f64(vmulq_f64(v107, vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64(v109, vcvtq_f64_f32(*(float32x2_t *)&v85[v87]))))));
          v87 += 2;
        }
        while (v87 != 8);
        if (v88 == 1)
        {
          v91 = v85[7];
          v92 = v85[3];
          if (v91 >= v92)
          {
            v96 = v85 + 6;
            v102 = v85[1];
            v104 = v85[7];
            v94 = v85 + 2;
            v95 = v85 + 4;
            v91 = v85[5];
            v93 = v85;
          }
          else
          {
            v102 = v85[3];
            v104 = v85[1];
            v93 = v85 + 2;
            v94 = v85 + 4;
            v92 = v85[5];
            v95 = v85 + 6;
            v96 = v85;
          }
        }
        else
        {
          v93 = v85 + 2;
          v102 = v85[3];
          v104 = v85[1];
          v94 = v85 + 4;
          v92 = v85[5];
          v95 = v85 + 6;
          v96 = v85;
          v91 = v85[7];
        }
        v97 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:]([VNRectangleObservation alloc], "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:", v19, *v96, v104, *v93, v102, *v94, v92, *v95, v91);

        v84 = v97;
        if (v97)
        {
          LODWORD(v98) = *((_DWORD *)__p[0] + v83);
          -[VNObservation setConfidence:](v97, "setConfidence:", v98);
          objc_msgSend(v79, "addObject:", v97);
        }
        v85 += 8;
        ++v83;
      }
      while (v83 != v78);

    }
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v67 = v79;
    v99 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v114, v145, 16);
    if (v99)
    {
      v100 = *(_QWORD *)v115;
      do
      {
        for (i = 0; i != v99; ++i)
        {
          if (*(_QWORD *)v115 != v100)
            objc_enumerationMutation(v67);
          -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v18, *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i));
        }
        v99 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v114, v145, 16);
      }
      while (v99);
    }
    v20 = v67;
    goto LABEL_86;
  }
  v20 = 0;
LABEL_51:

  return v20;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  _BOOL4 v4;
  VNSizeRange *v5;
  VNSupportedImageSize *v6;
  VNSupportedImageSize *v8;
  void *v9;
  int v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  if (!+[VNValidationUtilities getIntValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getIntValue:forKey:inOptions:minimumValue:maximumValue:error:", &v10, CFSTR("VNRectangleDetectorProcessOption_Version"), a3, 1, 2, a4))return 0;
  v4 = v10 == 1;
  v5 = -[VNSizeRange initWithMinimumDimension:maximumDimension:idealDimension:]([VNSizeRange alloc], "initWithMinimumDimension:maximumDimension:idealDimension:", 256, -1, 256);
  if (v4)
    v6 = -[VNSupportedImageSize initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:", 1111970369, v5, v5, 0, 1, 1);
  else
    v6 = -[VNSupportedImageSize initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:", 1111970369, v5, v5, 1, 1, 1);
  v8 = v6;

  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
