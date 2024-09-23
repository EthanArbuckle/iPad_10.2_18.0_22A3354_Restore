@implementation MXPowerlogData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initPayloadDataWithMutipleAppVersions:(BOOL)a3 withTimeStampBegin:(id)a4 withTimeStampEnd:(id)a5 withMetrics:(id)a6
{
  id v11;
  id v12;
  id v13;
  MXPowerlogData *v14;
  MXPowerlogData *v15;
  uint64_t v16;
  MXCPUMetric *cpuMetrics;
  uint64_t v18;
  MXGPUMetric *gpuMetrics;
  uint64_t v20;
  MXCellularConditionMetric *cellularConditionMetrics;
  uint64_t v22;
  MXAppRunTimeMetric *applicationTimeMetrics;
  uint64_t v24;
  MXLocationActivityMetric *locationActivityMetrics;
  uint64_t v26;
  MXNetworkTransferMetric *networkTransferMetrics;
  uint64_t v28;
  MXAppLaunchMetric *applicationLaunchMetrics;
  uint64_t v30;
  MXAppResponsivenessMetric *applicationResponsivenessMetrics;
  uint64_t v32;
  MXDiskIOMetric *diskIOMetrics;
  uint64_t v34;
  MXMemoryMetric *memoryMetrics;
  uint64_t v36;
  MXDisplayMetric *displayMetrics;
  uint64_t v38;
  MXAnimationMetric *animationMetrics;
  uint64_t v40;
  MXAppExitMetric *applicationExitMetrics;
  uint64_t v42;
  NSArray *signpostMetrics;
  objc_super v45;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v45.receiver = self;
  v45.super_class = (Class)MXPowerlogData;
  v14 = -[MXSourceData init](&v45, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_includesMultipleApplicationVersions = a3;
    objc_storeStrong((id *)&v14->_beginDate, a4);
    objc_storeStrong((id *)&v15->_endDate, a5);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cpuMetrics"));
    v16 = objc_claimAutoreleasedReturnValue();
    cpuMetrics = v15->_cpuMetrics;
    v15->_cpuMetrics = (MXCPUMetric *)v16;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("gpuMetrics"));
    v18 = objc_claimAutoreleasedReturnValue();
    gpuMetrics = v15->_gpuMetrics;
    v15->_gpuMetrics = (MXGPUMetric *)v18;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cellularConditionMetrics"));
    v20 = objc_claimAutoreleasedReturnValue();
    cellularConditionMetrics = v15->_cellularConditionMetrics;
    v15->_cellularConditionMetrics = (MXCellularConditionMetric *)v20;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("applicationTimeMetrics"));
    v22 = objc_claimAutoreleasedReturnValue();
    applicationTimeMetrics = v15->_applicationTimeMetrics;
    v15->_applicationTimeMetrics = (MXAppRunTimeMetric *)v22;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("locationActivityMetrics"));
    v24 = objc_claimAutoreleasedReturnValue();
    locationActivityMetrics = v15->_locationActivityMetrics;
    v15->_locationActivityMetrics = (MXLocationActivityMetric *)v24;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("networkTransferMetrics"));
    v26 = objc_claimAutoreleasedReturnValue();
    networkTransferMetrics = v15->_networkTransferMetrics;
    v15->_networkTransferMetrics = (MXNetworkTransferMetric *)v26;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("applicationLaunchMetrics"));
    v28 = objc_claimAutoreleasedReturnValue();
    applicationLaunchMetrics = v15->_applicationLaunchMetrics;
    v15->_applicationLaunchMetrics = (MXAppLaunchMetric *)v28;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("applicationResponsivenessMetrics"));
    v30 = objc_claimAutoreleasedReturnValue();
    applicationResponsivenessMetrics = v15->_applicationResponsivenessMetrics;
    v15->_applicationResponsivenessMetrics = (MXAppResponsivenessMetric *)v30;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("diskIOMetrics"));
    v32 = objc_claimAutoreleasedReturnValue();
    diskIOMetrics = v15->_diskIOMetrics;
    v15->_diskIOMetrics = (MXDiskIOMetric *)v32;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("memoryMetrics"));
    v34 = objc_claimAutoreleasedReturnValue();
    memoryMetrics = v15->_memoryMetrics;
    v15->_memoryMetrics = (MXMemoryMetric *)v34;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("displayMetrics"));
    v36 = objc_claimAutoreleasedReturnValue();
    displayMetrics = v15->_displayMetrics;
    v15->_displayMetrics = (MXDisplayMetric *)v36;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("animationMetrics"));
    v38 = objc_claimAutoreleasedReturnValue();
    animationMetrics = v15->_animationMetrics;
    v15->_animationMetrics = (MXAnimationMetric *)v38;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("applicationExitMetrics"));
    v40 = objc_claimAutoreleasedReturnValue();
    applicationExitMetrics = v15->_applicationExitMetrics;
    v15->_applicationExitMetrics = (MXAppExitMetric *)v40;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("signpostMetrics"));
    v42 = objc_claimAutoreleasedReturnValue();
    signpostMetrics = v15->_signpostMetrics;
    v15->_signpostMetrics = (NSArray *)v42;

  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 includesMultipleApplicationVersions;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  includesMultipleApplicationVersions = self->_includesMultipleApplicationVersions;
  v7 = a3;
  objc_msgSend(v4, "numberWithBool:", includesMultipleApplicationVersions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("multipleAppVersions"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_beginDate, CFSTR("beginDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_cpuMetrics, CFSTR("cpuMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_gpuMetrics, CFSTR("gpuMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_cellularConditionMetrics, CFSTR("cellularConditionMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_applicationTimeMetrics, CFSTR("applicationTimeMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_locationActivityMetrics, CFSTR("locationActivityMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_networkTransferMetrics, CFSTR("networkTransferMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_applicationLaunchMetrics, CFSTR("applicationLaunchMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_applicationResponsivenessMetrics, CFSTR("applicationResponsivenessMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_diskIOMetrics, CFSTR("diskIOMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_memoryMetrics, CFSTR("memoryMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_displayMetrics, CFSTR("displayMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_animationMetrics, CFSTR("animationMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_applicationExitMetrics, CFSTR("applicationExitMetrics"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_signpostMetrics, CFSTR("signpostMetrics"));

}

- (MXPowerlogData)initWithCoder:(id)a3
{
  id v4;
  MXPowerlogData *v5;
  void *v6;
  uint64_t v7;
  NSDate *beginDate;
  uint64_t v9;
  NSDate *endDate;
  uint64_t v11;
  MXCPUMetric *cpuMetrics;
  uint64_t v13;
  MXGPUMetric *gpuMetrics;
  uint64_t v15;
  MXCellularConditionMetric *cellularConditionMetrics;
  uint64_t v17;
  MXAppRunTimeMetric *applicationTimeMetrics;
  uint64_t v19;
  MXLocationActivityMetric *locationActivityMetrics;
  uint64_t v21;
  MXNetworkTransferMetric *networkTransferMetrics;
  uint64_t v23;
  MXAppLaunchMetric *applicationLaunchMetrics;
  uint64_t v25;
  MXAppResponsivenessMetric *applicationResponsivenessMetrics;
  uint64_t v27;
  MXDiskIOMetric *diskIOMetrics;
  uint64_t v29;
  MXMemoryMetric *memoryMetrics;
  uint64_t v31;
  MXDisplayMetric *displayMetrics;
  uint64_t v33;
  MXAnimationMetric *animationMetrics;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  MXAppExitMetric *applicationExitMetrics;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSArray *signpostMetrics;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)MXPowerlogData;
  v5 = -[MXSourceData init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multipleAppVersions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includesMultipleApplicationVersions = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beginDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    beginDate = v5->_beginDate;
    v5->_beginDate = (NSDate *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cpuMetrics"));
    v11 = objc_claimAutoreleasedReturnValue();
    cpuMetrics = v5->_cpuMetrics;
    v5->_cpuMetrics = (MXCPUMetric *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gpuMetrics"));
    v13 = objc_claimAutoreleasedReturnValue();
    gpuMetrics = v5->_gpuMetrics;
    v5->_gpuMetrics = (MXGPUMetric *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellularConditionMetrics"));
    v15 = objc_claimAutoreleasedReturnValue();
    cellularConditionMetrics = v5->_cellularConditionMetrics;
    v5->_cellularConditionMetrics = (MXCellularConditionMetric *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationTimeMetrics"));
    v17 = objc_claimAutoreleasedReturnValue();
    applicationTimeMetrics = v5->_applicationTimeMetrics;
    v5->_applicationTimeMetrics = (MXAppRunTimeMetric *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationActivityMetrics"));
    v19 = objc_claimAutoreleasedReturnValue();
    locationActivityMetrics = v5->_locationActivityMetrics;
    v5->_locationActivityMetrics = (MXLocationActivityMetric *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkTransferMetrics"));
    v21 = objc_claimAutoreleasedReturnValue();
    networkTransferMetrics = v5->_networkTransferMetrics;
    v5->_networkTransferMetrics = (MXNetworkTransferMetric *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationLaunchMetrics"));
    v23 = objc_claimAutoreleasedReturnValue();
    applicationLaunchMetrics = v5->_applicationLaunchMetrics;
    v5->_applicationLaunchMetrics = (MXAppLaunchMetric *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationResponsivenessMetrics"));
    v25 = objc_claimAutoreleasedReturnValue();
    applicationResponsivenessMetrics = v5->_applicationResponsivenessMetrics;
    v5->_applicationResponsivenessMetrics = (MXAppResponsivenessMetric *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diskIOMetrics"));
    v27 = objc_claimAutoreleasedReturnValue();
    diskIOMetrics = v5->_diskIOMetrics;
    v5->_diskIOMetrics = (MXDiskIOMetric *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memoryMetrics"));
    v29 = objc_claimAutoreleasedReturnValue();
    memoryMetrics = v5->_memoryMetrics;
    v5->_memoryMetrics = (MXMemoryMetric *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayMetrics"));
    v31 = objc_claimAutoreleasedReturnValue();
    displayMetrics = v5->_displayMetrics;
    v5->_displayMetrics = (MXDisplayMetric *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("animationMetrics"));
    v33 = objc_claimAutoreleasedReturnValue();
    animationMetrics = v5->_animationMetrics;
    v5->_animationMetrics = (MXAnimationMetric *)v33;

    v35 = (void *)MEMORY[0x24BDBCF20];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("applicationExitMetrics"));
    v39 = objc_claimAutoreleasedReturnValue();
    applicationExitMetrics = v5->_applicationExitMetrics;
    v5->_applicationExitMetrics = (MXAppExitMetric *)v39;

    v41 = (void *)MEMORY[0x24BDBCF20];
    v42 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("signpostMetrics"));
    v44 = objc_claimAutoreleasedReturnValue();
    signpostMetrics = v5->_signpostMetrics;
    v5->_signpostMetrics = (NSArray *)v44;

  }
  return v5;
}

- (BOOL)includesMultipleApplicationVersions
{
  return self->_includesMultipleApplicationVersions;
}

- (void)setIncludesMultipleApplicationVersions:(BOOL)a3
{
  self->_includesMultipleApplicationVersions = a3;
}

- (NSDate)beginDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBeginDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MXCPUMetric)cpuMetrics
{
  return (MXCPUMetric *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCpuMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (MXGPUMetric)gpuMetrics
{
  return (MXGPUMetric *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGpuMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MXCellularConditionMetric)cellularConditionMetrics
{
  return (MXCellularConditionMetric *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCellularConditionMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MXAppRunTimeMetric)applicationTimeMetrics
{
  return (MXAppRunTimeMetric *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplicationTimeMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (MXLocationActivityMetric)locationActivityMetrics
{
  return (MXLocationActivityMetric *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocationActivityMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (MXNetworkTransferMetric)networkTransferMetrics
{
  return (MXNetworkTransferMetric *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNetworkTransferMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (MXAppLaunchMetric)applicationLaunchMetrics
{
  return (MXAppLaunchMetric *)objc_getProperty(self, a2, 80, 1);
}

- (void)setApplicationLaunchMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (MXAppResponsivenessMetric)applicationResponsivenessMetrics
{
  return (MXAppResponsivenessMetric *)objc_getProperty(self, a2, 88, 1);
}

- (void)setApplicationResponsivenessMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (MXDiskIOMetric)diskIOMetrics
{
  return (MXDiskIOMetric *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDiskIOMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (MXMemoryMetric)memoryMetrics
{
  return (MXMemoryMetric *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMemoryMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (MXDisplayMetric)displayMetrics
{
  return (MXDisplayMetric *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDisplayMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (MXAnimationMetric)animationMetrics
{
  return (MXAnimationMetric *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAnimationMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (MXAppExitMetric)applicationExitMetrics
{
  return (MXAppExitMetric *)objc_getProperty(self, a2, 128, 1);
}

- (void)setApplicationExitMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSArray)signpostMetrics
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSignpostMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostMetrics, 0);
  objc_storeStrong((id *)&self->_applicationExitMetrics, 0);
  objc_storeStrong((id *)&self->_animationMetrics, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_memoryMetrics, 0);
  objc_storeStrong((id *)&self->_diskIOMetrics, 0);
  objc_storeStrong((id *)&self->_applicationResponsivenessMetrics, 0);
  objc_storeStrong((id *)&self->_applicationLaunchMetrics, 0);
  objc_storeStrong((id *)&self->_networkTransferMetrics, 0);
  objc_storeStrong((id *)&self->_locationActivityMetrics, 0);
  objc_storeStrong((id *)&self->_applicationTimeMetrics, 0);
  objc_storeStrong((id *)&self->_cellularConditionMetrics, 0);
  objc_storeStrong((id *)&self->_gpuMetrics, 0);
  objc_storeStrong((id *)&self->_cpuMetrics, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
}

@end
