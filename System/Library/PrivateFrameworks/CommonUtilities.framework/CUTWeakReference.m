@implementation CUTWeakReference

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

+ (id)weakRefWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return v5;
}

- (CUTWeakReference)initWithObject:(id)a3
{
  id v4;
  CUTWeakReference *v5;
  CUTWeakReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CUTWeakReference;
  v5 = -[CUTWeakReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v6->_objectAddress = (unint64_t)v4;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "objectAddress");
    v6 = v5 == -[CUTWeakReference objectAddress](self, "objectAddress");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (unint64_t)objectAddress
{
  return self->_objectAddress;
}

- (void)setObjectAddress:(unint64_t)a3
{
  self->_objectAddress = a3;
}

@end
