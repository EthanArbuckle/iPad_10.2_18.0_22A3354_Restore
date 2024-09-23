@implementation HKMedicalIDTelephoneUtilities

+ (void)callEmergencyContact:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v4 = (void *)getTUCallProviderManagerClass_softClass;
  v24 = getTUCallProviderManagerClass_softClass;
  if (!getTUCallProviderManagerClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getTUCallProviderManagerClass_block_invoke;
    v19 = &unk_1E9C3FDF8;
    v20 = &v21;
    __getTUCallProviderManagerClass_block_invoke((uint64_t)&v16);
    v4 = (void *)v22[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v21, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v8 = (void *)getTUDialRequestClass_softClass;
  v24 = getTUDialRequestClass_softClass;
  if (!getTUDialRequestClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getTUDialRequestClass_block_invoke;
    v19 = &unk_1E9C3FDF8;
    v20 = &v21;
    __getTUDialRequestClass_block_invoke((uint64_t)&v16);
    v8 = (void *)v22[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v21, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithProvider:", v7);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v11 = (void *)getTUHandleClass_softClass;
  v24 = getTUHandleClass_softClass;
  if (!getTUHandleClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getTUHandleClass_block_invoke;
    v19 = &unk_1E9C3FDF8;
    v20 = &v21;
    __getTUHandleClass_block_invoke((uint64_t)&v16);
    v11 = (void *)v22[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v21, 8);
  v13 = (void *)objc_msgSend([v12 alloc], "initWithType:value:", 2, v3);
  objc_msgSend(v10, "setHandle:", v13);
  objc_msgSend(v10, "setShowUIPrompt:", 0);
  if (objc_msgSend(v10, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "openURL:configuration:completionHandler:", v15, 0, 0);

  }
}

@end
