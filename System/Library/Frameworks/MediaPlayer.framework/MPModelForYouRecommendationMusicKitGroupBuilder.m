@implementation MPModelForYouRecommendationMusicKitGroupBuilder

- (MPModelForYouRecommendationMusicKitGroupBuilder)initWithRequestedGroupPropertySet:(id)a3 requestedItemPropertySet:(id)a4 storeItemMetadataResults:(id)a5 flatSectionedItems:(id)a6 storeURLBag:(id)a7 isListenNow:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MPModelForYouRecommendationMusicKitGroupBuilder *v19;
  uint64_t v20;
  MPPropertySet *requestedGroupPropertySet;
  uint64_t v22;
  MPPropertySet *requestedItemPropertySet;
  uint64_t v24;
  NSDictionary *storeItemMetadataResults;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MPModelForYouRecommendationMusicKitGroupBuilder;
  v19 = -[MPModelForYouRecommendationMusicKitGroupBuilder init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    requestedGroupPropertySet = v19->_requestedGroupPropertySet;
    v19->_requestedGroupPropertySet = (MPPropertySet *)v20;

    v22 = objc_msgSend(v15, "copy");
    requestedItemPropertySet = v19->_requestedItemPropertySet;
    v19->_requestedItemPropertySet = (MPPropertySet *)v22;

    v24 = objc_msgSend(v16, "copy");
    storeItemMetadataResults = v19->_storeItemMetadataResults;
    v19->_storeItemMetadataResults = (NSDictionary *)v24;

    objc_storeStrong((id *)&v19->_flatSectionedItems, a6);
    objc_storeStrong((id *)&v19->_storeURLBag, a7);
    v19->_isListenNow = a8;
  }

  return v19;
}

- (void)initializeRequestedGroupProperties
{
  __int16 v3;
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  void *v12;
  void *v13;
  MPModelForYouRecommendationMusicKitItemBuilder *v14;
  MPModelForYouRecommendationMusicKitItemBuilder *itemBuilder;
  __int16 requestedGroupProperties;
  NSDateFormatter *v17;
  NSDateFormatter *lastUpdatedDateFormatter;
  void *v19;
  void *v20;
  id v21;

  -[MPPropertySet properties](self->_requestedGroupPropertySet, "properties");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyGroupType")))
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFFD | v3;
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyLastUpdatedDate")))v4 = 4;
  else
    v4 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFFB | v4;
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyTitle")))
    v5 = 8;
  else
    v5 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFF7 | v5;
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL")))v6 = 32;
  else
    v6 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFDF | v6;
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyHrefURL")))
    v7 = 64;
  else
    v7 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFBF | v7;
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyRefreshURL")))
    v8 = 128;
  else
    v8 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFF7F | v8;
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyTraits")))
    v9 = 256;
  else
    v9 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFEFF | v9;
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay")))v10 = 512;
  else
    v10 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFDFF | v10;
  if (objc_msgSend(v21, "containsObject:", CFSTR("MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay")))v11 = 1024;
  else
    v11 = 0;
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFBFF | v11;
  -[MPPropertySet relationships](self->_requestedItemPropertySet, "relationships");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("MPModelForYouRecommendationItemRelationshipSubgroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&self->_requestedGroupProperties = *(_WORD *)&self->_requestedGroupProperties & 0xFFEF | (16 * (v13 != 0));

  v14 = -[MPModelForYouRecommendationMusicKitItemBuilder initWithRequestedPropertySet:storeItemMetadataResults:flatSectionedItems:storeURLBag:isListenNow:]([MPModelForYouRecommendationMusicKitItemBuilder alloc], "initWithRequestedPropertySet:storeItemMetadataResults:flatSectionedItems:storeURLBag:isListenNow:", self->_requestedItemPropertySet, self->_storeItemMetadataResults, self->_flatSectionedItems, self->_storeURLBag, self->_isListenNow);
  itemBuilder = self->_itemBuilder;
  self->_itemBuilder = v14;

  requestedGroupProperties = (__int16)self->_requestedGroupProperties;
  if ((requestedGroupProperties & 4) != 0)
  {
    v17 = (NSDateFormatter *)objc_opt_new();
    lastUpdatedDateFormatter = self->_lastUpdatedDateFormatter;
    self->_lastUpdatedDateFormatter = v17;

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_lastUpdatedDateFormatter, "setLocale:", v19);

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](self->_lastUpdatedDateFormatter, "setTimeZone:", v20);

    -[NSDateFormatter setDateFormat:](self->_lastUpdatedDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
    -[NSDateFormatter setLenient:](self->_lastUpdatedDateFormatter, "setLenient:", 1);
    requestedGroupProperties = (__int16)self->_requestedGroupProperties;
  }
  *(_WORD *)&self->_requestedGroupProperties = requestedGroupProperties | 1;

}

