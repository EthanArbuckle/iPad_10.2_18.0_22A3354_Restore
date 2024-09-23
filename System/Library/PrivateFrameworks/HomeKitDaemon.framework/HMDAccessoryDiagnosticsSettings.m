@implementation HMDAccessoryDiagnosticsSettings

- (HMDAccessoryDiagnosticsSettings)initWithService:(id)a3
{
  id v5;
  HMDAccessoryDiagnosticsSettings *v6;
  HMDAccessoryDiagnosticsSettings *v7;
  NSString *transport;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryDiagnosticsSettings;
  v6 = -[HMDAccessoryDiagnosticsSettings init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diagnosticsService, a3);
    transport = v7->_transport;
    v7->_transport = (NSString *)CFSTR("DataStream");

  }
  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDiagnosticsSettings transport](self, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("transport"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDService)diagnosticsService
{
  return (HMDService *)objc_getProperty(self, a2, 8, 1);
}

- (HAPSupportedDiagnosticsSnapshot)currentSnapshot
{
  return (HAPSupportedDiagnosticsSnapshot *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentSnapshot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)transport
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_diagnosticsService, 0);
}

@end
