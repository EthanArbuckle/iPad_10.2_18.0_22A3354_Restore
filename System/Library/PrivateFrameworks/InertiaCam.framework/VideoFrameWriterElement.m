@implementation VideoFrameWriterElement

- (void)DeallocPixBuffer
{
  if (-[VideoFrameWriterElement pixelBuffer](self, "pixelBuffer"))
  {
    CVPixelBufferRelease(-[VideoFrameWriterElement pixelBuffer](self, "pixelBuffer"));
    -[VideoFrameWriterElement setPixelBuffer:](self, "setPixelBuffer:", 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[VideoFrameWriterElement DeallocPixBuffer](self, "DeallocPixBuffer");
  v3.receiver = self;
  v3.super_class = (Class)VideoFrameWriterElement;
  -[VideoFrameWriterElement dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setFrameTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_frameTime.epoch = a3->var3;
  *(_OWORD *)&self->_frameTime.value = v3;
}

- (int64_t)frameNumber
{
  return self->_frameNumber;
}

- (void)setFrameNumber:(int64_t)a3
{
  self->_frameNumber = a3;
}

@end
