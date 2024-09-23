@implementation VSSubscriptionValueType

void __VSSubscriptionValueType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSSubscriptionValueType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSSubscriptionValueType___vs_lazy_init_variable;
  VSSubscriptionValueType___vs_lazy_init_variable = v0;

}

VSValueType *__VSSubscriptionValueType_block_invoke_2()
{
  VSValueType *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v0 = objc_alloc_init(VSValueType);
  -[VSValueType setImplementationClass:](v0, "setImplementationClass:", objc_opt_class());
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("subscriberIdentifierHash"), 2, v2, &stru_1E93A8CC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("billingIdentifier"), 2, v4, &stru_1E93A8CC0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("expirationDate"), 2, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v7);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("accessLevel"), 1, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("tierIdentifiers"), 2, v11, MEMORY[0x1E0C9AA60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("creationDate"), 2, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("modificationDate"), 2, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v16);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("derivedSubscriptionInfo"), 2, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("providedSubscriptionInfo"), 2, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("source"), 2, v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v22);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("modifierIdentifier"), 2, v23, &stru_1E93A8CC0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v24);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("modifierType"), 2, v25, &stru_1E93A8CC0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v26);

  -[VSValueType setProperties:](v0, "setProperties:", v1);
  return v0;
}

@end
