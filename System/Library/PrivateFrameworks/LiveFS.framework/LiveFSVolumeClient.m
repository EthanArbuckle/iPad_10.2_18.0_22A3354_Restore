@implementation LiveFSVolumeClient

+ (id)exportedClientInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255BFF288);
}

- (LiveFSVolumeClient)init
{
  LiveFSVolumeClient *v2;
  uint64_t v3;
  NSMutableDictionary *searchResultsBlocks;
  uint64_t v5;
  NSMutableDictionary *searchCompletionBlocks;
  uint64_t v7;
  NSMapTable *updateHandlers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LiveFSVolumeClient;
  v2 = -[LiveFSVolumeClient init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    searchResultsBlocks = v2->_searchResultsBlocks;
    v2->_searchResultsBlocks = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    searchCompletionBlocks = v2->_searchCompletionBlocks;
    v2->_searchCompletionBlocks = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    updateHandlers = v2->_updateHandlers;
    v2->_updateHandlers = (NSMapTable *)v7;

  }
  return v2;
}

- (void)connectionWasInvalidated
{
  void *v2;
  void *i;
  void *v4;
  LiveFSVolumeClient *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](obj->_searchCompletionBlocks, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1);
  -[NSMapTable objectEnumerator](obj->_updateHandlers, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = v4)
  {
    objc_msgSend(v2, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    objc_msgSend(v4, "updatesDoneFor:", CFSTR("NSFileProviderRootContainerItemIdentifier"));
  }
  -[NSMutableDictionary removeAllObjects](obj->_searchResultsBlocks, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](obj->_searchCompletionBlocks, "removeAllObjects");
  -[NSMapTable removeAllObjects](obj->_updateHandlers, "removeAllObjects");

  objc_sync_exit(obj);
}

void __46__LiveFSVolumeClient_connectionWasInvalidated__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void (**v4)(id, uint64_t);

  *a4 = 0;
  v4 = (void (**)(id, uint64_t))MEMORY[0x22E2FAC64](a3);
  v4[2](v4, 54);

}

- (int)LISCAddSearchHandlers:(id)a3 resultHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  LiveFSVolumeClient *v11;
  void *v12;
  int v13;
  NSMutableDictionary *searchCompletionBlocks;
  void *v15;
  NSMutableDictionary *searchResultsBlocks;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  -[NSMutableDictionary objectForKey:](v11->_searchCompletionBlocks, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = 17;
  }
  else
  {
    searchCompletionBlocks = v11->_searchCompletionBlocks;
    v15 = (void *)objc_msgSend(v10, "copy");
    -[NSMutableDictionary setObject:forKey:](searchCompletionBlocks, "setObject:forKey:", v15, v8);

    searchResultsBlocks = v11->_searchResultsBlocks;
    v17 = (void *)objc_msgSend(v9, "copy");
    -[NSMutableDictionary setObject:forKey:](searchResultsBlocks, "setObject:forKey:", v17, v8);

    v13 = 0;
  }
  objc_sync_exit(v11);

  return v13;
}

- (void)LISCDropSearchHandlers:(id)a3
{
  LiveFSVolumeClient *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKey:](v4->_searchCompletionBlocks, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary setValue:forKey:](v4->_searchCompletionBlocks, "setValue:forKey:", 0, v6);
    -[NSMutableDictionary setValue:forKey:](v4->_searchResultsBlocks, "setValue:forKey:", 0, v6);
  }
  objc_sync_exit(v4);

}

- (void)searchResults:(id)a3 paths:(id)a4 attributes:(id)a5 attributeSize:(unsigned int)a6 xAttrs:(id)a7 resumePath:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  LiveFSVolumeClient *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v20;

  v10 = *(_QWORD *)&a6;
  v20 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = self;
  objc_sync_enter(v18);
  -[NSMutableDictionary objectForKey:](v18->_searchResultsBlocks, "objectForKey:", v20);
  v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v18);

  if (v19)
    ((void (**)(_QWORD, id, id, uint64_t, id, id))v19)[2](v19, v14, v15, v10, v16, v17);

}

- (void)tokenDone:(id)a3 result:(int)a4
{
  uint64_t v4;
  LiveFSVolumeClient *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary objectForKey:](v6->_searchCompletionBlocks, "objectForKey:", v8);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKey:](v6->_searchCompletionBlocks, "objectForKey:", v8);
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](v6->_searchCompletionBlocks, "setValue:forKey:", 0, v8);
    -[NSMutableDictionary setValue:forKey:](v6->_searchResultsBlocks, "setValue:forKey:", 0, v8);
  }
  objc_sync_exit(v6);

  if (v7)
    v7[2](v7, v4);

}

- (int)LISCAddUpdateHandler:(id)a3 forInterestedItem:(id)a4
{
  id v6;
  id v7;
  LiveFSVolumeClient *v8;
  void *v9;
  int v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMapTable objectForKey:](v8->_updateHandlers, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 17;
  }
  else
  {
    -[NSMapTable setObject:forKey:](v8->_updateHandlers, "setObject:forKey:", v6, v7);
    v10 = 0;
  }
  objc_sync_exit(v8);

  return v10;
}

