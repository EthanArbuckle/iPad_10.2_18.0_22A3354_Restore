@implementation MPStoreModelPlaybackPositionBuilder

+ (id)allSupportedProperties
{
  void *v2;
  void *v3;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyPlaybackPositionBookmarkTime");
  v5[1] = CFSTR("MPModelPropertyPlaybackPositionShouldRememberBookmarkTime");
  v5[2] = CFSTR("MPModelPropertyPlaybackPositionHasBeenPlayed");
  v5[3] = CFSTR("MPModelPropertyPlaybackPositionStartTime");
  v5[4] = CFSTR("MPModelPropertyPlaybackPositionStopTime");
  v5[5] = CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier");
  v5[6] = CFSTR("MPModelPropertyPlaybackPositionUserPlayCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MPModelPlaybackPosition *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  MPStoreModelPlaybackPositionBuilder *v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_BYTE *)&self->_requestedPlaybackPositionProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPlaybackPositionBookmarkTime")))
      v13 = 2;
    else
      v13 = 0;
    *(_BYTE *)&self->_requestedPlaybackPositionProperties = *(_BYTE *)&self->_requestedPlaybackPositionProperties & 0xFD | v13;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPlaybackPositionShouldRememberBookmarkTime")))v14 = 4;
    else
      v14 = 0;
    *(_BYTE *)&self->_requestedPlaybackPositionProperties = *(_BYTE *)&self->_requestedPlaybackPositionProperties & 0xFB | v14;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPlaybackPositionHasBeenPlayed")))
      v15 = 8;
    else
      v15 = 0;
    *(_BYTE *)&self->_requestedPlaybackPositionProperties = *(_BYTE *)&self->_requestedPlaybackPositionProperties & 0xF7 | v15;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPlaybackPositionStartTime")))
      v16 = 16;
    else
      v16 = 0;
    *(_BYTE *)&self->_requestedPlaybackPositionProperties = *(_BYTE *)&self->_requestedPlaybackPositionProperties & 0xEF | v16;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPlaybackPositionStopTime")))
      v17 = 32;
    else
      v17 = 0;
    *(_BYTE *)&self->_requestedPlaybackPositionProperties = *(_BYTE *)&self->_requestedPlaybackPositionProperties & 0xDF | v17;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier")))v18 = 64;
    else
      v18 = 0;
    *(_BYTE *)&self->_requestedPlaybackPositionProperties = *(_BYTE *)&self->_requestedPlaybackPositionProperties & 0xBF | v18;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPlaybackPositionUserPlayCount")))
      v19 = -127;
    else
      v19 = 1;
    *(_BYTE *)&self->_requestedPlaybackPositionProperties = v19 | *(_BYTE *)&self->_requestedPlaybackPositionProperties & 0x7E;

  }
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __103__MPStoreModelPlaybackPositionBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v30 = &unk_1E3159758;
  v20 = v8;
  v31 = v20;
  v32 = self;
  v21 = (void *)MEMORY[0x19403A810](&v27);
  if (v9)
  {
    objc_msgSend(v9, "identifiers", v27, v28, v29, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v9, "copyWithIdentifiers:block:", v22, v21);
  }
  else
  {
    v24 = [MPModelPlaybackPosition alloc];
    +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet", v27, v28, v29, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MPModelObject initWithIdentifiers:block:](v24, "initWithIdentifiers:block:", v22, v21);
  }
  v25 = (void *)v23;

  return v25;
}

void __103__MPStoreModelPlaybackPositionBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("tvEpisode"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "BOOLForKey:", CFSTR("MusicShouldFakeTVEpisodes")) & 1) == 0)
  {

    if ((v4 & 1) == 0)
      goto LABEL_3;
LABEL_5:
    v7 = 1;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("musicVideo"));

  if (((v6 | v4) & 1) != 0)
    goto LABEL_5;
LABEL_3:
  v7 = objc_msgSend(v3, "isEqualToString:", CFSTR("movie"));
LABEL_6:
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 2) != 0
    && (objc_msgSend(v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionBookmarkTime")) & 1) == 0)
  {
    objc_msgSend(v14, "setBookmarkTime:", 0.0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 4) != 0
    && (objc_msgSend(v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionShouldRememberBookmarkTime")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "shouldBookmarkPlayPosition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v7 = objc_msgSend(v8, "BOOLValue");
    objc_msgSend(v14, "setShouldRememberBookmarkTime:", v7);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 8) != 0
    && (objc_msgSend(v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionHasBeenPlayed")) & 1) == 0)
  {
    objc_msgSend(v14, "setHasBeenPlayed:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 0x10) != 0
    && (objc_msgSend(v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionStartTime")) & 1) == 0)
  {
    objc_msgSend(v14, "setStartTime:", 0.0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 0x20) != 0
    && (objc_msgSend(v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionStopTime")) & 1) == 0)
  {
    objc_msgSend(v14, "setStopTime:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 0x40) != 0
    && (objc_msgSend(v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "storeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (v12 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v10)) != 0)
    {
      +[MPUbiquitousPlaybackPositionEntity ubiquitousIdentifierWithStoreAdamID:](MPUbiquitousPlaybackPositionEntity, "ubiquitousIdentifierWithStoreAdamID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStoreUbiquitousIdentifier:", v13);

    }
    else
    {
      objc_msgSend(v14, "setStoreUbiquitousIdentifier:", 0);
    }

  }
  if (*(char *)(*(_QWORD *)(a1 + 40) + 24) < 0
    && (objc_msgSend(v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionUserPlayCount")) & 1) == 0)
  {
    objc_msgSend(v14, "setUserPlayCount:", 0);
  }

}

@end
