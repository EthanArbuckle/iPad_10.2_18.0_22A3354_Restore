@implementation MIDIUMPEndpointManager

- (MIDIUMPEndpointManager)init
{
  MIDIUMPEndpointManager *v2;
  void *v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  MIDIUMPEndpoint *v10;
  MIDIUMPEndpoint *v11;
  NSMutableArray *endpoints;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)MIDIUMPEndpointManager;
  v2 = -[MIDIUMPEndpointManager init](&v19, sel_init);
  if (v2)
  {
    v18 = 0;
    if (!UMPCIGlobalState((MIDIServer *)&v18))
    {
      objc_msgSend(v18, "objectForKey:", CFSTR("ump_endpoints"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v15;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v15 != v7)
              objc_enumerationMutation(v5);
            v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v8);
            v10 = [MIDIUMPEndpoint alloc];
            v11 = -[MIDIUMPEndpoint initWithDescription:](v10, "initWithDescription:", v9, (_QWORD)v14);
            -[NSMutableArray addObject:](v4, "addObject:", v11);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        }
        while (v6);
      }

      endpoints = v2->_endpoints;
      v2->_endpoints = v4;

    }
  }
  return v2;
}

- (NSArray)UMPEndpoints
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_endpoints, "copy");
}

- (BOOL)postNotificationName:(id)a3 endpoint:(id)a4 functionBlock:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  if (v9 | v10)
  {
    v11 = (void *)objc_opt_new();
    v12 = v11;
    if (v9)
      objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("MIDIUMPEndpointObjectKey"));
    if (v10)
      objc_msgSend(v12, "setValue:forKey:", v10, CFSTR("MIDIUMPFunctionBlockObjectKey"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", v8, self, v12);

  }
  return (v9 | v10) != 0;
}

- (id)findFunctionBlock:(unsigned int)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
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
  v4 = self->_functionBlocks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "objectRef", (_QWORD)v11) == a3)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)addFunctionBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MIDIUMPEndpointManager findFunctionBlock:](self, "findFunctionBlock:", objc_msgSend(v5, "objectRef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[NSMutableArray addObject:](self->_functionBlocks, "addObject:", v5);

}

- (BOOL)removeFunctionBlock:(unsigned int)a3
{
  void *v4;

  -[MIDIUMPEndpointManager findFunctionBlock:](self, "findFunctionBlock:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray removeObject:](self->_functionBlocks, "removeObject:", v4);

  return v4 != 0;
}

- (void)updateFunctionBlock:(unsigned int)a3 description:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a3;
  v9 = a4;
  -[MIDIUMPEndpointManager findFunctionBlock:](self, "findFunctionBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "deserialize:", v9))
  {
    objc_msgSend(v7, "UMPEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIDIUMPEndpointManager postNotificationName:endpoint:functionBlock:](self, "postNotificationName:endpoint:functionBlock:", CFSTR("MIDIUMPFunctionBlockWasUpdatedNotification"), v8, v7);

  }
}

- (id)findEndpoint:(unsigned int)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
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
  v4 = self->_endpoints;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "objectRef", (_QWORD)v11) == a3)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)addEndpoint:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MIDIUMPEndpointManager findEndpoint:](self, "findEndpoint:", objc_msgSend(v5, "objectRef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[NSMutableArray addObject:](self->_endpoints, "addObject:", v5);
    -[MIDIUMPEndpointManager postNotificationName:endpoint:functionBlock:](self, "postNotificationName:endpoint:functionBlock:", CFSTR("MIDIUMPEndpointWasAddedNotification"), v5, 0);
  }

}

- (BOOL)removeEndpoint:(unsigned int)a3
{
  void *v4;

  -[MIDIUMPEndpointManager findEndpoint:](self, "findEndpoint:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableArray removeObject:](self->_endpoints, "removeObject:", v4);
    -[MIDIUMPEndpointManager postNotificationName:endpoint:functionBlock:](self, "postNotificationName:endpoint:functionBlock:", CFSTR("MIDIUMPEndpointWasRemovedNotification"), v4, 0);
  }

  return v4 != 0;
}

- (void)updateEndpoint:(unsigned int)a3 description:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  -[MIDIUMPEndpointManager findEndpoint:](self, "findEndpoint:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "deserialize:", v8))
    -[MIDIUMPEndpointManager postNotificationName:endpoint:functionBlock:](self, "postNotificationName:endpoint:functionBlock:", CFSTR("MIDIUMPEndpointWasUpdatedNotification"), v7, 0);

}

- (NSMutableArray)functionBlocks
{
  return self->_functionBlocks;
}

- (void)setFunctionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_functionBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_functionBlocks, 0);
}

+ (id)description
{
  return CFSTR("MIDI UMP Endpoint Pair Manager");
}

+ (MIDIUMPEndpointManager)sharedInstance
{
  if (+[MIDIUMPEndpointManager sharedInstance]::onceToken != -1)
    dispatch_once(&+[MIDIUMPEndpointManager sharedInstance]::onceToken, &__block_literal_global_851);
  return (MIDIUMPEndpointManager *)(id)+[MIDIUMPEndpointManager sharedInstance]::theInstance;
}

void __40__MIDIUMPEndpointManager_sharedInstance__block_invoke(UMPCIClients *a1)
{
  MIDIUMPEndpointManager *v1;
  void *v2;

  UMPCIClients::instance(a1);
  v1 = objc_alloc_init(MIDIUMPEndpointManager);
  v2 = (void *)+[MIDIUMPEndpointManager sharedInstance]::theInstance;
  +[MIDIUMPEndpointManager sharedInstance]::theInstance = (uint64_t)v1;

}

@end
