@implementation FRCFrame

- (FRCFrame)initWithBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a4;
  return -[FRCFrame initWithBuffer:presentationTimeStamp:info:](self, "initWithBuffer:presentationTimeStamp:info:", a3, &v5, 0);
}

- (FRCFrame)initWithBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4 info:(id)a5
{
  id v9;
  char *v10;
  int64_t var3;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FRCFrame;
  v10 = -[FRCFrame init](&v13, sel_init);
  if (v10)
  {
    *((_QWORD *)v10 + 1) = CVPixelBufferRetain(a3);
    var3 = a4->var3;
    *(_OWORD *)(v10 + 24) = *(_OWORD *)&a4->var0;
    *((_QWORD *)v10 + 5) = var3;
    objc_storeStrong((id *)v10 + 2, a5);
  }

  return (FRCFrame *)v10;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_buffer);
  v3.receiver = self;
  v3.super_class = (Class)FRCFrame;
  -[FRCFrame dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setPresentationTimeStamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_presentationTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_presentationTimeStamp.value = v3;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
