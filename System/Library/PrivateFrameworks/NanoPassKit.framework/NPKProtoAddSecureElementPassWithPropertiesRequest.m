@implementation NPKProtoAddSecureElementPassWithPropertiesRequest

- (BOOL)hasPassUniqueID
{
  return self->_passUniqueID != 0;
}

- (void)clearPayloadDatas
{
  -[NSMutableArray removeAllObjects](self->_payloadDatas, "removeAllObjects");
}

- (void)addPayloadData:(id)a3
{
  id v4;
  NSMutableArray *payloadDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  payloadDatas = self->_payloadDatas;
  v8 = v4;
  if (!payloadDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_payloadDatas;
    self->_payloadDatas = v6;

    v4 = v8;
    payloadDatas = self->_payloadDatas;
  }
  -[NSMutableArray addObject:](payloadDatas, "addObject:", v4);

}

- (unint64_t)payloadDatasCount
{
  return -[NSMutableArray count](self->_payloadDatas, "count");
}

- (id)payloadDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_payloadDatas, "objectAtIndex:", a3);
}

+ (Class)payloadDataType
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAddSecureElementPassWithPropertiesRequest;
  -[NPKProtoAddSecureElementPassWithPropertiesRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoAddSecureElementPassWithPropertiesRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passUniqueID;
  NSMutableArray *payloadDatas;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passUniqueID = self->_passUniqueID;
  if (passUniqueID)
    objc_msgSend(v3, "setObject:forKey:", passUniqueID, CFSTR("passUniqueID"));
  payloadDatas = self->_payloadDatas;
  if (payloadDatas)
    objc_msgSend(v4, "setObject:forKey:", payloadDatas, CFSTR("payloadData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAddSecureElementPassWithPropertiesRequestReadFrom(self, (uint64_t)a3);
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
  if (self->_passUniqueID)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_payloadDatas;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_passUniqueID)
    objc_msgSend(v8, "setPassUniqueID:");
  if (-[NPKProtoAddSecureElementPassWithPropertiesRequest payloadDatasCount](self, "payloadDatasCount"))
  {
    objc_msgSend(v8, "clearPayloadDatas");
    v4 = -[NPKProtoAddSecureElementPassWithPropertiesRequest payloadDatasCount](self, "payloadDatasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoAddSecureElementPassWithPropertiesRequest payloadDataAtIndex:](self, "payloadDataAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addPayloadData:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passUniqueID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_payloadDatas;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addPayloadData:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *passUniqueID;
  NSMutableArray *payloadDatas;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((passUniqueID = self->_passUniqueID, !((unint64_t)passUniqueID | v4[1]))
     || -[NSString isEqual:](passUniqueID, "isEqual:")))
  {
    payloadDatas = self->_payloadDatas;
    if ((unint64_t)payloadDatas | v4[2])
      v7 = -[NSMutableArray isEqual:](payloadDatas, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_passUniqueID, "hash");
  return -[NSMutableArray hash](self->_payloadDatas, "hash") ^ v3;
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
  if (*((_QWORD *)v4 + 1))
    -[NPKProtoAddSecureElementPassWithPropertiesRequest setPassUniqueID:](self, "setPassUniqueID:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        -[NPKProtoAddSecureElementPassWithPropertiesRequest addPayloadData:](self, "addPayloadData:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueID, a3);
}

- (NSMutableArray)payloadDatas
{
  return self->_payloadDatas;
}

- (void)setPayloadDatas:(id)a3
{
  objc_storeStrong((id *)&self->_payloadDatas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDatas, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

@end
