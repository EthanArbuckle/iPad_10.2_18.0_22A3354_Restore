@implementation NPKProtoStandalonePaymentSetupProduct

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)clearRegions
{
  -[NSMutableArray removeAllObjects](self->_regions, "removeAllObjects");
}

- (void)addRegions:(id)a3
{
  id v4;
  NSMutableArray *regions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  regions = self->_regions;
  v8 = v4;
  if (!regions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_regions;
    self->_regions = v6;

    v4 = v8;
    regions = self->_regions;
  }
  -[NSMutableArray addObject:](regions, "addObject:", v4);

}

- (unint64_t)regionsCount
{
  return -[NSMutableArray count](self->_regions, "count");
}

- (id)regionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_regions, "objectAtIndex:", a3);
}

+ (Class)regionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProductIdentifier
{
  return self->_productIdentifier != 0;
}

- (BOOL)hasPartnerIdentifier
{
  return self->_partnerIdentifier != 0;
}

- (BOOL)hasPartnerName
{
  return self->_partnerName != 0;
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

- (void)clearSupportedProtocols
{
  -[NSMutableArray removeAllObjects](self->_supportedProtocols, "removeAllObjects");
}

- (void)addSupportedProtocols:(id)a3
{
  id v4;
  NSMutableArray *supportedProtocols;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supportedProtocols = self->_supportedProtocols;
  v8 = v4;
  if (!supportedProtocols)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_supportedProtocols;
    self->_supportedProtocols = v6;

    v4 = v8;
    supportedProtocols = self->_supportedProtocols;
  }
  -[NSMutableArray addObject:](supportedProtocols, "addObject:", v4);

}

- (unint64_t)supportedProtocolsCount
{
  return -[NSMutableArray count](self->_supportedProtocols, "count");
}

- (id)supportedProtocolsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedProtocols, "objectAtIndex:", a3);
}

+ (Class)supportedProtocolsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTermsURL
{
  return self->_termsURL != 0;
}

- (void)setSupportedProvisioningMethods:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportedProvisioningMethods = a3;
}

- (void)setHasSupportedProvisioningMethods:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportedProvisioningMethods
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasReaderModeMetadataJson
{
  return self->_readerModeMetadataJson != 0;
}

- (void)setFlags:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlags
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHsa2Requirement:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hsa2Requirement = a3;
}

- (void)setHasHsa2Requirement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHsa2Requirement
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasImageAssetURLs
{
  return self->_imageAssetURLs != 0;
}

- (void)setSuppressPendingPurchases:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_suppressPendingPurchases = a3;
}

- (void)setHasSuppressPendingPurchases:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSuppressPendingPurchases
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearPaymentOptions
{
  -[NSMutableArray removeAllObjects](self->_paymentOptions, "removeAllObjects");
}

- (void)addPaymentOptions:(id)a3
{
  id v4;
  NSMutableArray *paymentOptions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  paymentOptions = self->_paymentOptions;
  v8 = v4;
  if (!paymentOptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_paymentOptions;
    self->_paymentOptions = v6;

    v4 = v8;
    paymentOptions = self->_paymentOptions;
  }
  -[NSMutableArray addObject:](paymentOptions, "addObject:", v4);

}

- (unint64_t)paymentOptionsCount
{
  return -[NSMutableArray count](self->_paymentOptions, "count");
}

- (id)paymentOptionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_paymentOptions, "objectAtIndex:", a3);
}

+ (Class)paymentOptionsType
{
  return (Class)objc_opt_class();
}

- (void)clearRequestedProvisioningMethods
{
  -[NSMutableArray removeAllObjects](self->_requestedProvisioningMethods, "removeAllObjects");
}

