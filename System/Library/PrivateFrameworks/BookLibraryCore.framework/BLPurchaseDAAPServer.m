@implementation BLPurchaseDAAPServer

+ (id)sharedSession
{
  if (qword_253DB1FA8 != -1)
    dispatch_once(&qword_253DB1FA8, &unk_24CE8C248);
  return (id)qword_253DB1FA0;
}

+ (id)_clientIdentifier
{
  return CFSTR("com.apple.iBooks");
}

- (void)valueForDAAPBagKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CB76FC;
  v10[3] = &unk_24CE8C270;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BLPurchaseDAAPServer serverParametersWithCompletionHandler:](self, "serverParametersWithCompletionHandler:", v10);

}

- (void)timeIntervalFromDAAPBagKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212CB7878;
  v8[3] = &unk_24CE8C298;
  v9 = v6;
  v7 = v6;
  -[BLPurchaseDAAPServer valueForDAAPBagKey:completion:](self, "valueForDAAPBagKey:completion:", a3, v8);

}

- (void)appRefreshesOnLaunchWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB798C;
  v6[3] = &unk_24CE8C298;
  v7 = v4;
  v5 = v4;
  -[BLPurchaseDAAPServer valueForDAAPBagKey:completion:](self, "valueForDAAPBagKey:completion:", CFSTR("update-on-app-focus-enabled"), v6);

}

- (void)pollingFrequencyWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB7AA8;
  v6[3] = &unk_24CE8C2C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BLPurchaseDAAPServer timeIntervalFromDAAPBagKey:completion:](self, "timeIntervalFromDAAPBagKey:completion:", CFSTR("update-polling-frequency-seconds"), v6);

}

- (void)databaseIDWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB7B68;
  v6[3] = &unk_24CE8C298;
  v7 = v4;
  v5 = v4;
  -[BLPurchaseDAAPServer valueForDAAPBagKey:completion:](self, "valueForDAAPBagKey:completion:", CFSTR("database-id"), v6);

}

- (void)forcedRefreshFrequencyWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB7C78;
  v6[3] = &unk_24CE8C2E8;
  v7 = v4;
  v5 = v4;
  -[BLPurchaseDAAPServer timeIntervalFromDAAPBagKey:completion:](self, "timeIntervalFromDAAPBagKey:completion:", CFSTR("forced-refresh-frequency-minutes"), v6);

}

- (void)resetWithQueue:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CB7CE4;
  block[3] = &unk_24CE8C310;
  block[4] = self;
  dispatch_async((dispatch_queue_t)a3, block);
}

- (void)serverParametersWithCompletionHandler:(id)a3
{
  id v4;
  BUBag *bag;
  BUBag *v6;
  BUBag *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  bag = self->_bag;
  if (!bag)
  {
    objc_msgSend(MEMORY[0x24BE0FBF8], "defaultBag");
    v6 = (BUBag *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bag;
    self->_bag = v6;

    bag = self->_bag;
  }
  -[BUBag purchaseDAAP](bag, "purchaseDAAP");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CB7E00;
  v10[3] = &unk_24CE8C338;
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "valueWithCompletion:", v10);

}

- (id)_dataForArtRequest:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  double v21;
  double v22;
  BLDAAPBuffer *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  id v35;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _QWORD v53[2];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x24BDAC8D0];
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v4, "newManagedObjectContext");

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLPurchaseDAAPServer dsid](self, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemsFetchRequestForDSIDs:", v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v53[0] = CFSTR("storeID");
  v53[1] = CFSTR("cloudID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPropertiesToFetch:", v8);

  v48 = 0;
  objc_msgSend(v37, "executeFetchRequest:error:", v38, &v48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v9;
  v35 = v48;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v9, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v14, "storeID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!a3)
          {
            +[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "imageManagerDelegate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "imageExistsForStoreID:", v15);

            if (v18)
              objc_msgSend(v39, "removeObject:", v14);
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v39, "count"))
    {
      v19 = objc_msgSend(v39, "count");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSince1970");
      v22 = v21;

      v23 = objc_alloc_init(BLDAAPBuffer);
      v24 = (16 * v19);
      -[BLDAAPBuffer appendHeader:size:](v23, "appendHeader:size:", 1634026049, (v24 + 32));
      -[BLDAAPBuffer appendUInt32:withCode:](v23, "appendUInt32:withCode:", v22, 1836282979);
      -[BLPurchaseDAAPServer sessionID](self, "sessionID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLDAAPBuffer appendUInt32:withCode:](v23, "appendUInt32:withCode:", objc_msgSend(v25, "unsignedIntValue"), 1835821412);

      -[BLDAAPBuffer appendHeader:size:](v23, "appendHeader:size:", 1835623521, v24);
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v26 = v39;
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v41 != v28)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "cloudID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "unsignedLongLongValue");

            -[BLDAAPBuffer appendUInt64:withCode:](v23, "appendUInt64:withCode:", v31, 1835625572);
          }
          v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        }
        while (v27);
      }

      -[BLDAAPBuffer data](v23, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }

  }
  BLJaliscoLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v35;
    _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_ERROR, "Art Request: Couldn't find items to refresh artwork with.  %@", buf, 0xCu);
  }
  v32 = 0;
