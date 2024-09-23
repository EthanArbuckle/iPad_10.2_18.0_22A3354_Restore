@implementation NTPBKeyValuePair

- (NSString)key
{
  return self->_key;
}

- (NSData)recordData
{
  return self->_recordData;
}

- (int)valueType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_valueType;
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBKeyValuePair setKey:](self, "setKey:", 0);
  -[NTPBKeyValuePair setDataValue:](self, "setDataValue:", 0);
  -[NTPBKeyValuePair setStringValue:](self, "setStringValue:", 0);
  -[NTPBKeyValuePair setDateValue:](self, "setDateValue:", 0);
  -[NTPBKeyValuePair setCacheCoordinatorHintsValue:](self, "setCacheCoordinatorHintsValue:", 0);
  -[NTPBKeyValuePair setRecordData:](self, "setRecordData:", 0);
  -[NTPBKeyValuePair setReadingHistoryItem:](self, "setReadingHistoryItem:", 0);
  -[NTPBKeyValuePair setNetworkSessionList:](self, "setNetworkSessionList:", 0);
  -[NTPBKeyValuePair setPersonalizationLocalData:](self, "setPersonalizationLocalData:", 0);
  -[NTPBKeyValuePair setAppConfigurationResource:](self, "setAppConfigurationResource:", 0);
  -[NTPBKeyValuePair setPrivateDataControllerSyncState:](self, "setPrivateDataControllerSyncState:", 0);
  -[NTPBKeyValuePair setIssueReadingHistoryItem:](self, "setIssueReadingHistoryItem:", 0);
  -[NTPBKeyValuePair setAsset:](self, "setAsset:", 0);
  -[NTPBKeyValuePair setAudioPlaylistItem:](self, "setAudioPlaylistItem:", 0);
  -[NTPBKeyValuePair setAvAsset:](self, "setAvAsset:", 0);
  -[NTPBKeyValuePair setAvAssetKey:](self, "setAvAssetKey:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBKeyValuePair;
  -[NTPBKeyValuePair dealloc](&v3, sel_dealloc);
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (void)setDateValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setDataValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setRecordData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (void)setReadingHistoryItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)setPrivateDataControllerSyncState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (void)setPersonalizationLocalData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)setNetworkSessionList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setIssueReadingHistoryItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void)setCacheCoordinatorHintsValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setAvAssetKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setAvAsset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setAudioPlaylistItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setAsset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setAppConfigurationResource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NTPBAsset)asset
{
  return self->_asset;
}

- (NTPBCacheCoordinatorHints)cacheCoordinatorHintsValue
{
  return self->_cacheCoordinatorHintsValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (NTPBDate)dateValue
{
  return self->_dateValue;
}

- (void)setValueType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_valueType = a3;
}

- (NTPBNetworkSessionList)networkSessionList
{
  return self->_networkSessionList;
}

- (void)writeTo:(id)a3
{
  if (self->_key)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_dataValue)
    PBDataWriterWriteDataField();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  if (self->_dateValue)
    PBDataWriterWriteSubmessage();
  if (self->_cacheCoordinatorHintsValue)
    PBDataWriterWriteSubmessage();
  if (self->_recordData)
    PBDataWriterWriteDataField();
  if (self->_readingHistoryItem)
    PBDataWriterWriteSubmessage();
  if (self->_networkSessionList)
    PBDataWriterWriteSubmessage();
  if (self->_personalizationLocalData)
    PBDataWriterWriteSubmessage();
  if (self->_appConfigurationResource)
    PBDataWriterWriteSubmessage();
  if (self->_privateDataControllerSyncState)
    PBDataWriterWriteSubmessage();
  if (self->_issueReadingHistoryItem)
    PBDataWriterWriteSubmessage();
  if (self->_asset)
    PBDataWriterWriteSubmessage();
  if (self->_audioPlaylistItem)
    PBDataWriterWriteSubmessage();
  if (self->_avAsset)
    PBDataWriterWriteSubmessage();
  if (self->_avAssetKey)
    PBDataWriterWriteSubmessage();
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setHasValueType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValueType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasCacheCoordinatorHintsValue
{
  return self->_cacheCoordinatorHintsValue != 0;
}

