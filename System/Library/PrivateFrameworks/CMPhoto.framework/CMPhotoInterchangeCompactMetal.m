@implementation CMPhotoInterchangeCompactMetal

- (CMPhotoInterchangeCompactMetal)initWithDevice:(id)a3 encode:(BOOL)a4 bayer:(BOOL)a5 quadra:(BOOL)a6 depth:(char)a7
{
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  CMPhotoInterchangeCompactMetal *v12;
  CMPhotoInterchangeCompactMetal *v13;
  MTLCommandQueue *v14;
  uint64_t v15;
  id v16;
  void *v17;
  int v18;
  __int16 v19;
  __int16 v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  MTLComputePipelineState *v27;
  MTLRenderPassDescriptor *v28;
  id v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  __CFString *v37;
  MTLRenderPipelineState *v38;
  uint64_t v40;
  objc_super v41;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v41.receiver = self;
  v41.super_class = (Class)CMPhotoInterchangeCompactMetal;
  v12 = -[CMPhotoInterchangeCompactMetal init](&v41, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_mDevice = (MTLDevice *)a3;
    if (!a3)
      return 0;
    v14 = (MTLCommandQueue *)(id)objc_msgSend(a3, "newCommandQueue");
    v13->_mCommandQueue = v14;
    if (!v14)
      return 0;
    v40 = 0;
    v15 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    if (!v15)
      return 0;
    v16 = (id)-[MTLDevice newDefaultLibraryWithBundle:error:](v13->_mDevice, "newDefaultLibraryWithBundle:error:", v15, &v40);
    if (!v16)
      return 0;
    v17 = v16;
    v18 = v9 || v8;
    if (v7 == 16)
      v19 = 255;
    else
      v19 = 127;
    if (v7 == 16)
      v20 = 63;
    else
      v20 = 31;
    if (!v18)
      v19 = v20;
    v13->_mask = v19;
    v21 = (id)objc_opt_new();
    if (!v21)
      return 0;
    v22 = v21;
    objc_msgSend(v21, "setConstantValue:type:atIndex:", &v13->_mask, 41, 0);
    v23 = (id)objc_msgSend(v17, "newFunctionWithName:constantValues:error:", CFSTR("compact_metadata_cs"), v22, &v40);
    if (!v23)
      return 0;
    v24 = v23;
    v25 = objc_alloc_init(MEMORY[0x1E0CC6A80]);
    if (!v25)
      return 0;
    v26 = v25;
    objc_msgSend(v25, "setComputeFunction:", v24);
    objc_msgSend(v26, "setLabel:", CFSTR("Compact Metadata Compute Pipeline"));
    v27 = (MTLComputePipelineState *)(id)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v13->_mDevice, "newComputePipelineStateWithDescriptor:options:reflection:error:", v26, 0, 0, &v40);
    v13->_mCompactMetadataPSO = v27;
    if (!v27)
      return 0;
    v28 = (MTLRenderPassDescriptor *)(id)objc_opt_new();
    v13->_renderToTextureRenderPassDescriptor = v28;
    -[MTLRenderPassColorAttachmentDescriptor setLoadAction:](-[MTLRenderPassColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPassDescriptor colorAttachments](v28, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 0);
    -[MTLRenderPassColorAttachmentDescriptor setClearColor:](-[MTLRenderPassColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPassDescriptor colorAttachments](v13->_renderToTextureRenderPassDescriptor, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", 1.0, 1.0, 1.0, 1.0);
    -[MTLRenderPassColorAttachmentDescriptor setStoreAction:](-[MTLRenderPassColorAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLRenderPassDescriptor colorAttachments](v13->_renderToTextureRenderPassDescriptor, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setStoreAction:", 1);
    v29 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    if (!v29)
      return 0;
    v30 = v29;
    objc_msgSend(v29, "setVertexFunction:", (id)objc_msgSend(v17, "newFunctionWithName:", CFSTR("simple_vs")));
    if (v10)
    {
      objc_msgSend(v30, "setLabel:", CFSTR("Interchange Compact Repack Pipeline"));
      v31 = CFSTR("simple_fs");
      if (v8)
        v31 = CFSTR("quadra_repack_fs");
      if (v9)
        v32 = CFSTR("bayer_repack_fs");
      else
        v32 = v31;
      objc_msgSend(v30, "setFragmentFunction:", (id)objc_msgSend(v17, "newFunctionWithName:", v32));
      v33 = 70;
      if (v7 == 16)
        v33 = 110;
      v34 = 10;
      if (v7 == 16)
        v34 = 20;
      v35 = v18 ? v33 : v34;
    }
    else
    {
      objc_msgSend(v30, "setLabel:", CFSTR("Interchange Compact Unpack Pipeline"));
      v36 = CFSTR("simple_fs");
      if (v8)
        v36 = CFSTR("quadra_unpack_fs");
      v37 = v9 ? CFSTR("bayer_unpack_fs") : (__CFString *)v36;
      objc_msgSend(v30, "setFragmentFunction:", (id)objc_msgSend(v17, "newFunctionWithName:", v37));
      v35 = v7 == 16 ? 20 : 10;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setPixelFormat:", v35);
    v38 = (MTLRenderPipelineState *)(id)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v13->_mDevice, "newRenderPipelineStateWithDescriptor:error:", v30, &v40);
    v13->_renderPipeline = v38;
    if (!v38)
      return 0;
  }
  return v13;
}

- (id)prepareTexture:(__IOSurface *)a3 usage:(unint64_t)a4
{
  signed int PixelFormat;
  uint64_t v8;
  int v9;
  void *v10;
  size_t Width;
  void *v12;

  PixelFormat = IOSurfaceGetPixelFormat(a3);
  v8 = 0;
  if (PixelFormat <= 1278226487)
  {
    if (PixelFormat > 642527541)
    {
      if (PixelFormat == 642527542)
        goto LABEL_22;
      if (PixelFormat == 642934849)
        goto LABEL_23;
      if (PixelFormat != 1111970369)
        goto LABEL_24;
    }
    else if (PixelFormat != 641877825)
    {
      if (PixelFormat != 642527288)
      {
        v9 = 642527336;
        goto LABEL_13;
      }
LABEL_21:
      v8 = 10;
      goto LABEL_24;
    }
    v8 = 70;
    goto LABEL_24;
  }
  if (PixelFormat <= 1380411456)
  {
    if (PixelFormat != 1278226488)
    {
      if (PixelFormat == 1278226536)
        goto LABEL_22;
      v9 = 1278226742;
LABEL_13:
      if (PixelFormat != v9)
        goto LABEL_24;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (PixelFormat <= 1652056887)
  {
    if (PixelFormat != 1380411457)
    {
      v9 = 1651519798;
      goto LABEL_13;
    }
LABEL_23:
    v8 = 110;
    goto LABEL_24;
  }
  if (PixelFormat == 1751411059)
  {
LABEL_22:
    v8 = 20;
    goto LABEL_24;
  }
  if (PixelFormat == 1652056888)
    goto LABEL_21;
LABEL_24:
  v10 = (void *)MEMORY[0x1E0CC6BB0];
  Width = IOSurfaceGetWidth(a3);
  v12 = (void *)objc_msgSend(v10, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v8, Width, IOSurfaceGetHeight(a3), 0);
  objc_msgSend(v12, "setUsage:", a4);
  return (id)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_mDevice, "newTextureWithDescriptor:iosurface:plane:", v12, a3, 0);
}

- (void)prepareSrc:(__IOSurface *)a3
{
  MTLTexture *v4;

  v4 = -[CMPhotoInterchangeCompactMetal prepareTexture:usage:](self, "prepareTexture:usage:", a3, 1);
  self->_mSrcTex = v4;
  if (!v4)
    -[CMPhotoInterchangeCompactMetal prepareSrc:].cold.1();
}

- (void)prepareDst:(__IOSurface *)a3
{
  MTLTexture *v5;
  MTLDevice *mDevice;
  MTLBuffer *v7;
  void *BaseAddress;
  uint64_t CompressedTileWidthOfPlane;
  unint64_t v10;
  unint64_t v11;

  v5 = -[CMPhotoInterchangeCompactMetal prepareTexture:usage:](self, "prepareTexture:usage:", a3, 4);
  self->_mDstTex = v5;
  if (!v5)
    -[CMPhotoInterchangeCompactMetal prepareDst:].cold.1();
  if (IOSurfaceGetCompressionTypeOfPlane() == 3)
  {
    mDevice = self->_mDevice;
    if (!mDevice)
      -[CMPhotoInterchangeCompactMetal prepareDst:].cold.2();
    v7 = (MTLBuffer *)(id)-[MTLDevice newBufferWithIOSurface:](mDevice, "newBufferWithIOSurface:", a3);
    self->_mDstBuf = v7;
    if (!v7)
      -[CMPhotoInterchangeCompactMetal prepareDst:].cold.3();
    BaseAddress = IOSurfaceGetBaseAddress(a3);
    self->_mDstMetaOffset = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane() - (_QWORD)BaseAddress;
    self->mb_width = IOSurfaceGetWidthInCompressedTilesOfPlane();
    self->mb_height = IOSurfaceGetHeightInCompressedTilesOfPlane();
    CompressedTileWidthOfPlane = IOSurfaceGetCompressedTileWidthOfPlane();
    v10 = (unint64_t)(IOSurfaceGetCompressedTileHeightOfPlane() * CompressedTileWidthOfPlane) >> 5;
    v11 = v10 * self->mb_width * self->mb_height;
    self->meta_size = v10;
    self->meta_length = v11;
    if (self->_mask != (unsigned __int16)(IOSurfaceGetBytesPerTileDataOfPlane() / self->meta_size - 1))
      -[CMPhotoInterchangeCompactMetal prepareDst:].cold.4();
  }
}

- (void)prepareData
{
  self->_mBufferA = (MTLBuffer *)(id)-[MTLDevice newBufferWithLength:options:](self->_mDevice, "newBufferWithLength:options:", self->meta_length, 0);
  self->_mBufferB = (MTLBuffer *)(id)-[MTLDevice newBufferWithLength:options:](self->_mDevice, "newBufferWithLength:options:", 2 * (self->meta_length / self->meta_size), 0);
}

- (void)sendRenderCommand
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal sendRenderCommand]", "CMPhotoInterchangeCompactMetal.m", 247, "(IOSurfaceGetCompressionTypeOfPlane(_mDstTex.iosurface, _mDstTex.iosurfacePlane) == kIOSurfaceCompressionTypeInterchange) || (IOSurfaceGetCompressionTypeOfPlane(_mSrcTex.iosurface, _mSrcTex.iosurfacePlane) == kIOSurfaceCompressionTypeInterchange)");
}

- (void)prepareSrc:.cold.1()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareSrc:]", "CMPhotoInterchangeCompactMetal.m", 191, "_mSrcTex != nil");
}

- (void)prepareDst:.cold.1()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareDst:]", "CMPhotoInterchangeCompactMetal.m", 196, "_mDstTex != nil");
}

- (void)prepareDst:.cold.2()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareDst:]", "CMPhotoInterchangeCompactMetal.m", 201, "deviceSPI != nil");
}

- (void)prepareDst:.cold.3()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareDst:]", "CMPhotoInterchangeCompactMetal.m", 203, "_mDstBuf != nil");
}

- (void)prepareDst:.cold.4()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareDst:]", "CMPhotoInterchangeCompactMetal.m", 215, "_mask == mask");
}

@end
