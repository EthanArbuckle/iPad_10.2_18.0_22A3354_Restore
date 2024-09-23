@implementation VSIdentityProviderValueType

void __VSIdentityProviderValueType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSIdentityProviderValueType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSIdentityProviderValueType___vs_lazy_init_variable;
  VSIdentityProviderValueType___vs_lazy_init_variable = v0;

}

VSValueType *__VSIdentityProviderValueType_block_invoke_2()
{
  id v0;
  void *v1;
  VSOptional *v2;
  void *v3;
  void *v4;
  VSOptional *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  VSOptional *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  VSValueType *v62;

  v62 = objc_alloc_init(VSValueType);
  -[VSValueType setImplementationClass:](v62, "setImplementationClass:", objc_opt_class());
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(VSOptional);
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("uniqueID"), 2, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(VSOptional);
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("providerID"), 2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("nameForSorting"), 2, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("rankForSorting"), 2, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("supportedTemplates"), 2, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("supportedAuthenticationSchemes"), 2, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v18);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("requireAuthenticationURLSystemTrust"), 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v19);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("requireXHRRequestSystemTrust"), 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v20);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("prohibitedByStore"), 0, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v21);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("developer"), 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v22);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("authenticationURL"), 2, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v24);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("appStoreRoomURL"), 2, v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v26);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C9AA60];
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("appAdamIDs"), 2, v29, MEMORY[0x1E0C9AA60]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v31);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("defaultAppId"), 2, v32, &stru_1E93A8CC0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v33);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("isSetTopBoxSupported"), 0, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v34);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("shouldShowChannelApps"), 0, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v35);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("shouldShowSubscriptionApps"), 0, 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v36);

  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("allPersonalizedAppDescriptions"), 2, v39, v30);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v40);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("isSTBOptOutAllowed"), 0, 0, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("userToken"), 2, v42, &stru_1E93A8CC0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v43);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("appPlacementPosition"), 2, v44, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v45);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("providerAppArtworkTemplateURL"), 2, v46, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v47);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("providerArtworkTemplateURL"), 2, v48, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v49);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_alloc_init(VSOptional);
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("providerInfo"), 2, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v52);

  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("nonChannelAppDescriptions"), 2, v55, v30);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v56);

  v57 = (void *)MEMORY[0x1E0C99E60];
  v58 = objc_opt_class();
  objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("storefronts"), 2, v59, v30);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v60);

  -[VSValueType setProperties:](v62, "setProperties:", v0);
  return v62;
}

@end
