@implementation MPConcreteMediaPlaylist

- (MPConcreteMediaPlaylist)initWithProperties:(id)a3 itemsQuery:(id)a4
{
  id v6;
  id v7;
  MPConcreteMediaPlaylist *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  uint64_t v11;
  NSMutableDictionary *properties;
  uint64_t v13;
  MPMediaQuery *itemsQuery;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MPConcreteMediaPlaylist;
  v8 = -[MPMediaItemCollection initWithItems:](&v16, sel_initWithItems_, 0);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.MediaPlayer.MPConcreteMediaPlaylist.accessQueue", 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(v6, "mutableCopy");
    properties = v8->_properties;
    v8->_properties = (NSMutableDictionary *)v11;

    v13 = objc_msgSend(v7, "copy");
    itemsQuery = v8->_itemsQuery;
    v8->_itemsQuery = (MPMediaQuery *)v13;

  }
  return v8;
}

- (id)itemsQuery
{
  return self->_itemsQuery;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MPMediaQuery *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (MPMediaQuery *)v4[13];
    if (v5 == self->_itemsQuery)
      v6 = 1;
    else
      v6 = -[MPMediaQuery isEqual:](v5, "isEqual:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[MPMediaQuery hash](self->_itemsQuery, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithProperties:itemsQuery:", self->_properties, self->_itemsQuery);
}

- (MPConcreteMediaPlaylist)initWithCoder:(id)a3
{
  id v4;
  MPConcreteMediaPlaylist *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  uint64_t v8;
  MPMediaQuery *itemsQuery;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *properties;
  MPConcreteMediaPlaylist *v18;
  objc_super v20;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v20.receiver = self;
    v20.super_class = (Class)MPConcreteMediaPlaylist;
    v5 = -[MPMediaItemCollection initWithItems:](&v20, sel_initWithItems_, 0);
    if (v5)
    {
      v6 = dispatch_queue_create("com.apple.MediaPlayer.MPConcreteMediaPlaylist.accessQueue", 0);
      accessQueue = v5->_accessQueue;
      v5->_accessQueue = (OS_dispatch_queue *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPQuery"));
      v8 = objc_claimAutoreleasedReturnValue();
      itemsQuery = v5->_itemsQuery;
      v5->_itemsQuery = (MPMediaQuery *)v8;

      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("MPProperties"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "mutableCopy");
      properties = v5->_properties;
      v5->_properties = (NSMutableDictionary *)v16;

    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_itemsQuery, CFSTR("MPQuery"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_properties, CFSTR("MPProperties"));
  }

}

- (id)mediaLibrary
{
  return -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
}

- (BOOL)existsInLibrary
{
  MPConcreteMediaPlaylist *v2;
  void *v3;

  v2 = self;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "playlistExistsWithPersistentID:", -[MPMediaPlaylist persistentID](v2, "persistentID"));

  return (char)v2;
}

- (id)_tokenBinaryIdentifierAsString
{
  void *v3;
  MPMediaEntityPersistentID v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D51230];
  v4 = -[MPMediaPlaylist persistentID](self, "persistentID");
  -[MPConcreteMediaPlaylist mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ml3Library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForEntityWithPersistentID:libraryUID:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__MPConcreteMediaPlaylist_setValue_forProperty___block_invoke;
  v11[3] = &unk_1E3157760;
  v13 = &v14;
  v9 = v8;
  v12 = v9;
  -[MPConcreteMediaPlaylist setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v6, v7, v11);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)setValuesForProperties:(id)a3 trackList:(id)a4 andEntryProperties:(id)a5 withCompletionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryDataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "setValuesForProperties:trackList:andEntryProperties:ofPlaylistWithIdentifier:completionBlock:", v15, v10, v11, -[MPMediaPlaylist persistentID](self, "persistentID"), v12);
  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }

}

- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MPMediaEntityPersistentID v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "libraryDataProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = -[MPMediaPlaylist persistentID](self, "persistentID");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__MPConcreteMediaPlaylist_setValue_forProperty_withCompletionBlock___block_invoke;
    v14[3] = &unk_1E3163250;
    v16 = v10;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v12, "setValue:forProperty:ofPlaylistWithIdentifier:completionBlock:", v8, v15, v13, v14);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (id)items
{
  return -[MPMediaQuery items](self->_itemsQuery, "items");
}

