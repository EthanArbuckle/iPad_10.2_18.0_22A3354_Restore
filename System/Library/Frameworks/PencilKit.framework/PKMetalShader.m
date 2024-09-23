@implementation PKMetalShader

- (PKMetalShader)init
{
  objc_exception_throw(CFSTR("Not available"));
}

- (uint64_t)initWithVertexFunction:(void *)a3 fragmentFunction:(uint64_t)a4 blendMode:(uint64_t)a5 colorAttachmentIndex:(void *)a6 sharedPipelineDescriptor:(uint64_t)a7 numColorAttachments:
{
  id v14;
  id v15;
  id v16;
  id *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  objc_super v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v16 = a6;
  if (a1)
  {
    v25.receiver = (id)a1;
    v25.super_class = (Class)PKMetalShader;
    v17 = (id *)objc_msgSendSuper2(&v25, sel_init);
    a1 = (uint64_t)v17;
    if (v17)
    {
      objc_storeStrong(v17 + 1, a2);
      objc_storeStrong((id *)(a1 + 16), a3);
      *(_QWORD *)(a1 + 64) = a4;
      *(_QWORD *)(a1 + 72) = a5;
      objc_storeStrong((id *)(a1 + 80), a6);
      *(_QWORD *)(a1 + 88) = a7;
      objc_msgSend(*(id *)(a1 + 8), "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalShader pipelineStateDescriptorSampleCount:](a1, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v20 = objc_msgSend(v18, "newRenderPipelineStateWithDescriptor:error:", v19, &v26);
      v21 = v26;
      v22 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v20;

      if (!*(_QWORD *)(a1 + 24))
      {
        v23 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v21;
          _os_log_error_impl(&dword_1BE213000, v23, OS_LOG_TYPE_ERROR, "Error creating pipeline state: %@", buf, 0xCu);
        }

      }
    }
  }

  return a1;
}

- (id)pipelineStateDescriptorSampleCount:(uint64_t)a1
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v4 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  objc_msgSend(*(id *)(a1 + 80), "pipelineLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPipelineLibrary:", v5);

  objc_msgSend(v4, "setLabel:", CFSTR("Pipeline State"));
  objc_msgSend(v4, "setVertexFunction:", *(_QWORD *)(a1 + 8));
  objc_msgSend(v4, "setFragmentFunction:", *(_QWORD *)(a1 + 16));
  if (*(_QWORD *)(a1 + 88))
  {
    v6 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 80), "colorAttachments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "pixelFormat");
      objc_msgSend(v4, "colorAttachments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPixelFormat:", v9);

      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 88));
  }
  objc_msgSend(v4, "setStencilAttachmentPixelFormat:", objc_msgSend(*(id *)(a1 + 80), "stencilAttachmentPixelFormat"));
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v4, "colorAttachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setBlendingEnabled:", 1);
    v14 = *(_QWORD *)(a1 + 64);
    switch(v14)
    {
      case 1:
        objc_msgSend(v13, "setRgbBlendOperation:", 4);
        objc_msgSend(v13, "setAlphaBlendOperation:", 4);
        break;
      case 2:
      case 3:
      case 4:
        v15 = 2 * (v14 == 4);
        objc_msgSend(v13, "setRgbBlendOperation:", v15);
        objc_msgSend(v13, "setAlphaBlendOperation:", v15);
        objc_msgSend(v13, "setSourceRGBBlendFactor:", 1);
        objc_msgSend(v13, "setSourceAlphaBlendFactor:", 1);
        if (*(_QWORD *)(a1 + 64) == 3)
          v16 = 3;
        else
          v16 = 5;
        objc_msgSend(v13, "setDestinationRGBBlendFactor:", v16);
        if (*(_QWORD *)(a1 + 64) == 3)
          v17 = 1;
        else
          v17 = 5;
        v18 = v13;
        goto LABEL_19;
      case 5:
        objc_msgSend(v13, "setRgbBlendOperation:", 0);
        objc_msgSend(v13, "setAlphaBlendOperation:", 0);
        objc_msgSend(v13, "setSourceRGBBlendFactor:", 7);
        objc_msgSend(v13, "setSourceAlphaBlendFactor:", 9);
        objc_msgSend(v13, "setDestinationRGBBlendFactor:", 0);
        v18 = v13;
        v17 = 0;
        goto LABEL_19;
      case 6:
        objc_msgSend(v13, "setRgbBlendOperation:", 0);
        objc_msgSend(v13, "setAlphaBlendOperation:", 0);
        objc_msgSend(v13, "setSourceRGBBlendFactor:", 1);
        objc_msgSend(v13, "setSourceAlphaBlendFactor:", 1);
        v19 = v13;
        v20 = 1;
        goto LABEL_18;
      case 7:
        objc_msgSend(v13, "setRgbBlendOperation:", 0);
        objc_msgSend(v13, "setAlphaBlendOperation:", 0);
        objc_msgSend(v13, "setSourceRGBBlendFactor:", 6);
        objc_msgSend(v13, "setSourceAlphaBlendFactor:", 0);
        objc_msgSend(v13, "setDestinationRGBBlendFactor:", 5);
        v18 = v13;
        v17 = 1;
        goto LABEL_19;
      case 8:
        objc_msgSend(v13, "setRgbBlendOperation:", 0);
        objc_msgSend(v13, "setAlphaBlendOperation:", 0);
        objc_msgSend(v13, "setSourceRGBBlendFactor:", 1);
        objc_msgSend(v13, "setSourceAlphaBlendFactor:", 1);
        v19 = v13;
        v20 = 5;
LABEL_18:
        objc_msgSend(v19, "setDestinationRGBBlendFactor:", v20);
        v18 = v13;
        v17 = 5;
LABEL_19:
        objc_msgSend(v18, "setDestinationAlphaBlendFactor:", v17);
        break;
      default:
        break;
    }

  }
  objc_msgSend(v4, "setRasterSampleCount:", a2);
  return v4;
}

