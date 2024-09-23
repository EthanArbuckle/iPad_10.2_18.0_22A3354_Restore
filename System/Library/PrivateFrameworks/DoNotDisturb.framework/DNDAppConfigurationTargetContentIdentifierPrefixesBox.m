@implementation DNDAppConfigurationTargetContentIdentifierPrefixesBox

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_appConfigurationTargetContentIdentifierPrefixesForModeIdentifier, CFSTR("boxed"));
}

- (DNDAppConfigurationTargetContentIdentifierPrefixesBox)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  DNDAppConfigurationTargetContentIdentifierPrefixesBox *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("boxed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(DNDAppConfigurationTargetContentIdentifierPrefixesBox);
  -[DNDAppConfigurationTargetContentIdentifierPrefixesBox setAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:](v11, "setAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:", v10);

  return v11;
}

- (NSDictionary)appConfigurationTargetContentIdentifierPrefixesForModeIdentifier
{
  return self->_appConfigurationTargetContentIdentifierPrefixesForModeIdentifier;
}

- (void)setAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationTargetContentIdentifierPrefixesForModeIdentifier, 0);
}

@end