- (id)modelObjectForRecentlyPlayedArray:(id)a3 userIdentity:(id)a4
{
  id v6;
  id v7;
  MPModelForYouRecommendationGroup *v8;
  void *v9;
  id v10;
  id v11;
  MPModelForYouRecommendationGroup *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if ((*(_WORD *)&self->_requestedGroupProperties & 1) == 0)
    -[MPModelForYouRecommendationMusicKitGroupBuilder initializeRequestedGroupProperties](self, "initializeRequestedGroupProperties");
  v8 = [MPModelForYouRecommendationGroup alloc];
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecentlyPlayedArray_userIdentity___block_invoke;
  v14[3] = &unk_1E315E020;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = -[MPModelObject initWithIdentifiers:block:](v8, "initWithIdentifiers:block:", v9, v14);

  return v12;
}

- (id)modelObjectForItemsArray:(id)a3 userIdentity:(id)a4
{
  id v6;
  id v7;
  MPModelForYouRecommendationGroup *v8;
  void *v9;
  id v10;
  id v11;
  MPModelForYouRecommendationGroup *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if ((*(_WORD *)&self->_requestedGroupProperties & 1) == 0)
    -[MPModelForYouRecommendationMusicKitGroupBuilder initializeRequestedGroupProperties](self, "initializeRequestedGroupProperties");
  v8 = [MPModelForYouRecommendationGroup alloc];
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForItemsArray_userIdentity___block_invoke;
  v14[3] = &unk_1E315E020;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = -[MPModelObject initWithIdentifiers:block:](v8, "initWithIdentifiers:block:", v9, v14);

  return v12;
}

- (id)modelObjectForRecommendationDictionary:(id)a3 userIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  MPIdentifierSet *v10;
  void *v11;
  uint64_t v12;
  id v13;
  MPIdentifierSet *v14;
  MPModelForYouRecommendationGroup *v15;
  MPModelForYouRecommendationGroup *v16;
  void *v17;
  MPModelForYouRecommendationGroup *v18;
  NSObject *v19;
  const char *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((*(_WORD *)&self->_requestedGroupProperties & 1) == 0)
    -[MPModelForYouRecommendationMusicKitGroupBuilder initializeRequestedGroupProperties](self, "initializeRequestedGroupProperties");
  objc_msgSend(v6, "objectForKey:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v9 = v8;
    if (objc_msgSend(v9, "length"))
    {
      v10 = [MPIdentifierSet alloc];
      +[MPModelForYouRecommendationGroupKind identityKind](MPModelForYouRecommendationGroupKind, "identityKind");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke;
      v25[3] = &unk_1E3162A70;
      v13 = v7;
      v26 = v13;
      v27 = v9;
      v14 = -[MPIdentifierSet initWithSource:modelKind:block:](v10, "initWithSource:modelKind:block:", CFSTR("ForYou"), v11, v25);

      v15 = [MPModelForYouRecommendationGroup alloc];
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_3;
      v22[3] = &unk_1E315E020;
      v22[4] = self;
      v23 = v6;
      v24 = v13;
      v16 = -[MPModelObject initWithIdentifiers:block:](v15, "initWithIdentifiers:block:", v14, v22);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  -[MPModelForYouRecommendationGroup title](v16, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v6;
      v20 = "Dropping node without title: %{public}@";
LABEL_17:
      _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
    }
LABEL_18:

    v18 = 0;
    goto LABEL_19;
  }
  if (-[MPModelForYouRecommendationGroup groupType](v16, "groupType") != 4
    && !-[MPModelForYouRecommendationGroup numberOfItems](v16, "numberOfItems"))
  {
    v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v6;
      v20 = "Dropping empty node: %{public}@";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v18 = v16;
LABEL_19:

  return v18;
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
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDateFormatter, 0);
  objc_storeStrong((id *)&self->_itemBuilder, 0);
}

