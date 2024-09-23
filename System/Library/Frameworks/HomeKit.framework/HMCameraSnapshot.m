@implementation HMCameraSnapshot

- (HMCameraSnapshot)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraSnapshot;
  return -[HMCameraSource init](&v3, sel_init);
}

- (HMCameraSnapshot)initWithProfileUniqueIdentifier:(id)a3 slotIdentifier:(id)a4 aspectRatio:(id)a5 captureDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMCameraSnapshot *v15;
  uint64_t v16;
  NSDate *captureDate;
  HMCameraSnapshot *result;
  HMCameraSnapshot *v19;
  SEL v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v19 = (HMCameraSnapshot *)_HMFPreconditionFailure();
    -[HMCameraSnapshot dealloc](v19, v20);
    return result;
  }
  v21.receiver = self;
  v21.super_class = (Class)HMCameraSnapshot;
  v15 = -[HMCameraSource initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:](&v21, sel_initWithProfileUniqueIdentifier_slotIdentifier_aspectRatio_, v10, v11, v12);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    captureDate = v15->_captureDate;
    v15->_captureDate = (NSDate *)v16;

  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_didFillSlot)
    -[HMCameraSnapshot _releaseSlotIdentifier](self, "_releaseSlotIdentifier");
  v3.receiver = self;
  v3.super_class = (Class)HMCameraSnapshot;
  -[HMCameraSnapshot dealloc](&v3, sel_dealloc);
}

- (void)fillSlotWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMCameraSnapshot *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraSource slotIdentifier](v6, "slotIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Filling snapshot slot identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMCameraSnapshot setDidFillSlot:](v6, "setDidFillSlot:", 1);
  -[HMCameraSource context](v6, "context");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    _HMFPreconditionFailure();
  v11 = (void *)v10;
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraSource profileUniqueIdentifier](v6, "profileUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  v24 = CFSTR("kSlotIdentifierKey");
  -[HMCameraSource slotIdentifier](v6, "slotIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMCameraSnapshotFillSnapshotSlotMessage"), v14, v16);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __50__HMCameraSnapshot_fillSlotWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E3AB60C8;
  v21[4] = v6;
  v22 = v11;
  v23 = v4;
  v18 = v4;
  v19 = v11;
  objc_msgSend(v17, "setResponseHandler:", v21);
  objc_msgSend(v19, "messageDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendMessage:", v17);

}

- (void)_releaseSlotIdentifier
{
  void *v3;
  HMCameraSnapshot *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraSource slotIdentifier](v4, "slotIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot slot identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMCameraSource context](v4, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    _HMFPreconditionFailure();
  v9 = (void *)v8;
  v10 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraSource profileUniqueIdentifier](v4, "profileUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);

  -[HMCameraSource slotIdentifier](v4, "slotIdentifier", CFSTR("kSlotIdentifierKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMCameraSnapshotReleaseSnapshotMessage"), v12, v14);
  objc_msgSend(v9, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMessage:", v15);

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraSource slotIdentifier](self, "slotIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Slot Identifier"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HMCameraSource aspectRatio](self, "aspectRatio", v5);
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Aspect Ratio"), v8);
  v15[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraSnapshot captureDate](self, "captureDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Capture Date"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v13;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (BOOL)didFillSlot
{
  return self->_didFillSlot;
}

- (void)setDidFillSlot:(BOOL)a3
{
  self->_didFillSlot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDate, 0);
}

void __50__HMCameraSnapshot_fillSlotWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v5;
      v12 = "%{public}@Failed to fill slot: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v11;
    v12 = "%{public}@Successfully filled slot";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_5641 != -1)
    dispatch_once(&logCategory__hmf_once_t4_5641, &__block_literal_global_5642);
  return (id)logCategory__hmf_once_v5_5643;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __31__HMCameraSnapshot_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_5643;
  logCategory__hmf_once_v5_5643 = v0;

}

@end
