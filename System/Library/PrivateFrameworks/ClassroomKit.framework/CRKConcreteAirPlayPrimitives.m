@implementation CRKConcreteAirPlayPrimitives

- (CRKConcreteAirPlayPrimitives)initWithOutputContext:(id)a3 notificationCenter:(id)a4
{
  id v7;
  id v8;
  CRKConcreteAirPlayPrimitives *v9;
  CRKConcreteAirPlayPrimitives *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKConcreteAirPlayPrimitives;
  v9 = -[CRKConcreteAirPlayPrimitives init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputContext, a3);
    objc_storeStrong((id *)&v10->_notificationCenter, a4);
  }

  return v10;
}

- (CRKOutputDevice)localOutputDevice
{
  CRKConcreteOutputDevice *v3;
  void *v4;
  void *v5;
  CRKConcreteOutputDevice *v6;

  v3 = [CRKConcreteOutputDevice alloc];
  objc_msgSend(MEMORY[0x24BDB25E0], "sharedLocalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteAirPlayPrimitives outputContext](self, "outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKConcreteOutputDevice initWithOutputDevice:outputContext:](v3, "initWithOutputDevice:outputContext:", v4, v5);

  return (CRKOutputDevice *)v6;
}

- (CRKOutputDevice)currentOutputDevice
{
  CRKConcreteOutputDevice *v3;
  void *v4;
  void *v5;
  void *v6;
  CRKConcreteOutputDevice *v7;

  v3 = [CRKConcreteOutputDevice alloc];
  -[CRKConcreteAirPlayPrimitives outputContext](self, "outputContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteAirPlayPrimitives outputContext](self, "outputContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKConcreteOutputDevice initWithOutputDevice:outputContext:](v3, "initWithOutputDevice:outputContext:", v5, v6);

  return (CRKOutputDevice *)v7;
}

- (id)observeCurrentOutputDeviceChangesWithHandler:(id)a3
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
  -[CRKConcreteAirPlayPrimitives notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDB1F00];
  -[CRKConcreteAirPlayPrimitives outputContext](self, "outputContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__CRKConcreteAirPlayPrimitives_observeCurrentOutputDeviceChangesWithHandler___block_invoke;
  v11[3] = &unk_24D9C7130;
  v12 = v4;
  v8 = v4;
  +[CRKNotificationObservation observationWithNotificationCenter:notificationName:object:notificationHandler:](CRKNotificationObservation, "observationWithNotificationCenter:notificationName:object:notificationHandler:", v5, v6, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __77__CRKConcreteAirPlayPrimitives_observeCurrentOutputDeviceChangesWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)beginOutputDeviceBrowsingSession
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKConcreteAirPlayPrimitives outputContext](self, "outputContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteAirPlayPrimitives notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKConcreteOutputDeviceBrowsingSession sessionWithOutputContext:notificationCenter:](CRKConcreteOutputDeviceBrowsingSession, "sessionWithOutputContext:notificationCenter:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
}

@end
