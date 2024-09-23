@implementation VNHomographicImageRegistrationDetector

- (id)_validatedImageBufferForKey:(id)a3 inOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && -[VNDetector validateImageBuffer:error:](self, "validateImageBuffer:error:", v10, a5))
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (BOOL)_createN:(unint64_t)a3 CVPixelBuffers:(__CVBuffer *)a4 withPixelFormat:(unsigned int)a5 width:(unint64_t)a6 height:(unint64_t)a7 error:(id *)a8
{
  uint64_t v11;
  BOOL v14;
  uint64_t v15;
  __CVBuffer *v16;
  id v17;
  void *v18;
  uint64_t i;
  id v20;
  void *v21;
  void *v22;
  id *v24;
  id v25;

  v11 = *(_QWORD *)&a5;
  bzero(a4, 8 * a3);
  if (a3)
  {
    v24 = a8;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v25 = 0;
      v16 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a6, a7, v11, &v25);
      v17 = v25;
      v18 = v17;
      a4[v15] = v16;
      if (!v16)
        break;

      v14 = ++v15 >= a3;
      if (a3 == v15)
        return 1;
    }
    if (v15)
    {
      for (i = 0; i != v15; ++i)
      {
        CVPixelBufferRelease(a4[i]);
        a4[i] = 0;
      }
    }
    if (v24)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v18, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("failed to create a %lu x %lu pixel buffer of type '%c%c%c%c' with error: %@"), a6, a7, ((int)v11 >> 24), ((int)((_DWORD)v11 << 8) >> 24), ((__int16)v11 >> 8), (char)v11, v21);

      +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v22, v18);
      *v24 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    return 1;
  }
  return v14;
}

- (__CVBuffer)_createHomographicPixelBufferFromImageBuffer:(id)a3 cropRect:(CGRect)a4 options:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  __CVBuffer *v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  v14 = (__CVBuffer *)objc_msgSend(v12, "croppedBufferWithWidth:height:format:cropRect:options:error:", objc_msgSend(v12, "width"), objc_msgSend(v12, "height"), 875704422, v13, a6, x, y, width, height);

  return v14;
}

