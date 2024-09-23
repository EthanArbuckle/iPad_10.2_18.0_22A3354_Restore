@implementation CDMWarmupResponseCommand

- (int64_t)serviceState
{
  return self->_serviceState;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (CDMWarmupResponseCommand)initWithServiceState:(int64_t)a3 serviceName:(id)a4
{
  id v6;
  CDMWarmupResponseCommand *v7;
  CDMWarmupResponseCommand *v8;
  uint64_t v9;
  NSString *serviceName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMWarmupResponseCommand;
  v7 = -[CDMBaseCommand init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_serviceState = a3;
    v9 = objc_msgSend(v6, "copy");
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v9;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
