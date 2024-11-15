@implementation _MKOfflineRegionCustomFeature

- (_MKOfflineRegionCustomFeature)init
{
  _MKOfflineRegionCustomFeature *result;

  result = (_MKOfflineRegionCustomFeature *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_MKOfflineRegionCustomFeature)initWithSubscription:(id)a3
{
  id v5;
  _MKOfflineRegionCustomFeature *v6;
  _MKOfflineRegionCustomFeature *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  uint64_t v13;
  VKCustomFeature *feature;
  VKCustomFeature *v15;
  void *v16;
  VKCustomFeature *v17;
  void *v18;
  VKCustomFeature *v19;
  void *v20;
  _MKOfflineRegionCustomFeature *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_MKOfflineRegionCustomFeature;
  v6 = -[_MKOfflineRegionCustomFeature init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscription, a3);
    objc_msgSend(v5, "region");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerLat");
    v10 = v9;
    objc_msgSend(v5, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerLng");
    v7->_coordinate.latitude = v10;
    v7->_coordinate.longitude = v12;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC64D8]), "initWithCoordinate:", v7->_coordinate.latitude, v7->_coordinate.longitude);
    feature = v7->_feature;
    v7->_feature = (VKCustomFeature *)v13;

    v15 = v7->_feature;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 5, 3, 6, 452, 0);
    -[VKCustomFeature setStyleAttributes:](v15, "setStyleAttributes:", v16);

    v17 = v7->_feature;
    objc_msgSend(v5, "displayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCustomFeature setText:locale:](v17, "setText:locale:", v18, 0);

    v19 = v7->_feature;
    objc_msgSend(v5, "region");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCustomFeature setFeatureRegion:](v19, "setFeatureRegion:", v20);

    v21 = v7;
  }

  return v7;
}

- (id)feature
{
  return self->_feature;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