LABEL_25:

  return v32;
}

- (void)updateItemImageURLsIgnoringCache:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;
  id buf;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  BLJaliscoLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[BLPurchaseDAAPServer dsid](self, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v4;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "Art Request: updateItemImageURLsIgnoringCache %d dsid:%@", (uint8_t *)&buf, 0x12u);

  }
  objc_initWeak(&buf, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CB8648;
  v10[3] = &unk_24CE8C3D8;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v13 = v4;
  objc_copyWeak(&v12, &buf);
  -[BLPurchaseDAAPServer _shouldMakeRequest:](self, "_shouldMakeRequest:", v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&buf);
}

- (id)_dataForHideItemsRequestWithStoreIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  BLDAAPBuffer *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  const __CFString *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v4, "newManagedObjectContext");

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLPurchaseDAAPServer dsid](self, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestForStoreIDs:dsids:", v30, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = CFSTR("cloudID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v9);

  v36 = 0;
  objc_msgSend(v31, "executeFetchRequest:error:", v8, &v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v36;
  if (objc_msgSend(v10, "count"))
  {
    +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "newManagedObjectContext");

    -[BLPurchaseDAAPServer _localServerDatabaseRevisionInMoc:](self, "_localServerDatabaseRevisionInMoc:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v16;

    v18 = objc_alloc_init(BLDAAPBuffer);
    v19 = (16 * v14);
    -[BLDAAPBuffer appendHeader:size:](v18, "appendHeader:size:", 1835360882, (v19 + 65));
    -[BLDAAPBuffer appendUInt32:withCode:](v18, "appendUInt32:withCode:", v17, 1836282979);
    -[BLPurchaseDAAPServer sessionID](self, "sessionID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDAAPBuffer appendUInt32:withCode:](v18, "appendUInt32:withCode:", objc_msgSend(v20, "unsignedIntValue"), 1835821412);

    -[BLDAAPBuffer appendUInt32:withCode:](v18, "appendUInt32:withCode:", objc_msgSend(v13, "unsignedIntValue"), 1836413810);
    -[BLDAAPBuffer appendUInt8:withCode:](v18, "appendUInt8:withCode:", 2, 1835625316);
    -[BLDAAPBuffer appendHeader:size:](v18, "appendHeader:size:", 1835623521, v19);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v10;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v33;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v24), "cloudID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "unsignedLongLongValue");

          -[BLDAAPBuffer appendUInt64:withCode:](v18, "appendUInt64:withCode:", v26, 1835625572);
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v22);
    }

    -[BLDAAPBuffer appendUInt32:withCode:](v18, "appendUInt32:withCode:", 0x400000, 1634028907);
    -[BLDAAPBuffer data](v18, "data");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)_updateVersionAfterHideRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("dmap.serverrevision"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newManagedObjectContext");

  if (!v4)
  {
    BLJaliscoLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "No server version returned in kDMAPEditCommandBulkResponseCode", buf, 2u);
    }
    goto LABEL_8;
  }
  v11 = 0;
  v7 = -[BLPurchaseDAAPServer _updatePersistentServerRevision:moc:error:](self, "_updatePersistentServerRevision:moc:error:", v4, v6, &v11);
  v8 = v11;
  if (v8)
  {
    v9 = v8;
    BLJaliscoLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_ERROR, "Error saving server version after hiding.  %@", buf, 0xCu);
    }

LABEL_8:
  }

}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BLJaliscoLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[BLPurchaseDAAPServer dsid](self, "dsid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "HideItems: dsid:%@ storeIDS:%@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212CB9B88;
  v12[3] = &unk_24CE8C450;
  v12[4] = self;
  v10 = v7;
  v14 = v10;
  v11 = v6;
  v13 = v11;
  objc_copyWeak(&v15, (id *)buf);
  -[BLPurchaseDAAPServer _shouldMakeRequest:](self, "_shouldMakeRequest:", v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak((id *)buf);
}

- (void)setupWithReason:(int64_t)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212CBA7AC;
  v12[3] = &unk_24CE8C518;
  v14 = v9;
  v15 = a3;
  v12[4] = self;
  v13 = v8;
  v10 = v8;
  v11 = v9;
  dispatch_async(v10, v12);

}

