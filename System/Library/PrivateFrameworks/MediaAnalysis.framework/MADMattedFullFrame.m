@implementation MADMattedFullFrame

- (MADMattedFullFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTimestamp:(id *)a4 confidence:(double)a5
{
  char *v8;
  __int128 v9;
  const __CFString *v10;
  CGColorSpaceRef v11;
  const void *v13;
  CFTypeRef cf;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MADMattedFullFrame;
  v8 = -[MADMattedFullFrame init](&v15, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = CFRetain(a3);
    v9 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v8 + 5) = a4->var3;
    *(_OWORD *)(v8 + 24) = v9;
    *((double *)v8 + 2) = a5;
    v10 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
    cf = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8CD8], 0);
    if (!cf)
    {
      v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
      v13 = 0;
      cf = v11;
      CF<opaqueCMSampleBuffer *>::~CF(&v13);
      CVBufferSetAttachment(a3, v10, cf, kCVAttachmentMode_ShouldPropagate);
    }
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  return (MADMattedFullFrame *)v8;
}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    CFRelease(pixelBuffer);
  v4.receiver = self;
  v4.super_class = (Class)MADMattedFullFrame;
  -[MADMattedFullFrame dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setPresentationTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_presentationTimestamp.epoch = a3->var3;
  *(_OWORD *)&self->_presentationTimestamp.value = v3;
}

- (double)confidence
{
  return self->_confidence;
}

@end
