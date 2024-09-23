@implementation NTPBExternalAnalyticsConfig

- (BOOL)hasAnalyticsBaseUrl
{
  return self->_analyticsBaseUrl != 0;
}

- (BOOL)hasAnalyticsId
{
  return self->_analyticsId != 0;
}

- (BOOL)hasEventQueryParameterName
{
  return self->_eventQueryParameterName != 0;
}

- (void)clearQueryParameterConfigs
{
  -[NSMutableArray removeAllObjects](self->_queryParameterConfigs, "removeAllObjects");
}

- (void)addQueryParameterConfig:(id)a3
{
  id v4;
  NSMutableArray *queryParameterConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  queryParameterConfigs = self->_queryParameterConfigs;
  v8 = v4;
  if (!queryParameterConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_queryParameterConfigs;
    self->_queryParameterConfigs = v6;

    v4 = v8;
    queryParameterConfigs = self->_queryParameterConfigs;
  }
  -[NSMutableArray addObject:](queryParameterConfigs, "addObject:", v4);

}

- (unint64_t)queryParameterConfigsCount
{
  return -[NSMutableArray count](self->_queryParameterConfigs, "count");
}

- (id)queryParameterConfigAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_queryParameterConfigs, "objectAtIndex:", a3);
}

+ (Class)queryParameterConfigType
{
  return (Class)objc_opt_class();
}

- (void)setUsesProxyProfile:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_usesProxyProfile = a3;
}

- (void)setHasUsesProxyProfile:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUsesProxyProfile
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearProxyHostNames
{
  -[NSMutableArray removeAllObjects](self->_proxyHostNames, "removeAllObjects");
}

- (void)addProxyHostNames:(id)a3
{
  id v4;
  NSMutableArray *proxyHostNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  proxyHostNames = self->_proxyHostNames;
  v8 = v4;
  if (!proxyHostNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_proxyHostNames;
    self->_proxyHostNames = v6;

    v4 = v8;
    proxyHostNames = self->_proxyHostNames;
  }
  -[NSMutableArray addObject:](proxyHostNames, "addObject:", v4);

}

- (unint64_t)proxyHostNamesCount
{
  return -[NSMutableArray count](self->_proxyHostNames, "count");
}

- (id)proxyHostNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_proxyHostNames, "objectAtIndex:", a3);
}

+ (Class)proxyHostNamesType
{
  return (Class)objc_opt_class();
}

- (void)clearVpnProfileNames
{
  -[NSMutableArray removeAllObjects](self->_vpnProfileNames, "removeAllObjects");
}

- (void)addVpnProfileNames:(id)a3
{
  id v4;
  NSMutableArray *vpnProfileNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  vpnProfileNames = self->_vpnProfileNames;
  v8 = v4;
  if (!vpnProfileNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_vpnProfileNames;
    self->_vpnProfileNames = v6;

    v4 = v8;
    vpnProfileNames = self->_vpnProfileNames;
  }
  -[NSMutableArray addObject:](vpnProfileNames, "addObject:", v4);

}

- (unint64_t)vpnProfileNamesCount
{
  return -[NSMutableArray count](self->_vpnProfileNames, "count");
}

- (id)vpnProfileNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_vpnProfileNames, "objectAtIndex:", a3);
}

+ (Class)vpnProfileNamesType
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
  v8.super_class = (Class)NTPBExternalAnalyticsConfig;
  -[NTPBExternalAnalyticsConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBExternalAnalyticsConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *analyticsBaseUrl;
  NSString *analyticsId;
  NSString *eventQueryParameterName;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *proxyHostNames;
  NSMutableArray *vpnProfileNames;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  analyticsBaseUrl = self->_analyticsBaseUrl;
  if (analyticsBaseUrl)
    objc_msgSend(v3, "setObject:forKey:", analyticsBaseUrl, CFSTR("analytics_base_url"));
  analyticsId = self->_analyticsId;
  if (analyticsId)
    objc_msgSend(v4, "setObject:forKey:", analyticsId, CFSTR("analytics_id"));
  eventQueryParameterName = self->_eventQueryParameterName;
  if (eventQueryParameterName)
    objc_msgSend(v4, "setObject:forKey:", eventQueryParameterName, CFSTR("event_query_parameter_name"));
  if (-[NSMutableArray count](self->_queryParameterConfigs, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_queryParameterConfigs, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = self->_queryParameterConfigs;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("query_parameter_config"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_usesProxyProfile);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("uses_proxy_profile"));

  }
  proxyHostNames = self->_proxyHostNames;
  if (proxyHostNames)
    objc_msgSend(v4, "setObject:forKey:", proxyHostNames, CFSTR("proxy_host_names"));
  vpnProfileNames = self->_vpnProfileNames;
  if (vpnProfileNames)
    objc_msgSend(v4, "setObject:forKey:", vpnProfileNames, CFSTR("vpn_profile_names"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBExternalAnalyticsConfigReadFrom(self, (uint64_t)a3);
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
  if (self->_analyticsBaseUrl)
    PBDataWriterWriteStringField();
  if (self->_analyticsId)
    PBDataWriterWriteStringField();
  if (self->_eventQueryParameterName)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_queryParameterConfigs;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_proxyHostNames;
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
  v15 = self->_vpnProfileNames;
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
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
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_analyticsBaseUrl, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_analyticsId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_eventQueryParameterName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = self->_queryParameterConfigs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addQueryParameterConfig:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_usesProxyProfile;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = self->_proxyHostNames;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addProxyHostNames:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v20);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self->_vpnProfileNames;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v28), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend((id)v5, "addVpnProfileNames:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v26);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *analyticsBaseUrl;
  NSString *analyticsId;
  NSString *eventQueryParameterName;
  NSMutableArray *queryParameterConfigs;
  NSMutableArray *proxyHostNames;
  NSMutableArray *vpnProfileNames;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  analyticsBaseUrl = self->_analyticsBaseUrl;
  if ((unint64_t)analyticsBaseUrl | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](analyticsBaseUrl, "isEqual:"))
      goto LABEL_22;
  }
  analyticsId = self->_analyticsId;
  if ((unint64_t)analyticsId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](analyticsId, "isEqual:"))
      goto LABEL_22;
  }
  eventQueryParameterName = self->_eventQueryParameterName;
  if ((unint64_t)eventQueryParameterName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](eventQueryParameterName, "isEqual:"))
      goto LABEL_22;
  }
  queryParameterConfigs = self->_queryParameterConfigs;
  if ((unint64_t)queryParameterConfigs | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](queryParameterConfigs, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0)
    {
      if (self->_usesProxyProfile)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_18;
    }