- (void)fetchAllItemsPolitely:(BOOL)a3 reason:(int64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  __int128 *p_buf;
  BOOL v20;
  __int128 buf;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  BLJaliscoLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[BLPurchaseDAAPServer dsid](self, "dsid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_DEFAULT, "Fetching purchase history for %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x2020000000;
  v23 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CBAE08;
  block[3] = &unk_24CE8C720;
  block[4] = self;
  v17 = v10;
  v20 = a3;
  v18 = v11;
  p_buf = &buf;
  v14 = v11;
  v15 = v10;
  dispatch_async(v15, block);

  _Block_object_dispose(&buf, 8);
}

- (BLPurchaseDAAPServer)initWithDSID:(id)a3 delegate:(id)a4 privacyInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLPurchaseDAAPServer *v12;
  BKPurchaseDAAPBackoff *v13;
  BKPurchaseDAAPBackoff *backoff;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *updateItemsQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *backoffQueue;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)BLPurchaseDAAPServer;
  v12 = -[BLPurchaseDAAPServer init](&v25, sel_init);
  if (v12)
  {
    v13 = objc_alloc_init(BKPurchaseDAAPBackoff);
    backoff = v12->_backoff;
    v12->_backoff = v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("DAAP_Server_Update_Queue", v15);
    updateItemsQueue = v12->_updateItemsQueue;
    v12->_updateItemsQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("DAAP_Server_Backoff_Queue", v18);
    backoffQueue = v12->_backoffQueue;
    v12->_backoffQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v12->_dsid, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v12->_privacyInfo, a5);
    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activeStoreAccount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ams_DSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_primaryAccount = objc_msgSend(v23, "isEqualToNumber:", v9);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  BKPurchaseDAAPBackoff *backoff;
  OS_dispatch_queue *updateItemsQueue;
  OS_dispatch_queue *backoffQueue;
  BUBag *bag;
  NSDate *DAAPReconnectAt;
  NSMutableSet *setupCompletionHandlers;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  backoff = self->_backoff;
  self->_backoff = 0;

  updateItemsQueue = self->_updateItemsQueue;
  if (updateItemsQueue)
  {
    self->_updateItemsQueue = 0;

  }
  backoffQueue = self->_backoffQueue;
  if (backoffQueue)
  {
    self->_backoffQueue = 0;

  }
  bag = self->_bag;
  self->_bag = 0;

  DAAPReconnectAt = self->_DAAPReconnectAt;
  self->_DAAPReconnectAt = 0;

  setupCompletionHandlers = self->_setupCompletionHandlers;
  self->_setupCompletionHandlers = 0;

  v10.receiver = self;
  v10.super_class = (Class)BLPurchaseDAAPServer;
  -[BLPurchaseDAAPServer dealloc](&v10, sel_dealloc);
}

- (void)contextDidSave:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD16C8];
  v9 = v3;
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationWithName:object:userInfo:", CFSTR("kJaliscoDAAPClientMOCDidSaveNotification"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

}

- (BOOL)_saveInMoc:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBB458];
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_contextDidSave_, *MEMORY[0x24BDBB458], v6);

  LOBYTE(a4) = objc_msgSend(v6, "save:", a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, v8, v6);

  return (char)a4;
}

- (id)_localServerDatabaseRevisionInMoc:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUserSignedInToiTunes");

  if (!v6)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLPurchaseDAAPServer dsid](self, "dsid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v7, "serverInfoForDSID:fromManagedObjectContext:error:", v8, v4, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (!v9)
  {
    if (v10)
    {
      BLJaliscoLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[BLPurchaseDAAPServer dsid](self, "dsid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_ERROR, "Error fetching local info for %@", buf, 0xCu);

      }
      objc_msgSend(v10, "logRecursively");
    }

    goto LABEL_9;
  }
  objc_msgSend(v9, "databaseVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "unsignedLongLongValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v12;
}

- (BOOL)_updatePersistentServerRevision:(id)a3 database:(id)a4 items:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *updateItemsQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  BLPurchaseDAAPServer *v20;
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  id *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_212CBD41C;
  v25[4] = sub_212CBD42C;
  v26 = v10;
  updateItemsQueue = self->_updateItemsQueue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_212CBD434;
  v18[3] = &unk_24CE8C748;
  v19 = v12;
  v20 = self;
  v23 = &v27;
  v24 = a6;
  v21 = v11;
  v22 = v25;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_sync(updateItemsQueue, v18);
  LOBYTE(v11) = *((_BYTE *)v28 + 24);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
  return (char)v11;
}

