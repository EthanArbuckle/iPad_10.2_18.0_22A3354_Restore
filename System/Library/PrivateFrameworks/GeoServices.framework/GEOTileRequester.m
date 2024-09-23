@implementation GEOTileRequester

- (GEOTileRequesterDelegate)delegate
{
  return (GEOTileRequesterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (uint64_t)tileSetForKey:(_BYTE *)a3
{
  return *a3 & 0x7F;
}

- (uint64_t)activeTileSetForKey:
{
  return 0;
}

- (id)context
{
  return self->_context;
}

- (NSString)deviceRegion
{
  return self->_deviceRegion;
}

- (NSString)deviceCountry
{
  return self->_deviceCountry;
}

- (GEOResourceManifestManager)resourceManifestManager
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOTileRequester tileRequest](self, "tileRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manifestConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOResourceManifestManager *)v4;
}

- (GEOTileRequest)tileRequest
{
  return self->_tileRequest;
}

id __28__GEOTileRequester_tearDown__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), 0);
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void)tearDown
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__GEOTileRequester_tearDown__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)setDeviceRegion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRegion, a3);
}

- (void)setDeviceCountry:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCountry, a3);
}

+ (BOOL)requiresNetwork
{
  return 1;
}

- (GEOTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  GEOTileRequester *v12;
  GEOTileRequester *v13;
  void *v14;
  uint64_t v15;
  NSString *deviceCountry;
  uint64_t v17;
  NSString *deviceRegion;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GEOTileRequester;
  v12 = -[GEOTileRequester init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tileRequest, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_delegateQueue, a4);
    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "countryCode");
    v15 = objc_claimAutoreleasedReturnValue();
    deviceCountry = v13->_deviceCountry;
    v13->_deviceCountry = (NSString *)v15;

    _postureRegion(0);
    v17 = objc_claimAutoreleasedReturnValue();
    deviceRegion = v13->_deviceRegion;
    v13->_deviceRegion = (NSString *)v17;

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRegion, 0);
  objc_storeStrong((id *)&self->_deviceCountry, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tileRequest, 0);
}

+ (unsigned)tileProviderIdentifier
{
  return 1;
}

- (GEOTileRequester)init
{
  GEOTileRequester *result;

  result = (GEOTileRequester *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

@end
