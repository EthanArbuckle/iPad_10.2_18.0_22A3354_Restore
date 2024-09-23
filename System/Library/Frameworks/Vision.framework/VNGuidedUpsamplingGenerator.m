@implementation VNGuidedUpsamplingGenerator

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
  __CVBuffer *v21;
  BOOL v22;
  unsigned int v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  v24 = 0;
  if (+[VNValidationUtilities getOSTypeValue:forKey:inOptions:error:](VNValidationUtilities, "getOSTypeValue:forKey:inOptions:error:", &v24, CFSTR("VNGuidedUpsamplingGeneratorOption_InputPixelFormat"), v16, a8))
  {
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = objc_msgSend(v17, "width");
      v20 = objc_msgSend(v18, "height");
      v21 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(width * (double)v19), (unint64_t)(height * (double)v20), v24, v16, a8, x * (double)v19, y * (double)v20);
      *a7 = v21;
      v22 = v21 != 0;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  void *v9;
  id v15;
  void *v16;
  __objc2_class *v17;
  std::vector<unsigned int>::size_type v18;
  unsigned int v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CVBuffer *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t (**v28)(void *, _QWORD, id *);
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  size_t Width;
  size_t Height;
  size_t v35;
  std::vector<unsigned int>::size_type v36;
  CVPixelBufferRef v37;
  uint64_t v38;
  void *v39;
  OSType PixelFormatType;
  __CVBuffer *v41;
  void *v42;
  VNPixelBufferObservation *v43;
  void *v44;
  void *v45;
  char v46;
  __CVBuffer *v47;
  VNPixelBufferObservation *v48;
  void *v49;
  id v50;
  void *v52;
  size_t v53;
  size_t v54;
  id v55;
  void *v56;
  id v57;
  __CVBuffer *pixelBuffer;
  id v59;
  VNGuidedUpsamplingGenerator *v60;
  void *v61;
  void *v62;
  id obj;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[5];
  id v70;
  id v71;
  __CVBuffer *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD aBlock[5];
  id v78;
  int v79;
  std::vector<unsigned int> v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v64 = a7;
  v65 = a9;
  v67 = v15;
  +[VNValidationUtilities requiredArrayForKey:inOptions:withElementsOfClass:error:](VNValidationUtilities, "requiredArrayForKey:inOptions:withElementsOfClass:error:", CFSTR("VNGuidedUpsamplingGeneratorOption_LowResImages"), v15, objc_opt_class(), a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v50 = 0;
    goto LABEL_56;
  }
  v17 = VNValidationUtilities;
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNGuidedUpsamplingGeneratorOption_OutputPixelFormat"), v15, a8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v62)
  {
    v50 = 0;
    goto LABEL_55;
  }
  v18 = objc_msgSend(v16, "count");
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v67, a8);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v61)
  {
LABEL_46:
    v50 = 0;
    goto LABEL_54;
  }
  v19 = objc_msgSend(v62, "unsignedIntValue");
  if (v19 - 1278226488 > 0x30 || ((1 << (v19 - 56)) & 0x1400000000001) == 0)
  {
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("unsupported output pixel format"));
      v50 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
    goto LABEL_46;
  }
  std::vector<unsigned int>::vector(&v80, v18);
  pixelBuffer = a4;
  v60 = self;
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
  if (v18)
  {
    for (i = 0; i != v18; ++i)
    {
      v80.__begin_[i] = v19;
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "featureName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", i);
        a4 = (const __CVBuffer *)objc_claimAutoreleasedReturnValue();
        -[__CVBuffer featureName](a4, "featureName");
        v23 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v23;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v23 = objc_claimAutoreleasedReturnValue();
        v17 = (__objc2_class *)v23;
      }
      objc_msgSend(v68, "setObject:atIndexedSubscript:", v23, i);
      v24 = (const __CVBuffer *)v17;
      if (v22)
      {

        v24 = a4;
      }

    }
  }
  +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:", v67, a8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v50 = 0;
    goto LABEL_52;
  }
  v55 = v25;
  objc_msgSend(v25, "vnciContextManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__VNGuidedUpsamplingGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E4545460;
  v79 = 1278226534;
  aBlock[4] = v60;
  v59 = v26;
  v78 = v59;
  v28 = (uint64_t (**)(void *, _QWORD, id *))_Block_copy(aBlock);
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v16;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v74 != v30)
          objc_enumerationMutation(obj);
        v32 = (void *)v28[2](v28, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j), a8);
        if (!v32)
          goto LABEL_42;
        objc_msgSend(v66, "addObject:", v32);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v29);
  }

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  if (v18)
  {
    v35 = Height;
    v36 = v18;
    while (1)
    {
      v37 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, v35, 1278226534, a8);
      if (!v37)
        break;
      objc_msgSend(obj, "addObject:", v37);

      if (!--v36)
        goto LABEL_27;
    }
LABEL_42:
    v50 = 0;
    goto LABEL_51;
  }
