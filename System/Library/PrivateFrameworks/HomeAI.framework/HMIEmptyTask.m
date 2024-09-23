@implementation HMIEmptyTask

- (HMIEmptyTask)initWithTaskID:(int)a3 duration:(double)a4
{
  HMIEmptyTask *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIEmptyTask;
  result = -[HMITask initWithTaskID:](&v6, sel_initWithTaskID_, *(_QWORD *)&a3);
  if (result)
    result->_duration = a4;
  return result;
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  HMIEmptyTask *v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  int v9;
  void *v10;
  HMIEmptyTask *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  void (**v17)(double);
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _DWORD v24[7];

  *(_QWORD *)&v24[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220735570](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMITask taskID](v4, "taskID");
    -[HMIEmptyTask duration](v4, "duration");
    *(_DWORD *)buf = 138543874;
    v20 = v6;
    v21 = 1024;
    v22 = v7;
    v23 = 2048;
    *(_QWORD *)v24 = v8;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@TaskID: %u running for %f seconds ...", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v3);
  v9 = 0;
  do
  {
    v10 = (void *)MEMORY[0x220735570]();
    v11 = v4;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMITask taskID](v11, "taskID");
      *(_DWORD *)buf = 138544130;
      ++v9;
      v20 = v13;
      v21 = 1024;
      v22 = v14;
      v23 = 1024;
      v24[0] = v9;
      LOWORD(v24[1]) = 1024;
      *(_DWORD *)((char *)&v24[1] + 2) = 10;
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_INFO, "%{public}@TaskID: %u step %d of %d", buf, 0x1Eu);

    }
    else
    {
      ++v9;
    }

    objc_autoreleasePoolPop(v10);
    v15 = (void *)MEMORY[0x24BDD17F0];
    -[HMIEmptyTask duration](v11, "duration");
    objc_msgSend(v15, "sleepForTimeInterval:", v16 / 10.0);
    -[HMITask progressBlock](v11, "progressBlock");
    v17 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v17[2]((double)v9 / 10.0);

  }
  while (v9 != 10);
  v18.receiver = v11;
  v18.super_class = (Class)HMIEmptyTask;
  -[HMFOperation finish](&v18, sel_finish);
}

- (double)duration
{
  return self->_duration;
}

@end
