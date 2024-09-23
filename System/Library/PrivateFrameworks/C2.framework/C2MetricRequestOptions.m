@implementation C2MetricRequestOptions

- (NSString)_sourceApplicationSecondaryIdentifier
{
  return self->__sourceApplicationSecondaryIdentifier;
}

- (unsigned)_allowsPowerNapScheduling
{
  return self->__allowsPowerNapScheduling;
}

- (unsigned)_allowsExpensiveAccess
{
  return self->__allowsExpensiveAccess;
}

- (C2MetricOptions)metricOptions
{
  return self->_metricOptions;
}

- (NSString)_sourceApplicationBundleIdentifier
{
  return self->__sourceApplicationBundleIdentifier;
}

- (void)set_allowsPowerNapScheduling:(unsigned __int8)a3
{
  self->__allowsPowerNapScheduling = a3;
}

- (void)set_allowsExpensiveAccess:(unsigned __int8)a3
{
  self->__allowsExpensiveAccess = a3;
}

- (void)setAllowsCellularAccess:(unsigned __int8)a3
{
  self->_allowsCellularAccess = a3;
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__sourceApplicationSecondaryIdentifier, a3);
}

- (void)set_sourceApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__sourceApplicationBundleIdentifier, a3);
}

- (void)setMetricUUID:(id)a3
{
  objc_storeStrong((id *)&self->_metricUUID, a3);
}

- (void)setMetricOptions:(id)a3
{
  objc_storeStrong((id *)&self->_metricOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricOptions, 0);
  objc_storeStrong((id *)&self->_metricUUID, 0);
  objc_storeStrong((id *)&self->__sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->__sourceApplicationBundleIdentifier, 0);
}

- (C2MetricRequestOptions)initWithRequestOptions:(id)a3
{
  id v4;
  C2MetricRequestOptions *v5;
  uint64_t v6;
  NSString *sourceApplicationBundleIdentifier;
  uint64_t v8;
  NSString *sourceApplicationSecondaryIdentifier;
  uint64_t v10;
  C2MetricOptions *metricOptions;

  v4 = a3;
  v5 = -[C2MetricRequestOptions init](self, "init");
  if (v5)
  {
    v5->_allowsCellularAccess = objc_msgSend(v4, "allowsCellularAccess");
    v5->__allowsExpensiveAccess = objc_msgSend(v4, "_allowsExpensiveAccess");
    v5->__allowsPowerNapScheduling = objc_msgSend(v4, "_allowsPowerNapScheduling");
    objc_msgSend(v4, "_sourceApplicationBundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    sourceApplicationBundleIdentifier = v5->__sourceApplicationBundleIdentifier;
    v5->__sourceApplicationBundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "_sourceApplicationSecondaryIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    sourceApplicationSecondaryIdentifier = v5->__sourceApplicationSecondaryIdentifier;
    v5->__sourceApplicationSecondaryIdentifier = (NSString *)v8;

    v5->_privacyProxyFailClosedOverride = (NSNumber *)(id)objc_msgSend(v4, "privacyProxyFailClosedOverride");
    v5->_useNWLoaderOverride = (NSNumber *)(id)objc_msgSend(v4, "useNWLoaderOverride");
    objc_msgSend(v4, "metricOptions");
    v10 = objc_claimAutoreleasedReturnValue();
    metricOptions = v5->_metricOptions;
    v5->_metricOptions = (C2MetricOptions *)v10;

  }
  return v5;
}

- (C2MetricRequestOptions)init
{
  C2MetricRequestOptions *v2;
  C2MetricRequestOptions *v3;
  NSString *sourceApplicationBundleIdentifier;
  NSString *sourceApplicationSecondaryIdentifier;
  uint64_t v6;
  NSUUID *metricUUID;
  C2MetricOptions *metricOptions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)C2MetricRequestOptions;
  v2 = -[C2MetricRequestOptions init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_allowsCellularAccess = 257;
    v2->__allowsPowerNapScheduling = 1;
    sourceApplicationBundleIdentifier = v2->__sourceApplicationBundleIdentifier;
    v2->__sourceApplicationBundleIdentifier = 0;

    sourceApplicationSecondaryIdentifier = v3->__sourceApplicationSecondaryIdentifier;
    v3->__sourceApplicationSecondaryIdentifier = 0;

    v3->_privacyProxyFailClosedOverride = 0;
    v3->_useNWLoaderOverride = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    metricUUID = v3->_metricUUID;
    v3->_metricUUID = (NSUUID *)v6;

    metricOptions = v3->_metricOptions;
    v3->_metricOptions = 0;

  }
  return v3;
}

- (NSUUID)metricUUID
{
  return self->_metricUUID;
}

- (id)metricRequestTransportOptions
{
  C2RequestOptions *v3;

  v3 = objc_alloc_init(C2RequestOptions);
  -[C2RequestOptions setMetricRequest:](v3, "setMetricRequest:", 1);
  -[C2RequestOptions setMetricOptions:](v3, "setMetricOptions:", 0);
  -[C2RequestOptions setOutOfProcessPoolName:](v3, "setOutOfProcessPoolName:", 0);
  -[C2RequestOptions setQualityOfService:](v3, "setQualityOfService:", 17);
  -[C2RequestOptions set_appleIDContextSessionIdentifier:](v3, "set_appleIDContextSessionIdentifier:", 0);
  -[C2RequestOptions setTlsPinning:](v3, "setTlsPinning:", 1);
  -[C2RequestOptions setDiscretionaryNetworkBehavior:](v3, "setDiscretionaryNetworkBehavior:", 0);
  -[C2RequestOptions set_allowsRetryForBackgroundDataTasks:](v3, "set_allowsRetryForBackgroundDataTasks:", 0);
  -[C2RequestOptions set_timeoutIntervalForResource:](v3, "set_timeoutIntervalForResource:", 30.0);
  -[C2RequestOptions setAllowsCellularAccess:](v3, "setAllowsCellularAccess:", self->_allowsCellularAccess != 0);
  -[C2RequestOptions set_allowsExpensiveAccess:](v3, "set_allowsExpensiveAccess:", self->__allowsExpensiveAccess != 0);
  -[C2RequestOptions set_allowsPowerNapScheduling:](v3, "set_allowsPowerNapScheduling:", self->__allowsPowerNapScheduling != 0);
  -[C2RequestOptions set_sourceApplicationBundleIdentifier:](v3, "set_sourceApplicationBundleIdentifier:", self->__sourceApplicationBundleIdentifier);
  -[C2RequestOptions set_sourceApplicationSecondaryIdentifier:](v3, "set_sourceApplicationSecondaryIdentifier:", self->__sourceApplicationSecondaryIdentifier);
  -[C2RequestOptions setPrivacyProxyFailClosedOverride:](v3, "setPrivacyProxyFailClosedOverride:", self->_privacyProxyFailClosedOverride);
  -[C2RequestOptions setUseNWLoaderOverride:](v3, "setUseNWLoaderOverride:", self->_useNWLoaderOverride);
  -[C2RequestOptions setMetricOptions:](v3, "setMetricOptions:", self->_metricOptions);
  return v3;
}

- (unsigned)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  return self->_privacyProxyFailClosedOverride;
}

- (void)setPrivacyProxyFailClosedOverride:(id)a3
{
  self->_privacyProxyFailClosedOverride = (NSNumber *)a3;
}

- (NSNumber)useNWLoaderOverride
{
  return self->_useNWLoaderOverride;
}

- (void)setUseNWLoaderOverride:(id)a3
{
  self->_useNWLoaderOverride = (NSNumber *)a3;
}

@end