void __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_2;
  v6[3] = &unk_1E3162BA8;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setPersonalStoreIdentifiersWithPersonID:block:", v5, v6);

}

void __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  __int16 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  __int16 v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  __int16 v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  void *v77;
  char *v78;
  id v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  NSObject *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v4 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("kind"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("recently-played")))
          v7 = 4;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
      objc_msgSend(v5, "objectForKey:", CFSTR("display"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("kind"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
        {
          if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MusicNotesHeroShelf")) & 1) != 0)
          {
            v7 = 11;
          }
          else if (objc_msgSend(v9, "isEqualToString:", CFSTR("MusicSuperHeroShelf")))
          {
            v7 = 12;
          }
        }

      }
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v3, "setGroupType:", v7);

    v4 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSDictionary())
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("stringForDisplay"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSString() & 1) != 0)
    {
      if (v12)
        goto LABEL_40;
    }
    else
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("name"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("name"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((_NSIsNSString() & 1) != 0)
  {
    if (v12)
      goto LABEL_40;
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("reason"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSDictionary())
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("stringForDisplay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v12 = v16;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

LABEL_40:
  objc_msgSend(v3, "setTitle:", v12);

  v4 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 0x40) == 0)
      goto LABEL_62;
    goto LABEL_56;
  }
LABEL_41:
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("relationships"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v17, "objectForKey:", CFSTR("contents"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      -[NSObject objectForKey:](v18, "objectForKey:", CFSTR("href"));
      v19 = objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
      {
        MusicURLWithPathUsingURLBag(v19, *(void **)(*(_QWORD *)(a1 + 32) + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:

        goto LABEL_55;
      }
      v23 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = *(NSObject **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v97 = v24;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_ERROR, "Property href of contents dictionary not found for recommendation item: %{public}@", buf, 0xCu);
      }

    }
    else
    {
      v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v22 = *(NSObject **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v97 = v22;
        _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "Contents dictionary not found on relationships of recommendation item: %{public}@", buf, 0xCu);
      }
    }
    v20 = 0;
    goto LABEL_54;
  }
  v18 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v21 = *(NSObject **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v97 = v21;
    _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_ERROR, "Relationships dictionary not found on recommendation item: %{public}@", buf, 0xCu);
  }
  v20 = 0;
LABEL_55:

  objc_msgSend(v3, "setLoadAdditionalContentURL:", v20);
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 0x40) == 0)
    goto LABEL_62;
LABEL_56:
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("href"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    MusicURLWithPathUsingURLBag(v25, *(void **)(*(_QWORD *)(a1 + 32) + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = *(NSObject **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v97 = v28;
      _os_log_impl(&dword_193B9B000, v27, OS_LOG_TYPE_ERROR, "Property href not found for recommendation item: %{public}@", buf, 0xCu);
    }

    v26 = 0;
  }
  objc_msgSend(v3, "setHrefURL:", v26);

LABEL_62:
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", CFSTR("isGroupRecommendation"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setGroupRecommendation:", objc_msgSend(v30, "BOOLValue"));
  v31 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v31 & 0x100) == 0)
  {
    if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 0x200) == 0)
      goto LABEL_66;
    goto LABEL_86;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKey:", CFSTR("traits"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_NSIsNSArray())
  {
    v34 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v42 = *(NSObject **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v97 = v42;
      _os_log_impl(&dword_193B9B000, v34, OS_LOG_TYPE_ERROR, "No traits array found in attributes of recommendation item: %{public}@", buf, 0xCu);
    }
    goto LABEL_84;
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v34 = v33;
  v35 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (!v35)
  {
LABEL_84:
    v37 = 0;
    goto LABEL_85;
  }
  v36 = v35;
  v77 = v33;
  v78 = sel_BOOLValue;
  v79 = v3;
  v37 = 0;
  v38 = *(_QWORD *)v90;
  do
  {
    for (i = 0; i != v36; ++i)
    {
      if (*(_QWORD *)v90 != v38)
        objc_enumerationMutation(v34);
      v40 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
      if ((_NSIsNSString() & 1) != 0)
      {
        objc_msgSend(&unk_1E31E6650, "objectForKeyedSubscript:", v40);
        v41 = objc_claimAutoreleasedReturnValue();
        v37 |= -[NSObject unsignedIntegerValue](v41, "unsignedIntegerValue");
      }
      else
      {
        v41 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v97 = v34;
          _os_log_impl(&dword_193B9B000, v41, OS_LOG_TYPE_ERROR, "Unexpected trait type %{public}@", buf, 0xCu);
        }
      }

    }
    v36 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  }
  while (v36);
