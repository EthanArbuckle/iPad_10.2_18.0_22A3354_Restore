@implementation MPModelForYouRecommendationItemBuilder

- (MPModelForYouRecommendationItemBuilder)initWithRequestedPropertySet:(id)a3 storeItemMetadataResults:(id)a4 flatSectionedItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPModelForYouRecommendationItemBuilder *v11;
  uint64_t v12;
  MPPropertySet *requestedPropertySet;
  uint64_t v14;
  NSDictionary *storeItemMetadataResults;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPModelForYouRecommendationItemBuilder;
  v11 = -[MPModelForYouRecommendationItemBuilder init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    requestedPropertySet = v11->_requestedPropertySet;
    v11->_requestedPropertySet = (MPPropertySet *)v12;

    v14 = objc_msgSend(v9, "copy");
    storeItemMetadataResults = v11->_storeItemMetadataResults;
    v11->_storeItemMetadataResults = (NSDictionary *)v14;

    objc_storeStrong((id *)&v11->_flatSectionedItems, a5);
  }

  return v11;
}

- (id)modelObjectForRecommendationChildDictionary:(id)a3 parentGroup:(id)a4 subgroupsAccumulator:(id)a5 userIdentity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char requestedItemProperties;
  void *v23;
  char v24;
  MPPropertySet *v25;
  void *v26;
  MPPropertySet *v27;
  MPModelStoreBrowseContentItemBuilder *v28;
  MPModelStoreBrowseContentItemBuilder *contentItemBuilder;
  void *v30;
  MPModelForYouRecommendationGroupBuilder *v31;
  MPModelForYouRecommendationGroupBuilder *subgroupBuilder;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  MPModelPlaylist *v41;
  MPModelPlaylist *v42;
  MPModelPlaylist *v43;
  uint64_t v44;
  MPModelAlbum *v45;
  void *v46;
  void *v47;
  MPModelForYouRecommendationItem *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  MPModelForYouRecommendationItem *v53;
  void *v54;
  MPModelForYouRecommendationItem *v55;
  MPModelForYouRecommendationItem *v56;
  id v57;
  MPIdentifierSet *v58;
  void *v59;
  uint64_t v60;
  MPIdentifierSet *v62;
  void *v63;
  MPIdentifierSet *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[5];
  MPModelAlbum *v81;
  MPModelPlaylist *v82;
  MPModelPlaylist *v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  char v88;
  _QWORD v89[4];
  id v90;
  id v91;
  _QWORD v92[4];
  id v93;
  MPModelAlbum *v94;
  _QWORD v95[5];
  _QWORD v96[3];

  v96[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MPModelForYouRecommendationItemBuilder storeItemMetadataResults](self, "storeItemMetadataResults");
  v78 = v11;
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_requestedItemProperties & 1) == 0)
  {
    -[MPModelForYouRecommendationItemBuilder requestedPropertySet](self, "requestedPropertySet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "properties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "containsObject:", CFSTR("MPModelForYouRecommendationItemPropertyItemType")))
      v16 = 2;
    else
      v16 = 0;
    *(_BYTE *)&self->_requestedItemProperties = *(_BYTE *)&self->_requestedItemProperties & 0xFD | v16;
    if (objc_msgSend(v15, "containsObject:", CFSTR("MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata")))v17 = 4;
    else
      v17 = 0;
    *(_BYTE *)&self->_requestedItemProperties = *(_BYTE *)&self->_requestedItemProperties & 0xFB | v17;
    objc_msgSend(v14, "relationships");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v18, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipAlbum"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      *(_BYTE *)&self->_requestedItemProperties |= 8u;
      objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("MPModelStoreBrowseContentItemRelationshipAlbum"));
    }
    v69 = v12;
    objc_msgSend(v18, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipPlaylist"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    requestedItemProperties = (char)self->_requestedItemProperties;
    *(_BYTE *)&self->_requestedItemProperties = requestedItemProperties & 0xEF | (16 * (v21 != 0));
    if (v21)
    {
      *(_BYTE *)&self->_requestedItemProperties = requestedItemProperties | 0x10;
      objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("MPModelStoreBrowseContentItemRelationshipPlaylist"));
    }
    v71 = v13;
    v76 = v10;
    objc_msgSend(v18, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipRadioStation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (char)self->_requestedItemProperties;
    *(_BYTE *)&self->_requestedItemProperties = v24 & 0xDF | (32 * (v23 != 0));
    if (v23)
    {
      *(_BYTE *)&self->_requestedItemProperties = v24 | 0x20;
      objc_msgSend(v19, "setObject:forKey:", v23, CFSTR("MPModelStoreBrowseContentItemRelationshipRadioStation"));
    }
    v25 = [MPPropertySet alloc];
    v96[0] = CFSTR("MPModelStoreBrowseContentItemPropertyItemType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MPPropertySet initWithProperties:relationships:](v25, "initWithProperties:relationships:", v26, v19);

    v28 = -[MPModelStoreBrowseContentItemBuilder initWithRequestedPropertySet:]([MPModelStoreBrowseContentItemBuilder alloc], "initWithRequestedPropertySet:", v27);
    contentItemBuilder = self->_contentItemBuilder;
    self->_contentItemBuilder = v28;

    objc_msgSend(v18, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipSubgroup"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&self->_requestedItemProperties = *(_BYTE *)&self->_requestedItemProperties & 0xBF | ((v30 != 0) << 6);
    v31 = -[MPModelForYouRecommendationGroupBuilder initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:]([MPModelForYouRecommendationGroupBuilder alloc], "initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:", v30, v14, v79, self->_flatSectionedItems);
    subgroupBuilder = self->_subgroupBuilder;
    self->_subgroupBuilder = v31;

    *(_BYTE *)&self->_requestedItemProperties |= 1u;
    v10 = v76;
    v12 = v69;
    v13 = v71;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("contentId"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v34 = v33;
  else
    v34 = 0;
  objc_msgSend(v10, "objectForKey:", CFSTR("contentType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v36 = v35;
  else
    v36 = 0;
  v75 = v34;
  v77 = v33;
  v73 = v36;
  v74 = v35;
  if (objc_msgSend(v34, "length") && objc_msgSend(v36, "length"))
  {
    v70 = v12;
    objc_msgSend(v79, "objectForKey:", v34);
    v37 = objc_claimAutoreleasedReturnValue();
    v72 = v13;
    v67 = (void *)v37;
    if (v37)
    {
      -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](self->_contentItemBuilder, "modelObjectWithStoreItemMetadata:userIdentity:", v37, v13);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "itemType");
      switch(v39)
      {
        case 5:
          v40 = v38;
          objc_msgSend(v38, "radioStation");
          v41 = (MPModelPlaylist *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v45 = 0;
          v44 = 3;
          v42 = v41;
          goto LABEL_38;
        case 4:
          v40 = v38;
          objc_msgSend(v38, "playlist");
          v41 = (MPModelPlaylist *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          v45 = 0;
          v44 = 2;
          v43 = v41;
          goto LABEL_38;
        case 1:
          v40 = v38;
          objc_msgSend(v38, "album");
          v41 = (MPModelPlaylist *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          v43 = 0;
          v44 = 1;
          v45 = (MPModelAlbum *)v41;
LABEL_38:
          -[MPModelObject identifiers](v41, "identifiers");
          v60 = objc_claimAutoreleasedReturnValue();
          v68 = 1;
LABEL_39:
          v12 = v70;
          goto LABEL_40;
      }
LABEL_43:
      v42 = 0;
      v43 = 0;
      v45 = 0;
      v68 = 0;
      v44 = 0;
      v60 = 0;
      v40 = v38;
      goto LABEL_39;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("isUnavailableInAppleMusic"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_43;
    v66 = v38;
    if (!objc_msgSend(v38, "BOOLValue"))
      goto LABEL_43;
    v12 = v70;
    if (objc_msgSend(v36, "isEqualToString:", CFSTR("1")))
    {
      v45 = (MPModelAlbum *)strtoll((const char *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String"), 0, 0);
      if (v45)
      {
        v57 = v10;
        v58 = [MPIdentifierSet alloc];
        +[MPModelAlbumKind identityKind](MPModelAlbumKind, "identityKind");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = MEMORY[0x1E0C809B0];
        v95[1] = 3221225472;
        v95[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke;
        v95[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
        v95[4] = v45;
        v45 = -[MPIdentifierSet initWithSource:modelKind:block:](v58, "initWithSource:modelKind:block:", CFSTR("ForYou"), v59, v95);
        v44 = 1;
LABEL_52:

        v10 = v57;
        if (v45)
        {
          v60 = (uint64_t)v45;
          if (v44 == 2)
          {
            v43 = -[MPModelObject initWithIdentifiers:block:]([MPModelPlaylist alloc], "initWithIdentifiers:block:", v45, &__block_literal_global_37_39785);
            v42 = 0;
            v45 = 0;
          }
          else
          {
            v45 = -[MPModelObject initWithIdentifiers:block:]([MPModelAlbum alloc], "initWithIdentifiers:block:", v45, &__block_literal_global_39783);
            v42 = 0;
            v43 = 0;
          }
          v68 = 0;
          goto LABEL_59;
        }
        v42 = 0;
        v43 = 0;
        v68 = 0;
LABEL_56:
        v60 = 0;
LABEL_59:
        v40 = v66;
LABEL_40:

        v46 = 0;
        v47 = (void *)v60;
        v13 = v72;
        if (!v47)
          goto LABEL_41;
        goto LABEL_29;
      }
    }
    else
    {
      if ((objc_msgSend(v36, "isEqualToString:", CFSTR("3")) & 1) == 0
        && !objc_msgSend(v36, "isEqualToString:", CFSTR("21")))
      {
        if (objc_msgSend(v36, "isEqualToString:", CFSTR("22")))
        {
          v57 = v10;
          v64 = [MPIdentifierSet alloc];
          +[MPModelAlbumKind identityKind](MPModelAlbumKind, "identityKind");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v89[0] = MEMORY[0x1E0C809B0];
          v89[1] = 3221225472;
          v89[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_5;
          v89[3] = &unk_1E3162A70;
          v90 = v13;
          v91 = v34;
          v45 = -[MPIdentifierSet initWithSource:modelKind:block:](v64, "initWithSource:modelKind:block:", CFSTR("ForYou"), v65, v89);

          v44 = 1;
          v59 = v90;
          goto LABEL_52;
        }
        v42 = 0;
        v43 = 0;
        v45 = 0;
LABEL_49:
        v68 = 0;
        v44 = 0;
        goto LABEL_56;
      }
      v45 = (MPModelAlbum *)strtoull((const char *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String"), 0, 0);
      if (v45)
      {
        v57 = v10;
        v62 = [MPIdentifierSet alloc];
        +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_3;
        v92[3] = &unk_1E315F6D0;
        v93 = v13;
        v94 = v45;
        v45 = -[MPIdentifierSet initWithSource:modelKind:block:](v62, "initWithSource:modelKind:block:", CFSTR("ForYou"), v63, v92);

        v44 = 2;
        v59 = v93;
        goto LABEL_52;
      }
    }
    v42 = 0;
    v43 = 0;
    goto LABEL_49;
  }
  -[MPModelForYouRecommendationGroupBuilder modelObjectForRecommendationDictionary:userIdentity:](self->_subgroupBuilder, "modelObjectForRecommendationDictionary:userIdentity:", v10, v13);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "identifiers");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = 0;
  v45 = 0;
  v68 = 0;
  v44 = 4;
  if (!v47)
  {
LABEL_41:
    v56 = 0;
    v54 = v78;
    goto LABEL_42;
  }
LABEL_29:
  v48 = [MPModelForYouRecommendationItem alloc];
  v49 = v44;
  v50 = v47;
  v51 = v13;
  v52 = v10;
  v53 = v48;
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_10;
  v80[3] = &unk_1E315ECE8;
  v80[4] = self;
  v87 = v49;
  v81 = v45;
  v82 = v43;
  v83 = v42;
  v84 = v46;
  v54 = v78;
  v85 = v78;
  v86 = v12;
  v88 = v68;
  v55 = v53;
  v10 = v52;
  v13 = v51;
  v47 = v50;
  v56 = -[MPModelObject initWithIdentifiers:block:](v55, "initWithIdentifiers:block:", v50, v80);

LABEL_42:
  return v56;
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
  objc_storeStrong((id *)&self->_subgroupBuilder, 0);
  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
}

uint64_t __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_2;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);
}

void __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accountDSID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_4;
  v6[3] = &__block_descriptor_40_e45_v16__0___MPMutablePersonalStoreIdentifiers__8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setPersonalStoreIdentifiersWithPersonID:block:", v5, v6);

}

void __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accountDSID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_6;
  v6[3] = &unk_1E3162BA8;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setPersonalStoreIdentifiersWithPersonID:block:", v5, v6);

}

void __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  char v3;
  id v4;

  v4 = a2;
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(v4, "setItemType:", *(_QWORD *)(a1 + 88));
    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "setAlbum:", *(_QWORD *)(a1 + 40));
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  objc_msgSend(v4, "setPlaylist:", *(_QWORD *)(a1 + 48));
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(v4, "setRadioStation:", *(_QWORD *)(a1 + 56));
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) & 0x40) == 0)
    goto LABEL_14;
LABEL_11:
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v4, "setParentGroup:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v4, "setSubgroupIndex:", objc_msgSend(*(id *)(a1 + 80), "count"));
    objc_msgSend(*(id *)(a1 + 80), "addObject:", *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(v4, "setParentGroup:", 0);
    objc_msgSend(v4, "setSubgroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
LABEL_14:
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) & 4) != 0)
    objc_msgSend(v4, "setBackedByStoreItemMetadata:", *(unsigned __int8 *)(a1 + 96));

}

uint64_t __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCloudAlbumID:", *(_QWORD *)(a1 + 32));
}

uint64_t __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCloudID:", *(_QWORD *)(a1 + 32));
}

void __132__MPModelForYouRecommendationItemBuilder_modelObjectForRecommendationChildDictionary_parentGroup_subgroupsAccumulator_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAdamID:", v3);
  objc_msgSend(v4, "setPurchasedAdamID:", *(_QWORD *)(a1 + 32));

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
  MPPropertySet *v9;
  void *v10;
  void *v11;
  void *v12;
  MPPropertySet *v13;
  uint64_t v15;
  _QWORD v16[4];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  +[MPStoreModelAlbumBuilder allSupportedProperties](MPStoreModelAlbumBuilder, "allSupportedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeProperty:", CFSTR("MPModelPropertyAlbumDiscCount"));
  v4 = (void *)objc_msgSend(v3, "copy");
  +[MPStoreModelPlaylistBuilder allSupportedProperties](MPStoreModelPlaylistBuilder, "allSupportedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeProperty:", CFSTR("MPModelPropertyPlaylistEditorNotes"));
  objc_msgSend(v6, "removeProperty:", CFSTR("MPModelPropertyPlaylistTrackCount"));
  v7 = (void *)objc_msgSend(v6, "copy");
  +[MPStoreModelRadioStationBuilder allSupportedProperties](MPStoreModelRadioStationBuilder, "allSupportedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [MPPropertySet alloc];
  v17[0] = CFSTR("MPModelForYouRecommendationItemPropertyItemType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelForYouRecommendationGroupBuilder allSupportedGroupProperties](MPModelForYouRecommendationGroupBuilder, "allSupportedGroupProperties", CFSTR("MPModelForYouRecommendationItemRelationshipAlbum"), CFSTR("MPModelForYouRecommendationItemRelationshipPlaylist"), CFSTR("MPModelForYouRecommendationItemRelationshipRadioStation"), CFSTR("MPModelForYouRecommendationItemRelationshipSubgroup"), v4, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPPropertySet initWithProperties:relationships:](v9, "initWithProperties:relationships:", v10, v12);

  return v13;
}

@end
