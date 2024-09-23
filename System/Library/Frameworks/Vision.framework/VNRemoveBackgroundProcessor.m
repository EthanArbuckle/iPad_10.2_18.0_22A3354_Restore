@implementation VNRemoveBackgroundProcessor

- (void)dealloc
{
  NSObject *removeBackgroundSemaphore;
  objc_super v4;

  removeBackgroundSemaphore = self->_removeBackgroundSemaphore;
  if (removeBackgroundSemaphore)
    dispatch_semaphore_signal(removeBackgroundSemaphore);
  v4.receiver = self;
  v4.super_class = (Class)VNRemoveBackgroundProcessor;
  -[VNDetector dealloc](&v4, sel_dealloc);
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *assembleConstraintsState;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *applyMaskComputeState;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *copyCropComputeState;
  OS_dispatch_semaphore *v20;
  OS_dispatch_semaphore *removeBackgroundSemaphore;
  BOOL v22;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VNRemoveBackgroundProcessor;
  if (-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v24, sel_completeInitializationForSession_error_, v6, a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "input_image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VNEspressoModelFileBasedDetector getWidth:height:ofEspressoModelNetworkBlobNamed:error:](self, "getWidth:height:ofEspressoModelNetworkBlobNamed:error:", &self->_networkWidth, &self->_networkHeight, v7, a4);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "saliency");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", &self->_outputMaskEspressoBuffer, v9, a4);

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "gating_confidence");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", &self->_outputConfidenceEspressoBuffer, v11, a4);

        if (v12)
        {
          -[VNDetector metalContext](self, "metalContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v13, CFSTR("removebkgnd_assembleConstraints"), (uint64_t)a4);
          v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          assembleConstraintsState = self->_assembleConstraintsState;
          self->_assembleConstraintsState = v14;

          if (self->_assembleConstraintsState)
          {
            -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v13, CFSTR("removebkgnd_maskimage"), (uint64_t)a4);
            v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
            applyMaskComputeState = self->_applyMaskComputeState;
            self->_applyMaskComputeState = v16;

            if (self->_applyMaskComputeState)
            {
              -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v13, CFSTR("removebkgnd_copyCrop"), (uint64_t)a4);
              v18 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
              copyCropComputeState = self->_copyCropComputeState;
              self->_copyCropComputeState = v18;

              if (self->_copyCropComputeState)
              {
                v20 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
                removeBackgroundSemaphore = self->_removeBackgroundSemaphore;
                self->_removeBackgroundSemaphore = v20;

                if (self->_removeBackgroundSemaphore)
                {
                  v22 = 1;
LABEL_15:

                  goto LABEL_11;
                }
                if (a4)
                {
                  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("failed to create semaphore"));
                  v22 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_15;
                }
              }
            }
          }
          v22 = 0;
          goto LABEL_15;
        }
      }
    }
  }
  v22 = 0;
LABEL_11:

  return v22;
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
  id v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __CVBuffer *v26;
  void *v27;
  BOOL v28;
  __CVBuffer *v30;
  void *v31;
  id v32;
  char v33;
  char v34;
  unsigned __int8 v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v35 = 0;
    if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v35, CFSTR("VNRemoveBackgroundProcessorOption_PerformInPlace"), v16, 0, a8))
    {
      v34 = 0;
      if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v34, CFSTR("VNRemoveBackgroundProcessorOption_CropResult"), v16, 0, a8))
      {
        v33 = 0;
        if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v33, CFSTR("VNRemoveBackgroundProcessorOption_ReturnMask"), v16, 0, a8))
        {
          v32 = 0;
          v18 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v32, objc_opt_class(), CFSTR("VNRemoveBackgroundProcessorOption_MaskObservation"), v16, a8);
          v19 = v32;
          if (v18)
          {
            v20 = objc_msgSend(v17, "width");
            v21 = x * (double)v20;
            v22 = width * (double)v20;
            v23 = (double)(unint64_t)objc_msgSend(v17, "height");
            v24 = y * v23;
            v25 = height * v23;
            if (v35)
            {
              v26 = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v17, "originalPixelBuffer"));
              *a7 = v26;
              if (!v26 || CVPixelBufferGetPixelFormatType(v26) != 1111970369 || !CVPixelBufferGetIOSurface(*a7) || v33)
              {
                if (a8)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  +[VNError errorForInvalidOption:named:localizedDescription:](VNError, "errorForInvalidOption:named:localizedDescription:", v27, CFSTR("performInPlace"), CFSTR("Conditions for in-place execution not met"));
                  *a8 = (id)objc_claimAutoreleasedReturnValue();

                }
                goto LABEL_13;
              }
LABEL_18:
              if (!v19)
              {
                objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
                v31 = (void *)objc_msgSend(v17, "croppedBufferWithWidth:height:format:cropRect:options:error:", self->_networkWidth, self->_networkHeight, 1111970369, v16, a8, v21, v24, v22, v25);
                if (!v31)
                {
LABEL_13:
                  CVPixelBufferRelease(*a7);
                  v28 = 0;
                  *a7 = 0;
LABEL_23:

                  goto LABEL_15;
                }
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, CFSTR("VNRemoveBackgroundProcessorOption_LowResInput"));

              }
              v28 = 1;
              goto LABEL_23;
            }
            if (v33)
              goto LABEL_18;
            v30 = (__CVBuffer *)objc_msgSend(v17, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v22, (unint64_t)v25, 1111970369, v16, a8, v21, v24, v22, v25);
            *a7 = v30;
            if (v30)
              goto LABEL_18;
          }
          v28 = 0;
          goto LABEL_23;
        }
      }
    }
  }
  v28 = 0;
