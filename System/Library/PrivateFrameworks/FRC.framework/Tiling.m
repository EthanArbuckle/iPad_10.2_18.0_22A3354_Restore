@implementation Tiling

- (Tiling)initWithDevice:(id)a3 commmandQueue:(id)a4
{
  Tiling *v4;
  MTLDeviceSPI *v5;
  MTLDeviceSPI *device;
  uint64_t v7;
  MTLCommandQueue *commandQueue;
  uint64_t v9;
  MTLLibrary *mtlLibrary;
  uint64_t v11;
  MTLComputePipelineState *assembleKernel;
  uint64_t v13;
  MTLComputePipelineState *assembleTwoTileKernel;
  uint64_t v15;
  MTLBuffer *tileParameters;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)Tiling;
  v4 = -[FRCMetalBase initWithDevice:commmandQueue:](&v18, sel_initWithDevice_commmandQueue_, a3, a4);
  if (v4)
  {
    v5 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
    device = v4->_device;
    v4->_device = v5;

    v7 = -[MTLDeviceSPI newCommandQueue](v4->_device, "newCommandQueue");
    commandQueue = v4->_commandQueue;
    v4->_commandQueue = (MTLCommandQueue *)v7;

    v9 = -[MTLDeviceSPI newDefaultLibrary](v4->_device, "newDefaultLibrary");
    mtlLibrary = v4->_mtlLibrary;
    v4->_mtlLibrary = (MTLLibrary *)v9;

    -[FRCMetalBase createKernel:](v4, "createKernel:", CFSTR("assembleHorizontalThreeTiles"));
    v11 = objc_claimAutoreleasedReturnValue();
    assembleKernel = v4->_assembleKernel;
    v4->_assembleKernel = (MTLComputePipelineState *)v11;

    -[FRCMetalBase createKernel:](v4, "createKernel:", CFSTR("assembleHorizontalTwoTiles"));
    v13 = objc_claimAutoreleasedReturnValue();
    assembleTwoTileKernel = v4->_assembleTwoTileKernel;
    v4->_assembleTwoTileKernel = (MTLComputePipelineState *)v13;

    v4->_tileOverlap = 104;
    v15 = -[MTLDeviceSPI newBufferWithLength:options:](v4->_device, "newBufferWithLength:options:", 12, 0);
    tileParameters = v4->_tileParameters;
    v4->_tileParameters = (MTLBuffer *)v15;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)Tiling;
  -[Tiling dealloc](&v2, sel_dealloc);
}

- (void)encodeTilingToCommandBuffer:(id)a3 from:(id)a4 to:(id)a5 verticalOffset:(unint64_t)a6 sourceHeight:(unint64_t)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];

  v11 = a4;
  v12 = a5;
  objc_msgSend(a3, "blitCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "width");
  if (objc_msgSend(v11, "arrayLength"))
  {
    v15 = 0;
    do
    {
      v18[0] = 0;
      v18[1] = a6;
      v18[2] = 0;
      v17[0] = v14;
      v17[1] = a7;
      v17[2] = 1;
      memset(v16, 0, sizeof(v16));
      objc_msgSend(v13, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v11, v15, 0, v18, v17, v12, v15, 0, v16);
      ++v15;
    }
    while (objc_msgSend(v11, "arrayLength") > v15);
  }
  objc_msgSend(v13, "endEncoding");

}

