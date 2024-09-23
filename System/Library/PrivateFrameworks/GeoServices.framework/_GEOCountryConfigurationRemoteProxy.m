@implementation _GEOCountryConfigurationRemoteProxy

- (_GEOCountryConfigurationRemoteProxy)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  _GEOCountryConfigurationRemoteProxy *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  _GEOCountryConfigurationRemoteProxy *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEOCountryConfigurationRemoteProxy;
  v8 = -[_GEOCountryConfigurationRemoteProxy init](&v17, sel_init);
  if (v8)
  {
    v9 = geo_dispatch_queue_create();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_delegateQueue, a4);
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_DeviceCountryCodeSourced, (uint64_t)off_1EDF4CC58, v8->_queue, v8);
    objc_initWeak(&location, v8);
    v11 = v8->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70___GEOCountryConfigurationRemoteProxy_initWithDelegate_delegateQueue___block_invoke;
    v14[3] = &unk_1E1C05280;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.GeoServices.countryProvidersChanged", &v8->_providersChangedToken, v11, v14);
    v12 = v8;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *delegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Received country code change notification. Informing delegate.", buf, 2u);
  }

  +[_GEOCountryConfigurationInfo get]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  delegateQueue = self->_delegateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___GEOCountryConfigurationRemoteProxy_valueChangedForGEOConfigKey___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(delegateQueue, v8);

}

- (void)updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 1, CFSTR("CountryConfiguration"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("country.update"), CFSTR("message"), 0);
  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83___GEOCountryConfigurationRemoteProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke;
  v14[3] = &unk_1E1C061F8;
  v15 = v6;
  v16 = v7;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "sendMessage:withReply:handler:", v10, queue, v14);

}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, self);
  notify_cancel(self->_countryCodeChangedToken);
  notify_cancel(self->_providersChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)_GEOCountryConfigurationRemoteProxy;
  -[_GEOCountryConfigurationRemoteProxy dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
