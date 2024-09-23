@implementation NPKProtoHandlePaymentTransactionsRequest

- (void)clearTransactionsBytes
{
  -[NSMutableArray removeAllObjects](self->_transactionsBytes, "removeAllObjects");
}

- (void)addTransactionsBytes:(id)a3
{
  id v4;
  NSMutableArray *transactionsBytes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transactionsBytes = self->_transactionsBytes;
  v8 = v4;
  if (!transactionsBytes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_transactionsBytes;
    self->_transactionsBytes = v6;

    v4 = v8;
    transactionsBytes = self->_transactionsBytes;
  }
  -[NSMutableArray addObject:](transactionsBytes, "addObject:", v4);

}

- (unint64_t)transactionsBytesCount
{
  return -[NSMutableArray count](self->_transactionsBytes, "count");
}

- (id)transactionsBytesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transactionsBytes, "objectAtIndex:", a3);
}

+ (Class)transactionsBytesType
{
  return (Class)objc_opt_class();
}

- (void)clearTransactionPassIDs
{
  -[NSMutableArray removeAllObjects](self->_transactionPassIDs, "removeAllObjects");
}

- (void)addTransactionPassIDs:(id)a3
{
  id v4;
  NSMutableArray *transactionPassIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transactionPassIDs = self->_transactionPassIDs;
  v8 = v4;
  if (!transactionPassIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_transactionPassIDs;
    self->_transactionPassIDs = v6;

    v4 = v8;
    transactionPassIDs = self->_transactionPassIDs;
  }
  -[NSMutableArray addObject:](transactionPassIDs, "addObject:", v4);

}

- (unint64_t)transactionPassIDsCount
{
  return -[NSMutableArray count](self->_transactionPassIDs, "count");
}

- (id)transactionPassIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transactionPassIDs, "objectAtIndex:", a3);
}

+ (Class)transactionPassIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearPassAppletStates
{
  -[NSMutableArray removeAllObjects](self->_passAppletStates, "removeAllObjects");
}

- (void)addPassAppletStates:(id)a3
{
  id v4;
  NSMutableArray *passAppletStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  passAppletStates = self->_passAppletStates;
  v8 = v4;
  if (!passAppletStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_passAppletStates;
    self->_passAppletStates = v6;

    v4 = v8;
    passAppletStates = self->_passAppletStates;
  }
  -[NSMutableArray addObject:](passAppletStates, "addObject:", v4);

}

- (unint64_t)passAppletStatesCount
{
  return -[NSMutableArray count](self->_passAppletStates, "count");
}

- (id)passAppletStatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_passAppletStates, "objectAtIndex:", a3);
}