LABEL_15:

  return v28;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  double *v25;
  void *v26;
  __CVBuffer *v27;
  uint64_t *v28;
  __CVBuffer *v29;
  int64_t v30;
  size_t v31;
  size_t BytesPerRow;
  char *BaseAddress;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  int64_t *v37;
  size_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  int64_t *v43;
  int64_t *v44;
  unint64_t v45;
  size_t v46;
  size_t v47;
  unint64_t v48;
  char *v49;
  dispatch_group_t v50;
  uint64_t v51;
  VNRemoveBackgroundProcessor *v52;
  __CVBuffer *v53;
  size_t v54;
  size_t v55;
  size_t v56;
  void *v57;
  void *v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  int8x16_t *v62;
  int8x16_t *v63;
  unint64_t v64;
  int8x16_t *v65;
  size_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  dispatch_group_t v70;
  int8x16_t *v71;
  int8x16_t *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  char v77;
  int8x16_t v78;
  int8x16_t v79;
  int8x16_t *v80;
  int8x16_t v81;
  int8x16_t v82;
  size_t v84;
  size_t v85;
  char *v86;
  BOOL v87;
  BOOL v88;
  float64x2_t v89;
  uint64_t *v90;
  __CVBuffer *v91;
  size_t v92;
  size_t v93;
  id *v94;
  os_unfair_lock_s *v95;
  void *v96;
  id v97;
  double v98;
  double v99;
  __CVBuffer *v100;
  id v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  int v107;
  int v108;
  void *v109;
  VNPixelBufferObservation *v110;
  double v111;
  int v112;
  __CVBuffer *v113;
  int64x2_t v115;
  int8x16_t *v116;
  int64x2_t v117;
  __CVBuffer *v118;
  MTLComputePipelineState *copyCropComputeState;
  id *v120;
  id v121;
  id v122;
  int v123;
  int v124;
  __CVBuffer *v125;
  id v126;
  void *v127;
  VNRemoveBackgroundProcessor *v128;
  int v129;
  void *v130;
  int context;
  void *contexta;
  id v133;
  id v134;
  void *v135;
  void *v136;
  _QWORD aBlock[4];
  id v138;
  VNRemoveBackgroundProcessor *v139;
  id v140;
  id v141;
  uint64_t *v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  const __CVBuffer *v152;
  char v153;
  char v154;
  char v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  char v159;
  uint64_t v160;
  float *v161;
  uint64_t v162;
  int v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t v179;
  char v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t (*v183)(uint64_t);
  void *v184;
  VNRemoveBackgroundProcessor *v185;
  uint64_t *v186;
  void *v187;
  size_t v188;
  size_t v189;
  size_t v190;
  size_t v191;
  _QWORD v192[4];
  __int16 v193;
  __int16 v194;
  id v195;
  id v196;
  id v197;
  id v198;
  char v199;
  double *v200;
  _QWORD v201[4];
  CGRect v202;
  CGRect v203;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v201[2] = *MEMORY[0x1E0C80C00];
  v18 = a5;
  v133 = a7;
  v134 = a9;
  v136 = v18;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRemoveBackgroundProcessorOption_PerformInPlace"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  context = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRemoveBackgroundProcessorOption_CropResult"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRemoveBackgroundProcessorOption_ReturnMask"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNRemoveBackgroundProcessorOption_MaskObservation"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = 0;
  if (+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v180, CFSTR("VNRemoveBackgroundProcessorOption_AlphaGating"), v18, 0, a8))
  {
    v176 = 0;
    v177 = &v176;
    v178 = 0x2020000000;
    v179 = 0;
    v128 = self;
    if (!v135)
    {
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", 0, CFSTR("VNRemoveBackgroundProcessorOption_LowResInput"), v18, a8);
      v27 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      v177[3] = (uint64_t)v27;
      if (!v27
        || !+[VNCVPixelBufferHelper lockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, v27, 1uLL, a8))
      {
LABEL_36:
        v26 = 0;
LABEL_127:
        _Block_object_dispose(&v176, 8);
        goto LABEL_128;
      }
      if (v180)
      {
        v28 = v177;
        if (!self)
          goto LABEL_83;
        v29 = (__CVBuffer *)v177[3];
        v30 = CVPixelBufferGetWidth(v29);
        v31 = CVPixelBufferGetHeight(v29);
        BytesPerRow = CVPixelBufferGetBytesPerRow(v29);
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(v29);
        objc_msgSend((id)objc_opt_class(), "detectorInternalProcessingAsyncTasksQueue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "maximumTasksCount");
        v36 = v35;
        v124 = v22;
        if (v35)
        {
          if (v35 >= 0x666666666666667)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v37 = (int64_t *)operator new(40 * v35);
          bzero(v37, 40 * ((40 * v36 - 40) / 0x28) + 40);
          v38 = 0;
          v39 = 0;
          if (v30 >= 1)
            v40 = 1;
          else
            v40 = v30;
          v41 = v40 - 1;
          v42 = v30 - v41;
          if (v30 - v41 >= (unint64_t)v30)
            v42 = v30;
          v43 = v37 + 2;
          v44 = v37;
          do
          {
            if (v38 >= v31 % v36)
              v45 = v31 / v36;
            else
              v45 = v31 / v36 + 1;
            if ((uint64_t)(v31 - 1) >= v39)
              v46 = v39;
            else
              v46 = v31 - 1;
            v47 = v41 + v46 * (BytesPerRow >> 2);
            v48 = v31 - v46;
            if (v48 >= v45)
              v48 = v45;
            *(v43 - 2) = (int64_t)&BaseAddress[4 * v47];
            *(v43 - 1) = v48;
            *v43 = v42;
            v43[1] = BytesPerRow;
            v43 += 5;
            v39 += v45;
            ++v38;
          }
          while (v36 != v38);
          v49 = (char *)&v37[5 * ((40 * v36 - 40) / 0x28) + 5];
          v50 = dispatch_group_create();
          v51 = MEMORY[0x1E0C809B0];
          do
          {
            v181 = v51;
            v182 = 3221225472;
            v183 = __57__VNRemoveBackgroundProcessor__verifyImageIsFullyOpaque___block_invoke;
            v184 = &unk_1E4548110;
            v186 = v44;
            v185 = v34;
            -[VNRemoveBackgroundProcessor dispatchGroupAsyncByPreservingQueueCapacity:block:](v185, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v50, &v181);

            v44 += 5;
            --v36;
          }
          while (v36);
          v36 = (unint64_t)v37;
        }
        else
        {
          v50 = dispatch_group_create();
          v49 = 0;
        }
        objc_msgSend(v34, "dispatchGroupWait:error:", v50, 0);
        if ((char *)v36 == v49)
        {
          v87 = 1;
        }
        else
        {
          v86 = (char *)(v36 + 40);
          do
          {
            v87 = *(v86 - 8) != 0;
            if (*(v86 - 8))
              v88 = v86 == v49;
            else
              v88 = 1;
            v86 += 40;
          }
          while (!v88);
        }

        if (v36)
          operator delete((void *)v36);

        self = v128;
        v22 = v124;
        if (!v87)
        {
          v28 = v177;
LABEL_83:
          if (+[VNCVPixelBufferHelper unlockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, (__CVBuffer *)v28[3], 1uLL, a8))
          {
            v26 = (void *)MEMORY[0x1E0C9AA60];
          }
          else
          {
            v26 = 0;
          }
          goto LABEL_127;
        }
      }
    }
    v123 = v22;
    if (!context)
      goto LABEL_5;
    v203.origin.x = 0.0;
    v203.origin.y = 0.0;
    v203.size.width = 1.0;
    v203.size.height = 1.0;
    v202.origin.x = x;
    v202.origin.y = y;
    v202.size.width = width;
    v202.size.height = height;
    if (CGRectEqualToRect(v202, v203))
    {
LABEL_5:
      v23 = 0;
      v24 = 0;
      goto LABEL_6;
    }
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v136, a8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v23 = 1;
LABEL_6:
      v172 = 0;
      v173 = &v172;
      v174 = 0x2020000000;
      v175 = 0;
      v168 = 0;
      v169 = &v168;
      v170 = 0x2020000000;
      v171 = 0;
      v164 = 0;
      v165 = &v164;
      v166 = 0x2020000000;
      v167 = 0;
      v160 = 0;
      v161 = (float *)&v160;
      v162 = 0x2020000000;
      v163 = 0;
      v156 = 0;
      v157 = &v156;
      v158 = 0x2020000000;
      v159 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __129__VNRemoveBackgroundProcessor_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
      aBlock[3] = &unk_1E45480E8;
      v142 = &v172;
      v143 = &v160;
      v138 = v135;
      v139 = self;
      v153 = v123;
      v144 = &v176;
      v145 = &v164;
      v154 = v23;
      v148 = x;
      v149 = y;
      v150 = width;
      v151 = height;
      v122 = v24;
      v140 = v122;
      v121 = v136;
      v141 = v121;
      v146 = &v168;
      v147 = &v156;
      v155 = context;
      v152 = a4;
      v127 = _Block_copy(aBlock);
      if ((VNExecuteBlock(v127, (uint64_t)a8) & 1) == 0)
        goto LABEL_115;
      if (v161[6] < 0.16)
      {
        v25 = 0;
        v26 = (void *)MEMORY[0x1E0C9AA60];
LABEL_116:
        v112 = 1;
LABEL_117:
        if (*((_BYTE *)v157 + 24))
          dispatch_semaphore_wait((dispatch_semaphore_t)v128->_removeBackgroundSemaphore, 0);
        v113 = (__CVBuffer *)v177[3];
        if (v113
          && !+[VNCVPixelBufferHelper unlockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, v113, 1uLL, a8))
        {

          v25 = 0;
        }
        CVPixelBufferRelease((CVPixelBufferRef)v177[3]);
        v177[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v169[3]);
        v169[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v173[3]);
        v173[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v165[3]);
        v165[3] = 0;
        if (!v112)
        {
          if (v25)
          {
            v200 = v25;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v200, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }
        }

        _Block_object_dispose(&v156, 8);
        _Block_object_dispose(&v160, 8);
        _Block_object_dispose(&v164, 8);
        _Block_object_dispose(&v168, 8);
        _Block_object_dispose(&v172, 8);

        goto LABEL_127;
      }
      v52 = v128;
      if (!v129)
      {
        v73 = 1.0;
        v74 = 0.0;
        v75 = 0.0;
        v76 = 1.0;
        goto LABEL_91;
      }
      if (!v128)
      {
LABEL_115:
        v25 = 0;
        v26 = 0;
        goto LABEL_116;
      }
      v53 = (__CVBuffer *)v173[3];
      CVPixelBufferLockBaseAddress(v53, 1uLL);
      v118 = v53;
      v120 = a8;
      v54 = CVPixelBufferGetWidth(v53);
      v55 = CVPixelBufferGetHeight(v53);
      v56 = CVPixelBufferGetBytesPerRow(v53);
      v57 = CVPixelBufferGetBaseAddress(v53);
      objc_msgSend((id)objc_opt_class(), "detectorInternalProcessingAsyncTasksQueue");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "maximumTasksCount");
      v60 = v59;
      if (v59)
      {
        if (v59 >= 0x555555555555556)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v61 = 48 * v59;
        v62 = (int8x16_t *)operator new(48 * v59);
        v63 = v62;
        v64 = 0;
        do
        {
          v65 = &v62[v64 / 0x10];
          v65->i64[0] = -1;
          v65->i64[1] = -1;
          v65[2].i64[0] = 0;
          v65[2].i64[1] = 0;
          v64 += 48;
          v65[1].i64[0] = 0;
          v65[1].i64[1] = 0;
        }
        while (v61 != v64);
        v116 = &v62[3 * v60];
        v66 = 0;
        v67 = 0;
        v68 = &v62[2].i64[1];
        do
        {
          v69 = v55 / v60 - 1 + v67;
          if (v66 < v55 % v60)
            v69 = v55 / v60 + v67;
          *(v68 - 1) = v67;
          *v68 = v69;
          v67 = v69 + 1;
          ++v66;
          v68 += 6;
        }
        while (v60 != v66);
        v70 = dispatch_group_create();
        v71 = v63;
        do
        {
          v181 = MEMORY[0x1E0C809B0];
          v182 = 3221225472;
          v183 = __69__VNRemoveBackgroundProcessor__calculateCropSizeOfPixelBuffer_error___block_invoke;
          v184 = &unk_1E45481F8;
          v186 = (uint64_t *)v71;
          v187 = v57;
          v188 = v55;
          v189 = v54;
          v190 = v56;
          v191 = v54;
          v185 = v58;
          -[VNRemoveBackgroundProcessor dispatchGroupAsyncByPreservingQueueCapacity:block:](v185, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v70, &v181);

          v71 += 3;
          --v60;
        }
        while (v60);
        v72 = v116;
      }
      else
      {
        v70 = dispatch_group_create();
        v72 = 0;
        v63 = 0;
      }
      v77 = objc_msgSend(v58, "dispatchGroupWait:error:", v70, v120);
      v78 = 0uLL;
      v117 = 0u;
      if ((v77 & 1) == 0)
        goto LABEL_63;
      if (v63 != v72)
      {
        v79.i64[0] = -1;
        v79.i64[1] = -1;
        v80 = v63;
        do
        {
          v81 = *v80;
          v82 = v80[1];
          v80 += 3;
          v79 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v79, (uint64x2_t)v81), v81, v79);
          v78 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v78, (uint64x2_t)v82), v78, v82);
        }
        while (v80 != v72);
        if (v78.i64[0] && v78.i64[1] != 0)
        {
          v108 = 1;
          v115 = (int64x2_t)vcvtq_f64_u64((uint64x2_t)vaddq_s64(vsubq_s64((int64x2_t)v78, (int64x2_t)v79), vdupq_n_s64(1uLL)));
          v117 = (int64x2_t)vcvtq_f64_u64((uint64x2_t)v79);
          goto LABEL_64;
        }
      }
      if (v120)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("No pixels meet or exceed alpha threshold"));
        v108 = 0;
        *v120 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_63:
        v108 = 0;
      }
