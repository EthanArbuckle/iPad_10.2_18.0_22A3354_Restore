@implementation MPModelStoreRadioMusicKitRequestOperation

- (id)additionalURLRequestsWithStoreURLBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "additionalContent") == 1)
  {
    v6 = (void *)MEMORY[0x1E0CB39E0];
    -[MPModelStoreRadioMusicKitRequestOperation recentlyPlayedURLWithStoreURLBag:](self, "recentlyPlayedURLWithStoreURLBag:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)additionalCatalogURLQueryItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("include"), CFSTR("stations"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("include[stations]"), CFSTR("events"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("art[editorial-elements:url]"), CFSTR("f"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  MPModelStoreRadioMusicKitRequestOperation *v18;
  id v19;
  void (**v20)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[MPStoreModelRequestOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "additionalContent") == 1)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v13);

      goto LABEL_9;
    }
    v9 = v6;
    if (objc_msgSend(v9, "count") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v14);

      goto LABEL_9;
    }
    objc_msgSend(v9, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v6;
    v11 = 0;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v16[3] = &unk_1E3154398;
  v17 = v8;
  v18 = self;
  v19 = v11;
  v20 = v7;
  v15.receiver = self;
  v15.super_class = (Class)MPModelStoreRadioMusicKitRequestOperation;
  v12 = v11;
  -[MPModelStoreGroupingsMusicKitRequestOperation produceResponseWithLoadedOutput:completion:](&v15, sel_produceResponseWithLoadedOutput_completion_, v10, v16);

LABEL_9:
}

- (id)groupingNameBagKey
{
  __CFString *v2;

  v2 = CFSTR("radioTabGroupingName");
  return CFSTR("radioTabGroupingName");
}

- (id)groupingNameWithMusicSubscriptionDictionary:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v4 = a3;
  -[MPModelStoreRadioMusicKitRequestOperation groupingNameBagKey](self, "groupingNameBagKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("radio");
  v8 = v7;

  return v8;
}

- (id)recentlyPlayedURLWithStoreURLBag:(id)a3
{
  void *v3;
  void *v4;

  MusicURLComponentsWithURLBag(a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPath:", CFSTR("/v1/me/recent/radio-stations"));
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rootObjectIdentifierWithSubscriptionStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_1E3154470[a3 - 1];
}

- (id)recentlyPlayedSectionWithTitle:(id)a3
{
  id v3;
  MPModelStoreBrowseSection *v4;
  void *v5;
  id v6;
  MPModelStoreBrowseSection *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = [MPModelStoreBrowseSection alloc];
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__MPModelStoreRadioMusicKitRequestOperation_recentlyPlayedSectionWithTitle___block_invoke;
  v9[3] = &unk_1E31543C0;
  v10 = v3;
  v6 = v3;
  v7 = -[MPModelObject initWithIdentifiers:block:](v4, "initWithIdentifiers:block:", v5, v9);

  return v7;
}

- (int64_t)radioStationTypeFromKind:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("albumSeeded")) & 1) != 0)
  {
    v4 = 10;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("artistOnly")) & 1) != 0)
      goto LABEL_4;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("artistSeeded")) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_24;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
    {
      v4 = 6;
      goto LABEL_24;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("format")) & 1) != 0)
    {
      v4 = 5;
      goto LABEL_24;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("genre")) & 1) != 0)
    {
      v4 = 7;
      goto LABEL_24;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("libraryPlaylistSeeded")) & 1) != 0)
      goto LABEL_4;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("playlistSeeded")) & 1) != 0)
    {
      v4 = 9;
      goto LABEL_24;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("query")) & 1) != 0)
    {
LABEL_4:
      v4 = 0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("songSeeded")) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("streaming")) & 1) != 0)
    {
      v4 = 4;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("user")))
    {
      v4 = 8;
    }
    else
    {
      v4 = 0;
    }
  }
LABEL_24:

  return v4;
}

- (int64_t)radioStationSubTypeFromSubType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Episode")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Shoutcast")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)recentlyPlayedItemsWithAPILoadedOutput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            -[MPModelStoreRadioMusicKitRequestOperation recentlyPlayedItemWithDictionary:](self, "recentlyPlayedItemWithDictionary:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }

      v13 = (void *)objc_msgSend(v5, "copy");
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)recentlyPlayedItemWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MPModelStoreBrowseContentItem *v7;
  id v8;
  MPModelStoreBrowseContentItem *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelStoreRadioMusicKitRequestOperation radioStationWithDictionary:](self, "radioStationWithDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [MPModelStoreBrowseContentItem alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__MPModelStoreRadioMusicKitRequestOperation_recentlyPlayedItemWithDictionary___block_invoke;
  v11[3] = &unk_1E31543E8;
  v12 = v6;
  v8 = v6;
  v9 = -[MPModelObject initWithIdentifiers:block:](v7, "initWithIdentifiers:block:", v5, v11);

  return v9;
}

