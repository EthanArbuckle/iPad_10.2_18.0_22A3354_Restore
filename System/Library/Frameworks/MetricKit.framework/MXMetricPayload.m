@implementation MXMetricPayload

- (MXMetricPayload)initWithPayloadData:(id)a3 withMutipleAppVersions:(BOOL)a4 withTimeStampBegin:(id)a5 withTimeStampEnd:(id)a6 withMetaData:(id)a7 withMetrics:(id)a8
{
  id v15;
  id v16;
  id v17;
  MXMetricPayload *v18;
  MXMetricPayload *v19;
  MXMetricPayload *v20;
  uint64_t v21;
  MXCPUMetric *cpuMetrics;
  uint64_t v23;
  MXGPUMetric *gpuMetrics;
  uint64_t v25;
  MXCellularConditionMetric *cellularConditionMetrics;
  uint64_t v27;
  MXAppRunTimeMetric *applicationTimeMetrics;
  uint64_t v29;
  MXLocationActivityMetric *locationActivityMetrics;
  uint64_t v31;
  MXNetworkTransferMetric *networkTransferMetrics;
  uint64_t v33;
  MXAppLaunchMetric *applicationLaunchMetrics;
  uint64_t v35;
  MXAppResponsivenessMetric *applicationResponsivenessMetrics;
  uint64_t v37;
  MXDiskIOMetric *diskIOMetrics;
  uint64_t v39;
  MXMemoryMetric *memoryMetrics;
  uint64_t v41;
  MXDisplayMetric *displayMetrics;
  uint64_t v43;
  MXAnimationMetric *animationMetrics;
  uint64_t v45;
  MXAppExitMetric *applicationExitMetrics;
  uint64_t v47;
  NSArray *signpostMetrics;
  id v50;
  id v51;
  objc_super v52;

  v15 = a3;
  v51 = a5;
  v16 = a6;
  v50 = a7;
  v17 = a8;
  v52.receiver = self;
  v52.super_class = (Class)MXMetricPayload;
  v18 = -[MXMetricPayload init](&v52, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_6;
  v20 = 0;
  if (v15 && v51 && v16)
  {
    objc_storeStrong((id *)&v18->_latestApplicationVersion, a3);
    v19->_includesMultipleApplicationVersions = a4;
    objc_storeStrong((id *)&v19->_timeStampBegin, a5);
    objc_storeStrong((id *)&v19->_timeStampEnd, a6);
    objc_storeStrong((id *)&v19->_metaData, a7);
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cpuMetrics"), v50);
    v21 = objc_claimAutoreleasedReturnValue();
    cpuMetrics = v19->_cpuMetrics;
    v19->_cpuMetrics = (MXCPUMetric *)v21;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("gpuMetrics"));
    v23 = objc_claimAutoreleasedReturnValue();
    gpuMetrics = v19->_gpuMetrics;
    v19->_gpuMetrics = (MXGPUMetric *)v23;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cellularConditionMetrics"));
    v25 = objc_claimAutoreleasedReturnValue();
    cellularConditionMetrics = v19->_cellularConditionMetrics;
    v19->_cellularConditionMetrics = (MXCellularConditionMetric *)v25;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("applicationTimeMetrics"));
    v27 = objc_claimAutoreleasedReturnValue();
    applicationTimeMetrics = v19->_applicationTimeMetrics;
    v19->_applicationTimeMetrics = (MXAppRunTimeMetric *)v27;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("locationActivityMetrics"));
    v29 = objc_claimAutoreleasedReturnValue();
    locationActivityMetrics = v19->_locationActivityMetrics;
    v19->_locationActivityMetrics = (MXLocationActivityMetric *)v29;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("networkTransferMetrics"));
    v31 = objc_claimAutoreleasedReturnValue();
    networkTransferMetrics = v19->_networkTransferMetrics;
    v19->_networkTransferMetrics = (MXNetworkTransferMetric *)v31;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("applicationLaunchMetrics"));
    v33 = objc_claimAutoreleasedReturnValue();
    applicationLaunchMetrics = v19->_applicationLaunchMetrics;
    v19->_applicationLaunchMetrics = (MXAppLaunchMetric *)v33;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("applicationResponsivenessMetrics"));
    v35 = objc_claimAutoreleasedReturnValue();
    applicationResponsivenessMetrics = v19->_applicationResponsivenessMetrics;
    v19->_applicationResponsivenessMetrics = (MXAppResponsivenessMetric *)v35;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("diskIOMetrics"));
    v37 = objc_claimAutoreleasedReturnValue();
    diskIOMetrics = v19->_diskIOMetrics;
    v19->_diskIOMetrics = (MXDiskIOMetric *)v37;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("memoryMetrics"));
    v39 = objc_claimAutoreleasedReturnValue();
    memoryMetrics = v19->_memoryMetrics;
    v19->_memoryMetrics = (MXMemoryMetric *)v39;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("displayMetrics"));
    v41 = objc_claimAutoreleasedReturnValue();
    displayMetrics = v19->_displayMetrics;
    v19->_displayMetrics = (MXDisplayMetric *)v41;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("animationMetrics"));
    v43 = objc_claimAutoreleasedReturnValue();
    animationMetrics = v19->_animationMetrics;
    v19->_animationMetrics = (MXAnimationMetric *)v43;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("applicationExitMetrics"));
    v45 = objc_claimAutoreleasedReturnValue();
    applicationExitMetrics = v19->_applicationExitMetrics;
    v19->_applicationExitMetrics = (MXAppExitMetric *)v45;

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("signpostMetrics"));
    v47 = objc_claimAutoreleasedReturnValue();
    signpostMetrics = v19->_signpostMetrics;
    v19->_signpostMetrics = (NSArray *)v47;

