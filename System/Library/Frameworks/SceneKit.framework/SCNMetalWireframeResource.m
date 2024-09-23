@implementation SCNMetalWireframeResource

- (void)dealloc
{
  void *programHashCode;
  objc_super v4;
  _QWORD block[5];

  CFRelease(self->material);
  CFRelease(self->program);
  programHashCode = self->programHashCode;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SCNMetalWireframeResource_dealloc__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = programHashCode;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v4.receiver = self;
  v4.super_class = (Class)SCNMetalWireframeResource;
  -[SCNMetalWireframeResource dealloc](&v4, sel_dealloc);
}

void __36__SCNMetalWireframeResource_dealloc__block_invoke(uint64_t a1)
{
  C3DProgramHashCodeRelease(*(_QWORD *)(a1 + 32));
}

@end
