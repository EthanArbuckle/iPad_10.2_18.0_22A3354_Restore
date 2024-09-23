@implementation HDCloudSyncCodableSequence

- (int)slot
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_slot;
  else
    return 1;
}

- (void)setSlot:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_slot = a3;
}

- (void)setHasSlot:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSlot
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)slotAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E6CF8958[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSlot:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("A")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("B")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Tombstone")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setActive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_active = a3;
}

- (void)setHasActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasActive
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEpoch:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEpoch
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearIncludedStoreIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_includedStoreIdentifiers, "removeAllObjects");
}

- (void)addIncludedStoreIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *includedStoreIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  includedStoreIdentifiers = self->_includedStoreIdentifiers;
  v8 = v4;
  if (!includedStoreIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_includedStoreIdentifiers;
    self->_includedStoreIdentifiers = v6;

    v4 = v8;
    includedStoreIdentifiers = self->_includedStoreIdentifiers;
  }
  -[NSMutableArray addObject:](includedStoreIdentifiers, "addObject:", v4);

}

- (unint64_t)includedStoreIdentifiersCount
{
  return -[NSMutableArray count](self->_includedStoreIdentifiers, "count");
}

- (id)includedStoreIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_includedStoreIdentifiers, "objectAtIndex:", a3);
}

+ (Class)includedStoreIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearIncludedSyncIdentities
{
  -[NSMutableArray removeAllObjects](self->_includedSyncIdentities, "removeAllObjects");
}

- (void)addIncludedSyncIdentities:(id)a3
{
  id v4;
  NSMutableArray *includedSyncIdentities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  includedSyncIdentities = self->_includedSyncIdentities;
  v8 = v4;
  if (!includedSyncIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_includedSyncIdentities;
    self->_includedSyncIdentities = v6;

    v4 = v8;
    includedSyncIdentities = self->_includedSyncIdentities;
  }
  -[NSMutableArray addObject:](includedSyncIdentities, "addObject:", v4);

}

- (unint64_t)includedSyncIdentitiesCount
{
  return -[NSMutableArray count](self->_includedSyncIdentities, "count");
}

- (id)includedSyncIdentitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_includedSyncIdentities, "objectAtIndex:", a3);
}

+ (Class)includedSyncIdentitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearIncludedChildSyncIdentities
{
  -[NSMutableArray removeAllObjects](self->_includedChildSyncIdentities, "removeAllObjects");
}

- (void)addIncludedChildSyncIdentities:(id)a3
{
  id v4;
  NSMutableArray *includedChildSyncIdentities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  includedChildSyncIdentities = self->_includedChildSyncIdentities;
  v8 = v4;
  if (!includedChildSyncIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_includedChildSyncIdentities;
    self->_includedChildSyncIdentities = v6;

    v4 = v8;
    includedChildSyncIdentities = self->_includedChildSyncIdentities;
  }
  -[NSMutableArray addObject:](includedChildSyncIdentities, "addObject:", v4);

}

- (unint64_t)includedChildSyncIdentitiesCount
{
  return -[NSMutableArray count](self->_includedChildSyncIdentities, "count");
}

- (id)includedChildSyncIdentitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_includedChildSyncIdentities, "objectAtIndex:", a3);
}

+ (Class)includedChildSyncIdentitiesType
{
  return (Class)objc_opt_class();
}

- (void)setProtocolVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasAnchorMap
{
  return self->_anchorMap != 0;
}

- (BOOL)hasFrozenAnchorMap
{
  return self->_frozenAnchorMap != 0;
}

- (void)setChangeIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_changeIndex = a3;
}

- (void)setHasChangeIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setChildRecordCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_childRecordCount = a3;
}

- (void)setHasChildRecordCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChildRecordCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearUnfrozenChangeRecordNames
{
  -[NSMutableArray removeAllObjects](self->_unfrozenChangeRecordNames, "removeAllObjects");
}

