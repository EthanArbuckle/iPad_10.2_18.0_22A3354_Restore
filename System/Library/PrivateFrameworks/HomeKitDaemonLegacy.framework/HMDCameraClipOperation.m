@implementation HMDCameraClipOperation

- (HMDCameraClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4
{
  id v6;
  id v7;
  HMDCameraClipOperationDataSource *v8;
  HMDCameraClipOperation *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDCameraClipOperationDataSource);
  v9 = -[HMDCameraClipOperation initWithClipModelID:localZone:dataSource:](self, "initWithClipModelID:localZone:dataSource:", v7, v6, v8);

  return v9;
}

- (HMDCameraClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDCameraClipOperation *v13;
  HMDCameraClipOperation *v14;
  uint64_t v15;
  NSDate *creationDate;
  HMDCameraRecordingUploadOperationEvent *v17;
  HMDCameraRecordingUploadOperationEvent *uploadOperationEvent;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *logIdentifier;
  HMDCameraClipOperation *result;
  HMDCameraClipOperation *v29;
  SEL v30;
  void *v31;
  void *v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v29 = (HMDCameraClipOperation *)_HMFPreconditionFailure();
    -[HMDCameraClipOperation queuedDuration](v29, v30);
    return result;
  }
  objc_msgSend(v11, "operationTimeout");
  v33.receiver = self;
  v33.super_class = (Class)HMDCameraClipOperation;
  v13 = -[HMFOperation initWithTimeout:](&v33, sel_initWithTimeout_);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clipModelID, a3);
    objc_storeStrong((id *)&v14->_localZone, a4);
    objc_storeStrong((id *)&v14->_dataSource, a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    creationDate = v14->_creationDate;
    v14->_creationDate = (NSDate *)v15;

    v17 = -[HMDCameraRecordingUploadOperationEvent initWithClipModelID:operation:]([HMDCameraRecordingUploadOperationEvent alloc], "initWithClipModelID:operation:", v9, v14);
    uploadOperationEvent = v14->_uploadOperationEvent;
    v14->_uploadOperationEvent = v17;

    v31 = (void *)MEMORY[0x1E0CB3940];
    -[HMDCameraClipOperation name](v14, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "componentsSeparatedByString:", CFSTR("-"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipOperation clipModelID](v14, "clipModelID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("-"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@/%@"), v20, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v14->_logIdentifier;
    v14->_logIdentifier = (NSString *)v26;

    v10 = v22;
  }

  return v14;
}

- (double)queuedDuration
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[HMDCameraClipOperation startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[HMDCameraClipOperation creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (void)main
{
  void *v3;
  id v4;

  -[HMDCameraClipOperation startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipOperation setStartDate:](self, "setStartDate:", v4);

  }
}

- (void)finish
{
  void *v3;
  HMDCameraClipOperation *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraClipOperation;
  -[HMFOperation finish](&v8, sel_finish);
  v3 = (void *)MEMORY[0x1D17BA0A0](-[HMDCameraClipOperation _markEndDateAndSubmitUploadOperationEvent](self, "_markEndDateAndSubmitUploadOperationEvent"));
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipOperation executionDuration](v4, "executionDuration");
    *(_DWORD *)buf = 138543618;
    v10 = v6;
    v11 = 2048;
    v12 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Operation finished in %.2fs", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraClipOperation *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDCameraClipOperation;
  -[HMFOperation cancelWithError:](&v10, sel_cancelWithError_, v4);
  v5 = (void *)MEMORY[0x1D17BA0A0](-[HMDCameraClipOperation _markEndDateAndSubmitUploadOperationEvent](self, "_markEndDateAndSubmitUploadOperationEvent"));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipOperation executionDuration](v6, "executionDuration");
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2048;
    v14 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Operation canceled after %.2fs", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (id)fetchClipModel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  HMDCameraClipOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipOperation localZone](self, "localZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipOperation clipModelID](self, "clipModelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v3, "fetchModelWithModelID:ofType:error:", v4, objc_opt_class(), &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraClipOperation clipModelID](v9, "clipModelID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local clip model with ID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = (void *)MEMORY[0x1E0D519C0];
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "futureWithError:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v7;
LABEL_8:

  return v14;
}

- (id)updateClipModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraClipOperation *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "videoStreamingAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D32CD8]);
    -[HMDCameraClipOperation shortDescription](self, "shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithLabel:", v7);

    objc_msgSend(v8, "setDisallowsCellularAccessForMirrorOutput:", 1);
    objc_msgSend(v8, "setQualityOfService:", -1);
    -[HMDCameraClipOperation localZone](self, "localZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addModels:options:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Aborting save of clip model because no video streaming asset was found: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v17 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (double)executionDuration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  double v9;

  -[HMDCameraClipOperation startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDCameraClipOperation endDate](self, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;

    objc_msgSend(v8, "timeIntervalSinceDate:", v3);
    v7 = v9;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)_markEndDateAndSubmitUploadOperationEvent
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HMDCameraClipOperation endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipOperation setEndDate:](self, "setEndDate:", v4);

  }
  -[HMDCameraClipOperation executionDuration](self, "executionDuration");
  v6 = v5;
  -[HMDCameraClipOperation uploadOperationEvent](self, "uploadOperationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRunTime:", v6);

  -[HMFOperation error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipOperation uploadOperationEvent](self, "uploadOperationEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setError:", v8);

  -[HMDCameraClipOperation dataSource](self, "dataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipOperation uploadOperationEvent](self, "uploadOperationEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitOperationEvent:", v10);

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v3, "setMinimumFractionDigits:", 3);
  objc_msgSend(v3, "setMaximumFractionDigits:", 3);
  objc_msgSend(v3, "setNotANumberSymbol:", CFSTR("0.000"));
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraClipOperation logIdentifier](self, "logIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("ID"), v22);
  v23[0] = v21;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraClipOperation creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Created"), v6);
  v23[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraClipOperation queuedDuration](self, "queuedDuration");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithName:value:options:formatter:", CFSTR("Queued Duration"), v10, 0, v3);
  v23[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMFOperation isExecuting](self, "isExecuting");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Executing"), v13);
  v23[3] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraClipOperation executionDuration](self, "executionDuration");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithName:value:options:formatter:", CFSTR("Execution Duration"), v17, 0, v3);
  v23[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (NSUUID)clipModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 328, 1);
}

- (HMDCameraRecordingUploadOperationEvent)uploadOperationEvent
{
  return (HMDCameraRecordingUploadOperationEvent *)objc_getProperty(self, a2, 336, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 360, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (HMDCameraClipOperationDataSource)dataSource
{
  return (HMDCameraClipOperationDataSource *)objc_getProperty(self, a2, 368, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uploadOperationEvent, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_clipModelID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

+ (unint64_t)cameraClipOperationType
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_31656 != -1)
    dispatch_once(&logCategory__hmf_once_t4_31656, &__block_literal_global_31657);
  return (id)logCategory__hmf_once_v5_31658;
}

void __37__HMDCameraClipOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_31658;
  logCategory__hmf_once_v5_31658 = v0;

}

@end
