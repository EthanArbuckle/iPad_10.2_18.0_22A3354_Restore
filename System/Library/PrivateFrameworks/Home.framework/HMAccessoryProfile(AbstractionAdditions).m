@implementation HMAccessoryProfile(AbstractionAdditions)

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (id)hf_serviceNameComponents
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_serviceNameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_associatedAccessories
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_setWithSafeObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_containedServices
{
  if (_MergedGlobals_216 != -1)
    dispatch_once(&_MergedGlobals_216, &__block_literal_global_172);
  return (id)qword_1ED378CF0;
}

- (id)hf_containedCharacteristics
{
  if (qword_1ED378CF8 != -1)
    dispatch_once(&qword_1ED378CF8, &__block_literal_global_174);
  return (id)qword_1ED378D00;
}

- (uint64_t)hf_containedProfiles
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a1);
}

- (id)hf_accessoryLikeObject
{
  return +[HFAccessoryLikeObject _accessoryLikeObjectForObject:](HFAccessoryLikeObject, "_accessoryLikeObjectForObject:", a1);
}

- (uint64_t)hf_itemClass
{
  return objc_opt_class();
}

- (id)hf_accessoryType
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_accessoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_isInRoom:()AbstractionAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
  return v9;
}

- (id)hf_safeRoom
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 0;
}

- (uint64_t)hf_isIdentifiable
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "supportsIdentify") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hf_isHomePod");

  }
  return v3;
}

- (uint64_t)hf_canShowInControlCenter
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hf_showsAsAccessoryInControlCentre");

  return v2;
}

- (uint64_t)hf_isMatterOnlyAccessory
{
  return 0;
}

- (id)hf_moveToRoom:()AbstractionAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_moveToRoom:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)hf_isFavorite
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 2);
}

- (uint64_t)hf_hasSetFavorite
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 2);
}

- (id)hf_updateIsFavorite:()AbstractionAdditions
{
  void *v5;
  int v6;

  objc_msgSend(a1, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_isCamera");

  if (v6)
  {
    NSLog(CFSTR("Attempting to update favorite of accessory profile for camera."));
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  }
  else
  {
    objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hf_supportsHomeStatus
{
  return objc_msgSend(a1, "hf_shouldHideForContextType:", 1) ^ 1;
}

- (uint64_t)hf_isVisibleInHomeStatus
{
  if ((objc_msgSend(a1, "hf_isForcedVisibleInHomeStatus") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 1);
}

- (uint64_t)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 1);
}

- (uint64_t)hf_isForcedVisibleInHomeStatus
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hf_isForcedVisibleInHomeStatus");

  return v2;
}

- (uint64_t)hf_updateIsVisibleInHomeStatus:()AbstractionAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 1);
}

- (uint64_t)hf_showInHomeDashboard
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 3);
}

- (uint64_t)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 3);
}

- (uint64_t)hf_updateShowInHomeDashboard:()AbstractionAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 3);
}

- (id)hf_tileSize
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitObjectSettingsStore tileSizeForObject:](HFHomeKitObjectSettingsStore, "tileSizeForObject:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_setTileSize:()AbstractionAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitObjectSettingsStore setTileSize:forObject:](HFHomeKitObjectSettingsStore, "setTileSize:forObject:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
