@implementation MIOFrameProcessor

- (MIOFrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  MIOFrameProcessor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIOFrameProcessor;
  v4 = -[MIOFrameProcessor init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_formatDesc = a3;
    -[MIOFrameProcessor setBufferCacheMode:](v4, "setBufferCacheMode:", 0);
  }
  return v4;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDesc;
  objc_super v4;

  formatDesc = self->_formatDesc;
  if (formatDesc)
    CFRelease(formatDesc);
  v4.receiver = self;
  v4.super_class = (Class)MIOFrameProcessor;
  -[MIOFrameProcessor dealloc](&v4, sel_dealloc);
}

- (opaqueCMFormatDescription)formatDesc
{
  return self->_formatDesc;
}

- (opaqueCMFormatDescription)updatedFormatDescriptionIfNeededWithBuffer:(__CVBuffer *)a3 currentFormatDescription:(opaqueCMFormatDescription *)a4
{
  if (!-[MIOFrameProcessor formatDescriptionNeedsUpdate](self, "formatDescriptionNeedsUpdate"))
    return a4;
  -[MIOFrameProcessor setFormatDescriptionNeedsUpdate:](self, "setFormatDescriptionNeedsUpdate:", 0);
  if (a4)
    CFRelease(a4);
  return +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:](MOVStreamIOUtility, "createFormatDescriptionFromPixelBuffer:", a3);
}

- (unsigned)encodedPixelFormat
{
  __assert_rtn("-[MIOFrameProcessor encodedPixelFormat]", "MIOFrameProcessor.m", 60, "0");
}

- (opaqueCMFormatDescription)formatDescriptionForEncoding
{
  __assert_rtn("-[MIOFrameProcessor formatDescriptionForEncoding]", "MIOFrameProcessor.m", 66, "0");
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  id v5;

  v5 = a4;
  __assert_rtn("-[MIOFrameProcessor processPixelBuffer:preserveAttachments:error:]", "MIOFrameProcessor.m", 72, "0");
}

- (int)bufferCacheMode
{
  return self->bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  self->bufferCacheMode = a3;
}

- (BOOL)formatDescriptionNeedsUpdate
{
  return self->_formatDescriptionNeedsUpdate;
}

- (void)setFormatDescriptionNeedsUpdate:(BOOL)a3
{
  self->_formatDescriptionNeedsUpdate = a3;
}

@end
