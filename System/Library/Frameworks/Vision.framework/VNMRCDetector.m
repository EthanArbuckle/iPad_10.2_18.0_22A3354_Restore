@implementation VNMRCDetector

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNMRCDetector;
  if (-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v16, sel_completeInitializationForSession_error_, v6, a4)&& (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "input_image"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = -[VNEspressoModelFileBasedDetector getWidth:height:ofEspressoModelNetworkBlobNamed:error:](self, "getWidth:height:ofEspressoModelNetworkBlobNamed:error:", &self->_networkWidth, &self->_networkHeight, v7, a4), v7, v8))
  {
    -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;
    if (v9)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D80]);
      v18[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0D83210];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithObjects:forKeys:", v12, v13);

      self->_mrcContext = (__MRCContext *)MRCContextCreateWithOptions();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  __MRCContext *mrcContext;
  objc_super v4;

  mrcContext = self->_mrcContext;
  if (mrcContext)
  {
    CFRelease(mrcContext);
    self->_mrcContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNMRCDetector;
  -[VNDetector dealloc](&v4, sel_dealloc);
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  uint64_t v25;
  __CVBuffer *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t networkWidth;
  unint64_t networkHeight;
  double v34;
  double v35;
  __int128 v36;
  double v37;
  double v38;
  float64x2_t v39;
  __int128 v40;
  double v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  __CVBuffer *v45;
  CFDataRef v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  UInt8 bytes[16];
  float64x2_t v51;
  float64x2_t v52;
  CGAffineTransform v53;
  double v54;
  double v55;
  double v56[3];
  char v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v66;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  v57 = 0;
  if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:error:", &v57, CFSTR("VNMRCDetectorProcessOption_UseMLBasedDetector"), v16, a8))
  {
    if (v57
      && (objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNMRCDetectorProcessOption_SegmentationMask")),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          !v17))
    {
      -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = objc_msgSend(v20, "width");
        v23 = objc_msgSend(v21, "height");
        *(_OWORD *)v56 = *MEMORY[0x1E0C9D538];
        v54 = 0.0;
        v55 = 0.0;
        objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_DoNotCacheRepresentations"));
        v24 = width * (double)v22 / (height * (double)v23);
        if (v24 >= 1.0)
          v25 = 1;
        else
          v25 = 257;
        v26 = (__CVBuffer *)objc_msgSend(v21, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:", self->_networkWidth, self->_networkHeight, 1111970369, v25, v16, a8, x * (double)v22, y * (double)v23, v56, &v55, &v54);
        *a7 = v26;
        v18 = v26 != 0;
        if (v26)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNMRCDetectorProcessOption_MaxDimensionSideScale"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          VisionCoreImagePointForNormalizedPoint();
          v29 = v28;
          v31 = v30;
          v56[0] = v28;
          v56[1] = v30;
          networkWidth = self->_networkWidth;
          networkHeight = self->_networkHeight;
          v35 = v54;
          v34 = v55;
          v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)&v53.a = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&v53.c = v36;
          *(_OWORD *)&v53.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          if (v24 >= 1.0)
          {
            v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
            *(_OWORD *)&v66.a = *MEMORY[0x1E0C9BAA8];
            *(_OWORD *)&v66.c = v40;
            *(_OWORD *)&v66.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
            CGAffineTransformMakeScale(&t1, 1.0 / v55, 1.0 / v54);
            CGAffineTransformConcat(&v53, &v66, &t1);
            v63 = v53;
            CGAffineTransformMakeTranslation(&v62, -v29, -v31);
            CGAffineTransformConcat(&t2, &v63, &v62);
            *(_OWORD *)&v53.a = *(_OWORD *)&t2.a;
            *(_OWORD *)&v53.c = *(_OWORD *)&t2.c;
            v39 = *(float64x2_t *)&t2.tx;
          }
          else
          {
            v37 = (double)networkHeight;
            v38 = (double)networkWidth;
            CGAffineTransformMakeTranslation(&v53, (double)networkWidth * -0.5, (double)networkHeight * -0.5);
            t1 = v53;
            CGAffineTransformMakeRotation(&t2, 1.57079633);
            CGAffineTransformConcat(&v66, &t1, &t2);
            *(_OWORD *)&v53.c = *(_OWORD *)&v66.c;
            *(_OWORD *)&v53.tx = *(_OWORD *)&v66.tx;
            *(_OWORD *)&v53.a = *(_OWORD *)&v66.a;
            v63 = v66;
            CGAffineTransformMakeTranslation(&v62, v37 * 0.5, v38 * 0.5);
            CGAffineTransformConcat(&v66, &v63, &v62);
            *(_OWORD *)&v53.c = *(_OWORD *)&v66.c;
            *(_OWORD *)&v53.tx = *(_OWORD *)&v66.tx;
            *(_OWORD *)&v53.a = *(_OWORD *)&v66.a;
            v61 = v66;
            CGAffineTransformMakeScale(&v60, 1.0 / v35, 1.0 / v34);
            CGAffineTransformConcat(&v66, &v61, &v60);
            *(_OWORD *)&v53.c = *(_OWORD *)&v66.c;
            *(_OWORD *)&v53.tx = *(_OWORD *)&v66.tx;
            *(_OWORD *)&v53.a = *(_OWORD *)&v66.a;
            v59 = v66;
            CGAffineTransformMakeTranslation(&v58, -v31, -v29);
            CGAffineTransformConcat(&v66, &v59, &v58);
            *(_OWORD *)&v53.a = *(_OWORD *)&v66.a;
            *(_OWORD *)&v53.c = *(_OWORD *)&v66.c;
            v39 = *(float64x2_t *)&v66.tx;
          }
          *(float64x2_t *)&v53.tx = v39;
          v48 = *(float64x2_t *)&v53.c;
          v49 = *(float64x2_t *)&v53.a;
          v47 = v39;
          if (v27)
          {
            objc_msgSend(v27, "doubleValue");
            v42 = vmulq_n_f64(v49, v41);
            v43 = vmulq_n_f64(v48, v41);
            v44 = vmulq_n_f64(v47, v41);
          }
          else
          {
            v43 = *(float64x2_t *)&v53.c;
            v42 = *(float64x2_t *)&v53.a;
            v44 = v39;
          }
          *(float64x2_t *)bytes = v42;
          v51 = v43;
          v52 = v44;
          v45 = *a7;
          v46 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 48);
          if (v46)
          {
            CVBufferSetAttachment(v45, CFSTR("VNCGAffineTransformAttachment"), v46, kCVAttachmentMode_ShouldPropagate);
            CFRelease(v46);
          }

        }
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 1;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const void *v21;
  const void *v22;
  id v23;
  void *v24;
  id v26;
  _QWORD aBlock[5];
  id v28;
  id v29;
  uint64_t *v30;
  const __CVBuffer *v31;
  const void *v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t valuePtr;
  _BYTE v41[9];

  v14 = a5;
  v15 = a7;
  v16 = a9;
  v41[0] = 0;
  if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:error:", v41, CFSTR("VNMRCDetectorProcessOption_UseMLBasedDetector"), v14, a8))
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNMRCDetectorProcessOption_MRCDecoderOptions"), v14, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D83248]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      valuePtr = 0;
      if (v19
        && (CFNumberGetValue((CFNumberRef)v19, kCFNumberCFIndexType, &valuePtr), valuePtr)
        && valuePtr != 0x20000
        && valuePtr != 0x10000)
      {
        +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", 0, CFSTR("VNMRCDetectorProcessOption_MRCSample"), v14, a8);
        v22 = (const void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
LABEL_17:
          objc_msgSend(v18, "setObject:forKeyedSubscript:", self->_mrcContext, *MEMORY[0x1E0D83250]);
          v34 = 0;
          v35 = &v34;
          v36 = 0x3032000000;
          v37 = __Block_byref_object_copy__21234;
          v38 = __Block_byref_object_dispose__21235;
          v39 = 0;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __115__VNMRCDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
          aBlock[3] = &unk_1E4546A28;
          v33 = v41[0];
          aBlock[4] = self;
          v28 = v18;
          v30 = &v34;
          v31 = a4;
          v32 = v22;
          v29 = v14;
          v24 = _Block_copy(aBlock);
          if ((VNExecuteBlock(v24, (uint64_t)a8) & 1) != 0)
            v23 = (id)v35[5];
          else
            v23 = 0;

          _Block_object_dispose(&v34, 8);
          CFRelease(v22);
          goto LABEL_23;
        }
      }
      else
      {
        v26 = v15;
        v20 = v14;
        if (self
          && (+[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", 0, CFSTR("VNMRCDetectorProcessOption_MRCSample"), v20, a8), (v21 = (const void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v22 = (const void *)MRCSampleCreateByGeneratingPyramid();
          if (!v22)
          {
            if (a8)
            {
              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("unable to generate pyramid data"));
              v22 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v22 = 0;
            }
          }
          CFRelease(v21);
        }
        else
        {
          v22 = 0;
        }

        v15 = v26;
        if (v22)
          goto LABEL_17;
      }
    }
    v23 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v23 = 0;
LABEL_24:

  return v23;
}

BOOL __115__VNMRCDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  __CVBuffer *v6;
  void *v7;
  __int128 v8;
  const __CFData *v9;
  const __CFData *v10;
  CFTypeID v11;
  const UInt8 *BytePtr;
  __int128 v13;
  __int128 v14;
  char v15;
  id v16;
  const void *v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  int64x2_t v37;
  int32x4_t v38;
  id v39;
  __CFString *v40;
  void *v41;
  id v42;
  __CFString *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  char *v49;
  char *v50;
  char *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  float *v57;
  uint64_t v58;
  _DWORD *v59;
  unint64_t v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  int v67;
  int v68;
  int v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  int v75;
  int v76;
  int v77;
  char *v78;
  __int128 v79;
  char *v80;
  unint64_t v81;
  uint64_t v82;
  float *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  float *v89;
  float *v90;
  float *v91;
  float *v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  char *v98;
  __int128 v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  char *v103;
  size_t v104;
  char *v105;
  __int128 v106;
  char *v107;
  char *i;
  __int128 v109;
  unint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  float32x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  void *v119;
  const void *v120;
  uint64_t v121;
  void *v122;
  id v123;
  __CFString *v124;
  void *v125;
  uint64_t v126;
  CFErrorRef v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  id v136;
  int64x2_t v137[8];
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  CFErrorRef err[2];
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  uint64_t v155;
  CFErrorRef v156;
  float64x2_t v157;
  float64x2_t v158;
  float64x2_t v159;
  float64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  _OWORD v165[5];
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint64_t v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 80))
  {
    MRCContextPreflightForDecoderUsingOptions();
    v6 = *(__CVBuffer **)(a1 + 64);
    v7 = *(void **)(a1 + 32);
    v135 = *(id *)(a1 + 40);
    if (!v7)
      goto LABEL_56;
    if (v6)
    {
      v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v152 = *MEMORY[0x1E0C9BAA8];
      v153 = v8;
      v154 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v9 = (const __CFData *)CVBufferCopyAttachment(v6, CFSTR("VNCGAffineTransformAttachment"), 0);
      v10 = v9;
      if (v9)
      {
        v11 = CFGetTypeID(v9);
        if (v11 == CFDataGetTypeID() && CFDataGetLength(v10) == 48)
        {
          BytePtr = CFDataGetBytePtr(v10);
          v13 = *(_OWORD *)BytePtr;
          v14 = *((_OWORD *)BytePtr + 2);
          v153 = *((_OWORD *)BytePtr + 1);
          v154 = v14;
          v152 = v13;
          v15 = 1;
        }
        else if (a2)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("invalid transform data in pixel buffer"));
          v15 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        CFRelease(v10);
        if ((v15 & 1) != 0)
        {
          v151 = 0;
          v149 = 0u;
          v150 = 0u;
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          *(_OWORD *)err = 0u;
          v142 = 0u;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "detections");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v7, "bindBuffer:toNetworkOutputBlobName:error:", err, v27, a2);

          if ((v28 & 1) != 0)
          {
            v171 = 0;
            v169 = 0u;
            v170 = 0u;
            v167 = 0u;
            v168 = 0u;
            v166 = 0u;
            memset(v165, 0, sizeof(v165));
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "box_cls");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v7, "bindBuffer:toNetworkOutputBlobName:error:", v165, v29, a2);

            if ((v30 & 1) != 0)
            {
              v140 = 0;
              v138 = 0u;
              v139 = 0u;
              memset(v137, 0, sizeof(v137));
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "rotation");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v7, "bindBuffer:toNetworkOutputBlobName:error:", v137, v31, a2);

              if ((v32 & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "input_image");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v7, "bindLockedPixelBuffer:toNetworkInputBlobName:error:", v6, v33, a2);

                if ((v34 & 1) != 0)
                {
                  if (objc_msgSend(v7, "executePlanAndReturnError:", a2))
                  {
                    if ((_QWORD)v148 == 1 && v147 == __PAIR128__(1, 4) && (_DWORD)v151 == 65568)
                    {
                      if ((_QWORD)v168 == 1
                        && v167 == __PAIR128__(1, 4)
                        && (v35 = *((_QWORD *)&v166 + 1), *((_QWORD *)&v166 + 1) == *((_QWORD *)&v146 + 1))
                        && (v36 = v166, (_QWORD)v166 == (_QWORD)v146)
                        && (_DWORD)v171 == 65568)
                      {
                        v37 = vdupq_n_s64(1uLL);
                        v38 = (int32x4_t)vceqq_s64(*(int64x2_t *)((char *)&v137[6] + 8), v37);
                        v37.i64[0] = *((_QWORD *)&v166 + 1);
                        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)((char *)&v137[5] + 8), v37), v38)), 0xFuLL))) & 1) != 0&& v137[5].i64[0] == (_QWORD)v166&& (_DWORD)v140 == 65568)
                        {
                          v49 = 0;
                          if (!*((_QWORD *)&v166 + 1))
                            goto LABEL_150;
                          v50 = 0;
                          v51 = 0;
                          v52 = 0;
                          v128 = v137[0].i64[0];
                          v129 = *(_QWORD *)&v165[0];
                          v127 = err[0];
                          v133 = 2 * *((_QWORD *)&v149 + 1);
                          v134 = *((_QWORD *)&v149 + 1);
                          v132 = 3 * *((_QWORD *)&v149 + 1);
                          v53 = 4;
                          v54 = 4;
                          v55 = v166;
                          do
                          {
                            if (v55)
                            {
                              v56 = 0;
                              v57 = (float *)(v128 + 4 * v138 * v52);
                              v58 = v129 + 4 * v169 * v52;
                              v130 = v52;
                              v59 = (_DWORD *)((char *)v127 + 4 * v149 * v52);
                              do
                              {
                                if (v54)
                                {
                                  v131 = v56;
                                  v60 = 0;
                                  do
                                  {
                                    v61 = *(float *)(v58 + 4 * *((_QWORD *)&v169 + 1) * v60);
                                    if (v61 > 0.1)
                                    {
                                      v62 = *v57;
                                      v63 = -*v57;
                                      if (*v57 > 0.0)
                                        v64 = 2.0;
                                      else
                                        v64 = -2.0;
                                      if (v62 > 1.0 || v62 < -1.0)
                                      {
                                        do
                                        {
                                          do
                                            v63 = v64 + v63;
                                          while (v63 < -1.0);
                                        }
                                        while (v63 > 1.0);
                                      }
                                      v65 = v63 * 90.0;
                                      v66 = sqrtf(v61);
                                      if (v50 >= v51)
                                      {
                                        v70 = 0x6DB6DB6DB6DB6DB7 * ((v50 - v49) >> 2) + 1;
                                        if (v70 > 0x924924924924924)
                                          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                        if (0xDB6DB6DB6DB6DB6ELL * ((v51 - v49) >> 2) > v70)
                                          v70 = 0xDB6DB6DB6DB6DB6ELL * ((v51 - v49) >> 2);
                                        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v51 - v49) >> 2)) >= 0x492492492492492)
                                          v71 = 0x924924924924924;
                                        else
                                          v71 = v70;
                                        v72 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DetectedRectangle>>(v71);
                                        v74 = &v72[4 * ((v50 - v49) >> 2)];
                                        v75 = v59[v134];
                                        v76 = v59[v133];
                                        v77 = v59[v132];
                                        *(_DWORD *)v74 = *v59;
                                        *((_DWORD *)v74 + 1) = v75;
                                        *((_DWORD *)v74 + 2) = v76;
                                        *((_DWORD *)v74 + 3) = v77;
                                        *((float *)v74 + 4) = v66;
                                        *((float *)v74 + 5) = v65;
                                        *((_DWORD *)v74 + 6) = v60;
                                        if (v50 == v49)
                                        {
                                          v80 = &v72[4 * ((v50 - v49) >> 2)];
                                        }
                                        else
                                        {
                                          v78 = &v72[4 * ((v50 - v49) >> 2)];
                                          do
                                          {
                                            v79 = *(_OWORD *)(v50 - 28);
                                            v80 = v78 - 28;
                                            *((_OWORD *)v78 - 1) = *((_OWORD *)v50 - 1);
                                            *(_OWORD *)(v78 - 28) = v79;
                                            v50 -= 28;
                                            v78 -= 28;
                                          }
                                          while (v50 != v49);
                                        }
                                        v51 = &v72[28 * v73];
                                        v50 = v74 + 28;
                                        if (v49)
                                          operator delete(v49);
                                        v49 = v80;
                                      }
                                      else
                                      {
                                        v67 = v59[v134];
                                        v68 = v59[v133];
                                        v69 = v59[v132];
                                        *(_DWORD *)v50 = *v59;
                                        *((_DWORD *)v50 + 1) = v67;
                                        *((_DWORD *)v50 + 2) = v68;
                                        *((_DWORD *)v50 + 3) = v69;
                                        *((float *)v50 + 4) = v66;
                                        *((float *)v50 + 5) = v65;
                                        *((_DWORD *)v50 + 6) = v60;
                                        v50 += 28;
                                      }
                                      v53 = v167;
                                    }
                                    ++v60;
                                  }
                                  while (v53 > v60);
                                  v36 = v166;
                                  v54 = v53;
                                  v56 = v131;
                                }
                                ++v59;
                                v58 += 4;
                                ++v57;
                                ++v56;
                              }
                              while (v56 < v36);
                              v35 = *((_QWORD *)&v166 + 1);
                              v55 = v36;
                              v52 = v130;
                            }
                            ++v52;
                          }
                          while (v52 < v35);
                          if (v49 == v50)
                            goto LABEL_150;
                          v81 = 0x6DB6DB6DB6DB6DB7 * ((v50 - v49) >> 2);
                          std::__introsort<std::_ClassicAlgPolicy,nonMaxSuppression(std::vector<DetectedRectangle> &,float)::$_0 &,DetectedRectangle*,false>((uint64_t)v49, v50, 126 - 2 * __clz(v81), 1);
                          if ((int)v81 < 1)
                          {
                            v100 = (int)v81;
                          }
                          else
                          {
                            v82 = 0;
                            v83 = (float *)(v49 + 52);
                            v84 = 1;
                            v85 = 0x6DB6DB6DB6DB6DB7 * ((v50 - v49) >> 2);
                            do
                            {
                              v86 = v82 + 1;
                              if (v82 + 1 >= (int)v85)
                              {
                                LODWORD(v85) = v82 + 1;
                              }
                              else
                              {
                                v87 = v85;
                                v88 = &v49[28 * v82];
                                v89 = (float *)(v88 + 4);
                                v90 = (float *)(v88 + 8);
                                v91 = (float *)(v88 + 12);
                                v92 = v83;
                                LODWORD(v85) = v86;
                                do
                                {
                                  if (*((_DWORD *)v88 + 6) != *(_DWORD *)v92
                                    || (v93 = *(v92 - 6),
                                        v94 = *(v92 - 5),
                                        v95 = *(v92 - 4),
                                        v96 = *(v92 - 3),
                                        v97 = fmaxf(fminf(*v90, v95) - fmaxf(*(float *)v88, v93), 0.0)
                                            * fmaxf(fminf(*v91, v96) - fmaxf(*v89, v94), 0.0),
                                        (float)(v97
                                              / (float)((float)((float)((float)(v95 - v93) * (float)(v96 - v94))
                                                              + (float)((float)(*v90 - *(float *)v88)
                                                                      * (float)(*v91 - *v89)))
                                                      - v97)) <= 0.5))
                                  {
                                    v98 = &v49[28 * (int)v85];
                                    v99 = *(_OWORD *)(v92 - 6);
                                    LODWORD(v85) = v85 + 1;
                                    *(_OWORD *)(v98 + 12) = *(_OWORD *)(v92 - 3);
                                    *(_OWORD *)v98 = v99;
                                  }
                                  v92 += 7;
                                  --v87;
                                }
                                while (v84 != v87);
                              }
                              ++v84;
                              v83 += 7;
                              v82 = v86;
                            }
                            while (v86 < (int)v85);
                            v100 = (int)v85;
                          }
                          v101 = v100 - v81;
                          if (v100 <= v81)
                          {
                            v105 = v100 >= v81 ? v50 : &v49[28 * (int)v100];
                          }
                          else if (0x6DB6DB6DB6DB6DB7 * ((v51 - v50) >> 2) >= v101)
                          {
                            bzero(v50, 28 * ((28 * v101 - 28) / 0x1C) + 28);
                            v105 = &v50[28 * ((28 * v101 - 28) / 0x1C) + 28];
                          }
                          else
                          {
                            if (v100 > 0x924924924924924)
                              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                            if (0xDB6DB6DB6DB6DB6ELL * ((v51 - v49) >> 2) > v100)
                              v100 = 0xDB6DB6DB6DB6DB6ELL * ((v51 - v49) >> 2);
                            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v51 - v49) >> 2)) >= 0x492492492492492)
                              v102 = 0x924924924924924;
                            else
                              v102 = v100;
                            v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DetectedRectangle>>(v102)
                                 + 4 * ((v50 - v49) >> 2);
                            v104 = 28 * ((28 * v101 - 28) / 0x1C) + 28;
                            bzero(v103, v104);
                            v105 = &v103[v104];
                            do
                            {
                              v106 = *(_OWORD *)(v50 - 28);
                              *((_OWORD *)v103 - 1) = *((_OWORD *)v50 - 1);
                              *(_OWORD *)(v103 - 28) = v106;
                              v103 -= 28;
                              v50 -= 28;
                            }
                            while (v50 != v49);
                            if (v49)
                              operator delete(v49);
                            v49 = v103;
                          }
                          if (v49 == v105)
                            goto LABEL_150;
                          v107 = v49;
                          while (*((float *)v107 + 4) >= flt_1A15FB800[*((unsigned int *)v107 + 6)])
                          {
                            v107 += 28;
                            if (v107 == v105)
                              goto LABEL_139;
                          }
                          if (v107 != v105)
                          {
                            for (i = v107 + 28; i != v105; i += 28)
                            {
                              if (*((float *)i + 4) >= flt_1A15FB800[*((unsigned int *)i + 6)])
                              {
                                v109 = *(_OWORD *)i;
                                *(_OWORD *)(v107 + 12) = *(_OWORD *)(i + 12);
                                *(_OWORD *)v107 = v109;
                                v107 += 28;
                              }
                            }
                          }