- (id)representativeItem
{
  void *v2;
  void *v3;

  -[MPConcreteMediaPlaylist items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unint64_t)count
{
  return -[MPMediaQuery _countOfItems](self->_itemsQuery, "_countOfItems");
}

- (unint64_t)mediaTypes
{
  void *v2;
  unint64_t v3;

  -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("mediaType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)multiverseIdentifier
{
  void *v3;
  void *v4;

  -[MPConcreteMediaPlaylist mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multiverseIdentifierForCollectionWithPersistentID:groupingType:", -[MPMediaPlaylist persistentID](self, "persistentID"), 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateItemPersistentIDsUsingBlock:](self->_itemsQuery, "_enumerateItemPersistentIDsUsingBlock:", a3);
}

- (id)valueForProperty:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *);
  void *v23;
  MPConcreteMediaPlaylist *v24;
  id v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  MPConcreteMediaPlaylist *v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD block[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = a3;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__19541;
  v44 = __Block_byref_object_dispose__19542;
  v45 = 0;
  accessQueue = self->_accessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke;
  block[3] = &unk_1E31635A8;
  v39 = &v40;
  block[4] = self;
  v8 = v4;
  v38 = v8;
  dispatch_sync(accessQueue, block);
  if (!v41[5])
  {
    objc_msgSend(v5, "libraryDataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__19541;
      v35 = __Block_byref_object_dispose__19542;
      v36 = 0;
      v10 = self->_accessQueue;
      v30[0] = v7;
      v30[1] = 3221225472;
      v30[2] = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_2;
      v30[3] = &unk_1E3163580;
      v30[4] = self;
      v30[5] = &v31;
      dispatch_sync(v10, v30);
      v11 = objc_msgSend((id)v32[5], "unsignedLongLongValue");
      objc_msgSend(v5, "libraryDataProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v7;
      v27[1] = 3221225472;
      v27[2] = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_3;
      v27[3] = &unk_1E3157788;
      v28 = v5;
      v29 = self;
      objc_msgSend(v12, "loadProperties:ofCollectionWithIdentifier:groupingType:completionBlock:", v13, v11, 6, v27);

      v14 = self->_accessQueue;
      v20 = v7;
      v21 = 3221225472;
      v22 = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_5;
      v23 = &unk_1E31635A8;
      v26 = &v40;
      v24 = self;
      v25 = v8;
      dispatch_sync(v14, &v20);

      _Block_object_dispose(&v31, 8);
    }
  }
  v15 = (void *)v41[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null", v20, v21, v22, v23, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqual:", v16) & 1) != 0)
    v17 = 0;
  else
    v17 = (void *)v41[5];
  v18 = v17;

  _Block_object_dispose(&v40, 8);
  return v18;
}

- (id)valuesForProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *accessQueue;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  MPConcreteMediaPlaylist *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  MPConcreteMediaPlaylist *v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD block[4];
  id v36;
  MPConcreteMediaPlaylist *v37;
  id v38;
  id v39;

  v4 = a3;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  accessQueue = self->_accessQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke;
  block[3] = &unk_1E315D848;
  v10 = v4;
  v36 = v10;
  v37 = self;
  v11 = v7;
  v38 = v11;
  v12 = v6;
  v39 = v12;
  dispatch_sync(accessQueue, block);
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v5, "libraryDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__19541;
      v33 = __Block_byref_object_dispose__19542;
      v34 = 0;
      v14 = self->_accessQueue;
      v28[0] = v9;
      v28[1] = 3221225472;
      v28[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_2;
      v28[3] = &unk_1E3163580;
      v28[4] = self;
      v28[5] = &v29;
      dispatch_sync(v14, v28);
      v15 = objc_msgSend((id)v30[5], "unsignedLongLongValue");
      objc_msgSend(v5, "libraryDataProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v9;
      v25[1] = 3221225472;
      v25[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_3;
      v25[3] = &unk_1E3157788;
      v26 = v5;
      v27 = self;
      objc_msgSend(v16, "loadProperties:ofCollectionWithIdentifier:groupingType:completionBlock:", v11, v15, 6, v25);

      v17 = self->_accessQueue;
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_5;
      v21[3] = &unk_1E3163698;
      v22 = v11;
      v23 = self;
      v24 = v12;
      dispatch_sync(v17, v21);

      _Block_object_dispose(&v29, 8);
    }
  }
  v18 = v39;
  v19 = v12;

  return v19;
}

- (void)_updateLibraryForPlaylistEdit:(id)a3
{
  objc_msgSend(a3, "_clearCachedEntitiesIncludingResultSets:", 1);
}

- (void)replaceItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  MPConcreteMediaPlaylist *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryDataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = self;
    v20 = v9;
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "longLongValue");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "valueForProperty:", CFSTR("persistentID"), v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __51__MPConcreteMediaPlaylist_replaceItems_completion___block_invoke;
    v21[3] = &unk_1E31577B0;
    v21[4] = v19;
    v22 = v8;
    v23 = v7;
    v9 = v20;
    objc_msgSend(v20, "setItemsWithIdentifiers:forPlaylistWithIdentifier:completionBlock:", v11, v18, v21);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)replaceItemsWithPersistentIDs:(id)a3 completion:(id)a4
{
  -[MPConcreteMediaPlaylist replaceItemsWithPersistentIDs:andEntryProperties:completion:](self, "replaceItemsWithPersistentIDs:andEntryProperties:completion:", a3, MEMORY[0x1E0C9AA70], a4);
}

