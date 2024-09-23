@implementation VNNOPRequest

- (CGSize)_actualSizeForDesiredSize:(id)a3 ofSourceImageWidth:(unint64_t)a4 height:(unint64_t)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  CGSize result;

  v7 = a3;
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "isAllowedPixelsWide:pixelsHigh:", a4, a5))
  {
    v9 = (double)a4;
    v10 = (double)a5;
    goto LABEL_4;
  }
  v13 = objc_msgSend(v8, "aspectRatioHandling");
  if (v13 == 2)
  {
    objc_msgSend(v8, "pixelsWideRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 < a5)
    {
LABEL_12:
      v20 = _bestDimensionForSizeRange(v16, a5);

      v19 = (double)a5;
      v18 = (double)(unint64_t)v20 / (double)a5;
      v9 = trunc(v18 * (double)a4);
      goto LABEL_13;
    }
LABEL_10:
    v17 = _bestDimensionForSizeRange(v16, a4);

    v18 = (double)(unint64_t)v17 / (double)a4;
    v9 = trunc(v18 * (double)a4);
    v19 = (double)a5;
LABEL_13:
    v10 = trunc(v18 * v19);
    goto LABEL_4;
  }
  if (v13 == 1)
  {
    objc_msgSend(v8, "pixelsWideRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 > a5)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v13)
  {
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(v8, "pixelsWideRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (double)(unint64_t)_bestDimensionForSizeRange(v14, a4);
    objc_msgSend(v8, "pixelsHighRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (double)(unint64_t)_bestDimensionForSizeRange(v15, a5);

  }
LABEL_4:

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (__CVBuffer)_createScaledImagePixelBufferFromCropRect:(CGRect)a3 ofImageBuffer:(id)a4 inPixelFormat:(unsigned int)a5 forDetectorInputImageSize:(CGSize)a6 usingAnisotropicScaling:(BOOL)a7 error:(id *)a8
{
  double height;
  double width;
  uint64_t v11;
  double v12;
  double v13;
  double y;
  double x;
  id v16;
  __CVBuffer *v17;
  id v18;
  const __CFString *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v26;
  id v27;

  height = a6.height;
  width = a6.width;
  v11 = *(_QWORD *)&a5;
  v12 = a3.size.height;
  v13 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a7)
  {
    v27 = 0;
    v16 = a4;
    v17 = (__CVBuffer *)objc_msgSend(v16, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width, (unint64_t)height, v11, 0, &v27, x, y, v13, v12);

    v18 = v27;
    if (a8 && !v17)
    {
      v19 = CFSTR("Failed to scale the input image");
LABEL_14:
      +[VNError errorWithCode:message:underlyingError:](VNError, "errorWithCode:message:underlyingError:", 9, v19, v18);
      v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v20 = a4;
    v21 = v20;
    v22 = x + (v13 - v12) * 0.5;
    v23 = y + (v12 - v13) * 0.5;
    if (v13 >= v12)
      v23 = y;
    else
      v22 = x;
    if (v13 < v12)
      v24 = v13;
    else
      v24 = v12;
    v26 = 0;
    v17 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width, (unint64_t)height, v11, 0, &v26, trunc(v22), trunc(v23), v24, v24);

    v18 = v26;
    if (a8 && !v17)
    {
      v19 = CFSTR("Failed to center square crop the input image");
      goto LABEL_14;
    }
  }

  return v17;
}

- (__CVBuffer)_createScaledImagePixelBufferFromImageBuffer:(id)a3 inPixelFormat:(unsigned int)a4 forDetectorInputImageSize:(CGSize)a5 usingAnisotropicScaling:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  double height;
  double width;
  uint64_t v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  __CVBuffer *v15;
  id v16;
  const __CFString *v17;
  double v18;
  double v19;
  double v20;
  id v22;
  id v23;

  v8 = a6;
  height = a5.height;
  width = a5.width;
  v11 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = objc_msgSend(v12, "width");
  v14 = objc_msgSend(v12, "height");
  if (v8)
  {
    v23 = 0;
    v15 = (__CVBuffer *)objc_msgSend(v12, "bufferWithWidth:height:format:options:error:", (unint64_t)width, (unint64_t)height, v11, 0, &v23);
    v16 = v23;
    if (a7 && !v15)
    {
      v17 = CFSTR("Failed to scale the input image");
LABEL_14:
      +[VNError errorWithCode:message:underlyingError:](VNError, "errorWithCode:message:underlyingError:", 9, v17, v16);
      v15 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v18 = ((double)v14 - (double)v13) * 0.5 + 0.0;
    if ((double)v13 < (double)v14)
      v19 = 0.0;
    else
      v19 = ((double)v13 - (double)v14) * 0.5 + 0.0;
    if ((double)v13 < (double)v14)
    {
      v20 = (double)v13;
    }
    else
    {
      v18 = 0.0;
      v20 = (double)v14;
    }
    v22 = 0;
    v15 = (__CVBuffer *)objc_msgSend(v12, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width, (unint64_t)height, v11, 0, &v22, trunc(v19), trunc(v18), v20, v20);
    v16 = v22;
    if (a7 && !v15)
    {
      v17 = CFSTR("Failed to center square crop the input image");
      goto LABEL_14;
    }
  }

  return v15;
}

- (BOOL)_performNOPForRevision:(unint64_t)a3 inContext:(id)a4 detectorCompletionSemaphore:(id)a5 error:(id *)a6
{
  id v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double x;
  double y;
  double width;
  double height;
  __CVBuffer *v23;
  __CVBuffer *v24;
  double v25;
  dispatch_time_t v26;
  unint64_t v28;
  unint64_t v29;
  CGRect v30;
  CGRect v31;

  v9 = a4;
  v10 = a5;
  if (-[VNRequest cancellationTriggeredAndReturnError:](self, "cancellationTriggeredAndReturnError:", a6))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v9, "imageBufferAndReturnError:", a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (v28 = 0,
          v29 = 0,
          -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v12, &v29, &v28, a6)))
    {
      -[VNNOPRequest detectorPreferredImageSize](self, "detectorPreferredImageSize");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNNOPRequest _actualSizeForDesiredSize:ofSourceImageWidth:height:](self, "_actualSizeForDesiredSize:ofSourceImageWidth:height:", v13, v29, v28);
      v16 = v15;
      v17 = v14;
      if (v15 == *MEMORY[0x1E0C9D820] && v14 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        if (a6)
        {
          +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("unable to determine preferred image size for detection"));
          v11 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        x = v30.origin.x;
        y = v30.origin.y;
        width = v30.size.width;
        height = v30.size.height;
        v31.origin.x = 0.0;
        v31.origin.y = 0.0;
        v31.size.width = 1.0;
        v31.size.height = 1.0;
        if (CGRectEqualToRect(v30, v31))
          v23 = -[VNNOPRequest _createScaledImagePixelBufferFromImageBuffer:inPixelFormat:forDetectorInputImageSize:usingAnisotropicScaling:error:](self, "_createScaledImagePixelBufferFromImageBuffer:inPixelFormat:forDetectorInputImageSize:usingAnisotropicScaling:error:", v12, objc_msgSend(v13, "idealImageFormat"), -[VNNOPRequest detectorWantsAnisotropicScaling](self, "detectorWantsAnisotropicScaling"), a6, v16, v17);
        else
          v23 = -[VNNOPRequest _createScaledImagePixelBufferFromCropRect:ofImageBuffer:inPixelFormat:forDetectorInputImageSize:usingAnisotropicScaling:error:](self, "_createScaledImagePixelBufferFromCropRect:ofImageBuffer:inPixelFormat:forDetectorInputImageSize:usingAnisotropicScaling:error:", v12, objc_msgSend(v13, "idealImageFormat"), -[VNNOPRequest detectorWantsAnisotropicScaling](self, "detectorWantsAnisotropicScaling"), a6, x * (double)v29, y * (double)v28, width * (double)v29, height * (double)v28, v16, v17);
        v24 = v23;
        v11 = 0;
        if (v23)
        {
          -[VNNOPRequest detectorExecutionTimeInterval](self, "detectorExecutionTimeInterval");
          if (v25 <= 0.0
            || (v26 = dispatch_time(0, (uint64_t)(v25 * 1000000000.0)),
                dispatch_semaphore_wait(v10, v26),
                !-[VNRequest cancellationTriggeredAndReturnError:](self, "cancellationTriggeredAndReturnError:", a6)))
          {
            v11 = 1;
          }
        }
        CVPixelBufferRelease(v24);
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (VNSupportedImageSize)detectorPreferredImageSize
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detectorPreferredImageSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNSupportedImageSize *)v3;
}

- (void)setDetectorPreferredImageSize:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetectorPreferredImageSize:", v4);

}

- (BOOL)detectorWantsAnisotropicScaling
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "detectorWantsAnisotropicScaling");

  return v3;
}

