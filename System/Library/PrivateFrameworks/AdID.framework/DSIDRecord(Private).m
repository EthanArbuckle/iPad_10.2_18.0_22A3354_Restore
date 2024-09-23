@implementation DSIDRecord(Private)

- (uint64_t)hasIDForClientType:()Private
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(v4, "ADIDRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v4, "idForClientType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = StringIsFromUUID();

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Generating IDs due to client type %ld not being in UUID format"), a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v15 = CFSTR("ClientIDType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = 1;
LABEL_6:
  objc_sync_exit(v4);

  return v10;
}

- (void)removeIDForClientType:()Private
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend(obj, "ADIDRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(obj, "ADIDRecords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    objc_msgSend(obj, "setDirty:", 1);
  }
  objc_sync_exit(obj);

}

- (void)ensureiAdIDs
{
  uint64_t v1;
  int v2;
  uint64_t i;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v1 = 0;
  v2 = 0;
  do
  {
    if (v1 != 1)
      v2 |= objc_msgSend(obj, "hasIDForClientType:", v1) ^ 1;
    ++v1;
  }
  while (v1 != 5);
  if (v2 & 1 | ((objc_msgSend(obj, "hasIDForClientType:", 6) & 1) == 0))
  {
    for (i = 0; i != 5; ++i)
    {
      v4 = objc_alloc_init(MEMORY[0x24BE021D8]);
      objc_msgSend(obj, "ADIDRecords");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(obj, "ADIDRecords");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "DSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ClientTypeToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Generated ID %@ for DSID %@ and client type %ld(%@)"), v10, v11, i, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    objc_msgSend(obj, "setLastSentSegmentDataTimestamp:", 0);
    v14 = objc_alloc_init(MEMORY[0x24BE021D8]);
    objc_msgSend(obj, "ADIDRecords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(obj, "ADIDRecords");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "DSID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ClientTypeToString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Generated ID %@ for DSID %@ and client type %ld(%@)"), v20, v21, 6, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setDeviceIDRotationTimestamp:", objc_msgSend(v24, "AD_toSinceReferenceTime"));

  }
  objc_sync_exit(obj);

}

- (BOOL)resetDeviceNewsPlusSubscriberIDIfNeeded
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "AD_toSinceReferenceTime");

  v4 = v3 - objc_msgSend(a1, "deviceIDRotationTimestamp");
  if (v4 <= 86399)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("It has not yet been 24 hours since deviceID was rotated. Last rotated at %d"), objc_msgSend(a1, "deviceIDRotationTimestamp"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }
  else
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Resetting deviceNewsPlusSubscriberID at time %d for DSID record %@."), v3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(v5, "ADIDRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__DSIDRecord_Private__resetDeviceNewsPlusSubscriberIDIfNeeded__block_invoke;
    v11[3] = &unk_24D710760;
    v11[4] = v5;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

    objc_msgSend(v5, "setDeviceIDRotationTimestamp:", v3);
    objc_sync_exit(v5);
  }

  return v4 > 86399;
}

- (uint64_t)isActiveRecord
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "DSID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDSIDRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v1, "isEqualToString:", v4);

  return v5;
}

- (void)retrieveSegmentDataFromiTunes:()Private
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ADSegmentDataManager sharedInstance](ADSegmentDataManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retrieveSegmentData:forceSegments:completionHandler:", v5, 0, v4);

}

- (void)sendSegmentDataToAdPlatforms:()Private
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ADSegmentDataManager sharedInstance](ADSegmentDataManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendSegmentDataToAdPlatforms:completionHandler:", v5, v4);

}

- (void)sendPersonalizedAdsStatusToAdPlatforms:()Private
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ADPersonalizedAdsStatusManager sharedInstance](ADPersonalizedAdsStatusManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendPersonalizedAdsStatusToAdPlatforms:completionHandler:", v5, v4);

}

- (BOOL)isEqual:()Private
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL8 v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;

  v4 = a3;
  if (v4 == a1)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(a1, "DSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "DSID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
        goto LABEL_25;
      objc_msgSend(a1, "ADIDRecords");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ADIDRecords");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_25;
      objc_msgSend(a1, "segmentData");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v5, "segmentData");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(a1, "segmentData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "segmentData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (!v18)
            goto LABEL_25;
        }
        else
        {

        }
      }
      v20 = objc_msgSend(a1, "accountIsT13");
      if (v20 == objc_msgSend(v5, "accountIsT13"))
      {
        v21 = objc_msgSend(a1, "accountIsU18");
        if (v21 == objc_msgSend(v5, "accountIsU18"))
        {
          v22 = objc_msgSend(a1, "accountIsU13");
          if (v22 == objc_msgSend(v5, "accountIsU13"))
          {
            v23 = objc_msgSend(a1, "sensitiveContentEligible");
            if (v23 == objc_msgSend(v5, "sensitiveContentEligible"))
            {
              v24 = objc_msgSend(a1, "effectiveBirthYear");
              if (v24 == objc_msgSend(v5, "effectiveBirthYear"))
              {
                v25 = objc_msgSend(a1, "noiseAppliedVersion");
                if (v25 == objc_msgSend(v5, "noiseAppliedVersion"))
                {
                  v26 = objc_msgSend(a1, "lastSentPersonalizedAdsStatus");
                  if (v26 == objc_msgSend(v5, "lastSentPersonalizedAdsStatus"))
                  {
                    v27 = objc_msgSend(a1, "personalizedAdsTimestamp");
                    if (v27 == objc_msgSend(v5, "personalizedAdsTimestamp"))
                    {
                      v28 = objc_msgSend(a1, "lastSentSegmentDataTimestamp");
                      if (v28 == objc_msgSend(v5, "lastSentSegmentDataTimestamp"))
                      {
                        v29 = objc_msgSend(a1, "segmentDataTimestamp");
                        if (v29 == objc_msgSend(v5, "segmentDataTimestamp"))
                        {
                          v30 = objc_msgSend(a1, "lastSentPersonalizedAdsTimestamp");
                          if (v30 == objc_msgSend(v5, "lastSentPersonalizedAdsTimestamp"))
                          {
                            v31 = objc_msgSend(a1, "lastSegmentServedTimestamp");
                            if (v31 == objc_msgSend(v5, "lastSegmentServedTimestamp"))
                            {
                              v32 = objc_msgSend(a1, "deviceIDRotationTimestamp");
                              v19 = v32 == objc_msgSend(v5, "deviceIDRotationTimestamp");
LABEL_26:

                              goto LABEL_27;
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
LABEL_25:
      v19 = 0;
      goto LABEL_26;
    }
    v19 = 0;
  }
LABEL_27:

  return v19;
}

@end
