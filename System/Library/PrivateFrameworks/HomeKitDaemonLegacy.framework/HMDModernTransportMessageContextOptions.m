@implementation HMDModernTransportMessageContextOptions

- (HMDModernTransportMessageContextOptions)initWithBuilder:(id)a3
{
  id v4;
  HMDModernTransportMessageContextOptions *v5;
  uint64_t v6;
  NSSet *transports;
  double v8;
  double v9;
  uint64_t v10;
  NSString *requestStartTimeHeaderKey;
  uint64_t v12;
  NSString *timeToLiveHeaderKey;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDModernTransportMessageContextOptions;
  v5 = -[HMDModernTransportMessageContextOptions init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "transports");
    v6 = objc_claimAutoreleasedReturnValue();
    transports = v5->_transports;
    v5->_transports = (NSSet *)v6;

    objc_msgSend(v4, "timeoutOverride");
    v5->_timeoutOverride = v8;
    objc_msgSend(v4, "timeToLive");
    v5->_timeToLive = v9;
    v5->_expectsMultipleResponses = objc_msgSend(v4, "expectsMultipleResponses");
    v5->_expectRapportSuccess = objc_msgSend(v4, "expectRapportSuccess");
    v5->_trackingDeviceReachability = objc_msgSend(v4, "trackingDeviceReachability");
    objc_msgSend(v4, "requestStartTimeHeaderKey");
    v10 = objc_claimAutoreleasedReturnValue();
    requestStartTimeHeaderKey = v5->_requestStartTimeHeaderKey;
    v5->_requestStartTimeHeaderKey = (NSString *)v10;

    objc_msgSend(v4, "timeToLiveHeaderKey");
    v12 = objc_claimAutoreleasedReturnValue();
    timeToLiveHeaderKey = v5->_timeToLiveHeaderKey;
    v5->_timeToLiveHeaderKey = (NSString *)v12;

  }
  return v5;
}

- (NSSet)transports
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (double)timeoutOverride
{
  return self->_timeoutOverride;
}

- (double)timeToLive
{
  return self->_timeToLive;
}

- (BOOL)expectsMultipleResponses
{
  return self->_expectsMultipleResponses;
}

- (BOOL)isTrackingDeviceReachability
{
  return self->_trackingDeviceReachability;
}

- (NSString)requestStartTimeHeaderKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)timeToLiveHeaderKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)expectRapportSuccess
{
  return self->_expectRapportSuccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToLiveHeaderKey, 0);
  objc_storeStrong((id *)&self->_requestStartTimeHeaderKey, 0);
  objc_storeStrong((id *)&self->_transports, 0);
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, HMDModernTransportMessageContextOptionsBuilder *);
  HMDModernTransportMessageContextOptionsBuilder *v4;
  HMDModernTransportMessageContextOptions *v5;

  v3 = (void (**)(id, HMDModernTransportMessageContextOptionsBuilder *))a3;
  v4 = objc_alloc_init(HMDModernTransportMessageContextOptionsBuilder);
  v3[2](v3, v4);

  v5 = -[HMDModernTransportMessageContextOptions initWithBuilder:]([HMDModernTransportMessageContextOptions alloc], "initWithBuilder:", v4);
  return v5;
}

@end
