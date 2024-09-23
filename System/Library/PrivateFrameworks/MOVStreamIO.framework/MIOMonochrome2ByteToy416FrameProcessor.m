@implementation MIOMonochrome2ByteToy416FrameProcessor

- (MIOMonochrome2ByteToy416FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  MIOMonochrome2ByteToy416FrameProcessor *v4;
  CMVideoDimensions Dimensions;
  const __CFDictionary *v6;
  opaqueCMFormatDescription *v7;
  CVPixelBufferRef texture;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)MIOMonochrome2ByteToy416FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v10, sel_initWithInputFormatDescription_);
  if (v4)
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
    texture = 0;
    v11 = *MEMORY[0x24BDC5668];
    v12[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Dimensions.width, *(uint64_t *)&Dimensions >> 32, 0x79343136u, v6, &texture);
    v7 = +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:](MOVStreamIOUtility, "createFormatDescriptionFromPixelBuffer:", texture);
    v4->_formatDescForEncoding = v7;
    CFRetain(v7);
    CVPixelBufferRelease(texture);
    -[MIOFrameProcessor setFormatDescriptionNeedsUpdate:](v4, "setFormatDescriptionNeedsUpdate:", 1);

  }
  return v4;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescForEncoding;
  objc_super v4;

  formatDescForEncoding = self->_formatDescForEncoding;
  if (formatDescForEncoding)
    CFRelease(formatDescForEncoding);
  v4.receiver = self;
  v4.super_class = (Class)MIOMonochrome2ByteToy416FrameProcessor;
  -[MIOFrameProcessor dealloc](&v4, sel_dealloc);
}

- (unsigned)encodedPixelFormat
{
  return 2033463606;
}

- (opaqueCMFormatDescription)formatDescriptionForEncoding
{
  return self->_formatDescForEncoding;
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  id v8;
  MIOPixelBufferPool *pool;
  size_t Width;
  MIOPixelBufferPool *v11;
  MIOPixelBufferPool *v12;
  __CVBuffer *v13;
  void *v15;
  void *v16;

  v8 = a4;
  pool = self->_pool;
  if (pool
    || (Width = CVPixelBufferGetWidth(a3),
        +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", Width, CVPixelBufferGetHeight(a3), 2033463606, 0, 2, -[MIOMonochrome2ByteToy416FrameProcessor bufferCacheMode](self, "bufferCacheMode")), v11 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v12 = self->_pool, self->_pool = v11, v12, (pool = self->_pool) != 0))
  {
    -[MIOPixelBufferPool flush](pool, "flush");
    v13 = -[MIOPixelBufferPool getPixelBuffer](self->_pool, "getPixelBuffer");
    if (!v13)
    {
      NSLog(CFSTR("Running out of buffers!"));
      __assert_rtn("-[MIOMonochrome2ByteToy416FrameProcessor processPixelBuffer:preserveAttachments:error:]", "MIOMonochrome2ByteToy416FrameProcessor.mm", 85, "0");
    }
    +[MIOPixelBufferUtility copyMonochromeBuffer:toAlphaChannelOfBuffer:](PixelBufferUtility, "copyMonochromeBuffer:toAlphaChannelOfBuffer:", a3, v13);
    self->_formatDescForEncoding = -[MIOFrameProcessor updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:](self, "updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:", v13, self->_formatDescForEncoding);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for RawBayer stream."), 19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a5)
      *a5 = objc_retainAutorelease(v15);

    v13 = 0;
  }

  return v13;
}

- (int)bufferCacheMode
{
  return self->bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  self->bufferCacheMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