- (void)encodeTileBufferToCommandBuffer:(id)a3 from:(__CVBuffer *)a4 to:(__CVBuffer *)a5 channels:(int64_t)a6 tileInfo:(id *)a7 numTiles:(int64_t)a8
{
  int v14;
  MTLDeviceSPI *device;
  void *v16;
  unint64_t *p_var2;
  int v18;
  __CVBuffer *v19;
  MTLDeviceSPI *v20;
  void *v21;
  unint64_t v22;
  id v23;

  v23 = a3;
  if ((unint64_t)(a8 - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = isPackedRGBA(a4);
    device = self->_device;
    if (v14)
      createRGBATextureFromCVPixelBuffer(a4, device);
    else
      createTexturesFromCVPixelBuffer(a4, device, 1, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    p_var2 = &a7->var2;
    do
    {
      v18 = isPackedRGBA(*a5);
      v19 = *a5;
      v20 = self->_device;
      if (v18)
        createRGBATextureFromCVPixelBuffer(v19, v20);
      else
        createTexturesFromCVPixelBuffer(v19, v20, 1, a6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *p_var2 + *(p_var2 - 1);
      if (v22 > objc_msgSend(v16, "height"))
        objc_msgSend(v16, "height");
      -[Tiling encodeTilingToCommandBuffer:from:to:verticalOffset:sourceHeight:](self, "encodeTilingToCommandBuffer:from:to:verticalOffset:sourceHeight:", v23, v16, v21);

      p_var2 += 3;
      ++a5;
      --a8;
    }
    while (a8);

  }
  else
  {
    NSLog(CFSTR("Unsupported number of tiles\n"));
  }

}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)createTileInfoArrayForFrameWithWidth:(unint64_t)a3 height:(unint64_t)a4 numTiles:(unint64_t)a5
{
  unint64_t v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *p_var2;

  v5 = a5;
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)malloc_type_malloc(24 * a5, 0x1000040504FFAC1uLL);
  v10 = a4 / v5;
  if (v5 == 3)
  {
    self->_tileOverlap = 104;
    v11 = v10 + 111;
  }
  else
  {
    self->_tileOverlap = 64;
    v11 = v10 + 71;
    v10 -= 64;
  }
  v12 = 0;
  v13 = v11 & 0xFFFFFFFFFFFFFFF8;
  p_var2 = &result->var2;
  do
  {
    *(p_var2 - 2) = a3;
    *(p_var2 - 1) = v13;
    *p_var2 = v12;
    p_var2 += 3;
    v12 += v10;
    --v5;
  }
  while (v5);
  return result;
}

- (void)assembleTiles:(__CVBuffer *)a3 to:(__CVBuffer *)a4 tileInfo:(id *)a5 numTiles:(int64_t)a6
{
  int v10;
  MTLDeviceSPI *device;
  void *v12;
  unsigned int *v13;
  int64_t v14;
  int64_t v15;
  void **v16;
  int v17;
  __CVBuffer *v18;
  MTLDeviceSPI *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = isPackedRGBA(a4);
  device = self->_device;
  if (v10)
    createRGBATextureFromCVPixelBuffer(a4, device);
  else
    createTexturesFromCVPixelBuffer(a4, device, 1, 3uLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (unsigned int *)-[MTLBuffer contents](self->_tileParameters, "contents");
  *v13 = self->_tileOverlap;
  v13[2] = a6;
  v24[0] = v24;
  v13[1] = objc_msgSend(v12, "height") / a6;
  v14 = a6;
  bzero((char *)v24 - ((8 * a6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a6);
  if (a6 >= 1)
  {
    v15 = a6;
    v16 = (void **)((char *)v24 - ((8 * a6 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v17 = isPackedRGBA(*a3);
      v18 = *a3;
      v19 = self->_device;
      if (v17)
        createRGBATextureFromCVPixelBuffer(v18, v19);
      else
        createTexturesFromCVPixelBuffer(v18, v19, 1, 3uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *v16;
      *v16++ = (void *)v20;

      ++a3;
      --v15;
    }
    while (v15);
  }
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (char *)v24 - ((8 * a6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6 == 3)
    -[Tiling assemble3TilesToCommandBuffer:from:to:tileInfo:](self, "assemble3TilesToCommandBuffer:from:to:tileInfo:", v22, v23, v12, v13);
  else
    -[Tiling assemble2TilesToCommandBuffer:from:to:tileInfo:](self, "assemble2TilesToCommandBuffer:from:to:tileInfo:", v22, v23, v12, v13);
  kdebug_trace();
  objc_msgSend(v22, "commit");
  kdebug_trace();

  if (a6)
  {
    do

    while (v14 * 8);
  }

}

- (void)assemble3TilesToCommandBuffer:(id)a3 from:(id *)a4 to:(id)a5 tileInfo:(id *)a6
{
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_assembleKernel);
  objc_msgSend(v10, "setTexture:atIndex:", *a4, 0);
  objc_msgSend(v10, "setTexture:atIndex:", a4[1], 1);
  objc_msgSend(v10, "setTexture:atIndex:", a4[2], 2);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 3);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_tileParameters, 0, 0);
  v11 = (unint64_t)(objc_msgSend(v9, "width") + 15) >> 4;
  v12 = objc_msgSend(v9, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  v13 = vdupq_n_s64(0x10uLL);
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (void)assemble2TilesToCommandBuffer:(id)a3 from:(id *)a4 to:(id)a5 tileInfo:(id *)a6
{
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_assembleTwoTileKernel);
  objc_msgSend(v10, "setTexture:atIndex:", *a4, 0);
  objc_msgSend(v10, "setTexture:atIndex:", a4[1], 1);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 2);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_tileParameters, 0, 0);
  v11 = (unint64_t)(objc_msgSend(v9, "width") + 15) >> 4;
  v12 = objc_msgSend(v9, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  v13 = vdupq_n_s64(0x10uLL);
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileParameters, 0);
  objc_storeStrong((id *)&self->_assembleTwoTileKernel, 0);
  objc_storeStrong((id *)&self->_assembleKernel, 0);
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
