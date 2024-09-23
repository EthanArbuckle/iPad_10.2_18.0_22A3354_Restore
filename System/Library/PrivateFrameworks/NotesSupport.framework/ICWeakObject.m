@implementation ICWeakObject

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (ICWeakObject)initWithObject:(id)a3
{
  id v4;
  ICWeakObject *v5;
  ICWeakObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICWeakObject;
  v5 = -[ICWeakObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v6->_cachedHash = (unint64_t)v4;
  }

  return v6;
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[ICWeakObject object](self, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICWeakObject;
  -[ICWeakObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICWeakObject object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCachedHash:(unint64_t)a3
{
  self->_cachedHash = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
