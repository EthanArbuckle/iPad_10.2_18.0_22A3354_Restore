@implementation ATXAppLaunchDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 0;
}

+ (id)biomePublisher:(id)a3 andEndDate:(id)a4 isIncluded:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  void *context;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];

  v26 = a3;
  v8 = a4;
  v9 = a5;
  context = (void *)MEMORY[0x1CAA48B6C]();
  v10 = (void *)objc_opt_class();
  objc_msgSend(v10, "duetHelperStreamTypeToDuetEventStream:", objc_msgSend((id)objc_opt_class(), "supportedCoreDuetStream"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D02608]);
  objc_msgSend(v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDKStreamIdentifier:", v13);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v26, "timeIntervalSinceReferenceDate");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", v16, v18, 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filterWithIsIncluded:", &__block_literal_global_121);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke_2;
  v30[3] = &__block_descriptor_40_e22__16__0__BMStoreEvent_8l;
  v30[4] = a1;
  objc_msgSend(v20, "mapWithTransform:", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke_3;
  v28[3] = &unk_1E82DCE50;
  v23 = v9;
  v29 = v23;
  objc_msgSend(v22, "filterWithIsIncluded:", v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v24;
}

BOOL __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dkEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "supportedDuetEventClass")), "initWithDKEvent:", v3);

  return v4;
}

uint64_t __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