LABEL_64:

      if (v63)
        operator delete(v63);

      a8 = v120;
      v52 = v128;
      CVPixelBufferUnlockBaseAddress(v118, 1uLL);
      if (v108)
      {
        v84 = CVPixelBufferGetWidth((CVPixelBufferRef)v173[3]);
        v85 = CVPixelBufferGetHeight((CVPixelBufferRef)v173[3]);
        if (v84)
        {
          v74 = *(double *)v117.i64 / (double)v84;
          v73 = *(double *)v115.i64 / (double)v84;
        }
        else
        {
          v74 = 0.0;
          v73 = 0.0;
        }
        if (v85)
          v89 = vdivq_f64((float64x2_t)vzip2q_s64(v117, v115), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v85), 0));
        else
          v89 = 0uLL;
        v76 = v89.f64[1];
        v75 = 1.0 - v89.f64[0] - v89.f64[1];
LABEL_91:
        if (*((_BYTE *)v157 + 24))
          dispatch_semaphore_wait((dispatch_semaphore_t)v52->_removeBackgroundSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        if (((v129 ^ 1 | context | v123) & 1) != 0)
          goto LABEL_112;
        if (v52)
        {
          v90 = v165;
          v91 = (__CVBuffer *)v165[3];
          v92 = CVPixelBufferGetWidth(v91);
          v93 = CVPixelBufferGetHeight(v91);
          v94 = a8;
          contexta = (void *)MEMORY[0x1A1B0B060]();
          -[VNDetector metalContext](v128, "metalContext");
          v95 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
          v198 = 0;
          -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v95, v91, 80, &v198);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = v198;
          if (v96)
          {
            v98 = (double)v92;
            v99 = (double)v93;
            v197 = v97;
            v100 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)(v73 * (double)v92), (unint64_t)(v76 * (double)v93), 1111970369, &v197);
            v101 = v197;

            if (v100)
            {
              v196 = v101;
              -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v95, v100, 80, &v196);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = v196;

              if (v130)
              {
                v195 = v97;
                -[VNMetalContext commandQueueReturnError:](v95, &v195);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v126 = v195;

                if (v102)
                {
                  v125 = v100;
                  objc_msgSend(v102, "commandBuffer");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  copyCropComputeState = v128->_copyCropComputeState;
                  v104 = objc_msgSend(v130, "width");
                  v105 = objc_msgSend(v130, "height");
                  v201[0] = v96;
                  v201[1] = v130;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 2);
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  v192[0] = MEMORY[0x1E0C809B0];
                  v192[1] = 3221225472;
                  v192[2] = __81__VNRemoveBackgroundProcessor__cropInOutPixelBuffer_normalizedBoundingBox_error___block_invoke;
                  v192[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
                  v194 = (int)((1.0 - v75 - v76) * v99);
                  v193 = (int)(v74 * v98);
                  -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:]((uint64_t)v95, v103, copyCropComputeState, v104, v105, v106, v192);

                  v100 = v125;
                  v181 = MEMORY[0x1E0C809B0];
                  v182 = 3221225472;
                  v183 = __81__VNRemoveBackgroundProcessor__cropInOutPixelBuffer_normalizedBoundingBox_error___block_invoke_2;
                  v184 = &unk_1E45481A8;
                  v185 = v128;
                  objc_msgSend(v103, "addCompletedHandler:", &v181);
                  objc_msgSend(v103, "commit");
                  objc_msgSend(v103, "waitUntilCompleted");

                  v107 = 0;
                }
                else
                {
                  v199 = 0;
                  v107 = 1;
                }

                v97 = v126;
              }
              else
              {
                v199 = 0;
                v107 = 1;
              }

            }
            else
            {
              v199 = 0;
              v107 = 1;
              v97 = v101;
            }
          }
          else
          {
            v100 = 0;
            v199 = 0;
            v107 = 1;
          }

          objc_autoreleasePoolPop(contexta);
          CVPixelBufferRelease(v91);
          v90[3] = (uint64_t)v100;
          if (v94 && v97)
            *v94 = objc_retainAutorelease(v97);
          if (!v107)
            v199 = 1;

          a8 = v94;
          if (v199 == 1)
          {
LABEL_112:
            +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v121, a8, *(_OWORD *)&v115);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            if (v109)
            {
              v110 = [VNPixelBufferObservation alloc];
              v25 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:](v110, "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v109, 0, v165[3]);
              *(float *)&v111 = v161[6];
              objc_msgSend(v25, "setConfidence:", v111);
              v112 = 0;
              if (v25)
              {
                v25[14] = v74;
                v25[15] = v75;
                v25[16] = v73;
                v25[17] = v76;
              }
            }
            else
            {
              v25 = 0;
              v112 = 1;
            }

            v26 = 0;
            goto LABEL_117;
          }
        }
        goto LABEL_115;
      }
      goto LABEL_115;
    }
    goto LABEL_36;
  }
  v26 = 0;
