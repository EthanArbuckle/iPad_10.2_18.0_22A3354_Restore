@implementation VNCSUDetectionprintGenerator

- (id)_observationsFromNetworkOutput:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  void *v7;
  VNDetectionprint *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  VNDetectionprintObservation *v13;
  void *v14;
  void *v15;
  VNDetectionprint *v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  VNDetectionprintObservation *v26;
  _BYTE v27[128];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v20 = a4;
  v28[0] = CFSTR("6316");
  v28[1] = CFSTR("5637");
  v29[0] = CFSTR("VNDetectionprintTensorKeyStride8FeatureMap");
  v29[1] = CFSTR("VNDetectionprintTensorKeyStride16FeatureMap");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v21, "availableTapPointNames");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = (VNDetectionprint *)(id)objc_claimAutoreleasedReturnValue();
  v9 = -[VNDetectionprint countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (VNDetectionprintObservation *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v21, "detectionPrintFeatureForTapPointName:error:", v12, a5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_14;
          +[VNDetectionprintTensor tensorFromCSUBuffer:originatingRequestSpecifier:error:](VNDetectionprintTensor, "tensorFromCSUBuffer:originatingRequestSpecifier:error:", v14, v20, a5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {

LABEL_14:
            v17 = 0;
            v16 = v8;
            goto LABEL_15;
          }
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v13);

        }
      }
      v9 = -[VNDetectionprint countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = -[VNDetectionprint initWithTensorsDictionary:originatingRequestSpecifier:]([VNDetectionprint alloc], "initWithTensorsDictionary:originatingRequestSpecifier:", v19, v20);
  v13 = -[VNDetectionprintObservation initWithOriginatingRequestSpecifier:detectionprint:]([VNDetectionprintObservation alloc], "initWithOriginatingRequestSpecifier:detectionprint:", v20, v16);
  v26 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v17;
}

- (BOOL)needsMetalContext
{
  return 0;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  char v7;
  id v8;
  CSUDetectionPrintNetwork *v9;
  CSUDetectionPrintNetwork *network;
  void *v11;
  unint64_t v12;
  unint64_t inputImagePixelWidth;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VNCSUDetectionprintGenerator;
  if (!-[VNDetector completeInitializationForSession:error:](&v16, sel_completeInitializationForSession_error_, a3))
    return 0;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_msgSend((id)objc_opt_class(), "_getCSUDetectionprintNetworkConfiguration:forConfigurationOptions:error:", &v15, v6, a4);
  v8 = v15;
  if ((v7 & 1) != 0)
  {
    v9 = (CSUDetectionPrintNetwork *)objc_msgSend(objc_alloc(MEMORY[0x1E0D188A8]), "initWithConfiguration:", v8);
    network = self->_network;
    self->_network = v9;

    objc_msgSend(v8, "inputPixelBufferDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_inputImagePixelFormat = objc_msgSend(v11, "pixelFormat");
    self->_inputImagePixelWidth = objc_msgSend(v11, "width");
    v12 = objc_msgSend(v11, "height");
    self->_inputImagePixelHeight = v12;
    inputImagePixelWidth = self->_inputImagePixelWidth;
    if (inputImagePixelWidth >= v12)
      inputImagePixelWidth = v12;
    self->_inputImageMinimumDimension = inputImagePixelWidth;

  }
  return v7;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNCSUDetectionprintGenerator;
  if (-[VNDetector warmUpSession:withOptions:error:](&v12, sel_warmUpSession_withOptions_error_, v8, v9, a5))
    v10 = -[CSUDetectionPrintNetwork loadResourcesAndReturnError:](self->_network, "loadResourcesAndReturnError:", a5);
  else
    v10 = 0;

  return v10;
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
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t inputImagePixelWidth;
  unint64_t inputImagePixelHeight;
  uint64_t inputImagePixelFormat;
  __CVBuffer *v29;
  id v30;
  BOOL v31;
  id v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "width");
    v22 = (double)(unint64_t)objc_msgSend(v20, "height");
    v23 = width * (double)v21;
    v24 = height * v22;
    if (v23 >= v24)
      v25 = v24;
    else
      v25 = v23;
    if (self->_inputImageMinimumDimension > (unint64_t)v25)
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)v25);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
    inputImagePixelWidth = self->_inputImagePixelWidth;
    inputImagePixelHeight = self->_inputImagePixelHeight;
    inputImagePixelFormat = self->_inputImagePixelFormat;
    v33 = 0;
    v29 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", inputImagePixelWidth, inputImagePixelHeight, inputImagePixelFormat, v17, a8, &v33, x * (double)v21, y * v22, v23, v24);
    v30 = v33;
    *a7 = v29;
    v31 = v29 != 0;
    if (v29)
      -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v17, v30, v20);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  CSUDetectionPrintNetwork *network;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v12 = a5;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__13552;
    v33 = __Block_byref_object_dispose__13553;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__13552;
    v27 = __Block_byref_object_dispose__13553;
    v28 = 0;
    network = self->_network;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __130__VNCSUDetectionprintGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    v19[3] = &unk_1E45457F8;
    v21 = &v23;
    v22 = &v29;
    v19[4] = self;
    v20 = v13;
    -[CSUDetectionPrintNetwork runOnInputImage:completion:](network, "runOnInputImage:completion:", a4, v19);
    v16 = (void *)v30[5];
    if (v16)
    {
      v17 = v16;
    }
    else if (a8)
    {
      *a8 = objc_retainAutorelease((id)v24[5]);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
}

void __130__VNCSUDetectionprintGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    v8 = (void *)a1[4];
    v9 = a1[5];
    v13 = 0;
    objc_msgSend(v8, "_observationsFromNetworkOutput:originatingRequestSpecifier:error:", v5, v9, &v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

+ (int64_t)detectionPrintConfigurationRevisionForConfigurationOptions:(id)a3
{
  return 2;
}

+ (BOOL)_getCSUDetectionprintNetworkConfiguration:(id *)a3 forConfigurationOptions:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;

  v8 = a4;
  objc_msgSend(a1, "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_msgSend(a1, "detectionPrintConfigurationRevisionForConfigurationOptions:", v8);
    objc_msgSend(MEMORY[0x1E0D188B0], "detectionPrintConfigurationForRevision:error:", v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v11 != 0;
    if (v11)
    {
      objc_msgSend(v11, "setComputeDevice:", v9);
      *a3 = objc_retainAutorelease(v12);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

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
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(a1, "detectionPrintConfigurationRevisionForConfigurationOptions:", v6);
  objc_msgSend(MEMORY[0x1E0D188B0], "detectionPrintConfigurationForRevision:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v13 = CFSTR("VNComputeStageMain");
    objc_msgSend(v8, "supportedComputeDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  VNSupportedImageSize *v8;
  void *v9;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v4 = objc_msgSend(a1, "_getCSUDetectionprintNetworkConfiguration:forConfigurationOptions:error:", &v11, a3, a4);
  v5 = v11;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "inputPixelBufferDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", objc_msgSend(v7, "pixelFormat"), objc_msgSend(v7, "width"), objc_msgSend(v7, "height"), 1, 0, 0);
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