LABEL_85:

  objc_msgSend(v3, "setTraits:", v37);
  v31 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v31 & 0x200) == 0)
  {
LABEL_66:
    if ((v31 & 0x400) == 0)
      goto LABEL_67;
    goto LABEL_89;
  }
LABEL_86:
  objc_msgSend(v3, "setDisplaysAsGridCellInCarPlay:", 0, v77, v78, v79);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKey:", CFSTR("emphasize"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setDisplaysAsGridCellInCarPlay:", objc_msgSend(v44, "BOOLValue"));

  v31 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v31 & 0x400) == 0)
  {
LABEL_67:
    if ((v31 & 4) == 0)
      goto LABEL_96;
    goto LABEL_92;
  }
LABEL_89:
  objc_msgSend(v3, "setDisplaysAsTitledSectionWithRowsInCarPlay:", 0, v77, v78, v79);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKey:", CFSTR("expand"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setDisplaysAsTitledSectionWithRowsInCarPlay:", objc_msgSend(v46, "BOOLValue"));

  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 4) != 0)
  {
LABEL_92:
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("attributes"), v77, v78, v79);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKey:", CFSTR("lastModifiedDate"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSString())
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dateFromString:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v3, "setLastUpdatedDate:", v49);

  }
LABEL_96:
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 0x10) != 0)
    v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v51 = 0;
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("relationships"), v77, v78, v79);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKey:", CFSTR("contents"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectForKey:", CFSTR("data"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("relationships"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKey:", CFSTR("recommendations"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKey:", CFSTR("data"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (_NSIsNSArray())
  {
    v80 = v30;
    v57 = v54;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v86 != v60)
            objc_enumerationMutation(v57);
          v62 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
          if (_NSIsNSDictionary())
          {
            v63 = *(_QWORD *)(a1 + 32);
            v64 = *(void **)(v63 + 16);
            v65 = *(_WORD *)(v63 + 8);
            if ((v65 & 0x10) != 0)
              v66 = v3;
            else
              v66 = 0;
            if ((v65 & 0x10) != 0)
              v67 = v51;
            else
              v67 = 0;
            objc_msgSend(v64, "modelObjectForRecommendationChildDictionary:parentGroup:subgroupsAccumulator:userIdentity:", v62, v66, v67, *(_QWORD *)(a1 + 48));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (v68)
              objc_msgSend(v50, "addObject:", v68);

          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      }
      while (v59);
    }

    v30 = v80;
  }
  v69 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v69 + 8) & 0x10) != 0)
  {
    objc_msgSend(v3, "setSubgroups:", v51);
    v69 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(v3, "setSectionIndex:", objc_msgSend(*(id *)(v69 + 72), "numberOfSections"));
  objc_msgSend(v3, "setSectionedItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v70 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "appendSection:", v71);

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v72 = v50;
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v82;
    do
    {
      for (k = 0; k != v74; ++k)
      {
        if (*(_QWORD *)v82 != v75)
          objc_enumerationMutation(v72);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "appendItem:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k));
      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    }
    while (v74);
  }

}

uint64_t __103__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecommendationDictionary_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecommendationID:", *(_QWORD *)(a1 + 32));
}

