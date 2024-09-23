@implementation VNHumanPoseDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VNHumanPoseDetectorInitOption_UseCPUOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v10 = CFSTR("VNComputeStageMain");
  if (v6)
    +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices");
  else
    +[VNComputeDeviceUtilities allComputeDevices](VNComputeDeviceUtilities, "allComputeDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VNHumanPoseDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (Class)recognizedPointsObservationClass
{
  return (Class)objc_opt_class();
}

void __60__VNHumanPoseDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNHumanPoseDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  objc_msgSend(v2, "addObject:", CFSTR("VNHumanPoseDetectorInitOption_UseCPUOnly"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNHumanPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)needsMetalContext
{
  return 0;
}

- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id result;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v12, CFSTR("VNHumanPoseDetectorInitOption_UseCPUOnly"), v5, 0, a4))
  {
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v8 = (_QWORD *)getVCPRequestForceCPUPropertyKeySymbolLoc(void)::ptr;
  v16 = getVCPRequestForceCPUPropertyKeySymbolLoc(void)::ptr;
  if (!getVCPRequestForceCPUPropertyKeySymbolLoc(void)::ptr)
  {
    v9 = (void *)VideoProcessingLibrary();
    v8 = dlsym(v9, "VCPRequestForceCPUPropertyKey");
    v14[3] = (uint64_t)v8;
    getVCPRequestForceCPUPropertyKeySymbolLoc(void)::ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v13, 8);
  if (v8)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *v8);

    v10 = v6;
LABEL_7:

    return v10;
  }
  dlerror();
  result = (id)abort_report_np();
  __break(1u);
  return result;
}

- (id)vcpPoseRequestRuntimeOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id result;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = 0;
    goto LABEL_10;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v7, "width"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v10 = (_QWORD *)getVCPRequestFrameWidthPropertyKeySymbolLoc(void)::ptr;
  v19 = getVCPRequestFrameWidthPropertyKeySymbolLoc(void)::ptr;
  if (!getVCPRequestFrameWidthPropertyKeySymbolLoc(void)::ptr)
  {
    v11 = (void *)VideoProcessingLibrary();
    v10 = dlsym(v11, "VCPRequestFrameWidthPropertyKey");
    v17[3] = (uint64_t)v10;
    getVCPRequestFrameWidthPropertyKeySymbolLoc(void)::ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v16, 8);
  if (v10)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v7, "height"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v13 = (_QWORD *)getVCPRequestFrameHeightPropertyKeySymbolLoc(void)::ptr;
    v19 = getVCPRequestFrameHeightPropertyKeySymbolLoc(void)::ptr;
    if (!getVCPRequestFrameHeightPropertyKeySymbolLoc(void)::ptr)
    {
      v14 = (void *)VideoProcessingLibrary();
      v13 = dlsym(v14, "VCPRequestFrameHeightPropertyKey");
      v17[3] = (uint64_t)v13;
      getVCPRequestFrameHeightPropertyKeySymbolLoc(void)::ptr = (uint64_t)v13;
    }
    _Block_object_dispose(&v16, 8);
    if (v13)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *v13);

LABEL_10:
      return v8;
    }
  }
  dlerror();
  result = (id)abort_report_np();
  __break(1u);
  return result;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v11;
  double height;
  double width;
  double y;
  double x;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  uint64_t v34;
  unint64_t v35;
  __CVBuffer *v36;
  id v37;
  id v39;
  _QWORD aBlock[5];
  id v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[5];
  id v49;
  CGRect v50;
  CGRect v51;

  v11 = *(_QWORD *)&a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = objc_msgSend(v18, "width");
    v21 = objc_msgSend(v19, "height");
    v50.origin.x = x * (double)v20;
    v50.size.width = width * (double)v20;
    v50.origin.y = y * (double)v21;
    v50.size.height = height * (double)v21;
    v51 = CGRectIntegral(v50);
    v22 = v51.origin.x;
    v23 = v51.origin.y;
    v24 = v51.size.width;
    v25 = v51.size.height;
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", self->_humanPoseDetector != 0, CFSTR("Human Pose Request is not initialized"));
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__10395;
    v48[4] = __Block_byref_object_dispose__10396;
    v49 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __117__VNHumanPoseDetector_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
    aBlock[3] = &unk_1E4544DA0;
    v42 = v48;
    aBlock[4] = self;
    v26 = v17;
    v41 = v26;
    v43 = &v44;
    v27 = _Block_copy(aBlock);
    objc_msgSend((id)objc_opt_class(), "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v27, self, v11, a8);
    if (!*((_BYTE *)v45 + 24)
      || (-[VCPRequest preferredInputSizeWithOptions:error:](self->_humanPoseDetector, "preferredInputSizeWithOptions:error:", 0, a8), v30 = v29, v31 = v28, v32 = *MEMORY[0x1E0C9D820], *MEMORY[0x1E0C9D820] == v30)&& (v32 = *(double *)(MEMORY[0x1E0C9D820] + 8), v32 == v28))
    {
      v33 = 0;
    }
    else
    {
      v34 = -[VCPRequest preferredPixelFormat](self->_humanPoseDetector, "preferredPixelFormat", v32);
      if ((v34 & 0xFFFFFFEF) == 0x34323066)
        v35 = ((unint64_t)v30 + 1) & 0xFFFFFFFFFFFFFFFELL;
      else
        v35 = (unint64_t)v30;
      v39 = 0;
      v36 = (__CVBuffer *)objc_msgSend(v19, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v35, (unint64_t)v31, v34, v26, a8, &v39, v22, v23, v24, v25);
      v37 = v39;
      *a7 = v36;
      v33 = v36 != 0;
      if (v36)
        -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v26, v37, v19);

    }
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(v48, 8);

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  id *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  -[VCPRequest processImage:withOptions:error:](self->_humanPoseDetector, "processImage:withOptions:error:", a4, 0, a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (objc_class *)objc_msgSend((id)objc_opt_class(), "recognizedPointsObservationClass");
      v23 = a8;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = v24;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v16);
            v20 = (void *)objc_msgSend([v14 alloc], "initWithOriginatingRequestSpecifier:keypointReturningObservation:", v13, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
            if (!v20)
            {
              if (v23)
              {
                +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to create observation"));
                *v23 = (id)objc_claimAutoreleasedReturnValue();
              }

              v21 = 0;
              goto LABEL_16;
            }
            -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v12, v20);
            objc_msgSend(v15, "addObject:", v20);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v17)
            continue;
          break;
        }
      }

      v21 = v15;
LABEL_16:

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanPoseDetector, 0);
}

uint64_t __117__VNHumanPoseDetector_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "vcpPoseRequestRuntimeOptionsForDetectorOptions:error:", *(_QWORD *)(a1 + 40), a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "updateWithOptions:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 40), a2);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

@end
