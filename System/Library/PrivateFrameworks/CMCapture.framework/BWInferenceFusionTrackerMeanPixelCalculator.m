@implementation BWInferenceFusionTrackerMeanPixelCalculator

- (BWInferenceFusionTrackerMeanPixelCalculator)initWithCommandQueue:(id)a3
{
  BWInferenceFusionTrackerMeanPixelCalculator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceFusionTrackerMeanPixelCalculator;
  v4 = -[BWInferenceFusionTrackerMeanPixelCalculator init](&v6, sel_init);
  if (v4)
  {
    v4->_commandQueue = (MTLCommandQueue *)a3;
    v4->_meanFilter = (MPSImageStatisticsMean *)objc_msgSend(objc_alloc((Class)getMPSImageStatisticsMeanClass()), "initWithDevice:", -[MTLCommandQueue device](v4->_commandQueue, "device"));
    v4->_meanTexture = (MTLTexture *)objc_msgSend((id)-[MTLCommandQueue device](v4->_commandQueue, "device"), "newTextureWithDescriptor:", objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, 1, 1, 0));
  }
  return v4;
}

- (void)asyncMeanPixelForBuffer:(__CVBuffer *)a3 completionHandler:(id)a4
{
  void *v7;
  size_t Width;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v7 = (void *)MEMORY[0x1E0CC6BB0];
  Width = CVPixelBufferGetWidth(a3);
  v9 = (void *)objc_msgSend(v7, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, Width, CVPixelBufferGetHeight(a3), 0);
  objc_msgSend(v9, "setUsage:", 1);
  v10 = (void *)objc_msgSend((id)-[MTLCommandQueue device](self->_commandQueue, "device"), "newTextureWithDescriptor:iosurface:plane:", v9, CVPixelBufferGetIOSurface(a3), 0);
  v11 = (void *)-[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  -[MPSImageStatisticsMean encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_meanFilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, v10, self->_meanTexture);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__BWInferenceFusionTrackerMeanPixelCalculator_asyncMeanPixelForBuffer_completionHandler___block_invoke;
  v12[3] = &unk_1E49206F8;
  v12[4] = self;
  v12[5] = a4;
  objc_msgSend(v11, "addCompletedHandler:", v12);
  objc_msgSend(v11, "commit");

}

uint64_t __89__BWInferenceFusionTrackerMeanPixelCalculator_asyncMeanPixelForBuffer_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[3];
  int64x2_t v5;
  uint64_t v6;
  int v7;

  v7 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  memset(v4, 0, sizeof(v4));
  v5 = vdupq_n_s64(1uLL);
  v6 = 1;
  objc_msgSend(v2, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", &v7, 4, v4, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceFusionTrackerMeanPixelCalculator;
  -[BWInferenceFusionTrackerMeanPixelCalculator dealloc](&v3, sel_dealloc);
}

@end
