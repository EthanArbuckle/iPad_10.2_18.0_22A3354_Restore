@implementation VNMetalContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wisdomParams, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (_QWORD)metalContextForDevice:(_QWORD *)a3 error:
{
  id v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  objc_super v18;

  v4 = a2;
  v5 = (objc_class *)objc_opt_self();
  if (v4)
  {
    v6 = v4;
    goto LABEL_4;
  }
  v6 = MTLCreateSystemDefaultDevice();
  if (v6)
  {
LABEL_4:
    +[VNFrameworkManager manager](VNFrameworkManager, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wisdomParameterForMTLDevice:error:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [v5 alloc];
    v10 = v6;
    v11 = v8;
    if (v9
      && (v18.receiver = v9,
          v18.super_class = (Class)VNMetalContext,
          v12 = objc_msgSendSuper2(&v18, sel_init),
          (v13 = v12) != 0))
    {
      *((_DWORD *)v12 + 4) = 0;
      objc_storeStrong((id *)v12 + 1, v6);
      v14 = objc_msgSend(v11, "copy");
      v15 = (void *)v13[5];
      v13[5] = v14;

      v16 = v13;
    }
    else
    {

      if (a3)
      {
        +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
        v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
    }

    return v16;
  }
  if (a3)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot create MTLDevice"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (os_unfair_lock_s)commandQueueReturnError:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = a1;
  if (a1)
  {
    v4 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v5 = *(void **)&v2[6]._os_unfair_lock_opaque;
    if (!v5)
    {
      v6 = objc_msgSend(*(id *)&v2[2]._os_unfair_lock_opaque, "newCommandQueue");
      v7 = *(void **)&v2[6]._os_unfair_lock_opaque;
      *(_QWORD *)&v2[6]._os_unfair_lock_opaque = v6;

      v8 = *(void **)&v2[6]._os_unfair_lock_opaque;
      if (!v8)
      {
        if (a2)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to create MTLCommandQueue"));
          v2 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v2 = 0;
        }
        goto LABEL_6;
      }
      objc_msgSend(v8, "setBackgroundGPUPriority:", 2);
      v5 = *(void **)&v2[6]._os_unfair_lock_opaque;
    }
    v2 = v5;
LABEL_6:
    os_unfair_lock_unlock(v4);
  }
  return v2;
}

- (os_unfair_lock_s)libraryReturnError:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = a1;
  if (a1)
  {
    v4 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v5 = *(void **)&v2[8]._os_unfair_lock_opaque;
    if (!v5)
    {
      v6 = *(void **)&v2[2]._os_unfair_lock_opaque;
      VNFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "newDefaultLibraryWithBundle:error:", v7, a2);
      v9 = *(void **)&v2[8]._os_unfair_lock_opaque;
      *(_QWORD *)&v2[8]._os_unfair_lock_opaque = v8;

      v5 = *(void **)&v2[8]._os_unfair_lock_opaque;
    }
    v2 = v5;
    os_unfair_lock_unlock(v4);
  }
  return v2;
}

