@implementation NPKProtoStandalonePaymentProvisioningMethodMetadata

- (BOOL)hasProductIdentifier
{
  return self->_productIdentifier != 0;
}

- (BOOL)hasCurrency
{
  return self->_currency != 0;
}

- (BOOL)hasDepositAmount
{
  return self->_depositAmount != 0;
}

- (BOOL)hasMinLoadedBalance
{
  return self->_minLoadedBalance != 0;
}

- (BOOL)hasMaxLoadedBalance
{
  return self->_maxLoadedBalance != 0;
}

- (void)clearRequiredFields
{
  -[NSMutableArray removeAllObjects](self->_requiredFields, "removeAllObjects");
}

- (void)addRequiredFields:(id)a3
{
  id v4;
  NSMutableArray *requiredFields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requiredFields = self->_requiredFields;
  v8 = v4;
  if (!requiredFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_requiredFields;
    self->_requiredFields = v6;

    v4 = v8;
    requiredFields = self->_requiredFields;
  }
  -[NSMutableArray addObject:](requiredFields, "addObject:", v4);

}

- (unint64_t)requiredFieldsCount
{
  return -[NSMutableArray count](self->_requiredFields, "count");
}

- (id)requiredFieldsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requiredFields, "objectAtIndex:", a3);
}

+ (Class)requiredFieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReaderModeMetadataJson
{
  return self->_readerModeMetadataJson != 0;
}

- (BOOL)hasDigitalIssuanceMetadata
{
  return self->_digitalIssuanceMetadata != 0;
}

- (BOOL)hasReaderModeResourcesJson
{
  return self->_readerModeResourcesJson != 0;
}

