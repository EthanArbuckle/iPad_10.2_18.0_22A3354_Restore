@implementation BMStream(ATXExtras)

- (id)atx_DSLPublisher
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SpringBoard"));

  if (v4)
    objc_msgSend(a1, "DSLPublisher");
  else
    objc_msgSend(a1, "DSLPublisherWithUseCase:", CFSTR("ProactiveAppPrediction"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)atx_publisherFromStartTime:()ATXExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v4, "doubleValue");
    v6 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(a1, "atx_publisherFromStartDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "atx_publisherFromStartDate:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)atx_publisherWithStartTime:()ATXExtras endTime:maxEvents:lastN:reversed:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v12, "doubleValue");
    v17 = (void *)objc_msgSend(v16, "initWithTimeIntervalSinceReferenceDate:");
    if (v13)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(a1, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v17, 0, v14, v15, a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_5;
    goto LABEL_4;
  }
  v17 = 0;
  if (!v13)
    goto LABEL_7;
LABEL_3:
  v18 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v13, "doubleValue");
  v19 = (void *)objc_msgSend(v18, "initWithTimeIntervalSinceReferenceDate:");
  objc_msgSend(a1, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v17, v19, v14, v15, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
LABEL_4:

LABEL_5:
  return v20;
}

- (uint64_t)atx_publisherFromStartDate:()ATXExtras
{
  return objc_msgSend(a1, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", a3, 0, 0, 0, 0);
}

- (id)atx_publisherWithStartDate:()ATXExtras endDate:maxEvents:lastN:reversed:
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v12 = (void *)MEMORY[0x1E0CB3898];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "processName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("SpringBoard"));

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0D026F0]);
    v21 = objc_msgSend(v14, "integerValue");

    v22 = objc_msgSend(v13, "integerValue");
    v23 = (void *)objc_msgSend(v20, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v16, v15, v21, v22, a7);

    objc_msgSend(a1, "publisherWithOptions:", v23);
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x1E0D026F0]);
    v25 = objc_msgSend(v14, "integerValue");

    v26 = objc_msgSend(v13, "integerValue");
    v23 = (void *)objc_msgSend(v24, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v16, v15, v25, v26, a7);

    objc_msgSend(a1, "publisherWithUseCase:options:", CFSTR("ProactiveAppPrediction"), v23);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

@end
