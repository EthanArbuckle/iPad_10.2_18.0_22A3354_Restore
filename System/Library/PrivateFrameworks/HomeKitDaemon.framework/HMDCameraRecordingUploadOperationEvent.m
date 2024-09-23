@implementation HMDCameraRecordingUploadOperationEvent

- (HMDCameraRecordingUploadOperationEvent)initWithClipModelID:(id)a3 operation:(id)a4
{
  id v7;
  id v8;
  HMDCameraRecordingUploadOperationEvent *v9;
  HMDCameraRecordingUploadOperationEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingUploadOperationEvent;
  v9 = -[HMMLogEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clipModelID, a3);
    v10->_operationType = objc_msgSend((id)objc_opt_class(), "cameraClipOperationType");
  }

  return v10;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  objc_class *v5;
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
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("uploadMetricClass"), v6);
  objc_msgSend(v3, "addObject:", v7);

  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraRecordingUploadOperationEvent runTime](self, "runTime");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("runTime"), v10);
  objc_msgSend(v3, "addObject:", v11);

  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraRecordingUploadOperationEvent clipModelID](self, "clipModelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("clipModelID"), v13);
  objc_msgSend(v3, "addObject:", v14);

  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDCameraRecordingUploadOperationEvent didCausePreviousClipToFinalizeDueToDurationLimit](self, "didCausePreviousClipToFinalizeDueToDurationLimit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("didCausePreviousClipToFinalizeDueToDurationLimit"), v16);
  objc_msgSend(v3, "addObject:", v17);

  v18 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMLogEvent error](self, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("error"), v19);
  objc_msgSend(v3, "addObject:", v20);

  v21 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCameraRecordingUploadOperationEvent retryCount](self, "retryCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("retryCount"), v22);
  objc_msgSend(v3, "addObject:", v23);

  return v3;
}

- (unint64_t)runTimeInMilliseconds
{
  double v2;

  -[HMDCameraRecordingUploadOperationEvent runTime](self, "runTime");
  return (unint64_t)(v2 * 1000.0);
}

- (unint64_t)totalClipDurationMilliseconds
{
  double v2;

  -[HMDCameraRecordingUploadOperationEvent totalClipDuration](self, "totalClipDuration");
  return (unint64_t)(v2 * 1000.0);
}

- (double)runTime
{
  return self->_runTime;
}

- (void)setRunTime:(double)a3
{
  self->_runTime = a3;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (BOOL)didCausePreviousClipToFinalizeDueToDurationLimit
{
  return self->_didCausePreviousClipToFinalizeDueToDurationLimit;
}

- (void)setDidCausePreviousClipToFinalizeDueToDurationLimit:(BOOL)a3
{
  self->_didCausePreviousClipToFinalizeDueToDurationLimit = a3;
}

- (double)totalClipDuration
{
  return self->_totalClipDuration;
}

- (void)setTotalClipDuration:(double)a3
{
  self->_totalClipDuration = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSUUID)clipModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipModelID, 0);
}

@end
