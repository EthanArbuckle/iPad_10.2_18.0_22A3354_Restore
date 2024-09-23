@implementation NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest

- (void)clearChosenPaymentCredentialIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_chosenPaymentCredentialIdentifiers, "removeAllObjects");
}

- (void)addChosenPaymentCredentialIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *chosenPaymentCredentialIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  chosenPaymentCredentialIdentifiers = self->_chosenPaymentCredentialIdentifiers;
  v8 = v4;
  if (!chosenPaymentCredentialIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_chosenPaymentCredentialIdentifiers;
    self->_chosenPaymentCredentialIdentifiers = v6;

    v4 = v8;
    chosenPaymentCredentialIdentifiers = self->_chosenPaymentCredentialIdentifiers;
  }
  -[NSMutableArray addObject:](chosenPaymentCredentialIdentifiers, "addObject:", v4);

}

- (unint64_t)chosenPaymentCredentialIdentifiersCount
{
  return -[NSMutableArray count](self->_chosenPaymentCredentialIdentifiers, "count");
}

- (id)chosenPaymentCredentialIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_chosenPaymentCredentialIdentifiers, "objectAtIndex:", a3);
}

+ (Class)chosenPaymentCredentialIdentifiersType
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest;
  -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandaloneRequestHeader *requestHeader;
  void *v5;
  NSMutableArray *chosenPaymentCredentialIdentifiers;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    -[NPKProtoStandaloneRequestHeader dictionaryRepresentation](requestHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestHeader"));

  }
  chosenPaymentCredentialIdentifiers = self->_chosenPaymentCredentialIdentifiers;
  if (chosenPaymentCredentialIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", chosenPaymentCredentialIdentifiers, CFSTR("chosenPaymentCredentialIdentifiers"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
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
  if (!self->_requestHeader)
    -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_chosenPaymentCredentialIdentifiers;
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
  objc_msgSend(v8, "setRequestHeader:", self->_requestHeader);
  if (-[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest chosenPaymentCredentialIdentifiersCount](self, "chosenPaymentCredentialIdentifiersCount"))
  {
    objc_msgSend(v8, "clearChosenPaymentCredentialIdentifiers");
    v4 = -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest chosenPaymentCredentialIdentifiersCount](self, "chosenPaymentCredentialIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest chosenPaymentCredentialIdentifiersAtIndex:](self, "chosenPaymentCredentialIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addChosenPaymentCredentialIdentifiers:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
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
  v6 = -[NPKProtoStandaloneRequestHeader copyWithZone:](self->_requestHeader, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_chosenPaymentCredentialIdentifiers;
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
        objc_msgSend(v5, "addChosenPaymentCredentialIdentifiers:", v13);

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
  NPKProtoStandaloneRequestHeader *requestHeader;
  NSMutableArray *chosenPaymentCredentialIdentifiers;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestHeader = self->_requestHeader, !((unint64_t)requestHeader | v4[2]))
     || -[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:")))
  {
    chosenPaymentCredentialIdentifiers = self->_chosenPaymentCredentialIdentifiers;
    if ((unint64_t)chosenPaymentCredentialIdentifiers | v4[1])
      v7 = -[NSMutableArray isEqual:](chosenPaymentCredentialIdentifiers, "isEqual:");
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
  unint64_t v3;

  v3 = -[NPKProtoStandaloneRequestHeader hash](self->_requestHeader, "hash");
  return -[NSMutableArray hash](self->_chosenPaymentCredentialIdentifiers, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  requestHeader = self->_requestHeader;
  v6 = *((_QWORD *)v4 + 2);
  if (requestHeader)
  {
    if (v6)
      -[NPKProtoStandaloneRequestHeader mergeFrom:](requestHeader, "mergeFrom:");
  }
  else if (v6)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest setRequestHeader:](self, "setRequestHeader:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest addChosenPaymentCredentialIdentifiers:](self, "addChosenPaymentCredentialIdentifiers:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NPKProtoStandaloneRequestHeader)requestHeader
{
  return self->_requestHeader;
}

- (void)setRequestHeader:(id)a3
{
  objc_storeStrong((id *)&self->_requestHeader, a3);
}

- (NSMutableArray)chosenPaymentCredentialIdentifiers
{
  return self->_chosenPaymentCredentialIdentifiers;
}

- (void)setChosenPaymentCredentialIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_chosenPaymentCredentialIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_chosenPaymentCredentialIdentifiers, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest.m", 124, "self->_requestHeader != nil");
}

@end
