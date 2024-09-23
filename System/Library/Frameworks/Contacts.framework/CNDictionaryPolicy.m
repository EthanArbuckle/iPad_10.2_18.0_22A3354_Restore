@implementation CNDictionaryPolicy

- (CNDictionaryPolicy)initWithDictionary:(id)a3
{
  id v4;
  CNDictionaryPolicy *v5;
  uint64_t v6;
  NSDictionary *policyDictionary;
  CNDictionaryPolicy *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNDictionaryPolicy;
  v5 = -[CNDictionaryPolicy init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    policyDictionary = v5->_policyDictionary;
    v5->_policyDictionary = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)contactRestrictionsForLabeledProperty:(id)a3
{
  NSDictionary *policyDictionary;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  policyDictionary = self->_policyDictionary;
  v4 = a3;
  -[NSDictionary objectForKey:](policyDictionary, "objectForKey:", CFSTR("CNContact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("LabeledValueRestrictions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)unsupportedAttributesForLabeledContactProperty:(id)a3
{
  void *v3;
  void *v4;

  -[CNDictionaryPolicy contactRestrictionsForLabeledProperty:](self, "contactRestrictionsForLabeledProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UnsupportedValueKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  objc_super v11;

  v4 = a3;
  -[CNDictionaryPolicy contactRestrictionsForLabeledProperty:](self, "contactRestrictionsForLabeledProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MaximumNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (id)objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    if (!-[CNDictionaryPolicy isContactPropertySupported:](self, "isContactPropertySupported:", v4))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v11.receiver = self;
    v11.super_class = (Class)CNDictionaryPolicy;
    v8 = -[CNPermissivePolicy maximumCountOfValuesForContactProperty:](&v11, sel_maximumCountOfValuesForContactProperty_, v4);
  }
  v9 = (unint64_t)v8;
LABEL_7:

  return v9;
}

- (id)supportedLabelsForContactProperty:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  -[CNDictionaryPolicy contactRestrictionsForLabeledProperty:](self, "contactRestrictionsForLabeledProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SupportedLabels"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  objc_super v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  -[CNDictionaryPolicy contactRestrictionsForLabeledProperty:](self, "contactRestrictionsForLabeledProperty:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("SupportedLabels"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (id)objc_msgSend(v10, "unsignedIntegerValue");
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)CNDictionaryPolicy;
      v12 = -[CNPermissivePolicy maximumCountOfValuesForContactProperty:label:](&v16, sel_maximumCountOfValuesForContactProperty_label_, v6, v7);
    }
    v13 = v12;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CNDictionaryPolicy;
    v13 = -[CNPermissivePolicy maximumCountOfValuesForContactProperty:label:](&v15, sel_maximumCountOfValuesForContactProperty_label_, v6, v7);
  }

  return (unint64_t)v13;
}

- (BOOL)isContactPropertySupported:(id)a3
{
  NSDictionary *policyDictionary;
  id v4;
  void *v5;
  void *v6;
  char v7;

  policyDictionary = self->_policyDictionary;
  v4 = a3;
  -[NSDictionary objectForKey:](policyDictionary, "objectForKey:", CFSTR("CNContact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UnsupportedAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7 ^ 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNDictionaryPolicy)initWithCoder:(id)a3
{
  id v4;
  CNDictionaryPolicy *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *policyDictionary;
  CNDictionaryPolicy *v14;

  v4 = a3;
  v5 = -[CNDictionaryPolicy initWithDictionary:](self, "initWithDictionary:", 0);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_policyDictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    policyDictionary = v5->_policyDictionary;
    v5->_policyDictionary = (NSDictionary *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_policyDictionary, CFSTR("_policyDictionary"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyDictionary, 0);
}

@end
