@implementation VNE5RTBasedDetector

- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 configurationOptions:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0DC6C28]);
  objc_msgSend(v6, "function");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newExecutionContextWithConfiguration:error:", v7, a5);

  return v9;
}

- (id)newE5RTExecutionInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;

  v9 = objc_alloc_init(MEMORY[0x1E0DC6C90]);
  if (!a4)
  {
LABEL_4:
    v11 = v9;
    goto LABEL_6;
  }
  -[VNE5RTBasedDetector _onlyInputImageDescriptorAndReturnError:]((uint64_t)self, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "assignPixelBuffer:toName:error:", a4, v12, a6);

    if ((v13 & 1) == 0)
    {
      v11 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v11;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  if (a7)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self, a5, a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  VisionCoreE5RTInferenceFunctionDescriptor *v7;
  VisionCoreE5RTInferenceFunctionDescriptor *functionDescriptor;
  VisionCoreE5RTInferenceFunctionDescriptor *v9;
  VisionCoreE5RTExecutionContext *v10;
  VisionCoreE5RTExecutionContext *executionContext;
  BOOL v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VNE5RTBasedDetector;
  if (!-[VNDetector completeInitializationForSession:error:](&v14, sel_completeInitializationForSession_error_, a3))
    return 0;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "E5RTFunctionDescriptorForConfigurationOptions:error:", v6, a4);
  v7 = (VisionCoreE5RTInferenceFunctionDescriptor *)objc_claimAutoreleasedReturnValue();
  functionDescriptor = self->_functionDescriptor;
  self->_functionDescriptor = v7;

  v9 = self->_functionDescriptor;
  if (v9)
  {
    v10 = -[VNE5RTBasedDetector newE5RTExecutionContextForFunctionDescriptor:configurationOptions:error:](self, "newE5RTExecutionContextForFunctionDescriptor:configurationOptions:error:", v9, v6, a4);
    executionContext = self->_executionContext;
    self->_executionContext = v10;

    v12 = self->_executionContext != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  BOOL v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  double v47;
  double v48;
  uint64_t v49;
  __CVBuffer *v50;
  id v51;
  unint64_t v53;
  id v54;
  uint64_t v55;
  id v56;

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
    v22 = objc_msgSend(v20, "height");
    v56 = 0;
    v23 = +[VNValidationUtilities getOptionalFaceObservation:inOptions:error:](VNValidationUtilities, "getOptionalFaceObservation:inOptions:error:", &v56, v17, a8);
    v24 = v56;
    v25 = v24;
    if (v23)
    {
      if (v24)
      {
        objc_msgSend((id)objc_opt_class(), "normalizedScaledFaceBoundingBox:", v24);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        v34 = objc_msgSend(v20, "width");
        v35 = objc_msgSend(v20, "height");
        LODWORD(v55) = -1;
        if ((objc_msgSend(v25, "getFaceEXIFOrientation:error:", &v55, a8) & 1) == 0)
          goto LABEL_25;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v55);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight"));
        v37 = v27 * (double)v34;
        v38 = v31 * (double)v34;
        v39 = v29 * (double)v35;
        v40 = v33 * (double)v35;

      }
      else
      {
        v37 = x * (double)v21;
        v38 = width * (double)v21;
        v39 = y * (double)v22;
        v40 = height * (double)v22;
      }
      v55 = 0;
      if (-[VNE5RTBasedDetector imageCropAndScaleOption:fromOptions:error:](self, "imageCropAndScaleOption:fromOptions:error:", &v55, v17, a8))
      {
        -[VNE5RTBasedDetector _onlyInputImageDescriptorAndReturnError:]((uint64_t)self, a8);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v42)
        {
          v53 = objc_msgSend(v42, "pixelWidth");
          v44 = objc_msgSend(v43, "pixelHeight");
          v45 = v44;
          v46 = v53;
          if (v53 >= v44)
            v46 = v44;
          if (v38 >= v40)
            v47 = v40;
          else
            v47 = v38;
          if (v47 < (double)v46)
          {
            if (width >= height)
              v48 = height;
            else
              v48 = width;
            if (v48 <= 0.0)
              v48 = 1.0;
            VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)((double)v46 / v48));
          }
          objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
          v49 = objc_msgSend(v43, "pixelFormatType");
          v54 = 0;
          v50 = (__CVBuffer *)objc_msgSend(v20, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", v53, v45, v49, v55, v17, a8, v37, v39, v38, v40, 0, 0, 0, &v54);
          v51 = v54;
          *a7 = v50;
          v41 = v50 != 0;
          if (v50)
            -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v17, v51, v20);

        }
        else
        {
          v41 = 0;
        }

        goto LABEL_26;
      }
    }
LABEL_25:
    v41 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v41 = 0;
