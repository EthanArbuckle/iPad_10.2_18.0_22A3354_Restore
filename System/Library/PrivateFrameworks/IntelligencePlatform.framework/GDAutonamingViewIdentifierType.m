@implementation GDAutonamingViewIdentifierType

- (GDAutonamingViewIdentifierType)initWithInner:(id)a3
{
  id v5;
  GDAutonamingViewIdentifierType *v6;
  GDAutonamingViewIdentifierType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAutonamingViewIdentifierType;
  v6 = -[GDAutonamingViewIdentifierType init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inner, a3);

  return v7;
}

- (id)getInner
{
  return self->_inner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

+ (id)phPerson
{
  GDAutonamingViewIdentifierType *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = [GDAutonamingViewIdentifierType alloc];
  objc_msgSend_phPerson(GDAutonamingViewIdentifierTypeInner, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_initWithInner_(v2, v6, (uint64_t)v5);

  return v7;
}

@end
