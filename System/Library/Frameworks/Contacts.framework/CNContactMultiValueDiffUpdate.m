@implementation CNContactMultiValueDiffUpdate

- (BOOL)applyToABPerson:(void *)a3 withPropertiesContext:(id)a4 logger:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v10 = a5;
  v11 = a4;
  -[CNContactMultiValueDiffUpdate diff](self, "diff");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactMultiValueDiffUpdate property](self, "property");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isUnifiedContact");

  LOBYTE(a6) = objc_msgSend(v12, "applyToABPerson:propertyDescription:isUnified:logger:error:", a3, v13, v14, v10, a6);
  return (char)a6;
}

- (CNContactMultiValueDiffUpdate)initWithProperty:(id)a3 diff:(id)a4
{
  id v7;
  id v8;
  CNContactMultiValueDiffUpdate *v9;
  CNContactMultiValueDiffUpdate *v10;
  CNContactMultiValueDiffUpdate *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactMultiValueDiffUpdate;
  v9 = -[CNContactMultiValueDiffUpdate init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a3);
    objc_storeStrong((id *)&v10->_diff, a4);
    v11 = v10;
  }

  return v10;
}

- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4
{
  CNMultiValuePropertyDescription *property;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  property = self->_property;
  v7 = a4;
  v8 = a3;
  -[CNPropertyDescription key](property, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CNMultiValueDiff multiValueByApplyToMultiValue:withIdentifierMap:](self->_diff, "multiValueByApplyToMultiValue:withIdentifierMap:", v12, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyDescription key](self->_property, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v10, v11);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D13A08], "descriptionForObject:withNamesAndObjects:", self->_property, CFSTR("diff"), self->_diff, 0);
}

- (CNMultiValuePropertyDescription)property
{
  return (CNMultiValuePropertyDescription *)objc_getProperty(self, a2, 8, 1);
}

- (CNMultiValueDiff)diff
{
  return (CNMultiValueDiff *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diff, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
