@implementation CNSensitiveContentConfiguration

+ (id)log
{
  if (log_cn_once_token_0_7 != -1)
    dispatch_once(&log_cn_once_token_0_7, &__block_literal_global_90);
  return (id)log_cn_once_object_0_7;
}

void __38__CNSensitiveContentConfiguration_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNSensitiveContentConfiguration");
  v1 = (void *)log_cn_once_object_0_7;
  log_cn_once_object_0_7 = (uint64_t)v0;

}

+ (CNSensitiveContentConfiguration)configurationWithOverride:(int64_t)a3
{
  return (CNSensitiveContentConfiguration *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSensitiveContentOverride:", a3);
}

- (CNSensitiveContentConfiguration)initWithSensitiveContentOverride:(int64_t)a3
{
  CNSensitiveContentConfiguration *v4;
  CNSensitiveContentConfiguration *v5;
  CNSensitiveContentConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNSensitiveContentConfiguration;
  v4 = -[CNSensitiveContentConfiguration init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_override = a3;
    v6 = v4;
  }

  return v5;
}

- (CNSensitiveContentConfiguration)initWithDataRepresentation:(id)a3
{
  void *v4;
  id v5;
  CNSensitiveContentConfiguration *v6;
  id v7;
  CNSensitiveContentConfiguration *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = a3;
    v11 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
    v6 = (CNSensitiveContentConfiguration *)objc_claimAutoreleasedReturnValue();

    v7 = v11;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_DEFAULT, "Error unarchiving Core Data value into CNSensitiveContentConfiguration: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dataRepresentation
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Error archiving CNSensitiveContentConfiguration: %@", buf, 0xCu);
    }

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSensitiveContentConfiguration)initWithCoder:(id)a3
{
  id v4;
  int v5;
  CNSensitiveContentConfiguration *v6;
  int v7;
  NSObject *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("version"));
  if (v5 >= 2)
  {
    v7 = v5;
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNSensitiveContentConfiguration initWithCoder:].cold.1(v7, v8);

    v6 = 0;
  }
  else
  {
    self = -[CNSensitiveContentConfiguration initWithSensitiveContentOverride:](self, "initWithSensitiveContentOverride:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("override")));
    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CNSensitiveContentConfiguration override](self, "override"), CFSTR("override"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CNSensitiveContentConfiguration initWithSensitiveContentOverride:]([CNSensitiveContentConfiguration alloc], "initWithSensitiveContentOverride:", -[CNSensitiveContentConfiguration override](self, "override"));
}

- (id)updatedWithOverride:(int64_t)a3
{
  void *v4;

  v4 = (void *)-[CNSensitiveContentConfiguration copy](self, "copy");
  objc_msgSend(v4, "setOverride:", a3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CNSensitiveContentConfiguration *v4;
  int64_t v5;
  BOOL v6;

  v4 = (CNSensitiveContentConfiguration *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CNSensitiveContentConfiguration override](self, "override");
      v6 = v5 == -[CNSensitiveContentConfiguration override](v4, "override");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[CNSensitiveContentConfiguration override](self, "override");
  if (v2 >= 0)
    v3 = v2;
  else
    v3 = -v2;
  return v3 + 527;
}

- (int64_t)override
{
  return self->_override;
}

- (void)setOverride:(int64_t)a3
{
  self->_override = a3;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "CNSensitiveContentConfiguration has a higher version number than we know how to handle: %ld", (uint8_t *)&v2, 0xCu);
}

@end