LABEL_128:

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeBackgroundSemaphore, 0);
  objc_storeStrong((id *)&self->_copyCropComputeState, 0);
  objc_storeStrong((id *)&self->_applyMaskComputeState, 0);
  objc_storeStrong((id *)&self->_assembleConstraintsState, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
}

uint64_t __129__VNRemoveBackgroundProcessor_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  __CVBuffer *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  float v19;
  int *v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  __int128 *v25;
  __int128 *v26;
  unint64_t v27;
  __int128 *v28;
  __int128 *v29;
  __int128 *v30;
  __int128 *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  __int128 *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  char *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 *p_aBlock;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  __int128 *v58;
  unint64_t v59;
  __int128 *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  char v66;
  void *v67;
  int v68;
  double v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  int v76;
  size_t Width;
  size_t Height;
  const __CFString *v79;
  CFTypeRef v80;
  uint64_t v81;
  uint64_t v82;
  unsigned __int8 *v83;
  unsigned int v84;
  _QWORD *v85;
  unint64_t *v86;
  unint64_t *v87;
  unint64_t v89;
  unint64_t *v90;
  unint64_t v91;
  unint64_t v92;
  BOOL v93;
  unint64_t v94;
  char *v95;
  unint64_t i;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t j;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unsigned int v117;
  int v118;
  unsigned __int8 v119;
  __int128 aBlock;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  char *v128;
  void **v129;
  uint64_t v130;
  uint64_t v131;

  v3 = a1;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 24) = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "pixelBuffer"));
    objc_msgSend(*(id *)(v3 + 32), "confidence");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8) + 24) = v5;