+ (Class)passAppletStatesType
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
  v8.super_class = (Class)NPKProtoHandlePaymentTransactionsRequest;
  -[NPKProtoHandlePaymentTransactionsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoHandlePaymentTransactionsRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *transactionsBytes;
  NSMutableArray *transactionPassIDs;
  NSMutableArray *passAppletStates;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  transactionsBytes = self->_transactionsBytes;
  if (transactionsBytes)
    objc_msgSend(v3, "setObject:forKey:", transactionsBytes, CFSTR("transactionsBytes"));
  transactionPassIDs = self->_transactionPassIDs;
  if (transactionPassIDs)
    objc_msgSend(v4, "setObject:forKey:", transactionPassIDs, CFSTR("transactionPassIDs"));
  passAppletStates = self->_passAppletStates;
  if (passAppletStates)
    objc_msgSend(v4, "setObject:forKey:", passAppletStates, CFSTR("passAppletStates"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoHandlePaymentTransactionsRequestReadFrom(self, (uint64_t)a3);
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

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_transactionsBytes;
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
        PBDataWriterWriteDataField();
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
  v10 = self->_transactionPassIDs;
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
        PBDataWriterWriteStringField();
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
  v15 = self->_passAppletStates;
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
        PBDataWriterWriteDataField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

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
  id v16;

  v16 = a3;
  if (-[NPKProtoHandlePaymentTransactionsRequest transactionsBytesCount](self, "transactionsBytesCount"))
  {
    objc_msgSend(v16, "clearTransactionsBytes");
    v4 = -[NPKProtoHandlePaymentTransactionsRequest transactionsBytesCount](self, "transactionsBytesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoHandlePaymentTransactionsRequest transactionsBytesAtIndex:](self, "transactionsBytesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addTransactionsBytes:", v7);

      }
    }
  }
  if (-[NPKProtoHandlePaymentTransactionsRequest transactionPassIDsCount](self, "transactionPassIDsCount"))
  {
    objc_msgSend(v16, "clearTransactionPassIDs");
    v8 = -[NPKProtoHandlePaymentTransactionsRequest transactionPassIDsCount](self, "transactionPassIDsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NPKProtoHandlePaymentTransactionsRequest transactionPassIDsAtIndex:](self, "transactionPassIDsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addTransactionPassIDs:", v11);

      }
    }
  }
  if (-[NPKProtoHandlePaymentTransactionsRequest passAppletStatesCount](self, "passAppletStatesCount"))
  {
    objc_msgSend(v16, "clearPassAppletStates");
    v12 = -[NPKProtoHandlePaymentTransactionsRequest passAppletStatesCount](self, "passAppletStatesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[NPKProtoHandlePaymentTransactionsRequest passAppletStatesAtIndex:](self, "passAppletStatesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addPassAppletStates:", v15);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
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
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = self->_transactionsBytes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addTransactionsBytes:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_transactionPassIDs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addTransactionPassIDs:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v14);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_passAppletStates;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addPassAppletStates:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *transactionsBytes;
  NSMutableArray *transactionPassIDs;
  NSMutableArray *passAppletStates;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((transactionsBytes = self->_transactionsBytes, !((unint64_t)transactionsBytes | v4[3]))
     || -[NSMutableArray isEqual:](transactionsBytes, "isEqual:"))
    && ((transactionPassIDs = self->_transactionPassIDs, !((unint64_t)transactionPassIDs | v4[2]))
     || -[NSMutableArray isEqual:](transactionPassIDs, "isEqual:")))
  {
    passAppletStates = self->_passAppletStates;
    if ((unint64_t)passAppletStates | v4[1])
      v8 = -[NSMutableArray isEqual:](passAppletStates, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableArray hash](self->_transactionsBytes, "hash");
  v4 = -[NSMutableArray hash](self->_transactionPassIDs, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_passAppletStates, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
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

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4[3];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
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
        -[NPKProtoHandlePaymentTransactionsRequest addTransactionsBytes:](self, "addTransactionsBytes:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4[2];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
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
        -[NPKProtoHandlePaymentTransactionsRequest addTransactionPassIDs:](self, "addTransactionPassIDs:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v4[1];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
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
        -[NPKProtoHandlePaymentTransactionsRequest addPassAppletStates:](self, "addPassAppletStates:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (NSMutableArray)transactionsBytes
{
  return self->_transactionsBytes;
}

- (void)setTransactionsBytes:(id)a3
{
  objc_storeStrong((id *)&self->_transactionsBytes, a3);
}

- (NSMutableArray)transactionPassIDs
{
  return self->_transactionPassIDs;
}

- (void)setTransactionPassIDs:(id)a3
{
  objc_storeStrong((id *)&self->_transactionPassIDs, a3);
}

- (NSMutableArray)passAppletStates
{
  return self->_passAppletStates;
}

- (void)setPassAppletStates:(id)a3
{
  objc_storeStrong((id *)&self->_passAppletStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsBytes, 0);
  objc_storeStrong((id *)&self->_transactionPassIDs, 0);
  objc_storeStrong((id *)&self->_passAppletStates, 0);
}

@end
