@implementation NPKProtoStandalonePaymentDigitalIssuanceMetadata

- (BOOL)hasServiceProviderIdentifier
{
  return self->_serviceProviderIdentifier != 0;
}

- (BOOL)hasServiceProviderCountryCode
{
  return self->_serviceProviderCountryCode != 0;
}

- (void)clearServiceProviderAcceptedNetworks
{
  -[NSMutableArray removeAllObjects](self->_serviceProviderAcceptedNetworks, "removeAllObjects");
}

- (void)addServiceProviderAcceptedNetworks:(id)a3
{
  id v4;
  NSMutableArray *serviceProviderAcceptedNetworks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  serviceProviderAcceptedNetworks = self->_serviceProviderAcceptedNetworks;
  v8 = v4;
  if (!serviceProviderAcceptedNetworks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_serviceProviderAcceptedNetworks;
    self->_serviceProviderAcceptedNetworks = v6;

    v4 = v8;
    serviceProviderAcceptedNetworks = self->_serviceProviderAcceptedNetworks;
  }
  -[NSMutableArray addObject:](serviceProviderAcceptedNetworks, "addObject:", v4);

}

- (unint64_t)serviceProviderAcceptedNetworksCount
{
  return -[NSMutableArray count](self->_serviceProviderAcceptedNetworks, "count");
}

- (id)serviceProviderAcceptedNetworksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceProviderAcceptedNetworks, "objectAtIndex:", a3);
}

+ (Class)serviceProviderAcceptedNetworksType
{
  return (Class)objc_opt_class();
}

- (void)clearServiceProviderCapabilities
{
  -[NSMutableArray removeAllObjects](self->_serviceProviderCapabilities, "removeAllObjects");
}

- (void)addServiceProviderCapabilities:(id)a3
{
  id v4;
  NSMutableArray *serviceProviderCapabilities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  serviceProviderCapabilities = self->_serviceProviderCapabilities;
  v8 = v4;
  if (!serviceProviderCapabilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_serviceProviderCapabilities;
    self->_serviceProviderCapabilities = v6;

    v4 = v8;
    serviceProviderCapabilities = self->_serviceProviderCapabilities;
  }
  -[NSMutableArray addObject:](serviceProviderCapabilities, "addObject:", v4);

}

- (unint64_t)serviceProviderCapabilitiesCount
{
  return -[NSMutableArray count](self->_serviceProviderCapabilities, "count");
}

- (id)serviceProviderCapabilitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceProviderCapabilities, "objectAtIndex:", a3);
}

+ (Class)serviceProviderCapabilitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasServiceProviderDictJson
{
  return self->_serviceProviderDictJson != 0;
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (BOOL)hasMerchantID
{
  return self->_merchantID != 0;
}

- (void)clearDefaultSuggestions
{
  -[NSMutableArray removeAllObjects](self->_defaultSuggestions, "removeAllObjects");
}

- (void)addDefaultSuggestions:(id)a3
{
  id v4;
  NSMutableArray *defaultSuggestions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  defaultSuggestions = self->_defaultSuggestions;
  v8 = v4;
  if (!defaultSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_defaultSuggestions;
    self->_defaultSuggestions = v6;

    v4 = v8;
    defaultSuggestions = self->_defaultSuggestions;
  }
  -[NSMutableArray addObject:](defaultSuggestions, "addObject:", v4);

}

- (unint64_t)defaultSuggestionsCount
{
  return -[NSMutableArray count](self->_defaultSuggestions, "count");
}

- (id)defaultSuggestionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_defaultSuggestions, "objectAtIndex:", a3);
}

