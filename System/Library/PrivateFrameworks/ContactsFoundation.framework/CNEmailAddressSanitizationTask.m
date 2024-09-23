@implementation CNEmailAddressSanitizationTask

- (CNEmailAddressSanitizationTask)initWithAddress:(id)a3
{
  id v4;
  CNEmailAddressSanitizationTask *v5;
  uint64_t v6;
  NSString *address;
  CNEmailAddressSanitizationTask *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNEmailAddressSanitizationTask;
  v5 = -[CNTask initWithName:](&v10, sel_initWithName_, CFSTR("CNEmailAddressSanitizationTask"));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    address = v5->_address;
    v5->_address = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("address"), self->_address);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)run:(id *)a3
{
  -[CNEmailAddressSanitizationTask removeMailtoPrefix](self, "removeMailtoPrefix", a3);
  return self->_address;
}

- (void)removeMailtoPrefix
{
  void *v3;
  BOOL v4;
  NSString *v5;
  NSString *address;
  id v7;

  if (-[NSString hasPrefix:](self->_address, "hasPrefix:", CFSTR("mailto:")))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", self->_address);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v3);

    if (!v4)
    {
      objc_msgSend(v7, "path");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      address = self->_address;
      self->_address = v5;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

@end
