@implementation MPStoreModelTVEpisodeBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);
  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);
  objc_storeStrong((id *)&self->_playbackPositionBuilder, 0);
}

+ (id)allSupportedProperties
{
  void *v2;
  MPPropertySet *v3;
  void *v4;
  MPPropertySet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MPPropertySet *v12;
  void *v14;
  void *v15;
  void *v16;
  MPPropertySet *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[16];

  v25[14] = *MEMORY[0x1E0C80C00];
  v17 = [MPPropertySet alloc];
  v25[0] = CFSTR("MPModelPropertyTVEpisodeTitle");
  v25[1] = CFSTR("MPModelPropertyTVEpisodeDescriptionText");
  v25[2] = CFSTR("MPModelPropertyTVEpisodeDuration");
  v25[3] = CFSTR("MPModelPropertyTVEpisodeMusicShow");
  v25[4] = CFSTR("MPModelPropertyTVEpisodeNumber");
  v25[5] = CFSTR("MPModelPropertyTVEpisodeExplicitRating");
  v25[6] = CFSTR("MPModelPropertyTVEpisodeArtwork");
  v25[7] = CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource");
  v25[8] = CFSTR("MPModelPropertyTVEpisodeLibraryAdded");
  v25[9] = CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible");
  v25[10] = CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState");
  v25[11] = CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus");
  v25[12] = CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason");
  v25[13] = CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("MPModelRelationshipTVEpisodeShow");
  v3 = [MPPropertySet alloc];
  v22 = CFSTR("MPModelPropertyTVShowTitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("MPModelPropertyPersonName");
  v19[1] = CFSTR("MPModelPropertyTVShowCreatorArtwork");
  v20 = CFSTR("MPModelRelationshipTVShowCreator");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPPropertySet initWithProperties:relationships:](v3, "initWithProperties:relationships:", v14, v4);
  v24[0] = v5;
  v23[1] = CFSTR("MPModelRelationshipTVEpisodeStoreAsset");
  +[MPStoreModelStoreAssetBuilder allSupportedProperties](MPStoreModelStoreAssetBuilder, "allSupportedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  v23[2] = CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset");
  +[MPModelFileAsset allSupportedProperties](MPModelFileAsset, "allSupportedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v7;
  v23[3] = CFSTR("MPModelRelationshipTVEpisodeSeason");
  v18[0] = CFSTR("MPModelPropertyTVSeasonYear");
  v18[1] = CFSTR("MPModelPropertyTVSeasonNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v9;
  v23[4] = CFSTR("MPModelRelationshipTVEpisodePlaybackPosition");
  +[MPStoreModelPlaybackPositionBuilder allSupportedProperties](MPStoreModelPlaybackPositionBuilder, "allSupportedProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPPropertySet initWithProperties:relationships:](v17, "initWithProperties:relationships:", v2, v11);

  return v12;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  $372EF51A5DFBB468A95FEDB178F88C02 *p_requestedEpisodeProperties;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  char v52;
  MPPropertySet *v53;
  MPPropertySet *storeAssetProperties;
  void *v55;
  void *v56;
  MPStoreModelPlaybackPositionBuilder *v57;
  MPStoreModelPlaybackPositionBuilder *playbackPositionBuilder;
  char v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  MPIdentifierSet *v68;
  uint64_t v69;
  MPModelTVEpisode *v70;
  MPIdentifierSet *v71;
  void *v72;
  void *v73;
  void *v75;
  id v76;
  id v77;
  id v78;
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  char v83;
  _QWORD v84[4];
  id v85;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  p_requestedEpisodeProperties = &self->_requestedEpisodeProperties;
  if ((*(_BYTE *)&self->_requestedEpisodeProperties & 1) == 0)
  {
    v76 = v9;
    v77 = v10;
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeTitle")))
      v15 = 2;
    else
      v15 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFFD | v15;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeDescriptionText")))
      v16 = 4;
    else
      v16 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFFB | v16;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeDuration")))
      v17 = 8;
    else
      v17 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFF7 | v17;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeArtwork")))
      v18 = 16;
    else
      v18 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFEF | v18;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeLibraryAdded")))
      v19 = 4096;
    else
      v19 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFEFFF | v19;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState")))
      v20 = 64;
    else
      v20 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFFBF | v20;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus")))
      v21 = 128;
    else
      v21 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFF7F | v21;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason")))v22 = 256;
    else
      v22 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFEFF | v22;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints")))
      v23 = 512;
    else
      v23 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFDFF | v23;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible")))
      v24 = 0x2000;
    else
      v24 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFDFFF | v24;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource")))
      v25 = 1024;
    else
      v25 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFFBFF | v25;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeNumber")))
      v26 = 0x8000;
    else
      v26 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFF7FFF | v26;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeMusicShow")))
      v27 = 0x4000;
    else
      v27 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFFBFFF | v27;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyTVEpisodeExplicitRating")))
      v28 = 0x10000;
    else
      v28 = 0;
    *(_DWORD *)p_requestedEpisodeProperties = *(_DWORD *)p_requestedEpisodeProperties & 0xFFFEFFFF | v28;
    v75 = v13;
    objc_msgSend(v13, "relationships");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipTVEpisodeSeason"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v78 = v8;
    if (v30)
    {
      *(_BYTE *)&self->_requestedEpisodeProperties.season |= 1u;
      objc_msgSend(v30, "properties");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "containsObject:", CFSTR("MPModelPropertyTVSeasonNumber")))
        v33 = 2;
      else
        v33 = 0;
      *(_BYTE *)&self->_requestedEpisodeProperties.season = *(_BYTE *)&self->_requestedEpisodeProperties.season & 0xFD | v33;
      if (objc_msgSend(v32, "containsObject:", CFSTR("MPModelPropertyTVSeasonYear")))
        v34 = 4;
      else
        v34 = 0;
      *(_BYTE *)&self->_requestedEpisodeProperties.season = *(_BYTE *)&self->_requestedEpisodeProperties.season & 0xFB | v34;
      objc_msgSend(v31, "relationships");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKey:", CFSTR("MPModelRelationshipTVSeasonShow"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "properties");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)&self->_requestedEpisodeProperties.season.show |= 1u;
        if (objc_msgSend(v37, "containsObject:", CFSTR("MPModelPropertyTVShowTitle")))
          v38 = 2;
        else
          v38 = 0;
        *(_BYTE *)&self->_requestedEpisodeProperties.season.show = *(_BYTE *)&self->_requestedEpisodeProperties.season.show & 0xFD | v38;
        objc_msgSend(v36, "relationships");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKey:", CFSTR("MPModelRelationshipTVShowCreator"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v40, "properties");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)&self->_requestedEpisodeProperties.season.show.showCreator |= 1u;
          if (objc_msgSend(v41, "containsObject:", CFSTR("MPModelPropertyPersonName")))
            v42 = 2;
          else
            v42 = 0;
          *(_BYTE *)&self->_requestedEpisodeProperties.season.show.showCreator = *(_BYTE *)&self->_requestedEpisodeProperties.season.show.showCreator & 0xFD | v42;
          if (objc_msgSend(v41, "containsObject:", CFSTR("MPModelPropertyTVShowCreatorArtwork")))
            v43 = 4;
          else
            v43 = 0;
          *(_BYTE *)&self->_requestedEpisodeProperties.season.show.showCreator = *(_BYTE *)&self->_requestedEpisodeProperties.season.show.showCreator & 0xFB | v43;

        }
        v8 = v78;
      }

    }
    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipTVEpisodeShow"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
    {
      objc_msgSend(v44, "properties");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedEpisodeProperties.show |= 1u;
      if (objc_msgSend(v46, "containsObject:", CFSTR("MPModelPropertyTVShowTitle")))
        v47 = 2;
      else
        v47 = 0;
      *(_BYTE *)&self->_requestedEpisodeProperties.show = *(_BYTE *)&self->_requestedEpisodeProperties.show & 0xFD | v47;
      objc_msgSend(v45, "relationships");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKey:", CFSTR("MPModelRelationshipTVShowCreator"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(v49, "properties");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)&self->_requestedEpisodeProperties.show.showCreator |= 1u;
        if (objc_msgSend(v50, "containsObject:", CFSTR("MPModelPropertyPersonName")))
          v51 = 2;
        else
          v51 = 0;
        *(_BYTE *)&self->_requestedEpisodeProperties.show.showCreator = *(_BYTE *)&self->_requestedEpisodeProperties.show.showCreator & 0xFD | v51;
        if (objc_msgSend(v50, "containsObject:", CFSTR("MPModelPropertyTVShowCreatorArtwork")))
          v52 = 4;
        else
          v52 = 0;
        *(_BYTE *)&self->_requestedEpisodeProperties.show.showCreator = *(_BYTE *)&self->_requestedEpisodeProperties.show.showCreator & 0xFB | v52;

      }
      v8 = v78;
    }
    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipTVEpisodeStoreAsset"));
    v53 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
    storeAssetProperties = self->_storeAssetProperties;
    self->_storeAssetProperties = v53;

    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
      *(_DWORD *)p_requestedEpisodeProperties |= 0x800u;
    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipTVEpisodePlaybackPosition"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      v57 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelPlaybackPositionBuilder alloc], "initWithRequestedPropertySet:", v56);
      playbackPositionBuilder = self->_playbackPositionBuilder;
      self->_playbackPositionBuilder = v57;

    }
    *(_DWORD *)p_requestedEpisodeProperties |= 1u;

    v9 = v76;
    v11 = v77;
  }
  v59 = objc_msgSend(v8, "hasSubscriptionOffer");
  v60 = MEMORY[0x1E0C809B0];
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v84[3] = &unk_1E3163A58;
  v61 = v8;
  v85 = v61;
  v62 = (void *)MEMORY[0x19403A810](v84);
  v79[0] = v60;
  v79[1] = 3221225472;
  v79[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v79[3] = &unk_1E315A5E8;
  v79[4] = self;
  v63 = v61;
  v80 = v63;
  v64 = v9;
  v81 = v64;
  v65 = v11;
  v82 = v65;
  v83 = v59;
  v66 = (void *)MEMORY[0x19403A810](v79);
  if (v64)
  {
    objc_msgSend(v64, "identifiers");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (MPIdentifierSet *)objc_msgSend(v67, "copyWithSource:block:", CFSTR("StorePlatform"), v62);
    v69 = objc_msgSend(v64, "copyWithIdentifiers:block:", v68, v66);
  }
  else
  {
    v70 = [MPModelTVEpisode alloc];
    v71 = [MPIdentifierSet alloc];
    +[MPModelTVEpisodeKind identityKind](MPModelTVEpisodeKind, "identityKind");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[MPIdentifierSet initWithSource:modelKind:block:](v71, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v67, v62);
    v69 = -[MPModelObject initWithIdentifiers:block:](v70, "initWithIdentifiers:block:", v68, v66);
  }
  v72 = (void *)v69;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addStoreItemMetadata:", v63);

  }
  return v72;
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v14[3] = &unk_1E3162A20;
  v10 = v3;
  v15 = v10;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v10, "setUniversalStoreIdentifiersWithBlock:", v14);
  objc_msgSend(v10, "personalizedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountDSID");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v8, "length"))
  {
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
    v11[3] = &unk_1E3162A48;
    v12 = v10;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v12, "setPersonalStoreIdentifiersWithPersonID:block:", v8, v11);

  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  MPStoreModelStoreAssetBuilder *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MPIdentifierSet *v33;
  id v34;
  MPModelTVShow *v35;
  MPModelTVShow *v36;
  MPIdentifierSet *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  MPIdentifierSet *v43;
  id v44;
  MPModelTVSeason *v45;
  MPModelTVSeason *v46;
  MPIdentifierSet *v47;
  void *v48;
  uint64_t v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, void *);
  void *v56;
  uint64_t v57;
  id v58;
  char v59;
  _QWORD v60[4];
  id v61;
  id v62;
  char v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  char v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeTitle")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeDescriptionText")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "descriptionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDescriptionText:", v6);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeDuration")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "duration");
    objc_msgSend(v4, "setDuration:");
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  if (!v8 && (*(_BYTE *)(v7 + 49) & 0x20) == 0)
  {
    v9 = 0;
    goto LABEL_30;
  }
  v10 = *(void **)(v7 + 32);
  if (!v10)
  {
    if ((*(_BYTE *)(v7 + 49) & 0x20) != 0)
    {
      v70[0] = CFSTR("MPModelPropertyStoreAssetRedownloadable");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v13);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v14 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
      if (v14)
      {
        v15 = v14;
        if (v12)
        {
          objc_msgSend(v14, "propertySetByCombiningWithPropertySet:", v12);
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v16;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v11 = v8;
      v12 = 0;
      if (v8)
      {
LABEL_21:
        v15 = v11;
LABEL_22:
        v17 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelStoreAssetBuilder alloc], "initWithRequestedPropertySet:", v15);
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 32);
        *(_QWORD *)(v18 + 32) = v17;

        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        goto LABEL_23;
      }
    }
    v11 = v12;
    v12 = v11;
    goto LABEL_21;
  }
