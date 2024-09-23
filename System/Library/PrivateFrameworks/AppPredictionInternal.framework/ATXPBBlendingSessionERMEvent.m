@implementation ATXPBBlendingSessionERMEvent

- (BOOL)hasExecutableId
{
  return self->_executableId != 0;
}

- (int)engagementType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_engagementType;
  else
    return 0;
}

- (void)setEngagementType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEngagementType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E82E7548[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Engaged")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rejected")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotShown")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InferredEngagement")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("InferredRejected")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (void)clearBlendingUpdateUUIDs
{
  -[NSMutableArray removeAllObjects](self->_blendingUpdateUUIDs, "removeAllObjects");
}

- (void)addBlendingUpdateUUID:(id)a3
{
  id v4;
  NSMutableArray *blendingUpdateUUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  blendingUpdateUUIDs = self->_blendingUpdateUUIDs;
  v8 = v4;
  if (!blendingUpdateUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_blendingUpdateUUIDs;
    self->_blendingUpdateUUIDs = v6;

    v4 = v8;
    blendingUpdateUUIDs = self->_blendingUpdateUUIDs;
  }
  -[NSMutableArray addObject:](blendingUpdateUUIDs, "addObject:", v4);

}

- (unint64_t)blendingUpdateUUIDsCount
{
  return -[NSMutableArray count](self->_blendingUpdateUUIDs, "count");
}

- (id)blendingUpdateUUIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_blendingUpdateUUIDs, "objectAtIndex:", a3);
}

+ (Class)blendingUpdateUUIDType
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
  v8.super_class = (Class)ATXPBBlendingSessionERMEvent;
  -[ATXPBBlendingSessionERMEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingSessionERMEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *executableId;
  uint64_t engagementType;
  __CFString *v7;
  NSString *consumerSubType;
  NSMutableArray *blendingUpdateUUIDs;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  executableId = self->_executableId;
  if (executableId)
    objc_msgSend(v3, "setObject:forKey:", executableId, CFSTR("executableId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    engagementType = self->_engagementType;
    if (engagementType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_engagementType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E82E7548[engagementType];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("engagementType"));

  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v4, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  blendingUpdateUUIDs = self->_blendingUpdateUUIDs;
  if (blendingUpdateUUIDs)
    objc_msgSend(v4, "setObject:forKey:", blendingUpdateUUIDs, CFSTR("blendingUpdateUUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionERMEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_executableId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_consumerSubType)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_blendingUpdateUUIDs;
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

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_executableId)
  {
    objc_msgSend(v4, "setExecutableId:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_engagementType;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_consumerSubType)
    objc_msgSend(v9, "setConsumerSubType:");
  if (-[ATXPBBlendingSessionERMEvent blendingUpdateUUIDsCount](self, "blendingUpdateUUIDsCount"))
  {
    objc_msgSend(v9, "clearBlendingUpdateUUIDs");
    v5 = -[ATXPBBlendingSessionERMEvent blendingUpdateUUIDsCount](self, "blendingUpdateUUIDsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXPBBlendingSessionERMEvent blendingUpdateUUIDAtIndex:](self, "blendingUpdateUUIDAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addBlendingUpdateUUID:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  v6 = -[NSString copyWithZone:](self->_executableId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_engagementType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_blendingUpdateUUIDs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addBlendingUpdateUUID:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *executableId;
  NSString *consumerSubType;
  NSMutableArray *blendingUpdateUUIDs;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  executableId = self->_executableId;
  if ((unint64_t)executableId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](executableId, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_engagementType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_13;
  }
  blendingUpdateUUIDs = self->_blendingUpdateUUIDs;
  if ((unint64_t)blendingUpdateUUIDs | *((_QWORD *)v4 + 1))
    v8 = -[NSMutableArray isEqual:](blendingUpdateUUIDs, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_executableId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_engagementType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_consumerSubType, "hash");
  return v5 ^ v6 ^ -[NSMutableArray hash](self->_blendingUpdateUUIDs, "hash");
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
  if (*((_QWORD *)v4 + 4))
    -[ATXPBBlendingSessionERMEvent setExecutableId:](self, "setExecutableId:");
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_engagementType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[ATXPBBlendingSessionERMEvent setConsumerSubType:](self, "setConsumerSubType:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        -[ATXPBBlendingSessionERMEvent addBlendingUpdateUUID:](self, "addBlendingUpdateUUID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)executableId
{
  return self->_executableId;
}

- (void)setExecutableId:(id)a3
{
  objc_storeStrong((id *)&self->_executableId, a3);
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (NSMutableArray)blendingUpdateUUIDs
{
  return self->_blendingUpdateUUIDs;
}

- (void)setBlendingUpdateUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_blendingUpdateUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableId, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_blendingUpdateUUIDs, 0);
}

@end
