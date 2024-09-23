@implementation HDCloudSyncCodableRegistry

- (void)clearDisabledOwnerIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_disabledOwnerIdentifiers, "removeAllObjects");
}

- (void)addDisabledOwnerIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *disabledOwnerIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  v8 = v4;
  if (!disabledOwnerIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_disabledOwnerIdentifiers;
    self->_disabledOwnerIdentifiers = v6;

    v4 = v8;
    disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  }
  -[NSMutableArray addObject:](disabledOwnerIdentifiers, "addObject:", v4);

}

- (unint64_t)disabledOwnerIdentifiersCount
{
  return -[NSMutableArray count](self->_disabledOwnerIdentifiers, "count");
}

- (id)disabledOwnerIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_disabledOwnerIdentifiers, "objectAtIndex:", a3);
}

+ (Class)disabledOwnerIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearStores
{
  -[NSMutableArray removeAllObjects](self->_stores, "removeAllObjects");
}

- (void)addStores:(id)a3
{
  id v4;
  NSMutableArray *stores;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stores = self->_stores;
  v8 = v4;
  if (!stores)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_stores;
    self->_stores = v6;

    v4 = v8;
    stores = self->_stores;
  }
  -[NSMutableArray addObject:](stores, "addObject:", v4);

}

- (unint64_t)storesCount
{
  return -[NSMutableArray count](self->_stores, "count");
}

- (id)storesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_stores, "objectAtIndex:", a3);
}

+ (Class)storesType
{
  return (Class)objc_opt_class();
}

- (void)clearDisabledSyncIdentities
{
  -[NSMutableArray removeAllObjects](self->_disabledSyncIdentities, "removeAllObjects");
}

- (void)addDisabledSyncIdentities:(id)a3
{
  id v4;
  NSMutableArray *disabledSyncIdentities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  disabledSyncIdentities = self->_disabledSyncIdentities;
  v8 = v4;
  if (!disabledSyncIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_disabledSyncIdentities;
    self->_disabledSyncIdentities = v6;

    v4 = v8;
    disabledSyncIdentities = self->_disabledSyncIdentities;
  }
  -[NSMutableArray addObject:](disabledSyncIdentities, "addObject:", v4);

}

- (unint64_t)disabledSyncIdentitiesCount
{
  return -[NSMutableArray count](self->_disabledSyncIdentities, "count");
}

- (id)disabledSyncIdentitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_disabledSyncIdentities, "objectAtIndex:", a3);
}

+ (Class)disabledSyncIdentitiesType
{
  return (Class)objc_opt_class();
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasDisplayFirstName
{
  return self->_displayFirstName != 0;
}

- (void)setDisplayNameModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_displayNameModificationDate = a3;
}

- (void)setHasDisplayNameModificationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayNameModificationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDisplayLastName
{
  return self->_displayLastName != 0;
}

- (BOOL)hasOwnerProfileIdentifier
{
  return self->_ownerProfileIdentifier != 0;
}

