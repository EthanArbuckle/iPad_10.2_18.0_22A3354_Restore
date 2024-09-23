@implementation ARWeakReference

+ (ARWeakReference)weakReferenceWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return (ARWeakReference *)v5;
}

- (ARWeakReference)initWithObject:(id)a3
{
  ARWeakReference *v4;

  if (a3)
  {
    objc_storeWeak(&self->_object, a3);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_object);
  if (WeakRetained)
    objc_msgSend(v5, "invokeWithTarget:", WeakRetained);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *WeakRetained;
  void *v5;
  SEL v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained(&self->_object);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = a3;
  }
  else
  {
    WeakRetained = (void *)objc_opt_class();
    v6 = sel__noOp;
  }
  objc_msgSend(WeakRetained, "methodSignatureForSelector:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_noOp
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("This method is used as a dummy method signature and should never be called under any circumstances."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
