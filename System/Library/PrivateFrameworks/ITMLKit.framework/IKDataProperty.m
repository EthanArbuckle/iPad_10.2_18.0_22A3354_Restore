@implementation IKDataProperty

- (IKDataProperty)initWithProperty:(id)a3
{
  id v5;
  IKDataProperty *v6;
  IKDataProperty *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKDataProperty;
  v6 = -[IKDataProperty init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_property, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IKDataProperty property](self, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDataProperty property](self, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
}

@end
