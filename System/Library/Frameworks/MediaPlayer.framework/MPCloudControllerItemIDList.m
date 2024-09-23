@implementation MPCloudControllerItemIDList

- (MPCloudControllerItemIDList)init
{
  MPCloudControllerItemIDList *v2;
  ICCloudItemIDList *v3;
  ICCloudItemIDList *cloudItemIDList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCloudControllerItemIDList;
  v2 = -[MPCloudControllerItemIDList init](&v6, sel_init);
  if (v2)
  {
    v3 = (ICCloudItemIDList *)objc_alloc_init(MEMORY[0x1E0DDBF28]);
    cloudItemIDList = v2->_cloudItemIDList;
    v2->_cloudItemIDList = v3;

  }
  return v2;
}

- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4
{
  -[ICCloudItemIDList addCloudItemID:idType:](self->_cloudItemIDList, "addCloudItemID:idType:", a3, a4);
}

- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5
{
  -[ICCloudItemIDList insertCloudItemID:idType:atIndex:](self->_cloudItemIDList, "insertCloudItemID:idType:atIndex:", a3, a4, a5);
}

- (void)addPlaylistID:(id)a3
{
  -[ICCloudItemIDList addGlobalPlaylistID:](self->_cloudItemIDList, "addGlobalPlaylistID:", a3);
}

- (id)ICCloudItemIDList
{
  return self->_cloudItemIDList;
}

- (ICCloudItemIDList)cloudItemIDList
{
  return self->_cloudItemIDList;
}

- (void)setCloudItemIDList:(id)a3
{
  objc_storeStrong((id *)&self->_cloudItemIDList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudItemIDList, 0);
}

+ (id)cloudItemIDListForPlaylist:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  MPCloudControllerItemIDList *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;
  id obj;
  MPCloudControllerItemIDList *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = objc_alloc_init(MPCloudControllerItemIDList);
  v22 = v3;
  objc_msgSend(v3, "itemsQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setIgnoreRestrictionsPredicates:", 1);
  objc_msgSend(v5, "setIgnoreSystemFilterPredicates:", 1);
  v21 = v5;
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeSagaID"), CFSTR("subscriptionStoreItemAdamID"), CFSTR("cloudIsInMyLibrary"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "valuesForProperties:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("storeSagaID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "longLongValue");

        objc_msgSend(v12, "objectForKey:", CFSTR("subscriptionStoreItemAdamID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "longLongValue");

        if (v14 < 1)
        {
          if (v16 < 1)
            goto LABEL_11;
          v17 = v24;
          v18 = v16;
          v19 = 1;
        }
        else
        {
          v17 = v24;
          v18 = v14;
          v19 = 0;
        }
        -[MPCloudControllerItemIDList addCloudItemID:idType:](v17, "addCloudItemID:idType:", v18, v19);
LABEL_11:

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v24;
}

@end
