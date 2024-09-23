@implementation APKOutputDeviceDiscoverySession

- (APKOutputDeviceDiscoverySession)init
{
  APKOutputDeviceDiscoverySession *v2;
  uint64_t v3;
  AVOutputDeviceDiscoverySession *session;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APKOutputDeviceDiscoverySession;
  v2 = -[APKOutputDeviceDiscoverySession init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDB25F0]), "initWithDeviceFeatures:", 8);
    session = v2->_session;
    v2->_session = (AVOutputDeviceDiscoverySession *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[APKOutputDeviceDiscoverySession deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)APKOutputDeviceDiscoverySession;
  -[APKOutputDeviceDiscoverySession dealloc](&v3, sel_dealloc);
}

- (NSArray)availableOutputDevices
{
  void *v2;
  void *v3;

  -[APKOutputDeviceDiscoverySession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)activate
{
  id v2;

  -[APKOutputDeviceDiscoverySession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoveryMode:", 2);

}

- (void)deactivate
{
  id v2;

  -[APKOutputDeviceDiscoverySession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoveryMode:", 0);

}

- (AVOutputDeviceDiscoverySession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
