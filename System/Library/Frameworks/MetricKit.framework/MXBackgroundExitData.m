@implementation MXBackgroundExitData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t cumulativeNormalAppExitCount;
  id v5;

  cumulativeNormalAppExitCount = self->_cumulativeNormalAppExitCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", cumulativeNormalAppExitCount, CFSTR("cumulativeNormalAppExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeMemoryResourceLimitExitCount, CFSTR("cumulativeMemoryResourceLimitExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeCPUResourceLimitExitCount, CFSTR("cumulativeCPUResourceLimitExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeMemoryPressureExitCount, CFSTR("cumulativeMemoryPressureExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeBadAccessExitCount, CFSTR("cumulativeBadAccessExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeAbnormalExitCount, CFSTR("cumulativeAbnormalExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeIllegalInstructionExitCount, CFSTR("cumulativeIllegalInstructionExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeAppWatchdogExitCount, CFSTR("cumulativeAppWatchdogExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeSuspendedWithLockedFileExitCount, CFSTR("cumulativeSuspendedWithLockedFileExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeBackgroundTaskAssertionTimeoutExitCount, CFSTR("cumulativeBackgroundTaskAssertionTimeoutExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount, CFSTR("cumulativeBackgroundURLSessionCompletionTimeoutExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeBackgroundFetchCompletionTimeoutExitCount, CFSTR("cumulativeBackgroundFetchCompletionTimeoutExitCount"));

}

- (MXBackgroundExitData)initWithCoder:(id)a3
{
  id v4;
  MXBackgroundExitData *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MXBackgroundExitData;
  v5 = -[MXBackgroundExitData init](&v7, sel_init);
  if (v5)
  {
    v5->_cumulativeNormalAppExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeNormalAppExitCount"));
    v5->_cumulativeMemoryResourceLimitExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeMemoryResourceLimitExitCount"));
    v5->_cumulativeCPUResourceLimitExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeCPUResourceLimitExitCount"));
    v5->_cumulativeMemoryPressureExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeMemoryPressureExitCount"));
    v5->_cumulativeBadAccessExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeBadAccessExitCount"));
    v5->_cumulativeAbnormalExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeAbnormalExitCount"));
    v5->_cumulativeIllegalInstructionExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeIllegalInstructionExitCount"));
    v5->_cumulativeAppWatchdogExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeAppWatchdogExitCount"));
    v5->_cumulativeSuspendedWithLockedFileExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeSuspendedWithLockedFileExitCount"));
    v5->_cumulativeBackgroundTaskAssertionTimeoutExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeBackgroundTaskAssertionTimeoutExitCount"));
    v5->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeBackgroundURLSessionCompletionTimeoutExitCount"));
    v5->_cumulativeBackgroundFetchCompletionTimeoutExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeBackgroundFetchCompletionTimeoutExitCount"));
  }

  return v5;
}

- (MXBackgroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 badAccessExitCount:(id)a6 abnormalExitCount:(id)a7 illegalInstructionExitCount:(id)a8 appWatchDogExitCount:(id)a9 cumulativeSuspendedWithLockedFileExitCount:(id)a10 cumulativeBackgroundTaskAssertionTimeoutExitCount:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MXBackgroundExitData *v25;
  MXBackgroundExitData *v26;
  void *v27;
  id v29;
  void *v30;
  objc_super v31;

  v17 = a3;
  v29 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)MXBackgroundExitData;
  v25 = -[MXBackgroundExitData init](&v31, sel_init);
  v30 = v17;
  if (!v25)
    goto LABEL_12;
  v26 = 0;
  if (!v17)
  {
LABEL_13:
    v27 = v29;
    goto LABEL_14;
  }
  v27 = v29;
  if (v29 && v18 && v19 && v20 && v21 && v22 && v23 && v24)
  {
    v25->_cumulativeNormalAppExitCount = objc_msgSend(v30, "unsignedIntegerValue");
    v25->_cumulativeMemoryResourceLimitExitCount = objc_msgSend(v29, "unsignedIntegerValue");
    v25->_cumulativeCPUResourceLimitExitCount = objc_msgSend(v18, "unsignedIntegerValue");
    v25->_cumulativeBadAccessExitCount = objc_msgSend(v19, "unsignedIntegerValue");
    v25->_cumulativeAbnormalExitCount = objc_msgSend(v20, "unsignedIntegerValue");
    v25->_cumulativeIllegalInstructionExitCount = objc_msgSend(v21, "unsignedIntegerValue");
    v25->_cumulativeAppWatchdogExitCount = objc_msgSend(v22, "unsignedIntegerValue");
    v25->_cumulativeSuspendedWithLockedFileExitCount = objc_msgSend(v23, "unsignedIntegerValue");
    v25->_cumulativeBackgroundTaskAssertionTimeoutExitCount = objc_msgSend(v24, "unsignedIntegerValue");
LABEL_12:
    v26 = v25;
    goto LABEL_13;
  }
LABEL_14:

  return v26;
}

- (MXBackgroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 memoryPressureExitCount:(id)a6 badAccessExitCount:(id)a7 abnormalExitCount:(id)a8 illegalInstructionExitCount:(id)a9 appWatchDogExitCount:(id)a10 cumulativeSuspendedWithLockedFileExitCount:(id)a11 cumulativeBackgroundTaskAssertionTimeoutExitCount:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  MXBackgroundExitData *v26;
  MXBackgroundExitData *v27;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v31.receiver = self;
  v31.super_class = (Class)MXBackgroundExitData;
  v26 = -[MXBackgroundExitData init](&v31, sel_init);
  if (!v26)
    goto LABEL_13;
  v27 = 0;
  if (v19 && v30 && v29 && v18 && v20 && v21 && v22 && v23 && v24 && v25)
  {
    v26->_cumulativeNormalAppExitCount = objc_msgSend(v30, "unsignedIntegerValue");
    v26->_cumulativeMemoryResourceLimitExitCount = objc_msgSend(v29, "unsignedIntegerValue");
    v26->_cumulativeCPUResourceLimitExitCount = objc_msgSend(v18, "unsignedIntegerValue");
    v26->_cumulativeMemoryPressureExitCount = objc_msgSend(v19, "unsignedIntegerValue");
    v26->_cumulativeBadAccessExitCount = objc_msgSend(v20, "unsignedIntegerValue");
    v26->_cumulativeAbnormalExitCount = objc_msgSend(v21, "unsignedIntegerValue");
    v26->_cumulativeIllegalInstructionExitCount = objc_msgSend(v22, "unsignedIntegerValue");
    v26->_cumulativeAppWatchdogExitCount = objc_msgSend(v23, "unsignedIntegerValue");
    v26->_cumulativeSuspendedWithLockedFileExitCount = objc_msgSend(v24, "unsignedIntegerValue");
    v26->_cumulativeBackgroundTaskAssertionTimeoutExitCount = objc_msgSend(v25, "unsignedIntegerValue");
LABEL_13:
    v27 = v26;
  }

  return v27;
}

- (MXBackgroundExitData)initWithNormalAppExitCount:(unint64_t)a3 memoryResourceLimitExitCount:(unint64_t)a4 cpuResourceLimitExitCount:(unint64_t)a5 memoryPressureExitCount:(unint64_t)a6 badAccessExitCount:(unint64_t)a7 abnormalExitCount:(unint64_t)a8 illegalInstructionExitCount:(unint64_t)a9 appWatchDogExitCount:(unint64_t)a10 cumulativeSuspendedWithLockedFileExitCount:(unint64_t)a11 cumulativeBackgroundTaskAssertionTimeoutExitCount:(unint64_t)a12 cumulativeBackgroundURLSessionCompletionTimeoutExitCount:(unint64_t)a13 cumulativeBackgroundFetchCompletionTimeoutExitCount:(unint64_t)a14
{
  MXBackgroundExitData *result;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MXBackgroundExitData;
  result = -[MXBackgroundExitData init](&v21, sel_init);
  if (result)
  {
    result->_cumulativeNormalAppExitCount = a3;
    result->_cumulativeMemoryResourceLimitExitCount = a4;
    result->_cumulativeCPUResourceLimitExitCount = a5;
    result->_cumulativeMemoryPressureExitCount = a6;
    result->_cumulativeBadAccessExitCount = a7;
    result->_cumulativeAbnormalExitCount = a8;
    result->_cumulativeIllegalInstructionExitCount = a9;
    result->_cumulativeAppWatchdogExitCount = a10;
    result->_cumulativeSuspendedWithLockedFileExitCount = a11;
    result->_cumulativeBackgroundTaskAssertionTimeoutExitCount = a12;
    result->_cumulativeBackgroundFetchCompletionTimeoutExitCount = a14;
    result->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount = a13;
  }
  return result;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_cumulativeNormalAppExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("cumulativeNormalAppExitCount"));

  }
  if (self->_cumulativeMemoryResourceLimitExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cumulativeMemoryResourceLimitExitCount"));

  }
  if (self->_cumulativeCPUResourceLimitExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cumulativeCPUResourceLimitExitCount"));

  }
  if (self->_cumulativeMemoryPressureExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cumulativeMemoryPressureExitCount"));

  }
  if (self->_cumulativeBadAccessExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cumulativeBadAccessExitCount"));

  }
  if (self->_cumulativeAbnormalExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cumulativeAbnormalExitCount"));

  }
  if (self->_cumulativeIllegalInstructionExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("cumulativeIllegalInstructionExitCount"));

  }
  if (self->_cumulativeAppWatchdogExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cumulativeAppWatchdogExitCount"));

  }
  if (self->_cumulativeSuspendedWithLockedFileExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("cumulativeSuspendedWithLockedFileExitCount"));

  }
  if (self->_cumulativeBackgroundTaskAssertionTimeoutExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cumulativeBackgroundTaskAssertionTimeoutExitCount"));

  }
  if (self->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cumulativeBackgroundURLSessionCompletionTimeoutExitCount"));

  }
  if (self->_cumulativeBackgroundFetchCompletionTimeoutExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cumulativeBackgroundFetchCompletionTimeoutExitCount"));

  }
  return v3;
}

