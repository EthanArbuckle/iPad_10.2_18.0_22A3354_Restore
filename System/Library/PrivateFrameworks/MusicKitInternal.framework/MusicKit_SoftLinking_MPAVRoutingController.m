@implementation MusicKit_SoftLinking_MPAVRoutingController

- (MusicKit_SoftLinking_MPAVRoutingController)init
{
  MusicKit_SoftLinking_MPAVRoutingController *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  MPAVRoutingController *underlyingRoutingController;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPAVRoutingController;
  v2 = -[MusicKit_SoftLinking_MPAVRoutingController init](&v11, sel_init);
  if (v2)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v3 = (void *)getMPAVEndpointRoutingDataSourceClass_softClass;
    v20 = getMPAVEndpointRoutingDataSourceClass_softClass;
    if (!getMPAVEndpointRoutingDataSourceClass_softClass)
    {
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __getMPAVEndpointRoutingDataSourceClass_block_invoke;
      v15 = &unk_1E9C05688;
      v16 = &v17;
      __getMPAVEndpointRoutingDataSourceClass_block_invoke((uint64_t)&v12);
      v3 = (void *)v18[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v17, 8);
    v5 = objc_alloc_init(v4);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v6 = (void *)getMPAVRoutingControllerClass_softClass_0;
    v20 = getMPAVRoutingControllerClass_softClass_0;
    if (!getMPAVRoutingControllerClass_softClass_0)
    {
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __getMPAVRoutingControllerClass_block_invoke_0;
      v15 = &unk_1E9C05688;
      v16 = &v17;
      __getMPAVRoutingControllerClass_block_invoke_0((uint64_t)&v12);
      v6 = (void *)v18[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v17, 8);
    v8 = objc_msgSend([v7 alloc], "initWithDataSource:name:", v5, CFSTR("MusicKitInternal.InternalMusicPlayer"));
    underlyingRoutingController = v2->_underlyingRoutingController;
    v2->_underlyingRoutingController = (MPAVRoutingController *)v8;

    -[MPAVRoutingController setDelegate:](v2->_underlyingRoutingController, "setDelegate:", v2);
  }
  return v2;
}

- (void)beginRouteDiscovery
{
  -[MPAVRoutingController setDiscoveryMode:](self->_underlyingRoutingController, "setDiscoveryMode:", 2);
}

- (void)endRouteDiscovery
{
  -[MPAVRoutingController setDiscoveryMode:](self->_underlyingRoutingController, "setDiscoveryMode:", 0);
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__MusicKit_SoftLinking_MPAVRoutingController_routingControllerAvailableRoutesDidChange___block_invoke;
  v5[3] = &unk_1E9C05B10;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "fetchAvailableRoutesWithCompletionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_handleRoutesDidChange:(id)a3
{
  id v4;
  void (**routesDidUpdate)(void);
  id v6;

  v4 = a3;
  routesDidUpdate = (void (**)(void))self->_routesDidUpdate;
  if (routesDidUpdate)
  {
    v6 = v4;
    routesDidUpdate[2]();
    v4 = v6;
  }

}

- (id)routesDidUpdate
{
  return self->_routesDidUpdate;
}

- (void)setRoutesDidUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_routesDidUpdate, 0);
  objc_storeStrong((id *)&self->_underlyingRoutingController, 0);
}

@end
