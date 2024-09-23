@implementation NPKProtoMarkPaymentPassForDeleteRequest

- (void)clearPaymentApplicationAIDs
{
  -[NSMutableArray removeAllObjects](self->_paymentApplicationAIDs, "removeAllObjects");
}

- (void)addPaymentApplicationAIDs:(id)a3
{
  id v4;
  NSMutableArray *paymentApplicationAIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  paymentApplicationAIDs = self->_paymentApplicationAIDs;
  v8 = v4;
  if (!paymentApplicationAIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_paymentApplicationAIDs;
    self->_paymentApplicationAIDs = v6;

    v4 = v8;
    paymentApplicationAIDs = self->_paymentApplicationAIDs;
  }
  -[NSMutableArray addObject:](paymentApplicationAIDs, "addObject:", v4);

}

- (unint64_t)paymentApplicationAIDsCount
{
  return -[NSMutableArray count](self->_paymentApplicationAIDs, "count");
}

- (id)paymentApplicationAIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_paymentApplicationAIDs, "objectAtIndex:", a3);
}

+ (Class)paymentApplicationAIDsType
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
  v8.super_class = (Class)NPKProtoMarkPaymentPassForDeleteRequest;
  -[NPKProtoMarkPaymentPassForDeleteRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoMarkPaymentPassForDeleteRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passID;
  NSMutableArray *paymentApplicationAIDs;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passID = self->_passID;
  if (passID)
    objc_msgSend(v3, "setObject:forKey:", passID, CFSTR("passID"));
  paymentApplicationAIDs = self->_paymentApplicationAIDs;
  if (paymentApplicationAIDs)
    objc_msgSend(v4, "setObject:forKey:", paymentApplicationAIDs, CFSTR("paymentApplicationAIDs"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoMarkPaymentPassForDeleteRequestReadFrom(self, (uint64_t)a3);
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

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_passID)
    -[NPKProtoMarkPaymentPassForDeleteRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_paymentApplicationAIDs;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setPassID:", self->_passID);
  if (-[NPKProtoMarkPaymentPassForDeleteRequest paymentApplicationAIDsCount](self, "paymentApplicationAIDsCount"))
  {
    objc_msgSend(v8, "clearPaymentApplicationAIDs");
    v4 = -[NPKProtoMarkPaymentPassForDeleteRequest paymentApplicationAIDsCount](self, "paymentApplicationAIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoMarkPaymentPassForDeleteRequest paymentApplicationAIDsAtIndex:](self, "paymentApplicationAIDsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addPaymentApplicationAIDs:", v7);

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
  v6 = -[NSString copyWithZone:](self->_passID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_paymentApplicationAIDs;
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
        objc_msgSend(v5, "addPaymentApplicationAIDs:", v13);

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
  NSString *passID;
  NSMutableArray *paymentApplicationAIDs;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((passID = self->_passID, !((unint64_t)passID | v4[1]))
     || -[NSString isEqual:](passID, "isEqual:")))
  {
    paymentApplicationAIDs = self->_paymentApplicationAIDs;
    if ((unint64_t)paymentApplicationAIDs | v4[2])
      v7 = -[NSMutableArray isEqual:](paymentApplicationAIDs, "isEqual:");
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

  v3 = -[NSString hash](self->_passID, "hash");
  return -[NSMutableArray hash](self->_paymentApplicationAIDs, "hash") ^ v3;
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
    -[NPKProtoMarkPaymentPassForDeleteRequest setPassID:](self, "setPassID:");
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
        -[NPKProtoMarkPaymentPassForDeleteRequest addPaymentApplicationAIDs:](self, "addPaymentApplicationAIDs:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
  objc_storeStrong((id *)&self->_passID, a3);
}

- (NSMutableArray)paymentApplicationAIDs
{
  return self->_paymentApplicationAIDs;
}

- (void)setPaymentApplicationAIDs:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplicationAIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplicationAIDs, 0);
  objc_storeStrong((id *)&self->_passID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoMarkPaymentPassForDeleteRequest writeTo:]", "NPKProtoMarkPaymentPassForDeleteRequest.m", 110, "nil != self->_passID");
}

@end
