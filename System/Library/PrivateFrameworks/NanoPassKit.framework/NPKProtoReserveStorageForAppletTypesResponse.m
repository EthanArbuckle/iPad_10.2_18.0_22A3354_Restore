@implementation NPKProtoReserveStorageForAppletTypesResponse

- (void)clearReservationIDs
{
  -[NSMutableArray removeAllObjects](self->_reservationIDs, "removeAllObjects");
}

- (void)addReservationID:(id)a3
{
  id v4;
  NSMutableArray *reservationIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  reservationIDs = self->_reservationIDs;
  v8 = v4;
  if (!reservationIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_reservationIDs;
    self->_reservationIDs = v6;

    v4 = v8;
    reservationIDs = self->_reservationIDs;
  }
  -[NSMutableArray addObject:](reservationIDs, "addObject:", v4);

}

- (unint64_t)reservationIDsCount
{
  return -[NSMutableArray count](self->_reservationIDs, "count");
}

- (id)reservationIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_reservationIDs, "objectAtIndex:", a3);
}

+ (Class)reservationIDType
{
  return (Class)objc_opt_class();
}

- (void)setIsFull:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isFull = a3;
}

- (void)setHasIsFull:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsFull
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoReserveStorageForAppletTypesResponse;
  -[NPKProtoReserveStorageForAppletTypesResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoReserveStorageForAppletTypesResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *reservationIDs;
  void *v6;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  reservationIDs = self->_reservationIDs;
  if (reservationIDs)
    objc_msgSend(v3, "setObject:forKey:", reservationIDs, CFSTR("reservationID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFull);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("isFull"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoReserveStorageForAppletTypesResponseReadFrom((uint64_t)self, (uint64_t)a3);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_reservationIDs;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_errorData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  _BYTE *v9;

  v9 = a3;
  if (-[NPKProtoReserveStorageForAppletTypesResponse reservationIDsCount](self, "reservationIDsCount"))
  {
    objc_msgSend(v9, "clearReservationIDs");
    v4 = -[NPKProtoReserveStorageForAppletTypesResponse reservationIDsCount](self, "reservationIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoReserveStorageForAppletTypesResponse reservationIDAtIndex:](self, "reservationIDAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addReservationID:", v7);

      }
    }
  }
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9[24] = self->_isFull;
    v9[28] |= 1u;
  }
  if (self->_errorData)
  {
    objc_msgSend(v9, "setErrorData:");
    v8 = v9;
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_reservationIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addReservationID:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_isFull;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v12 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3, (_QWORD)v15);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *reservationIDs;
  char v6;
  NSData *errorData;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  reservationIDs = self->_reservationIDs;
  if ((unint64_t)reservationIDs | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](reservationIDs, "isEqual:"))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_isFull)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1))
    v6 = -[NSData isEqual:](errorData, "isEqual:");
  else
    v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableArray hash](self->_reservationIDs, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isFull;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSData hash](self->_errorData, "hash");
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 2);
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
        -[NPKProtoReserveStorageForAppletTypesResponse addReservationID:](self, "addReservationID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_isFull = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
    -[NPKProtoReserveStorageForAppletTypesResponse setErrorData:](self, "setErrorData:");

}

- (NSMutableArray)reservationIDs
{
  return self->_reservationIDs;
}

- (void)setReservationIDs:(id)a3
{
  objc_storeStrong((id *)&self->_reservationIDs, a3);
}

- (BOOL)isFull
{
  return self->_isFull;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationIDs, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
