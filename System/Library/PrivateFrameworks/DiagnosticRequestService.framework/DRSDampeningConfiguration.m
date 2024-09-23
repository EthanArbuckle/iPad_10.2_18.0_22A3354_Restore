@implementation DRSDampeningConfiguration

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DRSDampeningConfiguration hysteresis](self, "hysteresis");
  v5 = v4;
  v6 = -[DRSDampeningConfiguration countCap](self, "countCap");
  -[DRSDampeningConfiguration acceptanceRate](self, "acceptanceRate");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("Hysteresis window: %.1fs\nCap: %lu\nAcceptance rate: %.3f\n"), v5, v6, v7);
}

+ (id)_entityName
{
  return CFSTR("DRSDampeningConfigurationMO");
}

- (DRSDampeningConfiguration)initWithPlistDict:(id)a3
{
  id v4;
  NSObject *v5;
  DRSDampeningConfiguration *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  float v18;
  float v19;
  uint64_t v20;
  double v21;
  uint8_t v23[8];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __47__DRSDampeningConfiguration_initWithPlistDict___block_invoke;
  v24[3] = &unk_1EA3D2B40;
  v24[4] = &v25;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v24);
  if (*((_BYTE *)v26 + 24))
  {
    DPLogHandle_DampeningManagerError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidDampeningConfigurationPlist", "Found unexpected object types in plist dictionary", v23, 2u);
    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSDMHysteresisKey);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &unk_1EA3E3A88;
    if (v7)
      v9 = (void *)v7;
    v5 = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSDMCountCapKey);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &unk_1EA3E3A58;
    if (v10)
      v12 = (void *)v10;
    v13 = v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSDMAcceptanceRateKey);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &unk_1EA3E3A98;
    if (v14)
      v16 = (void *)v14;
    v17 = v16;

    -[NSObject floatValue](v5, "floatValue");
    v19 = v18;
    v20 = objc_msgSend(v13, "unsignedIntegerValue");
    objc_msgSend(v17, "doubleValue");
    self = -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:](self, "initWithHysteresis:cap:acceptanceRate:", v20, v19, v21);

    v6 = self;
  }

  _Block_object_dispose(&v25, 8);
  return v6;
}

void __47__DRSDampeningConfiguration_initWithPlistDict___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  id v9;

  v9 = a3;
  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (DRSDampeningConfiguration)initWithHysteresis:(double)a3 cap:(unint64_t)a4 acceptanceRate:(double)a5
{
  DRSDampeningConfiguration *v6;
  NSObject *v7;
  const char *v8;
  DRSDampeningConfiguration *v11;
  DRSDampeningConfiguration *v13;
  objc_super v15;
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  v6 = self;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
  {
    DPLogHandle_DampeningManagerError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a3;
      v8 = "Invalid hysteresis window of %f";
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationFailure", v8, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (a5 < 0.0 || a5 > 1.0)
  {
    DPLogHandle_DampeningManagerError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a5;
      v8 = "Invalid acceptance rate of %f";
      goto LABEL_10;
    }
LABEL_11:

    v11 = 0;
    goto LABEL_15;
  }
  v15.receiver = self;
  v15.super_class = (Class)DRSDampeningConfiguration;
  v13 = -[DRSDampeningConfiguration init](&v15, sel_init);
  if (v13)
  {
    v13->_countCap = a4;
    v13->_hysteresis = a3;
    v13->_acceptanceRate = a5;
  }
  v6 = v13;
  v11 = v6;
LABEL_15:

  return v11;
}

- (id)_initWithMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  DRSDampeningConfiguration *v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "hysteresis");
    v6 = v5;
    v7 = objc_msgSend(v4, "countCap");
    objc_msgSend(v4, "acceptanceRate");
    v9 = v8;

    self = -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:](self, "initWithHysteresis:cap:acceptanceRate:", v7, v6, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  DRSDampeningConfigurationMO *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[DRSDampeningConfigurationMO initWithContext:]([DRSDampeningConfigurationMO alloc], "initWithContext:", v7);

  -[DRSDampeningConfiguration hysteresis](self, "hysteresis");
  -[DRSDampeningConfigurationMO setHysteresis:](v8, "setHysteresis:");
  -[DRSDampeningConfigurationMO setCountCap:](v8, "setCountCap:", -[DRSDampeningConfiguration countCap](self, "countCap"));
  -[DRSDampeningConfiguration acceptanceRate](self, "acceptanceRate");
  -[DRSDampeningConfigurationMO setAcceptanceRate:](v8, "setAcceptanceRate:");
  -[DRSDampeningConfigurationMO setIdentifier:](v8, "setIdentifier:", v6);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  DRSDampeningConfiguration *v4;
  DRSDampeningConfiguration *v5;
  BOOL v6;

  v4 = (DRSDampeningConfiguration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[DRSDampeningConfiguration isEqualToDampeningConfiguration:](self, "isEqualToDampeningConfiguration:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToDampeningConfiguration:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  if (v4
    && (-[DRSDampeningConfiguration hysteresis](self, "hysteresis"), v6 = v5, objc_msgSend(v4, "hysteresis"), v6 == v7)
    && (v8 = -[DRSDampeningConfiguration countCap](self, "countCap"), v8 == objc_msgSend(v4, "countCap")))
  {
    -[DRSDampeningConfiguration acceptanceRate](self, "acceptanceRate");
    v10 = v9;
    objc_msgSend(v4, "acceptanceRate");
    v12 = v10 == v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)defaultSignatureDampeningConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 0, 150.0, 0.5);
}

