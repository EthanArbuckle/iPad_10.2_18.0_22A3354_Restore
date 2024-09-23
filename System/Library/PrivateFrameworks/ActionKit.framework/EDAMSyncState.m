@implementation EDAMSyncState

+ (id)structName
{
  return CFSTR("SyncState");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[12];

  v17[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_30;
  if (!structFields_structFields_30)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 0, CFSTR("currentTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 10, 0, CFSTR("fullSyncBefore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("updateCount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 10, 1, CFSTR("uploaded"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 10, 1, CFSTR("userLastUpdated"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 10, 1, CFSTR("userMaxMessageEventId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("businessSummaryUpdated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 8, 1, CFSTR("communicationEngineUpdateId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 8, 1, CFSTR("currentDevicesUsed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 2, 1, CFSTR("showChoiceScreen"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v10;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 11, 12, 1, CFSTR("clientSyncRateConfig"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[10] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_30;
    structFields_structFields_30 = v12;

    v2 = (void *)structFields_structFields_30;
  }
  return v2;
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (NSNumber)fullSyncBefore
{
  return self->_fullSyncBefore;
}

- (void)setFullSyncBefore:(id)a3
{
  objc_storeStrong((id *)&self->_fullSyncBefore, a3);
}

- (NSNumber)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(id)a3
{
  objc_storeStrong((id *)&self->_updateCount, a3);
}

- (NSNumber)uploaded
{
  return self->_uploaded;
}

- (void)setUploaded:(id)a3
{
  objc_storeStrong((id *)&self->_uploaded, a3);
}

- (NSNumber)userLastUpdated
{
  return self->_userLastUpdated;
}

- (void)setUserLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_userLastUpdated, a3);
}

- (NSNumber)userMaxMessageEventId
{
  return self->_userMaxMessageEventId;
}

- (void)setUserMaxMessageEventId:(id)a3
{
  objc_storeStrong((id *)&self->_userMaxMessageEventId, a3);
}

- (NSNumber)businessSummaryUpdated
{
  return self->_businessSummaryUpdated;
}

- (void)setBusinessSummaryUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_businessSummaryUpdated, a3);
}

- (NSNumber)communicationEngineUpdateId
{
  return self->_communicationEngineUpdateId;
}

- (void)setCommunicationEngineUpdateId:(id)a3
{
  objc_storeStrong((id *)&self->_communicationEngineUpdateId, a3);
}

- (NSNumber)currentDevicesUsed
{
  return self->_currentDevicesUsed;
}

- (void)setCurrentDevicesUsed:(id)a3
{
  objc_storeStrong((id *)&self->_currentDevicesUsed, a3);
}

- (NSNumber)showChoiceScreen
{
  return self->_showChoiceScreen;
}

- (void)setShowChoiceScreen:(id)a3
{
  objc_storeStrong((id *)&self->_showChoiceScreen, a3);
}

- (EDAMClientSyncRateConfig)clientSyncRateConfig
{
  return self->_clientSyncRateConfig;
}

- (void)setClientSyncRateConfig:(id)a3
{
  objc_storeStrong((id *)&self->_clientSyncRateConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSyncRateConfig, 0);
  objc_storeStrong((id *)&self->_showChoiceScreen, 0);
  objc_storeStrong((id *)&self->_currentDevicesUsed, 0);
  objc_storeStrong((id *)&self->_communicationEngineUpdateId, 0);
  objc_storeStrong((id *)&self->_businessSummaryUpdated, 0);
  objc_storeStrong((id *)&self->_userMaxMessageEventId, 0);
  objc_storeStrong((id *)&self->_userLastUpdated, 0);
  objc_storeStrong((id *)&self->_uploaded, 0);
  objc_storeStrong((id *)&self->_updateCount, 0);
  objc_storeStrong((id *)&self->_fullSyncBefore, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

@end
