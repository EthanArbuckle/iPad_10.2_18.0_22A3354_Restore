@implementation FMWeakWrapper

- (FMWeakWrapper)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Use initWithObject:"));

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[FMWeakWrapper object](self, "object", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", v4);
  objc_msgSend(v5, "setObject:", v4);
  objc_msgSend(v5, "setObjectHash:", -[FMWeakWrapper objectHash](self, "objectHash"));

  return v5;
}

- (FMWeakWrapper)initWithObject:(id)a3
{
  id v4;
  FMWeakWrapper *v5;
  FMWeakWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMWeakWrapper;
  v5 = -[FMWeakWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FMWeakWrapper setObject:](v5, "setObject:", v4);
    -[FMWeakWrapper setObjectHash:](v6, "setObjectHash:", objc_msgSend(v4, "hash"));
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[FMWeakWrapper objectHash](self, "objectHash");
  v6 = objc_msgSend(v4, "objectHash");

  return v5 == v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMWeakWrapper object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> [%p]"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (unint64_t)objectHash
{
  return self->_objectHash;
}

- (void)setObjectHash:(unint64_t)a3
{
  self->_objectHash = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