- (void)addUnfrozenChangeRecordNames:(id)a3
{
  id v4;
  NSMutableArray *unfrozenChangeRecordNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  unfrozenChangeRecordNames = self->_unfrozenChangeRecordNames;
  v8 = v4;
  if (!unfrozenChangeRecordNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_unfrozenChangeRecordNames;
    self->_unfrozenChangeRecordNames = v6;

    v4 = v8;
    unfrozenChangeRecordNames = self->_unfrozenChangeRecordNames;
  }
  -[NSMutableArray addObject:](unfrozenChangeRecordNames, "addObject:", v4);

}

- (unint64_t)unfrozenChangeRecordNamesCount
{
  return -[NSMutableArray count](self->_unfrozenChangeRecordNames, "count");
}

- (id)unfrozenChangeRecordNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_unfrozenChangeRecordNames, "objectAtIndex:", a3);
}

+ (Class)unfrozenChangeRecordNamesType
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
  v8.super_class = (Class)HDCloudSyncCodableSequence;
  -[HDCloudSyncCodableSequence description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSequence dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  NSMutableArray *includedStoreIdentifiers;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  HDCodableSyncAnchorRangeMap *anchorMap;
  void *v26;
  HDCodableSyncAnchorRangeMap *frozenAnchorMap;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  NSMutableArray *unfrozenChangeRecordNames;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v5 = self->_slot - 1;
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_slot);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E6CF8958[v5];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("slot"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("active"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_epoch);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("epoch"));

  }
  includedStoreIdentifiers = self->_includedStoreIdentifiers;
  if (includedStoreIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", includedStoreIdentifiers, CFSTR("includedStoreIdentifiers"));
  if (-[NSMutableArray count](self->_includedSyncIdentities, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_includedSyncIdentities, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v11 = self->_includedSyncIdentities;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("includedSyncIdentities"));
  }
  if (-[NSMutableArray count](self->_includedChildSyncIdentities, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_includedChildSyncIdentities, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = self->_includedChildSyncIdentities;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("includedChildSyncIdentities"));
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_protocolVersion);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("protocolVersion"));

  }
  anchorMap = self->_anchorMap;
  if (anchorMap)
  {
    -[HDCodableSyncAnchorRangeMap dictionaryRepresentation](anchorMap, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("anchorMap"));

  }
  frozenAnchorMap = self->_frozenAnchorMap;
  if (frozenAnchorMap)
  {
    -[HDCodableSyncAnchorRangeMap dictionaryRepresentation](frozenAnchorMap, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("frozenAnchorMap"));

  }
  v29 = (char)self->_has;
  if ((v29 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_changeIndex);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("changeIndex"));

    v29 = (char)self->_has;
  }
  if ((v29 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_childRecordCount);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("childRecordCount"));

  }
  unfrozenChangeRecordNames = self->_unfrozenChangeRecordNames;
  if (unfrozenChangeRecordNames)
    objc_msgSend(v3, "setObject:forKey:", unfrozenChangeRecordNames, CFSTR("unfrozenChangeRecordNames"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSequenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  char v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt64Field();
LABEL_5:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = self->_includedStoreIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v8);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = self->_includedSyncIdentities;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v13);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = self->_includedChildSyncIdentities;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_anchorMap)
    PBDataWriterWriteSubmessage();
  if (self->_frozenAnchorMap)
    PBDataWriterWriteSubmessage();
  v21 = (char)self->_has;
  if ((v21 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v21 = (char)self->_has;
  }
  if ((v21 & 2) != 0)
    PBDataWriterWriteInt64Field();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = self->_unfrozenChangeRecordNames;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteStringField();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  _QWORD *v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t m;
  void *v23;
  id v24;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_3;
LABEL_33:
    v4[96] = self->_active;
    v4[100] |= 0x20u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 20) = self->_slot;
  v4[100] |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_33;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_QWORD *)v4 + 3) = self->_epoch;
    v4[100] |= 4u;
  }
