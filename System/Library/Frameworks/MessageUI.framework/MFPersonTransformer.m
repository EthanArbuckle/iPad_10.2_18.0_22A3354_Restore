@implementation MFPersonTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v3, "ea_uncommentedAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForContactsMatchingEmailAddress:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v8, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  v12 = objc_alloc(MEMORY[0x1E0CBDA60]);
  objc_msgSend(v3, "ea_uncommentedAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithValue:type:", v13, 1);

  if (v11 || !objc_msgSend(v10, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v14, 0, 0, 0, 0, 0);
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0CBDA58]);
    objc_msgSend(v10, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithContact:", v17);

    objc_msgSend(v18, "setPersonHandle:", v14);
    v15 = v18;
  }
  objc_msgSend(v3, "ea_personNameComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v15, "setNameComponents:", v19);
  objc_msgSend(MEMORY[0x1E0D1E450], "displayNameFromAddress:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v15, "setDisplayName:", v20);

  return v15;
}

- (id)reverseTransformedValue:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "personHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