LABEL_27:
  v69[0] = v27;
  v69[1] = 3221225472;
  v69[2] = __129__VNGuidedUpsamplingGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
  v69[3] = &unk_1E4545488;
  v69[4] = v60;
  v70 = v66;
  v57 = obj;
  v71 = v57;
  v72 = pixelBuffer;
  v52 = _Block_copy(v69);
  if ((VNExecuteBlock(v52, (uint64_t)a8) & 1) == 0)
  {
    v50 = 0;
    goto LABEL_50;
  }
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
  v54 = CVPixelBufferGetWidth(pixelBuffer);
  v53 = CVPixelBufferGetHeight(pixelBuffer);
  if (!v18)
  {
LABEL_39:
    v49 = v56;
    v50 = v56;
    goto LABEL_49;
  }
  v38 = 0;
  while (1)
  {
    objc_msgSend(v57, "objectAtIndexedSubscript:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v39);
    if (PixelFormatType != v80.__begin_[v38])
      break;
    v41 = CVPixelBufferRetain((CVPixelBufferRef)v39);
LABEL_33:
    v43 = [VNPixelBufferObservation alloc];
    objc_msgSend(v68, "objectAtIndexedSubscript:", v38);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);
    if ((v46 & 1) != 0)
    {
      v47 = 0;
    }
    else
    {
      objc_msgSend(v68, "objectAtIndexedSubscript:", v38);
      pixelBuffer = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      v47 = pixelBuffer;
    }
    v48 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:](v43, "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v61, v47, v41);
    if ((v46 & 1) == 0)

    CVPixelBufferRelease(v41);
    objc_msgSend(v56, "addObject:", v48);

    if (v18 == ++v38)
      goto LABEL_39;
  }
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", v39);
  v41 = -[VNGuidedUpsamplingGenerator _renderCIImage:width:height:format:vnciContextManager:error:](v60, "_renderCIImage:width:height:format:vnciContextManager:error:", v42, v54, v53, v80.__begin_[v38], v59, a8);

  if (v41)
    goto LABEL_33;
  v50 = 0;
  v49 = v56;
LABEL_49:

LABEL_50:
LABEL_51:

  v25 = v55;
LABEL_52:

  if (v80.__begin_)
  {
    v80.__end_ = v80.__begin_;
    operator delete(v80.__begin_);
  }
LABEL_54:

LABEL_55:
LABEL_56:

  return v50;
}

- (BOOL)_renderCIImage:(id)a3 toBuffer:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 rowBytes:(unint64_t)a7 format:(unsigned int)a8 vnciContextManager:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  _QWORD v22[4];
  id v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unsigned int v28;

  v16 = a3;
  v17 = a9;
  -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __109__VNGuidedUpsamplingGenerator__renderCIImage_toBuffer_width_height_rowBytes_format_vnciContextManager_error___block_invoke;
    v22[3] = &unk_1E45454B0;
    v24 = a4;
    v25 = a6;
    v26 = a5;
    v27 = a7;
    v23 = v16;
    v28 = a8;
    v19 = _Block_copy(v22);
    v20 = -[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v17, v19, v18, a10);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (__CVBuffer)_renderCIImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unsigned int)a6 vnciContextManager:(id)a7 error:(id *)a8
{
  uint64_t v10;
  id v14;
  id v15;
  void *v16;
  __CVBuffer *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  __CVBuffer *v22;

  v10 = *(_QWORD *)&a6;
  v14 = a3;
  v15 = a7;
  -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4, a5, v10, a8);
    if (v17)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __91__VNGuidedUpsamplingGenerator__renderCIImage_width_height_format_vnciContextManager_error___block_invoke;
      v20[3] = &unk_1E45469E8;
      v21 = v14;
      v22 = v17;
      v18 = _Block_copy(v20);
      if ((-[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v15, v18, v16, a8) & 1) == 0)
      {
        CVPixelBufferRelease(v17);
        v17 = 0;
      }

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __91__VNGuidedUpsamplingGenerator__renderCIImage_width_height_format_vnciContextManager_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
    v3 = *(void **)(a2 + 8);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "render:toCVPixelBuffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return 1;
}

uint64_t __109__VNGuidedUpsamplingGenerator__renderCIImage_toBuffer_width_height_rowBytes_format_vnciContextManager_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  return -[VNCIContext renderCIImage:buffer:format:error:](a2, v4, &v6, *(_DWORD *)(a1 + 72), a3);
}

__CVBuffer *__129__VNGuidedUpsamplingGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  __CVBuffer *v6;
  __CVBuffer *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v18;

  v5 = a2;
  v6 = (__CVBuffer *)objc_msgSend(v5, "pixelBuffer");
  v7 = v6;
  if (!v6)
  {
    if (a3)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNPixelBufferObservation missing pixel buffer"));
      v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  if (CVPixelBufferGetPixelFormatType(v6) != *(_DWORD *)(a1 + 48))
  {
    v8 = (void *)MEMORY[0x1A1B0B060]();
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "extent");
    v12 = v11;
    objc_msgSend(v9, "extent");
    v14 = *(unsigned int *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 40);
    v18 = 0;
    v7 = (__CVBuffer *)objc_msgSend(v10, "_renderCIImage:width:height:format:vnciContextManager:error:", v9, (unint64_t)v12, (unint64_t)v13, v14, v15, &v18);
    v16 = v18;

    objc_autoreleasePoolPop(v8);
    if (v7)
    {

      goto LABEL_12;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v16);

    goto LABEL_11;
  }
  CVPixelBufferRetain(v7);
LABEL_12:

  return v7;
}

BOOL __129__VNGuidedUpsamplingGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  objc_class *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "metalContext");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[VNMetalContext bindPixelBuffersToTextures:error:](v4, *(void **)(a1 + 40), a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[VNMetalContext bindPixelBuffersToTextures:error:](v5, *(void **)(a1 + 48), a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[VNMetalContext bindPixelBufferToMTL2DTexture:error:](v5, *(CVPixelBufferRef *)(a1 + 56), a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[VNMetalContext createGuidedFilterForTextures:referenceTexture:error:](v5, v6, v8, a2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            v10 = -[VNMetalContext upsampleTextures:referenceTexture:constraintsTextures:upsampledTextures:filter:waitForCompletion:error:]((_BOOL8)v5, v6, v8, 0, v7, v9, 1, a2);
          else
            v10 = 0;

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
    goto LABEL_17;
  }
  if (a2)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@ does not have a metal context"), v13);

    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v6);
    v10 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

@end
