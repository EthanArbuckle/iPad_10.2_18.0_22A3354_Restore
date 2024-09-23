@implementation VSAppChannelsFilter

- (VSAppChannelsFilter)init
{
  VSAppChannelsFilter *v2;
  NSSet *v3;
  NSSet *personalChannelIDs;
  NSArray *allChannelMappings;
  NSSet *v6;
  NSSet *genericAppAdamIDs;
  NSSet *v8;
  NSSet *personalAppAdamIDs;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSAppChannelsFilter;
  v2 = -[VSAppChannelsFilter init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    personalChannelIDs = v2->_personalChannelIDs;
    v2->_personalChannelIDs = v3;

    allChannelMappings = v2->_allChannelMappings;
    v2->_allChannelMappings = (NSArray *)MEMORY[0x1E0C9AA60];

    v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    genericAppAdamIDs = v2->_genericAppAdamIDs;
    v2->_genericAppAdamIDs = v6;

    v8 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    personalAppAdamIDs = v2->_personalAppAdamIDs;
    v2->_personalAppAdamIDs = v8;

  }
  return v2;
}

- (void)_updateAdamIDs
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[VSAppChannelsFilter allChannelMappings](self, "allChannelMappings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "appAdamID", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);
        -[VSAppChannelsFilter personalChannelIDs](self, "personalChannelIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v11 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v8, "channelIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setWithArray:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "intersectsSet:", v13))
            objc_msgSend(v16, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  v14 = v16;
  if (objc_msgSend(v16, "count"))
  {
    v15 = v16;

    v3 = v15;
  }
  -[VSAppChannelsFilter setPersonalAppAdamIDs:](self, "setPersonalAppAdamIDs:", v16, v16);
  -[VSAppChannelsFilter setGenericAppAdamIDs:](self, "setGenericAppAdamIDs:", v3);

}

- (void)setPersonalChannelIDs:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  NSSet *personalChannelIDs;
  NSSet *v7;

  v4 = (NSSet *)a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The personalChannelIDs parameter must not be nil."));
    v4 = 0;
  }
  if (self->_personalChannelIDs != v4)
  {
    v5 = (NSSet *)-[NSSet copy](v7, "copy");
    personalChannelIDs = self->_personalChannelIDs;
    self->_personalChannelIDs = v5;

    -[VSAppChannelsFilter _updateAdamIDs](self, "_updateAdamIDs");
    v4 = v7;
  }

}

- (void)setAllChannelMappings:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *allChannelMappings;
  NSArray *v7;

  v4 = (NSArray *)a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The allChannelMappings parameter must not be nil."));
    v4 = 0;
  }
  if (self->_allChannelMappings != v4)
  {
    v5 = (NSArray *)-[NSArray copy](v7, "copy");
    allChannelMappings = self->_allChannelMappings;
    self->_allChannelMappings = v5;

    -[VSAppChannelsFilter _updateAdamIDs](self, "_updateAdamIDs");
    v4 = v7;
  }

}

- (NSArray)personalAppDescriptions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VSAppChannelsFilter personalChannelIDs](self, "personalChannelIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[VSAppChannelsFilter appsByChannelID](self, "appsByChannelID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v3, "addObjectsFromArray:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSSet)personalChannelIDs
{
  return self->_personalChannelIDs;
}

- (NSArray)allChannelMappings
{
  return self->_allChannelMappings;
}

- (NSSet)personalAppAdamIDs
{
  return self->_personalAppAdamIDs;
}

- (void)setPersonalAppAdamIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)genericAppAdamIDs
{
  return self->_genericAppAdamIDs;
}

- (void)setGenericAppAdamIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)appsByChannelID
{
  return self->_appsByChannelID;
}

- (void)setAppsByChannelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsByChannelID, 0);
  objc_storeStrong((id *)&self->_genericAppAdamIDs, 0);
  objc_storeStrong((id *)&self->_personalAppAdamIDs, 0);
  objc_storeStrong((id *)&self->_allChannelMappings, 0);
  objc_storeStrong((id *)&self->_personalChannelIDs, 0);
}

@end
