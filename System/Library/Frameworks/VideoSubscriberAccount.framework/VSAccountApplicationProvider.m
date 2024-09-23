@implementation VSAccountApplicationProvider

- (VSAccountApplicationProvider)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

+ (VSAccountApplicationProvider)new
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The %@ initializer is not available."), v4);

  return 0;
}

- (VSAccountApplicationProvider)initWithLocalizedDisplayName:(NSString *)localizedDisplayName identifier:(NSString *)identifier
{
  NSString *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  VSAccountApplicationProvider *v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  objc_super v24;

  v6 = localizedDisplayName;
  v7 = identifier;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise:format:", v9, CFSTR("Unexpectedly, localizedDisplayName was %@, instead of NSString."), v11);

    }
    if (-[NSString length](v6, "length"))
    {
      if (v7)
        goto LABEL_6;
LABEL_13:
      v16 = CFSTR("The identifier parameter must not be nil.");
      goto LABEL_14;
    }
    v17 = CFSTR("The localizedDisplayName parameter must not be empty.");
  }
  else
  {
    v17 = CFSTR("The localizedDisplayName parameter must not be nil.");
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v17);
  if (!v7)
    goto LABEL_13;
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("Unexpectedly, identifier was %@, instead of NSString."), v15);

  }
  if (!-[NSString length](v7, "length"))
  {
    v16 = CFSTR("The identifier parameter must not be empty.");
LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v16);
  }
  v24.receiver = self;
  v24.super_class = (Class)VSAccountApplicationProvider;
  v18 = -[VSAccountApplicationProvider init](&v24, sel_init);
  if (v18)
  {
    v19 = -[NSString copy](v6, "copy");
    v20 = v18->_localizedDisplayName;
    v18->_localizedDisplayName = (NSString *)v19;

    v21 = -[NSString copy](v7, "copy");
    v22 = v18->_identifier;
    v18->_identifier = (NSString *)v21;

  }
  return v18;
}

- (VSAccountApplicationProvider)initWithCoder:(id)a3
{
  id v4;
  VSAccountApplicationProvider *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAccountApplicationProvider;
  v5 = -[VSAccountApplicationProvider init](&v8, sel_init);
  if (v5)
  {
    VSAccountApplicationProviderValueType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInitWithCoder(v6, v5, v4);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  VSAccountApplicationProviderValueType();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  VSAccountApplicationProviderValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  VSAccountApplicationProviderValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  VSAccountApplicationProviderValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;

  VSAccountApplicationProviderValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
