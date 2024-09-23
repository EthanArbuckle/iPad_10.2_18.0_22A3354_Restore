@implementation DYMTLPixelHistoryTextureSupport

+ (void)pixelValueFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 atX:(unint64_t)a7 y:(unint64_t)a8 inCommandBuffer:(id)a9 overHarvestForDepthStencil:(BOOL)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v17 = a3;
  v18 = a9;
  v19 = a11;
  if (objc_msgSend(v17, "width") && objc_msgSend(v17, "height"))
  {
    LOBYTE(v22) = a10;
    objc_msgSend(a1, "pixelValueFromTexture:level:slice:depthPlane:atX:y:inCommandBuffer:overHarvestForDepthStencil:", v17, a4, a5, a6, a7, a8, v18, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __140__DYMTLPixelHistoryTextureSupport_pixelValueFromTexture_level_slice_depthPlane_atX_y_inCommandBuffer_overHarvestForDepthStencil_completion___block_invoke;
    v23[3] = &unk_251123500;
    v24 = v20;
    v26 = v19;
    v25 = v17;
    v21 = v20;
    objc_msgSend(v18, "addCompletedHandler:", v23);

  }
}

void __140__DYMTLPixelHistoryTextureSupport_pixelValueFromTexture_level_slice_depthPlane_atX_y_inCommandBuffer_overHarvestForDepthStencil_completion___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "contents"), objc_msgSend(*(id *)(a1 + 32), "length"));
  (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v2, objc_msgSend(*(id *)(a1 + 40), "pixelFormat"));

}

+ (id)pixelValueFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 atX:(unint64_t)a7 y:(unint64_t)a8 inCommandBuffer:(id)a9 overHarvestForDepthStencil:(BOOL)a10
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v23;
  int64x2_t v24;
  uint64_t v25;
  _QWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v15 = a3;
  v16 = a9;
  if (objc_msgSend(v15, "width") && objc_msgSend(v15, "height"))
  {
    v23 = a7;
    objc_msgSend(v16, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pixelFormat");
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    MTLPixelFormatGetInfoForDevice();
    objc_msgSend(v16, "blitCommandEncoder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    MTLGetTextureLevelInfoForDeviceWithOptions();
    v19 = objc_msgSend(v17, "newBufferWithLength:options:", 0, 0);
    v20 = a4;
    v21 = (void *)v19;
    v26[0] = v23;
    v26[1] = a8;
    v26[2] = a6;
    v24 = vdupq_n_s64(1uLL);
    v25 = 1;
    objc_msgSend(v18, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", v15, a5, v20, v26, &v24, v19, 0, 0, 0, 0);
    objc_msgSend(v18, "endEncoding");

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (void)pixelValueToTexture:(id)a3 buffer:(id)a4 level:(unint64_t)a5 slice:(unint64_t)a6 depthPlane:(unint64_t)a7 atX:(unint64_t)a8 y:(unint64_t)a9 inCommandBuffer:(id)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  int64x2_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v15 = a3;
  v16 = a4;
  v17 = a10;
  if (objc_msgSend(v15, "width") && objc_msgSend(v15, "height"))
  {
    objc_msgSend(v17, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pixelFormat");
    v33 = 0;
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    MTLPixelFormatGetInfoForDevice();
    objc_msgSend(v17, "blitCommandEncoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    MTLGetTextureLevelInfoForDeviceWithOptions();
    v21 = vdupq_n_s64(1uLL);
    v22 = 1;
    v20[0] = a8;
    v20[1] = a9;
    v20[2] = a7;
    objc_msgSend(v19, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v16, 0, 0, 0, &v21, v15, a6, a5, v20, 0);
    objc_msgSend(v19, "endEncoding");

  }
}

@end
