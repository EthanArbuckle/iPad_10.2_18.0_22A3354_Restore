@implementation TrackedMessageListItems

- (TrackedMessageListItems)init
{
  TrackedMessageListItems *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *trackedItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TrackedMessageListItems;
  v2 = -[TrackedMessageListItems init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedItems = v2->_trackedItems;
    v2->_trackedItems = v3;

  }
  return v2;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_trackedItems, "count");
}

- (NSArray)itemIDs
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_trackedItems, "allKeys");
}

- (NSSet)itemIDsSet
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_trackedItems, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSArray)messageListItems
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_trackedItems, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_filter:", *MEMORY[0x1E0D1ED88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)hasMessageListItemForItemID:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedItems, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)trackmessageListItem:(id)a3
{
  NSMutableDictionary *trackedItems;
  id v4;
  id v5;

  trackedItems = self->_trackedItems;
  v4 = a3;
  objc_msgSend(v4, "itemID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](trackedItems, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)trackMessageListItemWithItemID:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E38];
  v5 = a3;
  objc_msgSend(v4, "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedItems, "setObject:forKeyedSubscript:", v6, v5);

}

- (void)updateMessageListItem:(id)a3
{
  id v4;
  NSMutableDictionary *trackedItems;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  trackedItems = self->_trackedItems;
  v10 = v4;
  objc_msgSend(v4, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](trackedItems, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_trackedItems;
    objc_msgSend(v10, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (void)untrackMessageListItemWithItemID:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedItems, "setObject:forKeyedSubscript:", 0, a3);
}

- (void)untrackMessageListItemsWithItemIDs:(id)a3
{
  -[NSMutableDictionary removeObjectsForKeys:](self->_trackedItems, "removeObjectsForKeys:", a3);
}

- (void)untrackAllMessageListItems
{
  -[NSMutableDictionary removeAllObjects](self->_trackedItems, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedItems, 0);
}

@end