- (void)addRequestedProvisioningMethods:(id)a3
{
  id v4;
  NSMutableArray *requestedProvisioningMethods;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requestedProvisioningMethods = self->_requestedProvisioningMethods;
  v8 = v4;
  if (!requestedProvisioningMethods)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_requestedProvisioningMethods;
    self->_requestedProvisioningMethods = v6;

    v4 = v8;
    requestedProvisioningMethods = self->_requestedProvisioningMethods;
  }
  -[NSMutableArray addObject:](requestedProvisioningMethods, "addObject:", v4);

}

- (unint64_t)requestedProvisioningMethodsCount
{
  return -[NSMutableArray count](self->_requestedProvisioningMethods, "count");
}

- (id)requestedProvisioningMethodsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requestedProvisioningMethods, "objectAtIndex:", a3);
}

+ (Class)requestedProvisioningMethodsType
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
  v8.super_class = (Class)NPKProtoStandalonePaymentSetupProduct;
  -[NPKProtoStandalonePaymentSetupProduct description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupProduct dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *displayName;
  NSMutableArray *regions;
  NSString *productIdentifier;
  NSString *partnerIdentifier;
  NSString *partnerName;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *supportedProtocols;
  NSString *termsURL;
  void *v19;
  NSString *readerModeMetadataJson;
  char has;
  void *v22;
  void *v23;
  NPKProtoStandalonePaymentSetupProductImageAssetURLs *imageAssetURLs;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKey:", displayName, CFSTR("displayName"));
  regions = self->_regions;
  if (regions)
    objc_msgSend(v4, "setObject:forKey:", regions, CFSTR("regions"));
  productIdentifier = self->_productIdentifier;
  if (productIdentifier)
    objc_msgSend(v4, "setObject:forKey:", productIdentifier, CFSTR("productIdentifier"));
  partnerIdentifier = self->_partnerIdentifier;
  if (partnerIdentifier)
    objc_msgSend(v4, "setObject:forKey:", partnerIdentifier, CFSTR("partnerIdentifier"));
  partnerName = self->_partnerName;
  if (partnerName)
    objc_msgSend(v4, "setObject:forKey:", partnerName, CFSTR("partnerName"));
  if (-[NSMutableArray count](self->_requiredFields, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_requiredFields, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v11 = self->_requiredFields;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v51 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("requiredFields"));
  }
  supportedProtocols = self->_supportedProtocols;
  if (supportedProtocols)
    objc_msgSend(v4, "setObject:forKey:", supportedProtocols, CFSTR("supportedProtocols"));
  termsURL = self->_termsURL;
  if (termsURL)
    objc_msgSend(v4, "setObject:forKey:", termsURL, CFSTR("termsURL"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_supportedProvisioningMethods);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("supportedProvisioningMethods"));

  }
  readerModeMetadataJson = self->_readerModeMetadataJson;
  if (readerModeMetadataJson)
    objc_msgSend(v4, "setObject:forKey:", readerModeMetadataJson, CFSTR("readerModeMetadataJson"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_flags);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("flags"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_hsa2Requirement);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("hsa2Requirement"));

  }
  imageAssetURLs = self->_imageAssetURLs;
  if (imageAssetURLs)
  {
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs dictionaryRepresentation](imageAssetURLs, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("imageAssetURLs"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_suppressPendingPurchases);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("suppressPendingPurchases"));

  }
  if (-[NSMutableArray count](self->_paymentOptions, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_paymentOptions, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v28 = self->_paymentOptions;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v30);
    }

    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("paymentOptions"));
  }
  if (-[NSMutableArray count](self->_requestedProvisioningMethods, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_requestedProvisioningMethods, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = self->_requestedProvisioningMethods;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v43 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v42);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v37);
    }

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("requestedProvisioningMethods"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentSetupProductReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char has;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_displayName)
    PBDataWriterWriteStringField();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = self->_regions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v7);
  }

  if (self->_productIdentifier)
    PBDataWriterWriteStringField();
  if (self->_partnerIdentifier)
    PBDataWriterWriteStringField();
  if (self->_partnerName)
    PBDataWriterWriteStringField();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v10 = self->_requiredFields;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v12);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v15 = self->_supportedProtocols;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v17);
  }

  if (self->_termsURL)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_readerModeMetadataJson)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_imageAssetURLs)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = self->_paymentOptions;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    }
    while (v23);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = self->_requestedProvisioningMethods;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
    }
    while (v28);
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
  _QWORD *v16;
  char has;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
  void *v25;
  id v26;

  v26 = a3;
  if (self->_displayName)
    objc_msgSend(v26, "setDisplayName:");
  if (-[NPKProtoStandalonePaymentSetupProduct regionsCount](self, "regionsCount"))
  {
    objc_msgSend(v26, "clearRegions");
    v4 = -[NPKProtoStandalonePaymentSetupProduct regionsCount](self, "regionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoStandalonePaymentSetupProduct regionsAtIndex:](self, "regionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addRegions:", v7);

      }
    }
  }
  if (self->_productIdentifier)
    objc_msgSend(v26, "setProductIdentifier:");
  if (self->_partnerIdentifier)
    objc_msgSend(v26, "setPartnerIdentifier:");
  if (self->_partnerName)
    objc_msgSend(v26, "setPartnerName:");
  if (-[NPKProtoStandalonePaymentSetupProduct requiredFieldsCount](self, "requiredFieldsCount"))
  {
    objc_msgSend(v26, "clearRequiredFields");
    v8 = -[NPKProtoStandalonePaymentSetupProduct requiredFieldsCount](self, "requiredFieldsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NPKProtoStandalonePaymentSetupProduct requiredFieldsAtIndex:](self, "requiredFieldsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addRequiredFields:", v11);

      }
    }
  }
  if (-[NPKProtoStandalonePaymentSetupProduct supportedProtocolsCount](self, "supportedProtocolsCount"))
  {
    objc_msgSend(v26, "clearSupportedProtocols");
    v12 = -[NPKProtoStandalonePaymentSetupProduct supportedProtocolsCount](self, "supportedProtocolsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[NPKProtoStandalonePaymentSetupProduct supportedProtocolsAtIndex:](self, "supportedProtocolsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSupportedProtocols:", v15);

      }
    }
  }
  if (self->_termsURL)
    objc_msgSend(v26, "setTermsURL:");
  v16 = v26;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v26 + 3) = self->_supportedProvisioningMethods;
    *((_BYTE *)v26 + 132) |= 4u;
  }
  if (self->_readerModeMetadataJson)
  {
    objc_msgSend(v26, "setReaderModeMetadataJson:");
    v16 = v26;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v16[1] = self->_flags;
    *((_BYTE *)v16 + 132) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v16[2] = self->_hsa2Requirement;
    *((_BYTE *)v16 + 132) |= 2u;
  }
  if (self->_imageAssetURLs)
  {
    objc_msgSend(v26, "setImageAssetURLs:");
    v16 = v26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v16 + 128) = self->_suppressPendingPurchases;
    *((_BYTE *)v16 + 132) |= 8u;
  }
  if (-[NPKProtoStandalonePaymentSetupProduct paymentOptionsCount](self, "paymentOptionsCount"))
  {
    objc_msgSend(v26, "clearPaymentOptions");
    v18 = -[NPKProtoStandalonePaymentSetupProduct paymentOptionsCount](self, "paymentOptionsCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[NPKProtoStandalonePaymentSetupProduct paymentOptionsAtIndex:](self, "paymentOptionsAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addPaymentOptions:", v21);

      }
    }
  }
  if (-[NPKProtoStandalonePaymentSetupProduct requestedProvisioningMethodsCount](self, "requestedProvisioningMethodsCount"))
  {
    objc_msgSend(v26, "clearRequestedProvisioningMethods");
    v22 = -[NPKProtoStandalonePaymentSetupProduct requestedProvisioningMethodsCount](self, "requestedProvisioningMethodsCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
      {
        -[NPKProtoStandalonePaymentSetupProduct requestedProvisioningMethodsAtIndex:](self, "requestedProvisioningMethodsAtIndex:", n);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addRequestedProvisioningMethods:", v25);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char has;
  id v37;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  void *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v8 = self->_regions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v69 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRegions:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_productIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  v16 = -[NSString copyWithZone:](self->_partnerIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = -[NSString copyWithZone:](self->_partnerName, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v20 = self->_requiredFields;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v65 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRequiredFields:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v22);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v26 = self->_supportedProtocols;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v61 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSupportedProtocols:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    }
    while (v28);
  }

  v32 = -[NSString copyWithZone:](self->_termsURL, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v32;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_supportedProvisioningMethods;
    *(_BYTE *)(v5 + 132) |= 4u;
  }
  v34 = -[NSString copyWithZone:](self->_readerModeMetadataJson, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v34;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_flags;
    *(_BYTE *)(v5 + 132) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_hsa2Requirement;
    *(_BYTE *)(v5 + 132) |= 2u;
  }
  v37 = -[NPKProtoStandalonePaymentSetupProductImageAssetURLs copyWithZone:](self->_imageAssetURLs, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v37;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 128) = self->_suppressPendingPurchases;
    *(_BYTE *)(v5 + 132) |= 8u;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v39 = self->_paymentOptions;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v57;
    do
    {
      for (m = 0; m != v41; ++m)
      {
        if (*(_QWORD *)v57 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPaymentOptions:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    }
    while (v41);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v45 = self->_requestedProvisioningMethods;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v53;
    do
    {
      for (n = 0; n != v47; ++n)
      {
        if (*(_QWORD *)v53 != v48)
          objc_enumerationMutation(v45);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v52);
        objc_msgSend((id)v5, "addRequestedProvisioningMethods:", v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
    }
    while (v47);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  NSMutableArray *regions;
  NSString *productIdentifier;
  NSString *partnerIdentifier;
  NSString *partnerName;
  NSMutableArray *requiredFields;
  NSMutableArray *supportedProtocols;
  NSString *termsURL;
  char has;
  NSString *readerModeMetadataJson;
  NPKProtoStandalonePaymentSetupProductImageAssetURLs *imageAssetURLs;
  NSMutableArray *paymentOptions;
  NSMutableArray *requestedProvisioningMethods;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_51;
  }
  regions = self->_regions;
  if ((unint64_t)regions | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](regions, "isEqual:"))
      goto LABEL_51;
  }
  productIdentifier = self->_productIdentifier;
  if ((unint64_t)productIdentifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](productIdentifier, "isEqual:"))
      goto LABEL_51;
  }
  partnerIdentifier = self->_partnerIdentifier;
  if ((unint64_t)partnerIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](partnerIdentifier, "isEqual:"))
      goto LABEL_51;
  }
  partnerName = self->_partnerName;
  if ((unint64_t)partnerName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](partnerName, "isEqual:"))
      goto LABEL_51;
  }
  requiredFields = self->_requiredFields;
  if ((unint64_t)requiredFields | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](requiredFields, "isEqual:"))
      goto LABEL_51;
  }
  supportedProtocols = self->_supportedProtocols;
  if ((unint64_t)supportedProtocols | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](supportedProtocols, "isEqual:"))
      goto LABEL_51;
  }
  termsURL = self->_termsURL;
  if ((unint64_t)termsURL | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](termsURL, "isEqual:"))
      goto LABEL_51;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 4) == 0 || self->_supportedProvisioningMethods != *((_QWORD *)v4 + 3))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 132) & 4) != 0)
  {
    goto LABEL_51;
  }
  readerModeMetadataJson = self->_readerModeMetadataJson;
  if ((unint64_t)readerModeMetadataJson | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](readerModeMetadataJson, "isEqual:"))
      goto LABEL_51;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 1) == 0 || self->_flags != *((_QWORD *)v4 + 1))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 132) & 1) != 0)
  {
    goto LABEL_51;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 2) == 0 || self->_hsa2Requirement != *((_QWORD *)v4 + 2))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 132) & 2) != 0)
  {
    goto LABEL_51;
  }
  imageAssetURLs = self->_imageAssetURLs;
  if ((unint64_t)imageAssetURLs | *((_QWORD *)v4 + 5))
  {
    if (!-[NPKProtoStandalonePaymentSetupProductImageAssetURLs isEqual:](imageAssetURLs, "isEqual:"))
      goto LABEL_51;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 8) != 0)
    {
      if (self->_suppressPendingPurchases)
      {
        if (!*((_BYTE *)v4 + 128))
          goto LABEL_51;
        goto LABEL_47;
      }
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_47;
    }