+ (Class)defaultSuggestionsType
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
  v8.super_class = (Class)NPKProtoStandalonePaymentDigitalIssuanceMetadata;
  -[NPKProtoStandalonePaymentDigitalIssuanceMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentDigitalIssuanceMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *serviceProviderIdentifier;
  NSString *serviceProviderCountryCode;
  NSMutableArray *serviceProviderAcceptedNetworks;
  NSMutableArray *serviceProviderCapabilities;
  NSString *serviceProviderDictJson;
  NSString *action;
  NSString *merchantID;
  NSMutableArray *defaultSuggestions;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  serviceProviderIdentifier = self->_serviceProviderIdentifier;
  if (serviceProviderIdentifier)
    objc_msgSend(v3, "setObject:forKey:", serviceProviderIdentifier, CFSTR("serviceProviderIdentifier"));
  serviceProviderCountryCode = self->_serviceProviderCountryCode;
  if (serviceProviderCountryCode)
    objc_msgSend(v4, "setObject:forKey:", serviceProviderCountryCode, CFSTR("serviceProviderCountryCode"));
  serviceProviderAcceptedNetworks = self->_serviceProviderAcceptedNetworks;
  if (serviceProviderAcceptedNetworks)
    objc_msgSend(v4, "setObject:forKey:", serviceProviderAcceptedNetworks, CFSTR("serviceProviderAcceptedNetworks"));
  serviceProviderCapabilities = self->_serviceProviderCapabilities;
  if (serviceProviderCapabilities)
    objc_msgSend(v4, "setObject:forKey:", serviceProviderCapabilities, CFSTR("serviceProviderCapabilities"));
  serviceProviderDictJson = self->_serviceProviderDictJson;
  if (serviceProviderDictJson)
    objc_msgSend(v4, "setObject:forKey:", serviceProviderDictJson, CFSTR("serviceProviderDictJson"));
  action = self->_action;
  if (action)
    objc_msgSend(v4, "setObject:forKey:", action, CFSTR("action"));
  merchantID = self->_merchantID;
  if (merchantID)
    objc_msgSend(v4, "setObject:forKey:", merchantID, CFSTR("merchantID"));
  defaultSuggestions = self->_defaultSuggestions;
  if (defaultSuggestions)
    objc_msgSend(v4, "setObject:forKey:", defaultSuggestions, CFSTR("defaultSuggestions"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentDigitalIssuanceMetadataReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_serviceProviderIdentifier)
    PBDataWriterWriteStringField();
  if (self->_serviceProviderCountryCode)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_serviceProviderAcceptedNetworks;
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
        PBDataWriterWriteStringField();
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
  v10 = self->_serviceProviderCapabilities;
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

  if (self->_serviceProviderDictJson)
    PBDataWriterWriteStringField();
  if (self->_action)
    PBDataWriterWriteStringField();
  if (self->_merchantID)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_defaultSuggestions;
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
        PBDataWriterWriteStringField();
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
  if (self->_serviceProviderIdentifier)
    objc_msgSend(v16, "setServiceProviderIdentifier:");
  if (self->_serviceProviderCountryCode)
    objc_msgSend(v16, "setServiceProviderCountryCode:");
  if (-[NPKProtoStandalonePaymentDigitalIssuanceMetadata serviceProviderAcceptedNetworksCount](self, "serviceProviderAcceptedNetworksCount"))
  {
    objc_msgSend(v16, "clearServiceProviderAcceptedNetworks");
    v4 = -[NPKProtoStandalonePaymentDigitalIssuanceMetadata serviceProviderAcceptedNetworksCount](self, "serviceProviderAcceptedNetworksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoStandalonePaymentDigitalIssuanceMetadata serviceProviderAcceptedNetworksAtIndex:](self, "serviceProviderAcceptedNetworksAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addServiceProviderAcceptedNetworks:", v7);

      }
    }
  }
  if (-[NPKProtoStandalonePaymentDigitalIssuanceMetadata serviceProviderCapabilitiesCount](self, "serviceProviderCapabilitiesCount"))
  {
    objc_msgSend(v16, "clearServiceProviderCapabilities");
    v8 = -[NPKProtoStandalonePaymentDigitalIssuanceMetadata serviceProviderCapabilitiesCount](self, "serviceProviderCapabilitiesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NPKProtoStandalonePaymentDigitalIssuanceMetadata serviceProviderCapabilitiesAtIndex:](self, "serviceProviderCapabilitiesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addServiceProviderCapabilities:", v11);

      }
    }
  }
  if (self->_serviceProviderDictJson)
    objc_msgSend(v16, "setServiceProviderDictJson:");
  if (self->_action)
    objc_msgSend(v16, "setAction:");
  if (self->_merchantID)
    objc_msgSend(v16, "setMerchantID:");
  if (-[NPKProtoStandalonePaymentDigitalIssuanceMetadata defaultSuggestionsCount](self, "defaultSuggestionsCount"))
  {
    objc_msgSend(v16, "clearDefaultSuggestions");
    v12 = -[NPKProtoStandalonePaymentDigitalIssuanceMetadata defaultSuggestionsCount](self, "defaultSuggestionsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[NPKProtoStandalonePaymentDigitalIssuanceMetadata defaultSuggestionsAtIndex:](self, "defaultSuggestionsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addDefaultSuggestions:", v15);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
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
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_serviceProviderIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  v8 = -[NSString copyWithZone:](self->_serviceProviderCountryCode, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v10 = self->_serviceProviderAcceptedNetworks;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addServiceProviderAcceptedNetworks:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v12);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = self->_serviceProviderCapabilities;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addServiceProviderCapabilities:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v18);
  }

  v22 = -[NSString copyWithZone:](self->_serviceProviderDictJson, "copyWithZone:", a3);
  v23 = (void *)v5[7];
  v5[7] = v22;

  v24 = -[NSString copyWithZone:](self->_action, "copyWithZone:", a3);
  v25 = (void *)v5[1];
  v5[1] = v24;

  v26 = -[NSString copyWithZone:](self->_merchantID, "copyWithZone:", a3);
  v27 = (void *)v5[3];
  v5[3] = v26;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self->_defaultSuggestions;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v32), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend(v5, "addDefaultSuggestions:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *serviceProviderIdentifier;
  NSString *serviceProviderCountryCode;
  NSMutableArray *serviceProviderAcceptedNetworks;
  NSMutableArray *serviceProviderCapabilities;
  NSString *serviceProviderDictJson;
  NSString *action;
  NSString *merchantID;
  NSMutableArray *defaultSuggestions;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((serviceProviderIdentifier = self->_serviceProviderIdentifier,
         !((unint64_t)serviceProviderIdentifier | v4[8]))
     || -[NSString isEqual:](serviceProviderIdentifier, "isEqual:"))
    && ((serviceProviderCountryCode = self->_serviceProviderCountryCode,
         !((unint64_t)serviceProviderCountryCode | v4[6]))
     || -[NSString isEqual:](serviceProviderCountryCode, "isEqual:"))
    && ((serviceProviderAcceptedNetworks = self->_serviceProviderAcceptedNetworks,
         !((unint64_t)serviceProviderAcceptedNetworks | v4[4]))
     || -[NSMutableArray isEqual:](serviceProviderAcceptedNetworks, "isEqual:"))
    && ((serviceProviderCapabilities = self->_serviceProviderCapabilities,
         !((unint64_t)serviceProviderCapabilities | v4[5]))
     || -[NSMutableArray isEqual:](serviceProviderCapabilities, "isEqual:"))
    && ((serviceProviderDictJson = self->_serviceProviderDictJson, !((unint64_t)serviceProviderDictJson | v4[7]))
     || -[NSString isEqual:](serviceProviderDictJson, "isEqual:"))
    && ((action = self->_action, !((unint64_t)action | v4[1]))
     || -[NSString isEqual:](action, "isEqual:"))
    && ((merchantID = self->_merchantID, !((unint64_t)merchantID | v4[3]))
     || -[NSString isEqual:](merchantID, "isEqual:")))
  {
    defaultSuggestions = self->_defaultSuggestions;
    if ((unint64_t)defaultSuggestions | v4[2])
      v13 = -[NSMutableArray isEqual:](defaultSuggestions, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_serviceProviderIdentifier, "hash");
  v4 = -[NSString hash](self->_serviceProviderCountryCode, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_serviceProviderAcceptedNetworks, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_serviceProviderCapabilities, "hash");
  v7 = -[NSString hash](self->_serviceProviderDictJson, "hash");
  v8 = v7 ^ -[NSString hash](self->_action, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_merchantID, "hash");
  return v9 ^ -[NSMutableArray hash](self->_defaultSuggestions, "hash");
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
  if (*((_QWORD *)v4 + 8))
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderIdentifier:](self, "setServiceProviderIdentifier:");
  if (*((_QWORD *)v4 + 6))
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderCountryCode:](self, "setServiceProviderCountryCode:");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[NPKProtoStandalonePaymentDigitalIssuanceMetadata addServiceProviderAcceptedNetworks:](self, "addServiceProviderAcceptedNetworks:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = *((id *)v4 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[NPKProtoStandalonePaymentDigitalIssuanceMetadata addServiceProviderCapabilities:](self, "addServiceProviderCapabilities:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 7))
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderDictJson:](self, "setServiceProviderDictJson:");
  if (*((_QWORD *)v4 + 1))
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setAction:](self, "setAction:");
  if (*((_QWORD *)v4 + 3))
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setMerchantID:](self, "setMerchantID:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v4 + 2);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NPKProtoStandalonePaymentDigitalIssuanceMetadata addDefaultSuggestions:](self, "addDefaultSuggestions:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, a3);
}