- (BOOL)hasRecordData
{
  return self->_recordData != 0;
}

- (BOOL)hasReadingHistoryItem
{
  return self->_readingHistoryItem != 0;
}

- (BOOL)hasNetworkSessionList
{
  return self->_networkSessionList != 0;
}

- (BOOL)hasPersonalizationLocalData
{
  return self->_personalizationLocalData != 0;
}

- (BOOL)hasAppConfigurationResource
{
  return self->_appConfigurationResource != 0;
}

- (BOOL)hasPrivateDataControllerSyncState
{
  return self->_privateDataControllerSyncState != 0;
}

- (BOOL)hasIssueReadingHistoryItem
{
  return self->_issueReadingHistoryItem != 0;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (BOOL)hasAudioPlaylistItem
{
  return self->_audioPlaylistItem != 0;
}

- (BOOL)hasAvAsset
{
  return self->_avAsset != 0;
}

- (BOOL)hasAvAssetKey
{
  return self->_avAssetKey != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBKeyValuePair;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBKeyValuePair description](&v3, sel_description), -[NTPBKeyValuePair dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  NSData *dataValue;
  NSString *stringValue;
  NTPBDate *dateValue;
  NTPBCacheCoordinatorHints *cacheCoordinatorHintsValue;
  NSData *recordData;
  NTPBReadingHistoryItem *readingHistoryItem;
  NTPBNetworkSessionList *networkSessionList;
  NTPBPersonalizationLocalData *personalizationLocalData;
  NTPBAppConfigurationResource *appConfigurationResource;
  NTPBPrivateDataControllerSyncState *privateDataControllerSyncState;
  NTPBIssueReadingHistoryItem *issueReadingHistoryItem;
  NTPBAsset *asset;
  NTPBAudioPlaylistItem *audioPlaylistItem;
  NTPBAVAsset *avAsset;
  NTPBAVAssetKey *avAssetKey;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_valueType), CFSTR("value_type"));
  dataValue = self->_dataValue;
  if (dataValue)
    objc_msgSend(v4, "setObject:forKey:", dataValue, CFSTR("data_value"));
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v4, "setObject:forKey:", stringValue, CFSTR("string_value"));
  dateValue = self->_dateValue;
  if (dateValue)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](dateValue, "dictionaryRepresentation"), CFSTR("date_value"));
  cacheCoordinatorHintsValue = self->_cacheCoordinatorHintsValue;
  if (cacheCoordinatorHintsValue)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBCacheCoordinatorHints dictionaryRepresentation](cacheCoordinatorHintsValue, "dictionaryRepresentation"), CFSTR("cache_coordinator_hints_value"));
  recordData = self->_recordData;
  if (recordData)
    objc_msgSend(v4, "setObject:forKey:", recordData, CFSTR("record_data"));
  readingHistoryItem = self->_readingHistoryItem;
  if (readingHistoryItem)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBReadingHistoryItem dictionaryRepresentation](readingHistoryItem, "dictionaryRepresentation"), CFSTR("reading_history_item"));
  networkSessionList = self->_networkSessionList;
  if (networkSessionList)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBNetworkSessionList dictionaryRepresentation](networkSessionList, "dictionaryRepresentation"), CFSTR("network_session_list"));
  personalizationLocalData = self->_personalizationLocalData;
  if (personalizationLocalData)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBPersonalizationLocalData dictionaryRepresentation](personalizationLocalData, "dictionaryRepresentation"), CFSTR("personalization_local_data"));
  appConfigurationResource = self->_appConfigurationResource;
  if (appConfigurationResource)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAppConfigurationResource dictionaryRepresentation](appConfigurationResource, "dictionaryRepresentation"), CFSTR("app_configuration_resource"));
  privateDataControllerSyncState = self->_privateDataControllerSyncState;
  if (privateDataControllerSyncState)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBPrivateDataControllerSyncState dictionaryRepresentation](privateDataControllerSyncState, "dictionaryRepresentation"), CFSTR("private_data_controller_sync_state"));
  issueReadingHistoryItem = self->_issueReadingHistoryItem;
  if (issueReadingHistoryItem)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBIssueReadingHistoryItem dictionaryRepresentation](issueReadingHistoryItem, "dictionaryRepresentation"), CFSTR("issue_reading_history_item"));
  asset = self->_asset;
  if (asset)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAsset dictionaryRepresentation](asset, "dictionaryRepresentation"), CFSTR("asset"));
  audioPlaylistItem = self->_audioPlaylistItem;
  if (audioPlaylistItem)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAudioPlaylistItem dictionaryRepresentation](audioPlaylistItem, "dictionaryRepresentation"), CFSTR("audio_playlist_item"));
  avAsset = self->_avAsset;
  if (avAsset)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAVAsset dictionaryRepresentation](avAsset, "dictionaryRepresentation"), CFSTR("av_asset"));
  avAssetKey = self->_avAssetKey;
  if (avAssetKey)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAVAssetKey dictionaryRepresentation](avAssetKey, "dictionaryRepresentation"), CFSTR("av_asset_key"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 80) = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_valueType;
    *(_BYTE *)(v5 + 140) |= 1u;
  }

  *(_QWORD *)(v5 + 56) = -[NSData copyWithZone:](self->_dataValue, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 128) = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 64) = -[NTPBDate copyWithZone:](self->_dateValue, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 48) = -[NTPBCacheCoordinatorHints copyWithZone:](self->_cacheCoordinatorHintsValue, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 120) = -[NSData copyWithZone:](self->_recordData, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 112) = -[NTPBReadingHistoryItem copyWithZone:](self->_readingHistoryItem, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 88) = -[NTPBNetworkSessionList copyWithZone:](self->_networkSessionList, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 96) = -[NTPBPersonalizationLocalData copyWithZone:](self->_personalizationLocalData, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 8) = -[NTPBAppConfigurationResource copyWithZone:](self->_appConfigurationResource, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 104) = -[NTPBPrivateDataControllerSyncState copyWithZone:](self->_privateDataControllerSyncState, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 72) = -[NTPBIssueReadingHistoryItem copyWithZone:](self->_issueReadingHistoryItem, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NTPBAsset copyWithZone:](self->_asset, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 24) = -[NTPBAudioPlaylistItem copyWithZone:](self->_audioPlaylistItem, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NTPBAVAsset copyWithZone:](self->_avAsset, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 40) = -[NTPBAVAssetKey copyWithZone:](self->_avAssetKey, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *key;
  NSData *dataValue;
  NSString *stringValue;
  NTPBDate *dateValue;
  NTPBCacheCoordinatorHints *cacheCoordinatorHintsValue;
  NSData *recordData;
  NTPBReadingHistoryItem *readingHistoryItem;
  NTPBNetworkSessionList *networkSessionList;
  NTPBPersonalizationLocalData *personalizationLocalData;
  NTPBAppConfigurationResource *appConfigurationResource;
  NTPBPrivateDataControllerSyncState *privateDataControllerSyncState;
  NTPBIssueReadingHistoryItem *issueReadingHistoryItem;
  NTPBAsset *asset;
  NTPBAudioPlaylistItem *audioPlaylistItem;
  NTPBAVAsset *avAsset;
  NTPBAVAssetKey *avAssetKey;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((_QWORD *)a3 + 10)) || (v5 = -[NSString isEqual:](key, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 140) & 1) == 0 || self->_valueType != *((_DWORD *)a3 + 34))
          goto LABEL_39;
      }
      else if ((*((_BYTE *)a3 + 140) & 1) != 0)
      {
LABEL_39:
        LOBYTE(v5) = 0;
        return v5;
      }
      dataValue = self->_dataValue;
      if (!((unint64_t)dataValue | *((_QWORD *)a3 + 7)) || (v5 = -[NSData isEqual:](dataValue, "isEqual:")) != 0)
      {
        stringValue = self->_stringValue;
        if (!((unint64_t)stringValue | *((_QWORD *)a3 + 16))
          || (v5 = -[NSString isEqual:](stringValue, "isEqual:")) != 0)
        {
          dateValue = self->_dateValue;
          if (!((unint64_t)dateValue | *((_QWORD *)a3 + 8))
            || (v5 = -[NTPBDate isEqual:](dateValue, "isEqual:")) != 0)
          {
            cacheCoordinatorHintsValue = self->_cacheCoordinatorHintsValue;
            if (!((unint64_t)cacheCoordinatorHintsValue | *((_QWORD *)a3 + 6))
              || (v5 = -[NTPBCacheCoordinatorHints isEqual:](cacheCoordinatorHintsValue, "isEqual:")) != 0)
            {
              recordData = self->_recordData;
              if (!((unint64_t)recordData | *((_QWORD *)a3 + 15))
                || (v5 = -[NSData isEqual:](recordData, "isEqual:")) != 0)
              {
                readingHistoryItem = self->_readingHistoryItem;
                if (!((unint64_t)readingHistoryItem | *((_QWORD *)a3 + 14))
                  || (v5 = -[NTPBReadingHistoryItem isEqual:](readingHistoryItem, "isEqual:")) != 0)
                {
                  networkSessionList = self->_networkSessionList;
                  if (!((unint64_t)networkSessionList | *((_QWORD *)a3 + 11))
                    || (v5 = -[NTPBNetworkSessionList isEqual:](networkSessionList, "isEqual:")) != 0)
                  {
                    personalizationLocalData = self->_personalizationLocalData;
                    if (!((unint64_t)personalizationLocalData | *((_QWORD *)a3 + 12))
                      || (v5 = -[NTPBPersonalizationLocalData isEqual:](personalizationLocalData, "isEqual:")) != 0)
                    {
                      appConfigurationResource = self->_appConfigurationResource;
                      if (!((unint64_t)appConfigurationResource | *((_QWORD *)a3 + 1))
                        || (v5 = -[NTPBAppConfigurationResource isEqual:](appConfigurationResource, "isEqual:")) != 0)
                      {
                        privateDataControllerSyncState = self->_privateDataControllerSyncState;
                        if (!((unint64_t)privateDataControllerSyncState | *((_QWORD *)a3 + 13))
                          || (v5 = -[NTPBPrivateDataControllerSyncState isEqual:](privateDataControllerSyncState, "isEqual:")) != 0)
                        {
                          issueReadingHistoryItem = self->_issueReadingHistoryItem;
                          if (!((unint64_t)issueReadingHistoryItem | *((_QWORD *)a3 + 9))
                            || (v5 = -[NTPBIssueReadingHistoryItem isEqual:](issueReadingHistoryItem, "isEqual:")) != 0)
                          {
                            asset = self->_asset;
                            if (!((unint64_t)asset | *((_QWORD *)a3 + 2))
                              || (v5 = -[NTPBAsset isEqual:](asset, "isEqual:")) != 0)
                            {
                              audioPlaylistItem = self->_audioPlaylistItem;
                              if (!((unint64_t)audioPlaylistItem | *((_QWORD *)a3 + 3))
                                || (v5 = -[NTPBAudioPlaylistItem isEqual:](audioPlaylistItem, "isEqual:")) != 0)
                              {
                                avAsset = self->_avAsset;
                                if (!((unint64_t)avAsset | *((_QWORD *)a3 + 4))
                                  || (v5 = -[NTPBAVAsset isEqual:](avAsset, "isEqual:")) != 0)
                                {
                                  avAssetKey = self->_avAssetKey;
                                  if ((unint64_t)avAssetKey | *((_QWORD *)a3 + 5))
                                    LOBYTE(v5) = -[NTPBAVAssetKey isEqual:](avAssetKey, "isEqual:");
                                  else
                                    LOBYTE(v5) = 1;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_valueType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSData hash](self->_dataValue, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_stringValue, "hash");
  v8 = -[NTPBDate hash](self->_dateValue, "hash");
  v9 = v8 ^ -[NTPBCacheCoordinatorHints hash](self->_cacheCoordinatorHintsValue, "hash");
  v10 = v7 ^ v9 ^ -[NSData hash](self->_recordData, "hash");
  v11 = -[NTPBReadingHistoryItem hash](self->_readingHistoryItem, "hash");
  v12 = v11 ^ -[NTPBNetworkSessionList hash](self->_networkSessionList, "hash");
  v13 = v12 ^ -[NTPBPersonalizationLocalData hash](self->_personalizationLocalData, "hash");
  v14 = v10 ^ v13 ^ -[NTPBAppConfigurationResource hash](self->_appConfigurationResource, "hash");
  v15 = -[NTPBPrivateDataControllerSyncState hash](self->_privateDataControllerSyncState, "hash");
  v16 = v15 ^ -[NTPBIssueReadingHistoryItem hash](self->_issueReadingHistoryItem, "hash");
  v17 = v16 ^ -[NTPBAsset hash](self->_asset, "hash");
  v18 = v17 ^ -[NTPBAudioPlaylistItem hash](self->_audioPlaylistItem, "hash");
  v19 = v14 ^ v18 ^ -[NTPBAVAsset hash](self->_avAsset, "hash");
  return v19 ^ -[NTPBAVAssetKey hash](self->_avAssetKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *dateValue;
  uint64_t v6;
  NTPBCacheCoordinatorHints *cacheCoordinatorHintsValue;
  uint64_t v8;
  NTPBReadingHistoryItem *readingHistoryItem;
  uint64_t v10;
  NTPBNetworkSessionList *networkSessionList;
  uint64_t v12;
  NTPBPersonalizationLocalData *personalizationLocalData;
  uint64_t v14;
  NTPBAppConfigurationResource *appConfigurationResource;
  uint64_t v16;
  NTPBPrivateDataControllerSyncState *privateDataControllerSyncState;
  uint64_t v18;
  NTPBIssueReadingHistoryItem *issueReadingHistoryItem;
  uint64_t v20;
  NTPBAsset *asset;
  uint64_t v22;
  NTPBAudioPlaylistItem *audioPlaylistItem;
  uint64_t v24;
  NTPBAVAsset *avAsset;
  uint64_t v26;
  NTPBAVAssetKey *avAssetKey;
  uint64_t v28;

  if (*((_QWORD *)a3 + 10))
    -[NTPBKeyValuePair setKey:](self, "setKey:");
  if ((*((_BYTE *)a3 + 140) & 1) != 0)
  {
    self->_valueType = *((_DWORD *)a3 + 34);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 7))
    -[NTPBKeyValuePair setDataValue:](self, "setDataValue:");
  if (*((_QWORD *)a3 + 16))
    -[NTPBKeyValuePair setStringValue:](self, "setStringValue:");
  dateValue = self->_dateValue;
  v6 = *((_QWORD *)a3 + 8);
  if (dateValue)
  {
    if (v6)
      -[NTPBDate mergeFrom:](dateValue, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBKeyValuePair setDateValue:](self, "setDateValue:");
  }
  cacheCoordinatorHintsValue = self->_cacheCoordinatorHintsValue;
  v8 = *((_QWORD *)a3 + 6);
  if (cacheCoordinatorHintsValue)
  {
    if (v8)
      -[NTPBCacheCoordinatorHints mergeFrom:](cacheCoordinatorHintsValue, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBKeyValuePair setCacheCoordinatorHintsValue:](self, "setCacheCoordinatorHintsValue:");
  }
  if (*((_QWORD *)a3 + 15))
    -[NTPBKeyValuePair setRecordData:](self, "setRecordData:");
  readingHistoryItem = self->_readingHistoryItem;
  v10 = *((_QWORD *)a3 + 14);
  if (readingHistoryItem)
  {
    if (v10)
      -[NTPBReadingHistoryItem mergeFrom:](readingHistoryItem, "mergeFrom:");
  }
  else if (v10)
  {
    -[NTPBKeyValuePair setReadingHistoryItem:](self, "setReadingHistoryItem:");
  }
  networkSessionList = self->_networkSessionList;
  v12 = *((_QWORD *)a3 + 11);
  if (networkSessionList)
  {
    if (v12)
      -[NTPBNetworkSessionList mergeFrom:](networkSessionList, "mergeFrom:");
  }
  else if (v12)
  {
    -[NTPBKeyValuePair setNetworkSessionList:](self, "setNetworkSessionList:");
  }
  personalizationLocalData = self->_personalizationLocalData;
  v14 = *((_QWORD *)a3 + 12);
  if (personalizationLocalData)
  {
    if (v14)
      -[NTPBPersonalizationLocalData mergeFrom:](personalizationLocalData, "mergeFrom:");
  }
  else if (v14)
  {
    -[NTPBKeyValuePair setPersonalizationLocalData:](self, "setPersonalizationLocalData:");
  }
  appConfigurationResource = self->_appConfigurationResource;
  v16 = *((_QWORD *)a3 + 1);
  if (appConfigurationResource)
  {
    if (v16)
      -[NTPBAppConfigurationResource mergeFrom:](appConfigurationResource, "mergeFrom:");
  }
  else if (v16)
  {
    -[NTPBKeyValuePair setAppConfigurationResource:](self, "setAppConfigurationResource:");
  }
  privateDataControllerSyncState = self->_privateDataControllerSyncState;
  v18 = *((_QWORD *)a3 + 13);
  if (privateDataControllerSyncState)
  {
    if (v18)
      -[NTPBPrivateDataControllerSyncState mergeFrom:](privateDataControllerSyncState, "mergeFrom:");
  }
  else if (v18)
  {
    -[NTPBKeyValuePair setPrivateDataControllerSyncState:](self, "setPrivateDataControllerSyncState:");
  }
  issueReadingHistoryItem = self->_issueReadingHistoryItem;
  v20 = *((_QWORD *)a3 + 9);
  if (issueReadingHistoryItem)
  {
    if (v20)
      -[NTPBIssueReadingHistoryItem mergeFrom:](issueReadingHistoryItem, "mergeFrom:");
  }
  else if (v20)
  {
    -[NTPBKeyValuePair setIssueReadingHistoryItem:](self, "setIssueReadingHistoryItem:");
  }
  asset = self->_asset;
  v22 = *((_QWORD *)a3 + 2);
  if (asset)
  {
    if (v22)
      -[NTPBAsset mergeFrom:](asset, "mergeFrom:");
  }
  else if (v22)
  {
    -[NTPBKeyValuePair setAsset:](self, "setAsset:");
  }
  audioPlaylistItem = self->_audioPlaylistItem;
  v24 = *((_QWORD *)a3 + 3);
  if (audioPlaylistItem)
  {
    if (v24)
      -[NTPBAudioPlaylistItem mergeFrom:](audioPlaylistItem, "mergeFrom:");
  }
  else if (v24)
  {
    -[NTPBKeyValuePair setAudioPlaylistItem:](self, "setAudioPlaylistItem:");
  }
  avAsset = self->_avAsset;
  v26 = *((_QWORD *)a3 + 4);
  if (avAsset)
  {
    if (v26)
      -[NTPBAVAsset mergeFrom:](avAsset, "mergeFrom:");
  }
  else if (v26)
  {
    -[NTPBKeyValuePair setAvAsset:](self, "setAvAsset:");
  }
  avAssetKey = self->_avAssetKey;
  v28 = *((_QWORD *)a3 + 5);
  if (avAssetKey)
  {
    if (v28)
      -[NTPBAVAssetKey mergeFrom:](avAssetKey, "mergeFrom:");
  }
  else if (v28)
  {
    -[NTPBKeyValuePair setAvAssetKey:](self, "setAvAssetKey:");
  }
}

- (NTPBReadingHistoryItem)readingHistoryItem
{
  return self->_readingHistoryItem;
}

- (NTPBPersonalizationLocalData)personalizationLocalData
{
  return self->_personalizationLocalData;
}

- (NTPBAppConfigurationResource)appConfigurationResource
{
  return self->_appConfigurationResource;
}

- (NTPBPrivateDataControllerSyncState)privateDataControllerSyncState
{
  return self->_privateDataControllerSyncState;
}

- (NTPBIssueReadingHistoryItem)issueReadingHistoryItem
{
  return self->_issueReadingHistoryItem;
}

- (NTPBAudioPlaylistItem)audioPlaylistItem
{
  return self->_audioPlaylistItem;
}

- (NTPBAVAsset)avAsset
{
  return self->_avAsset;
}

- (NTPBAVAssetKey)avAssetKey
{
  return self->_avAssetKey;
}

@end
