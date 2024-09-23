@implementation NTPBEndpointConfig

- (BOOL)hasClientApiBaseUrl
{
  return self->_clientApiBaseUrl != 0;
}

- (BOOL)hasEventRelayBaseUrl
{
  return self->_eventRelayBaseUrl != 0;
}

- (BOOL)hasEventRelayBatchBaseUrl
{
  return self->_eventRelayBatchBaseUrl != 0;
}

- (BOOL)hasNewsNotificationsBaseUrl
{
  return self->_newsNotificationsBaseUrl != 0;
}

- (BOOL)hasAnalyticsEndpointUrlsJson
{
  return self->_analyticsEndpointUrlsJson != 0;
}

- (BOOL)hasAnalyticsEnvelopeContentTypePropJson
{
  return self->_analyticsEnvelopeContentTypePropJson != 0;
}

- (BOOL)hasStaticAssetBaseUrl
{
  return self->_staticAssetBaseUrl != 0;
}

- (BOOL)hasRemoteDataSourceBaseUrl
{
  return self->_remoteDataSourceBaseUrl != 0;
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
  v8.super_class = (Class)NTPBEndpointConfig;
  -[NTPBEndpointConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBEndpointConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientApiBaseUrl;
  NSString *eventRelayBaseUrl;
  NSString *eventRelayBatchBaseUrl;
  NSString *newsNotificationsBaseUrl;
  NSString *analyticsEndpointUrlsJson;
  NSString *analyticsEnvelopeContentTypePropJson;
  NSString *staticAssetBaseUrl;
  NSString *remoteDataSourceBaseUrl;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_environment);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("environment"));

  clientApiBaseUrl = self->_clientApiBaseUrl;
  if (clientApiBaseUrl)
    objc_msgSend(v3, "setObject:forKey:", clientApiBaseUrl, CFSTR("client_api_base_url"));
  eventRelayBaseUrl = self->_eventRelayBaseUrl;
  if (eventRelayBaseUrl)
    objc_msgSend(v3, "setObject:forKey:", eventRelayBaseUrl, CFSTR("event_relay_base_url"));
  eventRelayBatchBaseUrl = self->_eventRelayBatchBaseUrl;
  if (eventRelayBatchBaseUrl)
    objc_msgSend(v3, "setObject:forKey:", eventRelayBatchBaseUrl, CFSTR("event_relay_batch_base_url"));
  newsNotificationsBaseUrl = self->_newsNotificationsBaseUrl;
  if (newsNotificationsBaseUrl)
    objc_msgSend(v3, "setObject:forKey:", newsNotificationsBaseUrl, CFSTR("news_notifications_base_url"));
  analyticsEndpointUrlsJson = self->_analyticsEndpointUrlsJson;
  if (analyticsEndpointUrlsJson)
    objc_msgSend(v3, "setObject:forKey:", analyticsEndpointUrlsJson, CFSTR("analytics_endpoint_urls_json"));
  analyticsEnvelopeContentTypePropJson = self->_analyticsEnvelopeContentTypePropJson;
  if (analyticsEnvelopeContentTypePropJson)
    objc_msgSend(v3, "setObject:forKey:", analyticsEnvelopeContentTypePropJson, CFSTR("analytics_envelope_content_type_prop_json"));
  staticAssetBaseUrl = self->_staticAssetBaseUrl;
  if (staticAssetBaseUrl)
    objc_msgSend(v3, "setObject:forKey:", staticAssetBaseUrl, CFSTR("static_asset_base_url"));
  remoteDataSourceBaseUrl = self->_remoteDataSourceBaseUrl;
  if (remoteDataSourceBaseUrl)
    objc_msgSend(v3, "setObject:forKey:", remoteDataSourceBaseUrl, CFSTR("remote_data_source_base_url"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEndpointConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_clientApiBaseUrl)
    PBDataWriterWriteStringField();
  if (self->_eventRelayBaseUrl)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_eventRelayBatchBaseUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_newsNotificationsBaseUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_analyticsEndpointUrlsJson)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_analyticsEnvelopeContentTypePropJson)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_staticAssetBaseUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_remoteDataSourceBaseUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 32) = self->_environment;
  v6 = -[NSString copyWithZone:](self->_clientApiBaseUrl, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_eventRelayBaseUrl, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_eventRelayBatchBaseUrl, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_newsNotificationsBaseUrl, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_analyticsEndpointUrlsJson, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  v16 = -[NSString copyWithZone:](self->_analyticsEnvelopeContentTypePropJson, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  v18 = -[NSString copyWithZone:](self->_staticAssetBaseUrl, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v20 = -[NSString copyWithZone:](self->_remoteDataSourceBaseUrl, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *clientApiBaseUrl;
  NSString *eventRelayBaseUrl;
  NSString *eventRelayBatchBaseUrl;
  NSString *newsNotificationsBaseUrl;
  NSString *analyticsEndpointUrlsJson;
  NSString *analyticsEnvelopeContentTypePropJson;
  NSString *staticAssetBaseUrl;
  NSString *remoteDataSourceBaseUrl;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_environment == *((_DWORD *)v4 + 8)
    && ((clientApiBaseUrl = self->_clientApiBaseUrl, !((unint64_t)clientApiBaseUrl | v4[3]))
     || -[NSString isEqual:](clientApiBaseUrl, "isEqual:"))
    && ((eventRelayBaseUrl = self->_eventRelayBaseUrl, !((unint64_t)eventRelayBaseUrl | v4[5]))
     || -[NSString isEqual:](eventRelayBaseUrl, "isEqual:"))
    && ((eventRelayBatchBaseUrl = self->_eventRelayBatchBaseUrl, !((unint64_t)eventRelayBatchBaseUrl | v4[6]))
     || -[NSString isEqual:](eventRelayBatchBaseUrl, "isEqual:"))
    && ((newsNotificationsBaseUrl = self->_newsNotificationsBaseUrl,
         !((unint64_t)newsNotificationsBaseUrl | v4[7]))
     || -[NSString isEqual:](newsNotificationsBaseUrl, "isEqual:"))
    && ((analyticsEndpointUrlsJson = self->_analyticsEndpointUrlsJson,
         !((unint64_t)analyticsEndpointUrlsJson | v4[1]))
     || -[NSString isEqual:](analyticsEndpointUrlsJson, "isEqual:"))
    && ((analyticsEnvelopeContentTypePropJson = self->_analyticsEnvelopeContentTypePropJson,
         !((unint64_t)analyticsEnvelopeContentTypePropJson | v4[2]))
     || -[NSString isEqual:](analyticsEnvelopeContentTypePropJson, "isEqual:"))
    && ((staticAssetBaseUrl = self->_staticAssetBaseUrl, !((unint64_t)staticAssetBaseUrl | v4[9]))
     || -[NSString isEqual:](staticAssetBaseUrl, "isEqual:")))
  {
    remoteDataSourceBaseUrl = self->_remoteDataSourceBaseUrl;
    if ((unint64_t)remoteDataSourceBaseUrl | v4[8])
      v13 = -[NSString isEqual:](remoteDataSourceBaseUrl, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;

  v3 = 2654435761 * self->_environment;
  v4 = -[NSString hash](self->_clientApiBaseUrl, "hash");
  v5 = v4 ^ -[NSString hash](self->_eventRelayBaseUrl, "hash");
  v6 = v5 ^ -[NSString hash](self->_eventRelayBatchBaseUrl, "hash");
  v7 = v6 ^ -[NSString hash](self->_newsNotificationsBaseUrl, "hash");
  v8 = v7 ^ -[NSString hash](self->_analyticsEndpointUrlsJson, "hash") ^ v3;
  v9 = -[NSString hash](self->_analyticsEnvelopeContentTypePropJson, "hash");
  v10 = v9 ^ -[NSString hash](self->_staticAssetBaseUrl, "hash");
  return v8 ^ v10 ^ -[NSString hash](self->_remoteDataSourceBaseUrl, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;

  v4 = a3;
  self->_environment = v4[8];
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
    -[NTPBEndpointConfig setClientApiBaseUrl:](self, "setClientApiBaseUrl:");
  if (v5[5])
    -[NTPBEndpointConfig setEventRelayBaseUrl:](self, "setEventRelayBaseUrl:");
  if (v5[6])
    -[NTPBEndpointConfig setEventRelayBatchBaseUrl:](self, "setEventRelayBatchBaseUrl:");
  if (v5[7])
    -[NTPBEndpointConfig setNewsNotificationsBaseUrl:](self, "setNewsNotificationsBaseUrl:");
  if (v5[1])
    -[NTPBEndpointConfig setAnalyticsEndpointUrlsJson:](self, "setAnalyticsEndpointUrlsJson:");
  if (v5[2])
    -[NTPBEndpointConfig setAnalyticsEnvelopeContentTypePropJson:](self, "setAnalyticsEnvelopeContentTypePropJson:");
  if (v5[9])
    -[NTPBEndpointConfig setStaticAssetBaseUrl:](self, "setStaticAssetBaseUrl:");
  if (v5[8])
    -[NTPBEndpointConfig setRemoteDataSourceBaseUrl:](self, "setRemoteDataSourceBaseUrl:");

}

- (int)environment
{
  return self->_environment;
}

- (void)setEnvironment:(int)a3
{
  self->_environment = a3;
}

- (NSString)clientApiBaseUrl
{
  return self->_clientApiBaseUrl;
}

- (void)setClientApiBaseUrl:(id)a3
{
  objc_storeStrong((id *)&self->_clientApiBaseUrl, a3);
}

- (NSString)eventRelayBaseUrl
{
  return self->_eventRelayBaseUrl;
}

- (void)setEventRelayBaseUrl:(id)a3
{
  objc_storeStrong((id *)&self->_eventRelayBaseUrl, a3);
}

- (NSString)eventRelayBatchBaseUrl
{
  return self->_eventRelayBatchBaseUrl;
}

- (void)setEventRelayBatchBaseUrl:(id)a3
{
  objc_storeStrong((id *)&self->_eventRelayBatchBaseUrl, a3);
}

- (NSString)newsNotificationsBaseUrl
{
  return self->_newsNotificationsBaseUrl;
}

- (void)setNewsNotificationsBaseUrl:(id)a3
{
  objc_storeStrong((id *)&self->_newsNotificationsBaseUrl, a3);
}

- (NSString)analyticsEndpointUrlsJson
{
  return self->_analyticsEndpointUrlsJson;
}

- (void)setAnalyticsEndpointUrlsJson:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEndpointUrlsJson, a3);
}

- (NSString)analyticsEnvelopeContentTypePropJson
{
  return self->_analyticsEnvelopeContentTypePropJson;
}

- (void)setAnalyticsEnvelopeContentTypePropJson:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEnvelopeContentTypePropJson, a3);
}

- (NSString)staticAssetBaseUrl
{
  return self->_staticAssetBaseUrl;
}

- (void)setStaticAssetBaseUrl:(id)a3
{
  objc_storeStrong((id *)&self->_staticAssetBaseUrl, a3);
}

- (NSString)remoteDataSourceBaseUrl
{
  return self->_remoteDataSourceBaseUrl;
}

- (void)setRemoteDataSourceBaseUrl:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDataSourceBaseUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticAssetBaseUrl, 0);
  objc_storeStrong((id *)&self->_remoteDataSourceBaseUrl, 0);
  objc_storeStrong((id *)&self->_newsNotificationsBaseUrl, 0);
  objc_storeStrong((id *)&self->_eventRelayBatchBaseUrl, 0);
  objc_storeStrong((id *)&self->_eventRelayBaseUrl, 0);
  objc_storeStrong((id *)&self->_clientApiBaseUrl, 0);
  objc_storeStrong((id *)&self->_analyticsEnvelopeContentTypePropJson, 0);
  objc_storeStrong((id *)&self->_analyticsEndpointUrlsJson, 0);
}

@end
