@implementation CDContextValue

void __47___CDContextValue_supportedContextValueClasses__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v19 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v9 = (void *)getCSSearchableItemClass_softClass;
  v24 = getCSSearchableItemClass_softClass;
  if (!getCSSearchableItemClass_softClass)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __getCSSearchableItemClass_block_invoke;
    v20[3] = &unk_1E26D4D58;
    v20[4] = &v21;
    __getCSSearchableItemClass_block_invoke((uint64_t)v20);
    v9 = (void *)v22[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v19, "setWithObjects:", v18, v17, v16, v15, v14, v13, v0, v1, v2, v3, v4, v5, v6, v7, v8, v10, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)supportedContextValueClasses_supportedContextValueClasses;
  supportedContextValueClasses_supportedContextValueClasses = v11;

}

@end
