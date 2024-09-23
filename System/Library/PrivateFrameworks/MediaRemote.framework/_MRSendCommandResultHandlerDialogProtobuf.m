@implementation _MRSendCommandResultHandlerDialogProtobuf

- (void)clearActions
{
  -[NSMutableArray removeAllObjects](self->_actions, "removeAllObjects");
}

- (void)addActions:(id)a3
{
  id v4;
  NSMutableArray *actions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  actions = self->_actions;
  v8 = v4;
  if (!actions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_actions;
    self->_actions = v6;

    v4 = v8;
    actions = self->_actions;
  }
  -[NSMutableArray addObject:](actions, "addObject:", v4);

}

- (unint64_t)actionsCount
{
  return -[NSMutableArray count](self->_actions, "count");
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", a3);
}

+ (Class)actionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLocalizedTitle
{
  return self->_localizedTitle != 0;
}

- (BOOL)hasLocalizedMessage
{
  return self->_localizedMessage != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRSendCommandResultHandlerDialogProtobuf;
  -[_MRSendCommandResultHandlerDialogProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultHandlerDialogProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSString *localizedTitle;
  NSString *localizedMessage;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_actions, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_actions, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_actions;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("actions"));
  }
  localizedTitle = self->_localizedTitle;
  if (localizedTitle)
    objc_msgSend(v3, "setObject:forKey:", localizedTitle, CFSTR("localizedTitle"));
  localizedMessage = self->_localizedMessage;
  if (localizedMessage)
    objc_msgSend(v3, "setObject:forKey:", localizedMessage, CFSTR("localizedMessage"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultHandlerDialogProtobufReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_actions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_localizedTitle)
    PBDataWriterWriteStringField();
  if (self->_localizedMessage)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[_MRSendCommandResultHandlerDialogProtobuf actionsCount](self, "actionsCount"))
  {
    objc_msgSend(v9, "clearActions");
    v4 = -[_MRSendCommandResultHandlerDialogProtobuf actionsCount](self, "actionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_MRSendCommandResultHandlerDialogProtobuf actionsAtIndex:](self, "actionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addActions:", v7);

      }
    }
  }
  if (self->_localizedTitle)
    objc_msgSend(v9, "setLocalizedTitle:");
  v8 = v9;
  if (self->_localizedMessage)
  {
    objc_msgSend(v9, "setLocalizedMessage:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_actions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addActions:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSString copyWithZone:](self->_localizedMessage, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *actions;
  NSString *localizedTitle;
  NSString *localizedMessage;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((actions = self->_actions, !((unint64_t)actions | v4[1]))
     || -[NSMutableArray isEqual:](actions, "isEqual:"))
    && ((localizedTitle = self->_localizedTitle, !((unint64_t)localizedTitle | v4[3]))
     || -[NSString isEqual:](localizedTitle, "isEqual:")))
  {
    localizedMessage = self->_localizedMessage;
    if ((unint64_t)localizedMessage | v4[2])
      v8 = -[NSString isEqual:](localizedMessage, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSMutableArray hash](self->_actions, "hash");
  v4 = -[NSString hash](self->_localizedTitle, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_localizedMessage, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4[1];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[_MRSendCommandResultHandlerDialogProtobuf addActions:](self, "addActions:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (v4[3])
    -[_MRSendCommandResultHandlerDialogProtobuf setLocalizedTitle:](self, "setLocalizedTitle:");
  if (v4[2])
    -[_MRSendCommandResultHandlerDialogProtobuf setLocalizedMessage:](self, "setLocalizedMessage:");

}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizedMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
