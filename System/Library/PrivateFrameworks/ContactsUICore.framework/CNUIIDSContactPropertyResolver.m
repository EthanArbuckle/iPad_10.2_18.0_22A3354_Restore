@implementation CNUIIDSContactPropertyResolver

id __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C97280];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested") ^ 1;
}

CNUIContactPropertyIDSHandle *__113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  CNUIContactPropertyIDSHandle *v3;

  v2 = a2;
  v3 = -[CNUIContactPropertyIDSHandle initWithContactProperty:]([CNUIContactPropertyIDSHandle alloc], "initWithContactProperty:", v2);

  return v3;
}

void __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "IDSRelevantPropertiesForContact:", a1[5]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_map:", &__block_literal_global_24_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[8] + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filter:", &__block_literal_global_25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "map:", &__block_literal_global_26_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "throttle:schedulerProvider:", a1[6], 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribe:", a1[7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCancelable:", v9);

}

id __94__CNUIIDSContactPropertyResolver_resolveAllFaceTimeIDSPropertiesForContact_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "idsAvailabilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateHandlesForFaceTime:schedulerProvider:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider
{
  return self->_idsAvailabilityProvider;
}

+ (id)IDSRelevantPropertiesForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "descriptorForCopyingStrippedContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copyWithPropertyKeys:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke;
  v19[3] = &unk_1EA6047E0;
  v20 = v7;
  v9 = v7;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1DF0D6388](v19);
  v11 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v9, "emailAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v13);

  v14 = *MEMORY[0x1E0C967C0];
  objc_msgSend(v9, "phoneNumbers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v16);

  v17 = (void *)objc_msgSend(v8, "copy");
  return v17;
}

id __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  objc_msgSend(a3, "_cn_filter:", &__block_literal_global_39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke_3;
  v10[3] = &unk_1EA6047B8;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "_cn_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)descriptorForCopyingStrippedContact:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "keyVector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0C96890];
  v16[0] = *MEMORY[0x1E0C96708];
  v16[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtractKeys:", v6);

  v7 = *MEMORY[0x1E0C96880];
  v15[0] = *MEMORY[0x1E0C966C8];
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtractKeys:", v8);

  v9 = (void *)MEMORY[0x1E0C97200];
  v14 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNUIIDSContactPropertyResolver descriptorForCopyingStrippedContact:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptorWithKeyDescriptors:description:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)resolveAllFaceTimeIDSPropertiesForContact:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__CNUIIDSContactPropertyResolver_resolveAllFaceTimeIDSPropertiesForContact_schedulerProvider___block_invoke;
  v10[3] = &unk_1EA6048B8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[CNUIIDSContactPropertyResolver resolveIDSPropertiesForContact:schedulerProvider:usingAvailabilityProviderCall:](self, "resolveIDSPropertiesForContact:schedulerProvider:usingAvailabilityProviderCall:", a3, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)resolveIDSPropertiesForContact:(id)a3 schedulerProvider:(id)a4 usingAvailabilityProviderCall:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  CNUIIDSContactPropertyResolver *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D13AE8];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke;
  v17[3] = &unk_1EA604890;
  v18 = v9;
  v19 = self;
  v20 = v8;
  v21 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v11, "observableWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_2;
  v9[3] = &unk_1EA604868;
  v5 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v13 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v6 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CNUIIDSContactPropertyResolver)initWithIDSAvailabilityProvider:(id)a3
{
  id v5;
  CNUIIDSContactPropertyResolver *v6;
  CNUIIDSContactPropertyResolver *v7;
  CNUIIDSContactPropertyResolver *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIIDSContactPropertyResolver;
  v6 = -[CNUIIDSContactPropertyResolver init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsAvailabilityProvider, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  v3 = *MEMORY[0x1E0C967C0];
  v8[0] = *MEMORY[0x1E0C966A8];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNUIIDSContactPropertyResolver descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resolveBestIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4 usingAvailabilityProviderCall:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  CNUIIDSContactPropertyResolver *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D13AE8];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke;
  v17[3] = &unk_1EA604890;
  v18 = v9;
  v19 = self;
  v20 = v8;
  v21 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v11, "observableWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_2;
  v9[3] = &unk_1EA604868;
  v5 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v13 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v6 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_2(_QWORD *a1, void *a2)
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

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "IDSRelevantPropertiesForContact:", a1[5]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_map:", &__block_literal_global_12_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[8] + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filter:", &__block_literal_global_15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "map:", &__block_literal_global_17_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scan:", &__block_literal_global_19_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "throttle:schedulerProvider:", a1[6], 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribe:", a1[7]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCancelable:", v10);

}

CNUIContactPropertyIDSHandle *__115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  CNUIContactPropertyIDSHandle *v3;

  v2 = a2;
  v3 = -[CNUIContactPropertyIDSHandle initWithContactProperty:]([CNUIContactPropertyIDSHandle alloc], "initWithContactProperty:", v2);

  return v3;
}

uint64_t __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAvailable");
}

id __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = a2;
  +[CNUIContactPropertyRanker bestPropertyComparator](CNUIContactPropertyRanker, "bestPropertyComparator");
  v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = ((uint64_t (**)(_QWORD, id, id))v6)[2](v6, v5, v4);

  if (v7 == -1)
    v8 = v5;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

- (id)resolveBestFaceTimeIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__CNUIIDSContactPropertyResolver_resolveBestFaceTimeIDSPropertyForContact_schedulerProvider___block_invoke;
  v10[3] = &unk_1EA6048B8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[CNUIIDSContactPropertyResolver resolveBestIDSPropertyForContact:schedulerProvider:usingAvailabilityProviderCall:](self, "resolveBestIDSPropertyForContact:schedulerProvider:usingAvailabilityProviderCall:", a3, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __93__CNUIIDSContactPropertyResolver_resolveBestFaceTimeIDSPropertyForContact_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "idsAvailabilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateHandlesForFaceTime:schedulerProvider:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resolveBestIMessageIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__CNUIIDSContactPropertyResolver_resolveBestIMessageIDSPropertyForContact_schedulerProvider___block_invoke;
  v10[3] = &unk_1EA6048B8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[CNUIIDSContactPropertyResolver resolveBestIDSPropertyForContact:schedulerProvider:usingAvailabilityProviderCall:](self, "resolveBestIDSPropertyForContact:schedulerProvider:usingAvailabilityProviderCall:", a3, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __93__CNUIIDSContactPropertyResolver_resolveBestIMessageIDSPropertyForContact_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "idsAvailabilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateHandlesForIMessage:schedulerProvider:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resolveBestExpanseIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__CNUIIDSContactPropertyResolver_resolveBestExpanseIDSPropertyForContact_schedulerProvider___block_invoke;
  v10[3] = &unk_1EA6048B8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[CNUIIDSContactPropertyResolver resolveBestIDSPropertyForContact:schedulerProvider:usingAvailabilityProviderCall:](self, "resolveBestIDSPropertyForContact:schedulerProvider:usingAvailabilityProviderCall:", a3, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __92__CNUIIDSContactPropertyResolver_resolveBestExpanseIDSPropertyForContact_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "idsAvailabilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateHandlesForExpanse:schedulerProvider:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAvailable");
}

id __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsAvailabilityProvider, 0);
}

@end