- (void)LISCDropUpdateHandlerForInterestedItem:(id)a3
{
  LiveFSVolumeClient *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMapTable objectForKey:](v4->_updateHandlers, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMapTable setObject:forKey:](v4->_updateHandlers, "setObject:forKey:", 0, v6);
  objc_sync_exit(v4);

}

- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5
{
  id v8;
  id v9;
  LiveFSVolumeClient *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[NSMapTable objectForKey:](v10->_updateHandlers, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v10);

  if (v11)
    objc_msgSend(v11, "updatedItem:name:interestedItem:", v12, v8, v9);

}

- (void)updatedName:(id)a3 interestedItem:(id)a4
{
  id v6;
  LiveFSVolumeClient *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMapTable objectForKey:](v7->_updateHandlers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  if (v8)
    objc_msgSend(v8, "updatedName:interestedItem:", v9, v6);

}

- (void)deletedItem:(id)a3 name:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  LiveFSVolumeClient *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a5;
  v14 = a3;
  v10 = a4;
  v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  -[NSMapTable objectForKey:](v12->_updateHandlers, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v12);

  if (v13)
    objc_msgSend(v13, "deletedItem:name:how:interestedItem:", v14, v10, v7, v11);

}

- (void)deletedName:(id)a3 item:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  LiveFSVolumeClient *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a5;
  v14 = a3;
  v10 = a4;
  v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  -[NSMapTable objectForKey:](v12->_updateHandlers, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v12);

  if (v13)
    objc_msgSend(v13, "deletedName:item:how:interestedItem:", v14, v10, v7, v11);

}

- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4
{
  id v6;
  LiveFSVolumeClient *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMapTable objectForKey:](v7->_updateHandlers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  if (v8)
    objc_msgSend(v8, "volumeWideUpdatedName:interestedItem:", v9, v6);

}

- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4
{
  id v6;
  LiveFSVolumeClient *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMapTable objectForKey:](v7->_updateHandlers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  if (v8)
    objc_msgSend(v8, "volumeWideDeletedName:interestedItem:", v9, v6);

}

- (void)renamedItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  LiveFSVolumeClient *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;

  v27 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = self;
  objc_sync_enter(v19);
  -[NSMapTable objectForKey:](v19->_updateHandlers, "objectForKey:", v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v19->_updateHandlers, "objectForKey:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "isEqualToString:", v16) & 1) == 0)
  {
    -[NSMapTable objectForKey:](v19->_updateHandlers, "objectForKey:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_3;
LABEL_5:
    v23 = 0;
    goto LABEL_6;
  }
  v22 = 0;
  if (!v18)
    goto LABEL_5;
LABEL_3:
  -[NSMapTable objectForKey:](v19->_updateHandlers, "objectForKey:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  objc_sync_exit(v19);

  v24 = v20;
  if (v20 || (v24 = v21) != 0)
  {
    v25 = v24;
LABEL_9:
    objc_msgSend(v25, "renamedItem:named:fromDirectory:intoDirectory:newName:atopItem:", v27, v14, v15, v16, v17, v18);
    goto LABEL_10;
  }
  if (v22)
    v26 = v22;
  else
    v26 = v23;
  v25 = v26;
  if (v25)
    goto LABEL_9;
LABEL_10:

}

- (void)historyResetItem:(id)a3 interestedItem:(id)a4
{
  id v6;
  LiveFSVolumeClient *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMapTable objectForKey:](v7->_updateHandlers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  if (v8)
    objc_msgSend(v8, "historyResetItem:interestedItem:", v9, v6);

}

- (void)historyResetName:(id)a3 interestedItem:(id)a4
{
  id v6;
  LiveFSVolumeClient *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMapTable objectForKey:](v7->_updateHandlers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  if (v8)
    objc_msgSend(v8, "historyResetName:interestedItem:", v9, v6);

}

- (void)updatesDoneFor:(id)a3
{
  LiveFSVolumeClient *v4;
  int v5;
  NSMapTable *updateHandlers;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(CFSTR("NSFileProviderRootContainerItemIdentifier"), "isEqualToString:", v9);
  updateHandlers = v4->_updateHandlers;
  if (v5)
  {
    v7 = (void *)-[NSMapTable copy](updateHandlers, "copy");
    -[NSMapTable removeAllObjects](v4->_updateHandlers, "removeAllObjects");
    v8 = 0;
  }
  else
  {
    -[NSMapTable objectForKey:](updateHandlers, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[NSMapTable setObject:forKey:](v4->_updateHandlers, "setObject:forKey:", 0, v9);
    v7 = 0;
  }
  objc_sync_exit(v4);

  if (v7)
  {
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_56);
  }
  else if (v8)
  {
    objc_msgSend(v8, "updatesDoneFor:", v9);
  }

}

uint64_t __37__LiveFSVolumeClient_updatesDoneFor___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  *a4 = 0;
  return objc_msgSend(a3, "updatesDoneFor:", CFSTR("NSFileProviderRootContainerItemIdentifier"));
}

- (NSMutableDictionary)searchResultsBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSearchResultsBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)searchCompletionBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchCompletionBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMapTable)updateHandlers
{
  return (NSMapTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdateHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_searchCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_searchResultsBlocks, 0);
}

@end
