@implementation BWDeferredContainerPixelBufferWrapper

- (_QWORD)initWithPixelBuffer:(void *)a3 owner:
{
  _QWORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)BWDeferredContainerPixelBufferWrapper;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a3;
    objc_setAssociatedObject(a2, CFSTR("pixelBufferWrapper"), v5, (void *)0x301);
  }
  return v5;
}

- (void)dealloc
{
  _DWORD *v3;
  objc_super v4;

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  -[BWDeferredContainerPixelBufferPoolWrapper signal](self->_owner, "signal");

  if (*v3 == 1)
    kdebug_trace();
  v4.receiver = self;
  v4.super_class = (Class)BWDeferredContainerPixelBufferWrapper;
  -[BWDeferredContainerPixelBufferWrapper dealloc](&v4, sel_dealloc);
}

@end
