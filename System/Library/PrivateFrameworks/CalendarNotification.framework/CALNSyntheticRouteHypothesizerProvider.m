@implementation CALNSyntheticRouteHypothesizerProvider

+ (CALNSyntheticRouteHypothesizerProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CALNSyntheticRouteHypothesizerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, block);
  return (CALNSyntheticRouteHypothesizerProvider *)(id)sharedInstance_sharedInstance_3;
}

void __56__CALNSyntheticRouteHypothesizerProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v1;

}

- (CALNSyntheticRouteHypothesizerProvider)init
{
  CALNSyntheticRouteHypothesizerProvider *v2;
  uint64_t v3;
  CADSyntheticRouteHypothesizerCache *syntheticRouteHypothesizerCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CALNSyntheticRouteHypothesizerProvider;
  v2 = -[CALNSyntheticRouteHypothesizerProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE128D8], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    syntheticRouteHypothesizerCache = v2->_syntheticRouteHypothesizerCache;
    v2->_syntheticRouteHypothesizerCache = (CADSyntheticRouteHypothesizerCache *)v3;

  }
  return v2;
}

- (id)hypothesizerForPlannedDestination:(id)a3
{
  return objc_alloc_init(CALNSyntheticRouteHypothesizer);
}

- (void)createdRouteHypothesizer:(id)a3 forEventExternalURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_254E0D3C8))
  {
    v7 = v9;
    -[CALNSyntheticRouteHypothesizerProvider syntheticRouteHypothesizerCache](self, "syntheticRouteHypothesizerCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSyntheticRouteHypothesizer:forEventExternalURL:", v7, v6);

  }
}

- (void)removedRouteHypothesizerForEventExternalURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNSyntheticRouteHypothesizerProvider syntheticRouteHypothesizerCache](self, "syntheticRouteHypothesizerCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSyntheticRouteHypothesizerForEventExternalURL:", v4);

}

- (CADSyntheticRouteHypothesizerCache)syntheticRouteHypothesizerCache
{
  return self->_syntheticRouteHypothesizerCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntheticRouteHypothesizerCache, 0);
}

@end