LABEL_3:
    if (*(_BYTE *)(v3 + 153))
    {
      v6 = *(double *)(v3 + 112);
      v7 = *(double *)(v3 + 120);
      v8 = *(double *)(v3 + 128);
      v9 = *(double *)(v3 + 136);
      v10 = objc_msgSend(*(id *)(v3 + 48), "width");
      v11 = objc_msgSend(*(id *)(v3 + 48), "height");
      result = objc_msgSend(*(id *)(v3 + 48), "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(v8 * (double)v10), (unint64_t)(v9 * (double)v11), 1111970369, *(_QWORD *)(v3 + 56), a2, v6 * (double)v10, v7 * (double)v11);
      v13 = (__CVBuffer *)result;
      if (!result)
        return result;
    }
    else
    {
      v13 = *(__CVBuffer **)(v3 + 144);
    }
    v62 = *(_QWORD *)(v3 + 40);
    v63 = MEMORY[0x1E0C809B0];
    if (v62)
    {
      v64 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 24);
      v128 = 0;
      v129 = (void **)&v128;
      v130 = 0x2020000000;
      v131 = 0;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 3221225472;
      *(_QWORD *)&v121 = __67__VNRemoveBackgroundProcessor__upsampleLowResMask_reference_error___block_invoke;
      *((_QWORD *)&v121 + 1) = &unk_1E4548138;
      *(_QWORD *)&v122 = v62;
      *((_QWORD *)&v122 + 1) = &v128;
      *(_QWORD *)&v123 = v13;
      *((_QWORD *)&v123 + 1) = v64;
      v65 = _Block_copy(&aBlock);
      v66 = VNExecuteBlock(v65, (uint64_t)a2);
      v67 = v129[3];
      if ((v66 & 1) == 0)
      {
        CVPixelBufferRelease((CVPixelBufferRef)v129[3]);
        v67 = 0;
        v129[3] = 0;
      }

      _Block_object_dispose(&v128, 8);
    }
    else
    {
      v67 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 96) + 8) + 24) = v67;
    if (*(_BYTE *)(v3 + 153))
      CVPixelBufferRelease(v13);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 96) + 8) + 24))
      return 0;
    if (*(_BYTE *)(v3 + 154))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8) + 24) = CVPixelBufferRetain(*(CVPixelBufferRef *)(v3 + 144));
      goto LABEL_84;
    }
    Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(v3 + 144));
    Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v3 + 144));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, Height, 1111970369, a2);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8) + 24))
    {
      v79 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
      if (CVBufferHasAttachment(*(CVBufferRef *)(v3 + 144), (CFStringRef)*MEMORY[0x1E0CA8CD8]))
      {
        LODWORD(aBlock) = 0;
        v80 = CVBufferCopyAttachment(*(CVBufferRef *)(v3 + 144), v79, (CVAttachmentMode *)&aBlock);
        CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8) + 24), v79, v80, (CVAttachmentMode)aBlock);
        CFRelease(v80);
      }