LABEL_27:

  return v41;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v12 = a5;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = -[VNE5RTBasedDetector newE5RTExecutionInputsForFunctionDescriptor:croppedPixelBuffer:options:error:](self, "newE5RTExecutionInputsForFunctionDescriptor:croppedPixelBuffer:options:error:", self->_functionDescriptor, a4, v12, a8);
    if (v14)
    {
      -[VisionCoreE5RTExecutionContext executeWithInputObjects:error:](self->_executionContext, "executeWithInputObjects:error:", v14, a8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[VNE5RTBasedDetector observationsFromE5RTExecutionOutputs:forFunctionDescriptor:originatingRequestSpecifier:options:error:](self, "observationsFromE5RTExecutionOutputs:forFunctionDescriptor:originatingRequestSpecifier:options:error:", v15, self->_functionDescriptor, v13, v12, a8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v18 = v16;

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)defaultImageCropAndScaleOption
{
  return 0;
}

- (BOOL)imageCropAndScaleOption:(unint64_t *)a3 fromOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  unint64_t v12;

  v8 = a4;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("cropAndScaleOptionPointer cannot be NULL"));
  v12 = 0;
  v9 = v8;
  if (self
    && +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:", &v12, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v9, -[VNE5RTBasedDetector defaultImageCropAndScaleOption](self, "defaultImageCropAndScaleOption"), a5))
  {
    if (v12 == 2)
      v12 = 0;

    *a3 = v12;
    v10 = 1;
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (VisionCoreE5RTInferenceFunctionDescriptor)functionDescriptor
{
  return self->_functionDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_functionDescriptor, 0);
}

- (id)_onlyInputImageDescriptorAndReturnError:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 56), "onlyInputImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else if (a2)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ does not have a single input image"), v8);

      +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v9);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)E5RTProgramLibraryForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = a3;
  objc_msgSend(a1, "modelURLForConfigurationOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "URLByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0DC6C40], "isProgramLibraryAtURL:", v9))
    {
      objc_msgSend(MEMORY[0x1E0DC6C40], "programLibraryForURL:error:", v9, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend(MEMORY[0x1E0DC6C38], "isModelSourceURL:", v8))
    {
      objc_msgSend(MEMORY[0x1E0DC6C38], "modelSourceFromURL:error:", v8, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(a1, "E5RTProgramLibraryCompilationOptionsForModelSource:configurationOptions:error:", v11, v6, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0DC6C40], "compileModelSource:options:error:", v11, v12, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
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
      if (!a4)
      {
        v10 = 0;
        goto LABEL_16;
      }
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("Could not open program library for %@"), v14);

      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v11);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_16;
  }
  v10 = 0;
LABEL_17:

  return v10;
}

+ (id)E5RTProgramLibraryCompilationOptionsForModelSource:(id)a3 configurationOptions:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  id v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DC6C48]);
  objc_msgSend(a1, "supportedComputeStageDevicesForOptions:error:", v20, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("VNComputeStageMain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v9;
    v19 = v7;
    v11 = 0;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = 4;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = 2;
            }
            else
            {
              objc_opt_class();
              v16 = objc_opt_isKindOfClass() & 1;
            }
          }

          v11 |= v16;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    v7 = v19;
    objc_msgSend(v19, "setComputeDeviceTypes:", v11);
    objc_msgSend(v19, "setFullyANEResident:", objc_msgSend((id)objc_opt_class(), "modelFullyANEResident"));
    v17 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)E5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (CGRect)normalizedScaledFaceBoundingBox:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "unalignedBoundingBox");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "E5RTFunctionDescriptorForConfigurationOptions:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "function");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "programLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("VNComputeStageMain");
    +[VNComputeDeviceUtilities computeDevicesOfTypes:](VNComputeDeviceUtilities, "computeDevicesOfTypes:", 7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  VNSupportedImageSize *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "E5RTFunctionDescriptorForConfigurationOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "onlyInputImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", objc_msgSend(v9, "pixelFormatType"), objc_msgSend(v9, "pixelWidth"), objc_msgSend(v9, "pixelHeight"), 1, 0, 0);
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      a4 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else if (a4)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@ (%@) does not have an input image"), v13, v8);

      +[VNError errorForDataUnavailableWithLocalizedDescription:underlyingError:](VNError, "errorForDataUnavailableWithLocalizedDescription:underlyingError:", v14, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }

  }
  else
  {
    a4 = 0;
  }

  return a4;
}

+ (id)classificationIdentifiersForConfigurationOptions:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "E5RTFunctionDescriptorForConfigurationOptions:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "confidencesOutputOfClass:error:", objc_opt_class(), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "sortedValidLabels");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)modelFullyANEResident
{
  return 1;
}

@end