- (BOOL)hasSharedProfileIdentifier
{
  return self->_sharedProfileIdentifier != 0;
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
  v8.super_class = (Class)HDCloudSyncCodableRegistry;
  -[HDCloudSyncCodableRegistry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableRegistry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *disabledOwnerIdentifiers;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSString *displayFirstName;
  void *v22;
  NSString *displayLastName;
  HDCloudSyncCodableProfileIdentifier *ownerProfileIdentifier;
  void *v25;
  HDCloudSyncCodableProfileIdentifier *sharedProfileIdentifier;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  if (disabledOwnerIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", disabledOwnerIdentifiers, CFSTR("disabledOwnerIdentifiers"));
  if (-[NSMutableArray count](self->_stores, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_stores, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = self->_stores;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("stores"));
  }
  if (-[NSMutableArray count](self->_disabledSyncIdentities, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_disabledSyncIdentities, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = self->_disabledSyncIdentities;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("disabledSyncIdentities"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("deleted"));

  }
  displayFirstName = self->_displayFirstName;
  if (displayFirstName)
    objc_msgSend(v4, "setObject:forKey:", displayFirstName, CFSTR("displayFirstName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_displayNameModificationDate);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("displayNameModificationDate"));

  }
  displayLastName = self->_displayLastName;
  if (displayLastName)
    objc_msgSend(v4, "setObject:forKey:", displayLastName, CFSTR("displayLastName"));
  ownerProfileIdentifier = self->_ownerProfileIdentifier;
  if (ownerProfileIdentifier)
  {
    -[HDCloudSyncCodableProfileIdentifier dictionaryRepresentation](ownerProfileIdentifier, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("ownerProfileIdentifier"));

  }
  sharedProfileIdentifier = self->_sharedProfileIdentifier;
  if (sharedProfileIdentifier)
  {
    -[HDCloudSyncCodableProfileIdentifier dictionaryRepresentation](sharedProfileIdentifier, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("sharedProfileIdentifier"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableRegistryReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_disabledOwnerIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_stores;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_disabledSyncIdentities;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_displayFirstName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_displayLastName)
    PBDataWriterWriteStringField();
  if (self->_ownerProfileIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_sharedProfileIdentifier)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  _BYTE *v16;
  _BYTE *v17;

  v17 = a3;
  if (-[HDCloudSyncCodableRegistry disabledOwnerIdentifiersCount](self, "disabledOwnerIdentifiersCount"))
  {
    objc_msgSend(v17, "clearDisabledOwnerIdentifiers");
    v4 = -[HDCloudSyncCodableRegistry disabledOwnerIdentifiersCount](self, "disabledOwnerIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCloudSyncCodableRegistry disabledOwnerIdentifiersAtIndex:](self, "disabledOwnerIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addDisabledOwnerIdentifiers:", v7);

      }
    }
  }
  if (-[HDCloudSyncCodableRegistry storesCount](self, "storesCount"))
  {
    objc_msgSend(v17, "clearStores");
    v8 = -[HDCloudSyncCodableRegistry storesCount](self, "storesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HDCloudSyncCodableRegistry storesAtIndex:](self, "storesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addStores:", v11);

      }
    }
  }
  if (-[HDCloudSyncCodableRegistry disabledSyncIdentitiesCount](self, "disabledSyncIdentitiesCount"))
  {
    objc_msgSend(v17, "clearDisabledSyncIdentities");
    v12 = -[HDCloudSyncCodableRegistry disabledSyncIdentitiesCount](self, "disabledSyncIdentitiesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[HDCloudSyncCodableRegistry disabledSyncIdentitiesAtIndex:](self, "disabledSyncIdentitiesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addDisabledSyncIdentities:", v15);

      }
    }
  }
  v16 = v17;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v17[72] = self->_deleted;
    v17[76] |= 2u;
  }
  if (self->_displayFirstName)
  {
    objc_msgSend(v17, "setDisplayFirstName:");
    v16 = v17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v16 + 1) = *(_QWORD *)&self->_displayNameModificationDate;
    v16[76] |= 1u;
  }
  if (self->_displayLastName)
  {
    objc_msgSend(v17, "setDisplayLastName:");
    v16 = v17;
  }
  if (self->_ownerProfileIdentifier)
  {
    objc_msgSend(v17, "setOwnerProfileIdentifier:");
    v16 = v17;
  }
  if (self->_sharedProfileIdentifier)
  {
    objc_msgSend(v17, "setSharedProfileIdentifier:");
    v16 = v17;
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = self->_disabledOwnerIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisabledOwnerIdentifiers:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v8);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = self->_stores;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStores:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v14);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = self->_disabledSyncIdentities;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addDisabledSyncIdentities:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v20);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_deleted;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v24 = -[NSString copyWithZone:](self->_displayFirstName, "copyWithZone:", a3, (_QWORD)v33);
  v25 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_displayNameModificationDate;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v26 = -[NSString copyWithZone:](self->_displayLastName, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v26;

  v28 = -[HDCloudSyncCodableProfileIdentifier copyWithZone:](self->_ownerProfileIdentifier, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v28;

  v30 = -[HDCloudSyncCodableProfileIdentifier copyWithZone:](self->_sharedProfileIdentifier, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *disabledOwnerIdentifiers;
  NSMutableArray *stores;
  NSMutableArray *disabledSyncIdentities;
  char has;
  char v9;
  NSString *displayFirstName;
  NSString *displayLastName;
  HDCloudSyncCodableProfileIdentifier *ownerProfileIdentifier;
  HDCloudSyncCodableProfileIdentifier *sharedProfileIdentifier;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  if ((unint64_t)disabledOwnerIdentifiers | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](disabledOwnerIdentifiers, "isEqual:"))
      goto LABEL_30;
  }
  stores = self->_stores;
  if ((unint64_t)stores | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](stores, "isEqual:"))
      goto LABEL_30;
  }
  disabledSyncIdentities = self->_disabledSyncIdentities;
  if ((unint64_t)disabledSyncIdentities | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](disabledSyncIdentities, "isEqual:"))
      goto LABEL_30;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 76);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0)
      goto LABEL_30;
    if (self->_deleted)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_30;
  }
  displayFirstName = self->_displayFirstName;
  if (!((unint64_t)displayFirstName | *((_QWORD *)v4 + 4)))
    goto LABEL_19;
  if (!-[NSString isEqual:](displayFirstName, "isEqual:"))
  {
LABEL_30:
    v14 = 0;
    goto LABEL_31;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 76);
