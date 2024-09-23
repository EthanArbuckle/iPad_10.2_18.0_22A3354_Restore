@implementation SKWeakReference

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (SKWeakReference)initWithObject:(id)a3
{
  id v4;
  SKWeakReference *v5;
  SKWeakReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKWeakReference;
  v5 = -[SKWeakReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SKWeakReference setObject:](v5, "setObject:", v4);

  return v6;
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SKWeakReference object](self, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKWeakReference object](self, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