LABEL_84:
      v68 = *(unsigned __int8 *)(v3 + 153);
      if (*(_BYTE *)(v3 + 153))
      {
        objc_msgSend(*(id *)(v3 + 48), "width");
        objc_msgSend(*(id *)(v3 + 48), "height");
        VisionCoreImagePointForNormalizedPoint();
        HIWORD(v118) = (int)v70;
        LOWORD(v118) = (int)v69;
        v68 = v118;
      }
      v71 = *(_QWORD *)(v3 + 40);
      if (v71)
      {
        v72 = *(_QWORD *)(v3 + 144);
        v73 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8) + 24);
        v74 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 96) + 8) + 24);
        *(_QWORD *)&aBlock = v63;
        *((_QWORD *)&aBlock + 1) = 3221225472;
        *(_QWORD *)&v121 = __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke;
        *((_QWORD *)&v121 + 1) = &unk_1E45481D0;
        *(_QWORD *)&v122 = v71;
        *((_QWORD *)&v122 + 1) = v72;
        *(_QWORD *)&v123 = v73;
        *((_QWORD *)&v123 + 1) = v74;
        LODWORD(v124) = v68;
        v75 = _Block_copy(&aBlock);
        v76 = VNExecuteBlock(v75, (uint64_t)a2);

        if (v76)
        {
          result = 1;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 104) + 8) + 24) = 1;
          return result;
        }
      }
    }
    return 0;
  }
  v14 = *(_QWORD *)(v3 + 40);
  if (!v14)
    return 0;
  v15 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 8);
  v16 = *(_QWORD *)(*(_QWORD *)(v3 + 72) + 8);
  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 80) + 8) + 24);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "input_image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_msgSend((id)v14, "bindLockedPixelBuffer:toNetworkInputBlobName:error:", v17, v18, a2);

  if ((v17 & 1) == 0)
    return 0;
  result = objc_msgSend((id)v14, "executePlanAndReturnError:", a2);
  if (!(_DWORD)result)
    return result;
  v19 = **(float **)(v14 + 272);
  *(float *)(v16 + 24) = v19;
  if (v19 < 0.16)
    goto LABEL_132;
  v20 = &OBJC_IVAR___VNCIContextManager__gpuContextsHandlers;
  v21 = (char *)operator new[]();
  v23 = *(_QWORD *)(v14 + 184);
  v22 = *(_QWORD *)(v14 + 192);
  v115 = *(_QWORD *)(v14 + 104);
  v24 = *(_QWORD *)(v14 + 232);
  bzero(v21, v23 * v22);
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  aBlock = 0u;
  v121 = 0u;
  if (!v22)
  {
    v61 = 1;
    goto LABEL_99;
  }
  v108 = v15;
  v109 = a2;
  v110 = v3;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v113 = 0;
  v116 = 4 * v24;
  if (v23 <= 1)
    v32 = 1;
  else
    v32 = v23;
  v117 = 1;
  v33 = v23;
  v34 = v115;
  v111 = v32;
  while (!v33)
  {
LABEL_70:
    if (++v113 == v22)
    {
      if (v31)
        operator delete(v31);
      v61 = v117;
      goto LABEL_97;
    }
  }
  v35 = 0;
  v36 = &v21[v113 * v23];
  v37 = v34 + v113 * v116;
  v112 = v37;
  while (1)
  {
    if (v36[v35] || *(float *)(v37 + 4 * v35) < 0.4)
      goto LABEL_68;
    v36[v35] = v117;
    v114 = v35;
    if ((unint64_t)v30 >= v27)
    {
      v39 = v30 - v29;
      v40 = v39 + 1;
      if ((unint64_t)(v39 + 1) >> 60)
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      if ((uint64_t)(v27 - (_QWORD)v29) >> 3 > v40)
        v40 = (uint64_t)(v27 - (_QWORD)v29) >> 3;
      if (v27 - (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0)
        v40 = 0xFFFFFFFFFFFFFFFLL;
      if (v40)
      {
        v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v40);
        v29 = v25;
        v30 = v26;
      }
      else
      {
        v41 = 0;
      }
      v42 = (_QWORD *)(v40 + 16 * v39);
      *v42 = v113;
      v42[1] = v35;
      if (v30 == v29)
      {
        v25 = (__int128 *)(v40 + 16 * v39);
      }
      else
      {
        v43 = (char *)(v40 + 16 * v39);
        do
        {
          *((_OWORD *)v43 - 1) = *(v30 - 1);
          v43 -= 16;
          --v30;
        }
        while (v30 != v29);
        v29 = v25;
        v25 = (__int128 *)v43;
      }
      v27 = v40 + 16 * v41;
      v38 = (__int128 *)(v42 + 2);
      if (v29)
        operator delete(v29);
      v28 = v25;
    }
    else
    {
      *(_QWORD *)v30 = v113;
      *((_QWORD *)v30 + 1) = v35;
      v38 = v30 + 1;
    }
    v44 = v117;
    v26 = v28;
    v45 = v116;
    if (v28 != v38)
    {
      do
      {
        v46 = 0;
        v47 = *((_QWORD *)v38 - 2);
        v48 = *((_QWORD *)v38-- - 1);
        *(_QWORD *)&aBlock = v47 - 1;
        *((_QWORD *)&aBlock + 1) = v48 - 1;
        *(_QWORD *)&v121 = v47 - 1;
        *((_QWORD *)&v121 + 1) = v48;
        *(_QWORD *)&v123 = v47;
        *((_QWORD *)&v123 + 1) = v48 - 1;
        *(_QWORD *)&v124 = v47;
        *((_QWORD *)&v124 + 1) = v48 - 1;
        *(_QWORD *)&v125 = v47 + 1;
        *((_QWORD *)&v125 + 1) = v48 - 1;
        *(_QWORD *)&v122 = v47 - 1;
        *((_QWORD *)&v122 + 1) = v48 + 1;
        *(_QWORD *)&v126 = v47 + 1;
        *((_QWORD *)&v126 + 1) = v48;
        p_aBlock = &aBlock;
        *(_QWORD *)&v127 = v47 + 1;
        *((_QWORD *)&v127 + 1) = v48 + 1;
        do
        {
          v50 = *(_QWORD *)p_aBlock;
          if ((*(_QWORD *)p_aBlock & 0x8000000000000000) == 0 && v50 < v22)
          {
            v51 = *((_QWORD *)&aBlock + 2 * v46 + 1);
            if ((v51 & 0x8000000000000000) == 0 && v51 < v23)
            {
              v52 = *((_QWORD *)p_aBlock + 1);
              v53 = &v21[v50 * v23];
              if (!v53[v52] && *(float *)(v34 + v50 * v45 + 4 * v52) > 0.4)
              {
                v53[v52] = v44;
                if ((unint64_t)v38 >= v27)
                {
                  v54 = v38 - v25;
                  v55 = v54 + 1;
                  if ((unint64_t)(v54 + 1) >> 60)
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  if ((uint64_t)(v27 - (_QWORD)v25) >> 3 > v55)
                    v55 = (uint64_t)(v27 - (_QWORD)v25) >> 3;
                  if (v27 - (unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0)
                    v56 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v56 = v55;
                  if (v56)
                    v56 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v56);
                  else
                    v57 = 0;
                  v58 = (__int128 *)(v56 + 16 * v54);
                  *v58 = *p_aBlock;
                  if (v38 == v25)
                  {
                    v60 = (__int128 *)(v56 + 16 * v54);
                  }
                  else
                  {
                    v59 = v56 + 16 * v54;
                    do
                    {
                      v60 = (__int128 *)(v59 - 16);
                      *(_OWORD *)(v59 - 16) = *--v38;
                      v59 -= 16;
                    }
                    while (v38 != v25);
                  }
                  v27 = v56 + 16 * v57;
                  v38 = v58 + 1;
                  if (v25)
                    operator delete(v25);
                  v25 = v60;
                  v34 = v115;
                  v45 = v116;
                  v44 = v117;
                }
                else
                {
                  *v38++ = *p_aBlock;
                }
              }
            }
          }
          ++v46;
          p_aBlock = &aBlock + v46;
        }
        while (v46 != 8);
        v26 = v38;
        v28 = v25;
      }
      while (v25 != v38);
    }
    if (v44 == 255)
      break;
    v117 = v44 + 1;
    v29 = v28;
    v30 = v28;
    v31 = v28;
    v32 = v111;
    v37 = v112;
    v35 = v114;
    v36 = &v21[v113 * v23];
LABEL_68:
    if (++v35 == v32)
    {
      v33 = v23;
      goto LABEL_70;
    }
  }
  if (v28)
    operator delete(v28);
  v61 = 256;