LABEL_23:
  v20 = *(_QWORD *)(a1 + 40);
  v21 = objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipTVEpisodeStoreAsset"));
  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 48), "storeAsset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v10, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v20, v22, *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)

  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 40))
  {
    objc_msgSend(v4, "setStoreAsset:", v9);
    v7 = *(_QWORD *)(a1 + 32);
  }
LABEL_30:
  if ((*(_BYTE *)(v7 + 49) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "videoSubtype");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("tvtrailer"));

    objc_msgSend(v4, "setLibraryAddEligible:", objc_msgSend(v9, "isRedownloadable") & (v24 ^ 1));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeLibraryAdded")) & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAdded:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeHasCloudSyncSource")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasCloudSyncSource:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalEnableState:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatus:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatusReason:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalConstraints:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset")) & 1) == 0)
  {
    objc_msgSend(v4, "setLocalFileAsset:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeArtwork")) & 1) == 0)
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v68[3] = &unk_1E315A4B8;
    v69 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v68);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeMusicShow")) & 1) == 0)
  {
    objc_msgSend(v4, "setMusicShow:", 1);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeNumber")) & 1) == 0)
  {
    objc_msgSend(v4, "setEpisodeNumber:", objc_msgSend(*(id *)(a1 + 40), "trackNumber"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVEpisodeExplicitRating")) & 1) == 0)
  {
    objc_msgSend(v4, "setExplicitRating:", objc_msgSend(*(id *)(a1 + 40), "explicitRating"));
  }
  v25 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v25 + 64) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "artistStoreID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v26);

    v28 = MEMORY[0x1E0C809B0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v66[3] = &__block_descriptor_41_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
    v66[4] = v27;
    v67 = *(_BYTE *)(a1 + 64);
    v29 = (void *)MEMORY[0x19403A810](v66);
    v64[0] = v28;
    v64[1] = 3221225472;
    v64[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
    v64[3] = &unk_1E315A528;
    v30 = *(void **)(a1 + 40);
    v64[4] = *(_QWORD *)(a1 + 32);
    v65 = v30;
    v31 = (void *)MEMORY[0x19403A810](v64);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipTVEpisodeShow")))
    {
      objc_msgSend(*(id *)(a1 + 48), "show");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "identifiers");
      v33 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
      v34 = -[MPIdentifierSet copyWithSource:block:](v33, "copyWithSource:block:", CFSTR("StorePlatform"), v29);
      v35 = (MPModelTVShow *)objc_msgSend(v32, "copyWithIdentifiers:block:", v34, v31);

    }
    else
    {
      v36 = [MPModelTVShow alloc];
      v37 = [MPIdentifierSet alloc];
      +[MPModelTVShowKind identityKind](MPModelTVShowKind, "identityKind");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[MPIdentifierSet initWithSource:modelKind:block:](v37, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v32, v29);
      v35 = -[MPModelObject initWithIdentifiers:block:](v36, "initWithIdentifiers:block:", v33, v31);
    }

    objc_msgSend(v4, "setShow:", v35);
    v25 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v25 + 52) & 1) != 0)
  {
    v38 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
    v60[3] = &unk_1E315A598;
    v61 = *(id *)(a1 + 40);
    v63 = *(_BYTE *)(a1 + 64);
    v62 = *(id *)(a1 + 56);
    v39 = (void *)MEMORY[0x19403A810](v60);
    v53 = v38;
    v54 = 3221225472;
    v55 = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_12;
    v56 = &unk_1E315A5C0;
    v40 = *(void **)(a1 + 40);
    v57 = *(_QWORD *)(a1 + 32);
    v58 = v40;
    v59 = *(_BYTE *)(a1 + 64);
    v41 = (void *)MEMORY[0x19403A810](&v53);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipTVEpisodeSeason"), v53, v54, v55, v56, v57))
    {
      objc_msgSend(*(id *)(a1 + 48), "season");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "identifiers");
      v43 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
      v44 = -[MPIdentifierSet copyWithSource:block:](v43, "copyWithSource:block:", CFSTR("StorePlatform"), v39);
      v45 = (MPModelTVSeason *)objc_msgSend(v42, "copyWithIdentifiers:block:", v44, v41);

    }
    else
    {
      v46 = [MPModelTVSeason alloc];
      v47 = [MPIdentifierSet alloc];
      +[MPModelTVSeasonKind identityKind](MPModelTVSeasonKind, "identityKind");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[MPIdentifierSet initWithSource:modelKind:block:](v47, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v42, v39);
      v45 = -[MPModelObject initWithIdentifiers:block:](v46, "initWithIdentifiers:block:", v43, v41);
    }

    objc_msgSend(v4, "setSeason:", v45);
    v25 = *(_QWORD *)(a1 + 32);
  }
  v48 = *(void **)(v25 + 24);
  if (v48)
  {
    v49 = *(_QWORD *)(a1 + 40);
    v50 = objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipTVEpisodePlaybackPosition"));
    if (v50)
    {
      objc_msgSend(*(id *)(a1 + 48), "playbackPosition");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = 0;
    }
    objc_msgSend(v48, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v49, v51, *(_QWORD *)(a1 + 56));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlaybackPosition:", v52);

    if (v50)
  }

}

