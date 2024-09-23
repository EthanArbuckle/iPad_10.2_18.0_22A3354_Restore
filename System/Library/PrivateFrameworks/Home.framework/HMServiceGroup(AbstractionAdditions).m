@implementation HMServiceGroup(AbstractionAdditions)

- (id)hf_accessoryLikeObject
{
  return +[HFAccessoryLikeObject _accessoryLikeObjectForObject:](HFAccessoryLikeObject, "_accessoryLikeObjectForObject:", a1);
}

- (uint64_t)hf_itemClass
{
  return objc_opt_class();
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
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_156);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_157);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_associatedAccessories
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_159);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_accessoryType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_161);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_163);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "na_map:", &__block_literal_global_164);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_firstMostCommonObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceSubtype");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFAccessoryType serviceType:subtype:](HFAccessoryType, "serviceType:subtype:", v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (uint64_t)hf_isInRoom:()AbstractionAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hf_associatedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HMServiceGroup_AbstractionAdditions__hf_isInRoom___block_invoke;
  v9[3] = &unk_1EA727840;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (id)hf_safeRoom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "hf_areAllServicesInSameRoom"))
  {
    objc_msgSend(a1, "services");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "room");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)hf_canSpanMultipleRooms
{
  return 1;
}

- (uint64_t)hf_isIdentifiable
{
  return 0;
}

- (uint64_t)hf_canShowInControlCenter
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_166);

  return v4;
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
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a1, "hf_associatedAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__HMServiceGroup_AbstractionAdditions__hf_moveToRoom___block_invoke;
  v12[3] = &unk_1EA728740;
  v13 = v4;
  v8 = v4;
  objc_msgSend(v7, "na_map:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combineAllFutures:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)hf_isFavorite
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 2);
}

- (uint64_t)hf_hasSetFavorite
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 2);
}

- (uint64_t)hf_effectiveIsFavorite
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 2);
}

- (uint64_t)hf_updateIsFavorite:()AbstractionAdditions
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 2);
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

  objc_msgSend(a1, "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_168);

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

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
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
