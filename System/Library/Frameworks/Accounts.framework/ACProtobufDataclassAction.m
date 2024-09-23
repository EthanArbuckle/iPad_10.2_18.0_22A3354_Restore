@implementation ACProtobufDataclassAction

- (void)clearAffectedContainers
{
  -[NSMutableArray removeAllObjects](self->_affectedContainers, "removeAllObjects");
}

- (void)addAffectedContainers:(id)a3
{
  id v4;
  NSMutableArray *affectedContainers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  affectedContainers = self->_affectedContainers;
  v8 = v4;
  if (!affectedContainers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_affectedContainers;
    self->_affectedContainers = v6;

    v4 = v8;
    affectedContainers = self->_affectedContainers;
  }
  -[NSMutableArray addObject:](affectedContainers, "addObject:", v4);

}

- (unint64_t)affectedContainersCount
{
  return -[NSMutableArray count](self->_affectedContainers, "count");
}

- (id)affectedContainersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_affectedContainers, "objectAtIndex:", a3);
}

+ (Class)affectedContainersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUndoAlertTitle
{
  return self->_undoAlertTitle != 0;
}

- (BOOL)hasUndoAlertMessage
{
  return self->_undoAlertMessage != 0;
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
  v8.super_class = (Class)ACProtobufDataclassAction;
  -[ACProtobufDataclassAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACProtobufDataclassAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *affectedContainers;
  NSString *undoAlertTitle;
  NSString *undoAlertMessage;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_destructive);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("destructive"));

  affectedContainers = self->_affectedContainers;
  if (affectedContainers)
    objc_msgSend(v3, "setObject:forKey:", affectedContainers, CFSTR("affectedContainers"));
  undoAlertTitle = self->_undoAlertTitle;
  if (undoAlertTitle)
    objc_msgSend(v3, "setObject:forKey:", undoAlertTitle, CFSTR("undoAlertTitle"));
  undoAlertMessage = self->_undoAlertMessage;
  if (undoAlertMessage)
    objc_msgSend(v3, "setObject:forKey:", undoAlertMessage, CFSTR("undoAlertMessage"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufDataclassActionReadFrom((uint64_t)self, (uint64_t)a3);
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
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_affectedContainers;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_undoAlertTitle)
    PBDataWriterWriteStringField();
  if (self->_undoAlertMessage)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v4[4] = self->_type;
  v10 = v4;
  *((_BYTE *)v4 + 40) = self->_destructive;
  if (-[ACProtobufDataclassAction affectedContainersCount](self, "affectedContainersCount"))
  {
    objc_msgSend(v10, "clearAffectedContainers");
    v5 = -[ACProtobufDataclassAction affectedContainersCount](self, "affectedContainersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ACProtobufDataclassAction affectedContainersAtIndex:](self, "affectedContainersAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAffectedContainers:", v8);

      }
    }
  }
  if (self->_undoAlertTitle)
    objc_msgSend(v10, "setUndoAlertTitle:");
  v9 = v10;
  if (self->_undoAlertMessage)
  {
    objc_msgSend(v10, "setUndoAlertMessage:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_type;
  *(_BYTE *)(v5 + 40) = self->_destructive;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_affectedContainers;
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
        objc_msgSend((id)v5, "addAffectedContainers:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_undoAlertTitle, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_undoAlertMessage, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *affectedContainers;
  NSString *undoAlertTitle;
  NSString *undoAlertMessage;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_type != *((_DWORD *)v4 + 4))
    goto LABEL_13;
  if (self->_destructive)
  {
    if (!*((_BYTE *)v4 + 40))
      goto LABEL_13;
  }
  else if (*((_BYTE *)v4 + 40))
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  affectedContainers = self->_affectedContainers;
  if ((unint64_t)affectedContainers | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](affectedContainers, "isEqual:"))
  {
    goto LABEL_13;
  }
  undoAlertTitle = self->_undoAlertTitle;
  if ((unint64_t)undoAlertTitle | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](undoAlertTitle, "isEqual:"))
      goto LABEL_13;
  }
  undoAlertMessage = self->_undoAlertMessage;
  if ((unint64_t)undoAlertMessage | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](undoAlertMessage, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = 2654435761 * self->_type;
  v4 = 2654435761 * self->_destructive;
  v5 = v4 ^ -[NSMutableArray hash](self->_affectedContainers, "hash") ^ v3;
  v6 = -[NSString hash](self->_undoAlertTitle, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_undoAlertMessage, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
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
  v4 = a3;
  self->_type = *((_DWORD *)v4 + 4);
  self->_destructive = *((_BYTE *)v4 + 40);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 1);
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
        -[ACProtobufDataclassAction addAffectedContainers:](self, "addAffectedContainers:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 4))
    -[ACProtobufDataclassAction setUndoAlertTitle:](self, "setUndoAlertTitle:");
  if (*((_QWORD *)v4 + 3))
    -[ACProtobufDataclassAction setUndoAlertMessage:](self, "setUndoAlertMessage:");

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (NSMutableArray)affectedContainers
{
  return self->_affectedContainers;
}

- (void)setAffectedContainers:(id)a3
{
  objc_storeStrong((id *)&self->_affectedContainers, a3);
}

- (NSString)undoAlertTitle
{
  return self->_undoAlertTitle;
}

- (void)setUndoAlertTitle:(id)a3
{
  objc_storeStrong((id *)&self->_undoAlertTitle, a3);
}

- (NSString)undoAlertMessage
{
  return self->_undoAlertMessage;
}

- (void)setUndoAlertMessage:(id)a3
{
  objc_storeStrong((id *)&self->_undoAlertMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoAlertTitle, 0);
  objc_storeStrong((id *)&self->_undoAlertMessage, 0);
  objc_storeStrong((id *)&self->_affectedContainers, 0);
}

@end
