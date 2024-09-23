@implementation HMDCloudShareTrustManagerFailureLogEvent

- (HMDCloudShareTrustManagerFailureLogEvent)initWithTrustManagerErrorCode:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  HMDCloudShareTrustManagerFailureLogEvent *v8;
  uint64_t v9;
  NSNumber *trustManagerErrorCode;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDCloudShareTrustManagerFailureLogEvent *v17;
  SEL v18;
  objc_super v19;

  v6 = a4;
  if (v6)
  {
    v7 = v6;
    v19.receiver = self;
    v19.super_class = (Class)HMDCloudShareTrustManagerFailureLogEvent;
    v8 = -[HMMLogEvent init](&v19, sel_init);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      trustManagerErrorCode = v8->_trustManagerErrorCode;
      v8->_trustManagerErrorCode = (NSNumber *)v9;

      objc_msgSend(v7, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[HMMLogEvent setError:](v8, "setError:", v7);
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = objc_msgSend(v7, "code");
        objc_msgSend(v7, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("<No Domain>"), v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMLogEvent setError:](v8, "setError:", v15);

      }
    }

    return v8;
  }
  else
  {
    v17 = (HMDCloudShareTrustManagerFailureLogEvent *)_HMFPreconditionFailure();
    return (HMDCloudShareTrustManagerFailureLogEvent *)-[HMDCloudShareTrustManagerFailureLogEvent coreAnalyticsEventName](v17, v18);
  }
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.trustManager.failure");
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
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("trustManagerErrorCode");
  -[HMDCloudShareTrustManagerFailureLogEvent trustManagerErrorCode](self, "trustManagerErrorCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("errorCode");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMMLogEvent error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("errorDomain");
  -[HMMLogEvent error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSNumber)trustManagerErrorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustManagerErrorCode, 0);
}

@end
