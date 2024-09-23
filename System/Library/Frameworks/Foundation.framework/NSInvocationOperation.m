@implementation NSInvocationOperation

- (NSInvocationOperation)init
{
  return -[NSInvocationOperation initWithInvocation:](self, "initWithInvocation:", 0);
}

- (NSInvocationOperation)initWithTarget:(id)target selector:(SEL)sel object:(id)arg
{
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  NSString *v15;
  NSString *v16;
  objc_super v17;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v19[0] = arg;
  v9 = (void *)objc_msgSend(target, "methodSignatureForSelector:", sel);
  if (!v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)NSInvocationOperation;
    -[NSOperation init](&v18, sel_init);
LABEL_10:

    return 0;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "numberOfArguments");
  v12 = v11;
  if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v11 >= 4)
    {
      v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      v16 = NSStringFromSelector(sel);
      NSLog((NSString *)CFSTR("%@: method '%@' requires more than 1 argument"), v15, v16);
    }
    v17.receiver = self;
    v17.super_class = (Class)NSInvocationOperation;
    -[NSOperation init](&v17, sel_init);
    goto LABEL_10;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
  objc_msgSend(v13, "setTarget:", target);
  objc_msgSend(v13, "setSelector:", sel);
  if (v12 >= 3)
    objc_msgSend(v13, "setArgument:atIndex:", v19, 2);
  return -[NSInvocationOperation initWithInvocation:](self, "initWithInvocation:", v13);
}

- (NSInvocationOperation)initWithInvocation:(NSInvocation *)inv
{
  NSInvocationOperation *v5;
  objc_super v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (inv)
  {
    v7.receiver = self;
    v7.super_class = (Class)NSInvocationOperation;
    v5 = -[NSOperation init](&v7, sel_init);
    -[NSInvocation retainArguments](inv, "retainArguments");
    v5->_inv = inv;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSInvocationOperation;
    -[NSOperation init](&v8, sel_init);

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSInvocationOperation;
  -[NSOperation dealloc](&v3, sel_dealloc);
}

- (NSInvocation)invocation
{
  return self->_inv;
}

- (void)main
{
  -[NSInvocation invoke](self->_inv, "invoke");
}

- (id)result
{
  _BOOL4 v4;
  id result;
  os_unfair_lock_s *p_iop;
  NSException *exception;
  NSInvocation *inv;
  NSMethodSignature *v9;
  const char *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  NSString *v17;
  void *v18;
  const __CFString *v19;
  NSString *v20;
  NSException *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v22[0] = 0;
  v4 = -[NSOperation isFinished](self, "isFinished");
  result = 0;
  if (!v4)
    return result;
  if (-[NSOperation isCancelled](self, "isCancelled"))
  {
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: operation was cancelled"), _NSMethodExceptionProem((objc_class *)self, a2));
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = CFSTR("NSInvocationOperationCancelledException");
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0));
  }
  p_iop = (os_unfair_lock_s *)&self->super._iop;
  os_unfair_lock_lock(&self->super._iop.__lock);
  exception = self->_exception;
  if (exception)
  {
    v21 = exception;
    iop_unlock(p_iop);
    objc_exception_throw(v21);
  }
  inv = self->_inv;
  if (!inv
    || !-[NSMethodSignature methodReturnLength](-[NSInvocation methodSignature](inv, "methodSignature"), "methodReturnLength"))
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: operation had void result"), _NSMethodExceptionProem((objc_class *)self, a2));
    iop_unlock(p_iop);
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = CFSTR("NSInvocationOperationVoidResultException");
    v20 = v17;
    goto LABEL_14;
  }
  v9 = -[NSInvocation methodSignature](self->_inv, "methodSignature");
  v10 = -[NSMethodSignature methodReturnType](v9, "methodReturnType");
  v11 = &v10[strspn(v10, "norNORV+0123456789")];
  v12 = *(unsigned __int8 *)v11;
  if (v12 == 64 || v12 == 35)
  {
    -[NSInvocation getReturnValue:](self->_inv, "getReturnValue:", v22);
  }
  else
  {
    v13 = -[NSMethodSignature methodReturnLength](v9, "methodReturnLength");
    *(_QWORD *)&v14 = MEMORY[0x1E0C80A78](v13).n128_u64[0];
    v16 = (char *)v22 - v15;
    -[NSInvocation getReturnValue:](self->_inv, "getReturnValue:", (char *)v22 - v15, v14);
    v22[0] = +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v16, v11);
  }
  os_unfair_lock_unlock(&self->super._iop.__lock);
  return (id)v22[0];
}

@end