- (NSUInteger)cumulativeNormalAppExitCount
{
  return self->_cumulativeNormalAppExitCount;
}

- (NSUInteger)cumulativeMemoryResourceLimitExitCount
{
  return self->_cumulativeMemoryResourceLimitExitCount;
}

- (NSUInteger)cumulativeCPUResourceLimitExitCount
{
  return self->_cumulativeCPUResourceLimitExitCount;
}

- (NSUInteger)cumulativeMemoryPressureExitCount
{
  return self->_cumulativeMemoryPressureExitCount;
}

- (NSUInteger)cumulativeBadAccessExitCount
{
  return self->_cumulativeBadAccessExitCount;
}

- (NSUInteger)cumulativeAbnormalExitCount
{
  return self->_cumulativeAbnormalExitCount;
}

- (NSUInteger)cumulativeIllegalInstructionExitCount
{
  return self->_cumulativeIllegalInstructionExitCount;
}

- (NSUInteger)cumulativeAppWatchdogExitCount
{
  return self->_cumulativeAppWatchdogExitCount;
}

- (NSUInteger)cumulativeSuspendedWithLockedFileExitCount
{
  return self->_cumulativeSuspendedWithLockedFileExitCount;
}

- (NSUInteger)cumulativeBackgroundTaskAssertionTimeoutExitCount
{
  return self->_cumulativeBackgroundTaskAssertionTimeoutExitCount;
}

- (unint64_t)cumulativeBackgroundFetchCompletionTimeoutExitCount
{
  return self->_cumulativeBackgroundFetchCompletionTimeoutExitCount;
}

- (unint64_t)cumulativeBackgroundURLSessionCompletionTimeoutExitCount
{
  return self->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount;
}

@end
