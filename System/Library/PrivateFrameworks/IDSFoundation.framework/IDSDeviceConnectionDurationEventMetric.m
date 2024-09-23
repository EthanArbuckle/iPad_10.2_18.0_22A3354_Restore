@implementation IDSDeviceConnectionDurationEventMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSDeviceConnectionDuration");
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (IDSDeviceConnectionDurationEventMetric)initWithService:(id)a3 wasSuccessful:(BOOL)a4 clientInitTime:(id)a5 clientOpenSocketCompletionTime:(id)a6 daemonOpenSocketTime:(id)a7 daemonOpenSocketCompletionTime:(id)a8 firstPacketReceiveTime:(id)a9 connectionInitTime:(id)a10
{
  id v16;
  id v17;
  IDSDeviceConnectionDurationEventMetric *v18;
  IDSDeviceConnectionDurationEventMetric *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v16 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)IDSDeviceConnectionDurationEventMetric;
  v18 = -[IDSDeviceConnectionDurationEventMetric init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_serviceName, a3);
    v19->_wasSuccessful = a4;
    objc_storeStrong((id *)&v19->_clientInitTime, a5);
    objc_storeStrong((id *)&v19->_clientOpenSocketCompletionTime, a6);
    objc_storeStrong((id *)&v19->_daemonOpenSocketTime, a7);
    objc_storeStrong((id *)&v19->_daemonOpenSocketCompletionTime, a8);
    objc_storeStrong((id *)&v19->_firstPacketReceiveTime, a9);
    objc_storeStrong((id *)&v19->_connectionInitTime, a10);
  }

  return v19;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (NSNumber)clientInitTime
{
  return self->_clientInitTime;
}

- (NSNumber)clientOpenSocketCompletionTime
{
  return self->_clientOpenSocketCompletionTime;
}

- (NSNumber)daemonOpenSocketTime
{
  return self->_daemonOpenSocketTime;
}

- (NSNumber)daemonOpenSocketCompletionTime
{
  return self->_daemonOpenSocketCompletionTime;
}

- (NSNumber)firstPacketReceiveTime
{
  return self->_firstPacketReceiveTime;
}

- (NSNumber)connectionInitTime
{
  return self->_connectionInitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInitTime, 0);
  objc_storeStrong((id *)&self->_firstPacketReceiveTime, 0);
  objc_storeStrong((id *)&self->_daemonOpenSocketCompletionTime, 0);
  objc_storeStrong((id *)&self->_daemonOpenSocketTime, 0);
  objc_storeStrong((id *)&self->_clientOpenSocketCompletionTime, 0);
  objc_storeStrong((id *)&self->_clientInitTime, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