LABEL_51:
    v18 = 0;
    goto LABEL_52;
  }
  if ((*((_BYTE *)v4 + 132) & 8) != 0)
    goto LABEL_51;
LABEL_47:
  paymentOptions = self->_paymentOptions;
  if ((unint64_t)paymentOptions | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](paymentOptions, "isEqual:"))
  {
    goto LABEL_51;
  }
  requestedProvisioningMethods = self->_requestedProvisioningMethods;
  if ((unint64_t)requestedProvisioningMethods | *((_QWORD *)v4 + 12))
    v18 = -[NSMutableArray isEqual:](requestedProvisioningMethods, "isEqual:");
  else
    v18 = 1;
LABEL_52:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  NSUInteger v18;

  v18 = -[NSString hash](self->_displayName, "hash");
  v17 = -[NSMutableArray hash](self->_regions, "hash");
  v16 = -[NSString hash](self->_productIdentifier, "hash");
  v15 = -[NSString hash](self->_partnerIdentifier, "hash");
  v14 = -[NSString hash](self->_partnerName, "hash");
  v3 = -[NSMutableArray hash](self->_requiredFields, "hash");
  v4 = -[NSMutableArray hash](self->_supportedProtocols, "hash");
  v5 = -[NSString hash](self->_termsURL, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_supportedProvisioningMethods;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_readerModeMetadataJson, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_flags;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v9 = 2654435761 * self->_hsa2Requirement;
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:
  v10 = -[NPKProtoStandalonePaymentSetupProductImageAssetURLs hash](self->_imageAssetURLs, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_suppressPendingPurchases;
  else
    v11 = 0;
  v12 = v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_paymentOptions, "hash");
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v12 ^ -[NSMutableArray hash](self->_requestedProvisioningMethods, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char v20;
  NPKProtoStandalonePaymentSetupProductImageAssetURLs *imageAssetURLs;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t n;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[NPKProtoStandalonePaymentSetupProduct setDisplayName:](self, "setDisplayName:");
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = *((id *)v4 + 11);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        -[NPKProtoStandalonePaymentSetupProduct addRegions:](self, "addRegions:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 9))
    -[NPKProtoStandalonePaymentSetupProduct setProductIdentifier:](self, "setProductIdentifier:");
  if (*((_QWORD *)v4 + 6))
    -[NPKProtoStandalonePaymentSetupProduct setPartnerIdentifier:](self, "setPartnerIdentifier:");
  if (*((_QWORD *)v4 + 7))
    -[NPKProtoStandalonePaymentSetupProduct setPartnerName:](self, "setPartnerName:");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = *((id *)v4 + 13);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v10);
        -[NPKProtoStandalonePaymentSetupProduct addRequiredFields:](self, "addRequiredFields:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    }
    while (v12);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = *((id *)v4 + 14);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v15);
        -[NPKProtoStandalonePaymentSetupProduct addSupportedProtocols:](self, "addSupportedProtocols:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v4 + 15))
    -[NPKProtoStandalonePaymentSetupProduct setTermsURL:](self, "setTermsURL:");
  if ((*((_BYTE *)v4 + 132) & 4) != 0)
  {
    self->_supportedProvisioningMethods = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 10))
    -[NPKProtoStandalonePaymentSetupProduct setReaderModeMetadataJson:](self, "setReaderModeMetadataJson:");
  v20 = *((_BYTE *)v4 + 132);
  if ((v20 & 1) != 0)
  {
    self->_flags = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v20 = *((_BYTE *)v4 + 132);
  }
  if ((v20 & 2) != 0)
  {
    self->_hsa2Requirement = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  imageAssetURLs = self->_imageAssetURLs;
  v22 = *((_QWORD *)v4 + 5);
  if (imageAssetURLs)
  {
    if (v22)
      -[NPKProtoStandalonePaymentSetupProductImageAssetURLs mergeFrom:](imageAssetURLs, "mergeFrom:");
  }
  else if (v22)
  {
    -[NPKProtoStandalonePaymentSetupProduct setImageAssetURLs:](self, "setImageAssetURLs:");
  }
  if ((*((_BYTE *)v4 + 132) & 8) != 0)
  {
    self->_suppressPendingPurchases = *((_BYTE *)v4 + 128);
    *(_BYTE *)&self->_has |= 8u;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = *((id *)v4 + 8);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v23);
        -[NPKProtoStandalonePaymentSetupProduct addPaymentOptions:](self, "addPaymentOptions:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * m));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
    }
    while (v25);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = *((id *)v4 + 12);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v34;
    do
    {
      for (n = 0; n != v30; ++n)
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(v28);
        -[NPKProtoStandalonePaymentSetupProduct addRequestedProvisioningMethods:](self, "addRequestedProvisioningMethods:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * n), (_QWORD)v33);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
    }
    while (v30);
  }

}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSMutableArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_storeStrong((id *)&self->_regions, a3);
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_productIdentifier, a3);
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_partnerIdentifier, a3);
}

