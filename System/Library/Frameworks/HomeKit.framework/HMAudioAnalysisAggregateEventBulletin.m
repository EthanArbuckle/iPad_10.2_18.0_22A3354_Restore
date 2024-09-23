@implementation HMAudioAnalysisAggregateEventBulletin

- (HMAudioAnalysisAggregateEventBulletin)initWithBulletins:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5
{
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  HMAudioAnalysisAggregateEventBulletin *v13;
  HMAudioAnalysisAggregateEventBulletin *v14;
  objc_super v16;
  objc_super v17;

  v9 = a3;
  v10 = (objc_class *)MEMORY[0x1E0D32D38];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithSource:cachePolicy:combineType:timestamp:", v11, 2, 2, a5);

  v17.receiver = self;
  v17.super_class = (Class)HMAudioAnalysisAggregateEventBulletin;
  v16.receiver = -[HMEEvent initWithSubclassedEventMetadata:](&v17, sel_initWithSubclassedEventMetadata_, v12);
  v16.super_class = (Class)HMAudioAnalysisAggregateEventBulletin;
  v13 = -[HMEEvent initWithSubclassedEventMetadata:](&v16, sel_initWithSubclassedEventMetadata_, v12);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_bulletins, a3);

  return v14;
}

- (BOOL)checkIfBulletinExists:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMAudioAnalysisAggregateEventBulletin bulletins](self, "bulletins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HMAudioAnalysisAggregateEventBulletin_checkIfBulletinExists___block_invoke;
  v9[3] = &unk_1E3AB4260;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (id)bulletinsByAddingOrReplacingBulletin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMAudioAnalysisAggregateEventBulletin bulletins](self, "bulletins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__HMAudioAnalysisAggregateEventBulletin_bulletinsByAddingOrReplacingBulletin___block_invoke;
  v10[3] = &unk_1E3AB4260;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "arrayByAddingObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)encodedData
{
  HMAudioAnalysisEventBulletinEventProtoValueEvent *v3;
  void *v4;
  HMAudioAnalysisEventBulletinEventProtoValueEvent *v5;
  void *v6;
  _QWORD v8[4];
  HMAudioAnalysisEventBulletinEventProtoValueEvent *v9;

  v3 = objc_alloc_init(HMAudioAnalysisEventBulletinEventProtoValueEvent);
  -[HMAudioAnalysisAggregateEventBulletin bulletins](self, "bulletins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HMAudioAnalysisAggregateEventBulletin_encodedData__block_invoke;
  v8[3] = &unk_1E3AB4288;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  -[HMAudioAnalysisEventBulletinEventProtoValueEvent data](v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)attributeDescriptions
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAudioAnalysisAggregateEventBulletin bulletins](self, "bulletins");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Bulletins:"), v6);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)bulletins
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletins, 0);
}

void __52__HMAudioAnalysisAggregateEventBulletin_encodedData__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "proto");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEvents:", v3);

}

BOOL __78__HMAudioAnalysisAggregateEventBulletin_bulletinsByAddingOrReplacingBulletin___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "reason");
  return v3 != objc_msgSend(*(id *)(a1 + 32), "reason");
}

uint64_t __63__HMAudioAnalysisAggregateEventBulletin_checkIfBulletinExists___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

+ (id)decodeBulletinsFromEvent:(id)a3 error:(id *)a4
{
  id v5;
  HMAudioAnalysisEventBulletinEventProtoValueEvent *v6;
  void *v7;
  HMAudioAnalysisEventBulletinEventProtoValueEvent *v8;
  void *v9;
  void *v10;
  HMAudioAnalysisAggregateEventBulletin *v11;
  void *v12;
  void *v13;
  void *v14;
  HMAudioAnalysisAggregateEventBulletin *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [HMAudioAnalysisEventBulletinEventProtoValueEvent alloc];
  objc_msgSend(v5, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMAudioAnalysisEventBulletinEventProtoValueEvent initWithData:](v6, "initWithData:", v7);

  if (v8)
  {
    -[HMAudioAnalysisEventBulletinEventProtoValueEvent events](v8, "events");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_43899);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = [HMAudioAnalysisAggregateEventBulletin alloc];
    objc_msgSend(v5, "eventMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "intervalSinceReferenceDate");
    v15 = -[HMAudioAnalysisAggregateEventBulletin initWithBulletins:eventSource:eventTimestamp:](v11, "initWithBulletins:eventSource:eventTimestamp:", v10, v13);

    if (a4 && !v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode proto audio analysis aggregate event from: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 19);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

+ (id)topicWithAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("localXPC.home.%@.accessory.%@.audio.analysis.aggregate.event.updated"), a4, a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_43889 != -1)
    dispatch_once(&logCategory__hmf_once_t1_43889, &__block_literal_global_11_43890);
  return (id)logCategory__hmf_once_v2_43891;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __52__HMAudioAnalysisAggregateEventBulletin_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_43891;
  logCategory__hmf_once_v2_43891 = v0;

}

HMAudioAnalysisEventBulletin *__72__HMAudioAnalysisAggregateEventBulletin_decodeBulletinsFromEvent_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMAudioAnalysisEventBulletin initWithProto:](HMAudioAnalysisEventBulletin, "initWithProto:", a2);
}

@end
