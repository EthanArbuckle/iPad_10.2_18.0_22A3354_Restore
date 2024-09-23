@implementation SGSuggestionsWorkGroupManagerGuardedData

- (SGSuggestionsWorkGroupManagerGuardedData)init
{
  SGSuggestionsWorkGroupManagerGuardedData *v2;
  uint64_t v3;
  NSMapTable *groupLookup;
  uint64_t v5;
  NSMutableArray *uniqueIds;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGSuggestionsWorkGroupManagerGuardedData;
  v2 = -[SGSuggestionsWorkGroupManagerGuardedData init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    groupLookup = v2->_groupLookup;
    v2->_groupLookup = (NSMapTable *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 64);
    uniqueIds = v2->_uniqueIds;
    v2->_uniqueIds = (NSMutableArray *)v5;

  }
  return v2;
}

- (id)groupForUniqueId:(id)a3
{
  return -[NSMapTable objectForKey:](self->_groupLookup, "objectForKey:", a3);
}

- (id)createGroupForUniqueId:(id)a3
{
  id v4;
  dispatch_group_t v5;

  v4 = a3;
  v5 = dispatch_group_create();
  -[NSMapTable setObject:forKey:](self->_groupLookup, "setObject:forKey:", v5, v4);

  return v5;
}

- (void)enterGroupForUniqueId:(id)a3
{
  NSObject *v3;
  NSObject *v4;

  -[NSMapTable objectForKey:](self->_groupLookup, "objectForKey:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    dispatch_group_enter(v3);
    v3 = v4;
  }

}

- (void)leaveGroupForUniqueId:(id)a3
{
  NSObject *v3;
  NSObject *v4;

  -[NSMapTable objectForKey:](self->_groupLookup, "objectForKey:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    dispatch_group_leave(v3);
    v3 = v4;
  }

}

- (BOOL)isProcessedUniqueId:(id)a3
{
  return -[NSMutableArray containsObject:](self->_uniqueIds, "containsObject:", a3);
}

- (void)addToProcessedIds:(id)a3
{
  id v4;

  v4 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_uniqueIds, "count") >= 0x40
    && (-[NSMutableArray containsObject:](self->_uniqueIds, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_uniqueIds, "removeObjectAtIndex:", 0);
  }
  -[NSMutableArray addObject:](self->_uniqueIds, "addObject:", v4);

}

- (void)removeGroupFromProcessedIds:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_groupLookup, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIds, 0);
  objc_storeStrong((id *)&self->_groupLookup, 0);
}

@end
