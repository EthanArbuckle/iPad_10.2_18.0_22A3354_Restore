@implementation CNUIFamilyMemberContactsEditingStrategy

- (CNUIFamilyMemberContactsEditingStrategy)initWithProhibitedPropertyKeys:(id)a3 sensitiveDataContactFilter:(id)a4
{
  id v7;
  id v8;
  CNUIFamilyMemberContactsEditingStrategy *v9;
  CNUIFamilyMemberContactsEditingStrategy *v10;
  void *v11;
  id sensitiveDataContactFilter;
  CNUIFamilyMemberContactsEditingStrategy *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUIFamilyMemberContactsEditingStrategy;
  v9 = -[CNUIFamilyMemberContactsEditingStrategy init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prohibitedPropertyKeys, a3);
    v11 = _Block_copy(v8);
    sensitiveDataContactFilter = v10->_sensitiveDataContactFilter;
    v10->_sensitiveDataContactFilter = v11;

    v13 = v10;
  }

  return v10;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (id)sensitiveDataContactFilter
{
  return self->_sensitiveDataContactFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sensitiveDataContactFilter, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
}

+ (CNUIFamilyMemberContactsEditingStrategy)managedContactsStrategy
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D13CC8], "propertyKeysContainingSenstiveData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithProhibitedPropertyKeys:sensitiveDataContactFilter:", v3, &__block_literal_global_212);

  return (CNUIFamilyMemberContactsEditingStrategy *)v4;
}

+ (CNUIFamilyMemberContactsEditingStrategy)whitelistedContactsStrategy
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0D13CD0], "propertyKeysContainingSenstiveData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithProhibitedPropertyKeys:sensitiveDataContactFilter:", v3, &__block_literal_global_20);

  return (CNUIFamilyMemberContactsEditingStrategy *)v4;
}

@end
