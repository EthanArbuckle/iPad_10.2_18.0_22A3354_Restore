@implementation HMSoftwareUpdateProgress

- (HMSoftwareUpdateProgress)initWithPercentageComplete:(float)a3 estimatedTimeRemaining:(double)a4
{
  HMSoftwareUpdateProgress *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMSoftwareUpdateProgress;
  result = -[HMSoftwareUpdateProgress init](&v7, sel_init);
  if (result)
  {
    result->_percentageComplete = a3;
    result->_estimatedTimeRemaining = a4;
  }
  return result;
}

- (id)protoPayload
{
  HMSoftwareUpdateEventProtoSoftwareUpdateProgress *v3;

  v3 = objc_alloc_init(HMSoftwareUpdateEventProtoSoftwareUpdateProgress);
  -[HMSoftwareUpdateProgress percentageComplete](self, "percentageComplete");
  -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress setPercentageComplete:](v3, "setPercentageComplete:");
  -[HMSoftwareUpdateProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress setEstimatedTimeRemaining:](v3, "setEstimatedTimeRemaining:");
  return v3;
}

- (HMSoftwareUpdateProgress)initWithProtoPayload:(id)a3
{
  id v4;
  int v5;
  int v6;
  double v7;
  double v8;
  HMSoftwareUpdateProgress *v9;
  HMSoftwareUpdateProgress *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  float v14;
  double v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasPercentageComplete")
    && (objc_msgSend(v4, "hasEstimatedTimeRemaining") & 1) != 0)
  {
    objc_msgSend(v4, "percentageComplete");
    v6 = v5;
    objc_msgSend(v4, "estimatedTimeRemaining");
    v8 = v7;
    LODWORD(v7) = v6;
    v9 = -[HMSoftwareUpdateProgress initWithPercentageComplete:estimatedTimeRemaining:](self, "initWithPercentageComplete:estimatedTimeRemaining:", v7, v8);
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "percentageComplete");
      v15 = v14;
      objc_msgSend(v4, "estimatedTimeRemaining");
      v18 = 138543874;
      v19 = v13;
      v20 = 2048;
      v21 = v15;
      v22 = 2048;
      v23 = v16;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@HMSoftwareUpdateEventProtoSoftwareUpdateProgress proto payload is missing data. percentageComplete: %f, estimatedTimeRemaining: %f", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (float)percentageComplete
{
  return self->_percentageComplete;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

+ (id)progressFromEvent:(id)a3
{
  id v4;
  HMSoftwareUpdateEventProtoSoftwareUpdateProgress *v5;
  void *v6;
  HMSoftwareUpdateEventProtoSoftwareUpdateProgress *v7;
  HMSoftwareUpdateProgress *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HMSoftwareUpdateEventProtoSoftwareUpdateProgress alloc];
  objc_msgSend(v4, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress initWithData:](v5, "initWithData:", v6);

  if (v7)
  {
    v8 = -[HMSoftwareUpdateProgress initWithProtoPayload:]([HMSoftwareUpdateProgress alloc], "initWithProtoPayload:", v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HMSoftwareUpdateEventProtoSoftwareUpdateProgress from event: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

@end
