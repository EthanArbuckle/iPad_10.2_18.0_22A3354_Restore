@implementation GEOSharedNavWaypointInfo(MSPExtras)

- (id)name
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a1, "hasChargingStationInfo"))
  {
    objc_msgSend(a1, "chargingStationInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "name");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "mapItemStorage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "_placeDisplayType") == 3
      || (objc_msgSend(v2, "name"), (v3 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v2, "shortAddress");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  v4 = (void *)v3;

  return v4;
}

@end
