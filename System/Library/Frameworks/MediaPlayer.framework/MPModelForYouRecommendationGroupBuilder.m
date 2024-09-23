@implementation MPModelForYouRecommendationGroupBuilder

- (MPModelForYouRecommendationGroupBuilder)initWithRequestedGroupPropertySet:(id)a3 requestedItemPropertySet:(id)a4 storeItemMetadataResults:(id)a5 flatSectionedItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MPModelForYouRecommendationGroupBuilder *v14;
  uint64_t v15;
  MPPropertySet *requestedGroupPropertySet;
  uint64_t v17;
  MPPropertySet *requestedItemPropertySet;
  uint64_t v19;
  NSDictionary *storeItemMetadataResults;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MPModelForYouRecommendationGroupBuilder;
  v14 = -[MPModelForYouRecommendationGroupBuilder init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    requestedGroupPropertySet = v14->_requestedGroupPropertySet;
    v14->_requestedGroupPropertySet = (MPPropertySet *)v15;

    v17 = objc_msgSend(v11, "copy");
    requestedItemPropertySet = v14->_requestedItemPropertySet;
    v14->_requestedItemPropertySet = (MPPropertySet *)v17;

    v19 = objc_msgSend(v12, "copy");
    storeItemMetadataResults = v14->_storeItemMetadataResults;
    v14->_storeItemMetadataResults = (NSDictionary *)v19;

    objc_storeStrong((id *)&v14->_flatSectionedItems, a6);
  }

  return v14;
}

- (id)modelObjectForRecommendationDictionary:(id)a3 userIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  MPModelForYouRecommendationItemBuilder *v16;
  MPModelForYouRecommendationItemBuilder *itemBuilder;
  char requestedGroupProperties;
  NSDateFormatter *v19;
  NSDateFormatter *lastUpdatedDateFormatter;
  NSDateFormatter *v21;
  void *v22;
  NSDateFormatter *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  MPIdentifierSet *v28;
  void *v29;
  uint64_t v30;
  id v31;
  MPIdentifierSet *v32;
  MPModelForYouRecommendationGroup *v33;
  MPModelForYouRecommendationGroup *v34;
  _QWORD v36[4];
  id v37;
  MPModelForYouRecommendationGroupBuilder *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;

  v6 = a3;
  v7 = a4;
  if ((*(_BYTE *)&self->_requestedGroupProperties & 1) == 0)
  {
    -[MPPropertySet properties](self->_requestedGroupPropertySet, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyGroupType")))
      v9 = 2;
    else
      v9 = 0;
    *(_BYTE *)&self->_requestedGroupProperties = *(_BYTE *)&self->_requestedGroupProperties & 0xFD | v9;
    if (objc_msgSend(v8, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyLastUpdatedDate")))v10 = 4;
    else
      v10 = 0;
    *(_BYTE *)&self->_requestedGroupProperties = *(_BYTE *)&self->_requestedGroupProperties & 0xFB | v10;
    if (objc_msgSend(v8, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyTitle")))
      v11 = 8;
    else
      v11 = 0;
    *(_BYTE *)&self->_requestedGroupProperties = *(_BYTE *)&self->_requestedGroupProperties & 0xF7 | v11;
    if (objc_msgSend(v8, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL")))v12 = 32;
    else
      v12 = 0;
    *(_BYTE *)&self->_requestedGroupProperties = *(_BYTE *)&self->_requestedGroupProperties & 0xDF | v12;
    if (objc_msgSend(v8, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyRefreshURL")))
      v13 = 64;
    else
      v13 = 0;
    *(_BYTE *)&self->_requestedGroupProperties = *(_BYTE *)&self->_requestedGroupProperties & 0xBF | v13;
    -[MPPropertySet relationships](self->_requestedItemPropertySet, "relationships");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipSubgroup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&self->_requestedGroupProperties = *(_BYTE *)&self->_requestedGroupProperties & 0xEF | (16 * (v15 != 0));

    v16 = -[MPModelForYouRecommendationItemBuilder initWithRequestedPropertySet:storeItemMetadataResults:flatSectionedItems:]([MPModelForYouRecommendationItemBuilder alloc], "initWithRequestedPropertySet:storeItemMetadataResults:flatSectionedItems:", self->_requestedItemPropertySet, self->_storeItemMetadataResults, self->_flatSectionedItems);
    itemBuilder = self->_itemBuilder;
    self->_itemBuilder = v16;

    requestedGroupProperties = (char)self->_requestedGroupProperties;
    if ((requestedGroupProperties & 4) != 0)
    {
      v19 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
      lastUpdatedDateFormatter = self->_lastUpdatedDateFormatter;
      self->_lastUpdatedDateFormatter = v19;

      v21 = self->_lastUpdatedDateFormatter;
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter setLocale:](v21, "setLocale:", v22);

      v23 = self->_lastUpdatedDateFormatter;
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter setTimeZone:](v23, "setTimeZone:", v24);

      -[NSDateFormatter setDateFormat:](self->_lastUpdatedDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
      -[NSDateFormatter setLenient:](self->_lastUpdatedDateFormatter, "setLenient:", 1);
      requestedGroupProperties = (char)self->_requestedGroupProperties;
    }
    *(_BYTE *)&self->_requestedGroupProperties = requestedGroupProperties | 1;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("recoId"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v26 = v25;
    if (objc_msgSend(v26, "length"))
    {
      objc_msgSend(v7, "accountDSID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = [MPIdentifierSet alloc];
      +[MPModelForYouRecommendationGroupKind identityKind](MPModelForYouRecommendationGroupKind, "identityKind");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke;
      v40[3] = &unk_1E3162A70;
      v41 = v27;
      v42 = v26;
      v31 = v27;
      v32 = -[MPIdentifierSet initWithSource:modelKind:block:](v28, "initWithSource:modelKind:block:", CFSTR("ForYou"), v29, v40);

      v33 = [MPModelForYouRecommendationGroup alloc];
      v36[0] = v30;
      v36[1] = 3221225472;
      v36[2] = __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_3;
      v36[3] = &unk_1E315E020;
      v37 = v6;
      v38 = self;
      v39 = v7;
      v34 = -[MPModelObject initWithIdentifiers:block:](v33, "initWithIdentifiers:block:", v32, v36);

    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (MPPropertySet)requestedGroupPropertySet
{
  return self->_requestedGroupPropertySet;
}

- (MPPropertySet)requestedItemPropertySet
{
  return self->_requestedItemPropertySet;
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
  objc_storeStrong((id *)&self->_requestedItemPropertySet, 0);
  objc_storeStrong((id *)&self->_requestedGroupPropertySet, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDateFormatter, 0);
  objc_storeStrong((id *)&self->_itemBuilder, 0);
}

void __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_2;
  v4[3] = &unk_1E3162BA8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "setPersonalStoreIdentifiersWithPersonID:block:", v3, v4);

}

void __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("moduleType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PERSONALIZED_MIX")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FRIENDS_LISTENING")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RECOMMEND_FRIENDS")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RECENTLY_PLAYED")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TODAYS_PLAYLISTS")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HEAVY_ROTATION")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ALBUM_GROUPS")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ARTIST_PLAYLISTS")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NEW_RELEASES")) & 1) != 0)
    {
      v6 = 9;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ALBUM_RECO")))
    {
      v6 = 10;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  v7 = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8);
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v3, "setGroupType:", v6);
    v7 = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8);
    if ((v7 & 8) == 0)
    {
LABEL_27:
      if ((v7 & 4) == 0)
        goto LABEL_28;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) & 8) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("stringForDisplay"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSString() & 1) != 0)
    {
      if (v9)
        goto LABEL_44;
    }
    else
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("reason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("stringForDisplay"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v9 = v11;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

LABEL_44:
  v12 = objc_msgSend(v9, "length");
  if (v6 == 1 && !v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FOR_YOU_PERSONAL_MIXES_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  objc_msgSend(v3, "setTitle:", v9);

  v7 = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8);
  if ((v7 & 4) == 0)
  {
LABEL_28:
    if ((v7 & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_52;
  }
LABEL_48:
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("timestamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "dateFromString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v3, "setLastUpdatedDate:", v16);

  v7 = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8);
  if ((v7 & 0x20) == 0)
  {
LABEL_29:
    if ((v7 & 0x40) == 0)
      goto LABEL_60;
    goto LABEL_56;
  }
LABEL_52:
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("seeAllUrl"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v3, "setLoadAdditionalContentURL:", v18);

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) & 0x40) != 0)
  {
LABEL_56:
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("refreshUrl"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v3, "setRefreshURL:", v20);

  }
