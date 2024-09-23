@implementation ATXAnchorModelPBActionMetadata

- (int)actionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_actionType;
  else
    return 0;
}

- (void)setActionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E82EBE38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_ACTION_TYPE_OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_ACTION_TYPE_INTENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_ACTION_TYPE_NSUA")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAppLaunchMetadata
{
  return self->_appLaunchMetadata != 0;
}

- (BOOL)hasActionKeyMetadata
{
  return self->_actionKeyMetadata != 0;
}

- (void)clearActionUUIDMetadatas
{
  -[NSMutableArray removeAllObjects](self->_actionUUIDMetadatas, "removeAllObjects");
}

- (void)addActionUUIDMetadata:(id)a3
{
  id v4;
  NSMutableArray *actionUUIDMetadatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  actionUUIDMetadatas = self->_actionUUIDMetadatas;
  v8 = v4;
  if (!actionUUIDMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_actionUUIDMetadatas;
    self->_actionUUIDMetadatas = v6;

    v4 = v8;
    actionUUIDMetadatas = self->_actionUUIDMetadatas;
  }
  -[NSMutableArray addObject:](actionUUIDMetadatas, "addObject:", v4);

}

- (unint64_t)actionUUIDMetadatasCount
{
  return -[NSMutableArray count](self->_actionUUIDMetadatas, "count");
}

- (id)actionUUIDMetadataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_actionUUIDMetadatas, "objectAtIndex:", a3);
}

+ (Class)actionUUIDMetadataType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)ATXAnchorModelPBActionMetadata;
  -[ATXAnchorModelPBActionMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPBActionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t actionType;
  __CFString *v5;
  ATXAnchorModelPBAppLaunchMetadata *appLaunchMetadata;
  void *v7;
  ATXAnchorModelPBActionKeyMetadata *actionKeyMetadata;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    actionType = self->_actionType;
    if (actionType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_actionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E82EBE38[actionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("actionType"));

  }
  appLaunchMetadata = self->_appLaunchMetadata;
  if (appLaunchMetadata)
  {
    -[ATXAnchorModelPBAppLaunchMetadata dictionaryRepresentation](appLaunchMetadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("appLaunchMetadata"));

  }
  actionKeyMetadata = self->_actionKeyMetadata;
  if (actionKeyMetadata)
  {
    -[ATXAnchorModelPBActionKeyMetadata dictionaryRepresentation](actionKeyMetadata, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("actionKeyMetadata"));

  }
  if (-[NSMutableArray count](self->_actionUUIDMetadatas, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_actionUUIDMetadatas, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_actionUUIDMetadatas;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("actionUUIDMetadata"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBActionMetadataReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_appLaunchMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_actionKeyMetadata)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_actionUUIDMetadatas;
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

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_actionType;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v9 = v4;
  if (self->_appLaunchMetadata)
    objc_msgSend(v4, "setAppLaunchMetadata:");
  if (self->_actionKeyMetadata)
    objc_msgSend(v9, "setActionKeyMetadata:");
  if (-[ATXAnchorModelPBActionMetadata actionUUIDMetadatasCount](self, "actionUUIDMetadatasCount"))
  {
    objc_msgSend(v9, "clearActionUUIDMetadatas");
    v5 = -[ATXAnchorModelPBActionMetadata actionUUIDMetadatasCount](self, "actionUUIDMetadatasCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXAnchorModelPBActionMetadata actionUUIDMetadataAtIndex:](self, "actionUUIDMetadataAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addActionUUIDMetadata:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_actionType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[ATXAnchorModelPBAppLaunchMetadata copyWithZone:](self->_appLaunchMetadata, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[ATXAnchorModelPBActionKeyMetadata copyWithZone:](self->_actionKeyMetadata, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_actionUUIDMetadatas;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addActionUUIDMetadata:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXAnchorModelPBAppLaunchMetadata *appLaunchMetadata;
  ATXAnchorModelPBActionKeyMetadata *actionKeyMetadata;
  NSMutableArray *actionUUIDMetadatas;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_actionType != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  appLaunchMetadata = self->_appLaunchMetadata;
  if ((unint64_t)appLaunchMetadata | *((_QWORD *)v4 + 4)
    && !-[ATXAnchorModelPBAppLaunchMetadata isEqual:](appLaunchMetadata, "isEqual:"))
  {
    goto LABEL_13;
  }
  actionKeyMetadata = self->_actionKeyMetadata;
  if ((unint64_t)actionKeyMetadata | *((_QWORD *)v4 + 1))
  {
    if (!-[ATXAnchorModelPBActionKeyMetadata isEqual:](actionKeyMetadata, "isEqual:"))
      goto LABEL_13;
  }
  actionUUIDMetadatas = self->_actionUUIDMetadatas;
  if ((unint64_t)actionUUIDMetadatas | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](actionUUIDMetadatas, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_actionType;
  else
    v3 = 0;
  v4 = -[ATXAnchorModelPBAppLaunchMetadata hash](self->_appLaunchMetadata, "hash") ^ v3;
  v5 = -[ATXAnchorModelPBActionKeyMetadata hash](self->_actionKeyMetadata, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_actionUUIDMetadatas, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  ATXAnchorModelPBAppLaunchMetadata *appLaunchMetadata;
  uint64_t v7;
  ATXAnchorModelPBActionKeyMetadata *actionKeyMetadata;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[10] & 1) != 0)
  {
    self->_actionType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  appLaunchMetadata = self->_appLaunchMetadata;
  v7 = *((_QWORD *)v5 + 4);
  if (appLaunchMetadata)
  {
    if (v7)
      -[ATXAnchorModelPBAppLaunchMetadata mergeFrom:](appLaunchMetadata, "mergeFrom:");
  }
  else if (v7)
  {
    -[ATXAnchorModelPBActionMetadata setAppLaunchMetadata:](self, "setAppLaunchMetadata:");
  }
  actionKeyMetadata = self->_actionKeyMetadata;
  v9 = *((_QWORD *)v5 + 1);
  if (actionKeyMetadata)
  {
    if (v9)
      -[ATXAnchorModelPBActionKeyMetadata mergeFrom:](actionKeyMetadata, "mergeFrom:");
  }
  else if (v9)
  {
    -[ATXAnchorModelPBActionMetadata setActionKeyMetadata:](self, "setActionKeyMetadata:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v5 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[ATXAnchorModelPBActionMetadata addActionUUIDMetadata:](self, "addActionUUIDMetadata:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (ATXAnchorModelPBAppLaunchMetadata)appLaunchMetadata
{
  return self->_appLaunchMetadata;
}

- (void)setAppLaunchMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunchMetadata, a3);
}

- (ATXAnchorModelPBActionKeyMetadata)actionKeyMetadata
{
  return self->_actionKeyMetadata;
}

- (void)setActionKeyMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_actionKeyMetadata, a3);
}

- (NSMutableArray)actionUUIDMetadatas
{
  return self->_actionUUIDMetadatas;
}

- (void)setActionUUIDMetadatas:(id)a3
{
  objc_storeStrong((id *)&self->_actionUUIDMetadatas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchMetadata, 0);
  objc_storeStrong((id *)&self->_actionUUIDMetadatas, 0);
  objc_storeStrong((id *)&self->_actionKeyMetadata, 0);
}

@end
