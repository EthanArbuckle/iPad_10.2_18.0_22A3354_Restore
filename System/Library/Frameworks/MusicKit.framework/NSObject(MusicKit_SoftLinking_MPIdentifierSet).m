@implementation NSObject(MusicKit_SoftLinking_MPIdentifierSet)

- (id)musicKit_playbackID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentItemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_identifierSetSources
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)musicKit_hasValidIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  void *v22;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "radio");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stationStringID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    goto LABEL_8;
  objc_msgSend(v1, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalPlaylistID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    goto LABEL_8;
  objc_msgSend(v1, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "socialProfileID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
    goto LABEL_8;
  objc_msgSend(v1, "universalStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "subscriptionAdamID");

  if (v12)
    goto LABEL_8;
  objc_msgSend(v1, "universalStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "adamID");

  if (v14)
    goto LABEL_8;
  objc_msgSend(v1, "universalStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "assetAdamID");

  if (v16
    || (objc_msgSend(v1, "universalStore"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "universalCloudLibraryID"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "length"),
        v18,
        v17,
        v19))
  {
LABEL_8:
    v20 = 1;
  }
  else
  {
    objc_msgSend(v1, "library");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v22, "persistentID") != 0;

  }
  return v20;
}

- (MusicKit_SoftLinking_CatalogID)musicKit_catalogID
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UInt8 *v28;
  uint64_t quot;
  lldiv_t v30;
  uint64_t v31;
  MusicKit_SoftLinking_CatalogID *v32;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  Class (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "modelKind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v4 = (void *)getMPModelRadioStationKindClass_softClass;
  v38 = getMPModelRadioStationKindClass_softClass;
  if (!getMPModelRadioStationKindClass_softClass)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getMPModelRadioStationKindClass_block_invoke;
    v42 = &unk_24CD1CC68;
    v43 = &v35;
    __getMPModelRadioStationKindClass_block_invoke((uint64_t)&v39);
    v4 = (void *)v36[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v35, 8);
  objc_msgSend(v5, "identityKind", v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v1, "radio");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stationStringID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 3;
    goto LABEL_32;
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v11 = (void *)getMPModelPlaylistKindClass_softClass;
  v38 = getMPModelPlaylistKindClass_softClass;
  if (!getMPModelPlaylistKindClass_softClass)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getMPModelPlaylistKindClass_block_invoke;
    v42 = &unk_24CD1CC68;
    v43 = &v35;
    __getMPModelPlaylistKindClass_block_invoke((uint64_t)&v39);
    v11 = (void *)v36[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v35, 8);
  objc_msgSend(v12, "identityKind", v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "isEqual:", v13);

  if (v14)
  {
    objc_msgSend(v1, "universalStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "globalPlaylistID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 2;
    goto LABEL_32;
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v16 = (void *)getMPModelSocialPersonKindClass_softClass;
  v38 = getMPModelSocialPersonKindClass_softClass;
  if (!getMPModelSocialPersonKindClass_softClass)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getMPModelSocialPersonKindClass_block_invoke;
    v42 = &unk_24CD1CC68;
    v43 = &v35;
    __getMPModelSocialPersonKindClass_block_invoke((uint64_t)&v39);
    v16 = (void *)v36[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v35, 8);
  objc_msgSend(v17, "identityKind", v35);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "isEqual:", v18);

  if (v19)
  {
    objc_msgSend(v1, "universalStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "socialProfileID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 5;
    goto LABEL_32;
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v21 = (void *)getMPModelForYouRecommendationGroupKindClass_softClass;
  v38 = getMPModelForYouRecommendationGroupKindClass_softClass;
  if (!getMPModelForYouRecommendationGroupKindClass_softClass)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getMPModelForYouRecommendationGroupKindClass_block_invoke;
    v42 = &unk_24CD1CC68;
    v43 = &v35;
    __getMPModelForYouRecommendationGroupKindClass_block_invoke((uint64_t)&v39);
    v21 = (void *)v36[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v35, 8);
  objc_msgSend(v22, "identityKind", v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v3, "isEqual:", v23);

  if (v24)
  {
    objc_msgSend(v1, "personalizedStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recommendationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 4;
    goto LABEL_32;
  }
  objc_msgSend(v1, "universalStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "subscriptionAdamID");
  if (v27)
  {
    v10 = 6;
    goto LABEL_23;
  }
  v27 = objc_msgSend(v26, "adamID");
  if (v27)
  {
    v10 = 0;
    goto LABEL_23;
  }
  v27 = objc_msgSend(v26, "assetAdamID");
  if (v27)
  {
    v10 = 1;
LABEL_23:

    v28 = (UInt8 *)&v41 + 7;
    quot = v27;
    do
    {
      v30 = lldiv(quot, 10);
      quot = v30.quot;
      if (v30.rem >= 0)
        LOBYTE(v31) = v30.rem;
      else
        v31 = -v30.rem;
      *v28-- = v31 + 48;
    }
    while (v30.quot);
    if (v27 < 0)
      *v28 = 45;
    else
      ++v28;
    v9 = (void *)CFStringCreateWithBytes(0, v28, (char *)&v42 - (char *)v28, 0x8000100u, 0);
    goto LABEL_32;
  }
  objc_msgSend(v26, "globalPlaylistID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 2;
  }
  else
  {
    objc_msgSend(v26, "socialProfileID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 5;
  }
  if (!v9)
  {
    objc_msgSend(v1, "radio");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stationStringID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 3;
  }
  if (!v9)
  {
    objc_msgSend(v26, "socialProfileID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 5;
  }

LABEL_32:
  if (v9)
    v32 = -[MusicKit_SoftLinking_CatalogID initWithValue:kind:]([MusicKit_SoftLinking_CatalogID alloc], "initWithValue:kind:", v9, v10);
  else
    v32 = 0;

  return v32;
}

- (uint64_t)musicKit_syncID
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "syncID");
  return v3;
}

- (MusicKit_SoftLinking_DeviceLocalID)musicKit_deviceLocalID
{
  void *v1;
  void *v2;
  MusicKit_SoftLinking_DeviceLocalID *v3;
  MusicKit_SoftLinking_DeviceLocalID *v4;
  void *v5;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (MusicKit_SoftLinking_DeviceLocalID *)objc_msgSend(v2, "persistentID");
    if (v3)
    {
      v4 = [MusicKit_SoftLinking_DeviceLocalID alloc];
      objc_msgSend(v2, "databaseID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[MusicKit_SoftLinking_DeviceLocalID initWithValue:databaseID:](v4, "initWithValue:databaseID:", v3, v5);

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_musicKit_self_identifierSet
{
  id v2;

  getMPIdentifierSetClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_libraryID
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "universalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "universalCloudLibraryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)musicKit_assetAdamID
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "universalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "assetAdamID");
  return v3;
}

- (uint64_t)musicKit_purchasedAdamID
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "universalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "purchasedAdamID");
  return v3;
}

- (id)musicKit_formerIDs
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "universalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formerAdamIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_map:", &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)musicKit_cloudID
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "personalizedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "cloudID");
  return v3;
}

- (MusicKit_SoftLinking_DeviceLocalID)musicKit_containedDeviceLocalID
{
  void *v1;
  void *v2;
  MusicKit_SoftLinking_DeviceLocalID *v3;
  MusicKit_SoftLinking_DeviceLocalID *v4;
  void *v5;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (MusicKit_SoftLinking_DeviceLocalID *)objc_msgSend(v2, "containedPersistentID");
    if (v3)
    {
      v4 = [MusicKit_SoftLinking_DeviceLocalID alloc];
      objc_msgSend(v2, "databaseID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[MusicKit_SoftLinking_DeviceLocalID initWithValue:databaseID:](v4, "initWithValue:databaseID:", v3, v5);

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)musicKit_cloudAlbumLibraryID
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "personalizedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "cloudAlbumID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)musicKit_reportingAdamID
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "universalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "reportingAdamID");
  return v3;
}

- (id)musicKit_occurrenceID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "containerUniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_modelKind
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "modelKind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:]([MusicKit_SoftLinking_MPModelKind alloc], "_initWithUnderlyingKind:", v2);
  else
    v3 = 0;

  return v3;
}

- (uint64_t)intersectsSet:()MusicKit_SoftLinking_MPIdentifierSet
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getMPIdentifierSetClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "intersectsSet:", v4);
  else
    v6 = 0;

  return v6;
}

- (id)unionSet:()MusicKit_SoftLinking_MPIdentifierSet
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getMPIdentifierSetClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "unionSet:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)archivedDataWithError:()MusicKit_SoftLinking_MPIdentifierSet
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_musicKit_self_identifierSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
