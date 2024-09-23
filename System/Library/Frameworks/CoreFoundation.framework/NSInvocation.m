@implementation NSInvocation

- (NSMethodSignature)methodSignature
{
  return self->_signature;
}

- (void)invoke
{
  qword_1EDCD1038 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx
{
  NSInteger v8;
  NSInteger v9;
  NSMethodFrameArgInfo *v10;
  const UInt8 *v11;
  void *frame;
  __int16 v13;
  uint64_t v14;
  NSException *v15;
  uint64_t v16;
  uint64_t v17;

  v8 = -[NSMethodSignature numberOfArguments](self->_signature, "numberOfArguments");
  v9 = v8;
  if (idx < -1 || v8 <= idx)
  {
    v16 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: index (%ld) out of bounds [-1, %ld]"), v16, idx, v9 - 1);
    goto LABEL_18;
  }
  v10 = -[NSMethodSignature _argInfo:](self->_signature, "_argInfo:", idx);
  if (!argumentLocation)
  {
    v17 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: NULL address argument"), v17);
LABEL_18:
    v15 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v15);
  }
  v11 = (const UInt8 *)v10;
  if ((idx & 0x8000000000000000) == 0)
  {
    frame = self->_frame;
LABEL_6:
    __NSICreateBackingForArgumentIfNeeded((uint64_t)self, (uint64_t)v10, idx, 0);
    goto LABEL_11;
  }
  v13 = *((_WORD *)v10 + 17);
  v14 = 8;
  if ((v13 & 0x80) == 0)
    v14 = 16;
  frame = *(Class *)((char *)&self->super.isa + v14);
  if ((v13 & 0x80) != 0 && !*(_QWORD *)((char *)self->_frame + v10->var5 + v10->var6))
    goto LABEL_6;
LABEL_11:
  __NSI2((uint64_t)v11, (uint64_t)frame, (double *)argumentLocation, 1);
  if (self->_retainedArgs || idx == -1 && !_CFExecutableLinkedOnOrAfter(5uLL))
    __NSI3(v11, (uint64_t)frame, (id *)&self->_container, 1);
}

- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx
{
  void *retdata;
  NSMethodSignature *signature;
  void *frame;
  NSInteger v10;
  uint64_t v11;
  NSInteger v12;
  NSException *v13;
  uint64_t v14;
  uint64_t v15;

  retdata = self->_retdata;
  signature = self->_signature;
  frame = self->_frame;
  v10 = -[NSMethodSignature numberOfArguments](signature, "numberOfArguments");
  if (idx < -1 || v10 <= idx)
  {
    v12 = v10;
    v14 = __CFExceptionProem((objc_class *)self, sel_getArgument_atIndex_);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: index (%ld) out of bounds [-1, %ld]"), v14, idx, v12 - 1);
    goto LABEL_10;
  }
  if (!argumentLocation)
  {
    v15 = __CFExceptionProem((objc_class *)self, sel_getArgument_atIndex_);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: NULL address argument"), v15);
LABEL_10:
    v13 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v13);
  }
  v11 = -[NSMethodSignature _argInfo:](signature, "_argInfo:", idx);
  if ((idx & 0x8000000000000000) == 0 || (*(_WORD *)(v11 + 34) & 0x80) != 0)
    retdata = frame;
  __NSI1(v11, (uint64_t)retdata, (char *)argumentLocation, 1);
}

- (void)dealloc
{
  void *retdata;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_stackAllocated == 1)
  {

    objc_destructInstance(self);
  }
  else
  {
    retdata = self->_retdata;
    if (retdata)
      free(retdata);
    self->_frame = 0;
    self->_retdata = 0;

    v4.receiver = self;
    v4.super_class = (Class)NSInvocation;
    -[NSInvocation dealloc](&v4, sel_dealloc);
  }
}

+ (id)_invocationWithMethodSignature:(id)a3 frame:(void *)a4
{
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char *v13;
  NSException *v15;
  uint64_t v16;
  uint64_t v17;

  if (!a3)
  {
    v16 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: method signature argument cannot be nil"), v16);
    goto LABEL_11;
  }
  v8 = objc_msgSend(a3, "frameLength");
  v9 = v8 + 320;
  v10 = v8 >= 0xFFFFFFFFFFFFFEC0;
  v11 = v10 << 63 >> 63;
  if (v11 != v10 || v11 < 0)
  {
    v17 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("Overflow while allocating space for method signature %@"), v17);
LABEL_11:
    v15 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v15);
  }
  v12 = objc_alloc((Class)a1);
  *((_QWORD *)v12 + 3) = a3;
  v13 = (char *)malloc_type_calloc(1uLL, v9, 0x1E404CA8uLL);
  *((_QWORD *)v12 + 1) = v13 + 320;
  *((_QWORD *)v12 + 2) = v13;
  *((_QWORD *)v12 + 4) = 0;
  if (magic_cookie_oGuard != -1)
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  *((_DWORD *)v12 + 12) = magic_cookie_oValue;
  if (a4)
    memmove(*((void **)v12 + 1), a4, objc_msgSend(a3, "frameLength"));
  *((_BYTE *)v12 + 52) = 0;
  return v12;
}

