@implementation MPStoreModelMovieBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);
  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);
  objc_storeStrong((id *)&self->_mediaClipBuilder, 0);
  objc_storeStrong((id *)&self->_playbackPositionBuilder, 0);
}

+ (id)allSupportedProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MPPropertySet *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[17];

  v13[16] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v13[0] = CFSTR("MPModelPropertyMovieTitle");
  v13[1] = CFSTR("MPModelPropertyMovieDescriptionText");
  v13[2] = CFSTR("MPModelPropertyMovieDuration");
  v13[3] = CFSTR("MPModelPropertyMovieReleaseDate");
  v13[4] = CFSTR("MPModelPropertyMovieExplicitRating");
  v13[5] = CFSTR("MPModelPropertyMovieTagline");
  v13[6] = CFSTR("MPModelPropertyMovieArtwork");
  v13[7] = CFSTR("MPModelPropertyMovieEditorialArtwork");
  v13[8] = CFSTR("MPModelPropertyMovieHasCloudSyncSource");
  v13[9] = CFSTR("MPModelPropertyMovieLibraryAdded");
  v13[10] = CFSTR("MPModelPropertyMovieLibraryAddEligible");
  v13[11] = CFSTR("MPModelPropertyMovieKeepLocalEnableState");
  v13[12] = CFSTR("MPModelPropertyMovieKeepLocalManagedStatus");
  v13[13] = CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason");
  v13[14] = CFSTR("MPModelPropertyMovieKeepLocalConstraints");
  v13[15] = CFSTR("MPModelPropertyMovieStoreCanonicalID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("MPModelRelationshipMovieClips");
  +[MPStoreModelMovieMediaClipBuilder allSupportedProperties](MPStoreModelMovieMediaClipBuilder, "allSupportedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("MPModelRelationshipMovieStoreAsset");
  +[MPStoreModelStoreAssetBuilder allSupportedProperties](MPStoreModelStoreAssetBuilder, "allSupportedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("MPModelRelationshipMovieLocalFileAsset");
  +[MPModelFileAsset allSupportedProperties](MPModelFileAsset, "allSupportedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("MPModelRelationshipMoviePlaybackPosition");
  +[MPStoreModelPlaybackPositionBuilder allSupportedProperties](MPStoreModelPlaybackPositionBuilder, "allSupportedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, v8);

  return v9;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
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
  MPPropertySet *v30;
  MPPropertySet *storeAssetProperties;
  void *v32;
  void *v33;
  MPStoreModelPlaybackPositionBuilder *v34;
  MPStoreModelPlaybackPositionBuilder *playbackPositionBuilder;
  void *v36;
  MPStoreModelMovieMediaClipBuilder *v37;
  MPStoreModelMovieMediaClipBuilder *mediaClipBuilder;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  MPIdentifierSet *v48;
  uint64_t v49;
  MPModelMovie *v50;
  MPIdentifierSet *v51;
  void *v52;
  void *v53;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_BYTE *)&self->_requestedMovieProperties & 1) == 0)
  {
    v55 = v9;
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieTitle")))
      v13 = 2;
    else
      v13 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFFD | v13);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieDescriptionText")))
      v14 = 4;
    else
      v14 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFFB | v14);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieDuration")))
      v15 = 8;
    else
      v15 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFF7 | v15);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieReleaseDate")))
      v16 = 16;
    else
      v16 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFEF | v16);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieExplicitRating")))
      v17 = 32;
    else
      v17 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFDF | v17);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieTagline")))
      v18 = 64;
    else
      v18 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFFBF | v18);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieArtwork")))
      v19 = 128;
    else
      v19 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFF7F | v19);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieEditorialArtwork")))
      v20 = 256;
    else
      v20 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFEFF | v20);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieLibraryAdded")))
      v21 = 0x8000;
    else
      v21 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFF7FFF | v21);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieKeepLocalEnableState")))
      v22 = 512;
    else
      v22 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFDFF | v22);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatus")))
      v23 = 1024;
    else
      v23 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFFBFF | v23);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason")))
      v24 = 2048;
    else
      v24 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFF7FF | v24);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieKeepLocalConstraints")))
      v25 = 4096;
    else
      v25 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFEFFF | v25);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieLibraryAddEligible")))
      v26 = 0x10000;
    else
      v26 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFEFFFF | v26);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieHasCloudSyncSource")))
      v27 = 0x2000;
    else
      v27 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFFDFFF | v27);
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyMovieStoreCanonicalID")))
      v28 = 0x20000;
    else
      v28 = 0;
    self->_requestedMovieProperties = ($66E7E9F09768233B382F6E3BE29FA9D5)(*(_DWORD *)&self->_requestedMovieProperties & 0xFFFDFFFF | v28);
    objc_msgSend(v11, "relationships");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipMovieStoreAsset"));
    v30 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
    storeAssetProperties = self->_storeAssetProperties;
    self->_storeAssetProperties = v30;

    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipMovieLocalFileAsset"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      *(_DWORD *)&self->_requestedMovieProperties |= 0x4000u;
    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipMoviePlaybackPosition"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelPlaybackPositionBuilder alloc], "initWithRequestedPropertySet:", v33);
      playbackPositionBuilder = self->_playbackPositionBuilder;
      self->_playbackPositionBuilder = v34;

    }
    objc_msgSend(v29, "objectForKey:", CFSTR("MPModelRelationshipMovieClips"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelMovieMediaClipBuilder alloc], "initWithRequestedPropertySet:", v36);
      mediaClipBuilder = self->_mediaClipBuilder;
      self->_mediaClipBuilder = v37;

    }
    *(_DWORD *)&self->_requestedMovieProperties |= 1u;

    v9 = v55;
  }
  v39 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v60[3] = &unk_1E3162A70;
  v40 = v8;
  v61 = v40;
  v41 = v10;
  v62 = v41;
  v42 = (void *)MEMORY[0x19403A810](v60);
  v56[0] = v39;
  v56[1] = 3221225472;
  v56[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v56[3] = &unk_1E3162AD0;
  v56[4] = self;
  v43 = v40;
  v57 = v43;
  v44 = v9;
  v58 = v44;
  v45 = v41;
  v59 = v45;
  v46 = (void *)MEMORY[0x19403A810](v56);
  if (v44)
  {
    objc_msgSend(v44, "identifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (MPIdentifierSet *)objc_msgSend(v47, "copyWithSource:block:", CFSTR("StorePlatform"), v42);
    v49 = objc_msgSend(v44, "copyWithIdentifiers:block:", v48, v46);
  }
  else
  {
    v50 = [MPModelMovie alloc];
    v51 = [MPIdentifierSet alloc];
    +[MPModelMovieKind identityKind](MPModelMovieKind, "identityKind");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[MPIdentifierSet initWithSource:modelKind:block:](v51, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v47, v42);
    v49 = -[MPModelObject initWithIdentifiers:block:](v50, "initWithIdentifiers:block:", v48, v46);
  }
  v52 = (void *)v49;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addStoreItemMetadata:", v43);

  }
  return v52;
}

