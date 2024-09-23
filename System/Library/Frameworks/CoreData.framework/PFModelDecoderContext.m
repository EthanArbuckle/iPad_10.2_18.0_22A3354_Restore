@implementation PFModelDecoderContext

+ (id)retainedContext
{
  unint64_t StatusReg;
  _QWORD *v3;
  _QWORD *v4;
  CFStringRef (__cdecl *v5)(const void *);
  CFSetCallBacks v7;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v3 = *(_QWORD **)(StatusReg + 688);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v3 = objc_alloc_init((Class)a1);
    v7.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&v7.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
    v5 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
    v7.equal = 0;
    v7.hash = 0;
    v7.copyDescription = v5;
    v3[3] = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v7);
    *(_QWORD *)(StatusReg + 688) = v3;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->model = 0;
  self->entity = 0;

  v3.receiver = self;
  v3.super_class = (Class)PFModelDecoderContext;
  -[PFModelDecoderContext dealloc](&v3, sel_dealloc);
  *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 688) = 0;
}

@end