LABEL_97:
  a2 = v109;
  v3 = v110;
  v15 = v108;
  v20 = &OBJC_IVAR___VNCIContextManager__gpuContextsHandlers;
LABEL_99:
  std::vector<unsigned long>::vector(&aBlock, v61);
  v81 = *(_QWORD *)(v14 + 192) * *(_QWORD *)(v14 + 184);
  if (v81)
  {
    v82 = aBlock;
    v83 = (unsigned __int8 *)v21;
    do
    {
      v84 = *v83++;
      ++*(_QWORD *)(v82 + 8 * v84);
      --v81;
    }
    while (v81);
  }
  v119 = 0;
  std::vector<BOOL>::vector(&v128, v61, &v119);
  v85 = (_QWORD *)aBlock;
  v86 = (unint64_t *)(aBlock + 8);
  v87 = (unint64_t *)(aBlock + 16);
  if ((_QWORD)aBlock + 8 != *((_QWORD *)&aBlock + 1) && v87 != *((unint64_t **)&aBlock + 1))
  {
    v89 = *v86;
    v90 = (unint64_t *)(aBlock + 16);
    do
    {
      v92 = *v90++;
      v91 = v92;
      v93 = v89 >= v92;
      if (v89 <= v92)
        v89 = v91;
      if (!v93)
        v86 = v87;
      v87 = v90;
    }
    while (v90 != *((unint64_t **)&aBlock + 1));
  }
  if (v61 >= 2)
  {
    v94 = (unint64_t)(float)((float)*v86 * 0.3);
    v95 = v128;
    for (i = 1; i != v61; ++i)
    {
      v97 = i >> 6;
      v98 = 1 << i;
      if (v85[i] >= v94)
        v99 = *(_QWORD *)&v95[8 * v97] | v98;
      else
        v99 = *(_QWORD *)&v95[8 * v97] & ~v98;
      *(_QWORD *)&v95[8 * v97] = v99;
    }
  }
  v100 = *(_QWORD *)(v14 + 192);
  v101 = v128;
  if (v100)
  {
    v102 = 0;
    v103 = 4 * *(_QWORD *)(v14 + 232);
    v104 = *(_QWORD *)(v14 + 104);
    v105 = *(_QWORD *)(v14 + 184);
    v106 = v21;
    do
    {
      if (v105)
      {
        for (j = 0; j != v105; ++j)
        {
          if (((*(_QWORD *)&v101[((unint64_t)v106[j] >> 3) & 0x18] >> v106[j]) & 1) == 0)
            *(_DWORD *)(v104 + 4 * j) = 0;
        }
      }
      ++v102;
      v104 += v103;
      v106 += v105;
    }
    while (v102 != v100);
    v101 = v128;
  }
  if (v101)
  {
    operator delete(v101);
    v85 = (_QWORD *)aBlock;
  }
  if (v85)
  {
    *((_QWORD *)&aBlock + 1) = v85;
    operator delete(v85);
  }
  MEMORY[0x1A1B0A880](v21, 0x1000C8077774924);
  result = +[VNEspressoHelpers createCVPixelBufferWithPixelFormat:fromImageInEspressoBuffer:error:](VNEspressoHelpers, "createCVPixelBufferWithPixelFormat:fromImageInEspressoBuffer:error:", 1278226534, v14 + v20[292], a2);
  *(_QWORD *)(v15 + 24) = result;
  if (!result)
    return result;
LABEL_132:
  if (*(float *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8) + 24) < 0.16)
    return 1;
  if (!*(_BYTE *)(v3 + 152))
    goto LABEL_3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8) + 24) = CVPixelBufferRetain(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 24));
  return 1;
}

uint64_t __81__VNRemoveBackgroundProcessor__cropInOutPixelBuffer_normalizedBoundingBox_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBytes:length:atIndex:", a1 + 32, 4, 0);
}

intptr_t __81__VNRemoveBackgroundProcessor__cropInOutPixelBuffer_normalizedBoundingBox_error___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 472));
}

uint64_t __69__VNRemoveBackgroundProcessor__calculateCropSizeOfPixelBuffer_error___block_invoke(uint64_t a1)
{
  uint64x2_t *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64x2_t v9;
  int8x16_t v10;
  int8x16_t v11;

  v1 = *(uint64x2_t **)(a1 + 40);
  v2 = v1[2].u64[0];
  v3 = v1[2].u64[1];
  if (v2 <= v3)
  {
    v4 = *(_QWORD *)(a1 + 80);
    v5 = *(_QWORD *)(a1 + 72) >> 2;
    v6 = *(_QWORD *)(a1 + 48) + 4 * v2 * v5;
    v7 = 4 * v5;
    do
    {
      if (v4)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(float *)(v6 + 4 * i) > 0.0)
          {
            v9.i64[0] = i;
            v9.i64[1] = v2;
            v10 = vbslq_s8((int8x16_t)vcgtq_u64(*v1, v9), (int8x16_t)v9, *(int8x16_t *)v1);
            v11 = vbslq_s8((int8x16_t)vcgtq_u64(v1[1], v9), (int8x16_t)v1[1], (int8x16_t)v9);
            *v1 = (uint64x2_t)v10;
            v1[1] = (uint64x2_t)v11;
          }
        }
      }
      ++v2;
      v6 += v7;
    }
    while (v2 <= v3);
  }
  return objc_msgSend(*(id *)(a1 + 32), "dispatchReportBlockCompletion");
}

