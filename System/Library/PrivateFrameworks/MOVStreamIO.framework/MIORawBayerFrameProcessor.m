@implementation MIORawBayerFrameProcessor

- (MIORawBayerFrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  MIORawBayerFrameProcessor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIORawBayerFrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v6, sel_initWithInputFormatDescription_);
  if (v4)
  {
    v4->_formatDescForEncoding = +[MOVStreamIOUtility createL010FormatDescriptionFromRawBayerFormatDescription:](MOVStreamIOUtility, "createL010FormatDescriptionFromRawBayerFormatDescription:", a3);
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
  v4.super_class = (Class)MIORawBayerFrameProcessor;
  -[MIOFrameProcessor dealloc](&v4, sel_dealloc);
}

- (unsigned)encodedPixelFormat
{
  return 1278226736;
}

- (opaqueCMFormatDescription)formatDescriptionForEncoding
{
  return self->_formatDescForEncoding;
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  id v8;
  MIOPixelBufferPool *pool;
  MIOPixelBufferPool *v10;
  MIOPixelBufferPool *v11;
  __CVBuffer *v12;
  void *v14;
  void *v15;

  v8 = a4;
  pool = self->_pool;
  if (pool
    || (+[MIOPixelBufferPool createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:minBufferCount:bufferCacheMode:", a3, 10, -[MIOFrameProcessor bufferCacheMode](self, "bufferCacheMode")), v10 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v11 = self->_pool, self->_pool = v10, v11, (pool = self->_pool) != 0))
  {
    v12 = -[MIOPixelBufferPool getPixelBuffer](pool, "getPixelBuffer");
    +[MIOPixelBufferUtility splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:](PixelBufferUtility, "splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:", a3, v12, 2);
    self->_formatDescForEncoding = -[MIOFrameProcessor updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:](self, "updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:", v12, self->_formatDescForEncoding);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for RawBayer stream."), 19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a5)
      *a5 = objc_retainAutorelease(v14);

    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