LABEL_139:
                          if (v105 == v49)
                          {
LABEL_150:
                            v24 = MEMORY[0x1E0C9AA60];
                            if (!v49)
                              goto LABEL_57;
                          }
                          else
                          {
                            v110 = (v105 - v49) / 28;
                            v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v110);
                            v112 = *MEMORY[0x1E0D83428];
                            v161 = *MEMORY[0x1E0D83420];
                            v162 = v112;
                            v113 = *MEMORY[0x1E0D83430];
                            v163 = *MEMORY[0x1E0D83438];
                            v164 = v113;
                            if (v110 <= 1)
                              v114 = 1;
                            else
                              v114 = v110;
                            v115 = v49 + 16;
                            do
                            {
                              v116 = *(float32x2_t *)(v115 - 16);
                              v117 = vcvtq_f64_f32((float32x2_t)vrev64_s32((int32x2_t)v116));
                              v118 = vaddq_f64(v117, vcvtq_f64_f32((float32x2_t)vrev64_s32((int32x2_t)vsub_f32(*(float32x2_t *)(v115 - 8), v116))));
                              v156 = *(CFErrorRef *)&v117.f64[1];
                              v157 = v117;
                              v158 = v118;
                              v159 = v118;
                              v160 = v117.f64[0];
                              if (*((_DWORD *)v115 + 2) <= 3u)
                              {
                                v119 = (void *)MRCRegionCreate();
                                objc_msgSend(v111, "addObject:", v119);

                              }
                              v115 += 28;
                              --v114;
                            }
                            while (v114);
                            v120 = (const void *)MRCDecoderCreateWithOptions();
                            if (v120)
                            {
                              v156 = 0;
                              v121 = MRCDecoderDecodeSampleWithRegions();
                              v122 = (void *)v121;
                              if (v121)
                              {
                                v155 = v121;
                                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
                                v24 = objc_claimAutoreleasedReturnValue();

                              }
                              else
                              {
                                if (a2)
                                {
                                  v123 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v124 = (__CFString *)CFErrorCopyDescription(v156);
                                  v125 = (void *)objc_msgSend(v123, "initWithFormat:", CFSTR("Could not decode sample: %@"), v124);

                                  +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v125);
                                  *a2 = (id)objc_claimAutoreleasedReturnValue();

                                }
                                CFRelease(v156);
                                v24 = 0;
                              }
                              CFRelease(v120);
                            }
                            else if (a2)
                            {
                              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("unable to create MRCDecoder"));
                              v24 = 0;
                              *a2 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              v24 = 0;
                            }

                          }
                          operator delete(v49);
