@implementation ARUIRenderer

- (void)renderRings:(id)a3 spriteSheet:(id)a4 intoDrawable:(id)a5 withContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v14, "texture");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer _renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:](self, "_renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:", v16, v15, v17, v14, v13, 0, v12);

}

- (void)_renderRings:(id)a3 commandEncoder:(id)a4 passDescriptor:(id)a5 commandBuffer:(id)a6 withContext:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a7;
  -[ARUIRingsRenderer beginRenderingWithCommandEncoder:](self->_ringsRenderer, "beginRenderingWithCommandEncoder:", v11);
  -[ARUIRenderer ringsRenderPipelineConfigurationForRings:context:](self, "ringsRenderPipelineConfigurationForRings:context:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRingsRenderPipelineFactory pipelineForConfiguration:](self->_ringsRenderPipelineFactory, "pipelineForConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          -[ARUIRingsRenderer renderRings:intoContext:withCommandEncoder:forState:](self->_ringsRenderer, "renderRings:intoContext:withCommandEncoder:forState:", v10, v12, v11, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

  }
}

- (id)ringsRenderPipelineConfigurationForRings:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  float v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  float v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  float v24;
  float v25;
  int v26;
  int v27;
  _BOOL8 v28;
  _BOOL8 v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  float v34;
  float v35;
  uint64_t v37;
  void *v38;
  float v39;
  double v40;
  double v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  float v45;
  double v46;
  double v47;
  ARUIRingsRenderPipelineConfiguration *v48;
  id v50;
  unsigned int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v57 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "percentage");
        if (v12 == *(float *)&ARUIRingPercentageValueNoRing)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v53;
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "percentage");
        if (v18 != *(float *)&ARUIRingPercentageValueNoRing)
        {
          v15 = 1;
          goto LABEL_21;
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_21:

  v19 = objc_msgSend(v6, "opaque");
  v20 = objc_msgSend(v14, "count");
  v21 = v20;
  if (v20)
  {
    v51 = v13;
    if ((v19 & 1) != 0)
    {
      v22 = 0;
      while (1)
      {
        objc_msgSend(v14, "objectAtIndex:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "opacity");
        v25 = v24;

        if (v25 > 0.0)
          break;
        if (v21 == ++v22)
        {
          v26 = 0;
          v27 = 0;
          goto LABEL_38;
        }
      }
      v26 = 0;
      v27 = 1;
    }
    else
    {
      v50 = v6;
      v30 = 0;
      v26 = 0;
      v31 = 0;
      v32 = v20 - 1;
      do
      {
        objc_msgSend(v14, "objectAtIndex:", v31, v50);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "opacity");
        if (v34 > 0.0)
          v30 = 1;
        objc_msgSend(v33, "opacity");
        if (v35 < 1.0)
          v26 = 1;
        v27 = v30;

        if ((v30 & 1 & v26) != 0)
          break;
      }
      while (v32 != v31++);
      v6 = v50;
    }
LABEL_38:
    if (v21 <= 1)
      v37 = 1;
    else
      v37 = v21;
    objc_msgSend(v14, "objectAtIndex:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "percentage");
    v40 = v39;
    v41 = *(double *)&ARUIRingsRenderPipelineConfigurationOverlappingThreshold;

    if (v41 < v40)
    {
      v21 = 1;
    }
    else
    {
      v42 = 1;
      do
      {
        v43 = v42;
        if (v37 == v42)
          break;
        objc_msgSend(v14, "objectAtIndex:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "percentage");
        v46 = v45;
        v47 = *(double *)&ARUIRingsRenderPipelineConfigurationOverlappingThreshold;

        v42 = v43 + 1;
      }
      while (v47 >= v46);
      v21 = v43 < v21;
    }
    v28 = v26 != 0;
    v29 = v27 != 0;
    v13 = v51;
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }
  v48 = objc_alloc_init(ARUIRingsRenderPipelineConfiguration);
  -[ARUIRingsRenderPipelineConfiguration setHasVisibleRings:](v48, "setHasVisibleRings:", v29);
  -[ARUIRingsRenderPipelineConfiguration setHasEmptyRing:](v48, "setHasEmptyRing:", v13);
  -[ARUIRingsRenderPipelineConfiguration setHasFilledRing:](v48, "setHasFilledRing:", v15);
  -[ARUIRingsRenderPipelineConfiguration setNeedsAlphaReductionPass:](v48, "setNeedsAlphaReductionPass:", v28);
  -[ARUIRingsRenderPipelineConfiguration setHasOverlappingRing:](v48, "setHasOverlappingRing:", v21);

  return v48;
}

- (void)_renderRings:(id)a3 spriteSheet:(id)a4 intoTexture:(id)a5 presentingDrawable:(id)a6 withContext:(id)a7 waitUntilCompleted:(BOOL)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _BOOL4 v31;
  _QWORD v32[4];
  id v33;

  v31 = a8;
  v14 = a3;
  v30 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "colorAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTexture:", v15);

  objc_msgSend(v20, "colorAttachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v20, "colorAttachments");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setStoreAction:", 1);

  objc_msgSend(v20, "colorAttachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLoadAction:", 2);

  objc_msgSend(v19, "renderCommandEncoderWithDescriptor:", v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer _renderRings:commandEncoder:passDescriptor:commandBuffer:withContext:](self, "_renderRings:commandEncoder:passDescriptor:commandBuffer:withContext:", v14, v29, v20, v19, v17);
  if (v30)
    -[ARUISpritesRenderer renderSpriteSheet:intoContext:withCommandEncoder:](self->_spritesRenderer, "renderSpriteSheet:intoContext:withCommandEncoder:", v30, v17, v29);
  objc_msgSend(v29, "endEncoding");
  -[ARUICelebrationsRenderer renderCelebrationsForRings:withCommandBuffer:intoTexture:withContext:](self->_celebrationsRenderer, "renderCelebrationsForRings:withCommandBuffer:intoTexture:withContext:", v14, v19, v15, v17);
  if (v18)
  {
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __114__ARUIRenderer__renderRings_spriteSheet_intoTexture_presentingDrawable_withContext_waitUntilCompleted_completion___block_invoke;
    v32[3] = &unk_24CEC5D30;
    v33 = v18;
    objc_msgSend(v19, "addCompletedHandler:", v32);

  }
  if (objc_msgSend(v17, "presentsWithTransaction"))
  {
    objc_msgSend(v19, "commit");
    if (v16)
    {
      objc_msgSend(v19, "waitUntilScheduled");
      objc_msgSend(v16, "present");
    }
  }
  else
  {
    if (v16)
      objc_msgSend(v19, "presentDrawable:", v16);
    objc_msgSend(v19, "commit");
  }
  if (v31)
    objc_msgSend(v19, "waitUntilCompleted");

}

