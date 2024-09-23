@implementation MXMProxyProbe

- (MXMProxyProbe)initWithProxyMetric:(id)a3
{
  id v5;
  MXMProxyProbe *v6;
  MXMProxyProbe *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMProxyProbe;
  v6 = -[MXMProbe init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proxyMetric, a3);

  return v7;
}

- (MXMProxyProbe)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MXMProxyProbe *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metric"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MXMProxyProbe initWithProxyMetric:](self, "initWithProxyMetric:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MXMProxyProbe proxyMetric](self, "proxyMetric");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("metric"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3 stopHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("updateNowUntilStoppedWithUpdateHandler:stopHandler: is not implemented on MXMProxyProbe"), 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4
{
  void *v7;
  void *v8;
  void *v9;

  +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMProxyProbe proxyMetric](self, "proxyMetric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_sampleWithProxyMetric:timeout:stopReason:", v8, a4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MXMProxyMetric)proxyMetric
{
  return (MXMProxyMetric *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyMetric, 0);
}

@end
