@implementation _EMBusinessExternalIDComponents

- (BOOL)isEqual:(id)a3
{
  _EMBusinessExternalIDComponents *v4;
  _EMBusinessExternalIDComponents *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (_EMBusinessExternalIDComponents *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if ((-[_EMBusinessExternalIDComponents isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[_EMBusinessExternalIDComponents simpleAddress](self, "simpleAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EMBusinessExternalIDComponents simpleAddress](v5, "simpleAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFStringsAreEqual())
    {
      -[_EMBusinessExternalIDComponents highLevelDomain](self, "highLevelDomain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EMBusinessExternalIDComponents highLevelDomain](v5, "highLevelDomain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFStringsAreEqual())
      {
        -[_EMBusinessExternalIDComponents displayName](self, "displayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_EMBusinessExternalIDComponents displayName](v5, "displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = EFStringsAreEqual();

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[_EMBusinessExternalIDComponents simpleAddress](self, "simpleAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_EMBusinessExternalIDComponents highLevelDomain](self, "highLevelDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[_EMBusinessExternalIDComponents displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 33 * (33 * v4 + v6) + objc_msgSend(v7, "hash") + 35937;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _EMBusinessExternalIDComponents *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(_EMBusinessExternalIDComponents);
  -[_EMBusinessExternalIDComponents simpleAddress](self, "simpleAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMBusinessExternalIDComponents setSimpleAddress:](v4, "setSimpleAddress:", v5);

  -[_EMBusinessExternalIDComponents highLevelDomain](self, "highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMBusinessExternalIDComponents setHighLevelDomain:](v4, "setHighLevelDomain:", v6);

  -[_EMBusinessExternalIDComponents displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMBusinessExternalIDComponents setDisplayName:](v4, "setDisplayName:", v7);

  return v4;
}

- (NSString)highLevelDomain
{
  return self->_highLevelDomain;
}

- (void)setHighLevelDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)simpleAddress
{
  return self->_simpleAddress;
}

- (void)setSimpleAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleAddress, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
}

@end
