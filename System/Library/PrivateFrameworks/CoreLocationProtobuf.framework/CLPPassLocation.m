@implementation CLPPassLocation

- (void)clearAssociatedStoreIds
{
  -[NSMutableArray removeAllObjects](self->_associatedStoreIds, "removeAllObjects");
}

- (void)addAssociatedStoreId:(id)a3
{
  id v4;
  NSMutableArray *associatedStoreIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  associatedStoreIds = self->_associatedStoreIds;
  v8 = v4;
  if (!associatedStoreIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_associatedStoreIds;
    self->_associatedStoreIds = v6;

    v4 = v8;
    associatedStoreIds = self->_associatedStoreIds;
  }
  -[NSMutableArray addObject:](associatedStoreIds, "addObject:", v4);

}

- (unint64_t)associatedStoreIdsCount
{
  return -[NSMutableArray count](self->_associatedStoreIds, "count");
}

- (id)associatedStoreIdAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_associatedStoreIds, "objectAtIndex:", a3);
}

+ (Class)associatedStoreIdType
{
  return (Class)objc_opt_class();
}

- (void)setAge:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setServerHash:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerHash
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)CLPPassLocation;
  -[CLPPassLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPPassLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passTypeId;
  NSMutableArray *associatedStoreIds;
  void *v7;
  void *v8;
  CLPLocation *location;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passTypeId = self->_passTypeId;
  if (passTypeId)
    objc_msgSend(v3, "setObject:forKey:", passTypeId, CFSTR("passTypeId"));
  associatedStoreIds = self->_associatedStoreIds;
  if (associatedStoreIds)
    objc_msgSend(v4, "setObject:forKey:", associatedStoreIds, CFSTR("associatedStoreId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_passSource);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("passSource"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_age);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("age"));

  }
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("location"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_serverHash);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("serverHash"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPassLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
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
  if (!self->_passTypeId)
    -[CLPPassLocation writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_associatedStoreIds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (!self->_location)
    -[CLPPassLocation writeTo:].cold.2();
  PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setPassTypeId:", self->_passTypeId);
  if (-[CLPPassLocation associatedStoreIdsCount](self, "associatedStoreIdsCount"))
  {
    objc_msgSend(v8, "clearAssociatedStoreIds");
    v4 = -[CLPPassLocation associatedStoreIdsCount](self, "associatedStoreIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[CLPPassLocation associatedStoreIdAtIndex:](self, "associatedStoreIdAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAssociatedStoreId:", v7);

      }
    }
  }
  *((_DWORD *)v8 + 8) = self->_passSource;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v8 + 1) = *(_QWORD *)&self->_age;
    *((_BYTE *)v8 + 52) |= 1u;
  }
  objc_msgSend(v8, "setLocation:", self->_location);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v8 + 12) = self->_serverHash;
    *((_BYTE *)v8 + 52) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passTypeId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_associatedStoreIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addAssociatedStoreId:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  *(_DWORD *)(v5 + 32) = self->_passSource;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_age;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v14 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3, (_QWORD)v17);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_serverHash;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passTypeId;
  NSMutableArray *associatedStoreIds;
  char has;
  CLPLocation *location;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  passTypeId = self->_passTypeId;
  if ((unint64_t)passTypeId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](passTypeId, "isEqual:"))
      goto LABEL_19;
  }
  associatedStoreIds = self->_associatedStoreIds;
  if ((unint64_t)associatedStoreIds | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](associatedStoreIds, "isEqual:"))
      goto LABEL_19;
  }
  if (self->_passSource != *((_DWORD *)v4 + 8))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_age != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_19;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 3))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:"))
    {
LABEL_19:
      v9 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  v9 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_serverHash != *((_DWORD *)v4 + 12))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t passSource;
  unint64_t v6;
  double age;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_passTypeId, "hash");
  v4 = -[NSMutableArray hash](self->_associatedStoreIds, "hash");
  passSource = self->_passSource;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    age = self->_age;
    v8 = -age;
    if (age >= 0.0)
      v8 = self->_age;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = -[CLPLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_serverHash;
  else
    v12 = 0;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ (2654435761 * passSource);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  CLPLocation *location;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[CLPPassLocation setPassTypeId:](self, "setPassTypeId:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[CLPPassLocation addAssociatedStoreId:](self, "addAssociatedStoreId:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  self->_passSource = *((_DWORD *)v4 + 8);
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_age = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  location = self->_location;
  v11 = *((_QWORD *)v4 + 3);
  if (location)
  {
    if (v11)
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v11)
  {
    -[CLPPassLocation setLocation:](self, "setLocation:");
  }
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    self->_serverHash = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)passTypeId
{
  return self->_passTypeId;
}

- (void)setPassTypeId:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeId, a3);
}

- (NSMutableArray)associatedStoreIds
{
  return self->_associatedStoreIds;
}

- (void)setAssociatedStoreIds:(id)a3
{
  objc_storeStrong((id *)&self->_associatedStoreIds, a3);
}

- (int)passSource
{
  return self->_passSource;
}

- (void)setPassSource:(int)a3
{
  self->_passSource = a3;
}

- (double)age
{
  return self->_age;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int)serverHash
{
  return self->_serverHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passTypeId, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_associatedStoreIds, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPassLocation writeTo:]", "CLPCollectionRequest.gen.m", 29342, "nil != self->_passTypeId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPPassLocation writeTo:]", "CLPCollectionRequest.gen.m", 29365, "self->_location != nil");
}

@end