LABEL_5:
  v24 = v4;
  if (-[HDCloudSyncCodableSequence includedStoreIdentifiersCount](self, "includedStoreIdentifiersCount"))
  {
    objc_msgSend(v24, "clearIncludedStoreIdentifiers");
    v6 = -[HDCloudSyncCodableSequence includedStoreIdentifiersCount](self, "includedStoreIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCloudSyncCodableSequence includedStoreIdentifiersAtIndex:](self, "includedStoreIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addIncludedStoreIdentifiers:", v9);

      }
    }
  }
  if (-[HDCloudSyncCodableSequence includedSyncIdentitiesCount](self, "includedSyncIdentitiesCount"))
  {
    objc_msgSend(v24, "clearIncludedSyncIdentities");
    v10 = -[HDCloudSyncCodableSequence includedSyncIdentitiesCount](self, "includedSyncIdentitiesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[HDCloudSyncCodableSequence includedSyncIdentitiesAtIndex:](self, "includedSyncIdentitiesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addIncludedSyncIdentities:", v13);

      }
    }
  }
  if (-[HDCloudSyncCodableSequence includedChildSyncIdentitiesCount](self, "includedChildSyncIdentitiesCount"))
  {
    objc_msgSend(v24, "clearIncludedChildSyncIdentities");
    v14 = -[HDCloudSyncCodableSequence includedChildSyncIdentitiesCount](self, "includedChildSyncIdentitiesCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[HDCloudSyncCodableSequence includedChildSyncIdentitiesAtIndex:](self, "includedChildSyncIdentitiesAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addIncludedChildSyncIdentities:", v17);

      }
    }
  }
  v18 = v24;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_QWORD *)v24 + 4) = self->_protocolVersion;
    *((_BYTE *)v24 + 100) |= 8u;
  }
  if (self->_anchorMap)
  {
    objc_msgSend(v24, "setAnchorMap:");
    v18 = v24;
  }
  if (self->_frozenAnchorMap)
  {
    objc_msgSend(v24, "setFrozenAnchorMap:");
    v18 = v24;
  }
  v19 = (char)self->_has;
  if ((v19 & 1) != 0)
  {
    v18[1] = self->_changeIndex;
    *((_BYTE *)v18 + 100) |= 1u;
    v19 = (char)self->_has;
  }
  if ((v19 & 2) != 0)
  {
    v18[2] = self->_childRecordCount;
    *((_BYTE *)v18 + 100) |= 2u;
  }
  if (-[HDCloudSyncCodableSequence unfrozenChangeRecordNamesCount](self, "unfrozenChangeRecordNamesCount"))
  {
    objc_msgSend(v24, "clearUnfrozenChangeRecordNames");
    v20 = -[HDCloudSyncCodableSequence unfrozenChangeRecordNamesCount](self, "unfrozenChangeRecordNamesCount");
    if (v20)
    {
      v21 = v20;
      for (m = 0; m != v21; ++m)
      {
        -[HDCloudSyncCodableSequence unfrozenChangeRecordNamesAtIndex:](self, "unfrozenChangeRecordNamesAtIndex:", m);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addUnfrozenChangeRecordNames:", v23);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_slot;
    *(_BYTE *)(v5 + 100) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 96) = self->_active;
  *(_BYTE *)(v5 + 100) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_epoch;
    *(_BYTE *)(v5 + 100) |= 4u;
  }
LABEL_5:
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = self->_includedStoreIdentifiers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addIncludedStoreIdentifiers:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v10);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v14 = self->_includedSyncIdentities;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addIncludedSyncIdentities:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v16);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v20 = self->_includedChildSyncIdentities;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addIncludedChildSyncIdentities:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v22);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_protocolVersion;
    *(_BYTE *)(v6 + 100) |= 8u;
  }
  v26 = -[HDCodableSyncAnchorRangeMap copyWithZone:](self->_anchorMap, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v26;

  v28 = -[HDCodableSyncAnchorRangeMap copyWithZone:](self->_frozenAnchorMap, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v28;

  v30 = (char)self->_has;
  if ((v30 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_changeIndex;
    *(_BYTE *)(v6 + 100) |= 1u;
    v30 = (char)self->_has;
  }
  if ((v30 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_childRecordCount;
    *(_BYTE *)(v6 + 100) |= 2u;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = self->_unfrozenChangeRecordNames;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v38);
        objc_msgSend((id)v6, "addUnfrozenChangeRecordNames:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    }
    while (v33);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *includedStoreIdentifiers;
  NSMutableArray *includedSyncIdentities;
  NSMutableArray *includedChildSyncIdentities;
  HDCodableSyncAnchorRangeMap *anchorMap;
  HDCodableSyncAnchorRangeMap *frozenAnchorMap;
  NSMutableArray *unfrozenChangeRecordNames;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x10) == 0 || self->_slot != *((_DWORD *)v4 + 20))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
    {
      if (self->_active)
      {
        if (!*((_BYTE *)v4 + 96))
          goto LABEL_47;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_15;
    }
LABEL_47:
    v11 = 0;
    goto LABEL_48;
  }
  if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
    goto LABEL_47;
LABEL_15:
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_epoch != *((_QWORD *)v4 + 3))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_47;
  }
  includedStoreIdentifiers = self->_includedStoreIdentifiers;
  if ((unint64_t)includedStoreIdentifiers | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](includedStoreIdentifiers, "isEqual:"))
  {
    goto LABEL_47;
  }
  includedSyncIdentities = self->_includedSyncIdentities;
  if ((unint64_t)includedSyncIdentities | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](includedSyncIdentities, "isEqual:"))
      goto LABEL_47;
  }
  includedChildSyncIdentities = self->_includedChildSyncIdentities;
  if ((unint64_t)includedChildSyncIdentities | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](includedChildSyncIdentities, "isEqual:"))
      goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) == 0 || self->_protocolVersion != *((_QWORD *)v4 + 4))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
    goto LABEL_47;
  }
  anchorMap = self->_anchorMap;
  if ((unint64_t)anchorMap | *((_QWORD *)v4 + 5)
    && !-[HDCodableSyncAnchorRangeMap isEqual:](anchorMap, "isEqual:"))
  {
    goto LABEL_47;
  }
  frozenAnchorMap = self->_frozenAnchorMap;
  if ((unint64_t)frozenAnchorMap | *((_QWORD *)v4 + 6))
  {
    if (!-[HDCodableSyncAnchorRangeMap isEqual:](frozenAnchorMap, "isEqual:"))
      goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_changeIndex != *((_QWORD *)v4 + 1))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0 || self->_childRecordCount != *((_QWORD *)v4 + 2))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_47;
  }
  unfrozenChangeRecordNames = self->_unfrozenChangeRecordNames;
  if ((unint64_t)unfrozenChangeRecordNames | *((_QWORD *)v4 + 11))
    v11 = -[NSMutableArray isEqual:](unfrozenChangeRecordNames, "isEqual:");
  else
    v11 = 1;
