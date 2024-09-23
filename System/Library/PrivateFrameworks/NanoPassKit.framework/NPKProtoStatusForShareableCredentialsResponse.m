@implementation NPKProtoStatusForShareableCredentialsResponse

- (id)aggregateStatusAsString:(int)a3
{
  if (a3 < 5)
    return off_24CFE7F68[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAggregateStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Available")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Consumed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Revoked")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Expired")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearUpdatedCredentialsDatas
{
  -[NSMutableArray removeAllObjects](self->_updatedCredentialsDatas, "removeAllObjects");
}

- (void)addUpdatedCredentialsData:(id)a3
{
  id v4;
  NSMutableArray *updatedCredentialsDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  updatedCredentialsDatas = self->_updatedCredentialsDatas;
  v8 = v4;
  if (!updatedCredentialsDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_updatedCredentialsDatas;
    self->_updatedCredentialsDatas = v6;

    v4 = v8;
    updatedCredentialsDatas = self->_updatedCredentialsDatas;
  }
  -[NSMutableArray addObject:](updatedCredentialsDatas, "addObject:", v4);

}

- (unint64_t)updatedCredentialsDatasCount
{
  return -[NSMutableArray count](self->_updatedCredentialsDatas, "count");
}

- (id)updatedCredentialsDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_updatedCredentialsDatas, "objectAtIndex:", a3);
}

+ (Class)updatedCredentialsDataType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)NPKProtoStatusForShareableCredentialsResponse;
  -[NPKProtoStatusForShareableCredentialsResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStatusForShareableCredentialsResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t aggregateStatus;
  __CFString *v5;
  NSMutableArray *updatedCredentialsDatas;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aggregateStatus = self->_aggregateStatus;
  if (aggregateStatus >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_aggregateStatus);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24CFE7F68[aggregateStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("aggregateStatus"));

  updatedCredentialsDatas = self->_updatedCredentialsDatas;
  if (updatedCredentialsDatas)
    objc_msgSend(v3, "setObject:forKey:", updatedCredentialsDatas, CFSTR("updatedCredentialsData"));
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStatusForShareableCredentialsResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_updatedCredentialsDatas;
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

  if (self->_errorData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;

  v8 = a3;
  v8[2] = self->_aggregateStatus;
  if (-[NPKProtoStatusForShareableCredentialsResponse updatedCredentialsDatasCount](self, "updatedCredentialsDatasCount"))
  {
    objc_msgSend(v8, "clearUpdatedCredentialsDatas");
    v4 = -[NPKProtoStatusForShareableCredentialsResponse updatedCredentialsDatasCount](self, "updatedCredentialsDatasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoStatusForShareableCredentialsResponse updatedCredentialsDataAtIndex:](self, "updatedCredentialsDataAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addUpdatedCredentialsData:", v7);

      }
    }
  }
  if (self->_errorData)
    objc_msgSend(v8, "setErrorData:");

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
  *(_DWORD *)(v5 + 8) = self->_aggregateStatus;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_updatedCredentialsDatas;
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
        objc_msgSend((id)v5, "addUpdatedCredentialsData:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *updatedCredentialsDatas;
  NSData *errorData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_aggregateStatus == *((_DWORD *)v4 + 2)
    && ((updatedCredentialsDatas = self->_updatedCredentialsDatas, !((unint64_t)updatedCredentialsDatas | v4[3]))
     || -[NSMutableArray isEqual:](updatedCredentialsDatas, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[2])
      v7 = -[NSData isEqual:](errorData, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = 2654435761 * self->_aggregateStatus;
  v4 = -[NSMutableArray hash](self->_updatedCredentialsDatas, "hash");
  return v4 ^ -[NSData hash](self->_errorData, "hash") ^ v3;
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
  self->_aggregateStatus = *((_DWORD *)v4 + 2);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 3);
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
        -[NPKProtoStatusForShareableCredentialsResponse addUpdatedCredentialsData:](self, "addUpdatedCredentialsData:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 2))
    -[NPKProtoStatusForShareableCredentialsResponse setErrorData:](self, "setErrorData:");

}

- (int)aggregateStatus
{
  return self->_aggregateStatus;
}

- (void)setAggregateStatus:(int)a3
{
  self->_aggregateStatus = a3;
}

- (NSMutableArray)updatedCredentialsDatas
{
  return self->_updatedCredentialsDatas;
}

- (void)setUpdatedCredentialsDatas:(id)a3
{
  objc_storeStrong((id *)&self->_updatedCredentialsDatas, a3);
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
  objc_storeStrong((id *)&self->_updatedCredentialsDatas, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
