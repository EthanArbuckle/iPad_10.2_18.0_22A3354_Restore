@implementation CNUuidIdentifierProvider

- (CNUuidIdentifierProvider)initWithSuffix:(id)a3
{
  id v4;
  CNUuidIdentifierProvider *v5;
  NSString *v6;
  NSString *suffix;
  CNUuidIdentifierProvider *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUuidIdentifierProvider;
  v5 = -[CNUuidIdentifierProvider init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(CFSTR(":"), "stringByAppendingString:", v4);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3940]);
    }
    suffix = v5->_suffix;
    v5->_suffix = v6;

    v8 = v5;
  }

  return v5;
}

- (id)makeIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", self->_suffix);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
}

@end
