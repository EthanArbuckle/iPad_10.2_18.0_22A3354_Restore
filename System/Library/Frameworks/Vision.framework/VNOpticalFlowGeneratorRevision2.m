@implementation VNOpticalFlowGeneratorRevision2

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("VNComputeStageMain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__VNOpticalFlowGeneratorRevision2_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __72__VNOpticalFlowGeneratorRevision2_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNOpticalFlowGeneratorRevision2;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNOpticalFlowGeneratorOption_ComputationAccuracy"));
  objc_msgSend(v2, "addObject:", CFSTR("VNOpticalFlowGeneratorInitOption_PortraitMode"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNOpticalFlowGeneratorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  VCPMotionFlowRequest *v20;
  VCPMotionFlowRequest *motionFlowRequest;
  VCPMotionFlowRequest *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  unint64_t v35;
  objc_super v36;
  _QWORD v37[4];
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)VNOpticalFlowGeneratorRevision2;
  if (-[VNDetector completeInitializationForSession:error:](&v36, sel_completeInitializationForSession_error_, a3))
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v35, CFSTR("VNOpticalFlowGeneratorOption_ComputationAccuracy"), v6, a4))goto LABEL_27;
    if (v35 >= 4)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v7, CFSTR("VNOpticalFlowGeneratorOption_ComputationAccuracy"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_27;
    }
    v34 = 1;
    if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:error:", &v34, CFSTR("VNOpticalFlowGeneratorInitOption_PortraitMode"), v6, a4))
    {
LABEL_27:
      v8 = 0;
LABEL_28:

      return v8;
    }
    v9 = 0;
    while (1)
    {
      v10 = (char *)&getPortraitFrameSize(VNOpticalFlowGeneratorComputationAccuracy)::accuracyBufferSizes + v9;
      if (*(_QWORD *)((char *)&getPortraitFrameSize(VNOpticalFlowGeneratorComputationAccuracy)::accuracyBufferSizes + v9) == v35)
        break;
      v9 += 24;
      if (v9 == 96)
        goto LABEL_25;
    }
    if (v10 == "NSt3__120__shared_ptr_pointerIPfZN6vision3mod28readBinSerializedModelValuesEP7__sFILEPKcRKNS3_26BinSeria"
                "lizedModelFileInfoERNS3_11ModelValuesEbE3$_0NS_9allocatorIfEEEE")
    {
LABEL_25:
      if (!a4)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v13, CFSTR("VNOpticalFlowGeneratorOption_ComputationAccuracy"));
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

      goto LABEL_28;
    }
    if (v34)
      v11 = *((_QWORD *)v10 + 2);
    else
      v11 = *((_QWORD *)v10 + 1);
    if (v34)
      v12 = *((_QWORD *)v10 + 1);
    else
      v12 = *((_QWORD *)v10 + 2);
    -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v8 = 0;
      goto LABEL_37;
    }
    v14 = +[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", v13);
    getVCPRequestFrameWidthPropertyKey();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v31;
    getVCPRequestFrameHeightPropertyKey();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v15;
    getVCPRequestMotionFlowComputationAccuracyPropertyKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v17;
    getVCPRequestForceCPUPropertyKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (VCPMotionFlowRequest *)objc_msgSend(objc_alloc((Class)getVCPMotionFlowRequestClass()), "initWithOptions:", v33);
    motionFlowRequest = self->_motionFlowRequest;
    self->_motionFlowRequest = v20;

    v22 = self->_motionFlowRequest;
    if (v22)
    {
      -[VCPMotionFlowRequest preferredInputSizeWithOptions:error:](v22, "preferredInputSizeWithOptions:error:", 0, a4);
      v25 = v24;
      v26 = v23;
      if (v24 != *MEMORY[0x1E0C9D820] || v23 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        v29 = -[VCPMotionFlowRequest preferredPixelFormat](self->_motionFlowRequest, "preferredPixelFormat");
        self->_preferredBufferSizeFormat.width = (unint64_t)v25;
        self->_preferredBufferSizeFormat.height = (unint64_t)v26;
        self->_preferredBufferSizeFormat.format = v29;
        v8 = 1;
        goto LABEL_36;
      }
      if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to properly create motion flow estimator"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
        v8 = 0;
        *a4 = v27;
LABEL_36:

        goto LABEL_37;
      }
    }
    else if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to create motion flow estimator"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    v8 = 0;
    goto LABEL_36;
  }
  return 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  id v33;
  id obj;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  _BYTE v44[128];
  uint64_t v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v45 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v37 = a6;
  v38 = a9;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __129__VNOpticalFlowGeneratorRevision2_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
  v43[3] = &unk_1E4548D28;
  v43[4] = self;
  if (+[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", (unint64_t)width, (unint64_t)height, v43, a8))
  {
    -[VNOpticalFlowGenerator validatedImageBuffersFromOptions:error:](self, "validatedImageBuffersFromOptions:error:", v17, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "count") == 2)
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "width");
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 == objc_msgSend(v22, "width"))
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "height");
          objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v24) = v24 == objc_msgSend(v25, "height");

          if ((v24 & 1) != 0)
          {
            v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            obj = v19;
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v40;
              while (2)
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v40 != v27)
                    objc_enumerationMutation(obj);
                  v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
                  v30 = (void *)objc_msgSend(v29, "croppedBufferWithWidth:height:format:cropRect:options:error:", self->_preferredBufferSizeFormat.width, self->_preferredBufferSizeFormat.height, self->_preferredBufferSizeFormat.format, v17, a8, x, y, width, height);
                  if (!v30)
                  {
                    v31 = 1;
                    goto LABEL_26;
                  }
                  objc_msgSend(v36, "addObject:", v30);

                }
                v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
                if (v26)
                  continue;
                break;
              }
            }
            v31 = 0;
