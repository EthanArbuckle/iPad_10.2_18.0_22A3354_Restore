@implementation NNMKProtoFetchBatchRequest

- (void)setFullSyncVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fullSyncVersion = a3;
}

- (void)setHasFullSyncVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFullSyncVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearFetchRequests
{
  -[NSMutableArray removeAllObjects](self->_fetchRequests, "removeAllObjects");
}

- (void)addFetchRequest:(id)a3
{
  id v4;
  NSMutableArray *fetchRequests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fetchRequests = self->_fetchRequests;
  v8 = v4;
  if (!fetchRequests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_fetchRequests;
    self->_fetchRequests = v6;

    v4 = v8;
    fetchRequests = self->_fetchRequests;
  }
  -[NSMutableArray addObject:](fetchRequests, "addObject:", v4);

}

- (unint64_t)fetchRequestsCount
{
  return -[NSMutableArray count](self->_fetchRequests, "count");
}

- (id)fetchRequestAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fetchRequests, "objectAtIndex:", a3);
}

+ (Class)fetchRequestType
{
  return (Class)objc_opt_class();
}

- (void)setWantsBatchedResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_wantsBatchedResponse = a3;
}

- (void)setHasWantsBatchedResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWantsBatchedResponse
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoFetchBatchRequest;
  -[NNMKProtoFetchBatchRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoFetchBatchRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fullSyncVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("fullSyncVersion"));

  }
  if (-[NSMutableArray count](self->_fetchRequests, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fetchRequests, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_fetchRequests;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "dictionaryRepresentation", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("fetchRequest"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wantsBatchedResponse);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("wantsBatchedResponse"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoFetchBatchRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_fetchRequests;
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

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_fullSyncVersion;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  v9 = v4;
  if (-[NNMKProtoFetchBatchRequest fetchRequestsCount](self, "fetchRequestsCount"))
  {
    objc_msgSend(v9, "clearFetchRequests");
    v5 = -[NNMKProtoFetchBatchRequest fetchRequestsCount](self, "fetchRequestsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NNMKProtoFetchBatchRequest fetchRequestAtIndex:](self, "fetchRequestAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addFetchRequest:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9[20] = self->_wantsBatchedResponse;
    v9[24] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _BYTE *v6;
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

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_BYTE *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_fullSyncVersion;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_fetchRequests;
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
        objc_msgSend(v6, "addFetchRequest:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6[20] = self->_wantsBatchedResponse;
    v6[24] |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSMutableArray *fetchRequests;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 4))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_12;
  }
  fetchRequests = self->_fetchRequests;
  if ((unint64_t)fetchRequests | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](fetchRequests, "isEqual:"))
      goto LABEL_12;
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) != 0)
    {
      if (self->_wantsBatchedResponse)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_12;
      }
      else if (*((_BYTE *)v4 + 20))
      {
        goto LABEL_12;
      }
      v7 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_fullSyncVersion;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_fetchRequests, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_wantsBatchedResponse;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BOOL *v5;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (BOOL *)v4;
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 1);
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
        -[NNMKProtoFetchBatchRequest addFetchRequest:](self, "addFetchRequest:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((v5[24] & 2) != 0)
  {
    self->_wantsBatchedResponse = v5[20];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSMutableArray)fetchRequests
{
  return self->_fetchRequests;
}

- (void)setFetchRequests:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequests, a3);
}

- (BOOL)wantsBatchedResponse
{
  return self->_wantsBatchedResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequests, 0);
}

@end
