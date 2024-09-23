@implementation MXForegroundExitData

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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeBadAccessExitCount, CFSTR("cumulativeBadAccessExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeAbnormalExitCount, CFSTR("cumulativeAbnormalExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeIllegalInstructionExitCount, CFSTR("cumulativeIllegalInstructionExitCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cumulativeAppWatchdogExitCount, CFSTR("cumulativeAppWatchdogExitCount"));

}

- (MXForegroundExitData)initWithCoder:(id)a3
{
  id v4;
  MXForegroundExitData *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MXForegroundExitData;
  v5 = -[MXForegroundExitData init](&v7, sel_init);
  if (v5)
  {
    v5->_cumulativeNormalAppExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeNormalAppExitCount"));
    v5->_cumulativeMemoryResourceLimitExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeMemoryResourceLimitExitCount"));
    v5->_cumulativeCPUResourceLimitExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeCPUResourceLimitExitCount"));
    v5->_cumulativeBadAccessExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeBadAccessExitCount"));
    v5->_cumulativeAbnormalExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeAbnormalExitCount"));
    v5->_cumulativeIllegalInstructionExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeIllegalInstructionExitCount"));
    v5->_cumulativeAppWatchdogExitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cumulativeAppWatchdogExitCount"));
  }

  return v5;
}

- (MXForegroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 badAccessExitCount:(id)a6 abnormalExitCount:(id)a7 illegalInstructionExitCount:(id)a8 appWatchDogExitCount:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MXForegroundExitData *v22;
  MXForegroundExitData *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)MXForegroundExitData;
  v22 = -[MXForegroundExitData init](&v25, sel_init);
  if (!v22)
    goto LABEL_10;
  v23 = 0;
  if (v15 && v16 && v17 && v18 && v19 && v20 && v21)
  {
    v22->_cumulativeNormalAppExitCount = objc_msgSend(v15, "unsignedIntegerValue");
    v22->_cumulativeMemoryResourceLimitExitCount = objc_msgSend(v16, "unsignedIntegerValue");
    v22->_cumulativeCPUResourceLimitExitCount = objc_msgSend(v17, "unsignedIntegerValue");
    v22->_cumulativeBadAccessExitCount = objc_msgSend(v18, "unsignedIntegerValue");
    v22->_cumulativeAbnormalExitCount = objc_msgSend(v19, "unsignedIntegerValue");
    v22->_cumulativeIllegalInstructionExitCount = objc_msgSend(v20, "unsignedIntegerValue");
    v22->_cumulativeAppWatchdogExitCount = objc_msgSend(v21, "unsignedIntegerValue");
LABEL_10:
    v23 = v22;
  }

  return v23;
}

- (MXForegroundExitData)initWithNormalAppExitCount:(unint64_t)a3 withMemoryResourceLimitExitCount:(unint64_t)a4 withCPUResourceLimitExitCount:(unint64_t)a5 withBadAccessExitCount:(unint64_t)a6 withAbnormalExitCount:(unint64_t)a7 withIllegalInstructionExitCount:(unint64_t)a8 withAppWatchDogExitCount:(unint64_t)a9
{
  MXForegroundExitData *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MXForegroundExitData;
  result = -[MXForegroundExitData init](&v16, sel_init);
  if (result)
  {
    result->_cumulativeNormalAppExitCount = a3;
    result->_cumulativeMemoryResourceLimitExitCount = a4;
    result->_cumulativeAppWatchdogExitCount = a9;
    result->_cumulativeCPUResourceLimitExitCount = a5;
    result->_cumulativeBadAccessExitCount = a6;
    result->_cumulativeAbnormalExitCount = a7;
    result->_cumulativeIllegalInstructionExitCount = a8;
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
  if (self->_cumulativeBadAccessExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cumulativeBadAccessExitCount"));

  }
  if (self->_cumulativeAbnormalExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cumulativeAbnormalExitCount"));

  }
  if (self->_cumulativeIllegalInstructionExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cumulativeIllegalInstructionExitCount"));

  }
  if (self->_cumulativeAppWatchdogExitCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("cumulativeAppWatchdogExitCount"));

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

- (unint64_t)cumulativeCPUResourceLimitExitCount
{
  return self->_cumulativeCPUResourceLimitExitCount;
}

@end