- (id)bindPixelBufferToMTL2DTexture:(_QWORD *)a3 error:
{
  void *v5;
  signed int PixelFormatType;
  uint64_t v7;
  id v9;

  if (a1)
  {
    v5 = a1;
    PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    objc_opt_self();
    if (PixelFormatType > 1278226533)
    {
      if (PixelFormatType == 1278226536)
      {
        v7 = 25;
        goto LABEL_11;
      }
      if (PixelFormatType == 1278226534)
      {
        v7 = 55;
        goto LABEL_11;
      }
    }
    else
    {
      if (PixelFormatType == 1111970369)
      {
        v7 = 80;
        goto LABEL_11;
      }
      if (PixelFormatType == 1278226488)
      {
        v7 = 10;
LABEL_11:
        -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v5, pixelBuffer, v7, a3);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    if (a3)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unimplemented conversion"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      a1 = 0;
      *a3 = v9;
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)bindPixelBufferToMTL2DTexture:(void *)a1 pixelFormat:(CVPixelBufferRef)pixelBuffer plane:(uint64_t)a3 error:(_QWORD *)a4
{
  uint64_t v6;
  __IOSurface *IOSurface;
  __IOSurface *v8;
  size_t WidthOfPlane;
  size_t HeightOfPlane;

  if (a1)
  {
    v6 = (uint64_t)a1;
    IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
    if (IOSurface)
    {
      v8 = IOSurface;
      WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, 0);
      HeightOfPlane = IOSurfaceGetHeightOfPlane(v8, 0);
      -[VNMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:error:](v6, (uint64_t)v8, a3, WidthOfPlane, HeightOfPlane, a4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("pixel buffer does not have an IOSurface"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        return 0;
      }
      a1 = 0;
    }
  }
  return a1;
}

- (id)bindIOSurfaceToMTL2DTexture:(uint64_t)a1 pixelFormat:(uint64_t)a2 width:(uint64_t)a3 height:(uint64_t)a4 plane:(uint64_t)a5 error:(_QWORD *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a3, a4, a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setUsage:", 23);
    v11 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:iosurface:plane:", v10, a2, 0);
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to create MTLTexture"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a6)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to create MTLTextureDescriptor"));
    v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)bindPixelBufferToMTL2DTexture:(uint64_t)a3 pixelFormat:(_QWORD *)a4 textureSize:(double)a5 plane:(double)a6 error:
{
  uint64_t v10;
  __IOSurface *IOSurface;
  __IOSurface *v12;
  const __CFString *v13;

  if (a1)
  {
    v10 = (uint64_t)a1;
    IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
    if (!IOSurface)
    {
      if (a4)
      {
        v13 = CFSTR("Pixel buffer does not have an IOSurface");
        goto LABEL_11;
      }
      return 0;
    }
    v12 = IOSurface;
    if (IOSurfaceGetWidthOfPlane(IOSurface, 0) < (unint64_t)a5)
    {
      if (a4)
      {
        v13 = CFSTR("IOsurface width is smaller than texture width");
LABEL_11:
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v13);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        return 0;
      }
      return 0;
    }
    if (IOSurfaceGetHeightOfPlane(v12, 0) < (unint64_t)a6)
    {
      if (a4)
      {
        v13 = CFSTR("IOsurface height is smaller than texture height");
        goto LABEL_11;
      }
      return 0;
    }
    -[VNMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:width:height:plane:error:](v10, (uint64_t)v12, a3, (unint64_t)a5, (unint64_t)a6, a4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)bindPixelBuffersToTextures:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          -[VNMetalContext bindPixelBufferToMTL2DTexture:error:](a1, *(CVPixelBufferRef *)(*((_QWORD *)&v14 + 1) + 8 * i), a3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {

            v12 = 0;
            goto LABEL_12;
          }
          objc_msgSend(v6, "addObject:", v11, (_QWORD)v14);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    v12 = (void *)objc_msgSend(v6, "copy");
LABEL_12:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)computePipelineStateForFunctionWithName:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    -[VNMetalContext libraryReturnError:]((os_unfair_lock_s *)a1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_msgSend(v6, "newFunctionWithName:", v5);
      v9 = (void *)objc_msgSend(*(id *)(a1 + 8), "newComputePipelineStateWithFunction:error:", v8, a3);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeCommandsForBuffer:(void *)a3 state:(uint64_t)a4 label:(uint64_t)a5 width:(void *)a6 height:(void *)a7 textures:buffers:block:
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id);
  void *v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v13 = a2;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  if (a1)
  {
    objc_msgSend(v13, "computeCommandEncoder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setComputePipelineState:", v14);
    v18 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __90__VNMetalContext_encodeCommandsForBuffer_state_label_width_height_textures_buffers_block___block_invoke;
      v26[3] = &unk_1E4545760;
      v27 = v17;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v26);

    }
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __90__VNMetalContext_encodeCommandsForBuffer_state_label_width_height_textures_buffers_block___block_invoke_2;
    v24[3] = &unk_1E4545788;
    v19 = v17;
    v25 = v19;
    objc_msgSend(0, "enumerateObjectsUsingBlock:", v24);
    if (v16)
      v16[2](v16, v19);
    v20 = objc_msgSend(v14, "threadExecutionWidth");
    v21 = objc_msgSend(v14, "maxTotalThreadsPerThreadgroup");
    v23[0] = (a4 + v20 - 1) / v20;
    v23[1] = (a5 + v21 / v20 - 1) / (v21 / v20);
    v23[2] = 1;
    v22[0] = v20;
    v22[1] = v21 / v20;
    v22[2] = 1;
    objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", v23, v22);
    objc_msgSend(v19, "endEncoding");

  }
}