uint64_t __114__ARUIRenderer__renderRings_spriteSheet_intoTexture_presentingDrawable_withContext_waitUntilCompleted_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (ARUIRenderer)init
{
  return -[ARUIRenderer initWithRenderStyle:commandQueue:](self, "initWithRenderStyle:commandQueue:", 0, 0);
}

- (ARUIRenderer)initWithRenderStyle:(unint64_t)a3 commandQueue:(id)a4
{
  id v6;
  ARUIRenderer *v7;
  ARUIRenderer *v8;
  MTLDeviceSPI *v9;
  MTLDeviceSPI *device;
  MTLDeviceSPI *v11;
  MTLCommandQueue *v12;
  MTLCommandQueue *commandQueue;
  ARUIRingsRenderer *v14;
  ARUIRingsRenderer *ringsRenderer;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  ARUIRingsRenderPipelineFactory *ringsRenderPipelineFactory;
  ARUISpritesRenderer *v22;
  ARUISpritesRenderer *spritesRenderer;
  ARUICelebrationsRenderer *v24;
  ARUICelebrationsRenderer *celebrationsRenderer;
  objc_super v27;

  v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ARUIRenderer;
  v7 = -[ARUIRenderer init](&v27, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_renderStyle = a3;
    v9 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
    device = v8->_device;
    v8->_device = v9;

    v11 = v8->_device;
    if (v11)
    {
      if (v6)
        v12 = (MTLCommandQueue *)v6;
      else
        v12 = (MTLCommandQueue *)-[MTLDeviceSPI newCommandQueue](v11, "newCommandQueue");
      commandQueue = v8->_commandQueue;
      v8->_commandQueue = v12;

      v14 = -[ARUIRingsRenderer initWithDevice:]([ARUIRingsRenderer alloc], "initWithDevice:", v8->_device);
      ringsRenderer = v8->_ringsRenderer;
      v8->_ringsRenderer = v14;

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundlePath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("ARUIPrecompiledPipeline.pipelinelib"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)-[MTLDeviceSPI newPipelineLibraryWithFilePath:error:](v8->_device, "newPipelineLibraryWithFilePath:error:", v18, 0);
      -[ARUIRenderer renderPipelineFactoryWithDeviceSPI:librarySPI:](v8, "renderPipelineFactoryWithDeviceSPI:librarySPI:", v8->_device, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      ringsRenderPipelineFactory = v8->_ringsRenderPipelineFactory;
      v8->_ringsRenderPipelineFactory = (ARUIRingsRenderPipelineFactory *)v20;

      v22 = -[ARUISpritesRenderer initWithDeviceSPI:librarySPI:]([ARUISpritesRenderer alloc], "initWithDeviceSPI:librarySPI:", v8->_device, v19);
      spritesRenderer = v8->_spritesRenderer;
      v8->_spritesRenderer = v22;

      v24 = -[ARUICelebrationsRenderer initWithDevice:commandQueue:]([ARUICelebrationsRenderer alloc], "initWithDevice:commandQueue:", v8->_device, v8->_commandQueue);
      celebrationsRenderer = v8->_celebrationsRenderer;
      v8->_celebrationsRenderer = v24;

    }
  }

  return v8;
}

- (id)renderPipelineFactoryWithDeviceSPI:(id)a3 librarySPI:(id)a4
{
  id v6;
  id v7;
  unint64_t renderStyle;
  __objc2_class **v9;

  v6 = a3;
  v7 = a4;
  renderStyle = self->_renderStyle;
  if (!renderStyle)
  {
    v9 = off_24CEC5718;
    goto LABEL_5;
  }
  if (renderStyle == 1)
  {
    v9 = off_24CEC56F8;
LABEL_5:
    self = (ARUIRenderer *)objc_msgSend(objc_alloc(*v9), "initWithDeviceSPI:librarySPI:", v6, v7);
  }

  return self;
}

- (ARUIRenderer)initWithCommandQueue:(id)a3
{
  return -[ARUIRenderer initWithRenderStyle:commandQueue:](self, "initWithRenderStyle:commandQueue:", 0, a3);
}

- (ARUIRenderer)initWithRenderStyle:(unint64_t)a3
{
  return -[ARUIRenderer initWithRenderStyle:commandQueue:](self, "initWithRenderStyle:commandQueue:", a3, 0);
}

- (id)renderPipelineFactoryWithDevice:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  unint64_t renderStyle;
  __objc2_class **v9;

  v6 = a3;
  v7 = a4;
  renderStyle = self->_renderStyle;
  if (!renderStyle)
  {
    v9 = off_24CEC5718;
    goto LABEL_5;
  }
  if (renderStyle == 1)
  {
    v9 = off_24CEC56F8;
LABEL_5:
    self = (ARUIRenderer *)objc_msgSend(objc_alloc(*v9), "initWithDevice:library:", v6, v7);
  }

  return self;
}