LABEL_57:

                          v47 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                          v46 = *(void **)(v47 + 40);
                          *(_QWORD *)(v47 + 40) = v24;
                          goto LABEL_58;
                        }
                        if (a2)
                        {
                          +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("returned buffer from network was not in expected format - _outputRotationEspressoBuffer"));
                          v23 = (id)objc_claimAutoreleasedReturnValue();
                          goto LABEL_19;
                        }
                      }
                      else if (a2)
                      {
                        +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("returned buffer from network was not in expected format - _outputScoresEspressoBuffer"));
                        v23 = (id)objc_claimAutoreleasedReturnValue();
                        goto LABEL_19;
                      }
                    }
                    else if (a2)
                    {
                      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("returned buffer from network was not in expected format - outputBoxesEspressoBuffer"));
                      v23 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_19;
                    }
                  }
                }
              }
            }
          }
        }
LABEL_56:
        v24 = 0;
        goto LABEL_57;
      }
      if (!a2)
        goto LABEL_56;
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("AffineTransform missing afterCropAndScale"));
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a2)
        goto LABEL_56;
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("image is unavailable"));
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_19:
    v24 = 0;
    *a2 = v23;
    goto LABEL_57;
  }
  v136 = *(id *)(a1 + 48);
  v16 = v4;
  if (!v5)
    goto LABEL_46;
  v17 = (const void *)MRCDecoderCreateWithOptions();
  if (v17)
  {
    objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("VNMRCDetectorProcessOption_SegmentationMask"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      CVPixelBufferLockBaseAddress((CVPixelBufferRef)v18, 1uLL);
      CVPixelBufferGetBaseAddress((CVPixelBufferRef)v18);
      CVPixelBufferGetWidth((CVPixelBufferRef)v18);
      CVPixelBufferGetHeight((CVPixelBufferRef)v18);
      CVPixelBufferGetBytesPerRow((CVPixelBufferRef)v18);
      v126 = objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D83270]);
      v19 = (const void *)MRCSegmentationMaskCreate();
      err[0] = 0;
      v20 = MRCDecoderDecodeSampleWithSegmentationMask();
      v21 = (void *)v20;
      if (v20)
      {
        *(_QWORD *)&v165[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 1, v126);
        v22 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (a2)
        {
          v39 = objc_alloc(MEMORY[0x1E0CB3940]);
          v40 = (__CFString *)CFErrorCopyDescription(err[0]);
          v41 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("Could not decode sample: %@"), v40);

          +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v41);
          *a2 = (id)objc_claimAutoreleasedReturnValue();

        }
        CFRelease(err[0]);
        v22 = 0;
      }
      CFRelease(v19);
      CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v18, 1uLL);
    }
    else
    {
      err[0] = 0;
      v25 = MRCDecoderDecodeSample();
      v26 = (void *)v25;
      if (v25)
      {
        *(_QWORD *)&v165[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 1);
        v22 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (a2)
        {
          v42 = objc_alloc(MEMORY[0x1E0CB3940]);
          v43 = (__CFString *)CFErrorCopyDescription(err[0]);
          v44 = (void *)objc_msgSend(v42, "initWithFormat:", CFSTR("Could not decode sample: %@"), v43);

          +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v44);
          *a2 = (id)objc_claimAutoreleasedReturnValue();

        }
        CFRelease(err[0]);
        v22 = 0;
      }
    }
    CFRelease(v17);
    goto LABEL_51;
  }
  if (a2)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("unable to create MRCDecoder"));
    v22 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_46:
    v22 = 0;
  }
LABEL_51:

  v45 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v46 = *(void **)(v45 + 40);
  *(_QWORD *)(v45 + 40) = v22;
LABEL_58:

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mrcdetector.espresso");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "input_image");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
