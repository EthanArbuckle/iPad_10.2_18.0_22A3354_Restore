@implementation _NUVideoPlaybackFrameRequestResponse

- (void)dealloc
{
  __CVBuffer *frame;
  objc_super v4;

  frame = self->_frame;
  if (frame)
    CFRelease(frame);
  v4.receiver = self;
  v4.super_class = (Class)_NUVideoPlaybackFrameRequestResponse;
  -[_NUVideoPlaybackFrameRequestResponse dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)frame
{
  return (__CVBuffer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFrame:(__CVBuffer *)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
