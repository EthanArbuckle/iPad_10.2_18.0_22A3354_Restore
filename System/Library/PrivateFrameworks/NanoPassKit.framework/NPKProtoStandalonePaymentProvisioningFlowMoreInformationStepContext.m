@implementation NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext

- (void)clearMoreInfoItems
{
  -[NSMutableArray removeAllObjects](self->_moreInfoItems, "removeAllObjects");
}

- (void)addMoreInfoItems:(id)a3
{
  id v4;
  NSMutableArray *moreInfoItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  moreInfoItems = self->_moreInfoItems;
  v8 = v4;
  if (!moreInfoItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_moreInfoItems;
    self->_moreInfoItems = v6;

    v4 = v8;
    moreInfoItems = self->_moreInfoItems;
  }
  -[NSMutableArray addObject:](moreInfoItems, "addObject:", v4);

}

- (unint64_t)moreInfoItemsCount
{
  return -[NSMutableArray count](self->_moreInfoItems, "count");
}

- (id)moreInfoItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_moreInfoItems, "objectAtIndex:", a3);
}

+ (Class)moreInfoItemsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPaymentPass
{
  return self->_paymentPass != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NPKProtoStandalonePaymentPass *paymentPass;
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
  if (-[NSMutableArray count](self->_moreInfoItems, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_moreInfoItems, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_moreInfoItems;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("moreInfoItems"));
  }
  paymentPass = self->_paymentPass;
  if (paymentPass)
  {
    -[NPKProtoStandalonePaymentPass dictionaryRepresentation](paymentPass, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("paymentPass"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContextReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  v5 = self->_moreInfoItems;
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

  if (self->_paymentPass)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext moreInfoItemsCount](self, "moreInfoItemsCount"))
  {
    objc_msgSend(v8, "clearMoreInfoItems");
    v4 = -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext moreInfoItemsCount](self, "moreInfoItemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext moreInfoItemsAtIndex:](self, "moreInfoItemsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addMoreInfoItems:", v7);

      }
    }
  }
  if (self->_paymentPass)
    objc_msgSend(v8, "setPaymentPass:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_moreInfoItems;
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
        objc_msgSend(v5, "addMoreInfoItems:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = -[NPKProtoStandalonePaymentPass copyWithZone:](self->_paymentPass, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *moreInfoItems;
  NPKProtoStandalonePaymentPass *paymentPass;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((moreInfoItems = self->_moreInfoItems, !((unint64_t)moreInfoItems | v4[1]))
     || -[NSMutableArray isEqual:](moreInfoItems, "isEqual:")))
  {
    paymentPass = self->_paymentPass;
    if ((unint64_t)paymentPass | v4[2])
      v7 = -[NPKProtoStandalonePaymentPass isEqual:](paymentPass, "isEqual:");
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

  v3 = -[NSMutableArray hash](self->_moreInfoItems, "hash");
  return -[NPKProtoStandalonePaymentPass hash](self->_paymentPass, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NPKProtoStandalonePaymentPass *paymentPass;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4[1];
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
        -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext addMoreInfoItems:](self, "addMoreInfoItems:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  paymentPass = self->_paymentPass;
  v11 = v4[2];
  if (paymentPass)
  {
    if (v11)
      -[NPKProtoStandalonePaymentPass mergeFrom:](paymentPass, "mergeFrom:");
  }
  else if (v11)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext setPaymentPass:](self, "setPaymentPass:");
  }

}

- (NSMutableArray)moreInfoItems
{
  return self->_moreInfoItems;
}

- (void)setMoreInfoItems:(id)a3
{
  objc_storeStrong((id *)&self->_moreInfoItems, a3);
}

- (NPKProtoStandalonePaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_moreInfoItems, 0);
}

@end
