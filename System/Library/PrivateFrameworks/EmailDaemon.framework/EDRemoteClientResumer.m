@implementation EDRemoteClientResumer

- (EDRemoteClientResumer)initWithRemoteClient:(id)a3
{
  id v4;
  EDRemoteClientResumer *v5;
  EDRemoteClientResumer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDRemoteClientResumer;
  v5 = -[EDRemoteClientResumer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_remoteClient, v4);

  return v6;
}

- (void)resumeForUpdates
{
  void *v2;
  id v3;

  -[EDRemoteClientResumer remoteClient](self, "remoteClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientResumer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeForUpdates");

}

- (EDRemoteClient)remoteClient
{
  return (EDRemoteClient *)objc_loadWeakRetained((id *)&self->_remoteClient);
}

- (void)setRemoteClient:(id)a3
{
  objc_storeWeak((id *)&self->_remoteClient, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteClient);
}

@end