MPArtworkCatalog *__96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  MPArtworkCatalog *v2;
  void *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestTokenForScreenshotArtwork");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = [MPArtworkCatalog alloc];
    +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MPArtworkCatalog initWithToken:dataSource:](v2, "initWithToken:dataSource:", v1, v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
  v6[3] = &unk_1E315A4E0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(_BYTE *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 64) & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "artistName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v4);

    v3 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v3 + 68) & 1) != 0)
    objc_msgSend(v5, "setCreator:", 0);

}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  char v12;

  v9 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
  v10[3] = &unk_1E315A550;
  v11 = *(id *)(a1 + 32);
  v12 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v10);
  objc_msgSend(v9, "personalizedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "DSIDForUserIdentity:outError:", *(_QWORD *)(a1 + 40), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v6, &__block_literal_global_25996);

}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MPIdentifierSet *v16;
  id v17;
  MPModelTVShow *v18;
  MPModelTVShow *v19;
  MPIdentifierSet *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];
  char v28;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(v4 + 52);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(v3, "setNumber:", objc_msgSend(*(id *)(a1 + 40), "seasonNumber"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_BYTE *)(v4 + 52);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "releaseDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "component:fromDate:", 4, v6);

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v3, "setYear:", v8);

    v4 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v4 + 56) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "artistStoreID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v9);

    v11 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13;
    v27[3] = &__block_descriptor_41_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
    v27[4] = v10;
    v28 = *(_BYTE *)(a1 + 48);
    v12 = (void *)MEMORY[0x19403A810](v27);
    v21 = v11;
    v22 = 3221225472;
    v23 = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_15;
    v24 = &unk_1E315A528;
    v13 = *(void **)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 32);
    v26 = v13;
    v14 = (void *)MEMORY[0x19403A810](&v21);
    if (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipTVSeasonShow"), v21, v22, v23, v24, v25))
    {
      objc_msgSend(v3, "show");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifiers");
      v16 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
      v17 = -[MPIdentifierSet copyWithSource:block:](v16, "copyWithSource:block:", CFSTR("StorePlatform"), v12);
      v18 = (MPModelTVShow *)objc_msgSend(v15, "copyWithIdentifiers:block:", v17, v14);

    }
    else
    {
      v19 = [MPModelTVShow alloc];
      v20 = [MPIdentifierSet alloc];
      +[MPModelTVShowKind identityKind](MPModelTVShowKind, "identityKind");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MPIdentifierSet initWithSource:modelKind:block:](v20, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v15, v12);
      v18 = -[MPModelObject initWithIdentifiers:block:](v19, "initWithIdentifiers:block:", v16, v14);
    }

    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) & 1) != 0)
      objc_msgSend(v3, "setShow:", v18);

  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14;
  v6[3] = &unk_1E315A4E0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(_BYTE *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 56) & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "artistName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v4);

    v3 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v3 + 60) & 1) != 0)
    objc_msgSend(v5, "setCreator:", 0);

}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
    objc_msgSend(v7, "setAdamID:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "universalStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "subscriptionAdamID");

    if (!v6)
      objc_msgSend(v7, "setSubscriptionAdamID:", *(_QWORD *)(a1 + 40));
  }

}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "collectionStoreID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v3);

  objc_msgSend(v5, "setAdamID:", v4);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v5, "setSubscriptionAdamID:", v4);

}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
    objc_msgSend(v7, "setAdamID:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "universalStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "subscriptionAdamID");

    if (!v6)
      objc_msgSend(v7, "setSubscriptionAdamID:", *(_QWORD *)(a1 + 40));
  }

}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "storeID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v5));

  }
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "subscriptionAdamID");

  if (!v7)
    objc_msgSend(v13, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 40), "subscriptionAdamID"));
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "purchasedAdamID");

  if (!v9)
    objc_msgSend(v13, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 40), "purchasedAdamID"));
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "universalCloudLibraryID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "cloudUniversalLibraryID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUniversalCloudLibraryID:", v12);

  }
}

void __96__MPStoreModelTVEpisodeBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "personalizedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cloudID");

  if (!v4)
    objc_msgSend(v8, "setCloudID:", objc_msgSend(*(id *)(a1 + 40), "cloudID"));
  objc_msgSend(*(id *)(a1 + 32), "personalizedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudAlbumID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "cloudAlbumID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCloudAlbumID:", v7);

  }
}

@end