void __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v15[3] = &unk_1E3162A20;
  v11 = v3;
  v16 = v11;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v11, "setUniversalStoreIdentifiersWithBlock:", v15);
  objc_msgSend(v11, "personalizedStore");
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
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "DSIDForUserIdentity:outError:", *(_QWORD *)(a1 + 40), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v8, "length"))
  {
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
    v12[3] = &unk_1E3162A48;
    v13 = v11;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v13, "setPersonalStoreIdentifiersWithPersonID:block:", v8, v12);

  }
}

void __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  MPStoreModelStoreAssetBuilder *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieTitle")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieDescriptionText")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "descriptionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDescriptionText:", v6);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieDuration")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "duration");
    objc_msgSend(v4, "setDuration:");
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieReleaseDate")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "releaseDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReleaseDate:", v7);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieExplicitRating")) & 1) == 0)
  {
    objc_msgSend(v4, "setExplicitRating:", objc_msgSend(*(id *)(a1 + 40), "explicitRating"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieTagline")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "editorNotesWithStyle:", CFSTR("tagline"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTagline:", v8);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieStoreCanonicalID")) & 1) == 0)
  {
    objc_msgSend(v4, "setStoreCanonicalID:", &stru_1E3163D10);
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 48);
  if (!v10 && (*(_BYTE *)(v9 + 58) & 1) == 0)
  {
    v11 = 0;
    goto LABEL_42;
  }
  v12 = *(void **)(v9 + 40);
  if (!v12)
  {
    if ((*(_BYTE *)(v9 + 58) & 1) != 0)
    {
      v47[0] = CFSTR("MPModelPropertyStoreAssetRedownloadable");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v15);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v16 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      if (v16)
      {
        v17 = v16;
        if (v14)
        {
          objc_msgSend(v16, "propertySetByCombiningWithPropertySet:", v14);
          v18 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v18;
        }
        goto LABEL_34;
      }
    }
    else
    {
      v13 = v10;
      v14 = 0;
      if (v10)
      {
LABEL_33:
        v17 = v13;
LABEL_34:
        v19 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelStoreAssetBuilder alloc], "initWithRequestedPropertySet:", v17);
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        goto LABEL_35;
      }
    }
    v13 = v14;
    v14 = v13;
    goto LABEL_33;
  }
