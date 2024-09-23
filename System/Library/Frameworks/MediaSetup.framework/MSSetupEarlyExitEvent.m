@implementation MSSetupEarlyExitEvent

- (MSSetupEarlyExitEvent)initWithExitReason:(id)a3 didEncounterError:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MSSetupEarlyExitEvent *v7;
  MSSetupEarlyExitEvent *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSSetupEarlyExitEvent;
  v7 = -[MSBaseSetupEvent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MSBaseSetupEvent setEventName:](v7, "setEventName:", CFSTR("com.apple.cloudmediaservices.setupearlyexit"));
    -[MSSetupEarlyExitEvent setExitReason:](v8, "setExitReason:", v6);
    -[MSSetupEarlyExitEvent setDidEncounterError:](v8, "setDidEncounterError:", v4);
  }

  return v8;
}

- (id)encoded
{
  __CFString *serviceID;
  NSString *exitReason;
  void *v4;
  _BOOL8 didEncounterError;
  __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  serviceID = (__CFString *)self->_serviceID;
  if (!serviceID)
    serviceID = &stru_24DBD5D08;
  exitReason = self->_exitReason;
  v10[0] = CFSTR("service");
  v10[1] = CFSTR("exitReason");
  v11[0] = serviceID;
  v11[1] = exitReason;
  v10[2] = CFSTR("didEncounterError");
  v4 = (void *)MEMORY[0x24BDD16E0];
  didEncounterError = self->_didEncounterError;
  v6 = serviceID;
  objc_msgSend(v4, "numberWithBool:", didEncounterError);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceID, a3);
}

- (NSString)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(id)a3
{
  objc_storeStrong((id *)&self->_exitReason, a3);
}

- (BOOL)didEncounterError
{
  return self->_didEncounterError;
}

- (void)setDidEncounterError:(BOOL)a3
{
  self->_didEncounterError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReason, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end
