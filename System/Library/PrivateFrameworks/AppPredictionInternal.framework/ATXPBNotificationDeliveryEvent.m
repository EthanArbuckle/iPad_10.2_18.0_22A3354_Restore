@implementation ATXPBNotificationDeliveryEvent

- (int)deliveryUI
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_deliveryUI;
  else
    return 0;
}

- (void)setDeliveryUI:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deliveryUI = a3;
}

- (void)setHasDeliveryUI:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeliveryUI
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)deliveryUIAsString:(int)a3
{
  if (a3 < 8)
    return off_1E82EA208[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeliveryUI:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Digest")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MissedNotificationBundle")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotificationCenter")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Banner")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreen")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PriorityNotification")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearSuggestionUUIDs
{
  -[NSMutableArray removeAllObjects](self->_suggestionUUIDs, "removeAllObjects");
}

- (void)addSuggestionUUID:(id)a3
{
  id v4;
  NSMutableArray *suggestionUUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  suggestionUUIDs = self->_suggestionUUIDs;
  v8 = v4;
  if (!suggestionUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_suggestionUUIDs;
    self->_suggestionUUIDs = v6;

    v4 = v8;
    suggestionUUIDs = self->_suggestionUUIDs;
  }
  -[NSMutableArray addObject:](suggestionUUIDs, "addObject:", v4);

}

- (unint64_t)suggestionUUIDsCount
{
  return -[NSMutableArray count](self->_suggestionUUIDs, "count");
}

- (id)suggestionUUIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestionUUIDs, "objectAtIndex:", a3);
}

+ (Class)suggestionUUIDType
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
  v8.super_class = (Class)ATXPBNotificationDeliveryEvent;
  -[ATXPBNotificationDeliveryEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBNotificationDeliveryEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t deliveryUI;
  __CFString *v5;
  NSMutableArray *suggestionUUIDs;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    deliveryUI = self->_deliveryUI;
    if (deliveryUI >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deliveryUI);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E82EA208[deliveryUI];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("deliveryUI"));

  }
  suggestionUUIDs = self->_suggestionUUIDs;
  if (suggestionUUIDs)
    objc_msgSend(v3, "setObject:forKey:", suggestionUUIDs, CFSTR("suggestionUUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationDeliveryEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_suggestionUUIDs;
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
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_deliveryUI;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  v9 = v4;
  if (-[ATXPBNotificationDeliveryEvent suggestionUUIDsCount](self, "suggestionUUIDsCount"))
  {
    objc_msgSend(v9, "clearSuggestionUUIDs");
    v5 = -[ATXPBNotificationDeliveryEvent suggestionUUIDsCount](self, "suggestionUUIDsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXPBNotificationDeliveryEvent suggestionUUIDAtIndex:](self, "suggestionUUIDAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSuggestionUUID:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_deliveryUI;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_suggestionUUIDs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v6, "addSuggestionUUID:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *suggestionUUIDs;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_deliveryUI != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  suggestionUUIDs = self->_suggestionUUIDs;
  if ((unint64_t)suggestionUUIDs | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](suggestionUUIDs, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_deliveryUI;
  else
    v2 = 0;
  return -[NSMutableArray hash](self->_suggestionUUIDs, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_deliveryUI = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[ATXPBNotificationDeliveryEvent addSuggestionUUID:](self, "addSuggestionUUID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSMutableArray)suggestionUUIDs
{
  return self->_suggestionUUIDs;
}

- (void)setSuggestionUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUIDs, 0);
}

@end
