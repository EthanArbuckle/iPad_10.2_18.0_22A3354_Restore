@implementation MPMusicPlayerControllerMutableQueue

- (MPMusicPlayerControllerMutableQueue)initWithController:(id)a3
{
  MPMusicPlayerControllerMutableQueue *v3;
  uint64_t v4;
  NSMutableArray *removedItems;
  uint64_t v6;
  NSMutableDictionary *insertedDescriptors;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerControllerMutableQueue;
  v3 = -[MPMusicPlayerControllerQueue initWithController:](&v9, sel_initWithController_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    removedItems = v3->_removedItems;
    v3->_removedItems = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    insertedDescriptors = v3->_insertedDescriptors;
    v3->_insertedDescriptors = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)insertQueueDescriptor:(MPMusicPlayerQueueDescriptor *)queueDescriptor afterItem:(MPMediaItem *)afterItem
{
  void *v4;
  MPMusicPlayerQueueDescriptor *v7;
  MPMediaItem *v8;
  uint64_t v9;
  void *v10;
  void *i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  MPMusicPlayerControllerMutableQueue *v26;
  MPMusicPlayerQueueDescriptor *v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = queueDescriptor;
  v8 = afterItem;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    -[MPMediaItem itemIdentifier](v8, "itemIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_29:
    v10 = (void *)v25;
    if (!v25)
      goto LABEL_31;
LABEL_30:
    -[MPMusicPlayerControllerMutableQueue _insertQueueDescriptor:afterItemWithIdentifier:](self, "_insertQueueDescriptor:afterItemWithIdentifier:", v7, v10);
    goto LABEL_31;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[MPMusicPlayerControllerQueue items](self, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v10)
    goto LABEL_35;
  v26 = self;
  v27 = v7;
  v29 = *(_QWORD *)v31;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v31 != v29)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v12, "item", v26, v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "persistentID"))
        v14 = -[MPMediaEntity persistentID](v8, "persistentID") != 0;
      else
        v14 = 0;

      objc_msgSend(v12, "item");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "playbackStoreID");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[MPMediaItem playbackStoreID](v8, "playbackStoreID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 != 0;

        if (!v14)
        {
          if (!v18)
            continue;
          goto LABEL_19;
        }
      }
      else
      {

        if (!v14)
          continue;
        v19 = 0;
      }
      objc_msgSend(v12, "item");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v4, "persistentID");
      if (v20 == -[MPMediaEntity persistentID](v8, "persistentID"))
      {

LABEL_33:
        objc_msgSend(v12, "itemIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if (!v19)
      {

        continue;
      }
LABEL_19:
      objc_msgSend(v12, "item");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "playbackStoreID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaItem playbackStoreID](v8, "playbackStoreID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if (v14)
      {

        if ((v24 & 1) != 0)
          goto LABEL_33;
      }
      else if (v24)
      {
        goto LABEL_33;
      }
    }
    v10 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
      continue;
    break;
  }
LABEL_34:
  self = v26;
  v7 = v27;
LABEL_35:

  if (v10)
    goto LABEL_30;
LABEL_31:

}

- (void)_insertQueueDescriptor:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_insertedDescriptors, "setObject:forKeyedSubscript:", v10, v8);

}

- (void)removeItem:(MPMediaItem *)item
{
  void *v3;
  MPMediaItem *v5;
  uint64_t v6;
  void *v7;
  void *i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  MPMusicPlayerControllerMutableQueue *v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = item;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[MPMediaItem itemIdentifier](v5, "itemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_32;
    goto LABEL_33;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MPMusicPlayerControllerQueue items](self, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v7)
    goto LABEL_31;
  v22 = self;
  v24 = *(_QWORD *)v26;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v26 != v24)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v9, "item");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "persistentID"))
        v11 = -[MPMediaEntity persistentID](v5, "persistentID") != 0;
      else
        v11 = 0;

      objc_msgSend(v9, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playbackStoreID");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        -[MPMediaItem playbackStoreID](v5, "playbackStoreID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 != 0;

        if (!v11)
        {
          if (!v15)
            continue;
          goto LABEL_18;
        }
      }
      else
      {

        if (!v11)
          continue;
        v16 = 0;
      }
      objc_msgSend(v9, "item");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v3, "persistentID");
      if (v17 == -[MPMediaEntity persistentID](v5, "persistentID"))
      {

LABEL_29:
        objc_msgSend(v9, "itemIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      if (!v16)
      {

        continue;
      }
LABEL_18:
      objc_msgSend(v9, "item");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "playbackStoreID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaItem playbackStoreID](v5, "playbackStoreID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if (v11)
      {

        if ((v21 & 1) != 0)
          goto LABEL_29;
      }
      else if (v21)
      {
        goto LABEL_29;
      }
    }
    v7 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
      continue;
    break;
  }
LABEL_30:
  self = v22;
LABEL_31:

  if (v7)
LABEL_32:
    -[MPMusicPlayerControllerMutableQueue _removeItemWithIdentifier:](self, "_removeItemWithIdentifier:", v7);
LABEL_33:

}

- (void)_removeItemWithIdentifier:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_removedItems, "addObject:");
}

- (MPMusicPlayerControllerApplicationQueueModifications)modifications
{
  MPMusicPlayerControllerApplicationQueueModifications *v3;
  void *v4;
  void *v5;
  MPMusicPlayerControllerApplicationQueueModifications *v6;

  v3 = [MPMusicPlayerControllerApplicationQueueModifications alloc];
  v4 = (void *)-[NSMutableDictionary copy](self->_insertedDescriptors, "copy");
  v5 = (void *)-[NSMutableArray copy](self->_removedItems, "copy");
  v6 = -[MPMusicPlayerControllerApplicationQueueModifications initWithInsertedDescriptors:removedItemIdentifiers:](v3, "initWithInsertedDescriptors:removedItemIdentifiers:", v4, v5);

  return v6;
}

- (NSMutableDictionary)insertedDescriptors
{
  return self->_insertedDescriptors;
}

- (void)setInsertedDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_insertedDescriptors, a3);
}

- (NSMutableArray)removedItems
{
  return self->_removedItems;
}

- (void)setRemovedItems:(id)a3
{
  objc_storeStrong((id *)&self->_removedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_insertedDescriptors, 0);
}

@end
