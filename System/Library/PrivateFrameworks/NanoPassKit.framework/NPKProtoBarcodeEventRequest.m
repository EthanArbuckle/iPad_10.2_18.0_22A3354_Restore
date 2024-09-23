@implementation NPKProtoBarcodeEventRequest

- (BOOL)hasRequestData
{
  return self->_requestData != 0;
}

- (void)clearAssociatedApplicationIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_associatedApplicationIdentifiers, "removeAllObjects");
}

- (void)addAssociatedApplicationIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *associatedApplicationIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
  v8 = v4;
  if (!associatedApplicationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_associatedApplicationIdentifiers;
    self->_associatedApplicationIdentifiers = v6;

    v4 = v8;
    associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
  }
  -[NSMutableArray addObject:](associatedApplicationIdentifiers, "addObject:", v4);

}

- (unint64_t)associatedApplicationIdentifiersCount
{
  return -[NSMutableArray count](self->_associatedApplicationIdentifiers, "count");
}

- (id)associatedApplicationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_associatedApplicationIdentifiers, "objectAtIndex:", a3);
}

+ (Class)associatedApplicationIdentifiersType
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
  v8.super_class = (Class)NPKProtoBarcodeEventRequest;
  -[NPKProtoBarcodeEventRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoBarcodeEventRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *requestData;
  NSMutableArray *associatedApplicationIdentifiers;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestData = self->_requestData;
  if (requestData)
    objc_msgSend(v3, "setObject:forKey:", requestData, CFSTR("requestData"));
  associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
  if (associatedApplicationIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", associatedApplicationIdentifiers, CFSTR("associatedApplicationIdentifiers"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoBarcodeEventRequestReadFrom(self, (uint64_t)a3);
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
  if (self->_requestData)
    PBDataWriterWriteDataField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_associatedApplicationIdentifiers;
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
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_requestData)
    objc_msgSend(v8, "setRequestData:");
  if (-[NPKProtoBarcodeEventRequest associatedApplicationIdentifiersCount](self, "associatedApplicationIdentifiersCount"))
  {
    objc_msgSend(v8, "clearAssociatedApplicationIdentifiers");
    v4 = -[NPKProtoBarcodeEventRequest associatedApplicationIdentifiersCount](self, "associatedApplicationIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoBarcodeEventRequest associatedApplicationIdentifiersAtIndex:](self, "associatedApplicationIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAssociatedApplicationIdentifiers:", v7);

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
  v6 = -[NSData copyWithZone:](self->_requestData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_associatedApplicationIdentifiers;
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
        objc_msgSend(v5, "addAssociatedApplicationIdentifiers:", v13);

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
  NSData *requestData;
  NSMutableArray *associatedApplicationIdentifiers;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestData = self->_requestData, !((unint64_t)requestData | v4[2]))
     || -[NSData isEqual:](requestData, "isEqual:")))
  {
    associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
    if ((unint64_t)associatedApplicationIdentifiers | v4[1])
      v7 = -[NSMutableArray isEqual:](associatedApplicationIdentifiers, "isEqual:");
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

  v3 = -[NSData hash](self->_requestData, "hash");
  return -[NSMutableArray hash](self->_associatedApplicationIdentifiers, "hash") ^ v3;
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
  if (*((_QWORD *)v4 + 2))
    -[NPKProtoBarcodeEventRequest setRequestData:](self, "setRequestData:");
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
        -[NPKProtoBarcodeEventRequest addAssociatedApplicationIdentifiers:](self, "addAssociatedApplicationIdentifiers:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (NSMutableArray)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
}

@end
