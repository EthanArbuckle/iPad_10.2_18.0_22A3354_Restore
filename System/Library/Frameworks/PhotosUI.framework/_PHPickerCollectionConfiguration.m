@implementation _PHPickerCollectionConfiguration

- (BOOL)isEqual:(id)a3
{
  _PHPickerCollectionConfiguration *v4;
  _PHPickerCollectionConfiguration *v5;
  objc_class *v6;
  BOOL v7;
  objc_class *v9;
  objc_class *v10;
  _PHPickerCollectionConfiguration *v11;
  SEL v12;

  v4 = (_PHPickerCollectionConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
LABEL_15:

    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_15;
  }
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NSArray isEqual:](self->__identifiers, "isEqual:", v5->__identifiers)
        && -[NSArray isEqual:](self->_suggestedIdentifiers, "isEqual:", v5->_suggestedIdentifiers)
        && -[NSArray isEqual:](self->_preselectedIdentifiers, "isEqual:", v5->_preselectedIdentifiers)
        && -[NSArray isEqual:](self->_disabledIdentifiers, "isEqual:", v5->_disabledIdentifiers)
        && -[NSString isEqualToString:](self->_purpose, "isEqualToString:", v5->_purpose)
        && self->_allowsEditingCollection == v5->_allowsEditingCollection;

      goto LABEL_15;
    }
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v11 = (_PHPickerCollectionConfiguration *)_PFAssertFailHandler();
  return -[_PHPickerCollectionConfiguration hash](v11, v12);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSArray hash](self->__identifiers, "hash");
  v4 = -[NSArray hash](self->_suggestedIdentifiers, "hash") - v3 + 32 * v3;
  v5 = -[NSArray hash](self->_preselectedIdentifiers, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_disabledIdentifiers, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_purpose, "hash");
  return self->_allowsEditingCollection - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6) + 887503681;
}

