@implementation BLFamilyCircleController

+ (id)sharedInstance
{
  if (qword_254B61C98 != -1)
    dispatch_once(&qword_254B61C98, &unk_24CE8CB10);
  return (id)qword_253DB2070;
}

- (BLFamilyCircleController)init
{
  BLFamilyCircleController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *cachedDSIDs;
  uint64_t v11;
  NSMutableSet *ignoredDSIDs;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BLFamilyCircleController;
  v2 = -[BLFamilyCircleController init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.iBooks.BLFamilyCircleController", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeStoreAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    cachedDSIDs = v2->_cachedDSIDs;
    v2->_cachedDSIDs = (NSMutableSet *)v9;

    if (v8)
      -[NSMutableSet addObject:](v2->_cachedDSIDs, "addObject:", v8);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    ignoredDSIDs = v2->_ignoredDSIDs;
    v2->_ignoredDSIDs = (NSMutableSet *)v11;

  }
  return v2;
}

- (void)refreshWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location[2];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeStoreAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE0FBF8], "defaultBag");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08198]), "initWithAccount:bag:", v6, v7);
    objc_msgSend(v8, "performFamilyInfoLookup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_212CC7388;
    v13[3] = &unk_24CE8CB60;
    v13[4] = self;
    objc_copyWeak(&v15, location);
    v14 = v4;
    objc_msgSend(v9, "addFinishBlock:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
LABEL_7:

    goto LABEL_8;
  }
  BLFamilyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to look up family circle without a logged in account", (uint8_t *)location, 2u);
  }

  -[BLFamilyCircleController ignoredDSIDs](self, "ignoredDSIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199A44E0](v4);
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    ((void (**)(_QWORD, void *, void *, void *))v7)[2](v7, v8, v9, v12);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)dq_processFamilyCircle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeStoreAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLFamilyCircleController cachedDSIDs](self, "cachedDSIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v12, "mutableCopy");

  if (objc_msgSend(v6, "count"))
  {
    v48 = v10;
    v49 = v7;
    objc_msgSend(v6, "valueForKey:", CFSTR("iTunesDSID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v13);

    objc_msgSend(v6, "valueForKey:", CFSTR("iCloudDSID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v14);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v50 = v6;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    if (!v17)
      goto LABEL_20;
    v18 = v17;
    v19 = *(_QWORD *)v53;
    while (1)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isCurrentSignedInUser") & 1) == 0)
        {
          v22 = objc_msgSend(v21, "isSharingPurchases");
          objc_msgSend(v21, "iCloudDSID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v22 & 1) != 0)
          {
            if (v23)
            {
              -[BLFamilyCircleController ignoredDSIDs](self, "ignoredDSIDs");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "iCloudDSID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "removeObject:", v25);

            }
            objc_msgSend(v21, "iTunesDSID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              -[BLFamilyCircleController ignoredDSIDs](self, "ignoredDSIDs");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "iTunesDSID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "removeObject:", v28);

LABEL_17:
              continue;
            }
          }
          else
          {
            if (v23)
            {
              objc_msgSend(v21, "iCloudDSID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v29);

            }
            objc_msgSend(v21, "iTunesDSID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              objc_msgSend(v21, "iTunesDSID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v27);
              goto LABEL_17;
            }
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
      if (!v18)
      {
LABEL_20:

        -[BLFamilyCircleController ignoredDSIDs](self, "ignoredDSIDs");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "minusSet:", v31);

        -[BLFamilyCircleController ignoredDSIDs](self, "ignoredDSIDs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "intersectSet:", v11);

        -[BLFamilyCircleController ignoredDSIDs](self, "ignoredDSIDs");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "unionSet:", v15);

        v34 = v51;
        objc_msgSend(v51, "unionSet:", v15);
        -[BLFamilyCircleController ignoredDSIDs](self, "ignoredDSIDs");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "minusSet:", v35);

        v7 = v49;
        v6 = v50;
        v10 = v48;
        goto LABEL_24;
      }
    }
  }
  if (v10)
    objc_msgSend(v11, "addObject:", v10);
  -[BLFamilyCircleController ignoredDSIDs](self, "ignoredDSIDs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeAllObjects");

  v34 = v51;
LABEL_24:
  v37 = (void *)objc_msgSend(v11, "mutableCopy");
  -[BLFamilyCircleController cachedDSIDs](self, "cachedDSIDs");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minusSet:", v38);

  objc_msgSend(v34, "minusSet:", v11);
  -[BLFamilyCircleController cachedDSIDs](self, "cachedDSIDs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  objc_msgSend(v40, "intersectSet:", v11);
  v41 = (void *)objc_msgSend(v11, "mutableCopy");
  -[BLFamilyCircleController setCachedDSIDs:](self, "setCachedDSIDs:", v41);

  BLFamilyLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = objc_msgSend(v37, "count");
    v44 = objc_msgSend(v34, "count");
    v45 = objc_msgSend(v40, "count");
    *(_DWORD *)buf = 138413570;
    v57 = v37;
    v58 = 2048;
    v59 = v43;
    v60 = 2112;
    v61 = v34;
    v62 = 2048;
    v63 = v44;
    v64 = 2112;
    v65 = v40;
    v66 = 2048;
    v67 = v45;
    _os_log_impl(&dword_212C78000, v42, OS_LOG_TYPE_DEFAULT, "Processed Family:  Added: %@ (%lu) | Removed: %@ (%lu) | Unchanged: %@ (%lu)", buf, 0x3Eu);
  }

  v46 = MEMORY[0x2199A44E0](v7);
  v47 = (void *)v46;
  if (v46)
    (*(void (**)(uint64_t, void *, void *, void *))(v46 + 16))(v46, v37, v34, v40);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSMutableSet)cachedDSIDs
{
  return self->_cachedDSIDs;
}

- (void)setCachedDSIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDSIDs, a3);
}

- (NSMutableSet)ignoredDSIDs
{
  return self->_ignoredDSIDs;
}

- (void)setIgnoredDSIDs:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredDSIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredDSIDs, 0);
  objc_storeStrong((id *)&self->_cachedDSIDs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