- (void)setDetectorWantsAnisotropicScaling:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetectorWantsAnisotropicScaling:", v3);

}

- (double)detectorExecutionTimeInterval
{
  void *v2;
  double v3;
  double v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detectorExecutionTimeInterval");
  v4 = v3;

  return v4;
}

- (void)setDetectorExecutionTimeInterval:(double)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetectorExecutionTimeInterval:", a3);

}

- (BOOL)hasCancellationHook
{
  return 1;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  double v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "detectorExecutionTimeInterval");
  if (v5 <= 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)VNNOPRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a4;
  -[VNRequest cancellerAndReturnError:](self, "cancellerAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = dispatch_semaphore_create(0);
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__12400;
    v32 = __Block_byref_object_dispose__12401;
    v33 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__VNNOPRequest_internalPerformRevision_inContext_error___block_invoke;
    v18[3] = &unk_1E45455A0;
    v21 = &v24;
    v18[4] = self;
    v23 = a3;
    v19 = v8;
    v20 = v10;
    v22 = &v28;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __56__VNNOPRequest_internalPerformRevision_inContext_error___block_invoke_2;
    v16[3] = &unk_1E45455C8;
    v12 = v20;
    v17 = v12;
    if ((objc_msgSend(v9, "tryToPerformBlock:usingSignallingBlock:", v18, v16) & 1) != 0)
    {
      if (*((_BYTE *)v25 + 24))
      {
        v13 = 1;
LABEL_12:

        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(&v28, 8);

        goto LABEL_13;
      }
      if (a5)
      {
        v14 = objc_retainAutorelease((id)v29[5]);
        goto LABEL_10;
      }
    }
    else if (a5)
    {
      +[VNError errorForCancellationOfRequest:](VNError, "errorForCancellationOfRequest:", self);
      v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v13 = 0;
      *a5 = v14;
      goto LABEL_12;
    }
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)supportedImageSizeSet
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[VNNOPRequest detectorPreferredImageSize](self, "detectorPreferredImageSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

  return v5;
}

void __56__VNNOPRequest_internalPerformRevision_inContext_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[9];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v2, "_performNOPForRevision:inContext:detectorCompletionSemaphore:error:", v5, v3, v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;
}

intptr_t __56__VNNOPRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
