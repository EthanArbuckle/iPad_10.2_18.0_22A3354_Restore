@implementation MSSetupCompleteEvent

- (MSSetupCompleteEvent)init
{
  MSSetupCompleteEvent *v2;
  MSSetupCompleteEvent *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSSetupCompleteEvent;
  v2 = -[MSBaseSetupEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSBaseSetupEvent setEventName:](v2, "setEventName:", CFSTR("com.apple.cloudmediaservices.setupcompleted"));
    v4 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    -[MSSetupCompleteEvent setStartTime:](v3, "setStartTime:", v4);

    -[MSSetupCompleteEvent setNumberOfHomeAdded:](v3, "setNumberOfHomeAdded:", 0);
    -[MSSetupCompleteEvent setNumberOfHomesWithVR:](v3, "setNumberOfHomesWithVR:", 0);
    -[MSSetupCompleteEvent setDidSwitchAccount:](v3, "setDidSwitchAccount:", 0);
  }
  return v3;
}

- (void)addHome:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MSSetupCompleteEvent setNumberOfHomeAdded:](self, "setNumberOfHomeAdded:", -[MSSetupCompleteEvent numberOfHomeAdded](self, "numberOfHomeAdded") + 1);
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "currentUser");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "ms_voiceRecognitionEnabledInHome:", v4);

  objc_msgSend(v5, "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSSetupCompleteEvent setNumberOfHomesWithVR:](self, "setNumberOfHomesWithVR:", -[MSSetupCompleteEvent numberOfHomesWithVR](self, "numberOfHomesWithVR") + (int)objc_msgSend(v7, "intValue"));

}

- (id)encoded
{
  double v3;
  void *v4;
  NSString *serviceID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  -[NSDate timeIntervalSinceDate:](self->_endTime, "timeIntervalSinceDate:", self->_startTime);
  *(float *)&v3 = v3;
  v11[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  serviceID = self->_serviceID;
  v12[0] = v4;
  v12[1] = serviceID;
  v11[1] = CFSTR("service");
  v11[2] = CFSTR("numberOfHomesAdded");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numberOfHomeAdded);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("numberOfHomesWithVR");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numberOfHomesWithVR);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  v11[4] = CFSTR("didSwitchAccount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didSwitchAccount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceID, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (unint64_t)numberOfHomesWithVR
{
  return self->_numberOfHomesWithVR;
}

- (void)setNumberOfHomesWithVR:(unint64_t)a3
{
  self->_numberOfHomesWithVR = a3;
}

- (unint64_t)numberOfHomeAdded
{
  return self->_numberOfHomeAdded;
}

- (void)setNumberOfHomeAdded:(unint64_t)a3
{
  self->_numberOfHomeAdded = a3;
}

- (BOOL)didSwitchAccount
{
  return self->_didSwitchAccount;
}

- (void)setDidSwitchAccount:(BOOL)a3
{
  self->_didSwitchAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end
