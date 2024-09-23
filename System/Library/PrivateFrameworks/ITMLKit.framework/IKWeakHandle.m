@implementation IKWeakHandle

- (IKWeakHandle)initWithGetter:(id)a3
{
  id v4;
  IKWeakHandle *v5;
  uint64_t v6;
  id getter;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKWeakHandle;
  v5 = -[IKWeakHandle init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    getter = v5->_getter;
    v5->_getter = (id)v6;

  }
  return v5;
}

- (id)object
{
  id *p_object;
  id WeakRetained;
  void *v5;

  p_object = &self->_object;
  WeakRetained = objc_loadWeakRetained(&self->_object);

  if (!WeakRetained)
  {
    (*((void (**)(void))self->_getter + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(p_object, v5);

  }
  return objc_loadWeakRetained(p_object);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getter, 0);
  objc_destroyWeak(&self->_object);
}

@end