- (id)_updatePersistentServerRevision:(id)a3 moc:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  id v19;

  v8 = a3;
  v9 = a4;
  -[BLPurchaseDAAPServer dsid](self, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v11, "serverInfoForDSID:fromManagedObjectContext:error:", v10, v9, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;

  if (v12)
    v14 = 1;
  else
    v14 = v13 == 0;
  if (v14)
  {
    if (!v12)
    {
      v15 = -[BLJaliscoServerInfo initIntoManagedObjectContext:]([BLJaliscoServerInfo alloc], "initIntoManagedObjectContext:", v9);
      objc_msgSend(v10, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserUID:", v16);

      v12 = v15;
    }
    objc_msgSend(v8, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDatabaseVersion:", v17);

  }
  else
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }

  return v12;
}

- (id)_updatePersistentDatabase:(id)a3 server:(id)a4 moc:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLPurchaseDAAPServer dsid](self, "dsid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v10, "itemID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v13, "serverDatabaseForDSID:withIdentifier:fromManagedObjectContext:error:", v14, v15, v12, &v21);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v21;

  if (v16 || !v17)
  {
    if (!v16)
    {
      v16 = -[BLJaliscoServerDatabase initIntoManagedObjectContext:]([BLJaliscoServerDatabase alloc], "initIntoManagedObjectContext:", v12);
      objc_msgSend(v16, "setServer:", v11);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v10, "itemID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIdentifier:", v19);

    }
  }
  else
  {
    v16 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v17);
  }

  return v16;
}

