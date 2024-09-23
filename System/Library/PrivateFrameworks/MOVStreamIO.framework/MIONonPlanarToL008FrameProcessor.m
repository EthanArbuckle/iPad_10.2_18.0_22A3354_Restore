@implementation MIONonPlanarToL008FrameProcessor

- (MIONonPlanarToL008FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  MIONonPlanarToL008FrameProcessor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIONonPlanarToL008FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v6, sel_initWithInputFormatDescription_);
  if (v4)
  {
    v4->_formatDescForEncoding = +[MOVStreamIOUtility createL008FormatDescriptionFromNonPlanarFormatDescription:](MOVStreamIOUtility, "createL008FormatDescriptionFromNonPlanarFormatDescription:", a3);
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
  v4.super_class = (Class)MIONonPlanarToL008FrameProcessor;
  -[MIOFrameProcessor dealloc](&v4, sel_dealloc);
}

- (unsigned)encodedPixelFormat
{
  return 1278226488;
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
  size_t Height;
  double BytesPerPixel;
  MIOPixelBufferPool *v13;
  MIOPixelBufferPool *v14;
  __CVBuffer *v15;
  void *v17;
  void *v18;

  v8 = a4;
  pool = self->_pool;
  if (pool)
    goto LABEL_3;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerPixel = MIOCVPixelBufferGetBytesPerPixel(a3);
  self->_bytesPerPixel = BytesPerPixel;
  +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", (unint64_t)(BytesPerPixel * (double)Width), Height, 1278226488, 0, 10, -[MIONonPlanarToL008FrameProcessor bufferCacheMode](self, "bufferCacheMode"));
  v13 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue();
  v14 = self->_pool;
  self->_pool = v13;

  pool = self->_pool;
  if (pool)
  {
LABEL_3:
    v15 = -[MIOPixelBufferPool getPixelBuffer](pool, "getPixelBuffer");
    +[MIOPixelBufferUtility copyPixelBuffer:toPixelBuffer:](MIOPixelBufferUtility, "copyPixelBuffer:toPixelBuffer:", a3, v15);
    self->_formatDescForEncoding = -[MIOFrameProcessor updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:](self, "updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:", v15, self->_formatDescForEncoding);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create L008 pixel buffer pool for Non-Planar stream."), 19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a5)
      *a5 = objc_retainAutorelease(v17);

    v15 = 0;
  }

  return v15;
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