LABEL_60:
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) & 0x10) != 0)
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v22 = 0;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("children"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v44 = v4;
    v24 = v23;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v50 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v30 = *(_QWORD *)(a1 + 40);
            v31 = *(void **)(v30 + 16);
            v32 = *(_BYTE *)(v30 + 8);
            if ((v32 & 0x10) != 0)
              v33 = v3;
            else
              v33 = 0;
            if ((v32 & 0x10) != 0)
              v34 = v22;
            else
              v34 = 0;
            objc_msgSend(v31, "modelObjectForRecommendationChildDictionary:parentGroup:subgroupsAccumulator:userIdentity:", v29, v33, v34, *(_QWORD *)(a1 + 48));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
              objc_msgSend(v21, "addObject:", v35);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v26);
    }

    v4 = v44;
  }
  v36 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(v36 + 8) & 0x10) != 0)
  {
    objc_msgSend(v3, "setSubgroups:", v22);
    v36 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(v3, "setSectionIndex:", objc_msgSend(*(id *)(v36 + 56), "numberOfSections"));
  objc_msgSend(v3, "setSectionedItems:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v37 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "appendSection:", v38);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v39 = v21;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "appendItem:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v41);
  }

}

uint64_t __95__MPModelForYouRecommendationGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecommendationID:", *(_QWORD *)(a1 + 32));
}

+ (id)allSupportedGroupProperties
{
  void *v2;
  void *v3;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelForYouRecommendationGroupPropertyGroupType");
  v5[1] = CFSTR("MPModelForYouRecommendationGroupPropertyLastUpdatedDate");
  v5[2] = CFSTR("MPModelForYouRecommendationGroupPropertyTitle");
  v5[3] = CFSTR("MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL");
  v5[4] = CFSTR("MPModelForYouRecommendationGroupPropertyHrefURL");
  v5[5] = CFSTR("MPModelForYouRecommendationGroupPropertyRefreshURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allSupportedItemProperties
{
  return +[MPModelForYouRecommendationItemBuilder allSupportedProperties](MPModelForYouRecommendationItemBuilder, "allSupportedProperties");
}

@end
