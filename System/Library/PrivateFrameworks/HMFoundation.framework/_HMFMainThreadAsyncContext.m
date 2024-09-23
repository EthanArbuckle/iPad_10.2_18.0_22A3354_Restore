@implementation _HMFMainThreadAsyncContext

- (void)assertIsExecuting
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    _HMFPreconditionFailure(CFSTR("[NSThread isMainThread]"));
}

- (void)performBlock:(id)a3
{
  void *v3;
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v4[2]();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performBlock:", v4);

  }
}

- (id)description
{
  return CFSTR("HMFMainThreadAsyncContext");
}

@end