LABEL_26:

            if (objc_msgSend(v36, "count") != 2)
            {

              v36 = 0;
            }
            v32 = v31 == 0;
            if (!v31)
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("VNOpticalFlowGeneratorProcessOption_FromAndToPixelBuffers"));

            goto LABEL_23;
          }
        }
        else
        {

        }
        if (a8)
        {
          +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("Optical flow cannot be performed on images with different dimensions"));
          v33 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
      }
      else if (a8)
      {
        +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("Optical flow incorrect number of images to compare"));
        v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
        v32 = 0;
        *a8 = v33;
LABEL_23:

        goto LABEL_24;
      }
    }
    v32 = 0;
    goto LABEL_23;
  }
  v32 = 0;
LABEL_24:

  return v32;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CVBuffer *v24;
  OSType PixelFormatType;
  size_t v26;
  _BOOL4 v27;
  void *v28;
  __CVBuffer *v29;
  const void *v30;
  uint64_t (**v31)(void *, __CVBuffer *, __CVBuffer *, id *);
  void *v32;
  VNPixelBufferObservation *v33;
  int v34;
  void *v35;
  id v37;
  unsigned int v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  char v43;
  unsigned int v44;
  _QWORD v45[4];
  unsigned int v46;
  _QWORD aBlock[4];
  id v48;
  id v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD v52[3];

  height = a3.size.height;
  width = a3.size.width;
  v52[1] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a7;
  v17 = a9;
  v18 = v15;
  v19 = v18;
  if (!self)
  {

    v23 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNOpticalFlowGeneratorProcessOption_FromAndToPixelBuffers"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", objc_msgSend(v20, "count") == 2, CFSTR("Unexpected number of buffers for optical flow processing"));
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCPMotionFlowRequest estimateMotionBetweenFirstImage:andSecondImage:withUpsample:withGuidedImage:error:](self->_motionFlowRequest, "estimateMotionBetweenFirstImage:andSecondImage:withUpsample:withGuidedImage:error:", v21, v22, 0, 0, a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    goto LABEL_30;
  v44 = 0;
  if (!+[VNValidationUtilities getOSTypeValue:forKey:inOptions:error:](VNValidationUtilities, "getOSTypeValue:forKey:inOptions:error:", &v44, CFSTR("VNOpticalFlowGeneratorProcessOption_OutputPixelFormat"), v19, a8))goto LABEL_30;
  v43 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v43, CFSTR("VNOpticalFlowGeneratorProcessOption_KeepNetworkOutput"), v19, 0, a8))goto LABEL_30;
  v24 = (__CVBuffer *)objc_msgSend(v23, "pixelBuffer");
  PixelFormatType = CVPixelBufferGetPixelFormatType(v24);
  v26 = (unint64_t)height;
  v27 = PixelFormatType == v44
     && CVPixelBufferGetWidth(v24) == (unint64_t)width
     && CVPixelBufferGetHeight(v24) == v26;
  if (v43 || v27)
  {
    v29 = CVPixelBufferRetain(v24);
    goto LABEL_22;
  }
  v38 = v44;
  v42 = v19;
  -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

