@implementation MRCompositeMessage

- (MRCompositeMessage)init
{
  MRCompositeMessage *v2;
  NSMutableArray *v3;
  NSMutableArray *messages;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRCompositeMessage;
  v2 = -[MRProtocolMessage init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    messages = v2->_messages;
    v2->_messages = v3;

  }
  return v2;
}

- (void)addMessage:(id)a3
{
  id v4;
  MRCompositeMessage *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](v5->_messages, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (NSArray)messages
{
  MRCompositeMessage *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_messages, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)transportOptions
{
  MRCompositeMessage *v2;
  MRProtocolMessageOptions *transportOptions;
  MRProtocolMessageOptions *v4;
  NSMutableArray *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  MRCompositeMessage *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  transportOptions = v2->_transportOptions;
  obj = v2;
  if (transportOptions)
  {
    v4 = transportOptions;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v2->_messages;
    v6 = 0;
    v7 = 0;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "transportOptions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "priority") < 1)
          {
            v14 = 3;
          }
          else
          {
            objc_msgSend(v11, "transportOptions");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "priority");

          }
          if (v14 > v7)
            v7 = v14;
          objc_msgSend(v11, "transportOptions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isWaking");

          v6 |= v16;
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    if ((v7 > 0) | v6 & 1)
    {
      v4 = objc_alloc_init(MRProtocolMessageOptions);
      -[MRProtocolMessageOptions setPriority:](v4, "setPriority:", v7);
      -[MRProtocolMessageOptions setWaking:](v4, "setWaking:", v6 & 1);
    }
    else
    {
      v4 = 0;
    }
  }
  objc_sync_exit(obj);

  return v4;
}

- (void)setTransportOptions:(id)a3
{
  MRProtocolMessageOptions *v4;
  MRProtocolMessageOptions *transportOptions;
  MRCompositeMessage *obj;

  v4 = (MRProtocolMessageOptions *)a3;
  obj = self;
  objc_sync_enter(obj);
  transportOptions = obj->_transportOptions;
  obj->_transportOptions = v4;

  objc_sync_exit(obj);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@, Messages:\n"), objc_opt_class());
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_messages;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\n"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "mr_map:", &__block_literal_global_70);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

uint64_t __33__MRCompositeMessage_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("\t"), "stringByAppendingString:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

@end