LABEL_48:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v14 = 2654435761 * self->_slot;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_active;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_epoch;
    goto LABEL_8;
  }
LABEL_7:
  v4 = 0;
LABEL_8:
  v5 = -[NSMutableArray hash](self->_includedStoreIdentifiers, "hash");
  v6 = -[NSMutableArray hash](self->_includedSyncIdentities, "hash");
  v7 = -[NSMutableArray hash](self->_includedChildSyncIdentities, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v8 = 2654435761 * self->_protocolVersion;
  else
    v8 = 0;
  v9 = -[HDCodableSyncAnchorRangeMap hash](self->_anchorMap, "hash");
  v10 = -[HDCodableSyncAnchorRangeMap hash](self->_frozenAnchorMap, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11 = 2654435761 * self->_changeIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_13;
LABEL_15:
    v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_unfrozenChangeRecordNames, "hash");
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_13:
  v12 = 2654435761 * self->_childRecordCount;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_unfrozenChangeRecordNames, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  HDCodableSyncAnchorRangeMap *anchorMap;
  uint64_t v23;
  HDCodableSyncAnchorRangeMap *frozenAnchorMap;
  uint64_t v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 100);
  if ((v6 & 0x10) != 0)
  {
    self->_slot = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 100);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_active = *((_BYTE *)v4 + 96);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
