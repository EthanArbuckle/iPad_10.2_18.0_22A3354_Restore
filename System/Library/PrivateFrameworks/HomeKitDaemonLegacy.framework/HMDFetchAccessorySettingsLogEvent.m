@implementation HMDFetchAccessorySettingsLogEvent

- (HMDFetchAccessorySettingsLogEvent)initWithKeyPaths:(id)a3 startTime:(unint64_t)a4 requestingClientName:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMDFetchAccessorySettingsLogEvent *v13;
  HMDFetchAccessorySettingsLogEvent *v14;
  uint64_t v15;
  NSArray *keyPaths;
  uint64_t v17;
  NSString *requestingClientName;
  NSArray *succeededKeyPaths;
  NSArray *v20;
  NSArray *failedKeyPaths;
  objc_super v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDFetchAccessorySettingsLogEvent;
  v13 = -[HMMLogEvent init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    -[HMMLogEvent setError:](v13, "setError:", v12);
    v15 = objc_msgSend(v10, "copy");
    keyPaths = v14->_keyPaths;
    v14->_keyPaths = (NSArray *)v15;

    v14->_startTimeStamp = a4;
    v17 = objc_msgSend(v11, "copy");
    requestingClientName = v14->_requestingClientName;
    v14->_requestingClientName = (NSString *)v17;

    succeededKeyPaths = v14->_succeededKeyPaths;
    v20 = (NSArray *)MEMORY[0x1E0C9AA60];
    v14->_succeededKeyPaths = (NSArray *)MEMORY[0x1E0C9AA60];

    failedKeyPaths = v14->_failedKeyPaths;
    v14->_failedKeyPaths = v20;

  }
  return v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.accessorySettings.fetch");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 9);
  -[HMMLogEvent error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorCode"));

    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorDomain"));

  }
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFetchAccessorySettingsLogEvent keyPaths](self, "keyPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intervalForValue:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("keyPathCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFetchAccessorySettingsLogEvent failedKeyPaths](self, "failedKeyPaths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intervalForValue:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "start");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("failedKeyPaths"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFetchAccessorySettingsLogEvent succeededKeyPaths](self, "succeededKeyPaths");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "intervalForValue:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "start");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("succeededKeyPaths"));

  if (-[HMDFetchAccessorySettingsLogEvent responseTimeStamp](self, "responseTimeStamp"))
  {
    v20 = -[HMDFetchAccessorySettingsLogEvent responseTimeStamp](self, "responseTimeStamp");
    v21 = v20 - -[HMDFetchAccessorySettingsLogEvent startTimeStamp](self, "startTimeStamp");
  }
  else
  {
    v21 = 0;
  }
  +[HMDLogEventHistograms latencyHistogram](HMDLogEventHistograms, "latencyHistogram");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "intervalForValue:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "start");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("responseTime"));

  -[HMDFetchAccessorySettingsLogEvent requestingClientName](self, "requestingClientName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("requestingClientName"));

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSArray)failedKeyPaths
{
  return self->_failedKeyPaths;
}

- (void)setFailedKeyPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)succeededKeyPaths
{
  return self->_succeededKeyPaths;
}

- (void)setSucceededKeyPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)responseTimeStamp
{
  return self->_responseTimeStamp;
}

- (void)setResponseTimeStamp:(unint64_t)a3
{
  self->_responseTimeStamp = a3;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (unint64_t)startTimeStamp
{
  return self->_startTimeStamp;
}

- (NSString)requestingClientName
{
  return self->_requestingClientName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingClientName, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_succeededKeyPaths, 0);
  objc_storeStrong((id *)&self->_failedKeyPaths, 0);
}

@end