- (id)jsonCompatibleDictRepresentation
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = kDRSDMHysteresisKey;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[DRSDampeningConfiguration hysteresis](self, "hysteresis");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = kDRSDMCountCapKey;
  v5 = -[DRSDampeningConfiguration countCap](self, "countCap");
  if (v5 == 0x7FFFFFFF)
  {
    v6 = CFSTR("<No cap>");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DRSDampeningConfiguration countCap](self, "countCap"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = kDRSDMAcceptanceRateKey;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[DRSDampeningConfiguration acceptanceRate](self, "acceptanceRate");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != 0x7FFFFFFF)
  return v9;
}

+ (id)nandDefaultConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 12, 300.0, 1.0);
}

+ (id)memoryToolsDefaultConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 5, 1.0, 1.0);
}

+ (id)memoryToolsInternalMemgraphOverTimeConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 50, 1.0, 1.0);
}

+ (id)hangTracerNonWatchOSInternalNoDownsamplingConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 4, 0.0, 1.0);
}

+ (id)hangTracerNonWatchOSInternalDownsamplingConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 4, 0.0, 0.5);
}

+ (id)hangTracerNonWatchOSSeedConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 3, 0.0, 1.0);
}

+ (id)hangTracerNonWatchOSCustomerConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 3, 0.0, 0.75);
}

+ (id)hangTracerWatchOSInternalOrSeedNoDownsamplingConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 0.0, 1.0);
}

+ (id)hangTracerWatchOSInternalOrSeedDownsamplingConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 0.0, 0.25);
}

+ (id)sentryAppLaunchConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 12, 3600.0, 1.0);
}

+ (id)coreAudioOverloadConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 20, 1800.0, 1.0);
}

+ (id)spindumpMacOSSlowHIDConfiguration_Internal
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 10, 6480.0, 1.0);
}

+ (id)spindumpMacOSSlowHIDConfiguration_SeedRC
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 3, 21600.0, 1.0);
}

+ (id)spindumpWorkflowResponsivenessConfiguration_Internal
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 10, 1800.0, 1.0);
}

+ (id)spindumpWorkflowResponsivenessConfiguration_External
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 3, 1800.0, 1.0);
}

+ (id)drmResourceUsageConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 1, 86400.0, 1.0);
}

+ (id)drmRogueTaskConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 1, 0.0, 1.0);
}

+ (id)caHitchesConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 12, 3600.0, 1.0);
}

+ (id)watchdogdDefaultConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 1, 86400.0, 1.0);
}

+ (id)ppsArchiveConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 39600.0, 1.0);
}

+ (id)ppsCEArchiveConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 39600.0, 1.0);
}

+ (id)ppsXCArchiveConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 39600.0, 1.0);
}

+ (id)rapidMicroDiagnosticsConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 43200.0, 1.0);
}

+ (id)ppsSafeguardArchiveConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 39600.0, 1.0);
}

+ (id)ppsBGArchiveConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 39600.0, 1.0);
}

+ (id)nandAutoGBBSweepConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 10, 0.0, 1.0);
}

+ (id)mailIssueCategoryConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 5, 600.0, 1.0);
}

+ (id)sqlQueryPerformanceConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 43200.0, 1.0);
}

+ (id)RMEIssueCategoryConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 12, 600.0, 1.0);
}

+ (id)abcDefaultConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 50, 0.0, 1.0);
}

+ (id)newsConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 1, 0.0, 1.0);
}

+ (id)libtraceQuarantineConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 10, 0.0, 1.0);
}

+ (id)libtraceLoggingSampleConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 2, 43200.0, 1.0);
}

+ (id)spotlightInternalWatchdogConfiguration
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 10, 0.0, 1.0);
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (unint64_t)countCap
{
  return self->_countCap;
}

- (void)setCountCap:(unint64_t)a3
{
  self->_countCap = a3;
}

- (double)acceptanceRate
{
  return self->_acceptanceRate;
}

- (void)setAcceptanceRate:(double)a3
{
  self->_acceptanceRate = a3;
}

@end
