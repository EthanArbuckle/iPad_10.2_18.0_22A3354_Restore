@implementation ASKResourceCache

- (BOOL)isGroupMember
{
  void *v2;
  char v3;

  -[ASKResourceCache group](self, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMultipleMembers");

  return v3;
}

- (id)resourcesForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ASKResourceCache group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMultipleMembers");

  if (v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[ASKResourceCache group](self, "group", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshotMemberContents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "objectForKey:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            if (v11)
              objc_msgSend(v11, "addObjectsFromArray:", v14);
            else
              v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v14);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    -[ASKResourceCache group](self, "group");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "onlyMemberContents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKey:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (_ASKResourceCacheGroup)group
{
  return self->_group;
}

- (void)addResource:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[ASKResourceCache contents](self, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    -[ASKResourceCache contents](self, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

  }
  objc_msgSend(v8, "addObject:", v10);

}

- (NSCache)contents
{
  return self->_contents;
}

- (void)setLimit:(unint64_t)a3
{
  id v4;

  -[ASKResourceCache contents](self, "contents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCountLimit:", a3);

}

- (void)setEvictsObjectsWhenApplicationEntersBackground:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASKResourceCache contents](self, "contents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEvictsObjectsWhenApplicationEntersBackground:", v3);

}

- (ASKResourceCache)init
{
  return -[ASKResourceCache initWithGroupOfCache:](self, "initWithGroupOfCache:", 0);
}

- (ASKResourceCache)initWithGroupOfCache:(id)a3
{
  id v4;
  ASKResourceCache *v5;
  _ASKResourceCacheGroup *v6;
  _ASKResourceCacheGroup *group;
  uint64_t v8;
  NSCache *contents;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASKResourceCache;
  v5 = -[ASKResourceCache init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "group");
      v6 = (_ASKResourceCacheGroup *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_alloc_init(_ASKResourceCacheGroup);
    }
    group = v5->_group;
    v5->_group = v6;

    -[_ASKResourceCacheGroup makeMemberContents](v5->_group, "makeMemberContents");
    v8 = objc_claimAutoreleasedReturnValue();
    contents = v5->_contents;
    v5->_contents = (NSCache *)v8;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ASKResourceCache group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKResourceCache contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discardMemberContents:", v4);

  v5.receiver = self;
  v5.super_class = (Class)ASKResourceCache;
  -[ASKResourceCache dealloc](&v5, sel_dealloc);
}

- (unint64_t)limit
{
  void *v2;
  unint64_t v3;

  -[ASKResourceCache contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countLimit");

  return v3;
}

- (BOOL)evictsObjectsWhenApplicationEntersBackground
{
  void *v2;
  char v3;

  -[ASKResourceCache contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "evictsObjectsWhenApplicationEntersBackground");

  return v3;
}

- (void)replaceResourcesForKey:(id)a3 withResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[ASKResourceCache contents](self, "contents");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v6, 0);

  objc_msgSend(v9, "setObject:forKey:", v8, v7);
}

- (void)removeAllResources
{
  id v2;

  -[ASKResourceCache contents](self, "contents");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
