@implementation VNAnimalBodyPoseDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allComputeDevices](VNComputeDeviceUtilities, "allComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VNAnimalBodyPoseDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __65__VNAnimalBodyPoseDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNAnimalBodyPoseDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNAnimalBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  VCPPetsPoseImageRequest *v9;
  VCPPetsPoseImageRequest *animalBodyPoseDetector;
  BOOL v11;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNAnimalBodyPoseDetector;
  if (!-[VNDetector completeInitializationForSession:error:](&v13, sel_completeInitializationForSession_error_, v6, a4))
    goto LABEL_8;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v7 = (void *)getVCPPetsPoseImageRequestClass(void)::softClass;
  v18 = getVCPPetsPoseImageRequestClass(void)::softClass;
  if (!getVCPPetsPoseImageRequestClass(void)::softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___ZL31getVCPPetsPoseImageRequestClassv_block_invoke;
    v14[3] = &unk_1E4548FA8;
    v14[4] = &v15;
    ___ZL31getVCPPetsPoseImageRequestClassv_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v15, 8);
  v9 = (VCPPetsPoseImageRequest *)objc_msgSend([v8 alloc], "initWithOptions:", 0);
  animalBodyPoseDetector = self->_animalBodyPoseDetector;
  self->_animalBodyPoseDetector = v9;

  if (!self->_animalBodyPoseDetector)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to initialize VCP Animal Pose Detector"));
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __CVBuffer *v25;
  id v26;
  BOOL v27;
  id v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v17, "width");
    v20 = objc_msgSend(v18, "height");
    v30.origin.x = x * (double)v19;
    v30.size.width = width * (double)v19;
    v30.origin.y = y * (double)v20;
    v30.size.height = height * (double)v20;
    v31 = CGRectIntegral(v30);
    v21 = v31.origin.x;
    v22 = v31.origin.y;
    v23 = v31.size.width;
    v24 = v31.size.height;
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", self->_animalBodyPoseDetector != 0, CFSTR("VCP Animal Pose Detector must be initialized"));
    v29 = 0;
    v25 = (__CVBuffer *)objc_msgSend(v18, "createCroppedBufferWithMaxSideLengthOf:cropRect:pixelFormat:options:error:pixelBufferRepsCacheKey:", 580, 1111970369, v16, a8, &v29, v21, v22, v23, v24);
    v26 = v29;
    *a7 = v25;
    v27 = v25 != 0;
    if (v25)
      -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v16, v26, v18);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  VNAnimalBodyPoseObservation *v19;
  id v20;
  id *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  -[VCPPetsPoseImageRequest processImage:withOptions:error:](self->_animalBodyPoseDetector, "processImage:withOptions:error:", a4, 0, a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v22 = a8;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v23, "count"));
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v23;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v15);
            v19 = -[VNRecognizedPointsObservation initWithOriginatingRequestSpecifier:keypointReturningObservation:]([VNAnimalBodyPoseObservation alloc], "initWithOriginatingRequestSpecifier:keypointReturningObservation:", v13, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            if (!v19)
            {
              if (v22)
              {
                +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to create observation"));
                *v22 = (id)objc_claimAutoreleasedReturnValue();
              }

              v20 = 0;
              goto LABEL_16;
            }
            -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v12, v19);
            objc_msgSend(v14, "addObject:", v19);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v16)
            continue;
          break;
        }
      }

      v20 = v14;
LABEL_16:

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animalBodyPoseDetector, 0);
}

@end