- (id)msaaPipelineStateWithSampleCount:(id *)a1
{
  id *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2 == 1)
    return a1[3];
  v4 = a1;
  objc_sync_enter(v4);
  v5 = v4[5];
  if (!v5 || v4[21] != (id)a2)
  {
    objc_msgSend(v4[1], "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalShader pipelineStateDescriptorSampleCount:]((uint64_t)v4, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = objc_msgSend(v6, "newRenderPipelineStateWithDescriptor:error:", v7, &v13);
    v9 = v13;
    v10 = v4[5];
    v4[5] = (id)v8;

    v4[21] = (id)a2;
    if (!v4[5])
    {
      v11 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_error_impl(&dword_1BE213000, v11, OS_LOG_TYPE_ERROR, "Error creating pipeline state: %@", buf, 0xCu);
      }

    }
    v5 = v4[5];
  }
  v12 = v5;
  objc_sync_exit(v4);

  return v12;
}

- (uint64_t)newShaderWithBlendMode:(uint64_t)a1
{
  return -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)[PKMetalShader alloc], *(void **)(a1 + 8), *(void **)(a1 + 16), a2, *(_QWORD *)(a1 + 72), *(void **)(a1 + 80), *(_QWORD *)(a1 + 88));
}

- (void)shaderWithBlendMode:(_QWORD *)a1
{
  uint64_t v3;
  void **v4;
  void **v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  if (a1)
  {
    v3 = a1[8];
    v4 = a1;
    v5 = v4;
    if (v3 != a2)
    {
      objc_sync_enter(v4);
      v6 = v5;
      switch(a2)
      {
        case 0:
          v7 = v5 + 12;
          v6 = v5[12];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 0);
            goto LABEL_22;
          }
          break;
        case 1:
          v7 = v5 + 19;
          v6 = v5[19];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 1);
            goto LABEL_22;
          }
          break;
        case 2:
          v7 = v5 + 13;
          v6 = v5[13];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 2);
            goto LABEL_22;
          }
          break;
        case 3:
          v7 = v5 + 14;
          v6 = v5[14];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 3);
            goto LABEL_22;
          }
          break;
        case 4:
          v7 = v5 + 18;
          v6 = v5[18];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 4);
            goto LABEL_22;
          }
          break;
        case 5:
          v7 = v5 + 20;
          v6 = v5[20];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 5);
            goto LABEL_22;
          }
          break;
        case 6:
          v7 = v5 + 15;
          v6 = v5[15];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 6);
            goto LABEL_22;
          }
          break;
        case 7:
          v7 = v5 + 16;
          v6 = v5[16];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 7);
            goto LABEL_22;
          }
          break;
        case 8:
          v7 = v5 + 17;
          v6 = v5[17];
          if (!v6)
          {
            v8 = -[PKMetalShader newShaderWithBlendMode:]((uint64_t)v5, 8);
LABEL_22:
            v9 = *v7;
            *v7 = (void *)v8;

            v6 = *v7;
          }
          break;
        default:
          break;
      }
      v10 = v6;
      objc_sync_exit(v5);

      v5 = (void **)v10;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invertBlendModeShader, 0);
  objc_storeStrong((id *)&self->_maxBlendModeShader, 0);
  objc_storeStrong((id *)&self->_subtractBlendModeShader, 0);
  objc_storeStrong((id *)&self->_sourceOverBlendModeShader, 0);
  objc_storeStrong((id *)&self->_multiplyBlendModeShader, 0);
  objc_storeStrong((id *)&self->_linearDodgeBlendModeShader, 0);
  objc_storeStrong((id *)&self->_addNoAlphaBlendModeShader, 0);
  objc_storeStrong((id *)&self->_addBlendModeShader, 0);
  objc_storeStrong((id *)&self->_noBlendModeShader, 0);
  objc_storeStrong((id *)&self->_sharedPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_msaaPipelineStateWithColorMaskNone, 0);
  objc_storeStrong((id *)&self->_msaaPipelineState, 0);
  objc_storeStrong((id *)&self->_pipelineStateWithColorMaskNone, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_fragmentFunction, 0);
  objc_storeStrong((id *)&self->_vertexFunction, 0);
}

@end