LABEL_6:
    v20 = v19;
  }

  return v20;
}

- (MXMetricPayload)initWithAppVersion:(id)a3 withMutipleAppVersions:(BOOL)a4 withTimeStampBegin:(id)a5 withTimeStampEnd:(id)a6
{
  id v11;
  id v12;
  id v13;
  MXMetricPayload *v14;
  MXMetricPayload *v15;
  MXMetricPayload *v16;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MXMetricPayload;
  v14 = -[MXMetricPayload init](&v18, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_6;
  v16 = 0;
  if (v11 && v12 && v13)
  {
    objc_storeStrong((id *)&v14->_latestApplicationVersion, a3);
    v15->_includesMultipleApplicationVersions = a4;
    objc_storeStrong((id *)&v15->_timeStampBegin, a5);
    objc_storeStrong((id *)&v15->_timeStampEnd, a6);
LABEL_6:
    v16 = v15;
  }

  return v16;
}

- (NSData)JSONRepresentation
{
  void *v2;
  void *v3;
  id v5;

  -[MXMetricPayload toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *latestApplicationVersion;
  void *v5;
  id v6;

  latestApplicationVersion = self->_latestApplicationVersion;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", latestApplicationVersion, CFSTR("appVersion"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_includesMultipleApplicationVersions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("multipleAppVersions"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_timeStampBegin, CFSTR("timeStampBegin"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_timeStampEnd, CFSTR("timeStampEnd"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_metaData, CFSTR("metaData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cpuMetrics, CFSTR("cpuMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_gpuMetrics, CFSTR("gpuMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cellularConditionMetrics, CFSTR("cellularConditionMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_applicationTimeMetrics, CFSTR("applicationTimeMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locationActivityMetrics, CFSTR("locationActivityMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_networkTransferMetrics, CFSTR("networkTransferMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_applicationLaunchMetrics, CFSTR("applicationLaunchMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_applicationResponsivenessMetrics, CFSTR("applicationResponsivenessMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_diskIOMetrics, CFSTR("diskIOMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_memoryMetrics, CFSTR("memoryMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayMetrics, CFSTR("displayMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_animationMetrics, CFSTR("animationMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_applicationExitMetrics, CFSTR("applicationExitMetrics"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_signpostMetrics, CFSTR("signpostMetrics"));

}

- (MXMetricPayload)initWithCoder:(id)a3
{
  id v4;
  MXMetricPayload *v5;
  uint64_t v6;
  NSString *latestApplicationVersion;
  void *v8;
  uint64_t v9;
  NSDate *timeStampBegin;
  uint64_t v11;
  NSDate *timeStampEnd;
  uint64_t v13;
  MXMetaData *metaData;
  uint64_t v15;
  MXCPUMetric *cpuMetrics;
  uint64_t v17;
  MXGPUMetric *gpuMetrics;
  uint64_t v19;
  MXCellularConditionMetric *cellularConditionMetrics;
  uint64_t v21;
  MXAppRunTimeMetric *applicationTimeMetrics;
  uint64_t v23;
  MXLocationActivityMetric *locationActivityMetrics;
  uint64_t v25;
  MXNetworkTransferMetric *networkTransferMetrics;
  uint64_t v27;
  MXAppLaunchMetric *applicationLaunchMetrics;
  uint64_t v29;
  MXAppResponsivenessMetric *applicationResponsivenessMetrics;
  uint64_t v31;
  MXDiskIOMetric *diskIOMetrics;
  uint64_t v33;
  MXMemoryMetric *memoryMetrics;
  uint64_t v35;
  MXDisplayMetric *displayMetrics;
  uint64_t v37;
  MXAnimationMetric *animationMetrics;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  MXAppExitMetric *applicationExitMetrics;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSArray *signpostMetrics;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)MXMetricPayload;
  v5 = -[MXMetricPayload init](&v51, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    latestApplicationVersion = v5->_latestApplicationVersion;
    v5->_latestApplicationVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multipleAppVersions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includesMultipleApplicationVersions = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStampBegin"));
    v9 = objc_claimAutoreleasedReturnValue();
    timeStampBegin = v5->_timeStampBegin;
    v5->_timeStampBegin = (NSDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeStampEnd"));
    v11 = objc_claimAutoreleasedReturnValue();
    timeStampEnd = v5->_timeStampEnd;
    v5->_timeStampEnd = (NSDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaData"));
    v13 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (MXMetaData *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cpuMetrics"));
    v15 = objc_claimAutoreleasedReturnValue();
    cpuMetrics = v5->_cpuMetrics;
    v5->_cpuMetrics = (MXCPUMetric *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gpuMetrics"));
    v17 = objc_claimAutoreleasedReturnValue();
    gpuMetrics = v5->_gpuMetrics;
    v5->_gpuMetrics = (MXGPUMetric *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellularConditionMetrics"));
    v19 = objc_claimAutoreleasedReturnValue();
    cellularConditionMetrics = v5->_cellularConditionMetrics;
    v5->_cellularConditionMetrics = (MXCellularConditionMetric *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationTimeMetrics"));
    v21 = objc_claimAutoreleasedReturnValue();
    applicationTimeMetrics = v5->_applicationTimeMetrics;
    v5->_applicationTimeMetrics = (MXAppRunTimeMetric *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationActivityMetrics"));
    v23 = objc_claimAutoreleasedReturnValue();
    locationActivityMetrics = v5->_locationActivityMetrics;
    v5->_locationActivityMetrics = (MXLocationActivityMetric *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkTransferMetrics"));
    v25 = objc_claimAutoreleasedReturnValue();
    networkTransferMetrics = v5->_networkTransferMetrics;
    v5->_networkTransferMetrics = (MXNetworkTransferMetric *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationLaunchMetrics"));
    v27 = objc_claimAutoreleasedReturnValue();
    applicationLaunchMetrics = v5->_applicationLaunchMetrics;
    v5->_applicationLaunchMetrics = (MXAppLaunchMetric *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationResponsivenessMetrics"));
    v29 = objc_claimAutoreleasedReturnValue();
    applicationResponsivenessMetrics = v5->_applicationResponsivenessMetrics;
    v5->_applicationResponsivenessMetrics = (MXAppResponsivenessMetric *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diskIOMetrics"));
    v31 = objc_claimAutoreleasedReturnValue();
    diskIOMetrics = v5->_diskIOMetrics;
    v5->_diskIOMetrics = (MXDiskIOMetric *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memoryMetrics"));
    v33 = objc_claimAutoreleasedReturnValue();
    memoryMetrics = v5->_memoryMetrics;
    v5->_memoryMetrics = (MXMemoryMetric *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayMetrics"));
    v35 = objc_claimAutoreleasedReturnValue();
    displayMetrics = v5->_displayMetrics;
    v5->_displayMetrics = (MXDisplayMetric *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("animationMetrics"));
    v37 = objc_claimAutoreleasedReturnValue();
    animationMetrics = v5->_animationMetrics;
    v5->_animationMetrics = (MXAnimationMetric *)v37;

    v39 = (void *)MEMORY[0x24BDBCF20];
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("applicationExitMetrics"));
    v43 = objc_claimAutoreleasedReturnValue();
    applicationExitMetrics = v5->_applicationExitMetrics;
    v5->_applicationExitMetrics = (MXAppExitMetric *)v43;

    v45 = (void *)MEMORY[0x24BDBCF20];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("signpostMetrics"));
    v48 = objc_claimAutoreleasedReturnValue();
    signpostMetrics = v5->_signpostMetrics;
    v5->_signpostMetrics = (NSArray *)v48;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSString *latestApplicationVersion;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MXMetaData *metaData;
  void *v13;
  MXCPUMetric *cpuMetrics;
  void *v15;
  MXGPUMetric *gpuMetrics;
  void *v17;
  MXCellularConditionMetric *cellularConditionMetrics;
  void *v19;
  MXAppRunTimeMetric *applicationTimeMetrics;
  void *v21;
  MXLocationActivityMetric *locationActivityMetrics;
  void *v23;
  MXNetworkTransferMetric *networkTransferMetrics;
  void *v25;
  MXAppLaunchMetric *applicationLaunchMetrics;
  void *v27;
  MXAppResponsivenessMetric *applicationResponsivenessMetrics;
  void *v29;
  MXDiskIOMetric *diskIOMetrics;
  void *v31;
  MXMemoryMetric *memoryMetrics;
  void *v33;
  MXDisplayMetric *displayMetrics;
  void *v35;
  MXAnimationMetric *animationMetrics;
  void *v37;
  MXAppExitMetric *applicationExitMetrics;
  void *v39;
  id v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v5, "setLocale:", v6);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  latestApplicationVersion = self->_latestApplicationVersion;
  if (latestApplicationVersion)
    objc_msgSend(v3, "setObject:forKey:", latestApplicationVersion, CFSTR("appVersion"));
  if (self->_includesMultipleApplicationVersions)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptionWithLocale:", CFSTR("en_US_POSIX"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("multipleAppVersions"));

  }
  if (self->_timeStampBegin)
  {
    objc_msgSend(v5, "stringFromDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timeStampBegin"));

  }
  if (self->_timeStampEnd)
  {
    objc_msgSend(v5, "stringFromDate:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timeStampEnd"));

  }
  metaData = self->_metaData;
  if (metaData)
  {
    -[MXMetaData toDictionary](metaData, "toDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("metaData"));

  }
  cpuMetrics = self->_cpuMetrics;
  if (cpuMetrics)
  {
    -[MXCPUMetric toDictionary](cpuMetrics, "toDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cpuMetrics"));

  }
  gpuMetrics = self->_gpuMetrics;
  if (gpuMetrics)
  {
    -[MXGPUMetric toDictionary](gpuMetrics, "toDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("gpuMetrics"));

  }
  cellularConditionMetrics = self->_cellularConditionMetrics;
  if (cellularConditionMetrics)
  {
    -[MXCellularConditionMetric toDictionary](cellularConditionMetrics, "toDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("cellularConditionMetrics"));

  }
  applicationTimeMetrics = self->_applicationTimeMetrics;
  if (applicationTimeMetrics)
  {
    -[MXAppRunTimeMetric toDictionary](applicationTimeMetrics, "toDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("applicationTimeMetrics"));

  }
  locationActivityMetrics = self->_locationActivityMetrics;
  if (locationActivityMetrics)
  {
    -[MXLocationActivityMetric toDictionary](locationActivityMetrics, "toDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("locationActivityMetrics"));

  }
  networkTransferMetrics = self->_networkTransferMetrics;
  if (networkTransferMetrics)
  {
    -[MXNetworkTransferMetric toDictionary](networkTransferMetrics, "toDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("networkTransferMetrics"));

  }
  applicationLaunchMetrics = self->_applicationLaunchMetrics;
  if (applicationLaunchMetrics)
  {
    -[MXAppLaunchMetric toDictionary](applicationLaunchMetrics, "toDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("applicationLaunchMetrics"));

  }
  applicationResponsivenessMetrics = self->_applicationResponsivenessMetrics;
  if (applicationResponsivenessMetrics)
  {
    -[MXAppResponsivenessMetric toDictionary](applicationResponsivenessMetrics, "toDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("applicationResponsivenessMetrics"));

  }
  diskIOMetrics = self->_diskIOMetrics;
  if (diskIOMetrics)
  {
    -[MXDiskIOMetric toDictionary](diskIOMetrics, "toDictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("diskIOMetrics"));

  }
  memoryMetrics = self->_memoryMetrics;
  if (memoryMetrics)
  {
    -[MXMemoryMetric toDictionary](memoryMetrics, "toDictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("memoryMetrics"));

  }
  displayMetrics = self->_displayMetrics;
  if (displayMetrics)
  {
    -[MXDisplayMetric toDictionary](displayMetrics, "toDictionary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("displayMetrics"));

  }
  animationMetrics = self->_animationMetrics;
  if (animationMetrics)
  {
    -[MXAnimationMetric toDictionary](animationMetrics, "toDictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("animationMetrics"));

  }
  applicationExitMetrics = self->_applicationExitMetrics;
  if (applicationExitMetrics)
  {
    -[MXAppExitMetric toDictionary](applicationExitMetrics, "toDictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("applicationExitMetrics"));

  }
  if (self->_signpostMetrics)
  {
    v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v41 = self->_signpostMetrics;
    v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v49 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "toDictionary", (_QWORD)v48);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v46);

        }
        v43 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v43);
    }

    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("signpostMetrics"));
  }

  return v3;
}

- (NSString)latestApplicationVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)includesMultipleApplicationVersions
{
  return self->_includesMultipleApplicationVersions;
}

- (NSDate)timeStampBegin
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)timeStampEnd
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (MXCPUMetric)cpuMetrics
{
  return (MXCPUMetric *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCpuMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MXGPUMetric)gpuMetrics
{
  return (MXGPUMetric *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGpuMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MXCellularConditionMetric)cellularConditionMetrics
{
  return (MXCellularConditionMetric *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCellularConditionMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (MXAppRunTimeMetric)applicationTimeMetrics
{
  return (MXAppRunTimeMetric *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationTimeMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (MXLocationActivityMetric)locationActivityMetrics
{
  return (MXLocationActivityMetric *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocationActivityMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (MXNetworkTransferMetric)networkTransferMetrics
{
  return (MXNetworkTransferMetric *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNetworkTransferMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (MXAppLaunchMetric)applicationLaunchMetrics
{
  return (MXAppLaunchMetric *)objc_getProperty(self, a2, 88, 1);
}

- (void)setApplicationLaunchMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (MXAppResponsivenessMetric)applicationResponsivenessMetrics
{
  return (MXAppResponsivenessMetric *)objc_getProperty(self, a2, 96, 1);
}

- (void)setApplicationResponsivenessMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (MXDiskIOMetric)diskIOMetrics
{
  return (MXDiskIOMetric *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDiskIOMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (MXMemoryMetric)memoryMetrics
{
  return (MXMemoryMetric *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMemoryMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (MXDisplayMetric)displayMetrics
{
  return (MXDisplayMetric *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDisplayMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (MXAnimationMetric)animationMetrics
{
  return (MXAnimationMetric *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAnimationMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (MXAppExitMetric)applicationExitMetrics
{
  return (MXAppExitMetric *)objc_getProperty(self, a2, 136, 1);
}

- (void)setApplicationExitMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)signpostMetrics
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSignpostMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (MXMetaData)metaData
{
  return (MXMetaData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMetaData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
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
  objc_storeStrong((id *)&self->_timeStampEnd, 0);
  objc_storeStrong((id *)&self->_timeStampBegin, 0);
  objc_storeStrong((id *)&self->_latestApplicationVersion, 0);
}

@end