- (id)radioStationWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  MPModelRadioStation *v8;
  MPIdentifierSet *v9;
  void *v10;
  MPIdentifierSet *v11;
  id v12;
  MPModelRadioStation *v13;
  _QWORD v15[4];
  id v16;
  MPModelStoreRadioMusicKitRequestOperation *v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke;
  v18[3] = &unk_1E3163A58;
  v6 = v4;
  v19 = v6;
  v7 = (void *)MEMORY[0x19403A810](v18);
  v8 = [MPModelRadioStation alloc];
  v9 = [MPIdentifierSet alloc];
  +[MPModelRadioStationKind identityKind](MPModelRadioStationKind, "identityKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MPIdentifierSet initWithSource:modelKind:block:](v9, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v10, v7);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_3;
  v15[3] = &unk_1E3154450;
  v16 = v6;
  v17 = self;
  v12 = v6;
  v13 = -[MPModelObject initWithIdentifiers:block:](v8, "initWithIdentifiers:block:", v11, v15);

  return v13;
}

void __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  objc_msgSend(v5, "radio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stationStringID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_2;
    v6[3] = &unk_1E3162BD0;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setRadioIdentifiersWithBlock:", v6);

  }
}

void __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v5);
    objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("kind"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setType:", objc_msgSend(*(id *)(a1 + 40), "radioStationTypeFromKind:", v6));
    objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("streamingRadioSubType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSubtype:", objc_msgSend(*(id *)(a1 + 40), "radioStationSubTypeFromSubType:", v7));
    objc_msgSend(v4, "ic_dictionaryValueForKey:", CFSTR("editorialNotes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_stringValueForKey:", CFSTR("standard"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEditorNotes:", v9);
    objc_msgSend(v8, "ic_stringValueForKey:", CFSTR("short"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShortEditorNotes:", v10);
    objc_msgSend(v4, "objectForKey:", CFSTR("isLive"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "setLive:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("stationProviderName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProviderName:", v12);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_4;
    v13[3] = &unk_1E3154428;
    v14 = v4;
    objc_msgSend(v3, "setArtworkCatalogBlock:", v13);

  }
}

MPArtworkCatalog *__72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_4(uint64_t a1)
{
  MPStoreArtworkRequestToken *v2;
  void *v3;
  uint64_t v4;
  MPArtworkCatalog *v5;
  void *v6;
  MPArtworkCatalog *v7;

  v2 = objc_alloc_init(MPStoreArtworkRequestToken);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("artwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    +[MPStoreItemMetadata artworkRequestTokenForStorePlatformArtworkValue:](MPStoreItemMetadata, "artworkRequestTokenForStorePlatformArtworkValue:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (MPStoreArtworkRequestToken *)v4;
  }
  if (v2)
  {
    -[MPStoreArtworkRequestToken setCropStyle:](v2, "setCropStyle:", *MEMORY[0x1E0DDBDB8]);
    v5 = [MPArtworkCatalog alloc];
    +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MPArtworkCatalog initWithToken:dataSource:](v5, "initWithToken:dataSource:", v2, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __72__MPModelStoreRadioMusicKitRequestOperation_radioStationWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MPStoreItemMetadataStringNormalizeStoreIDValue(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStationStringID:", v4);

}

void __78__MPModelStoreRadioMusicKitRequestOperation_recentlyPlayedItemWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setItemType:", 5);
  objc_msgSend(v3, "setDetailedItemType:", 8);
  objc_msgSend(v3, "setRadioStation:", *(_QWORD *)(a1 + 32));

}

void __76__MPModelStoreRadioMusicKitRequestOperation_recentlyPlayedSectionWithTitle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setTitle:", v2);
  objc_msgSend(v3, "setDisplaysAsGridCellInCarPlay:", 1);
  objc_msgSend(v3, "setSectionType:", 9);
  objc_msgSend(v3, "setLoadAdditionalContentURL:", 0);

}

void __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v5 = a2;
  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5956;
  v28 = __Block_byref_object_dispose__5957;
  v29 = 0;
  objc_msgSend(v5, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_10;
  v19[3] = &unk_1E3154370;
  v19[4] = &v20;
  v19[5] = &v24;
  objc_msgSend(v8, "enumerateSectionsUsingBlock:", v19);
  if (v21[3] == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v8, "removeSectionAtIndex:"), objc_msgSend(*(id *)(a1 + 32), "additionalContent") != 1))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "recentlyPlayedItemsWithAPILoadedOutput:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "recentlyPlayedSectionWithTitle:", v25[5]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v8, "insertSection:atIndex:", v11, v21[3]);
      v13 = v9;
      v14 = 3221225472;
      v15 = __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2;
      v16 = &unk_1E3163490;
      v17 = v8;
      v18 = &v20;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v13);

    }
    else
    {
      v11 = 0;
    }

  }
  v12 = (void *)objc_msgSend(v8, "copy", v13, v14, v15, v16);
  objc_msgSend(v5, "setResults:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v24, 8);
}

void __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "sectionType") == 9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    objc_msgSend(v10, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

void __88__MPModelStoreRadioMusicKitRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB36B0];
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = a2;
  objc_msgSend(v4, "indexPathForItem:inSection:", a3, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertItem:atIndexPath:", v7, v8);

}

@end
