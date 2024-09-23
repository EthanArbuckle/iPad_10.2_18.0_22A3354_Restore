@implementation HMDAudioAnalysisEventBulletinNotificationRegistrationRemote

- (HMDAudioAnalysisEventBulletinNotificationRegistrationRemote)initWithAudioAnalysisEventBulletinNotificationRegistration:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  HMDAudioAnalysisEventBulletinNotificationRegistrationRemote *v9;
  HMDAudioAnalysisEventBulletinNotificationRegistrationRemote *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistrationRemote;
  v9 = -[HMDAudioAnalysisEventBulletinNotificationRegistrationRemote init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_registration, a3);
    objc_storeStrong((id *)&v10->_source, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAudioAnalysisEventBulletinNotificationRegistrationRemote registration](self, "registration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("registration"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAudioAnalysisEventBulletinNotificationRegistrationRemote source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("source"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)registration
{
  return (HMDAudioAnalysisEventBulletinNotificationRegistration *)objc_getProperty(self, a2, 8, 1);
}

- (HMDBulletinNotificationRegistrationSource)source
{
  return (HMDBulletinNotificationRegistrationSource *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

@end