- (NSString)partnerName
{
  return self->_partnerName;
}

- (void)setPartnerName:(id)a3
{
  objc_storeStrong((id *)&self->_partnerName, a3);
}

- (NSMutableArray)requiredFields
{
  return self->_requiredFields;
}

- (void)setRequiredFields:(id)a3
{
  objc_storeStrong((id *)&self->_requiredFields, a3);
}

- (NSMutableArray)supportedProtocols
{
  return self->_supportedProtocols;
}

- (void)setSupportedProtocols:(id)a3
{
  objc_storeStrong((id *)&self->_supportedProtocols, a3);
}

- (NSString)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_storeStrong((id *)&self->_termsURL, a3);
}

- (int64_t)supportedProvisioningMethods
{
  return self->_supportedProvisioningMethods;
}

- (NSString)readerModeMetadataJson
{
  return self->_readerModeMetadataJson;
}

- (void)setReaderModeMetadataJson:(id)a3
{
  objc_storeStrong((id *)&self->_readerModeMetadataJson, a3);
}

- (int64_t)flags
{
  return self->_flags;
}

- (int64_t)hsa2Requirement
{
  return self->_hsa2Requirement;
}

- (NPKProtoStandalonePaymentSetupProductImageAssetURLs)imageAssetURLs
{
  return self->_imageAssetURLs;
}

- (void)setImageAssetURLs:(id)a3
{
  objc_storeStrong((id *)&self->_imageAssetURLs, a3);
}

- (BOOL)suppressPendingPurchases
{
  return self->_suppressPendingPurchases;
}

- (NSMutableArray)paymentOptions
{
  return self->_paymentOptions;
}

- (void)setPaymentOptions:(id)a3
{
  objc_storeStrong((id *)&self->_paymentOptions, a3);
}

- (NSMutableArray)requestedProvisioningMethods
{
  return self->_requestedProvisioningMethods;
}

- (void)setRequestedProvisioningMethods:(id)a3
{
  objc_storeStrong((id *)&self->_requestedProvisioningMethods, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_supportedProtocols, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_requestedProvisioningMethods, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_readerModeMetadataJson, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentOptions, 0);
  objc_storeStrong((id *)&self->_partnerName, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_imageAssetURLs, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