- (void)replaceItemsWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "libraryDataProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "longLongValue");

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__MPConcreteMediaPlaylist_replaceItemsWithPersistentIDs_andEntryProperties_completion___block_invoke;
    v15[3] = &unk_1E31577B0;
    v15[4] = self;
    v16 = v11;
    v17 = v10;
    objc_msgSend(v12, "setItemsWithIdentifiers:andEntryProperties:forPlaylistWithIdentifier:completionBlock:", v8, v9, v14, v15);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)appendItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryDataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    v12 = objc_msgSend(v6, "persistentID");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__MPConcreteMediaPlaylist_appendItem_completion___block_invoke;
    v13[3] = &unk_1E31577B0;
    v13[4] = self;
    v14 = v8;
    v15 = v7;
    objc_msgSend(v9, "addItemWithIdentifier:toPlaylistWithIdentifier:completionBlock:", v12, v11, v13);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)appendItems:(id)a3 completion:(id)a4
{
  -[MPConcreteMediaPlaylist appendItems:andEntryProperties:completion:](self, "appendItems:andEntryProperties:completion:", a3, MEMORY[0x1E0C9AA70], a4);
}

- (void)appendItems:(id)a3 andEntryProperties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "libraryDataProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "longLongValue");

    objc_msgSend(v8, "valueForKey:", CFSTR("persistentID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__MPConcreteMediaPlaylist_appendItems_andEntryProperties_completion___block_invoke;
    v16[3] = &unk_1E31577B0;
    v16[4] = self;
    v17 = v11;
    v18 = v10;
    objc_msgSend(v12, "addItemsWithIdentifiers:andEntryProperties:toPlaylistWithIdentifier:completionBlock:", v15, v9, v14, v16);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)addMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, void *);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (+[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") != MPMediaLibraryAuthorizationStatusAuthorized)
  {
    if (!v7)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PERMISSION_DENIED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 1;
LABEL_17:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14);

    goto LABEL_18;
  }
  if (!-[MPConcreteMediaPlaylist _allowsEditing](self, "_allowsEditing"))
  {
    if (!v7)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOT_SUPPORTED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 5;
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__MPConcreteMediaPlaylist_addMediaItems_completionHandler___block_invoke;
    v15[3] = &unk_1E31596D8;
    v15[4] = self;
    v16 = v7;
    -[MPConcreteMediaPlaylist appendItems:completion:](self, "appendItems:completion:", v6, v15);

  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
LABEL_18:

}

- (void)addItemWithProductID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MPMediaEntityPersistentID v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    v8 = objc_msgSend(v6, "longLongValue");
    if (-[MPConcreteMediaPlaylist _allowsEditing](self, "_allowsEditing") && v8)
    {
      -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "libraryDataProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = -[MPMediaPlaylist persistentID](self, "persistentID");
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __66__MPConcreteMediaPlaylist_addItemWithProductID_completionHandler___block_invoke;
        v20[3] = &unk_1E31624C0;
        v21 = v7;
        objc_msgSend(v10, "sdk_addItemWithOpaqueIdentifier:toPlaylistWithIdentifier:completionBlock:", v6, v11, v20);
        v12 = v21;
      }
      else
      {
        if (!v7)
        {
LABEL_21:

          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NOT_SUPPORTED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v22 = *MEMORY[0x1E0CB2D50];
          v23 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 5, v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v7 + 2))(v7, v19);

      }