BOOL __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  int v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "metalContext");
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v4, *(CVPixelBufferRef *)(a1 + 40), 80, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v4, *(CVPixelBufferRef *)(a1 + 48), 80, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v4, *(CVPixelBufferRef *)(a1 + 56), 55, a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[VNMetalContext commandQueueReturnError:](v4, a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = v8 != 0;
        if (v8)
        {
          objc_msgSend(v8, "commandBuffer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
          v15 = objc_msgSend(v7, "width");
          v12 = objc_msgSend(v7, "height");
          v20[0] = v7;
          v20[1] = v5;
          v20[2] = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_2;
          v18[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
          v19 = *(_DWORD *)(a1 + 64);
          -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:]((uint64_t)v4, v11, v16, v15, v12, v13, v18);

          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_3;
          v17[3] = &unk_1E45481A8;
          v17[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend(v11, "addCompletedHandler:", v17);
          objc_msgSend(v11, "commit");

        }
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBytes:length:atIndex:", a1 + 32, 4, 0);
}

intptr_t __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 472));
}

BOOL __67__VNRemoveBackgroundProcessor__upsampleLowResMask_reference_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  size_t Width;
  size_t Height;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  void *v14;
  id v15;
  void (**v16)(void *, uint64_t, uint64_t, uint64_t);
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD *v57;
  id v58;
  _QWORD aBlock[4];
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[3];
  _QWORD v66[5];

  v66[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "metalContext");
  v57 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, Height, 1278226534, a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v6 = (void *)MEMORY[0x1A1B0B060]();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 40);
    v65[0] = *(_QWORD *)(a1 + 56);
    v65[1] = v7;
    v65[2] = *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    -[VNMetalContext bindPixelBuffersToTextures:error:](v57, v9, &v58);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v58;

    objc_autoreleasePoolPop(v6);
    if (!v54)
    {
      v33 = 0;
      if (a2)
        *a2 = objc_retainAutorelease(v52);
      goto LABEL_22;
    }
    objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v43;
    v56 = v11;
    if (v10)
    {
      objc_msgSend(v10, "metalContext");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (os_unfair_lock_s *)v12;
      if (v12)
        v14 = *(void **)(v12 + 8);
      else
        v14 = 0;
      v15 = v14;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__VNRemoveBackgroundProcessor__createConstraintsTextureFromMask_error___block_invoke;
      aBlock[3] = &unk_1E4548160;
      v53 = v15;
      v60 = v53;
      v16 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(aBlock);
      -[VNMetalContext commandQueueReturnError:](v13, a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v17;
      if (v17)
      {
        objc_msgSend(v17, "commandBuffer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v56, "width");
        v20 = objc_msgSend(v56, "height");
        v16[2](v16, v19, v20, 10);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, v19, v20, 10);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, v19, v20, 10);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, v19, v20, 10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_alloc(MEMORY[0x1E0CC6EB8]);
        LODWORD(v23) = 1063675494;
        LODWORD(v24) = 1.0;
        v46 = (void *)objc_msgSend(v22, "initWithDevice:thresholdValue:maximumValue:linearGrayColorTransform:", v53, 0, v23, v24);
        v44 = (uint64_t)v13;
        v25 = objc_alloc(MEMORY[0x1E0CC6EC0]);
        LODWORD(v26) = 1036831949;
        LODWORD(v27) = 1.0;
        v45 = (void *)objc_msgSend(v25, "initWithDevice:thresholdValue:maximumValue:linearGrayColorTransform:", v53, 0, v26, v27);
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E00]), "initWithDevice:kernelWidth:kernelHeight:", v53, 25, 25);
        objc_msgSend(v46, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v18, v56, v21);
        objc_msgSend(v28, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v18, v21, v49);
        objc_msgSend(v45, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v18, v56, v21);
        objc_msgSend(v28, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v18, v21, v48);
        v29 = (void *)v10[56];
        v30 = objc_msgSend(v55, "width");
        v31 = objc_msgSend(v55, "height");
        v66[0] = v49;
        v66[1] = v48;
        v66[2] = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v44, v18, v29, v30, v31, v32, 0);

        objc_msgSend(v18, "commit");
        v13 = (os_unfair_lock_s *)v44;

      }
      else
      {
        v55 = 0;
      }

      v34 = v55;
      if (v55)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440))
          goto LABEL_15;
        v64 = v56;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNMetalContext createGuidedFilterForTextures:referenceTexture:error:](v57, v35, v51, a2);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = *(_QWORD *)(a1 + 32);
        v38 = *(void **)(v37 + 440);
        *(_QWORD *)(v37 + 440) = v36;

        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440))
        {
LABEL_15:
          v63 = v56;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v55;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v50;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[VNMetalContext upsampleTextures:referenceTexture:constraintsTextures:upsampledTextures:filter:waitForCompletion:error:]((_BOOL8)v57, v39, v51, v40, v41, *(void **)(*(_QWORD *)(a1 + 32) + 440), 0, a2);

        }
        else
        {
          v33 = 0;
        }
        v34 = v55;
        goto LABEL_21;
      }
    }
    else
    {

      v34 = 0;
    }
    v33 = 0;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v33 = 0;
LABEL_23:

  return v33;
}

id __71__VNRemoveBackgroundProcessor__createConstraintsTextureFromMask_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, a2, a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsage:", 3);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v5);

  return v6;
}

uint64_t __57__VNRemoveBackgroundProcessor__verifyImageIsFullyOpaque___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int8x16_t *v4;
  uint64_t v5;
  int8x16_t v6;
  uint64_t v7;
  int8x16_t *v8;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(v1 + 8);
  if (v2 < 1)
  {
LABEL_8:
    *(_BYTE *)(v1 + 32) = 1;
  }
  else
  {
    v3 = 0;
    v4 = *(int8x16_t **)v1;
    v5 = *(_QWORD *)(v1 + 16);
    v6.i64[0] = 0xFF000000FF000000;
    v6.i64[1] = 0xFF000000FF000000;
    while (v5 < 1)
    {
LABEL_7:
      ++v3;
      v4 = (int8x16_t *)((char *)v4 + (*(_QWORD *)(v1 + 24) & 0xFFFFFFFFFFFFFFFCLL));
      if (v3 == v2)
        goto LABEL_8;
    }
    v7 = 0;
    v8 = v4;
    while ((vminvq_u8((uint8x16_t)vceqq_s8(vandq_s8(*v8, v6), v6)) & 0x80) != 0)
    {
      v7 += 4;
      ++v8;
      if (v7 >= v5)
        goto LABEL_7;
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dispatchReportBlockCompletion");
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allGPUComputeDevices](VNComputeDeviceUtilities, "allGPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "subject_lifting_gen1_rev5_gv8dsz6vxu_multihead_int8.espresso");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "input_image");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
