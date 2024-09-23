@implementation HMAccessory(AbstractionAdditions)

- (uint64_t)hf_isVisibleInHomeStatus
{
  if ((objc_msgSend(a1, "hf_isForcedVisibleInHomeStatus") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 1);
}

- (uint64_t)hf_isForcedVisibleInHomeStatus
{
  return 0;
}

- (id)hf_accessoryType
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a1, "hf_effectiveCategoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7A70]) & 1) == 0
    && !objc_msgSend(a1, "hf_isSingleSensorAccessory"))
  {
    if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7A78]) & 1) != 0
      || objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7AB8]))
    {
      objc_msgSend(a1, "hf_primaryService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "associatedServiceType");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(a1, "hf_visibleServices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __53__HMAccessory_AbstractionAdditions__hf_accessoryType__block_invoke;
        v12[3] = &unk_1EA7283A0;
        v4 = v6;
        v13 = v4;
        v10 = objc_msgSend(v9, "na_all:", v12);

        if (v10)
        {
          objc_msgSend(v4, "hf_accessoryType");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_5;
        }

      }
    }
LABEL_13:
    +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(a1, "hf_primaryService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_13;
  v4 = v3;
  objc_msgSend(v3, "hf_accessoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

LABEL_14:
  return v5;
}

- (id)hf_accessoryLikeObjects
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24[2];
  id location;

  if (!objc_msgSend(a1, "hf_isMatterOnlyAccessory"))
  {
    objc_msgSend(a1, "hf_visibleServices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "hf_showAsAccessoryTile")
      && objc_msgSend(v7, "count")
      && (objc_msgSend(a1, "hf_isMediaAccessory") & 1) == 0
      && (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E0C99E60];
      +[HFAccessoryLikeObject _accessoryLikeObjectForObject:](HFAccessoryLikeObject, "_accessoryLikeObjectForObject:", a1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithObject:", v22);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "hf_isCamera"))
    {
      v9 = objc_msgSend(a1, "hf_showAsAccessoryTile");
      v10 = (void *)MEMORY[0x1E0C99E60];
      if (v9)
      {
        +[HFAccessoryLikeObject _accessoryLikeObjectForObject:](HFAccessoryLikeObject, "_accessoryLikeObjectForObject:", a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithObject:", v11);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
LABEL_19:

        return v6;
      }
      objc_msgSend(a1, "cameraProfiles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "na_arrayByFlattening");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if (!objc_msgSend(a1, "hf_isRemoteControl"))
    {
      if (objc_msgSend(a1, "hf_isMediaAccessory"))
      {
        v19 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(a1, "mediaProfile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "na_setWithSafeObject:", v14);
        v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
        v8 = v14;
LABEL_16:

        v8 = v18;
LABEL_17:
        objc_initWeak(&location, a1);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __60__HMAccessory_AbstractionAdditions__hf_accessoryLikeObjects__block_invoke;
        v23[3] = &unk_1EA728528;
        v23[4] = a1;
        objc_copyWeak(v24, &location);
        v24[1] = a2;
        objc_msgSend(v8, "na_flatMap:", v23);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_destroyWeak(v24);
        objc_destroyWeak(&location);
        goto LABEL_18;
      }
      if (objc_msgSend(v7, "count"))
        goto LABEL_22;
      if ((objc_msgSend(a1, "hf_isSupportedAccessory") & 1) != 0)
      {
        if (!objc_msgSend(a1, "hf_isProgrammableSwitch"))
          goto LABEL_17;
        if (!objc_msgSend(a1, "hf_showAsAccessoryTile"))
        {
LABEL_22:
          v18 = v7;
          goto LABEL_16;
        }
      }
    }
    v12 = (void *)MEMORY[0x1E0C99E60];
    +[HFAccessoryLikeObject _accessoryLikeObjectForObject:](HFAccessoryLikeObject, "_accessoryLikeObjectForObject:", a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  v4 = (void *)MEMORY[0x1E0C99E60];
  +[HFAccessoryLikeObject _accessoryLikeObjectForObject:](HFAccessoryLikeObject, "_accessoryLikeObjectForObject:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_containedServices
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_containedProfiles
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)hf_associatedAccessories
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (id)hf_itemClass
{
  if ((objc_msgSend(a1, "hf_isRemoteControl") & 1) == 0
    && (objc_msgSend(a1, "hf_isMediaAccessory") & 1) == 0
    && objc_msgSend(a1, "hf_isSupportedAccessory"))
  {
    objc_msgSend(a1, "hf_isPureProgrammableSwitch");
  }
  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_containedCharacteristics
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_63);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)hf_isInRoom:()AbstractionAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 0;
}

- (uint64_t)hf_isIdentifiable
{
  if ((objc_msgSend(a1, "supportsIdentify") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_isHomePod");
}

- (id)hf_moveToRoom:()AbstractionAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HMAccessory_AbstractionAdditions__hf_moveToRoom___block_invoke;
  v9[3] = &unk_1EA728590;
  v9[4] = a1;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "futureWithErrorOnlyHandlerAdapterBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  if (objc_msgSend(a1, "hf_isCamera"))
  {
    NSLog(CFSTR("Attempting to update favorite of HMAccessory cameras."));
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

- (uint64_t)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 1);
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
  return +[HFHomeKitObjectSettingsStore tileSizeForObject:](HFHomeKitObjectSettingsStore, "tileSizeForObject:", a1);
}

- (id)hf_setTileSize:()AbstractionAdditions
{
  return +[HFHomeKitObjectSettingsStore setTileSize:forObject:](HFHomeKitObjectSettingsStore, "setTileSize:forObject:", a3, a1);
}

@end