- (BOOL)_calculateHomographicWarpTransform:(id *)a3 ofFloatingImagePixelBuffer:(__CVBuffer *)a4 ontoReferenceImagePixelBuffer:(__CVBuffer *)a5 usingImageRegistrationContext:(ImageRegistrationCtx_s *)a6 seededWithPreviousWarpTransform:(id *)a7 error:(id *)a8
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  uint64_t v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  __int16 v33;
  _OWORD v34[2];
  int v35;
  CVPixelBufferRef texture;
  CVPixelBufferRef v37;
  _BYTE v38[24];
  __int32 v39;
  __int32 v40;
  __int32 v41;
  uint64_t v42;
  simd_float3x3 v43;
  simd_float3x3 v44;

  v42 = *MEMORY[0x1E0C80C00];
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a5, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a5, 0);
  texture = 0;
  v37 = 0;
  if (!-[VNHomographicImageRegistrationDetector _createN:CVPixelBuffers:withPixelFormat:width:height:error:](self, "_createN:CVPixelBuffers:withPixelFormat:width:height:error:", 2, &texture, 875704422, WidthOfPlane, HeightOfPlane, a8))return 0;
  v35 = 0;
  memset(v34, 0, sizeof(v34));
  *(_QWORD *)v38 = a4;
  v33 = 0;
  v17 = ImageRegister((unsigned __int16 ***)a6, a5, (__CVBuffer **)v38, 1u, 1, a7 != 0, v34, 0, &v33, 0, 0, 0, 0, 0, 0, (const void **)&texture, 2);
  if ((_DWORD)v17)
  {
    if (a8)
    {
      +[VNError errorForOSStatus:localizedDescription:](VNError, "errorForOSStatus:localizedDescription:", v17, CFSTR("failed to warp image"));
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  CVPixelBufferRelease(texture);
  CVPixelBufferRelease(v37);
  v19 = v18 == 0;
  if (!v18)
  {
    GeomTransform_fromUnityToImageSize(v38, (uint64_t)v34, WidthOfPlane - 1, HeightOfPlane - 1, 1);
    v43.columns[0] = *(simd_float3 *)v38;
    v43.columns[1] = *(simd_float3 *)&v38[4];
    v43.columns[2] = *(simd_float3 *)&v38[8];
    v43.columns[0].i32[1] = *(_DWORD *)&v38[12];
    v43.columns[1].i32[1] = *(_DWORD *)&v38[16];
    v43.columns[2].i32[1] = *(_DWORD *)&v38[20];
    v43.columns[0].i32[2] = v39;
    v43.columns[1].i32[2] = v40;
    v43.columns[2].i32[2] = v41;
    v44 = __invert_f3(v43);
    *((_DWORD *)a3 + 2) = v44.columns[0].i32[2];
    *(float *)&v20 = -v44.columns[1].f32[0];
    _S16 = (float)HeightOfPlane;
    __asm { FMLA            S3, S16, V0.S[2] }
    v44.columns[0].i32[1] = _S3;
    __asm { FMLS            S4, S16, V1.S[2] }
    HIDWORD(v20) = _S4;
    v44.columns[2].f32[0] = vmlas_n_f32(v44.columns[2].f32[0], (float)HeightOfPlane, v44.columns[1].f32[0]);
    _S3 = (float)(HeightOfPlane * HeightOfPlane);
    __asm
    {
      FMLA            S17, S3, V1.S[2]
      FMLS            S17, S16, V1.S[1]
    }
    *(_QWORD *)a3 = v44.columns[0].i64[0];
    *((_DWORD *)a3 + 6) = vnegq_f32(*(float32x4_t *)(&v44 + 16)).i32[2];
    *((_QWORD *)a3 + 2) = v20;
    v44.columns[2].f32[1] = _S17 - v44.columns[2].f32[1];
    __asm { FMLA            S6, S16, V1.S[2] }
    *((_DWORD *)a3 + 10) = _S6;
    *((_QWORD *)a3 + 4) = v44.columns[2].i64[0];
  }
  return v19;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNHomographicImageRegistrationDetector;
  return -[VNDetector completeInitializationForSession:error:](&v5, sel_completeInitializationForSession_error_, a3, a4);
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
  void *v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  __CVBuffer *v29;
  __CVBuffer *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNHomographicImageRegistrationDetector _validatedImageBufferForKey:inOptions:error:](self, "_validatedImageBufferForKey:inOptions:error:", CFSTR("VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageBuffer"), v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[VNHomographicImageRegistrationDetector _validatedImageBufferForKey:inOptions:error:](self, "_validatedImageBufferForKey:inOptions:error:", CFSTR("VNHomographicImageRegistrationDetectorProcessOption_FloatingImageBuffer"), v16, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(v18, "width");
      v21 = objc_msgSend(v19, "height");
      v39.origin.x = x * (double)v20;
      v39.size.width = width * (double)v20;
      v39.origin.y = y * (double)v21;
      v39.size.height = height * (double)v21;
      v40 = CGRectIntegral(v39);
      v22 = v40.origin.x;
      v23 = v40.origin.y;
      v24 = v40.size.width;
      v25 = v40.size.height;
      v37 = y;
      v38 = x;
      v26 = (double)(unint64_t)objc_msgSend(v17, "width");
      v27 = (double)(unint64_t)objc_msgSend(v17, "height");
      v28 = v25 == v27 && v24 == v26;
      if (v28)
      {
        v29 = -[VNHomographicImageRegistrationDetector _createHomographicPixelBufferFromImageBuffer:cropRect:options:error:](self, "_createHomographicPixelBufferFromImageBuffer:cropRect:options:error:", v19, v16, a8, v22, v23, v24, v25);
        *a7 = v29;
        if (v29)
        {
          v30 = -[VNHomographicImageRegistrationDetector _createHomographicPixelBufferFromImageBuffer:cropRect:options:error:](self, "_createHomographicPixelBufferFromImageBuffer:cropRect:options:error:", v17, v16, a8, 0.0, 0.0, v26, v27);
          if (v30)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, CFSTR("VNHomographicImageRegistrationDetectorProcessOption_ReferenceImagePixelBufferRef"));
LABEL_13:

LABEL_15:
            goto LABEL_16;
          }
        }
      }
      else if (a8)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        VNHumanReadableCGRect(v22, v23, v24, v25);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g, %g, %g, %g]"), *(_QWORD *)&v38, *(_QWORD *)&v37, *(_QWORD *)&width, *(_QWORD *)&height);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g x %g"), *(_QWORD *)&v26, *(_QWORD *)&v27);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("registration of region of interest %@ (%@) cannot be performed on reference image of size %@"), v33, v34, v35);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v31);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    v28 = 0;
    goto LABEL_15;
  }
  v28 = 0;
LABEL_16:

  return v28;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  uint64_t *Context;
  void *v18;
  __CVBuffer *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  VNImageHomographicAlignmentObservation *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a7;
  v16 = a9;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  Context = ImageRegistrationCreateContext();
  if (!Context)
  {
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("failed to create image registration context"));
      v25 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_9:
    v25 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VNHomographicImageRegistrationDetectorProcessOption_ReferenceImagePixelBufferRef"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (__CVBuffer *)objc_msgSend(v18, "unsignedIntegerValue");

  v20 = -[VNHomographicImageRegistrationDetector _calculateHomographicWarpTransform:ofFloatingImagePixelBuffer:ontoReferenceImagePixelBuffer:usingImageRegistrationContext:seededWithPreviousWarpTransform:error:](self, "_calculateHomographicWarpTransform:ofFloatingImagePixelBuffer:ontoReferenceImagePixelBuffer:usingImageRegistrationContext:seededWithPreviousWarpTransform:error:", &v27, a4, v19, Context, 0, a8);
  ImageRegistrationDestroyContext(Context);
  CVPixelBufferRelease(v19);
  if (!v20)
    goto LABEL_9;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v14, a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageRegistrationSignature"), v14, a8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNHomographicImageRegistrationDetectorProcessOption_FloatingImageRegistrationSignature"), v14, a8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = -[VNObservation initWithOriginatingRequestSpecifier:]([VNImageHomographicAlignmentObservation alloc], "initWithOriginatingRequestSpecifier:", v21);
        -[VNImageAlignmentObservation setReferenceImageSignature:](v24, "setReferenceImageSignature:", v22);
        -[VNImageAlignmentObservation setFloatingImageSignature:](v24, "setFloatingImageSignature:", v23);
        -[VNImageHomographicAlignmentObservation setWarpTransform:](v24, "setWarpTransform:", *(double *)&v27, *(double *)&v28, *(double *)&v29);
        v30[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

LABEL_16:
  return v25;
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

@end
