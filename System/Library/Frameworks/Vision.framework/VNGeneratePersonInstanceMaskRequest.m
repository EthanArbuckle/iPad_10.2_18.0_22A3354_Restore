@implementation VNGeneratePersonInstanceMaskRequest

- (id)_newConfiguredDependentRequestForRevision:(unint64_t)a3 error:(id *)a4
{
  VNGeneratePersonSegmentationRequest *v7;
  VNGeneratePersonSegmentationRequest *v8;

  if (a3 != 1)
  {
    v7 = 0;
    if (!a4)
      goto LABEL_8;
LABEL_6:
    if (!v7)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
  v7 = objc_alloc_init(VNGeneratePersonSegmentationRequest);
  -[VNGeneratePersonSegmentationRequest applyConfigurationOfRequest:](v7, "applyConfigurationOfRequest:", self);
  if (!-[VNRequest setRevision:error:](v7, "setRevision:error:", 3737841664, a4))
  {
    v8 = 0;
    goto LABEL_10;
  }
  -[VNGeneratePersonSegmentationRequest setQualityLevel:](v7, "setQualityLevel:", 1);
  -[VNGeneratePersonSegmentationRequest setOutputPixelFormat:](v7, "setOutputPixelFormat:", 1278226534);
  -[VNGeneratePersonSegmentationRequest setUseTiling:](v7, "setUseTiling:", 1);
  if (a4)
    goto LABEL_6;
LABEL_8:
  v7 = v7;
  v8 = v7;
LABEL_10:

  return v8;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = &stru_1E4549388;
    v5 = &stru_1E4549388;
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNGeneratePersonInstanceMaskRequest;
  if (-[VNRequest warmUpSession:error:](&v11, sel_warmUpSession_error_, v6, a4))
  {
    v7 = -[VNGeneratePersonInstanceMaskRequest _newConfiguredDependentRequestForRevision:error:](self, "_newConfiguredDependentRequestForRevision:error:", -[VNRequest resolvedRevision](self, "resolvedRevision"), a4);
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "warmUpSession:error:", v6, a4);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[VNGeneratePersonInstanceMaskRequest _newConfiguredDependentRequestForRevision:error:](self, "_newConfiguredDependentRequestForRevision:error:", -[VNRequest resolvedRevision](self, "resolvedRevision"), a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "supportedComputeStageDevicesAndReturnError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (__CVBuffer)_createInstanceMaskFromMaskArray:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  OSType PixelFormatType;
  uint64_t v22;
  __CVBuffer *v23;
  size_t v24;
  char *BaseAddress;
  char *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t i;
  char *v31;
  float *v32;
  float *v33;
  size_t v34;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferRef texture;

  v5 = a3;
  pixelBuffer = 0;
  texture = 0;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  Width = CVPixelBufferGetWidth((CVPixelBufferRef)v6);
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)v6);
  BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)v6);
  v10 = objc_msgSend(v5, "count");
  v11 = VNCVPixelBufferCreateUsingIOSurface(Width, Height, 0x4C303038u, 0, &texture);
  if ((_DWORD)v11)
  {
    v18 = v11;
    VNValidatedLog(4, (uint64_t)CFSTR("Failed to create instance mask"), v12, v13, v14, v15, v16, v17, (uint64_t)pixelBuffer);
    if (a4)
    {
      v19 = CFSTR("Can't create the instance mask");
      v20 = v18;
LABEL_7:
      +[VNError errorForCVReturnCode:width:height:pixelFormat:localizedDescription:](VNError, "errorForCVReturnCode:width:height:pixelFormat:localizedDescription:", v20, Width, Height, 1278226488, v19);
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_8;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v6);
  v22 = VNCVPixelBufferCreateUsingIOSurface(Width, Height, PixelFormatType, 0, &pixelBuffer);
  if ((_DWORD)v22)
  {
    CVPixelBufferRelease(texture);
    if (a4)
    {
      v19 = CFSTR("Can't create internal temporary buffer");
      v20 = v22;
      goto LABEL_7;
    }
LABEL_8:
    v23 = 0;
    goto LABEL_21;
  }
  v24 = CVPixelBufferGetBytesPerRow(texture);
  CVPixelBufferLockBaseAddress(texture, 0);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(texture);
  bzero(BaseAddress, v24 * Height);
  v26 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  bzero(v26, BytesPerRow * Height);
  v27 = 0;
  while (v27 != v10)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    CVPixelBufferLockBaseAddress((CVPixelBufferRef)v28, 0);
    v29 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)v28);
    ++v27;
    if (Height)
    {
      for (i = 0; i != Height; ++i)
      {
        if (Width)
        {
          v31 = &BaseAddress[i * v24];
          v32 = (float *)&v26[i * BytesPerRow];
          v33 = (float *)&v29[i * BytesPerRow];
          v34 = Width;
          do
          {
            if (*v33 > *v32)
            {
              *v32 = *v33;
              *v31 = v27;
            }
            ++v33;
            ++v32;
            ++v31;
            --v34;
          }
          while (v34);
        }
      }
    }
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v28, 0);
  }
  CVPixelBufferUnlockBaseAddress(texture, 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferRelease(pixelBuffer);
  v23 = texture;
LABEL_21:

  return v23;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  __CVBuffer *v23;
  __CVBuffer *v24;
  VNInstanceMaskObservation *v25;
  void *v26;
  VNInstanceMaskObservation *v27;
  double v28;
  BOOL v29;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = -[VNGeneratePersonInstanceMaskRequest _newConfiguredDependentRequestForRevision:error:](self, "_newConfiguredDependentRequestForRevision:error:", a3, a5);
  if (v9)
  {
    objc_msgSend(v8, "requestPerformerAndReturnError:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (v32[0] = v9,
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v10, "performDependentRequests:onBehalfOfRequest:inContext:error:", v11, self, v8, a5),
          v11,
          !v12))
    {
      v29 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v31 = v13;
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = 0;
      v18 = 1.0;
      do
      {
        objc_msgSend(v9, "results");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "addObject:", objc_msgSend(v20, "pixelBuffer"));
        objc_msgSend(v20, "confidence");
        if (v21 < v18)
        {
          objc_msgSend(v20, "confidence");
          v18 = v22;
        }

        ++v17;
      }
      while (v15 != v17);
      v23 = -[VNGeneratePersonInstanceMaskRequest _createInstanceMaskFromMaskArray:error:](self, "_createInstanceMaskFromMaskArray:error:", v16, a5);
      if (!v23)
      {

        v29 = 0;
        v13 = v31;
        goto LABEL_15;
      }
      v24 = v23;
      v25 = [VNInstanceMaskObservation alloc];
      -[VNRequest specifier](self, "specifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      v27 = -[VNInstanceMaskObservation initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceMask:numComponents:regionOfInterest:](v25, "initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceMask:numComponents:regionOfInterest:", v26, v16, v24, v15 + 1);

      CVPixelBufferRelease(v24);
      *(float *)&v28 = v18;
      -[VNObservation setConfidence:](v27, "setConfidence:", v28);
      v13 = v31;
      objc_msgSend(v31, "addObject:", v27);

    }
    -[VNRequest setResults:](self, "setResults:", v13);
    v29 = 1;
LABEL_15:

    goto LABEL_16;
  }
  v29 = 0;
LABEL_17:

  return v29;
}

- (id)supportedImageSizeSet
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[VNRequest resolvedRevision](self, "resolvedRevision") == 1)
  {
    v3 = -[VNGeneratePersonInstanceMaskRequest _newConfiguredDependentRequestForRevision:error:](self, "_newConfiguredDependentRequestForRevision:error:", -[VNRequest revision](self, "revision"), 0);
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "supportedImageSizeSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C9AA60];
    }

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNGeneratePersonInstanceMaskRequest;
    -[VNImageBasedRequest supportedImageSizeSet](&v7, sel_supportedImageSizeSet);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&revisionAvailability_ourRevisionAvailability_29630;
}

+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4
{
  if (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()))
    return 3737841664;
  else
    return 0;
}

@end
