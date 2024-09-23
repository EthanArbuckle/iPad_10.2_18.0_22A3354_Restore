@implementation MSSetupFailedEvent

- (MSSetupFailedEvent)initWithErrorNamed:(id)a3
{
  id v4;
  MSSetupFailedEvent *v5;
  MSSetupFailedEvent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSSetupFailedEvent;
  v5 = -[MSBaseSetupEvent init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MSBaseSetupEvent setEventName:](v5, "setEventName:", CFSTR("com.apple.cloudmediaservices.setupfailed"));
    -[MSSetupFailedEvent setErrorName:](v6, "setErrorName:", v4);
  }

  return v6;
}

- (id)encoded
{
  __CFString *serviceID;
  NSString *errorName;
  void *v4;
  __CFString *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  serviceID = (__CFString *)self->_serviceID;
  if (!serviceID)
    serviceID = &stru_24DBD5D08;
  v8[0] = CFSTR("service");
  v8[1] = CFSTR("errorName");
  errorName = self->_errorName;
  v9[0] = serviceID;
  v9[1] = errorName;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = serviceID;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceID, a3);
}

- (NSString)errorName
{
  return self->_errorName;
}

- (void)setErrorName:(id)a3
{
  objc_storeStrong((id *)&self->_errorName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end