- (id)_updatePersistentItems:(id)a3 moc:(id)a4 database:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  BOOL v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t m;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  id v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  id obj;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v112;
  uint64_t i;
  id v114;
  void *v115;
  id v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  id v134;
  uint8_t v135[128];
  uint8_t buf[4];
  void *v137;
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _QWORD v141[4];

  v141[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v114 = a4;
  v100 = v9;
  v101 = a5;
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("dmap.listing"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("dmap.deletedidlisting"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPServer dsid](self, "dsid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v141[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v141, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allItemsFetchRequestForDSIDs:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = 0;
    objc_msgSend(v114, "executeFetchRequest:error:", v13, &v134);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v134;

    if (v107)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v102, "count"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = 0u;
      v133 = 0u;
      v130 = 0u;
      v131 = 0u;
      obj = v102;
      v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v140, 16);
      if (!v106)
        goto LABEL_55;
      v105 = *(_QWORD *)v131;
      while (1)
      {
        for (i = 0; i != v106; ++i)
        {
          if (*(_QWORD *)v131 != v105)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.itms-songid"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x24BDD1758];
          v108 = v15;
          objc_msgSend(v15, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "predicateWithFormat:", CFSTR("storeID = %@"), v17, v98);
          v112 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v107, "filteredArrayUsingPredicate:", v112);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastObject");
          v19 = (id)objc_claimAutoreleasedReturnValue();

          v20 = v19;
          if (!v19)
          {
            v19 = -[BLJaliscoServerItem initIntoManagedObjectContext:]([BLJaliscoServerItem alloc], "initIntoManagedObjectContext:", v114);
            objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.cloud-artwork-token"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setArtworkTokenCode:", v30);

            objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.cloud-artwork-url"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setArtworkURLString:", v24);
            goto LABEL_17;
          }
          objc_msgSend(v19, "artworkTokenCode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v19, "artworkURLString");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 == 0;

            if (!v23)
            {
              objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.cloud-artwork-token"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.cloud-artwork-url"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                if (v24)
                {
                  objc_msgSend(v19, "artworkTokenCode");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v26, "isEqualToString:", v24);

                  if ((v27 & 1) == 0)
                  {
                    objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.cloud-artwork-token"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "setArtworkTokenCode:", v28);

                    objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.cloud-artwork-url"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "setArtworkURLString:", v29);

                  }
                }
              }

LABEL_17:
            }
            v20 = v19;
          }
          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.extended-media-kind"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = v20;
          v31 = objc_msgSend(v109, "unsignedIntegerValue");
          if (v31 == 8 && !-[BLPurchaseDAAPServer isPrimaryAccount](self, "isPrimaryAccount"))
            objc_msgSend(v20, "bl_setNumberIfDifferent:value:", CFSTR("needsImport"), MEMORY[0x24BDBD1C8]);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31 == 8);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setNumberIfDifferent:value:", CFSTR("isAudiobook"), v32);

          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.itms-songid"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringValue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("storeID"), v34);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v14, "itemID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("cloudID"), v36);

          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.display-publication-version"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("displayVersion"), v37);

          objc_msgSend(v14, "objectForKey:", CFSTR("daap.songdisabled"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setNumberIfDifferent:value:", CFSTR("isDisabled"), v38);

          objc_msgSend(v14, "objectForKey:", CFSTR("daap.songcontentrating"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setNumberIfDifferent:value:", CFSTR("isExplicit"), v39);

          objc_msgSend(v14, "objectForKey:", CFSTR("dmap.itemhidden"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setNumberIfDifferent:value:", CFSTR("isHidden"), v40);

          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.cloud-purchased-token"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringValue");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("purchasedTokenCode"), v42);

          objc_msgSend(v14, "objectForKey:", CFSTR("dmap.longitemid"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setNumberIfDifferent:value:", CFSTR("purchaseHistoryID"), v43);

          objc_msgSend(v14, "objectForKey:", CFSTR("daap.songartist"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("artist"), v44);

          objc_msgSend(v14, "objectForKey:", CFSTR("daap.sortartist"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("sortedAuthor"), v45);

          objc_msgSend(v14, "objectForKey:", CFSTR("daap.songgenre"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("genre"), v46);

          objc_msgSend(v14, "name");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("title"), v47);

          objc_msgSend(v14, "objectForKey:", CFSTR("daap.sortname"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("sortedTitle"), v48);

          objc_msgSend(v14, "objectForKey:", CFSTR("daap.songdatepurchased"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setDateIfDifferent:value:", CFSTR("purchasedAt"), v49);

          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.item-flavor-listing"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "lastObject");
          v115 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v115, "objectForKey:", CFSTR("com.apple.itunes.item-redownload-param-2"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("storeDownloadParameters"), v51);

          objc_msgSend(v115, "objectForKey:", CFSTR("daap.songformat"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("fileExtension"), v52);

          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.preorder-expected-date"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setDateIfDifferent:value:", CFSTR("expectedDate"), v53);

          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.chapter-metadata-url"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("chapterMetadataURLString"), v54);

          objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.itunes.store.hls-playback-url"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setStringIfDifferent:value:", CFSTR("hlsPlaylistURLString"), v55);

          -[BLPurchaseDAAPServer dsid](self, "dsid");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bl_setNumberIfDifferent:value:", CFSTR("storeAccountID"), v56);

          objc_msgSend(v14, "objectForKey:", CFSTR("booklets"));
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "booklets");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "allObjects");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          v116 = v110;
          v59 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
          if (v59)
          {
            v60 = *(_QWORD *)v127;
            do
            {
              for (j = 0; j != v59; ++j)
              {
                if (*(_QWORD *)v127 != v60)
                  objc_enumerationMutation(v116);
                v62 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
                objc_msgSend(v62, "objectForKey:", CFSTR("com.apple.itunes.store.booklet-item-store-id"));
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "stringValue");
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeID == %@"), v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "filteredArrayUsingPredicate:", v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "lastObject");
                v67 = (id)objc_claimAutoreleasedReturnValue();

                if (!v67)
                  v67 = -[BLJaliscoServerBookletItem initIntoManagedObjectContext:]([BLJaliscoServerBookletItem alloc], "initIntoManagedObjectContext:", v114);
                objc_msgSend(v67, "bl_setStringIfDifferent:value:", CFSTR("storeID"), v64);
                objc_msgSend(v62, "objectForKey:", CFSTR("com.apple.itunes.store.booklet-item-name"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "bl_setStringIfDifferent:value:", CFSTR("title"), v68);

                objc_msgSend(v62, "objectForKey:", CFSTR("com.apple.itunes.store.booklet-item-redownload-param"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "bl_setStringIfDifferent:value:", CFSTR("storeDownloadParameters"), v69);

                objc_msgSend(v62, "objectForKey:", CFSTR("com.apple.itunes.store.booklet-item-size"));
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "bl_setNumberIfDifferent:value:", CFSTR("size"), v70);

                objc_msgSend(v67, "setParentItem:", v117);
              }
              v59 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
            }
            while (v59);
          }

          v71 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          -[BLPurchaseDAAPServer additionalAudiobookInfoKeys](self, "additionalAudiobookInfoKeys");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
          if (v73)
          {
            v74 = *(_QWORD *)v123;
            do
            {
              for (k = 0; k != v73; ++k)
              {
                if (*(_QWORD *)v123 != v74)
                  objc_enumerationMutation(v72);
                v76 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * k);
                objc_msgSend(v14, "objectForKey:", v76);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v76, "isEqualToString:", CFSTR("daap.songtime")))
                {
                  objc_msgSend(v115, "objectForKey:", CFSTR("daap.songtime"));
                  v78 = objc_claimAutoreleasedReturnValue();

                  v77 = (void *)v78;
                }
                if (v77)
                  objc_msgSend(v71, "setObject:forKey:", v77, v76);

              }
              v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
            }
            while (v73);
          }

          if (objc_msgSend(v71, "count"))
          {
            v79 = (void *)objc_msgSend(v71, "copy");
            objc_msgSend(v117, "bl_setDictionaryIfDifferent:value:", CFSTR("additionalAudiobookInfo"), v79);

          }
          BLJaliscoLog();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v137 = v117;
            _os_log_impl(&dword_212C78000, v80, OS_LOG_TYPE_DEBUG, "[BLPurchaseDAAPServer] Setup item:%@", buf, 0xCu);
          }

          objc_msgSend(v117, "purchasedTokenCode");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v81, "length"))
          {
            objc_msgSend(v117, "storeID");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = objc_msgSend(v82, "length") == 0;

            if (!v83)
            {
              objc_msgSend(v103, "addObject:", v117);
              goto LABEL_53;
            }
          }
          else
          {

          }
          BLJaliscoLog();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v137 = v117;
            _os_log_impl(&dword_212C78000, v84, OS_LOG_TYPE_ERROR, "ERROR: No token/adam id for %@", buf, 0xCu);
          }

LABEL_53:
        }
        v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v140, 16);
        if (!v106)
        {
LABEL_55:

          objc_msgSend(v101, "addItems:", v103);
          BLJaliscoLog();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v137 = v103;
            _os_log_impl(&dword_212C78000, v85, OS_LOG_TYPE_DEFAULT, "[BLPurchaseDAAPServer] Adding items to db:%@ ", buf, 0xCu);
          }

          if (objc_msgSend(v99, "count"))
          {
            v86 = (void *)MEMORY[0x24BDD1758];
            objc_msgSend(v99, "valueForKey:", CFSTR("stringValue"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "predicateWithFormat:", CFSTR("cloudID IN %@"), v87, v98);
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v107, "filteredArrayUsingPredicate:", v88);
            v120 = 0u;
            v121 = 0u;
            v118 = 0u;
            v119 = 0u;
            v89 = (id)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v118, v135, 16);
            if (v90)
            {
              v91 = *(_QWORD *)v119;
              do
              {
                for (m = 0; m != v90; ++m)
                {
                  if (*(_QWORD *)v119 != v91)
                    objc_enumerationMutation(v89);
                  v93 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * m);
                  objc_msgSend(v93, "managedObjectContext");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "deleteObject:", v93);

                }
                v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v118, v135, 16);
              }
              while (v90);
            }

          }
          objc_msgSend(v101, "items");
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_74;
        }
      }
    }
    v95 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v98);
