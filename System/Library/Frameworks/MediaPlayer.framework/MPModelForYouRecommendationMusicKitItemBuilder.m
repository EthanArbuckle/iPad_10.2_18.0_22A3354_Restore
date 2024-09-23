@implementation MPModelForYouRecommendationMusicKitItemBuilder

- (MPModelForYouRecommendationMusicKitItemBuilder)initWithRequestedPropertySet:(id)a3 storeItemMetadataResults:(id)a4 flatSectionedItems:(id)a5 storeURLBag:(id)a6 isListenNow:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPModelForYouRecommendationMusicKitItemBuilder *v16;
  uint64_t v17;
  MPPropertySet *requestedPropertySet;
  uint64_t v19;
  NSDictionary *storeItemMetadataResults;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MPModelForYouRecommendationMusicKitItemBuilder;
  v16 = -[MPModelForYouRecommendationMusicKitItemBuilder init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    requestedPropertySet = v16->_requestedPropertySet;
    v16->_requestedPropertySet = (MPPropertySet *)v17;

    v19 = objc_msgSend(v13, "copy");
    storeItemMetadataResults = v16->_storeItemMetadataResults;
    v16->_storeItemMetadataResults = (NSDictionary *)v19;

    objc_storeStrong((id *)&v16->_flatSectionedItems, a5);
    objc_storeStrong((id *)&v16->_storeURLBag, a6);
    v16->_isListenNow = a7;
  }

  return v16;
}