- (BOOL)hasMinimumReaderModeBalance
{
  return self->_minimumReaderModeBalance != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningMethodMetadata;
  -[NPKProtoStandalonePaymentProvisioningMethodMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningMethodMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *productIdentifier;
  NSString *currency;
  NSString *depositAmount;
  NSString *minLoadedBalance;
  NSString *maxLoadedBalance;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSString *readerModeMetadataJson;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *digitalIssuanceMetadata;
  void *v19;
  NSString *readerModeResourcesJson;
  NSString *minimumReaderModeBalance;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  productIdentifier = self->_productIdentifier;
  if (productIdentifier)
    objc_msgSend(v3, "setObject:forKey:", productIdentifier, CFSTR("productIdentifier"));
  currency = self->_currency;
  if (currency)
    objc_msgSend(v4, "setObject:forKey:", currency, CFSTR("currency"));
  depositAmount = self->_depositAmount;
  if (depositAmount)
    objc_msgSend(v4, "setObject:forKey:", depositAmount, CFSTR("depositAmount"));
  minLoadedBalance = self->_minLoadedBalance;
  if (minLoadedBalance)
    objc_msgSend(v4, "setObject:forKey:", minLoadedBalance, CFSTR("minLoadedBalance"));
  maxLoadedBalance = self->_maxLoadedBalance;
  if (maxLoadedBalance)
    objc_msgSend(v4, "setObject:forKey:", maxLoadedBalance, CFSTR("maxLoadedBalance"));
  if (-[NSMutableArray count](self->_requiredFields, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_requiredFields, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_requiredFields;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("requiredFields"));
  }
  readerModeMetadataJson = self->_readerModeMetadataJson;
  if (readerModeMetadataJson)
    objc_msgSend(v4, "setObject:forKey:", readerModeMetadataJson, CFSTR("readerModeMetadataJson"));
  digitalIssuanceMetadata = self->_digitalIssuanceMetadata;
  if (digitalIssuanceMetadata)
  {
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata dictionaryRepresentation](digitalIssuanceMetadata, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("digitalIssuanceMetadata"));

  }
  readerModeResourcesJson = self->_readerModeResourcesJson;
  if (readerModeResourcesJson)
    objc_msgSend(v4, "setObject:forKey:", readerModeResourcesJson, CFSTR("readerModeResourcesJson"));
  minimumReaderModeBalance = self->_minimumReaderModeBalance;
  if (minimumReaderModeBalance)
    objc_msgSend(v4, "setObject:forKey:", minimumReaderModeBalance, CFSTR("minimumReaderModeBalance"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningMethodMetadataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_productIdentifier)
    PBDataWriterWriteStringField();
  if (self->_currency)
    PBDataWriterWriteStringField();
  if (self->_depositAmount)
    PBDataWriterWriteStringField();
  if (self->_minLoadedBalance)
    PBDataWriterWriteStringField();
  if (self->_maxLoadedBalance)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_requiredFields;
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

  if (self->_readerModeMetadataJson)
    PBDataWriterWriteStringField();
  if (self->_digitalIssuanceMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_readerModeResourcesJson)
    PBDataWriterWriteStringField();
  if (self->_minimumReaderModeBalance)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_productIdentifier)
    objc_msgSend(v9, "setProductIdentifier:");
  if (self->_currency)
    objc_msgSend(v9, "setCurrency:");
  if (self->_depositAmount)
    objc_msgSend(v9, "setDepositAmount:");
  if (self->_minLoadedBalance)
    objc_msgSend(v9, "setMinLoadedBalance:");
  if (self->_maxLoadedBalance)
    objc_msgSend(v9, "setMaxLoadedBalance:");
  if (-[NPKProtoStandalonePaymentProvisioningMethodMetadata requiredFieldsCount](self, "requiredFieldsCount"))
  {
    objc_msgSend(v9, "clearRequiredFields");
    v4 = -[NPKProtoStandalonePaymentProvisioningMethodMetadata requiredFieldsCount](self, "requiredFieldsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoStandalonePaymentProvisioningMethodMetadata requiredFieldsAtIndex:](self, "requiredFieldsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRequiredFields:", v7);

      }
    }
  }
  if (self->_readerModeMetadataJson)
    objc_msgSend(v9, "setReaderModeMetadataJson:");
  v8 = v9;
  if (self->_digitalIssuanceMetadata)
  {
    objc_msgSend(v9, "setDigitalIssuanceMetadata:");
    v8 = v9;
  }
  if (self->_readerModeResourcesJson)
  {
    objc_msgSend(v9, "setReaderModeResourcesJson:");
    v8 = v9;
  }
  if (self->_minimumReaderModeBalance)
  {
    objc_msgSend(v9, "setMinimumReaderModeBalance:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_productIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_depositAmount, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_minLoadedBalance, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSString copyWithZone:](self->_maxLoadedBalance, "copyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = self->_requiredFields;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend(v5, "addRequiredFields:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v18);
  }

  v22 = -[NSString copyWithZone:](self->_readerModeMetadataJson, "copyWithZone:", a3);
  v23 = (void *)v5[8];
  v5[8] = v22;

  v24 = -[NPKProtoStandalonePaymentDigitalIssuanceMetadata copyWithZone:](self->_digitalIssuanceMetadata, "copyWithZone:", a3);
  v25 = (void *)v5[3];
  v5[3] = v24;

  v26 = -[NSString copyWithZone:](self->_readerModeResourcesJson, "copyWithZone:", a3);
  v27 = (void *)v5[9];
  v5[9] = v26;

  v28 = -[NSString copyWithZone:](self->_minimumReaderModeBalance, "copyWithZone:", a3);
  v29 = (void *)v5[6];
  v5[6] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *productIdentifier;
  NSString *currency;
  NSString *depositAmount;
  NSString *minLoadedBalance;
  NSString *maxLoadedBalance;
  NSMutableArray *requiredFields;
  NSString *readerModeMetadataJson;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *digitalIssuanceMetadata;
  NSString *readerModeResourcesJson;
  NSString *minimumReaderModeBalance;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  productIdentifier = self->_productIdentifier;
  if ((unint64_t)productIdentifier | v4[7])
  {
    if (!-[NSString isEqual:](productIdentifier, "isEqual:"))
      goto LABEL_22;
  }
  currency = self->_currency;
  if ((unint64_t)currency | v4[1] && !-[NSString isEqual:](currency, "isEqual:"))
    goto LABEL_22;
  if (((depositAmount = self->_depositAmount, !((unint64_t)depositAmount | v4[2]))
     || -[NSString isEqual:](depositAmount, "isEqual:"))
    && ((minLoadedBalance = self->_minLoadedBalance, !((unint64_t)minLoadedBalance | v4[5]))
     || -[NSString isEqual:](minLoadedBalance, "isEqual:"))
    && ((maxLoadedBalance = self->_maxLoadedBalance, !((unint64_t)maxLoadedBalance | v4[4]))
     || -[NSString isEqual:](maxLoadedBalance, "isEqual:"))
    && ((requiredFields = self->_requiredFields, !((unint64_t)requiredFields | v4[10]))
     || -[NSMutableArray isEqual:](requiredFields, "isEqual:"))
    && ((readerModeMetadataJson = self->_readerModeMetadataJson, !((unint64_t)readerModeMetadataJson | v4[8]))
     || -[NSString isEqual:](readerModeMetadataJson, "isEqual:"))
    && ((digitalIssuanceMetadata = self->_digitalIssuanceMetadata, !((unint64_t)digitalIssuanceMetadata | v4[3]))
     || -[NPKProtoStandalonePaymentDigitalIssuanceMetadata isEqual:](digitalIssuanceMetadata, "isEqual:"))
    && ((readerModeResourcesJson = self->_readerModeResourcesJson, !((unint64_t)readerModeResourcesJson | v4[9]))
     || -[NSString isEqual:](readerModeResourcesJson, "isEqual:")))
  {
    minimumReaderModeBalance = self->_minimumReaderModeBalance;
    if ((unint64_t)minimumReaderModeBalance | v4[6])
      v15 = -[NSString isEqual:](minimumReaderModeBalance, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  NSUInteger v11;

  v3 = -[NSString hash](self->_productIdentifier, "hash");
  v4 = -[NSString hash](self->_currency, "hash") ^ v3;
  v5 = -[NSString hash](self->_depositAmount, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_minLoadedBalance, "hash");
  v7 = -[NSString hash](self->_maxLoadedBalance, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_requiredFields, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_readerModeMetadataJson, "hash");
  v10 = -[NPKProtoStandalonePaymentDigitalIssuanceMetadata hash](self->_digitalIssuanceMetadata, "hash");
  v11 = v10 ^ -[NSString hash](self->_readerModeResourcesJson, "hash");
  return v9 ^ v11 ^ -[NSString hash](self->_minimumReaderModeBalance, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *digitalIssuanceMetadata;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setProductIdentifier:](self, "setProductIdentifier:");
  if (*((_QWORD *)v4 + 1))
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setCurrency:](self, "setCurrency:");
  if (*((_QWORD *)v4 + 2))
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setDepositAmount:](self, "setDepositAmount:");
  if (*((_QWORD *)v4 + 5))
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMinLoadedBalance:](self, "setMinLoadedBalance:");
  if (*((_QWORD *)v4 + 4))
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMaxLoadedBalance:](self, "setMaxLoadedBalance:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 10);
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
        -[NPKProtoStandalonePaymentProvisioningMethodMetadata addRequiredFields:](self, "addRequiredFields:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 8))
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setReaderModeMetadataJson:](self, "setReaderModeMetadataJson:");
  digitalIssuanceMetadata = self->_digitalIssuanceMetadata;
  v11 = *((_QWORD *)v4 + 3);
  if (digitalIssuanceMetadata)
  {
    if (v11)
      -[NPKProtoStandalonePaymentDigitalIssuanceMetadata mergeFrom:](digitalIssuanceMetadata, "mergeFrom:");
  }
  else if (v11)
  {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setDigitalIssuanceMetadata:](self, "setDigitalIssuanceMetadata:");
  }
  if (*((_QWORD *)v4 + 9))
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setReaderModeResourcesJson:](self, "setReaderModeResourcesJson:");
  if (*((_QWORD *)v4 + 6))
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMinimumReaderModeBalance:](self, "setMinimumReaderModeBalance:");

}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_productIdentifier, a3);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_currency, a3);
}