LABEL_74:

  }
  else
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ibooks.jalisco.updating"), 400, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    BLJaliscoLog();
    v96 = objc_claimAutoreleasedReturnValue();
    v102 = v96;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v96, OS_LOG_TYPE_ERROR, "NO UPDATE - daap items missing", buf, 2u);
    }
    v95 = 0;
  }

  return v95;
}

- (void)_sendHandlers:(id)a3 success:(BOOL)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_sendSetupConfigurationHandlersWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableSet *setupCompletionHandlers;
  NSMutableSet *v6;

  v3 = a3;
  -[BLPurchaseDAAPServer setIsServerSetupPending:](self, "setIsServerSetupPending:", 0);
  -[BLPurchaseDAAPServer setIsServerSetup:](self, "setIsServerSetup:", v3);
  setupCompletionHandlers = self->_setupCompletionHandlers;
  if (setupCompletionHandlers)
  {
    -[BLPurchaseDAAPServer _sendHandlers:success:](self, "_sendHandlers:success:", setupCompletionHandlers, v3);
    v6 = self->_setupCompletionHandlers;
    self->_setupCompletionHandlers = 0;

  }
}

- (BOOL)_isGDPRPrivacyAcknowledgementRequired
{
  void *v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  -[BLPurchaseDAAPServer privacyInfo](self, "privacyInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    BLJaliscoLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_ERROR, "Privacy info is nil.", buf, 2u);
    }

  }
  v4 = objc_msgSend(v2, "isGDPRPrivacyAcknowledgementRequired");
  if (v4)
  {
    BLJaliscoLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "Ignoring request due to user has not accepted Books GDPR.", v7, 2u);
    }

  }
  return v4;
}

- (void)_shouldMakeRequest:(id)a3
{
  id v4;
  NSObject *backoffQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  backoffQueue = self->_backoffQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212CBF1D8;
  v7[3] = &unk_24CE8C770;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(backoffQueue, v7);

}

- (void)_preProcessResponse:(id)a3 error:(id)a4 responseBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *backoffQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BLPurchaseDAAPServer *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  backoffQueue = self->_backoffQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_212CBF488;
  v15[3] = &unk_24CE8C798;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(backoffQueue, v15);

}

- (id)_newDefaultAuthenticateOptions
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAuthenticationType:", 1);
  objc_msgSend(v2, "setDebugReason:", CFSTR("Books jalisco purchase"));
  return v2;
}