- (void)renderRings:(id)a3 intoDrawable:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "texture");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer _renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:](self, "_renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:", v10, 0, v11, v9, v8, 0, 0);

}

- (void)renderRings:(id)a3 intoDrawable:(id)a4 withContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "texture");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer _renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:](self, "_renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:", v13, 0, v14, v12, v11, 0, v10);

}

- (void)renderRings:(id)a3 spriteSheet:(id)a4 intoDrawable:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "texture");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer _renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:](self, "_renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:", v13, v12, v14, v11, v10, 0, 0);

}

- (void)_renderRings:(id)a3 passDescriptor:(id)a4 commandBuffer:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "renderCommandEncoderWithDescriptor:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer _renderRings:commandEncoder:passDescriptor:commandBuffer:withContext:](self, "_renderRings:commandEncoder:passDescriptor:commandBuffer:withContext:", v13, v14, v12, v11, v10);

  objc_msgSend(v14, "endEncoding");
}

- (id)snapshotRings:(id)a3 withContext:(id)a4
{
  return -[ARUIRenderer _snapshotRings:spriteSheet:withContext:](self, "_snapshotRings:spriteSheet:withContext:", a3, 0, a4);
}

- (id)_snapshotRings:(id)a3 spriteSheet:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  float v11;
  double v12;
  float v13;
  double v14;
  size_t v15;
  size_t v16;
  void *v17;
  void *v18;
  void *v19;
  size_t v20;
  CGColorSpace *DeviceRGB;
  CGDataProvider *v22;
  CGImageRef v23;
  CGImage *v24;
  void *v25;
  float v26;
  void *v27;
  float v29;
  _QWORD v30[6];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "drawableSize");
  v29 = v11;
  v12 = ceilf(v11);
  objc_msgSend(v8, "drawableSize");
  v14 = ceilf(v13);
  v15 = vcvtps_u32_f32(v29);
  v16 = vcvtps_u32_f32(v13);
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUsage:", 4);
  objc_msgSend(v17, "setResourceOptions:", 0);
  v18 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v17);
  -[ARUIRenderer _renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:](self, "_renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:", v10, v9, v18, 0, v8, 1, 0);

  v19 = malloc_type_malloc((unint64_t)(v12 * 4.0 * v14), 0xC7C708CuLL);
  v20 = vcvtd_n_u64_f64(v12, 2uLL);
  memset(v30, 0, 24);
  v30[3] = v15;
  v30[4] = v16;
  v30[5] = 1;
  objc_msgSend(v18, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v19, v20, v30, 0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v22 = CGDataProviderCreateWithData(0, v19, (unint64_t)(v12 * 4.0 * v14), (CGDataProviderReleaseDataCallback)freeData);
  v23 = CGImageCreate(v15, v16, 8uLL, 0x20uLL, v20, DeviceRGB, 0x2002u, v22, 0, 0, kCGRenderingIntentDefault);
  if (v23)
  {
    v24 = v23;
    v25 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(v8, "screenScale");
    objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v24, 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v24);
  }
  else
  {
    v27 = 0;
  }
  CGDataProviderRelease(v22);
  CGColorSpaceRelease(DeviceRGB);

  return v27;
}

