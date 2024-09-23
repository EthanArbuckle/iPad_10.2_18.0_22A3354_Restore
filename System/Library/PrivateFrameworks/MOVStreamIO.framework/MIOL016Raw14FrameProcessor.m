@implementation MIOL016Raw14FrameProcessor

- (MIOL016Raw14FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  MIOL016Raw14FrameProcessor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIOL016Raw14FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v6, sel_initWithInputFormatDescription_);
  if (v4)
  {
    v4->_formatDescForEncoding = +[MOVStreamIOUtility createL010FormatDescriptionFromL016FormatDescription:](MOVStreamIOUtility, "createL010FormatDescriptionFromL016FormatDescription:", a3);
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
  v4.super_class = (Class)MIOL016Raw14FrameProcessor;
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
  __CVBuffer *v6;

  v6 = +[MOVStreamVideoEncoderInterface createHEVCCompatiblePixelBuffer:](MOVStreamVideoEncoderInterface, "createHEVCCompatiblePixelBuffer:", a3, a4, a5);
  self->_formatDescForEncoding = -[MIOFrameProcessor updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:](self, "updatedFormatDescriptionIfNeededWithBuffer:currentFormatDescription:", v6, self->_formatDescForEncoding);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