LABEL_19:
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_displayNameModificationDate != *((double *)v4 + 1))
      goto LABEL_30;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_30;
  }
  displayLastName = self->_displayLastName;
  if ((unint64_t)displayLastName | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](displayLastName, "isEqual:"))
  {
    goto LABEL_30;
  }
  ownerProfileIdentifier = self->_ownerProfileIdentifier;
  if ((unint64_t)ownerProfileIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[HDCloudSyncCodableProfileIdentifier isEqual:](ownerProfileIdentifier, "isEqual:"))
      goto LABEL_30;
  }
  sharedProfileIdentifier = self->_sharedProfileIdentifier;
  if ((unint64_t)sharedProfileIdentifier | *((_QWORD *)v4 + 7))
    v14 = -[HDCloudSyncCodableProfileIdentifier isEqual:](sharedProfileIdentifier, "isEqual:");
  else
    v14 = 1;
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  double displayNameModificationDate;
  double v10;
  long double v11;
  double v12;
  NSUInteger v13;
  unint64_t v14;

  v3 = -[NSMutableArray hash](self->_disabledOwnerIdentifiers, "hash");
  v4 = -[NSMutableArray hash](self->_stores, "hash");
  v5 = -[NSMutableArray hash](self->_disabledSyncIdentities, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_deleted;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_displayFirstName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    displayNameModificationDate = self->_displayNameModificationDate;
    v10 = -displayNameModificationDate;
    if (displayNameModificationDate >= 0.0)
      v10 = self->_displayNameModificationDate;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_displayLastName, "hash");
  v14 = -[HDCloudSyncCodableProfileIdentifier hash](self->_ownerProfileIdentifier, "hash");
  return v13 ^ v14 ^ -[HDCloudSyncCodableProfileIdentifier hash](self->_sharedProfileIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  HDCloudSyncCodableProfileIdentifier *ownerProfileIdentifier;
  uint64_t v21;
  HDCloudSyncCodableProfileIdentifier *sharedProfileIdentifier;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        -[HDCloudSyncCodableRegistry addDisabledOwnerIdentifiers:](self, "addDisabledOwnerIdentifiers:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = *((id *)v4 + 8);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        -[HDCloudSyncCodableRegistry addStores:](self, "addStores:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v12);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = *((id *)v4 + 3);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        -[HDCloudSyncCodableRegistry addDisabledSyncIdentities:](self, "addDisabledSyncIdentities:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * k), (_QWORD)v24);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v17);
  }

  if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    self->_deleted = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
    -[HDCloudSyncCodableRegistry setDisplayFirstName:](self, "setDisplayFirstName:");
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_displayNameModificationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[HDCloudSyncCodableRegistry setDisplayLastName:](self, "setDisplayLastName:");
  ownerProfileIdentifier = self->_ownerProfileIdentifier;
  v21 = *((_QWORD *)v4 + 6);
  if (ownerProfileIdentifier)
  {
    if (v21)
      -[HDCloudSyncCodableProfileIdentifier mergeFrom:](ownerProfileIdentifier, "mergeFrom:");
  }
  else if (v21)
  {
    -[HDCloudSyncCodableRegistry setOwnerProfileIdentifier:](self, "setOwnerProfileIdentifier:");
  }
  sharedProfileIdentifier = self->_sharedProfileIdentifier;
  v23 = *((_QWORD *)v4 + 7);
  if (sharedProfileIdentifier)
  {
    if (v23)
      -[HDCloudSyncCodableProfileIdentifier mergeFrom:](sharedProfileIdentifier, "mergeFrom:");
  }
  else if (v23)
  {
    -[HDCloudSyncCodableRegistry setSharedProfileIdentifier:](self, "setSharedProfileIdentifier:");
  }

}

- (NSMutableArray)disabledOwnerIdentifiers
{
  return self->_disabledOwnerIdentifiers;
}

- (void)setDisabledOwnerIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_disabledOwnerIdentifiers, a3);
}

- (NSMutableArray)stores
{
  return self->_stores;
}

- (void)setStores:(id)a3
{
  objc_storeStrong((id *)&self->_stores, a3);
}

- (NSMutableArray)disabledSyncIdentities
{
  return self->_disabledSyncIdentities;
}

- (void)setDisabledSyncIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_disabledSyncIdentities, a3);
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSString)displayFirstName
{
  return self->_displayFirstName;
}

- (void)setDisplayFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_displayFirstName, a3);
}

- (double)displayNameModificationDate
{
  return self->_displayNameModificationDate;
}

- (NSString)displayLastName
{
  return self->_displayLastName;
}

- (void)setDisplayLastName:(id)a3
{
  objc_storeStrong((id *)&self->_displayLastName, a3);
}

- (HDCloudSyncCodableProfileIdentifier)ownerProfileIdentifier
{
  return self->_ownerProfileIdentifier;
}

- (void)setOwnerProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ownerProfileIdentifier, a3);
}

- (HDCloudSyncCodableProfileIdentifier)sharedProfileIdentifier
{
  return self->_sharedProfileIdentifier;
}

- (void)setSharedProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stores, 0);
  objc_storeStrong((id *)&self->_sharedProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_displayLastName, 0);
  objc_storeStrong((id *)&self->_displayFirstName, 0);
  objc_storeStrong((id *)&self->_disabledSyncIdentities, 0);
  objc_storeStrong((id *)&self->_disabledOwnerIdentifiers, 0);
}

@end
