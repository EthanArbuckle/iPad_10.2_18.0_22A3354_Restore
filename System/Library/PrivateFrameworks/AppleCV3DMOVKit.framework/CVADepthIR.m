@implementation CVADepthIR

- (CVADepthIR)initWithPixelBufferRef:(__CVBuffer *)a3 timestamp:(double)a4
{
  CVADepthIR *v7;
  CVADepthIR *v8;
  CVADepthIR *v9;
  objc_super v11;

  if (CVPixelBufferGetPixelFormatType(a3) == 825437747)
  {
    v11.receiver = self;
    v11.super_class = (Class)CVADepthIR;
    v7 = -[CVADepthIR init](&v11, sel_init);
    v8 = v7;
    if (v7)
    {
      -[CVADepthIR setTimestamp:](v7, "setTimestamp:", a4);
      -[CVADepthIR setDataBuffer:](v8, "setDataBuffer:", CVPixelBufferRetain(a3));
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(-[CVADepthIR dataBuffer](self, "dataBuffer"));
  v3.receiver = self;
  v3.super_class = (Class)CVADepthIR;
  -[CVADepthIR dealloc](&v3, sel_dealloc);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__CVBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(__CVBuffer *)a3
{
  self->_dataBuffer = a3;
}

@end