LABEL_4:
    self->_epoch = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = *((id *)v4 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        -[HDCloudSyncCodableSequence addIncludedStoreIdentifiers:](self, "addIncludedStoreIdentifiers:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v9);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = *((id *)v5 + 9);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        -[HDCloudSyncCodableSequence addIncludedSyncIdentities:](self, "addIncludedSyncIdentities:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v14);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = *((id *)v5 + 7);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        -[HDCloudSyncCodableSequence addIncludedChildSyncIdentities:](self, "addIncludedChildSyncIdentities:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v19);
  }

  if ((*((_BYTE *)v5 + 100) & 8) != 0)
  {
    self->_protocolVersion = *((_QWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  anchorMap = self->_anchorMap;
  v23 = *((_QWORD *)v5 + 5);
  if (anchorMap)
  {
    if (v23)
      -[HDCodableSyncAnchorRangeMap mergeFrom:](anchorMap, "mergeFrom:");
  }
  else if (v23)
  {
    -[HDCloudSyncCodableSequence setAnchorMap:](self, "setAnchorMap:");
  }
  frozenAnchorMap = self->_frozenAnchorMap;
  v25 = *((_QWORD *)v5 + 6);
  if (frozenAnchorMap)
  {
    if (v25)
      -[HDCodableSyncAnchorRangeMap mergeFrom:](frozenAnchorMap, "mergeFrom:");
  }
  else if (v25)
  {
    -[HDCloudSyncCodableSequence setFrozenAnchorMap:](self, "setFrozenAnchorMap:");
  }
  v26 = *((_BYTE *)v5 + 100);
  if ((v26 & 1) != 0)
  {
    self->_changeIndex = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v26 = *((_BYTE *)v5 + 100);
  }
  if ((v26 & 2) != 0)
  {
    self->_childRecordCount = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = *((id *)v5 + 11);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        -[HDCloudSyncCodableSequence addUnfrozenChangeRecordNames:](self, "addUnfrozenChangeRecordNames:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * m), (_QWORD)v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v29);
  }

}

- (BOOL)active
{
  return self->_active;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (NSMutableArray)includedStoreIdentifiers
{
  return self->_includedStoreIdentifiers;
}

- (void)setIncludedStoreIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_includedStoreIdentifiers, a3);
}

- (NSMutableArray)includedSyncIdentities
{
  return self->_includedSyncIdentities;
}

- (void)setIncludedSyncIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_includedSyncIdentities, a3);
}

- (NSMutableArray)includedChildSyncIdentities
{
  return self->_includedChildSyncIdentities;
}

- (void)setIncludedChildSyncIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_includedChildSyncIdentities, a3);
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (HDCodableSyncAnchorRangeMap)anchorMap
{
  return self->_anchorMap;
}

- (void)setAnchorMap:(id)a3
{
  objc_storeStrong((id *)&self->_anchorMap, a3);
}

- (HDCodableSyncAnchorRangeMap)frozenAnchorMap
{
  return self->_frozenAnchorMap;
}

- (void)setFrozenAnchorMap:(id)a3
{
  objc_storeStrong((id *)&self->_frozenAnchorMap, a3);
}

- (int64_t)changeIndex
{
  return self->_changeIndex;
}

- (int64_t)childRecordCount
{
  return self->_childRecordCount;
}

- (NSMutableArray)unfrozenChangeRecordNames
{
  return self->_unfrozenChangeRecordNames;
}

- (void)setUnfrozenChangeRecordNames:(id)a3
{
  objc_storeStrong((id *)&self->_unfrozenChangeRecordNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfrozenChangeRecordNames, 0);
  objc_storeStrong((id *)&self->_includedSyncIdentities, 0);
  objc_storeStrong((id *)&self->_includedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedChildSyncIdentities, 0);
  objc_storeStrong((id *)&self->_frozenAnchorMap, 0);
  objc_storeStrong((id *)&self->_anchorMap, 0);
}

@end