uint64_t __90__VNMetalContext_encodeCommandsForBuffer_state_label_width_height_textures_buffers_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTexture:atIndex:", a2, a3);
}

uint64_t __90__VNMetalContext_encodeCommandsForBuffer_state_label_width_height_textures_buffers_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBuffer:offset:atIndex:", a2, 0, a3);
}

- (_QWORD)createGuidedFilterForTextures:(void *)a3 referenceTexture:(_QWORD *)a4 error:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v27 = a3;
  if (!a1)
    goto LABEL_30;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "pixelFormat");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "width");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "height");

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v14)
      goto LABEL_13;
    v15 = *(_QWORD *)v30;
LABEL_5:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v15)
        objc_enumerationMutation(v13);
      v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
      if (v10 != objc_msgSend(v17, "width") || v12 != objc_msgSend(v17, "height"))
        break;
      if (v8 != objc_msgSend(v17, "pixelFormat"))
      {
        if (a4)
        {
          v20 = CFSTR("Texture pixel formats do not match");
LABEL_23:
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v20);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_24;
      }
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v14)
          goto LABEL_5;
LABEL_13:

        v18 = objc_msgSend(v27, "pixelFormat");
        if (v18 > 69)
        {
          if (v18 != 80 && v18 != 70)
            goto LABEL_31;
          v19 = 3;
        }
        else
        {
          v19 = 1;
          if (v18 != 10 && v18 != 55)
          {
LABEL_31:
            if (a4)
            {
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unimplemented format for guided upsampling"));
              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v26);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
LABEL_25:
            a1 = 0;
            goto LABEL_30;
          }
        }
        v21 = (void *)MEMORY[0x1E0CC6E98];
        v22 = objc_msgSend(v13, "count");
        LODWORD(v23) = 953267991;
        objc_msgSend(v21, "filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:", v10, v12, 1, 3, 1, v22, v23, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E90]), "initWithDevice:filterDescriptor:", a1[1], v24);

        goto LABEL_30;
      }
    }
    if (a4)
    {
      v20 = CFSTR("Texture sizes do not match");
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (!a4)
    goto LABEL_25;
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Texture array cannot be empty"));
  a1 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return a1;
}

- (BOOL)upsampleTextures:(void *)a3 referenceTexture:(void *)a4 constraintsTextures:(void *)a5 upsampledTextures:(void *)a6 filter:(int)a7 waitForCompletion:(_QWORD *)a8 error:
{
  id v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a2;
  v32 = a3;
  v31 = a4;
  v33 = a5;
  v30 = a6;
  if (!a1)
    goto LABEL_23;
  v15 = objc_msgSend(v14, "count");
  if (!v15)
  {
    if (!a8)
      goto LABEL_22;
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Invalid texture count of 0"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    a1 = 0;
    *a8 = v27;
    goto LABEL_23;
  }
  if (v15 != objc_msgSend(v33, "count"))
  {
    if (!a8)
      goto LABEL_22;
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Texture count mismatch between input and output textures"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "width");

  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "height");

  if (v15 >= 2)
  {
    v20 = 1;
    while (1)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "width") != v17)
        break;
      objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "height");

      if (v23 != v19)
        goto LABEL_19;
      if (v15 == ++v20)
        goto LABEL_9;
    }

LABEL_19:
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Texture size mismatch"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_22:
    a1 = 0;
    goto LABEL_23;
  }
LABEL_9:
  -[VNMetalContext commandQueueReturnError:]((os_unfair_lock_s *)a1, a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  a1 = v24 != 0;
  if (v24)
  {
    objc_msgSend(v24, "commandBuffer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "encodeToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationTextureArray:", v26, v14, v32, v31, 20, v33);
    objc_msgSend(v26, "commit");
    if (a7)
      objc_msgSend(v26, "waitUntilCompleted");

  }
LABEL_23:

  return a1;
}

@end