LABEL_20:

      goto LABEL_21;
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NOT_SUPPORTED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v24 = *MEMORY[0x1E0CB2D50];
        v25 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = 5;
LABEL_19:
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), v18, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
      goto LABEL_20;
    }
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PERMISSION_DENIED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 1;
    goto LABEL_19;
  }
LABEL_22:

}

- (void)removeItems:(id)a3 atFilteredIndexes:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryDataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "longLongValue");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__MPConcreteMediaPlaylist_removeItems_atFilteredIndexes_completionBlock___block_invoke;
    v13[3] = &unk_1E31577B0;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    objc_msgSend(v10, "removeItemsAtIndexes:inPlaylistWithIdentifier:completionBlock:", v7, v12, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)removeAllItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "longLongValue");

    objc_msgSend(v3, "removeAllItemsInPlaylistWithIdentifier:", v5);
  }

}

- (void)removeFirstItem
{
  void *v3;
  id v4;

  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "removeFirstItemFromPlaylistWithIdentifier:", -[MPMediaPlaylist persistentID](self, "persistentID"));

}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a5;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryDataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "longLongValue");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__MPConcreteMediaPlaylist_moveItemFromIndex_toIndex_completionBlock___block_invoke;
    v13[3] = &unk_1E31577B0;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    objc_msgSend(v10, "moveItemFromIndex:toIndex:inPlaylistWithIdentifier:completionBlock:", a3, a4, v12, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)setReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a5;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "libraryDataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "longLongValue");

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__MPConcreteMediaPlaylist_setReactionText_onEntryAtPosition_completion___block_invoke;
    v14[3] = &unk_1E31577D8;
    v15 = v9;
    objc_msgSend(v11, "setReactionText:onEntryAtPosition:inPlaylistWithIdentifier:completion:", v8, a4, v13, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)populateWithSeedItem:(id)a3 completionBlock:(id)a4
{
  -[MPConcreteMediaPlaylist populateWithSeedItem:queue:completionBlock:](self, "populateWithSeedItem:queue:completionBlock:", a3, MEMORY[0x1E0C80D38], a4);
}

- (void)populateWithSeedItem:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;
  NSObject *v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v9 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
  }
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "libraryDataProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPConcreteMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "longLongValue");

    objc_msgSend(v8, "valueForProperty:", CFSTR("persistentID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "longLongValue");

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke;
    v21[3] = &unk_1E3157800;
    v21[4] = self;
    v22 = v12;
    v24 = v10;
    v23 = v9;
    objc_msgSend(v13, "seedPlaylistWithIdentifier:withItemWithIdentifier:completionBlock:", v15, v17, v21);

    v18 = v22;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke_3;
    block[3] = &unk_1E31637F8;
    v20 = v10;
    dispatch_async(v9, block);
    v18 = v20;
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)beginGeneratingGeniusClusterItemsWithSeedItems:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t i;
  void *v13;
  BOOL v14;

  v6 = a3;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_clusterPlaylist)
    objc_msgSend(v8, "releaseGeniusClusterPlaylist:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend(v6, "count");
    v11 = malloc_type_malloc(8 * objc_msgSend(v6, "count"), 0x100004000313F17uLL);
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v6, "objectAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11[i] = objc_msgSend(v13, "persistentID");

      }
    }
    self->_clusterPlaylist = (void *)objc_msgSend(v9, "createGeniusClusterPlaylistWithSeedItemIdentifiers:count:error:", v11, v10, a4);
    free(v11);
  }
  v14 = self->_clusterPlaylist != 0;

  return v14;
}

