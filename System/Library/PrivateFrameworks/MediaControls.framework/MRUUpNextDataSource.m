@implementation MRUUpNextDataSource

- (MRUUpNextDataSource)init
{
  MRUUpNextDataSource *v2;
  uint64_t v3;
  NSArray *responseItemIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUUpNextDataSource;
  v2 = -[MRUUpNextDataSource init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    responseItemIDs = v2->_responseItemIDs;
    v2->_responseItemIDs = (NSArray *)v3;

  }
  return v2;
}

- (void)setResponse:(id)a3
{
  MPCPlayerResponse *v5;
  void *v6;
  MPCPlayerResponse *v7;

  v5 = (MPCPlayerResponse *)a3;
  if (self->_response != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_response, a3);
    -[MRUUpNextDataSource updateContentItems](self, "updateContentItems");
    -[MRUUpNextDataSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "upNextDataSource:didChangeResponseItemIDs:", self, self->_responseItemIDs);

    v5 = v7;
  }

}

- (id)responseItemForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_responseItemsByIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flattenedGenericObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_responseItemsByIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flattenedGenericObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)playItemWithIdentifier:(id)a3 completion:(id)a4
{
  NSDictionary *responseItemsByIdentifier;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](responseItemsByIdentifier, "objectForKeyedSubscript:", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerResponse tracklist](self->_response, "tracklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changeItemCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "changeToItem:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlayerResponse play](self->_response, "play");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
    objc_msgSend(v12, "addObject:", v10);
  if (v11)
    objc_msgSend(v13, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0D4B358], "requestWithCommandRequests:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performWithCompletion:", v7);

}

- (void)moveReponseItemToNextWithIdentifier:(id)a3 completion:(id)a4
{
  NSDictionary *responseItemsByIdentifier;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](responseItemsByIdentifier, "objectForKeyedSubscript:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerResponse tracklist](self->_response, "tracklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlayerResponse tracklist](self->_response, "tracklist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reorderCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moveItem:afterItem:", v13, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4B358], "performRequest:completion:", v12, v7);
}

- (void)moveReponseItemWithIdentifier:(id)a3 afterResponseItemWithIdentifier:(id)a4 completion:(id)a5
{
  NSDictionary *responseItemsByIdentifier;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  v9 = a5;
  v10 = a4;
  -[NSDictionary objectForKeyedSubscript:](responseItemsByIdentifier, "objectForKeyedSubscript:", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_responseItemsByIdentifier, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlayerResponse tracklist](self->_response, "tracklist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reorderCommand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moveItem:afterItem:", v15, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4B358], "performRequest:completion:", v14, v9);
}

- (BOOL)canMoveResponseItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[NSDictionary objectForKeyedSubscript:](self->_responseItemsByIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerResponse tracklist](self->_response, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reorderCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canMoveItem:", v4);

  return v7;
}

- (void)removeResponseItemWithIdentifier:(id)a3 completion:(id)a4
{
  NSDictionary *responseItemsByIdentifier;
  id v6;
  void *v7;
  void *v8;
  id v9;

  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](responseItemsByIdentifier, "objectForKeyedSubscript:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D4B358];
  objc_msgSend(v9, "remove");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performRequest:completion:", v8, v6);

}

- (void)updateContentItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *responseItemIDs;
  NSDictionary *v20;
  NSDictionary *responseItemsByIdentifier;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MPCPlayerResponse tracklist](self->_response, "tracklist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerResponse tracklist](self->_response, "tracklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        if (v15 != v9)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "contentItemIdentifier", (_QWORD)v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

          objc_msgSend(v15, "contentItemIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v17);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v18 = (NSArray *)objc_msgSend(v6, "copy");
  responseItemIDs = self->_responseItemIDs;
  self->_responseItemIDs = v18;

  v20 = (NSDictionary *)objc_msgSend(v7, "copy");
  responseItemsByIdentifier = self->_responseItemsByIdentifier;
  self->_responseItemsByIdentifier = v20;

}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (MRUUpNextDataSourceDelegate)delegate
{
  return (MRUUpNextDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)responseItemIDs
{
  return self->_responseItemIDs;
}

- (NSDictionary)responseItemsByIdentifier
{
  return self->_responseItemsByIdentifier;
}

- (void)setResponseItemsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_responseItemsByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseItemsByIdentifier, 0);
  objc_storeStrong((id *)&self->_responseItemIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