void __89__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForItemsArray_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  __int16 v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  NSObject *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = (void *)objc_opt_new();
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 0x10) != 0)
    v4 = (void *)objc_opt_new();
  else
    v4 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(NSObject **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((_NSIsNSDictionary() & 1) != 0)
        {
          v11 = v10;
          v12 = *(_QWORD *)(a1 + 32);
          v13 = *(void **)(v12 + 16);
          v14 = *(_WORD *)(v12 + 8);
          if ((v14 & 0x10) != 0)
            v15 = v3;
          else
            v15 = 0;
          if ((v14 & 0x10) != 0)
            v16 = v4;
          else
            v16 = 0;
          objc_msgSend(v13, "modelObjectForRecommendationChildDictionary:parentGroup:subgroupsAccumulator:userIdentity:", v11, v15, v16, *(_QWORD *)(a1 + 48));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v24, "addObject:", v17);
          }
          else
          {
            v18 = v3;
            v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v30 = v11;
              _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "Recommendation item modeling failure: %{public}@", buf, 0xCu);
            }

            v3 = v18;
          }

        }
        else
        {
          v11 = os_log_create("com.apple.amp.mediaplayer", "Default");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "Recommendation item should be a dictionary: %{public}@", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v7);
  }

  v20 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v20 + 8) & 0x10) != 0)
  {
    objc_msgSend(v3, "setSubgroups:", v4);
    v20 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(v3, "setSectionIndex:", objc_msgSend(*(id *)(v20 + 72), "numberOfSections"));
  objc_msgSend(v3, "setSectionedItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v21 = v3;
  v22 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendSection:", v23);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "appendItems:", v24);
}

void __98__MPModelForYouRecommendationMusicKitGroupBuilder_modelObjectForRecentlyPlayedArray_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int16 v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 2) != 0)
    objc_msgSend(v3, "setGroupType:", 4);
  objc_msgSend(v4, "setTitle:", CFSTR("RECENTLY_PLAYED_VIEW_TITLE"));
  MusicURLWithPathUsingURLBag(CFSTR("/v1/me/recent/played"), *(void **)(*(_QWORD *)(a1 + 32) + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoadAdditionalContentURL:", v5);

  v6 = (void *)objc_opt_new();
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 0x10) != 0)
    v7 = (void *)objc_opt_new();
  else
    v7 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          v14 = *(_QWORD *)(a1 + 32);
          v15 = *(void **)(v14 + 16);
          v16 = *(_WORD *)(v14 + 8);
          if ((v16 & 0x10) != 0)
            v17 = v4;
          else
            v17 = 0;
          if ((v16 & 0x10) != 0)
            v18 = v7;
          else
            v18 = 0;
          objc_msgSend(v15, "modelObjectForRecommendationChildDictionary:parentGroup:subgroupsAccumulator:userIdentity:", v13, v17, v18, *(_QWORD *)(a1 + 48), (_QWORD)v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v6, "addObject:", v19);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(_WORD *)(v20 + 8);
  if ((v21 & 0x10) != 0)
  {
    objc_msgSend(v4, "setSubgroups:", v7);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_WORD *)(v20 + 8);
  }
  if ((v21 & 0x200) != 0)
  {
    objc_msgSend(v4, "setDisplaysAsGridCellInCarPlay:", 1);
    v20 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(v4, "setSectionIndex:", objc_msgSend(*(id *)(v20 + 72), "numberOfSections", (_QWORD)v24));
  objc_msgSend(v4, "setSectionedItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v22 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendSection:", v23);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "appendItems:", v6);
}

+ (id)allSupportedGroupProperties
{
  void *v2;
  void *v3;
  _QWORD v5[10];

  v5[9] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelForYouRecommendationGroupPropertyGroupType");
  v5[1] = CFSTR("MPModelForYouRecommendationGroupPropertyLastUpdatedDate");
  v5[2] = CFSTR("MPModelForYouRecommendationGroupPropertyTitle");
  v5[3] = CFSTR("MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL");
  v5[4] = CFSTR("MPModelForYouRecommendationGroupPropertyHrefURL");
  v5[5] = CFSTR("MPModelForYouRecommendationGroupPropertyRefreshURL");
  v5[6] = CFSTR("MPModelForYouRecommendationGroupPropertyTraits");
  v5[7] = CFSTR("MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay");
  v5[8] = CFSTR("MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allSupportedItemProperties
{
  return +[MPModelForYouRecommendationMusicKitItemBuilder allSupportedProperties](MPModelForYouRecommendationMusicKitItemBuilder, "allSupportedProperties");
}

@end
