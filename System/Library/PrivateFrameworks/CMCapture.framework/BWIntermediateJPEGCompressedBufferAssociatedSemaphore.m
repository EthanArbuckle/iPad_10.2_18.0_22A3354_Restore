@implementation BWIntermediateJPEGCompressedBufferAssociatedSemaphore

- (BWIntermediateJPEGCompressedBufferAssociatedSemaphore)initWithSemaphore:(id)a3 name:(id)a4 presentationTimeStamp:(id *)a5
{
  char *v7;
  int64_t var3;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWIntermediateJPEGCompressedBufferAssociatedSemaphore;
  v7 = -[BWIntermediateJPEGCompressedBufferAssociatedSemaphore init](&v10, sel_init, a3, a4);
  if (v7)
  {
    *((_QWORD *)v7 + 1) = a3;
    *((_QWORD *)v7 + 2) = *((id *)v7 + 2);
    var3 = a5->var3;
    *(_OWORD *)(v7 + 24) = *(_OWORD *)&a5->var0;
    *((_QWORD *)v7 + 5) = var3;
  }
  return (BWIntermediateJPEGCompressedBufferAssociatedSemaphore *)v7;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

  v3.receiver = self;
  v3.super_class = (Class)BWIntermediateJPEGCompressedBufferAssociatedSemaphore;
  -[BWIntermediateJPEGCompressedBufferAssociatedSemaphore dealloc](&v3, sel_dealloc);
}

@end
