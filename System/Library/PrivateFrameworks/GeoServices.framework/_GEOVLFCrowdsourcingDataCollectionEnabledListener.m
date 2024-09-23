@implementation _GEOVLFCrowdsourcingDataCollectionEnabledListener

- (_GEOVLFCrowdsourcingDataCollectionEnabledListener)initWithListener:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _GEOVLFCrowdsourcingDataCollectionEnabledListener *v8;
  _GEOVLFCrowdsourcingDataCollectionEnabledListener *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_GEOVLFCrowdsourcingDataCollectionEnabledListener;
  v8 = -[_GEOVLFCrowdsourcingDataCollectionEnabledListener init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listener, v6);
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_VLFCrowdsourcingDataCollectionEnabled, (uint64_t)off_1EDF4CC08, v7, v9);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, self);
  v3.receiver = self;
  v3.super_class = (Class)_GEOVLFCrowdsourcingDataCollectionEnabledListener;
  -[_GEOVLFCrowdsourcingDataCollectionEnabledListener dealloc](&v3, sel_dealloc);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_msgSend(WeakRetained, "GEOVLFCrowdsourcingDataCollectionEnabledValueChanged:", GEOConfigGetBOOL(GeoServicesConfig_VLFCrowdsourcingDataCollectionEnabled, (uint64_t)off_1EDF4CC08));

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listener);
}

@end
