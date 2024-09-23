@implementation HMDCameraSignificantEventNotificationFilter

- (HMDCameraSignificantEventNotificationFilter)init
{
  HMDCameraSignificantEventNotificationFilter *v2;
  uint64_t v3;
  NSMutableDictionary *primaryResidentSignificantEventNotificationsByUUID;
  uint64_t v5;
  NSMutableDictionary *cloudSignificantEventsByUUID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDCameraSignificantEventNotificationFilter;
  v2 = -[HMDCameraSignificantEventNotificationFilter init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    primaryResidentSignificantEventNotificationsByUUID = v2->_primaryResidentSignificantEventNotificationsByUUID;
    v2->_primaryResidentSignificantEventNotificationsByUUID = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    cloudSignificantEventsByUUID = v2->_cloudSignificantEventsByUUID;
    v2->_cloudSignificantEventsByUUID = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)addIncomingPrimaryResidentSignificantEventNotificationWithUUID:(id)a3 notificationReasons:(unint64_t)a4 date:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDCameraSignificantEventNotificationRecord *v11;

  v8 = a5;
  v9 = a3;
  v11 = -[HMDCameraSignificantEventNotificationRecord initWithUUID:notificationReasons:date:]([HMDCameraSignificantEventNotificationRecord alloc], "initWithUUID:notificationReasons:date:", v9, a4, v8);

  -[HMDCameraSignificantEventNotificationFilter primaryResidentSignificantEventNotificationsByUUID](self, "primaryResidentSignificantEventNotificationsByUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v9);

}

- (void)addIncomingCloudSignificantEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDCameraSignificantEventNotificationFilter cloudSignificantEventsByUUID](self, "cloudSignificantEventsByUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v5);

}

- (id)consumePrimaryResidentSignificantEventWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[HMDCameraSignificantEventNotificationFilter _isSignificantEventRelevantWithUUID:isFromPrimary:](self, "_isSignificantEventRelevantWithUUID:isFromPrimary:", v4, 1))
  {
    -[HMDCameraSignificantEventNotificationFilter primaryResidentSignificantEventNotificationsByUUID](self, "primaryResidentSignificantEventNotificationsByUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[HMDCameraSignificantEventNotificationFilter primaryResidentSignificantEventNotificationsByUUID](self, "primaryResidentSignificantEventNotificationsByUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v4);

  -[HMDCameraSignificantEventNotificationFilter _prunePrimaryResidentSignificantEvents](self, "_prunePrimaryResidentSignificantEvents");
  return v6;
}

- (id)consumeCloudSignificantEventWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[HMDCameraSignificantEventNotificationFilter _isSignificantEventRelevantWithUUID:isFromPrimary:](self, "_isSignificantEventRelevantWithUUID:isFromPrimary:", v4, 0))
  {
    -[HMDCameraSignificantEventNotificationFilter cloudSignificantEventsByUUID](self, "cloudSignificantEventsByUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[HMDCameraSignificantEventNotificationFilter cloudSignificantEventsByUUID](self, "cloudSignificantEventsByUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v4);

  -[HMDCameraSignificantEventNotificationFilter _pruneCloudSignificantEvents](self, "_pruneCloudSignificantEvents");
  return v6;
}

- (BOOL)_isSignificantEventRelevantWithUUID:(id)a3 isFromPrimary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[HMDCameraSignificantEventNotificationFilter primaryResidentSignificantEventNotificationsByUUID](self, "primaryResidentSignificantEventNotificationsByUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
  }
  else
  {
    -[HMDCameraSignificantEventNotificationFilter cloudSignificantEventsByUUID](self, "cloudSignificantEventsByUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateOfOccurrence");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = +[HMDCameraSignificantEventNotificationFilter isRelevantSignificantEventDate:](HMDCameraSignificantEventNotificationFilter, "isRelevantSignificantEventDate:", v9);
  else
    v10 = 0;

  return v10;
}

- (void)_prunePrimaryResidentSignificantEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDCameraSignificantEventNotificationFilter primaryResidentSignificantEventNotificationsByUUID](self, "primaryResidentSignificantEventNotificationsByUUID", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[HMDCameraSignificantEventNotificationFilter primaryResidentSignificantEventNotificationsByUUID](self, "primaryResidentSignificantEventNotificationsByUUID");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = +[HMDCameraSignificantEventNotificationFilter isRelevantSignificantEventDate:](HMDCameraSignificantEventNotificationFilter, "isRelevantSignificantEventDate:", v12);

        if ((v10 & 1) == 0)
        {
          -[HMDCameraSignificantEventNotificationFilter primaryResidentSignificantEventNotificationsByUUID](self, "primaryResidentSignificantEventNotificationsByUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)_pruneCloudSignificantEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDCameraSignificantEventNotificationFilter cloudSignificantEventsByUUID](self, "cloudSignificantEventsByUUID", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[HMDCameraSignificantEventNotificationFilter cloudSignificantEventsByUUID](self, "cloudSignificantEventsByUUID");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "dateOfOccurrence");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = +[HMDCameraSignificantEventNotificationFilter isRelevantSignificantEventDate:](HMDCameraSignificantEventNotificationFilter, "isRelevantSignificantEventDate:", v12);

        if ((v10 & 1) == 0)
        {
          -[HMDCameraSignificantEventNotificationFilter cloudSignificantEventsByUUID](self, "cloudSignificantEventsByUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (NSMutableDictionary)primaryResidentSignificantEventNotificationsByUUID
{
  return self->_primaryResidentSignificantEventNotificationsByUUID;
}

- (NSMutableDictionary)cloudSignificantEventsByUUID
{
  return self->_cloudSignificantEventsByUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSignificantEventsByUUID, 0);
  objc_storeStrong((id *)&self->_primaryResidentSignificantEventNotificationsByUUID, 0);
}

+ (BOOL)isRelevantSignificantEventDate:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceNow");
  return v3 >= -900.0;
}

@end
