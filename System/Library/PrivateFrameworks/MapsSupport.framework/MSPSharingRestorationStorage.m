@implementation MSPSharingRestorationStorage

- (void)setCreatedTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_createdTimestamp = a3;
}

- (void)setHasCreatedTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (void)clearMapsIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_mapsIdentifiers, "removeAllObjects");
}

- (void)addMapsIdentifier:(id)a3
{
  id v4;
  NSMutableArray *mapsIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mapsIdentifiers = self->_mapsIdentifiers;
  v8 = v4;
  if (!mapsIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_mapsIdentifiers;
    self->_mapsIdentifiers = v6;

    v4 = v8;
    mapsIdentifiers = self->_mapsIdentifiers;
  }
  -[NSMutableArray addObject:](mapsIdentifiers, "addObject:", v4);

}

- (unint64_t)mapsIdentifiersCount
{
  return -[NSMutableArray count](self->_mapsIdentifiers, "count");
}

- (id)mapsIdentifierAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mapsIdentifiers, "objectAtIndex:", a3);
}

+ (Class)mapsIdentifierType
{
  return (Class)objc_opt_class();
}

- (void)clearMessagesIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_messagesIdentifiers, "removeAllObjects");
}

- (void)addMessagesIdentifier:(id)a3
{
  id v4;
  NSMutableArray *messagesIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  messagesIdentifiers = self->_messagesIdentifiers;
  v8 = v4;
  if (!messagesIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_messagesIdentifiers;
    self->_messagesIdentifiers = v6;

    v4 = v8;
    messagesIdentifiers = self->_messagesIdentifiers;
  }
  -[NSMutableArray addObject:](messagesIdentifiers, "addObject:", v4);

}

- (unint64_t)messagesIdentifiersCount
{
  return -[NSMutableArray count](self->_messagesIdentifiers, "count");
}

- (id)messagesIdentifierAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_messagesIdentifiers, "objectAtIndex:", a3);
}

+ (Class)messagesIdentifierType
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
  v8.super_class = (Class)MSPSharingRestorationStorage;
  -[MSPSharingRestorationStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharingRestorationStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *groupIdentifier;
  NSMutableArray *mapsIdentifiers;
  NSMutableArray *messagesIdentifiers;
  PBUnknownFields *unknownFields;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_createdTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("created_timestamp"));

  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier)
    objc_msgSend(v3, "setObject:forKey:", groupIdentifier, CFSTR("group_identifier"));
  mapsIdentifiers = self->_mapsIdentifiers;
  if (mapsIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", mapsIdentifiers, CFSTR("maps_identifier"));
  messagesIdentifiers = self->_messagesIdentifiers;
  if (messagesIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", messagesIdentifiers, CFSTR("messages_identifier"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPSharingRestorationStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_groupIdentifier)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_mapsIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_messagesIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = *(_QWORD *)&self->_createdTimestamp;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v13 = v4;
  if (self->_groupIdentifier)
    objc_msgSend(v4, "setGroupIdentifier:");
  if (-[MSPSharingRestorationStorage mapsIdentifiersCount](self, "mapsIdentifiersCount"))
  {
    objc_msgSend(v13, "clearMapsIdentifiers");
    v5 = -[MSPSharingRestorationStorage mapsIdentifiersCount](self, "mapsIdentifiersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[MSPSharingRestorationStorage mapsIdentifierAtIndex:](self, "mapsIdentifierAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addMapsIdentifier:", v8);

      }
    }
  }
  if (-[MSPSharingRestorationStorage messagesIdentifiersCount](self, "messagesIdentifiersCount"))
  {
    objc_msgSend(v13, "clearMessagesIdentifiers");
    v9 = -[MSPSharingRestorationStorage messagesIdentifiersCount](self, "messagesIdentifiersCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[MSPSharingRestorationStorage messagesIdentifierAtIndex:](self, "messagesIdentifierAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addMessagesIdentifier:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_createdTimestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_groupIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_mapsIdentifiers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMapsIdentifier:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_messagesIdentifiers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v6, "addMessagesIdentifier:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *groupIdentifier;
  NSMutableArray *mapsIdentifiers;
  NSMutableArray *messagesIdentifiers;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_createdTimestamp != *((double *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](groupIdentifier, "isEqual:"))
  {
    goto LABEL_13;
  }
  mapsIdentifiers = self->_mapsIdentifiers;
  if ((unint64_t)mapsIdentifiers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](mapsIdentifiers, "isEqual:"))
      goto LABEL_13;
  }
  messagesIdentifiers = self->_messagesIdentifiers;
  if ((unint64_t)messagesIdentifiers | *((_QWORD *)v4 + 5))
    v8 = -[NSMutableArray isEqual:](messagesIdentifiers, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  double createdTimestamp;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    createdTimestamp = self->_createdTimestamp;
    v5 = -createdTimestamp;
    if (createdTimestamp >= 0.0)
      v5 = self->_createdTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_groupIdentifier, "hash") ^ v3;
  v9 = -[NSMutableArray hash](self->_mapsIdentifiers, "hash");
  return v8 ^ v9 ^ -[NSMutableArray hash](self->_messagesIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_createdTimestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[MSPSharingRestorationStorage setGroupIdentifier:](self, "setGroupIdentifier:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5[4];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[MSPSharingRestorationStorage addMapsIdentifier:](self, "addMapsIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v5[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[MSPSharingRestorationStorage addMessagesIdentifier:](self, "addMessagesIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (double)createdTimestamp
{
  return self->_createdTimestamp;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (NSMutableArray)mapsIdentifiers
{
  return self->_mapsIdentifiers;
}

- (void)setMapsIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_mapsIdentifiers, a3);
}

- (NSMutableArray)messagesIdentifiers
{
  return self->_messagesIdentifiers;
}

- (void)setMessagesIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_messagesIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesIdentifiers, 0);
  objc_storeStrong((id *)&self->_mapsIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