LABEL_35:
  v22 = *(_QWORD *)(a1 + 40);
  v23 = objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipMovieStoreAsset"));
  if (v23)
  {
    objc_msgSend(*(id *)(a1 + 48), "storeAsset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v12, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v22, v24, *(_QWORD *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 48))
  {
    objc_msgSend(v4, "setStoreAsset:", v11);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_42:
  if ((*(_BYTE *)(v9 + 58) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieLibraryAddEligible")) & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAddEligible:", objc_msgSend(v11, "isRedownloadable"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieLibraryAdded")) & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAdded:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieHasCloudSyncSource")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasCloudSyncSource:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieKeepLocalEnableState")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalEnableState:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatus")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatus:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatusReason:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieKeepLocalConstraints")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalConstraints:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipMovieLocalFileAsset")) & 1) == 0)
  {
    objc_msgSend(v4, "setLocalFileAsset:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieArtwork")) & 1) == 0)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v44[3] = &unk_1E3162AA8;
    v45 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v44);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMovieEditorialArtwork")) & 1) == 0)
  {
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v42[3] = &unk_1E3162AA8;
    v43 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setEditorialArtworkCatalogBlock:", v42);

  }
  v25 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v25)
  {
    v26 = *(_QWORD *)(a1 + 40);
    v27 = objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipMoviePlaybackPosition"));
    if (v27)
    {
      objc_msgSend(*(id *)(a1 + 48), "playbackPosition");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v25, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v26, v28, *(_QWORD *)(a1 + 56));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlaybackPosition:", v29);

    if (v27)
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v37 = v11;
    objc_msgSend(*(id *)(a1 + 40), "movieClips");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v31)
    {
      v32 = v31;
      v33 = 0;
      v34 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v39 != v34)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "mediaClipWithStoreItemMetadata:storeItemMovieClip:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            if (!v33)
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v30, "count"));
            objc_msgSend(v33, "addObject:", v36);
          }

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v32);
    }
    else
    {
      v33 = 0;
    }

    objc_msgSend(v4, "setClips:", v33);
    v11 = v37;
  }

}

MPArtworkCatalog *__92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  MPArtworkCatalog *v2;
  void *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestToken");
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

MPArtworkCatalog *__92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1)
{
  void *v1;
  MPArtworkCatalog *v2;
  void *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "movieArtworkRequestToken");
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

void __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
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

void __92__MPStoreModelMovieBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
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