- (id)geniusClusterItemsWithCount:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *clusterPlaylist;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  unint64_t i;
  void *v15;
  unint64_t v17;

  v17 = a3;
  -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryDataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  clusterPlaylist = self->_clusterPlaylist;
  if (clusterPlaylist
    && (v10 = objc_msgSend(v7, "generateItemIdentifiersForGeniusClusterPlaylist:count:error:", clusterPlaylist, &v17, a4), v17))
  {
    v11 = (_QWORD *)v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      for (i = 0; i < v17; ++i)
      {
        objc_msgSend(v13, "itemWithPersistentID:", v11[i]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v12, "addObject:", v15);

      }
    }
    free(v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)endGeneratingGeniusClusterItems
{
  void *v3;
  id v4;

  if (self->_clusterPlaylist)
  {
    -[MPMediaQuery mediaLibrary](self->_itemsQuery, "mediaLibrary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryDataProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "releaseGeniusClusterPlaylist:", self->_clusterPlaylist);
    self->_clusterPlaylist = 0;

  }
}

- (BOOL)_allowsEditing
{
  return (-[MPMediaPlaylist playlistAttributes](self, "playlistAttributes") & 6) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsQuery, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryForPlaylistEdit:", *(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 56);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke_2;
    block[3] = &unk_1E315C170;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __72__MPConcreteMediaPlaylist_setReactionText_onEntryAtPosition_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __69__MPConcreteMediaPlaylist_moveItemFromIndex_toIndex_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryForPlaylistEdit:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __73__MPConcreteMediaPlaylist_removeItems_atFilteredIndexes_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryForPlaylistEdit:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __66__MPConcreteMediaPlaylist_addItemWithProductID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v3)
    {
      objc_msgSend(v3, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("MPErrorDomain"));

      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v11 = *MEMORY[0x1E0CB2D50];
          v12[0] = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 0, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v10;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __59__MPConcreteMediaPlaylist_addMediaItems_completionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:](MPCloudControllerItemIDList, "cloudItemIDListForPlaylist:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", 0, v3, objc_msgSend(*(id *)(a1 + 32), "persistentID"), 0);

    v7 = *(_QWORD *)(a1 + 40);
    if (!v7)
      return;
    v8 = 0;
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      return;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 0, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 40);
  }
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

uint64_t __69__MPConcreteMediaPlaylist_appendItems_andEntryProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryForPlaylistEdit:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __49__MPConcreteMediaPlaylist_appendItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryForPlaylistEdit:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __87__MPConcreteMediaPlaylist_replaceItemsWithPersistentIDs_andEntryProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryForPlaylistEdit:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __51__MPConcreteMediaPlaylist_replaceItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryForPlaylistEdit:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "valueForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if ((v9 & 1) == 0)
        {
          if (!v7)
            goto LABEL_10;
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v7, v6);
        }
        objc_msgSend(*(id *)(a1 + 48), "removeObject:", v6);
LABEL_10:

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKey:", CFSTR("playlistPersistentID"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("seedItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "itemWithPersistentID:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "unsignedLongLongValue"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v12, "setValue:forKey:", v5, CFSTR("seedItems"));

    v3 = v12;
  }
  if (objc_msgSend(v3, "count"))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(NSObject **)(v13 + 88);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_4;
    v15[3] = &unk_1E31635F8;
    v15[4] = v13;
    v16 = v3;
    dispatch_sync(v14, v15);

  }
}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "valueForKey:", v7, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v7);
        }
        else
        {
          v9 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v10, v7);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v3)
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", v2);
  }
  else
  {
    v4 = objc_msgSend(v2, "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v4;

  }
}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 96), "valueForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKey:", CFSTR("playlistPersistentID"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("seedItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "itemWithPersistentID:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "unsignedLongLongValue"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v12, "setValue:forKey:", v5, CFSTR("seedItems"));

    v3 = v12;
  }
  if (objc_msgSend(v3, "count"))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(NSObject **)(v13 + 88);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_4;
    v15[3] = &unk_1E31635F8;
    v15[4] = v13;
    v16 = v3;
    dispatch_sync(v14, v15);

  }
}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v5 = *(void **)(a1[4] + 96);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, a1[5]);

  }
}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v3)
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", v2);
  }
  else
  {
    v4 = objc_msgSend(v2, "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v4;

  }
}

void __68__MPConcreteMediaPlaylist_setValue_forProperty_withCompletionBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v2 = a1[6];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = a1[4];
  v4 = (void *)a1[5];
  v5 = *(NSObject **)(v3 + 88);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__MPConcreteMediaPlaylist_setValue_forProperty_withCompletionBlock___block_invoke_2;
  v6[3] = &unk_1E31635F8;
  v6[4] = v3;
  v7 = v4;
  dispatch_sync(v5, v6);

}

uint64_t __68__MPConcreteMediaPlaylist_setValue_forProperty_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(CFSTR("isActivePlaylist"), "isEqualToString:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", CFSTR("isActiveGeniusPlaylist"));
  return result;
}

intptr_t __48__MPConcreteMediaPlaylist_setValue_forProperty___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