LABEL_22:
    v11 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
    goto LABEL_22;
LABEL_18:
  proxyHostNames = self->_proxyHostNames;
  if ((unint64_t)proxyHostNames | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](proxyHostNames, "isEqual:"))
  {
    goto LABEL_22;
  }
  vpnProfileNames = self->_vpnProfileNames;
  if ((unint64_t)vpnProfileNames | *((_QWORD *)v4 + 6))
    v11 = -[NSMutableArray isEqual:](vpnProfileNames, "isEqual:");
  else
    v11 = 1;
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_analyticsBaseUrl, "hash");
  v4 = -[NSString hash](self->_analyticsId, "hash");
  v5 = -[NSString hash](self->_eventQueryParameterName, "hash");
  v6 = -[NSMutableArray hash](self->_queryParameterConfigs, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_usesProxyProfile;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSMutableArray hash](self->_proxyHostNames, "hash");
  return v8 ^ v9 ^ -[NSMutableArray hash](self->_vpnProfileNames, "hash");
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
  if (*((_QWORD *)v4 + 1))
    -[NTPBExternalAnalyticsConfig setAnalyticsBaseUrl:](self, "setAnalyticsBaseUrl:");
  if (*((_QWORD *)v4 + 2))
    -[NTPBExternalAnalyticsConfig setAnalyticsId:](self, "setAnalyticsId:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBExternalAnalyticsConfig setEventQueryParameterName:](self, "setEventQueryParameterName:");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = *((id *)v4 + 5);
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
        -[NTPBExternalAnalyticsConfig addQueryParameterConfig:](self, "addQueryParameterConfig:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_usesProxyProfile = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = *((id *)v4 + 4);
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
        -[NTPBExternalAnalyticsConfig addProxyHostNames:](self, "addProxyHostNames:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v4 + 6);
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
        -[NTPBExternalAnalyticsConfig addVpnProfileNames:](self, "addVpnProfileNames:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (NSString)analyticsBaseUrl
{
  return self->_analyticsBaseUrl;
}

- (void)setAnalyticsBaseUrl:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsBaseUrl, a3);
}

- (NSString)analyticsId
{
  return self->_analyticsId;
}

- (void)setAnalyticsId:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsId, a3);
}

- (NSString)eventQueryParameterName
{
  return self->_eventQueryParameterName;
}

- (void)setEventQueryParameterName:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueryParameterName, a3);
}

- (NSMutableArray)queryParameterConfigs
{
  return self->_queryParameterConfigs;
}

- (void)setQueryParameterConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_queryParameterConfigs, a3);
}

- (BOOL)usesProxyProfile
{
  return self->_usesProxyProfile;
}

- (NSMutableArray)proxyHostNames
{
  return self->_proxyHostNames;
}

- (void)setProxyHostNames:(id)a3
{
  objc_storeStrong((id *)&self->_proxyHostNames, a3);
}

- (NSMutableArray)vpnProfileNames
{
  return self->_vpnProfileNames;
}

- (void)setVpnProfileNames:(id)a3
{
  objc_storeStrong((id *)&self->_vpnProfileNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vpnProfileNames, 0);
  objc_storeStrong((id *)&self->_queryParameterConfigs, 0);
  objc_storeStrong((id *)&self->_proxyHostNames, 0);
  objc_storeStrong((id *)&self->_eventQueryParameterName, 0);
  objc_storeStrong((id *)&self->_analyticsId, 0);
  objc_storeStrong((id *)&self->_analyticsBaseUrl, 0);
}

@end
