@implementation CRKConcreteOutputDeviceBrowsingSession

- (CRKConcreteOutputDeviceBrowsingSession)initWithDiscoverySession:(id)a3 outputContext:(id)a4 notificationCenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKConcreteOutputDeviceBrowsingSession *v12;
  CRKConcreteOutputDeviceBrowsingSession *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRKConcreteOutputDeviceBrowsingSession;
  v12 = -[CRKConcreteOutputDeviceBrowsingSession init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_discoverySession, a3);
    objc_storeStrong((id *)&v13->_outputContext, a4);
    objc_storeStrong((id *)&v13->_notificationCenter, a5);
  }

  return v13;
}

+ (id)sessionWithOutputContext:(id)a3 notificationCenter:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDB25F0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithDeviceFeatures:", 2);
  objc_msgSend(v9, "setDiscoveryMode:", 2);
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDiscoverySession:outputContext:notificationCenter:", v9, v8, v7);

  return v10;
}

- (NSArray)outputDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  -[CRKConcreteOutputDeviceBrowsingSession discoverySession](self, "discoverySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableOutputDevicesObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "recentlyUsedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__CRKConcreteOutputDeviceBrowsingSession_outputDevices__block_invoke;
  v12[3] = &unk_24D9CAAF8;
  v12[4] = self;
  objc_msgSend(v9, "crk_mapUsingBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

CRKConcreteOutputDevice *__55__CRKConcreteOutputDeviceBrowsingSession_outputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CRKConcreteOutputDevice *v4;
  void *v5;
  CRKConcreteOutputDevice *v6;

  v3 = a2;
  v4 = [CRKConcreteOutputDevice alloc];
  objc_msgSend(*(id *)(a1 + 32), "outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKConcreteOutputDevice initWithOutputDevice:outputContext:](v4, "initWithOutputDevice:outputContext:", v3, v5);

  return v6;
}

- (id)observeBrowsedOutputDeviceChangesWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[CRKConcreteOutputDeviceBrowsingSession notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDB1F38];
  -[CRKConcreteOutputDeviceBrowsingSession discoverySession](self, "discoverySession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__CRKConcreteOutputDeviceBrowsingSession_observeBrowsedOutputDeviceChangesWithHandler___block_invoke;
  v11[3] = &unk_24D9C7130;
  v12 = v4;
  v8 = v4;
  +[CRKNotificationObservation observationWithNotificationCenter:notificationName:object:notificationHandler:](CRKNotificationObservation, "observationWithNotificationCenter:notificationName:object:notificationHandler:", v5, v6, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __87__CRKConcreteOutputDeviceBrowsingSession_observeBrowsedOutputDeviceChangesWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v2;

  -[CRKConcreteOutputDeviceBrowsingSession discoverySession](self, "discoverySession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoveryMode:", 0);

}

- (AVOutputDeviceDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
}

@end
