@implementation MPStoreModelSongBuilder

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
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

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
  v5[3] = &unk_1E3162A20;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  objc_msgSend(v4, "setUniversalStoreIdentifiersWithBlock:", v5);

}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "artistStoreID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v5));

  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "storeID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v5));

  }
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formerAdamIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "formerStoreAdamIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFormerAdamIDs:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "subscriptionAdamID");

  if (!v11)
    objc_msgSend(v17, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 40), "subscriptionAdamID"));
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "purchasedAdamID");

  if (!v13)
    objc_msgSend(v17, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 40), "purchasedAdamID"));
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "universalCloudLibraryID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "cloudUniversalLibraryID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUniversalCloudLibraryID:", v16);

  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  MPStoreModelStoreAssetBuilder *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t IsArtistUploadedContent;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _BYTE *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  MPIdentifierSet *v44;
  void *v45;
  id v46;
  MPModelAlbum *v47;
  MPModelAlbum *v48;
  MPIdentifierSet *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  MPIdentifierSet *v55;
  void *v56;
  id v57;
  MPModelArtist *v58;
  MPModelArtist *v59;
  MPIdentifierSet *v60;
  void *v61;
  void *v62;
  void *v63;
  MPModelComposer *v64;
  MPModelComposer *v65;
  void *v66;
  void *v67;
  void *v68;
  MPModelGenre *v69;
  MPModelGenre *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  MPModelLyrics *v75;
  MPModelLyrics *v76;
  void *v77;
  uint64_t v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  _QWORD v85[5];
  id v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  id v90;
  _QWORD v91[5];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[5];
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[3];

  v101[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongTitle")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongDuration")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "duration");
    objc_msgSend(v4, "setDuration:");
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("_MPModelPropertySongTrackCount")) & 1) == 0)
  {
    objc_msgSend(v4, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongTrackNumber")) & 1) == 0)
  {
    objc_msgSend(v4, "setTrackNumber:", objc_msgSend(*(id *)(a1 + 40), "trackNumber"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongDiscNumber")) & 1) == 0)
  {
    objc_msgSend(v4, "setDiscNumber:", objc_msgSend(*(id *)(a1 + 40), "discNumber"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongExplicit")) & 1) == 0)
  {
    objc_msgSend(v4, "setExplicitSong:", objc_msgSend(*(id *)(a1 + 40), "isExplicitContent"));
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  if (!v7 && (*(_BYTE *)(v6 + 50) & 8) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "itemKind", 0);
    goto LABEL_40;
  }
  v8 = *(void **)(v6 + 32);
  if (!v8)
  {
    if ((*(_BYTE *)(v6 + 50) & 8) != 0)
    {
      v101[0] = CFSTR("MPModelPropertyStoreAssetRedownloadable");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v11);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v12 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
      if (v12)
      {
        v13 = v12;
        if (v10)
        {
          objc_msgSend(v12, "propertySetByCombiningWithPropertySet:", v10);
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v14;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v9 = v7;
      v10 = 0;
      if (v7)
      {
LABEL_30:
        v13 = v9;
LABEL_31:
        v15 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelStoreAssetBuilder alloc], "initWithRequestedPropertySet:", v13);
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(v16 + 32);
        *(_QWORD *)(v16 + 32) = v15;

        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        goto LABEL_32;
      }
    }
    v9 = v10;
    v10 = v9;
    goto LABEL_30;
  }
LABEL_32:
  v18 = *(_QWORD *)(a1 + 40);
  v19 = objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongStoreAsset"));
  if (v19)
  {
    objc_msgSend(*(id *)(a1 + 48), "storeAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v8, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v18, v20, *(_QWORD *)(a1 + 56));
  v83 = objc_claimAutoreleasedReturnValue();
  if (v19)

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    objc_msgSend(v4, "setStoreAsset:", v83);
  objc_msgSend(*(id *)(a1 + 40), "itemKind", v83);
LABEL_40:
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  IsArtistUploadedContent = MPStoreItemMetadataItemKindIsArtistUploadedContent(v84);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongArtistUploadedContent")) & 1) == 0)
  {
    objc_msgSend(v4, "setArtistUploadedContent:", IsArtistUploadedContent);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongLibraryAddEligible")) & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAddEligible:", objc_msgSend(v82, "isRedownloadable") & (IsArtistUploadedContent ^ 1));
  }
  if ((objc_msgSend(v84, "isEqualToString:", CFSTR("musicVideo")) & 1) != 0)
    v22 = 1;
  else
    v22 = objc_msgSend(v84, "isEqualToString:", CFSTR("uploadedVideo"));
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongHasVideo")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasVideo:", v22);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongCopyrightText")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "copyrightText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCopyrightText:", v23);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongLibraryAdded")) & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAdded:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongHasCloudSyncSource")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasCloudSyncSource:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongKeepLocalEnableState")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalEnableState:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongKeepLocalManagedStatus")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatus:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongKeepLocalManagedStatusReason")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatusReason:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongKeepLocalConstraints")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalConstraints:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongShouldShowComposer")) & 1) == 0)
  {
    objc_msgSend(v4, "setShouldShowComposer:", objc_msgSend(*(id *)(a1 + 40), "showComposer"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongGaplessInfo")) & 1) == 0)
  {
    objc_msgSend(v4, "setGaplessInfo:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongVolumeNormalization")) & 1) == 0)
  {
    LODWORD(v24) = 0;
    objc_msgSend(v4, "setVolumeNormalization:", v24);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongLocalFileAsset")) & 1) == 0)
  {
    objc_msgSend(v4, "setLocalFileAsset:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) & 4) != 0)
  {
    if (!objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongArtwork"))
      || (objc_msgSend(v4, "artworkCatalogBlock"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v25,
          !v25))
    {
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
      v99[3] = &unk_1E3161BC8;
      v100 = *(id *)(a1 + 40);
      objc_msgSend(v4, "setArtworkCatalogBlock:", v99);

    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongYear")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "releaseDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "component:fromDate:", 4, v26);

    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v4, "setYear:", v28);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongUserRating")) & 1) == 0)
  {
    LODWORD(v29) = 0;
    objc_msgSend(v4, "setUserRating:", v29);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongCloudStatus")) & 1) == 0)
  {
    objc_msgSend(v4, "setCloudStatus:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongVolumeAdjustment")) & 1) == 0)
  {
    LODWORD(v30) = 1.0;
    objc_msgSend(v4, "setVolumeAdjustment:", v30);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongTraits")) & 1) == 0)
  {
    v31 = objc_msgSend(*(id *)(a1 + 40), "isMasteredForiTunes");
    +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEnhancedAudioAvailable");

    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 40), "audioTraits");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "containsObject:", CFSTR("spatial")))
        v35 = v31 | 8;
      else
        v35 = v31;
      if (objc_msgSend(v34, "containsObject:", CFSTR("atmos")))
        v35 |= 0x10uLL;
      if (objc_msgSend(v34, "containsObject:", CFSTR("surround")))
        v35 |= 0x20uLL;
      if (objc_msgSend(v34, "containsObject:", CFSTR("lossless")))
        v35 |= 2uLL;
      if (objc_msgSend(v34, "containsObject:", CFSTR("hi-res-lossless")))
        v31 = v35 | 4;
      else
        v31 = v35;

    }
    objc_msgSend(v4, "setTraits:", v31);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongSupportsExtendedLyricsAttribute")) & 1) == 0)
  {
    objc_msgSend(v4, "setSupportsExtendedLyricsAttribute:", objc_msgSend(*(id *)(a1 + 40), "supportsVocalAttenuation"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongGrouping")) & 1) == 0)
  {
    objc_msgSend(v4, "setGrouping:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongClassicalWork")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "workName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClassicalWork:", v36);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongClassicalMovement")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "movementName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClassicalMovement:", v37);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongClassicalMovementCount")) & 1) == 0)
  {
    objc_msgSend(v4, "setClassicalMovementCount:", objc_msgSend(*(id *)(a1 + 40), "movementCount"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongClassicalMovementNumber")) & 1) == 0)
  {
    objc_msgSend(v4, "setClassicalMovementNumber:", objc_msgSend(*(id *)(a1 + 40), "movementNumber"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongIsFavorite")) & 1) == 0)
  {
    objc_msgSend(v4, "setIsFavorite:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongIsDisliked")) & 1) == 0)
  {
    objc_msgSend(v4, "setIsDisliked:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongDateFavorited")) & 1) == 0)
  {
    objc_msgSend(v4, "setDateFavorited:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongHasCredits")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasCredits:", objc_msgSend(*(id *)(a1 + 40), "hasCredits"));
  }
  v38 = *(_BYTE **)(a1 + 32);
  if ((v38[56] & 1) != 0)
  {
    v39 = MEMORY[0x1E0C809B0];
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v97[3] = &unk_1E3163A58;
    v98 = *(id *)(a1 + 40);
    v40 = (void *)MEMORY[0x19403A810](v97);
    v95[0] = v39;
    v95[1] = 3221225472;
    v95[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
    v95[3] = &unk_1E3161C30;
    v41 = *(void **)(a1 + 40);
    v95[4] = *(_QWORD *)(a1 + 32);
    v96 = v41;
    v42 = (void *)MEMORY[0x19403A810](v95);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongAlbum")))
    {
      objc_msgSend(*(id *)(a1 + 48), "album");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "identifiers");
      v44 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
      v45 = v4;
      v46 = -[MPIdentifierSet copyWithSource:block:](v44, "copyWithSource:block:", CFSTR("StorePlatform"), v40);
      v47 = (MPModelAlbum *)objc_msgSend(v43, "copyWithIdentifiers:block:", v46, v42);

      v4 = v45;
    }
    else
    {
      v48 = [MPModelAlbum alloc];
      v49 = [MPIdentifierSet alloc];
      +[MPModelAlbumKind identityKind](MPModelAlbumKind, "identityKind");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[MPIdentifierSet initWithSource:modelKind:block:](v49, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v43, v40);
      v47 = -[MPModelObject initWithIdentifiers:block:](v48, "initWithIdentifiers:block:", v44, v42);
    }

    objc_msgSend(v4, "setAlbum:", v47);
    v38 = *(_BYTE **)(a1 + 32);
  }
  if ((v38[60] & 1) != 0)
  {
    v50 = MEMORY[0x1E0C809B0];
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
    v93[3] = &unk_1E3163A58;
    v94 = *(id *)(a1 + 40);
    v51 = (void *)MEMORY[0x19403A810](v93);
    v91[0] = v50;
    v91[1] = 3221225472;
    v91[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_11;
    v91[3] = &unk_1E3161C58;
    v52 = *(void **)(a1 + 40);
    v91[4] = *(_QWORD *)(a1 + 32);
    v92 = v52;
    v53 = (void *)MEMORY[0x19403A810](v91);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongArtist")))
    {
      objc_msgSend(*(id *)(a1 + 48), "artist");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "identifiers");
      v55 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
      v56 = v4;
      v57 = -[MPIdentifierSet copyWithSource:block:](v55, "copyWithSource:block:", CFSTR("StorePlatform"), v51);
      v58 = (MPModelArtist *)objc_msgSend(v54, "copyWithIdentifiers:block:", v57, v53);

      v4 = v56;
    }
    else
    {
      v59 = [MPModelArtist alloc];
      v60 = [MPIdentifierSet alloc];
      +[MPModelArtistKind identityKind](MPModelArtistKind, "identityKind");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[MPIdentifierSet initWithSource:modelKind:block:](v60, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v54, v51);
      v58 = -[MPModelObject initWithIdentifiers:block:](v59, "initWithIdentifiers:block:", v55, v53);
    }

    objc_msgSend(v4, "setArtist:", v58);
    v38 = *(_BYTE **)(a1 + 32);
  }
  if ((v38[64] & 1) != 0)
  {
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_12;
    v89[3] = &unk_1E3161C80;
    v89[4] = v38;
    v90 = *(id *)(a1 + 40);
    v61 = (void *)MEMORY[0x19403A810](v89);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongComposer")))
    {
      objc_msgSend(*(id *)(a1 + 48), "composer");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "identifiers");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (MPModelComposer *)objc_msgSend(v62, "copyWithIdentifiers:block:", v63, v61);

    }
    else
    {
      v65 = [MPModelComposer alloc];
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = -[MPModelObject initWithIdentifiers:block:](v65, "initWithIdentifiers:block:", v62, v61);
    }

    objc_msgSend(v4, "setComposer:", v64);
    v38 = *(_BYTE **)(a1 + 32);
  }
  if ((v38[68] & 1) != 0)
  {
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13;
    v87[3] = &unk_1E3161CA8;
    v87[4] = v38;
    v88 = *(id *)(a1 + 40);
    v66 = (void *)MEMORY[0x19403A810](v87);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongGenre")))
    {
      objc_msgSend(*(id *)(a1 + 48), "genre");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "identifiers");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (MPModelGenre *)objc_msgSend(v67, "copyWithIdentifiers:block:", v68, v66);

    }
    else
    {
      v70 = [MPModelGenre alloc];
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[MPModelObject initWithIdentifiers:block:](v70, "initWithIdentifiers:block:", v67, v66);
    }

    objc_msgSend(v4, "setGenre:", v69);
    v38 = *(_BYTE **)(a1 + 32);
  }
  if ((v38[72] & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongHomeSharingAsset")) & 1) == 0)
  {
    objc_msgSend(v4, "setHomeSharingAsset:", 0);
  }
  v71 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v71 + 76) & 1) != 0)
  {
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14;
    v85[3] = &unk_1E3161CD0;
    v85[4] = v71;
    v86 = *(id *)(a1 + 40);
    v72 = (void *)MEMORY[0x19403A810](v85);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongLyrics")))
    {
      objc_msgSend(*(id *)(a1 + 48), "lyrics");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "identifiers");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = (MPModelLyrics *)objc_msgSend(v73, "copyWithIdentifiers:block:", v74, v72);

    }
    else
    {
      v76 = [MPModelLyrics alloc];
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = -[MPModelObject initWithIdentifiers:block:](v76, "initWithIdentifiers:block:", v73, v72);
    }

    objc_msgSend(v4, "setLyrics:", v75);
    v71 = *(_QWORD *)(a1 + 32);
  }
  v77 = *(void **)(v71 + 24);
  if (v77)
  {
    v78 = *(_QWORD *)(a1 + 40);
    v79 = objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongPlaybackPosition"));
    if (v79)
    {
      objc_msgSend(*(id *)(a1 + 48), "playbackPosition");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = 0;
    }
    objc_msgSend(v77, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v78, v80, *(_QWORD *)(a1 + 56));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlaybackPosition:", v81);

    if (v79)
  }

}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
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
  v15[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
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
    v12[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
    v12[3] = &unk_1E3162A48;
    v13 = v11;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v13, "setPersonalStoreIdentifiersWithPersonID:block:", v8, v12);

  }
}

