@implementation NUSurfaceImage

uint64_t __54___NUSurfaceImage_copyBufferStorage_fromRect_toPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  return +[NUImageUtilities copyPixelsToImage:atPoint:fromBuffer:inRect:](NUImageUtilities, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v2, v3, v4, a2, v7);
}

uint64_t __62___NUSurfaceImage_copySurfaceStorage_fromRect_toPoint_device___block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  +[NUImageUtilities copyTexture:fromRect:toSurfaceImage:atPoint:withDevice:](NUImageUtilities, "copyTexture:fromRect:toSurfaceImage:atPoint:withDevice:", a2, v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40));
  return 1;
}

uint64_t __55___NUSurfaceImage_writeTextureRegion_device_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v10 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55___NUSurfaceImage_writeTextureRegion_device_withBlock___block_invoke_2;
  v15[3] = &unk_1E5063980;
  v16 = v10;
  v11 = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = a6;
  v12 = v10;
  v13 = objc_msgSend(a5, "writeTextureInRegion:device:block:", a3, v11, v15);

  return v13;
}

uint64_t __55___NUSurfaceImage_writeTextureRegion_device_withBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NUTextureTileAdapter *v4;
  void *v5;
  void *v6;
  NUTextureTileAdapter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[2];
  _OWORD v15[2];

  v3 = a2;
  v4 = [NUTextureTileAdapter alloc];
  v5 = (void *)a1[4];
  if (!v5)
  {
    memset(v15, 0, sizeof(v15));
    goto LABEL_5;
  }
  objc_msgSend(v5, "frameRect");
  v6 = (void *)a1[4];
  if (!v6)
  {
LABEL_5:
    memset(v14, 0, sizeof(v14));
    goto LABEL_6;
  }
  objc_msgSend(v6, "contentRect");
LABEL_6:
  v7 = -[NUTextureTileAdapter initWithFrameRect:contentRect:texture:](v4, "initWithFrameRect:contentRect:texture:", v15, v14, v3);
  (*(void (**)(_QWORD, NUTextureTileAdapter *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, a1[6], v8, v9, v10, v11, v12);

  return 1;
}

uint64_t __54___NUSurfaceImage_readTextureRegion_device_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v10 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54___NUSurfaceImage_readTextureRegion_device_withBlock___block_invoke_2;
  v15[3] = &unk_1E5063980;
  v16 = v10;
  v11 = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = a6;
  v12 = v10;
  v13 = objc_msgSend(a5, "readTextureInRegion:device:block:", a3, v11, v15);

  return v13;
}

uint64_t __54___NUSurfaceImage_readTextureRegion_device_withBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NUTextureTileAdapter *v4;
  void *v5;
  void *v6;
  NUTextureTileAdapter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[2];
  _OWORD v15[2];

  v3 = a2;
  v4 = [NUTextureTileAdapter alloc];
  v5 = (void *)a1[4];
  if (!v5)
  {
    memset(v15, 0, sizeof(v15));
    goto LABEL_5;
  }
  objc_msgSend(v5, "frameRect");
  v6 = (void *)a1[4];
  if (!v6)
  {
LABEL_5:
    memset(v14, 0, sizeof(v14));
    goto LABEL_6;
  }
  objc_msgSend(v6, "contentRect");
LABEL_6:
  v7 = -[NUTextureTileAdapter initWithFrameRect:contentRect:texture:](v4, "initWithFrameRect:contentRect:texture:", v15, v14, v3);
  (*(void (**)(_QWORD, NUTextureTileAdapter *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, a1[6], v8, v9, v10, v11, v12);

  return 1;
}

uint64_t __48___NUSurfaceImage_writeSurfaceRegion_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v10 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48___NUSurfaceImage_writeSurfaceRegion_withBlock___block_invoke_2;
  v14[3] = &unk_1E5063958;
  v15 = v10;
  v16 = *(id *)(a1 + 32);
  v17 = a6;
  v11 = v10;
  v12 = objc_msgSend(a5, "writeSurfaceInRegion:block:", a3, v14);

  return v12;
}

uint64_t __48___NUSurfaceImage_writeSurfaceRegion_withBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NUSurfaceTileAdapter *v4;
  void *v5;
  void *v6;
  NUSurfaceTileAdapter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[2];
  _OWORD v15[2];

  v3 = a2;
  v4 = [NUSurfaceTileAdapter alloc];
  v5 = (void *)a1[4];
  if (!v5)
  {
    memset(v15, 0, sizeof(v15));
    goto LABEL_5;
  }
  objc_msgSend(v5, "frameRect");
  v6 = (void *)a1[4];
  if (!v6)
  {
LABEL_5:
    memset(v14, 0, sizeof(v14));
    goto LABEL_6;
  }
  objc_msgSend(v6, "contentRect");
LABEL_6:
  v7 = -[NUSurfaceTileAdapter initWithFrameRect:contentRect:surface:](v4, "initWithFrameRect:contentRect:surface:", v15, v14, v3);
  (*(void (**)(_QWORD, NUSurfaceTileAdapter *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, a1[6], v8, v9, v10, v11, v12);

  return 1;
}

uint64_t __47___NUSurfaceImage_readSurfaceRegion_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v10 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47___NUSurfaceImage_readSurfaceRegion_withBlock___block_invoke_2;
  v14[3] = &unk_1E5063958;
  v15 = v10;
  v16 = *(id *)(a1 + 32);
  v17 = a6;
  v11 = v10;
  v12 = objc_msgSend(a5, "readSurfaceInRegion:block:", a3, v14);

  return v12;
}

uint64_t __47___NUSurfaceImage_readSurfaceRegion_withBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NUSurfaceTileAdapter *v4;
  void *v5;
  void *v6;
  NUSurfaceTileAdapter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[2];
  _OWORD v15[2];

  v3 = a2;
  v4 = [NUSurfaceTileAdapter alloc];
  v5 = (void *)a1[4];
  if (!v5)
  {
    memset(v15, 0, sizeof(v15));
    goto LABEL_5;
  }
  objc_msgSend(v5, "frameRect");
  v6 = (void *)a1[4];
  if (!v6)
  {
LABEL_5:
    memset(v14, 0, sizeof(v14));
    goto LABEL_6;
  }
  objc_msgSend(v6, "contentRect");
LABEL_6:
  v7 = -[NUSurfaceTileAdapter initWithFrameRect:contentRect:surface:](v4, "initWithFrameRect:contentRect:surface:", v15, v14, v3);
  (*(void (**)(_QWORD, NUSurfaceTileAdapter *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, a1[6], v8, v9, v10, v11, v12);

  return 1;
}

@end