- (_PHPickerCollectionConfiguration)initWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  _PHPickerCollectionConfiguration *v6;
  uint64_t v7;
  NSArray *identifiers;
  NSArray *suggestedIdentifiers;
  NSArray *v10;
  NSArray *preselectedIdentifiers;
  NSArray *disabledIdentifiers;
  NSString *purpose;
  _PHPickerCollectionConfiguration *v15;
  SEL v16;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)_PHPickerCollectionConfiguration;
    v6 = -[_PHPickerCollectionConfiguration init](&v17, sel_init);
    if (!v6)
    {
LABEL_5:

      return v6;
    }
    if ((-[_PHPickerCollectionConfiguration isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      v7 = objc_msgSend(v5, "copy");
      identifiers = v6->__identifiers;
      v6->__identifiers = (NSArray *)v7;

      suggestedIdentifiers = v6->_suggestedIdentifiers;
      v10 = (NSArray *)MEMORY[0x24BDBD1A8];
      v6->_suggestedIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

      preselectedIdentifiers = v6->_preselectedIdentifiers;
      v6->_preselectedIdentifiers = v10;

      disabledIdentifiers = v6->_disabledIdentifiers;
      v6->_disabledIdentifiers = v10;

      purpose = v6->_purpose;
      v6->_purpose = (NSString *)&stru_24C62D0F8;

      goto LABEL_5;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v15 = (_PHPickerCollectionConfiguration *)_PFAssertFailHandler();
  return -[_PHPickerCollectionConfiguration init](v15, v16);
}

- (_PHPickerCollectionConfiguration)init
{
  _PHPickerCollectionConfiguration *v2;
  NSArray *identifiers;
  NSArray *suggestedIdentifiers;
  NSArray *v5;
  NSArray *preselectedIdentifiers;
  NSArray *disabledIdentifiers;
  NSString *purpose;
  _PHPickerCollectionConfiguration *v10;
  SEL v11;
  _NSZone *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_PHPickerCollectionConfiguration;
  v2 = -[_PHPickerCollectionConfiguration init](&v13, sel_init);
  if (!v2)
    return v2;
  if ((-[_PHPickerCollectionConfiguration isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    identifiers = v2->__identifiers;
    v2->__identifiers = 0;

    suggestedIdentifiers = v2->_suggestedIdentifiers;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_suggestedIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

    preselectedIdentifiers = v2->_preselectedIdentifiers;
    v2->_preselectedIdentifiers = v5;

    disabledIdentifiers = v2->_disabledIdentifiers;
    v2->_disabledIdentifiers = v5;

    purpose = v2->_purpose;
    v2->_purpose = (NSString *)&stru_24C62D0F8;

    return v2;
  }
  v10 = (_PHPickerCollectionConfiguration *)_PFAssertFailHandler();
  return (_PHPickerCollectionConfiguration *)-[_PHPickerCollectionConfiguration copyWithZone:](v10, v11, v12);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _PHPickerCollectionConfiguration *v4;
  _PHPickerCollectionConfiguration *v5;
  uint64_t v6;
  NSArray *suggestedIdentifiers;
  uint64_t v8;
  NSArray *preselectedIdentifiers;
  uint64_t v10;
  NSArray *disabledIdentifiers;
  uint64_t v12;
  NSString *purpose;

  if (self->__identifiers)
    v4 = -[_PHPickerCollectionConfiguration initWithIdentifiers:]([_PHPickerCollectionConfiguration alloc], "initWithIdentifiers:", self->__identifiers);
  else
    v4 = objc_alloc_init(_PHPickerCollectionConfiguration);
  v5 = v4;
  v6 = -[NSArray copy](self->_suggestedIdentifiers, "copy");
  suggestedIdentifiers = v5->_suggestedIdentifiers;
  v5->_suggestedIdentifiers = (NSArray *)v6;

  v8 = -[NSArray copy](self->_preselectedIdentifiers, "copy");
  preselectedIdentifiers = v5->_preselectedIdentifiers;
  v5->_preselectedIdentifiers = (NSArray *)v8;

  v10 = -[NSArray copy](self->_disabledIdentifiers, "copy");
  disabledIdentifiers = v5->_disabledIdentifiers;
  v5->_disabledIdentifiers = (NSArray *)v10;

  v12 = -[NSString copy](self->_purpose, "copy");
  purpose = v5->_purpose;
  v5->_purpose = (NSString *)v12;

  v5->_allowsEditingCollection = self->_allowsEditingCollection;
  return v5;
}

- (_PHPickerCollectionConfiguration)initWithCoder:(id)a3
{
  id v4;
  _PHPickerCollectionConfiguration *v5;
  uint64_t v6;
  NSArray *identifiers;
  uint64_t v8;
  NSArray *suggestedIdentifiers;
  uint64_t v10;
  NSArray *preselectedIdentifiers;
  uint64_t v12;
  NSArray *disabledIdentifiers;
  uint64_t v14;
  NSString *purpose;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PHPickerCollectionConfiguration;
  v5 = -[_PHPickerCollectionConfiguration init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerCollectionConfigurationCoderIdentifiersKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->__identifiers;
    v5->__identifiers = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerCollectionConfigurationCoderSuggestedIdentifiersKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    suggestedIdentifiers = v5->_suggestedIdentifiers;
    v5->_suggestedIdentifiers = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerCollectionConfigurationCoderPreselectedIdentifiersKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    preselectedIdentifiers = v5->_preselectedIdentifiers;
    v5->_preselectedIdentifiers = (NSArray *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerCollectionConfigurationCoderDisabledIdentifiersKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    disabledIdentifiers = v5->_disabledIdentifiers;
    v5->_disabledIdentifiers = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerCollectionConfigurationCoderPurposeKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    purpose = v5->_purpose;
    v5->_purpose = (NSString *)v14;

    v5->_allowsEditingCollection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerCollectionConfigurationCoderAllowsEditingCollectionKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *identifiers;
  id v5;

  identifiers = self->__identifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifiers, CFSTR("PHPickerCollectionConfigurationCoderIdentifiersKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedIdentifiers, CFSTR("PHPickerCollectionConfigurationCoderSuggestedIdentifiersKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preselectedIdentifiers, CFSTR("PHPickerCollectionConfigurationCoderPreselectedIdentifiersKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disabledIdentifiers, CFSTR("PHPickerCollectionConfigurationCoderDisabledIdentifiersKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purpose, CFSTR("PHPickerCollectionConfigurationCoderPurposeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsEditingCollection, CFSTR("PHPickerCollectionConfigurationCoderAllowsEditingCollectionKey"));

}

- (NSArray)suggestedIdentifiers
{
  return self->_suggestedIdentifiers;
}

- (void)setSuggestedIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)preselectedIdentifiers
{
  return self->_preselectedIdentifiers;
}

- (void)setPreselectedIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)disabledIdentifiers
{
  return self->_disabledIdentifiers;
}

- (void)setDisabledIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)allowsEditingCollection
{
  return self->_allowsEditingCollection;
}

- (void)setAllowsEditingCollection:(BOOL)a3
{
  self->_allowsEditingCollection = a3;
}

- (NSArray)_identifiers
{
  return self->__identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__identifiers, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_disabledIdentifiers, 0);
  objc_storeStrong((id *)&self->_preselectedIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestedIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