- (id)_processResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[BLPurchaseDAAPParser decodeData:](BLPurchaseDAAPParser, "decodeData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("dmap.status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "unsignedIntValue") == 200)
    {
      v7 = v5;
    }
    else
    {
      if (objc_msgSend(v6, "unsignedIntValue") == 952)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.itunes.reconnect-interval"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        -[BLPurchaseDAAPServer setDAAPReconnectToTimeIntervalSinceNow:](self, "setDAAPReconnectToTimeIntervalSinceNow:");
        BLJaliscoLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v12 = 138412290;
          v13 = v8;
          _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_INFO, "DAAP reconnect %@", (uint8_t *)&v12, 0xCu);
        }

      }
      else
      {
        BLJaliscoLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v12 = 138412290;
          v13 = v5;
          _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_ERROR, "Unrecognized DAAP Response: %@", (uint8_t *)&v12, 0xCu);
        }

      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)handleClientExpired
{
  id v3;

  while (!__ldxr((unsigned int *)&unk_254B61C90))
  {
    if (!__stxr(1u, (unsigned int *)&unk_254B61C90))
    {
      self->_clientExpired = 1;
      -[BLPurchaseDAAPServer delegate](self, "delegate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "purchaseServerHandleClientExpired");

      return;
    }
  }
  __clrex();
}

- (BOOL)_canMakeDAAPRequest
{
  NSDate *DAAPReconnectAt;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSDate *v8;
  NSDate *v9;
  int v10;
  NSDate *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_clientExpired)
    return 0;
  DAAPReconnectAt = self->_DAAPReconnectAt;
  if (DAAPReconnectAt)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSDate compare:](DAAPReconnectAt, "compare:", v5);

    if (v6 != -1)
    {
      BLJaliscoLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = self->_DAAPReconnectAt;
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "Throttling request until %@", (uint8_t *)&v10, 0xCu);
      }

      return 0;
    }
    v9 = self->_DAAPReconnectAt;
    self->_DAAPReconnectAt = 0;

  }
  return 1;
}

- (void)setDAAPReconnectToTimeIntervalSinceNow:(double)a3
{
  NSDate *v4;
  NSDate *DAAPReconnectAt;

  v4 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", a3);
  DAAPReconnectAt = self->_DAAPReconnectAt;
  self->_DAAPReconnectAt = v4;

}

- (void)_configureWithReason:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  __CFString *v9;
  BLPurchaseDAAPServer *v10;
  id v11;
  int64_t v12;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212CC01D8;
  v8[3] = &unk_24CE8C810;
  v9 = CFSTR("Server-info:");
  v10 = self;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  -[BLPurchaseDAAPServer _shouldMakeRequest:](self, "_shouldMakeRequest:", v8);

}

- (void)_loginWithReason:(int64_t)a3 completion:(id)a4
{
  BLDAAPLoginRequest *v6;
  void *v7;
  BLDAAPLoginRequest *v8;
  id v9;

  v9 = a4;
  v6 = [BLDAAPLoginRequest alloc];
  -[BLPurchaseDAAPServer dsid](self, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BLDAAPLoginRequest initWithDSID:reason:](v6, "initWithDSID:reason:", v7, a3);

  -[BLPurchaseDAAPServer _loginWithRequest:completion:](self, "_loginWithRequest:completion:", v8, v9);
}

- (void)_loginWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BLPurchaseDAAPServer *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CC09A0;
  v10[3] = &unk_24CE8C838;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[BLPurchaseDAAPServer _shouldMakeRequest:](self, "_shouldMakeRequest:", v10);

}

- (void)_pollLatestRevisionWithReason:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212CC0FAC;
  v8[3] = &unk_24CE8C8B0;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[BLPurchaseDAAPServer _shouldMakeRequest:](self, "_shouldMakeRequest:", v8);

}

- (void)_fetchDatabaseWithReason:(int64_t)a3 localServerRevision:(id)a4 latestVersion:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  BLDAAPDatabasesRequest *v13;
  void *v14;
  void *v15;
  BLDAAPDatabasesRequest *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = [BLDAAPDatabasesRequest alloc];
  -[BLPurchaseDAAPServer dsid](self, "dsid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLPurchaseDAAPServer sessionID](self, "sessionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BLDAAPDatabasesRequest initWithDSID:reason:sessionID:revisionNumber:delta:](v13, "initWithDSID:reason:sessionID:revisionNumber:delta:", v14, a3, v15, v11, v10);

  if (v16)
  {
    -[BLPurchaseDAAPServer _fetchDatabaseWithRequest:completionHandler:](self, "_fetchDatabaseWithRequest:completionHandler:", v16, v12);
  }
  else
  {
    BLJaliscoLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[BLPurchaseDAAPServer dsid](self, "dsid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLPurchaseDAAPServer sessionID](self, "sessionID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138413314;
      v23 = v18;
      v24 = 2048;
      v25 = a3;
      v26 = 2114;
      v27 = v19;
      v28 = 2114;
      v29 = v11;
      v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_ERROR, "DAAP DB Fetch: Missing a parameter type. dsid:(%@) reason:(%ld) sessionID: %{public}@ revisionNumber:%{public}@ delta:%{public}@", (uint8_t *)&v22, 0x34u);

    }
    v20 = MEMORY[0x2199A44E0](v12);
    v21 = (void *)v20;
    if (v20)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v20 + 16))(v20, 0, 0);

  }
}