MPArtworkCatalog *__91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
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

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  $5B329CE9CF4C19C21CB15D51AF0D80CC *p_requestedSongProperties;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  char v86;
  char v87;
  char v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
  char v108;
  char v109;
  void *v110;
  void *v111;
  MPStoreModelPlaybackPositionBuilder *v112;
  MPStoreModelPlaybackPositionBuilder *playbackPositionBuilder;
  MPPropertySet *v114;
  MPPropertySet *storeAssetProperties;
  uint64_t v116;
  id v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  MPIdentifierSet *v125;
  uint64_t v126;
  MPModelSong *v127;
  MPIdentifierSet *v128;
  void *v129;
  void *v130;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  id v136;
  id v137;
  _QWORD v138[5];
  id v139;
  id v140;
  id v141;
  _QWORD v142[4];
  id v143;
  id v144;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  p_requestedSongProperties = &self->_requestedSongProperties;
  if ((*(_BYTE *)&self->_requestedSongProperties & 1) == 0)
  {
    v135 = v10;
    v136 = v8;
    v137 = v9;
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongTitle")))
      v15 = 2;
    else
      v15 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFFDLL | v15;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongDuration")))
      v16 = 4;
    else
      v16 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFFBLL | v16;
    if (objc_msgSend(v14, "containsObject:", CFSTR("_MPModelPropertySongTrackCount")))
      v17 = 8;
    else
      v17 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFF7 | v17;
    v18 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongTrackNumber"));
    v19 = 16;
    if (!v18)
      v19 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFEFLL | v19;
    if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongDiscNumber")))
      v20 = 32;
    else
      v20 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFDFLL | v20;
    v21 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongExplicit"));
    v22 = 128;
    if (!v21)
      v22 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFF7FLL | v22;
    v23 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongArtistUploadedContent"));
    v24 = 256;
    if (!v23)
      v24 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFEFFLL | v24;
    v25 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongHasVideo"));
    v26 = 512;
    if (!v25)
      v26 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFDFFLL | v26;
    v27 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongArtwork"));
    v28 = 1024;
    if (!v27)
      v28 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFBFFLL | v28;
    v29 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongCopyrightText"));
    v30 = 2048;
    if (!v29)
      v30 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFF7FFLL | v30;
    v31 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongLibraryAdded"));
    v32 = 0x40000;
    if (!v31)
      v32 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFBFFFFLL | v32;
    v33 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongShouldShowComposer"));
    v34 = 0x100000;
    if (!v33)
      v34 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFEFFFFFLL | v34;
    v35 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongVolumeNormalization"));
    v36 = 0x200000;
    if (!v35)
      v36 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFDFFFFFLL | v36;
    v37 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongKeepLocalEnableState"));
    v38 = 4096;
    if (!v37)
      v38 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFEFFFLL | v38;
    v39 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongKeepLocalManagedStatus"));
    v40 = 0x2000;
    if (!v39)
      v40 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFDFFFLL | v40;
    v41 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongKeepLocalManagedStatusReason"));
    v42 = 0x4000;
    if (!v41)
      v42 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFBFFFLL | v42;
    v43 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongKeepLocalConstraints"));
    v44 = 0x8000;
    if (!v43)
      v44 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFF7FFFLL | v44;
    v45 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongLibraryAddEligible"));
    v46 = 0x80000;
    if (!v45)
      v46 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFF7FFFFLL | v46;
    v47 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongGrouping"));
    v48 = 64;
    if (!v47)
      v48 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFFFFBFLL | v48;
    v49 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongHasCloudSyncSource"));
    v50 = 0x10000;
    if (!v49)
      v50 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFFEFFFFLL | v50;
    v51 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongYear"));
    v52 = 0x400000;
    if (!v51)
      v52 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFFBFFFFFLL | v52;
    v53 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongUserRating"));
    v54 = 0x800000;
    if (!v53)
      v54 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFF7FFFFFLL | v54;
    v55 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongCloudStatus"));
    v56 = 0x1000000;
    if (!v55)
      v56 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFEFFFFFFLL | v56;
    v57 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongGaplessInfo"));
    v58 = 0x2000000;
    if (!v57)
      v58 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFDFFFFFFLL | v58;
    v59 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongVolumeAdjustment"));
    v60 = 0x4000000;
    if (!v59)
      v60 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFFBFFFFFFLL | v60;
    v61 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongTraits"));
    v62 = 0x8000000;
    if (!v61)
      v62 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFF7FFFFFFLL | v62;
    v63 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongSupportsExtendedLyricsAttribute"));
    v64 = 0x10000000;
    if (!v63)
      v64 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFEFFFFFFFLL | v64;
    v65 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongIsFavorite"));
    v66 = 0x20000000;
    if (!v65)
      v66 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFDFFFFFFFLL | v66;
    v67 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongIsDisliked"));
    v68 = 0x40000000;
    if (!v67)
      v68 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFFBFFFFFFFLL | v68;
    v69 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongDateFavorited"));
    v70 = 0x80000000;
    if (!v69)
      v70 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFF7FFFFFFFLL | v70;
    v71 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongHasCredits"));
    v72 = 0x100000000;
    if (!v71)
      v72 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFEFFFFFFFFLL | v72;
    v73 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongClassicalWork"));
    v74 = 0x200000000;
    if (!v73)
      v74 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFDFFFFFFFFLL | v74;
    v75 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongClassicalMovement"));
    v76 = 0x400000000;
    if (!v75)
      v76 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFFBFFFFFFFFLL | v76;
    v77 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongClassicalMovementCount"));
    v78 = 0x800000000;
    if (!v77)
      v78 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFF7FFFFFFFFLL | v78;
    v79 = objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertySongClassicalMovementNumber"));
    v80 = 0x1000000000;
    if (!v79)
      v80 = 0;
    *(_QWORD *)p_requestedSongProperties = *(_QWORD *)p_requestedSongProperties & 0xFFFFFFEFFFFFFFFFLL | v80;
    v134 = v13;
    objc_msgSend(v13, "relationships");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongAlbum"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82;
    if (v82)
    {
      objc_msgSend(v82, "properties");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.album |= 1u;
      if (objc_msgSend(v84, "containsObject:", CFSTR("MPModelPropertyAlbumTitle")))
        v85 = 2;
      else
        v85 = 0;
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xFD | v85;
      if (objc_msgSend(v84, "containsObject:", CFSTR("MPModelPropertyAlbumReleaseDateComponents")))
        v86 = 4;
      else
        v86 = 0;
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xFB | v86;
      if (objc_msgSend(v84, "containsObject:", CFSTR("MPModelPropertyAlbumYear")))
        v87 = 8;
      else
        v87 = 0;
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xF7 | v87;
      if (objc_msgSend(v84, "containsObject:", CFSTR("MPModelPropertyAlbumTrackCount")))
        v88 = 32;
      else
        v88 = 0;
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xDF | v88;
      objc_msgSend(v83, "relationships");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "objectForKey:", CFSTR("MPModelRelationshipAlbumArtist"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.album = *(_BYTE *)&self->_requestedSongProperties.album & 0xEF | (16 * (v90 != 0));

    }
    v133 = v83;
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongArtist"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v91;
    if (v91)
    {
      objc_msgSend(v91, "properties");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.artist |= 1u;
      if (objc_msgSend(v93, "containsObject:", CFSTR("MPModelPropertyPersonName")))
        v94 = 2;
      else
        v94 = 0;
      *(_BYTE *)&self->_requestedSongProperties.artist = *(_BYTE *)&self->_requestedSongProperties.artist & 0xFD | v94;

    }
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongComposer"), v92);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95;
    if (v95)
    {
      objc_msgSend(v95, "properties");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.composer |= 1u;
      if (objc_msgSend(v97, "containsObject:", CFSTR("MPModelPropertyPersonName")))
        v98 = 2;
      else
        v98 = 0;
      *(_BYTE *)&self->_requestedSongProperties.composer = *(_BYTE *)&self->_requestedSongProperties.composer & 0xFD | v98;

    }
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongGenre"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v99;
    if (v99)
    {
      objc_msgSend(v99, "properties");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.genre |= 1u;
      if (objc_msgSend(v101, "containsObject:", CFSTR("MPModelPropertyGenreName")))
        v102 = 2;
      else
        v102 = 0;
      *(_BYTE *)&self->_requestedSongProperties.genre = *(_BYTE *)&self->_requestedSongProperties.genre & 0xFD | v102;

    }
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongHomeSharingAsset"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
      *(_BYTE *)&self->_requestedSongProperties.homeSharingAsset |= 1u;
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongLyrics"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v104;
    if (v104)
    {
      objc_msgSend(v104, "properties");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedSongProperties.lyrics |= 1u;
      if (objc_msgSend(v106, "containsObject:", CFSTR("MPModelPropertyLyricsText")))
        v107 = 2;
      else
        v107 = 0;
      *(_BYTE *)&self->_requestedSongProperties.lyrics = *(_BYTE *)&self->_requestedSongProperties.lyrics & 0xFD | v107;
      if (objc_msgSend(v106, "containsObject:", CFSTR("MPModelPropertyLyricsHasStoreLyrics")))
        v108 = 4;
      else
        v108 = 0;
      *(_BYTE *)&self->_requestedSongProperties.lyrics = *(_BYTE *)&self->_requestedSongProperties.lyrics & 0xFB | v108;
      if (objc_msgSend(v106, "containsObject:", CFSTR("MPModelPropertyLyricsHasTimeSyncedLyrics")))
        v109 = 8;
      else
        v109 = 0;
      *(_BYTE *)&self->_requestedSongProperties.lyrics = *(_BYTE *)&self->_requestedSongProperties.lyrics & 0xF7 | v109;

    }
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongLocalFileAsset"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
      *(_QWORD *)p_requestedSongProperties |= 0x20000uLL;
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongPlaybackPosition"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v111)
    {
      v112 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelPlaybackPositionBuilder alloc], "initWithRequestedPropertySet:", v111);
      playbackPositionBuilder = self->_playbackPositionBuilder;
      self->_playbackPositionBuilder = v112;

    }
    objc_msgSend(v81, "objectForKey:", CFSTR("MPModelRelationshipSongStoreAsset"));
    v114 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
    storeAssetProperties = self->_storeAssetProperties;
    self->_storeAssetProperties = v114;

    *(_QWORD *)p_requestedSongProperties |= 1uLL;
    v8 = v136;
    v9 = v137;
    v11 = v135;
  }
  v116 = MEMORY[0x1E0C809B0];
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v142[3] = &unk_1E3162A70;
  v117 = v8;
  v143 = v117;
  v118 = v11;
  v144 = v118;
  v119 = (void *)MEMORY[0x19403A810](v142);
  v138[0] = v116;
  v138[1] = 3221225472;
  v138[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v138[3] = &unk_1E3157258;
  v138[4] = self;
  v120 = v117;
  v139 = v120;
  v121 = v9;
  v140 = v121;
  v122 = v118;
  v141 = v122;
  v123 = (void *)MEMORY[0x19403A810](v138);
  if (v121)
  {
    objc_msgSend(v121, "identifiers");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = (MPIdentifierSet *)objc_msgSend(v124, "copyWithSource:block:", CFSTR("StorePlatform"), v119);
    v126 = objc_msgSend(v121, "copyWithIdentifiers:block:", v125, v123);
  }
  else
  {
    v127 = [MPModelSong alloc];
    v128 = [MPIdentifierSet alloc];
    +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = -[MPIdentifierSet initWithSource:modelKind:block:](v128, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v124, v119);
    v126 = -[MPModelObject initWithIdentifiers:block:](v127, "initWithIdentifiers:block:", v125, v123);
  }
  v129 = (void *)v126;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "addStoreItemMetadata:", v120);

  }
  return v129;
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  char v16;
  void *v17;

  v3 = a2;
  v4 = v3;
  v17 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 2) != 0)
  {
    v5 = objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumTitle"));
    v4 = v17;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "collectionName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitle:", v6);

      v4 = v17;
    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 4) != 0)
  {
    v7 = objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumReleaseDateComponents"));
    v4 = v17;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "releaseDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "components:fromDate:", 1048604, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setReleaseDateComponents:", v10);

      }
      else
      {
        objc_msgSend(v17, "setReleaseDateComponents:", 0);
      }

      v4 = v17;
    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 8) != 0)
  {
    v11 = objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumYear"));
    v4 = v17;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "releaseDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "component:fromDate:", 4, v12);

      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v17, "setYear:", v14);

      v4 = v17;
    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 0x10) != 0)
  {
    v15 = objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipAlbumArtist"));
    v4 = v17;
    if ((v15 & 1) == 0)
    {
      objc_msgSend(v17, "setArtist:", 0);
      v4 = v17;
    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 0x20) != 0)
  {
    v16 = objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumTrackCount"));
    v4 = v17;
    if ((v16 & 1) == 0)
    {
      objc_msgSend(v17, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
      v4 = v17;
    }
  }

}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 60) & 2) != 0)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPersonName"));
    v4 = v7;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "artistName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v6);

      v4 = v7;
    }
  }

}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  objc_msgSend(v5, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
    v6[3] = &unk_1E3163A30;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "collectionStoreID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v4));

}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  v6 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyLyricsText")) & 1) == 0)
  {
    objc_msgSend(v6, "setText:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) & 4) != 0
    && (objc_msgSend(v6, "hasLoadedValueForKey:", CFSTR("MPModelPropertyLyricsHasStoreLyrics")) & 1) == 0)
  {
    objc_msgSend(v6, "setHasStoreLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasLyrics"));
  }
  v4 = v6;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) & 8) != 0)
  {
    v5 = objc_msgSend(v6, "hasLoadedValueForKey:", CFSTR("MPModelPropertyLyricsHasTimeSyncedLyrics"));
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v6, "setHasTimeSyncedLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasTimeSyncedLyrics"));
      v4 = v6;
    }
  }

}

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
  void *v5;
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
  void *v17;
  MPPropertySet *v18;
  void *v19;
  void *v20;
  void *v21;
  MPPropertySet *v22;
  _QWORD v23[3];
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[8];
  _QWORD v31[8];
  _QWORD v32[37];

  v32[35] = *MEMORY[0x1E0C80C00];
  v22 = [MPPropertySet alloc];
  v32[0] = CFSTR("MPModelPropertySongTitle");
  v32[1] = CFSTR("MPModelPropertySongDuration");
  v32[2] = CFSTR("_MPModelPropertySongTrackCount");
  v32[3] = CFSTR("MPModelPropertySongTrackNumber");
  v32[4] = CFSTR("MPModelPropertySongDiscNumber");
  v32[5] = CFSTR("MPModelPropertySongGrouping");
  v32[6] = CFSTR("MPModelPropertySongExplicit");
  v32[7] = CFSTR("MPModelPropertySongArtistUploadedContent");
  v32[8] = CFSTR("MPModelPropertySongHasVideo");
  v32[9] = CFSTR("MPModelPropertySongArtwork");
  v32[10] = CFSTR("MPModelPropertySongShouldShowComposer");
  v32[11] = CFSTR("MPModelPropertySongCopyrightText");
  v32[12] = CFSTR("MPModelPropertySongVolumeNormalization");
  v32[13] = CFSTR("MPModelPropertySongLibraryAdded");
  v32[14] = CFSTR("MPModelPropertySongKeepLocalEnableState");
  v32[15] = CFSTR("MPModelPropertySongKeepLocalManagedStatus");
  v32[16] = CFSTR("MPModelPropertySongKeepLocalManagedStatusReason");
  v32[17] = CFSTR("MPModelPropertySongKeepLocalConstraints");
  v32[18] = CFSTR("MPModelPropertySongLibraryAddEligible");
  v32[19] = CFSTR("MPModelPropertySongClassicalWork");
  v32[20] = CFSTR("MPModelPropertySongClassicalMovement");
  v32[21] = CFSTR("MPModelPropertySongClassicalMovementNumber");
  v32[22] = CFSTR("MPModelPropertySongClassicalMovementCount");
  v32[23] = CFSTR("MPModelPropertySongHasCloudSyncSource");
  v32[24] = CFSTR("MPModelPropertySongYear");
  v32[25] = CFSTR("MPModelPropertySongUserRating");
  v32[26] = CFSTR("MPModelPropertySongCloudStatus");
  v32[27] = CFSTR("MPModelPropertySongGaplessInfo");
  v32[28] = CFSTR("MPModelPropertySongVolumeAdjustment");
  v32[29] = CFSTR("MPModelPropertySongTraits");
  v32[30] = CFSTR("MPModelPropertySongSupportsExtendedLyricsAttribute");
  v32[31] = CFSTR("MPModelPropertySongIsFavorite");
  v32[32] = CFSTR("MPModelPropertySongIsDisliked");
  v32[33] = CFSTR("MPModelPropertySongDateFavorited");
  v32[34] = CFSTR("MPModelPropertySongHasCredits");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 35);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("MPModelRelationshipSongAlbum");
  v3 = [MPPropertySet alloc];
  v29[0] = CFSTR("MPModelPropertyAlbumTitle");
  v29[1] = CFSTR("MPModelPropertyAlbumReleaseDateComponents");
  v29[2] = CFSTR("MPModelPropertyAlbumYear");
  v29[3] = CFSTR("MPModelPropertyAlbumTrackCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = CFSTR("MPModelRelationshipAlbumArtist");
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPPropertySet initWithProperties:relationships:](v3, "initWithProperties:relationships:", v20, v19);
  v31[0] = v18;
  v30[1] = CFSTR("MPModelRelationshipSongArtist");
  v26 = CFSTR("MPModelPropertyPersonName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v16;
  v30[2] = CFSTR("MPModelRelationshipSongComposer");
  v25 = CFSTR("MPModelPropertyPersonName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v14;
  v30[3] = CFSTR("MPModelRelationshipSongGenre");
  v24 = CFSTR("MPModelPropertyGenreName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v5;
  v30[4] = CFSTR("MPModelRelationshipSongLocalFileAsset");
  +[MPModelFileAsset allSupportedProperties](MPModelFileAsset, "allSupportedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v6;
  v30[5] = CFSTR("MPModelRelationshipSongLyrics");
  v23[0] = CFSTR("MPModelPropertyLyricsText");
  v23[1] = CFSTR("MPModelPropertyLyricsHasStoreLyrics");
  v23[2] = CFSTR("MPModelPropertyLyricsHasTimeSyncedLyrics");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v8;
  v30[6] = CFSTR("MPModelRelationshipSongStoreAsset");
  +[MPStoreModelStoreAssetBuilder allSupportedProperties](MPStoreModelStoreAssetBuilder, "allSupportedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v9;
  v30[7] = CFSTR("MPModelRelationshipSongPlaybackPosition");
  +[MPStoreModelPlaybackPositionBuilder allSupportedProperties](MPStoreModelPlaybackPositionBuilder, "allSupportedProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPPropertySet initWithProperties:relationships:](v22, "initWithProperties:relationships:", v2, v11);

  return v12;
}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) & 2) != 0)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPersonName"));
    v4 = v7;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "composerName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v6);

      v4 = v7;
    }
  }

}

void __91__MPStoreModelSongBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 68) & 2) != 0)
  {
    v9 = v3;
    v5 = objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyGenreName"));
    v4 = v9;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "genreNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      objc_msgSend(v9, "setName:", v8);

      v4 = v9;
    }
  }

}

@end