- (NSString)serviceProviderCountryCode
{
  return self->_serviceProviderCountryCode;
}

- (void)setServiceProviderCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderCountryCode, a3);
}

- (NSMutableArray)serviceProviderAcceptedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (void)setServiceProviderAcceptedNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderAcceptedNetworks, a3);
}

- (NSMutableArray)serviceProviderCapabilities
{
  return self->_serviceProviderCapabilities;
}

- (void)setServiceProviderCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderCapabilities, a3);
}

- (NSString)serviceProviderDictJson
{
  return self->_serviceProviderDictJson;
}

- (void)setServiceProviderDictJson:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderDictJson, a3);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (NSString)merchantID
{
  return self->_merchantID;
}

- (void)setMerchantID:(id)a3
{
  objc_storeStrong((id *)&self->_merchantID, a3);
}

- (NSMutableArray)defaultSuggestions
{
  return self->_defaultSuggestions;
}

- (void)setDefaultSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceProviderDictJson, 0);
  objc_storeStrong((id *)&self->_serviceProviderCountryCode, 0);
  objc_storeStrong((id *)&self->_serviceProviderCapabilities, 0);
  objc_storeStrong((id *)&self->_serviceProviderAcceptedNetworks, 0);
  objc_storeStrong((id *)&self->_merchantID, 0);
  objc_storeStrong((id *)&self->_defaultSuggestions, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