LABEL_30:
    v35 = 0;
    goto LABEL_31;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke;
  aBlock[3] = &unk_1E4547F78;
  v50 = (unint64_t)width;
  v51 = (unint64_t)height;
  v37 = v42;
  v48 = v37;
  v39 = v28;
  v49 = v39;
  v40 = _Block_copy(aBlock);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke_3;
  v45[3] = &__block_descriptor_36_e41_B32__0____CVBuffer__8____CVBuffer__16__24l;
  v46 = v38;
  v41 = _Block_copy(v45);
  v29 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)width, v26, v38, a8);
  if (v29)
  {
    if (+[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", v39))
    {
      v30 = v41;
    }
    else
    {
      v30 = v40;
    }
    v31 = (uint64_t (**)(void *, __CVBuffer *, __CVBuffer *, id *))_Block_copy(v30);
    if ((v31[2](v31, v24, v29, a8) & 1) == 0)
    {
      CVPixelBufferRelease(v29);
      v29 = 0;
    }

  }
  if (!v29)
    goto LABEL_30;
LABEL_22:
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v19, a8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:]([VNPixelBufferObservation alloc], "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v32, 0, v29);
    v34 = 0;
  }
  else
  {
    v33 = 0;
    v34 = 1;
  }

  CVPixelBufferRelease(v29);
  if (v34)
  {
    v35 = 0;
  }
  else
  {
    v52[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_31:
  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionFlowRequest, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_DWORD *)self + 20) = 0;
  return self;
}