- (NSString)depositAmount
{
  return self->_depositAmount;
}

- (void)setDepositAmount:(id)a3
{
  objc_storeStrong((id *)&self->_depositAmount, a3);
}

- (NSString)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (void)setMinLoadedBalance:(id)a3
{
  objc_storeStrong((id *)&self->_minLoadedBalance, a3);
}

- (NSString)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (void)setMaxLoadedBalance:(id)a3
{
  objc_storeStrong((id *)&self->_maxLoadedBalance, a3);
}

- (NSMutableArray)requiredFields
{
  return self->_requiredFields;
}

- (void)setRequiredFields:(id)a3
{
  objc_storeStrong((id *)&self->_requiredFields, a3);
}

- (NSString)readerModeMetadataJson
{
  return self->_readerModeMetadataJson;
}

- (void)setReaderModeMetadataJson:(id)a3
{
  objc_storeStrong((id *)&self->_readerModeMetadataJson, a3);
}

- (NPKProtoStandalonePaymentDigitalIssuanceMetadata)digitalIssuanceMetadata
{
  return self->_digitalIssuanceMetadata;
}

- (void)setDigitalIssuanceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_digitalIssuanceMetadata, a3);
}

- (NSString)readerModeResourcesJson
{
  return self->_readerModeResourcesJson;
}

- (void)setReaderModeResourcesJson:(id)a3
{
  objc_storeStrong((id *)&self->_readerModeResourcesJson, a3);
}

- (NSString)minimumReaderModeBalance
{
  return self->_minimumReaderModeBalance;
}

- (void)setMinimumReaderModeBalance:(id)a3
{
  objc_storeStrong((id *)&self->_minimumReaderModeBalance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_readerModeResourcesJson, 0);
  objc_storeStrong((id *)&self->_readerModeMetadataJson, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_minimumReaderModeBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceMetadata, 0);
  objc_storeStrong((id *)&self->_depositAmount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
}

@end
