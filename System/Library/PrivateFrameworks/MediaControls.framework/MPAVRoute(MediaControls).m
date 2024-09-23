@implementation MPAVRoute(MediaControls)

- (uint64_t)isLocalDeviceOrHeadphone
{
  if ((objc_msgSend(a1, "isDeviceSpeakerRoute") & 1) != 0 || (objc_msgSend(a1, "isSplitterCapable") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isHeadphonesRoute");
}

- (BOOL)isWiredDevice
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a1, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (uint64_t)isGroupSession
{
  if ((objc_msgSend(a1, "isDiscoveredGroupSession") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isActiveGroupSession");
}

- (uint64_t)isDiscoveredGroupSession
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (uint64_t)isActiveGroupSession
{
  _BOOL8 v2;
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a1, "endpointObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4 != 0;

  return v2;
}

- (uint64_t)isHostedGroupSession
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "groupSessionInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isHosted");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    objc_msgSend(a1, "endpointObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "groupSessionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isHosted");

  }
  return v3;
}

@end