- (void)_fetchDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  const __CFString *v13;
  id v14;
  BLPurchaseDAAPServer *v15;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_212CC1AD8;
    v12[3] = &unk_24CE8C928;
    v13 = CFSTR("DB Fetch:");
    v16 = v7;
    v14 = v6;
    v15 = self;
    -[BLPurchaseDAAPServer _shouldMakeRequest:](self, "_shouldMakeRequest:", v12);

    v9 = (void *)v13;
  }
  else
  {
    BLJaliscoLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = CFSTR("DB Fetch:");
      _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_ERROR, "%@ No server revision or databaseRequest to fetch databases from.", buf, 0xCu);
    }

    v11 = MEMORY[0x2199A44E0](v8);
    v9 = (void *)v11;
    if (v11)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v11 + 16))(v11, 0, 0);
  }

}

- (id)daapQueryFilterString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BLPurchaseDAAPServer isPrimaryAccount](self, "isPrimaryAccount"))
    objc_msgSend(v3, "addObject:", &unk_24CEA08C8);
  objc_msgSend(v3, "addObject:", &unk_24CEA08E0);
  objc_msgSend(CFSTR("com.apple.itunes.extended-media-kind"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("\\-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "intValue");
        objc_msgSend(v10, "stringWithFormat:", CFSTR("'%@:%d'"), v4, v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)daapMetaDataFilterString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[BLPurchaseDAAPServer additionalAudiobookInfoKeys](self, "additionalAudiobookInfoKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24CEA0A20, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLPurchaseDAAPServer bookletKeys](self, "bookletKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)additionalAudiobookInfoKeys
{
  return &unk_24CEA0A38;
}

- (id)bookletKeys
{
  return &unk_24CEA0A50;
}

- (id)_dataForItemsRequestWithLocalVersion:(id)a3 serverVersion:(id)a4 tokenPairs:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v14 = v7;
  v15 = a5;
  v9 = v15;
  v10 = v7;
  v11 = v8;
  ICDAAPUtilitiesCreateDataForContainer();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_fetchItemsWithLocalVersion:(id)a3 serverVersion:(id)a4 reason:(int64_t)a5 tokenPairs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  const __CFString *v24;
  BLPurchaseDAAPServer *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  BLJaliscoLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[BLPurchaseDAAPServer dsid](self, "dsid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v17;
    v33 = 2112;
    v34 = v13;
    v35 = 2048;
    v36 = a5;
    _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_DEFAULT, "[BLPurchaseDAAPServer] _fetchItemsWithLocalVersion dsid:%@ serverVersion:%@ reason:%ld", buf, 0x20u);

  }
  if (!v12
    || (-[BLPurchaseDAAPServer bagDatabaseID](self, "bagDatabaseID"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = v18 == 0,
        v18,
        v19))
  {
    BLJaliscoLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_ERROR, "No database to fetch items with.", buf, 2u);
    }

    v22 = MEMORY[0x2199A44E0](v15);
    v20 = (void *)v22;
    if (v22)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v22 + 16))(v22, 0, 0);
  }
  else
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_212CC2C04;
    v23[3] = &unk_24CE8CA40;
    v24 = CFSTR("Fetch items");
    v29 = v15;
    v25 = self;
    v26 = v12;
    v27 = v13;
    v28 = v14;
    v30 = a5;
    -[BLPurchaseDAAPServer _shouldMakeRequest:](self, "_shouldMakeRequest:", v23);

    v20 = (void *)v24;
  }

}

- (BOOL)isServerSetup
{
  return self->_isServerSetup;
}

- (void)setIsServerSetup:(BOOL)a3
{
  self->_isServerSetup = a3;
}

- (BOOL)isServerSetupPending
{
  return self->_isServerSetupPending;
}

- (void)setIsServerSetupPending:(BOOL)a3
{
  self->_isServerSetupPending = a3;
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)_setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (BOOL)isPrimaryAccount
{
  return self->_primaryAccount;
}

- (NSNumber)bagDatabaseID
{
  return self->_bagDatabaseID;
}

- (void)setBagDatabaseID:(id)a3
{
  objc_storeStrong((id *)&self->_bagDatabaseID, a3);
}

- (BLPurchaseDAAPServerDelegate)delegate
{
  return (BLPurchaseDAAPServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BLPrivacyInfo)privacyInfo
{
  return self->_privacyInfo;
}

- (void)setPrivacyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_privacyInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bagDatabaseID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_backoffQueue, 0);
  objc_storeStrong((id *)&self->_updateItemsQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_backoff, 0);
  objc_storeStrong((id *)&self->_setupCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_DAAPReconnectAt, 0);
  objc_storeStrong((id *)&self->_lastPolledAt, 0);
}

@end