uint64_t __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  __int128 v13;
  uint64_t v14;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke_2;
  v12[3] = &__block_descriptor_64_e25_B24__0__VNCIContext_8__16l;
  v12[4] = a2;
  v13 = *(_OWORD *)(a1 + 48);
  v14 = a3;
  v6 = _Block_copy(v12);
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", *(_QWORD *)(a1 + 32), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "vnciContextManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v9, v6, *(void **)(a1 + 40), a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke_3(uint64_t a1, CVPixelBufferRef pixelBuffer, __CVBuffer *a3, _QWORD *a4)
{
  OSType PixelFormatType;
  int v9;
  unint64_t v10;
  size_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t (*v18)(uint64_t, unint64_t);
  int v19;
  char v20;
  uint64_t v22;
  size_t iterations;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t block;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, unint64_t);
  void *v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  float v37;
  float v38;
  float v39;
  float v40;

  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if (!+[VNCVPixelBufferHelper lockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, pixelBuffer, 1uLL, a4)|| !+[VNCVPixelBufferHelper lockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, a3, 0, a4))
  {
    goto LABEL_21;
  }
  if (PixelFormatType == 843264102)
  {
    v19 = *(_DWORD *)(a1 + 32);
    if (v19 == 843264102)
    {
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v25, pixelBuffer);
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v22, a3);
      if (!v27)
        goto LABEL_34;
      if (!v26)
        goto LABEL_34;
      v10 = v24;
      if (!v24)
        goto LABEL_34;
      v11 = iterations;
      if (!iterations)
        goto LABEL_34;
      v12 = (float)v27 / (float)v24;
      v13 = (float)v26 / (float)iterations;
      v14 = 1.0;
      v15 = 1.0 / v12;
      v16 = v27 - 1;
      v17 = v26 - 1;
      block = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v18 = ___Z21convertAndResizeImageI10Pixel_UFVFS0_EvRKN5apple6vision11ImageBufferIT_S4_EERKNS3_IT0_S8_EE_block_invoke;
      goto LABEL_33;
    }
    if (v19 == 843264104)
    {
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v25, pixelBuffer);
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v22, a3);
      if (!v27)
        goto LABEL_34;
      if (!v26)
        goto LABEL_34;
      v10 = v24;
      if (!v24)
        goto LABEL_34;
      v11 = iterations;
      if (!iterations)
        goto LABEL_34;
      v12 = (float)v27 / (float)v24;
      v13 = (float)v26 / (float)iterations;
      v14 = 1.0;
      v15 = 1.0 / v12;
      v16 = v27 - 1;
      v17 = v26 - 1;
      block = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v18 = ___Z21convertAndResizeImageI10Pixel_UFVF10Pixel_UHVHEvRKN5apple6vision11ImageBufferIT_S5_EERKNS4_IT0_S9_EE_block_invoke;
      goto LABEL_33;
    }
  }
  else if (PixelFormatType == 843264104)
  {
    v9 = *(_DWORD *)(a1 + 32);
    if (v9 == 843264102)
    {
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v25, pixelBuffer);
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v22, a3);
      if (!v27)
        goto LABEL_34;
      if (!v26)
        goto LABEL_34;
      v10 = v24;
      if (!v24)
        goto LABEL_34;
      v11 = iterations;
      if (!iterations)
        goto LABEL_34;
      v12 = (float)v27 / (float)v24;
      v13 = (float)v26 / (float)iterations;
      v14 = 1.0;
      v15 = 1.0 / v12;
      v16 = v27 - 1;
      v17 = v26 - 1;
      block = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v18 = ___Z21convertAndResizeImageI10Pixel_UHVH10Pixel_UFVFEvRKN5apple6vision11ImageBufferIT_S5_EERKNS4_IT0_S9_EE_block_invoke;
      goto LABEL_33;
    }
    if (v9 == 843264104)
    {
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v25, pixelBuffer);
      lockedPixelBufferToImageBuffer<Pixel_UHVH>(&v22, a3);
      if (!v27)
        goto LABEL_34;
      if (!v26)
        goto LABEL_34;
      v10 = v24;
      if (!v24)
        goto LABEL_34;
      v11 = iterations;
      if (!iterations)
        goto LABEL_34;
      v12 = (float)v27 / (float)v24;
      v13 = (float)v26 / (float)iterations;
      v14 = 1.0;
      v15 = 1.0 / v12;
      v16 = v27 - 1;
      v17 = v26 - 1;
      block = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v18 = ___Z21convertAndResizeImageI10Pixel_UHVHS0_EvRKN5apple6vision11ImageBufferIT_S4_EERKNS3_IT0_S8_EE_block_invoke;
LABEL_33:
      v30 = v18;
      v31 = &__block_descriptor_88_e8_v16__0Q8l;
      v32 = v17;
      v33 = &v25;
      v34 = &v22;
      v35 = v10;
      v37 = v13;
      v38 = v12;
      v36 = v16;
      v39 = v15;
      v40 = v14 / v13;
      dispatch_apply(v11, 0, &block);
LABEL_34:
      v20 = 1;
      goto LABEL_22;
    }
  }
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Invalid pixel format combinations"));
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_21:
    v20 = 0;
  }
LABEL_22:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v20 & 1;
}

uint64_t __94__VNOpticalFlowGeneratorRevision2__convertPixelBuffer_width_height_pixelFormat_options_error___block_invoke_2(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  void *v10;
  VNCIMultiplicationFilter *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v19, 0, sizeof(v19));
  v5 = a1[5];
  objc_msgSend(v4, "extent");
  v7 = v6;
  v8 = a1[6];
  objc_msgSend(v4, "extent");
  CGAffineTransformMakeScale(&v19, (double)v5 / v7, (double)v8 / v9);
  v18 = v19;
  objc_msgSend(v4, "imageByApplyingTransform:", &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(VNCIMultiplicationFilter);
  -[VNCIFilter setInputImage:](v11, "setInputImage:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19.a);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNCIMultiplicationFilter setInputFactor1:](v11, "setInputFactor1:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19.d);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNCIMultiplicationFilter setInputFactor2:](v11, "setInputFactor2:", v13);

  -[VNCIMultiplicationFilter outputImage](v11, "outputImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v15 = (void *)v3[1];
  else
    v15 = 0;
  v16 = v15;
  objc_msgSend(v16, "render:toCVPixelBuffer:", v14, a1[7]);

  return 1;
}

NSString *__129__VNOpticalFlowGeneratorRevision2_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