- (void)retainArguments
{
  qword_1EDCD1038 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

- (uint64_t)_initWithMethodSignature:(const void *)a3 frame:(void *)a4 buffer:(size_t)a5 size:
{
  uint64_t result;

  if (!a1)
    return a1;
  result = objc_msgSend(a2, "frameLength");
  if (result + 320 <= a5)
  {
    *(_QWORD *)(a1 + 24) = a2;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 16) = a4;
    bzero(a4, a5);
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a1 + 16) + 320;
    if (magic_cookie_oGuard != -1)
      dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
    *(_DWORD *)(a1 + 48) = magic_cookie_oValue;
    if (a3)
      memmove(*(void **)(a1 + 8), a3, objc_msgSend(a2, "frameLength"));
    *(_WORD *)(a1 + 52) = 256;
    return a1;
  }
  __break(1u);
  return result;
}

+ (NSInvocation)invocationWithMethodSignature:(NSMethodSignature *)sig
{
  return (NSInvocation *)objc_msgSend(a1, "_invocationWithMethodSignature:frame:", sig, 0);
}

- (void)getReturnValue:(void *)retLoc
{
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", retLoc, -1);
}

- (BOOL)argumentsRetained
{
  return self->_retainedArgs != 0;
}

- (SEL)selector
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", v3, 1);
  return (SEL)v3[0];
}

- (void)_addAttachedObject:(id)a3
{
  NSMutableArray *container;

  if (a3)
  {
    container = self->_container;
    if (!container)
    {
      container = (NSMutableArray *)objc_opt_new();
      self->_container = container;
    }
    -[NSMutableArray addObject:](container, "addObject:", a3);
  }
}

- (void)setReturnValue:(void *)retLoc
{
  -[NSInvocation setArgument:atIndex:](self, "setArgument:atIndex:", retLoc, -1);
}

- (void)setSelector:(SEL)selector
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = selector;
  -[NSInvocation setArgument:atIndex:](self, "setArgument:atIndex:", v3, 1);
}

- (void)invokeWithTarget:(id)target
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = target;
  -[NSInvocation setArgument:atIndex:](self, "setArgument:atIndex:", v4, 0);
  -[NSInvocation invoke](self, "invoke");
}

- (void)setTarget:(id)target
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = target;
  -[NSInvocation setArgument:atIndex:](self, "setArgument:atIndex:", v3, 0);
}

- (id)target
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", v3, 0);
  return (id)v3[0];
}

- (void)invokeUsingIMP:(IMP)imp
{
  unsigned int magic;
  NSMethodFrameDescriptor *v6;
  uint64_t var0;
  const UInt8 *v8;
  uint64_t v9;
  void *frame;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  magic = self->_magic;
  if (magic_cookie_oGuard != -1)
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  if (magic != magic_cookie_oValue)
    -[NSInvocation invokeUsingIMP:].cold.1();
  v11[0] = 0;
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", v11, 0);
  if (v11[0])
  {
    v6 = -[NSMethodSignature _frameDescriptor](self->_signature, "_frameDescriptor");
    var0 = (uint64_t)v6->var0;
    if ((*((_WORD *)v6->var0 + 17) & 0x80) != 0
      && !*(_QWORD *)((char *)self->_frame + *(_DWORD *)(var0 + 28) + *(unsigned __int8 *)(var0 + 32)))
    {
      __NSICreateBackingForArgumentIfNeeded((uint64_t)self, var0, -1, 0);
    }
    __invoking___((uint64_t (*)(unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, __n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))imp, (uint64_t)self->_retdata, (__n128 *)self->_frame, -[NSMethodSignature frameLength](self->_signature, "frameLength"));
    if (self->_retainedArgs)
    {
      v8 = (const UInt8 *)v6->var0;
      v9 = 8;
      if ((*((_WORD *)v6->var0 + 17) & 0x80) == 0)
        v9 = 16;
      frame = *(Class *)((char *)&self->super.isa + v9);
LABEL_12:
      __NSI3(v8, (uint64_t)frame, (id *)&self->_container, 1);
      while (1)
      {
        v6 = (NSMethodFrameDescriptor *)v6->var1;
        if (!v6)
          break;
        if ((WORD1(v6[1].var1) & 3) != 1)
        {
          frame = self->_frame;
          v8 = (const UInt8 *)v6;
          goto LABEL_12;
        }
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int magic;
  _QWORD *v5;
  char *v6;

  magic = self->_magic;
  if (magic_cookie_oGuard != -1)
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  if (magic != magic_cookie_oValue)
    -[NSInvocation copyWithZone:].cold.1();
  v5 = objc_alloc((Class)objc_opt_class());
  v5[3] = self->_signature;
  v6 = (char *)malloc_type_calloc(1uLL, -[NSMethodSignature frameLength](self->_signature, "frameLength") + 320, 0xDB3134BDuLL);
  v5[1] = v6 + 320;
  v5[2] = v6;
  v5[4] = 0;
  *((_DWORD *)v5 + 12) = self->_magic;
  if (self->_retainedArgs)
    objc_msgSend(v5, "retainArguments");
  return v5;
}

+ (uint64_t)requiredStackSizeForSignature:(uint64_t)a1
{
  objc_opt_self();
  return objc_msgSend(a2, "frameLength") + 320;
}

- (NSInvocation)init
{

  return 0;
}

- (void)copyWithZone:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

- (void)invokeUsingIMP:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

@end
