@implementation INWidgetExtensionProvider

- (INWidgetExtensionProvider)init
{
  INWidgetExtensionProvider *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  CHSWidgetExtensionProvider *provider;
  INWidgetExtensionProvider *v16;
  objc_super v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v18.receiver = self;
  v18.super_class = (Class)INWidgetExtensionProvider;
  v2 = -[INWidgetExtensionProvider init](&v18, sel_init);
  if (v2)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v3 = (void *)getCHSWidgetDescriptorsPredicateClass_softClass;
    v27 = getCHSWidgetDescriptorsPredicateClass_softClass;
    if (!getCHSWidgetDescriptorsPredicateClass_softClass)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getCHSWidgetDescriptorsPredicateClass_block_invoke;
      v22 = &unk_1E22953C0;
      v23 = &v24;
      __getCHSWidgetDescriptorsPredicateClass_block_invoke((uint64_t)&v19);
      v3 = (void *)v25[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v4, "visible");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v6 = (void *)getCHSControlDescriptorsPredicateClass_softClass;
    v27 = getCHSControlDescriptorsPredicateClass_softClass;
    if (!getCHSControlDescriptorsPredicateClass_softClass)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getCHSControlDescriptorsPredicateClass_block_invoke;
      v22 = &unk_1E22953C0;
      v23 = &v24;
      __getCHSControlDescriptorsPredicateClass_block_invoke((uint64_t)&v19);
      v6 = (void *)v25[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v7, "visible");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v9 = (void *)getCHSWidgetExtensionProviderOptionsClass_softClass;
    v27 = getCHSWidgetExtensionProviderOptionsClass_softClass;
    if (!getCHSWidgetExtensionProviderOptionsClass_softClass)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getCHSWidgetExtensionProviderOptionsClass_block_invoke;
      v22 = &unk_1E22953C0;
      v23 = &v24;
      __getCHSWidgetExtensionProviderOptionsClass_block_invoke((uint64_t)&v19);
      v9 = (void *)v25[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v24, 8);
    v11 = (void *)objc_msgSend([v10 alloc], "initWithWidgetsPredicate:controlsPredicate:includeIntents:", v5, v8, 0);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v12 = (void *)getCHSWidgetExtensionProviderClass_softClass;
    v27 = getCHSWidgetExtensionProviderClass_softClass;
    if (!getCHSWidgetExtensionProviderClass_softClass)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getCHSWidgetExtensionProviderClass_block_invoke;
      v22 = &unk_1E22953C0;
      v23 = &v24;
      __getCHSWidgetExtensionProviderClass_block_invoke((uint64_t)&v19);
      v12 = (void *)v25[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v24, 8);
    v14 = objc_msgSend([v13 alloc], "initWithOptions:", v11);
    provider = v2->_provider;
    v2->_provider = (CHSWidgetExtensionProvider *)v14;

    v16 = v2;
  }

  return v2;
}

- (id)descriptorForIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  -[INWidgetExtensionProvider provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_flatMap:", &__block_literal_global_2_102374);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_3;
  v17[3] = &unk_1E2292FC0;
  v10 = v4;
  v18 = v10;
  objc_msgSend(v8, "if_firstObjectPassingTest:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
  }
  else
  {
    objc_msgSend(v7, "if_flatMap:", &__block_literal_global_8_102375);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_6;
    v15[3] = &unk_1E2293048;
    v16 = v10;
    objc_msgSend(v13, "if_firstObjectPassingTest:", v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (CHSWidgetExtensionProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

uint64_t __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsIntent:", *(_QWORD *)(a1 + 32));
}

uint64_t __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsIntent:", *(_QWORD *)(a1 + 32));
}

id __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "orderedControlDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_10_102378);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

INControlDescriptor *__49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  INControlDescriptor *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INControlDescriptor *v12;

  v2 = a2;
  objc_msgSend(v2, "intentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "intentType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [INControlDescriptor alloc];
    objc_msgSend(v2, "extensionIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "actionIntentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[INControlDescriptor initWithExtensionBundleIdentifier:kind:intentClassName:actionIntentType:](v7, "initWithExtensionBundleIdentifier:kind:intentClassName:actionIntentType:", v9, v10, v6, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __49__INWidgetExtensionProvider_descriptorForIntent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "orderedDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_4_102384);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

INWidgetDescriptor *__49__INWidgetExtensionProvider_descriptorForIntent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  INWidgetDescriptor *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  INWidgetDescriptor *v8;
  void *v9;
  void *v10;

  v2 = a2;
  objc_msgSend(v2, "intentType");
  v3 = (INWidgetDescriptor *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_msgSend(v2, "supportedFamilies") & 8) != 0)
    {
      v4 = 3;
    }
    else if ((objc_msgSend(v2, "supportedFamilies") & 4) != 0)
    {
      v4 = 2;
    }
    else if ((objc_msgSend(v2, "supportedFamilies") & 2) != 0)
    {
      v4 = 1;
    }
    else
    {
      v4 = ((unint64_t)objc_msgSend(v2, "supportedFamilies") >> 2) & 4;
    }
    objc_msgSend(v2, "intentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [INWidgetDescriptor alloc];
    objc_msgSend(v2, "extensionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[INWidgetDescriptor initWithExtensionBundleIdentifier:kind:intentClassName:preferredSizeClass:](v8, "initWithExtensionBundleIdentifier:kind:intentClassName:preferredSizeClass:", v9, v10, v7, v4);

  }
  return v3;
}

+ (INWidgetExtensionProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_102399);
  return (INWidgetExtensionProvider *)(id)sharedProvider_sharedProvider;
}

void __43__INWidgetExtensionProvider_sharedProvider__block_invoke()
{
  INWidgetExtensionProvider *v0;
  void *v1;

  v0 = objc_alloc_init(INWidgetExtensionProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

}

@end
