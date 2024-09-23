@implementation MRUVolumeHUDRouteDescriptionProvider

- (void)cycleOverridePackageDescriptions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[MRUVolumeHUDRouteDescriptionProvider outputDeviceAsset](self, "outputDeviceAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  v5 = (v4 + 1) % 23;
  if (v5 == 2)
  {
    +[MRUOutputDeviceAsset sharingAsset](MRUOutputDeviceAsset, "sharingAsset");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 == 1)
      +[MRUOutputDeviceAsset inCallAsset](MRUOutputDeviceAsset, "inCallAsset");
    else
      +[MRUOutputDeviceAsset speakerAsset](MRUOutputDeviceAsset, "speakerAsset");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v6;
  -[MRUVolumeHUDRouteDescriptionProvider setOverrideOutputDeviceAsset:](self, "setOverrideOutputDeviceAsset:", v6);

}

- (void)resetOverridePackageDescription
{
  -[MRUVolumeHUDRouteDescriptionProvider setOverrideOutputDeviceAsset:](self, "setOverrideOutputDeviceAsset:", 0);
}

- (MRUVolumeHUDRouteDescriptionProvider)init
{
  MRUVolumeHUDRouteDescriptionProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUVolumeHUDRouteDescriptionProvider;
  v2 = -[MRUVolumeHUDRouteDescriptionProvider init](&v5, sel_init);
  if (v2)
  {
    +[MRUSystemOutputDeviceRouteController sharedController](MRUSystemOutputDeviceRouteController, "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);

    -[MRUVolumeHUDRouteDescriptionProvider updateOutputDeviceAsset](v2, "updateOutputDeviceAsset");
  }
  return v2;
}

- (id)packageStateForVolumeValue:(float)a3
{
  return +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:");
}

- (MRUOutputDeviceAsset)outputDeviceAsset
{
  MRUOutputDeviceAsset *overrideOutputDeviceAsset;

  overrideOutputDeviceAsset = self->_overrideOutputDeviceAsset;
  if (!overrideOutputDeviceAsset)
    overrideOutputDeviceAsset = self->_outputDeviceAsset;
  return overrideOutputDeviceAsset;
}

- (void)setOverrideOutputDeviceAsset:(id)a3
{
  void *v4;
  id WeakRetained;

  objc_storeStrong((id *)&self->_overrideOutputDeviceAsset, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[MRUVolumeHUDRouteDescriptionProvider outputDeviceAsset](self, "outputDeviceAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "volumeHUDRouteDescriptionProvider:didChangeOutputDeviceAsset:", self, v4);

}

- (void)updateOutputDeviceAsset
{
  void *v3;
  id WeakRetained;
  void *v5;
  id obj;

  +[MRUSystemOutputDeviceRouteController sharedController](MRUSystemOutputDeviceRouteController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemOutputDeviceAssetWithInCall");
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (!-[MRUOutputDeviceAsset isEqual:](self->_outputDeviceAsset, "isEqual:", obj))
  {
    objc_storeStrong((id *)&self->_outputDeviceAsset, obj);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[MRUVolumeHUDRouteDescriptionProvider outputDeviceAsset](self, "outputDeviceAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "volumeHUDRouteDescriptionProvider:didChangeOutputDeviceAsset:", self, v5);

  }
}

- (MRUVolumeHUDRouteDescriptionProviderDelegate)delegate
{
  return (MRUVolumeHUDRouteDescriptionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setOutputDeviceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceAsset, a3);
}

- (MRUOutputDeviceAsset)overrideOutputDeviceAsset
{
  return self->_overrideOutputDeviceAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideOutputDeviceAsset, 0);
  objc_storeStrong((id *)&self->_outputDeviceAsset, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