- (void)clearCaches
{
  -[ARUIRingsRenderer clearCaches](self->_ringsRenderer, "clearCaches");
}

- (void)renderRingGroupControllers:(id)a3 withSize:(id)a4 intoTexture:(id)a5 withDrawable:(BOOL)a6 waitUntilCompleted:(id)a7 completionHandler:
{
  id v10;
  id v11;
  ARUIRenderContext *v12;
  unint64_t v13;
  double v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  ARUIRenderContext *v28;
  id v29;
  id v31;
  _BOOL4 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v32 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v31 = a5;
  v29 = a7;
  v12 = [ARUIRenderContext alloc];
  v27 = (float)(unint64_t)objc_msgSend(v11, "width");
  v13 = objc_msgSend(v11, "height");
  *(float *)&v14 = v27;
  *((float *)&v14 + 1) = (float)v13;
  v28 = -[ARUIRenderContext initWithDrawableSize:](v12, "initWithDrawableSize:", v14);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v34;
    do
    {
      v21 = 0;
      v22 = v19;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v21);
        objc_msgSend(v23, "ringGroup");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "rings");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v25);

        objc_msgSend(v23, "ringGroup");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "spriteSheet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        ++v21;
        v22 = v19;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  -[ARUIRenderer _renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:](self, "_renderRings:spriteSheet:intoTexture:presentingDrawable:withContext:waitUntilCompleted:completion:", v15, v19, v11, v31, v28, v32, v29);
}

- (id)snapshotRingGroupControllers:(id)a3 withSize:
{
  double v3;
  double v4;
  id v5;
  ARUIRenderContext *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = v3;
  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[ARUIRenderContext initWithDrawableSize:]([ARUIRenderContext alloc], "initWithDrawableSize:", v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        objc_msgSend(v15, "ringGroup");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "rings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v17);

        objc_msgSend(v15, "ringGroup");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "spriteSheet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  -[ARUIRenderer snapshotRings:spriteSheet:withContext:](self, "snapshotRings:spriteSheet:withContext:", v7, v11, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (unint64_t)renderStyle
{
  return self->_renderStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_celebrationsRenderer, 0);
  objc_storeStrong((id *)&self->_spritesRenderer, 0);
  objc_storeStrong((id *)&self->_ringsRenderer, 0);
  objc_storeStrong((id *)&self->_ringsRenderPipelineFactory, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
