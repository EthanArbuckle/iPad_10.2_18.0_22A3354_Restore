@implementation C3DWarmupMaterialVRAMResourcesForEngineContext

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 1, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 1);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 2, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 2);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 4, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 4);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 3, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 3);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 0, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 0);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_6(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 5, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 5);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_7(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 6, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 6);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 7, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 7);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_9(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 9, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 9);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_10(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 8, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 8);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_11(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 10, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 10);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_12(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 11, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 11);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_13(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 15, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 15);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_14(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 12, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 12);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_15(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 13, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 13);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_16(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 14, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 14);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

uint64_t __C3DWarmupMaterialVRAMResourcesForEngineContext_block_invoke_17(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t EffectSlot;
  uint64_t v5;
  uint64_t RenderContext;
  float32x2_t *RendererContextGL;
  uint64_t ResourceManager;
  uint64_t Image;
  void *v10;
  const void *TextureSampler;
  uint64_t v12;

  v2 = a1[5];
  v3 = a1[6];
  EffectSlot = C3DEffectCommonProfileGetEffectSlot(v2, 16, 0);
  if (EffectSlot)
  {
    v5 = EffectSlot;
    RenderContext = C3DEngineContextGetRenderContext(v3);
    if (RenderContext)
    {
      -[SCNMTLRenderContext textureForEffectSlot:](RenderContext, v5);
    }
    else
    {
      RendererContextGL = (float32x2_t *)C3DEngineContextGetRendererContextGL(v3);
      ResourceManager = C3DEngineContextGetResourceManager(v3);
      Image = C3DEffectSlotGetImage(v5);
      if (Image)
      {
        v10 = (void *)Image;
        TextureSampler = (const void *)C3DEffectCommonProfileGetTextureSampler(v2, 16);
        C3DResourceManagerMakeImageResident(ResourceManager, v10, TextureSampler, RendererContextGL);
      }
    }
  }
  v12 = a1[4];
  if (v12)
    return (*(unsigned int (**)(void))(v12 + 16))() ^ 1;
  else
    return 1;
}

@end