- (id)modelObjectForRecommendationChildDictionary:(id)a3 parentGroup:(id)a4 subgroupsAccumulator:(id)a5 userIdentity:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MPPropertySet *v20;
  void *v21;
  MPPropertySet *v22;
  MPModelStoreBrowseContentItemBuilder *v23;
  MPModelStoreBrowseContentItemBuilder *contentItemBuilder;
  void *v25;
  MPModelForYouRecommendationMusicKitGroupBuilder *v26;
  MPModelForYouRecommendationMusicKitGroupBuilder *subgroupBuilder;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  NSObject *v40;
  MPModelForYouRecommendationItem *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  MPModelForYouRecommendationItem *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  MPModelStoreBrowseContentItemBuilder *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[5];
  NSObject *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  char v92;
  uint8_t buf[4];
  id v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v79 = a5;
  v12 = a6;
  -[MPModelForYouRecommendationMusicKitItemBuilder storeItemMetadataResults](self, "storeItemMetadataResults");
  v75 = v10;
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v11;
  v77 = v12;
  if (!self->_requestedItemProperties.isInitialized)
  {
    -[MPModelForYouRecommendationMusicKitItemBuilder requestedPropertySet](self, "requestedPropertySet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_requestedItemProperties.itemType = objc_msgSend(v14, "containsObject:", CFSTR("MPModelForYouRecommendationItemPropertyItemType"));
    self->_requestedItemProperties.url = objc_msgSend(v14, "containsObject:", CFSTR("MPModelForYouRecommendationItemPropertyURL"));
    self->_requestedItemProperties.reason = objc_msgSend(v14, "containsObject:", CFSTR("MPModelForYouRecommendationItemPropertyReason"));
    self->_requestedItemProperties.utterance = objc_msgSend(v14, "containsObject:", CFSTR("MPModelForYouRecommendationItemPropertyUtterance"));
    self->_requestedItemProperties.backedByStoreItemMetadata = objc_msgSend(v14, "containsObject:", CFSTR("MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata"));
    objc_msgSend(v13, "relationships");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipAlbum"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      self->_requestedItemProperties.album = 1;
      objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("MPModelStoreBrowseContentItemRelationshipAlbum"));
    }
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipPlaylist"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      self->_requestedItemProperties.playlist = 1;
      objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("MPModelStoreBrowseContentItemRelationshipPlaylist"));
    }
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipRadioStation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      self->_requestedItemProperties.radioStation = 1;
      objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("MPModelStoreBrowseContentItemRelationshipRadioStation"));
    }
    v20 = [MPPropertySet alloc];
    v95[0] = CFSTR("MPModelStoreBrowseContentItemPropertyItemType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MPPropertySet initWithProperties:relationships:](v20, "initWithProperties:relationships:", v21, v16);

    v23 = -[MPModelStoreBrowseContentItemBuilder initWithRequestedPropertySet:]([MPModelStoreBrowseContentItemBuilder alloc], "initWithRequestedPropertySet:", v22);
    contentItemBuilder = self->_contentItemBuilder;
    self->_contentItemBuilder = v23;

    -[MPModelStoreBrowseContentItemBuilder setPreventStoreItemMetadataCaching:](self->_contentItemBuilder, "setPreventStoreItemMetadataCaching:", 1);
    objc_msgSend(v15, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipSubgroup"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    self->_requestedItemProperties.subgroup = v25 != 0;
    v26 = -[MPModelForYouRecommendationMusicKitGroupBuilder initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:storeURLBag:isListenNow:]([MPModelForYouRecommendationMusicKitGroupBuilder alloc], "initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:storeURLBag:isListenNow:", v25, v13, v76, self->_flatSectionedItems, self->_storeURLBag, self->_isListenNow);
    subgroupBuilder = self->_subgroupBuilder;
    self->_subgroupBuilder = v26;

    self->_requestedItemProperties.isInitialized = 1;
    v11 = v74;
    v10 = v75;
    v12 = v77;
  }
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("id"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v30 = v29;
  else
    v30 = 0;
  objc_msgSend(v10, "objectForKey:", CFSTR("type"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v32 = v31;
  else
    v32 = 0;
  objc_msgSend(v10, "objectForKey:", CFSTR("meta"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v33;
  if (_NSIsNSDictionary())
  {
    v69 = v28;
    objc_msgSend(v33, "objectForKey:", CFSTR("reason"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v34, "objectForKey:", CFSTR("stringForDisplay"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        v78 = v35;
      else
        v78 = 0;

    }
    else
    {
      v78 = 0;
    }
    objc_msgSend(v33, "objectForKey:", CFSTR("utterance"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v37 = v32;
      objc_msgSend(v36, "objectForKey:", CFSTR("stringForDisplay"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        v80 = v38;
      else
        v80 = 0;

      v32 = v37;
      v33 = v72;
    }
    else
    {
      v80 = 0;
    }

    v28 = v69;
    v12 = v77;
  }
  else
  {
    v80 = 0;
    v78 = 0;
  }
  v73 = v31;
  if (!objc_msgSend(v11, "hasLoadedValueForKey:", CFSTR("MPModelForYouRecommendationGroupPropertyTraits"))|| (v39 = objc_msgSend(v11, "traits"), v80)|| (v39 & 1) == 0)
  {
    v70 = v29;
    v42 = v30;
    objc_msgSend(v10, "objectForKey:", CFSTR("attributes"));
    v43 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)v43;
    if (_NSIsNSDictionary())
    {
      v44 = (void *)v43;
      v45 = v11;
      v46 = v28;
      v47 = v12;
      objc_msgSend(v44, "objectForKey:", CFSTR("url"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v48);
        v40 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = 0;
      }

      v12 = v47;
      v28 = v46;
      v11 = v45;
    }
    else
    {
      v40 = 0;
    }
    v68 = v42;
    v71 = v32;
    if (!objc_msgSend(v42, "length")
      || !objc_msgSend(v32, "length")
      || objc_msgSend(v11, "isGroupRecommendation"))
    {
      v49 = v28;
      -[MPModelForYouRecommendationMusicKitGroupBuilder modelObjectForRecommendationDictionary:userIdentity:](self->_subgroupBuilder, "modelObjectForRecommendationDictionary:userIdentity:", v10, v12);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "identifiers");
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 4;
LABEL_46:

      v57 = [MPModelForYouRecommendationItem alloc];
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __140__MPModelForYouRecommendationMusicKitItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke;
      v81[3] = &unk_1E315DAE8;
      v81[4] = self;
      v91 = v56;
      v82 = v40;
      v83 = v78;
      v84 = v80;
      v58 = v53;
      v85 = v58;
      v59 = v54;
      v86 = v59;
      v60 = v55;
      v87 = v60;
      v61 = v50;
      v88 = v61;
      v11 = v74;
      v89 = v74;
      v90 = v79;
      v92 = v52;
      v41 = -[MPModelObject initWithIdentifiers:block:](v57, "initWithIdentifiers:block:", v51, v81);

      v28 = (void *)v51;
      v32 = v71;
LABEL_47:

      v10 = v75;
      v12 = v77;
      v30 = v68;
      v29 = v70;
      v33 = v72;
      goto LABEL_48;
    }
    v63 = self->_contentItemBuilder;
    -[MPModelForYouRecommendationMusicKitItemBuilder storeItemMetadataWithMusicAPIMetadataDictionary:](self, "storeItemMetadataWithMusicAPIMetadataDictionary:", v10);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](v63, "modelObjectWithStoreItemMetadata:userIdentity:", v64, v12);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = objc_msgSend(v49, "itemType");
    if (v65 == 5)
    {
      v32 = v71;
      if (self->_requestedItemProperties.radioStation)
      {
        objc_msgSend(v49, "radioStation");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0;
        v53 = 0;
        v56 = 3;
        v55 = v66;
        goto LABEL_57;
      }
    }
    else
    {
      v32 = v71;
      if (v65 == 4)
      {
        objc_msgSend(v49, "playlist");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        v53 = 0;
        v56 = 2;
        v54 = v66;
        goto LABEL_57;
      }
      if (v65 == 1)
      {
        objc_msgSend(v49, "album");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        v54 = 0;
        v56 = 1;
        v53 = v66;
LABEL_57:
        objc_msgSend(v66, "identifiers");
        v51 = objc_claimAutoreleasedReturnValue();

        v50 = 0;
        v52 = 1;
        goto LABEL_46;
      }
    }

    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v41 = 0;
    v11 = v74;
    goto LABEL_47;
  }
  v40 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v94 = v10;
    _os_log_impl(&dword_193B9B000, v40, OS_LOG_TYPE_ERROR, "Dropping node because parent requires displaying utterance and no utterance was found in item dictionary: %{public}@", buf, 0xCu);
  }
  v41 = 0;
LABEL_48:

  return v41;
}

- (id)storeItemMetadataWithMusicAPIMetadataDictionary:(id)a3
{
  id v4;
  MPStoreItemMetadata *v5;
  void *v6;
  MPStoreItemMetadata *v7;

  v4 = a3;
  v5 = [MPStoreItemMetadata alloc];
  -[MPModelForYouRecommendationMusicKitItemBuilder convertToStoreItemMetadataDictionary:](self, "convertToStoreItemMetadataDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MPStoreItemMetadata initWithStorePlatformDictionary:](v5, "initWithStorePlatformDictionary:", v6);
  return v7;
}

- (id)convertToStoreItemMetadataDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  objc_msgSend(v3, "objectForKey:", CFSTR("attributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSDictionary())
  {
    objc_msgSend(v4, "addEntriesFromDictionary:", v5);
    v6 = v5;
    objc_msgSend(v6, "objectForKey:", CFSTR("playParams"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("kind"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
        objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("kind"));

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("artistName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("artistNameObject"));
    objc_msgSend(v6, "objectForKey:", CFSTR("artwork"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("artwork"));

  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

- (MPPropertySet)requestedPropertySet
{
  return self->_requestedPropertySet;
}

- (NSDictionary)storeItemMetadataResults
{
  return self->_storeItemMetadataResults;
}

- (MPMutableSectionedCollection)flatSectionedItems
{
  return self->_flatSectionedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flatSectionedItems, 0);
  objc_storeStrong((id *)&self->_storeItemMetadataResults, 0);
  objc_storeStrong((id *)&self->_requestedPropertySet, 0);
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_subgroupBuilder, 0);
  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
}

void __140__MPModelForYouRecommendationMusicKitItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  v6 = v3;
  if (v4[9])
  {
    objc_msgSend(v3, "setItemType:", *(_QWORD *)(a1 + 112));
    v4 = *(_BYTE **)(a1 + 32);
  }
  if (v4[10])
  {
    objc_msgSend(v6, "setUrl:", *(_QWORD *)(a1 + 40));
    v4 = *(_BYTE **)(a1 + 32);
  }
  if (v4[11])
  {
    objc_msgSend(v6, "setReason:", *(_QWORD *)(a1 + 48));
    v4 = *(_BYTE **)(a1 + 32);
  }
  if (v4[12])
  {
    objc_msgSend(v6, "setUtterance:", *(_QWORD *)(a1 + 56));
    v4 = *(_BYTE **)(a1 + 32);
  }
  if (v4[14])
  {
    objc_msgSend(v6, "setAlbum:", *(_QWORD *)(a1 + 64));
    v4 = *(_BYTE **)(a1 + 32);
  }
  if (v4[15])
  {
    objc_msgSend(v6, "setPlaylist:", *(_QWORD *)(a1 + 72));
    v4 = *(_BYTE **)(a1 + 32);
  }
  if (v4[16])
  {
    objc_msgSend(v6, "setRadioStation:", *(_QWORD *)(a1 + 80));
    v4 = *(_BYTE **)(a1 + 32);
  }
  if (v4[17])
  {
    if (*(_QWORD *)(a1 + 88))
    {
      objc_msgSend(v6, "setParentGroup:", *(_QWORD *)(a1 + 96));
      objc_msgSend(v6, "setSubgroupIndex:", objc_msgSend(*(id *)(a1 + 104), "count"));
      objc_msgSend(*(id *)(a1 + 104), "addObject:", *(_QWORD *)(a1 + 88));
    }
    else
    {
      objc_msgSend(v6, "setParentGroup:", 0);
      objc_msgSend(v6, "setSubgroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  v5 = v6;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 13))
  {
    objc_msgSend(v6, "setBackedByStoreItemMetadata:", *(unsigned __int8 *)(a1 + 120));
    v5 = v6;
  }

}

+ (id)allSupportedProperties
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
  MPPropertySet *v12;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("MPModelForYouRecommendationItemPropertyItemType");
  v16[1] = CFSTR("MPModelForYouRecommendationItemPropertyURL");
  v16[2] = CFSTR("MPModelForYouRecommendationItemPropertyReason");
  v16[3] = CFSTR("MPModelForYouRecommendationItemPropertyUtterance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPStoreModelAlbumBuilder allSupportedProperties](MPStoreModelAlbumBuilder, "allSupportedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeProperty:", CFSTR("MPModelPropertyAlbumDiscCount"));
  v5 = (void *)objc_msgSend(v4, "copy");
  +[MPStoreModelPlaylistBuilder allSupportedProperties](MPStoreModelPlaylistBuilder, "allSupportedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeProperty:", CFSTR("MPModelPropertyPlaylistEditorNotes"));
  objc_msgSend(v7, "removeProperty:", CFSTR("MPModelPropertyPlaylistTrackCount"));
  v8 = (void *)objc_msgSend(v7, "copy");
  +[MPStoreModelRadioStationBuilder allSupportedProperties](MPStoreModelRadioStationBuilder, "allSupportedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("MPModelForYouRecommendationItemRelationshipAlbum");
  v14[1] = CFSTR("MPModelForYouRecommendationItemRelationshipPlaylist");
  v15[0] = v5;
  v15[1] = v8;
  v15[2] = v9;
  v14[2] = CFSTR("MPModelForYouRecommendationItemRelationshipRadioStation");
  v14[3] = CFSTR("MPModelForYouRecommendationItemRelationshipSubgroup");
  +[MPModelForYouRecommendationMusicKitGroupBuilder allSupportedGroupProperties](MPModelForYouRecommendationMusicKitGroupBuilder, "allSupportedGroupProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MPPropertySet initWithProperties:relationships:]([MPPropertySet alloc], "initWithProperties:relationships:", v2, v11);
  return v12;
}

@end
