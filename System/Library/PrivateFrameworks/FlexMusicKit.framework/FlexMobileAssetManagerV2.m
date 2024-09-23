@implementation FlexMobileAssetManagerV2

- (FlexMobileAssetManagerV2)initWithLibrary:(id)a3 options:(id)a4
{
  id v6;
  FlexMobileAssetManagerV2 *v7;
  uint64_t v8;
  NSObject *downloadThrottleLock;
  uint64_t v10;
  NSObject *mobileAssetCacheLock;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableOrderedSet *pendingDownloadSet;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableSet *processingDownloadSet;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSMapTable *dowloadOptionsMapping;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableOrderedSet *pendingPurgeSet;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableSet *processingPurgeSet;
  NSObject *v40;
  dispatch_queue_t v41;
  OS_dispatch_queue *purgeQueue;
  NSObject *v43;
  dispatch_queue_t v44;
  OS_dispatch_queue *triggerDownloadAndPurgeQueue;
  NSObject *v46;
  dispatch_queue_t v47;
  OS_dispatch_queue *downloadRequestQueue;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSString *clientID;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSString *mobileAssetTypeIdentifier;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  FlexMobileAssetManagerV2 *v72;
  objc_super v74;

  v6 = a4;
  v74.receiver = self;
  v74.super_class = (Class)FlexMobileAssetManagerV2;
  v7 = -[FlexCloudManager initWithLibrary:](&v74, sel_initWithLibrary_, a3);
  if (v7)
  {
    if (objc_opt_class() && objc_opt_class())
    {
      v8 = objc_opt_new();
      downloadThrottleLock = v7->_downloadThrottleLock;
      v7->_downloadThrottleLock = v8;

      v10 = objc_opt_new();
      mobileAssetCacheLock = v7->_mobileAssetCacheLock;
      v7->_mobileAssetCacheLock = v10;

      objc_msgSend_orderedSet(MEMORY[0x24BDBCEE0], v12, v13, v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      pendingDownloadSet = v7->_pendingDownloadSet;
      v7->_pendingDownloadSet = (NSMutableOrderedSet *)v16;

      objc_msgSend_set(MEMORY[0x24BDBCEF0], v18, v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      processingDownloadSet = v7->_processingDownloadSet;
      v7->_processingDownloadSet = (NSMutableSet *)v22;

      objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x24BDD1650], v24, 0, 0, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      dowloadOptionsMapping = v7->_dowloadOptionsMapping;
      v7->_dowloadOptionsMapping = (NSMapTable *)v26;

      objc_msgSend_orderedSet(MEMORY[0x24BDBCEE0], v28, v29, v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      pendingPurgeSet = v7->_pendingPurgeSet;
      v7->_pendingPurgeSet = (NSMutableOrderedSet *)v32;

      objc_msgSend_set(MEMORY[0x24BDBCEF0], v34, v35, v36, v37);
      v38 = objc_claimAutoreleasedReturnValue();
      processingPurgeSet = v7->_processingPurgeSet;
      v7->_processingPurgeSet = (NSMutableSet *)v38;

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = dispatch_queue_create("com.apple.FlexMusic.mobileAssetPurge", v40);
      purgeQueue = v7->_purgeQueue;
      v7->_purgeQueue = (OS_dispatch_queue *)v41;

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = dispatch_queue_create("com.apple.FlexMusic.triggerDownloadAndPurge", v43);
      triggerDownloadAndPurgeQueue = v7->_triggerDownloadAndPurgeQueue;
      v7->_triggerDownloadAndPurgeQueue = (OS_dispatch_queue *)v44;

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = dispatch_queue_create("com.apple.FlexMusic.downloadRequest", v46);
      downloadRequestQueue = v7->_downloadRequestQueue;
      v7->_downloadRequestQueue = (OS_dispatch_queue *)v47;

      objc_msgSend_objectForKey_(v6, v49, (uint64_t)CFSTR("MobileAssets_ClientID"), v50, v51);
      v52 = objc_claimAutoreleasedReturnValue();
      clientID = v7->_clientID;
      v7->_clientID = (NSString *)v52;

      objc_msgSend_objectForKey_(v6, v54, (uint64_t)CFSTR("MobileAssets_AssetTypeIdentifier"), v55, v56);
      v57 = objc_claimAutoreleasedReturnValue();
      mobileAssetTypeIdentifier = v7->_mobileAssetTypeIdentifier;
      v7->_mobileAssetTypeIdentifier = (NSString *)v57;

      if (v7->_clientID && v7->_mobileAssetTypeIdentifier)
      {
        objc_msgSend_objectForKey_(v6, v59, (uint64_t)CFSTR("MobileAssets_ListenToSystemNotifications"), v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
          objc_msgSend__registerAndHandleSystemMobileAssetNotifications(v7, v63, v64, v65, v66);
        objc_msgSend_objectForKey_(v6, v63, (uint64_t)CFSTR("EnableFetchCache"), v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_enableFetchCache = objc_msgSend_BOOLValue(v67, v68, v69, v70, v71);

        goto LABEL_9;
      }

    }
    v72 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v72 = v7;
LABEL_12:

  return v72;
}

- (void)_registerAndHandleSystemMobileAssetNotifications
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *notificationQueue;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id location;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.flexmusic.MANotificationQueue", v3);
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = v4;

  objc_msgSend_stringByAppendingString_(self->_mobileAssetTypeIdentifier, v6, (uint64_t)CFSTR(".ma.new-asset-installed"), v7, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend_cStringUsingEncoding_(v9, v10, 4, v11, v12);

  objc_msgSend_stringByAppendingString_(self->_mobileAssetTypeIdentifier, v14, (uint64_t)CFSTR(".ma.cached-metadata-updated"), v15, v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = (const char *)objc_msgSend_cStringUsingEncoding_(v17, v18, 4, v19, v20);

  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_20D02AE70;
  v23[3] = &unk_24C5F0270;
  objc_copyWeak(&v24, &location);
  v22 = (void *)MEMORY[0x212B9B920](v23);
  if (v13)
    notify_register_dispatch(v13, &self->_assetInstalledNotificationToken, (dispatch_queue_t)self->_notificationQueue, v22);
  if (v21)
    notify_register_dispatch(v21, &self->_catalogUpdatedNotificationToken, (dispatch_queue_t)self->_notificationQueue, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (id)_mobileAssetsForAssetType:(id)a3 andUIDs:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t MetaDataSync;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int v103;
  void *v104;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint8_t v115[128];
  uint8_t buf[4];
  uint64_t v117;
  __int16 v118;
  uint64_t v119;
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BE66BB0]);
  v17 = (void *)objc_msgSend_initWithType_(v13, v14, (uint64_t)self->_mobileAssetTypeIdentifier, v15, v16);
  objc_msgSend_setDoNotBlockBeforeFirstUnlock_(v17, v18, 1, v19, v20);
  objc_msgSend_returnTypes_(v17, v21, 2, v22, v23);
  if (v6)
  {
    if (objc_msgSend_addKeyValuePair_with_(v17, v24, (uint64_t)CFSTR("FMAssetType"), (uint64_t)v6, v25))
    {
      FlexLogForCategory(2uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D016000, v30, OS_LOG_TYPE_DEFAULT, "error setting up query with addKeyValuePair", buf, 2u);
      }

    }
    if (objc_msgSend_count(v7, v26, v27, v28, v29))
    {
      v35 = (void *)objc_msgSend_mutableCopy(v7, v31, v32, v33, v34);
      v38 = objc_msgSend_addKeyValueArray_with_(v17, v36, (uint64_t)CFSTR("uuid"), (uint64_t)v35, v37);

      if (v38)
      {
        FlexLogForCategory(2uLL);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D016000, v39, OS_LOG_TYPE_DEFAULT, "error setting up query with addKeyValueArray", buf, 2u);
        }

      }
    }
  }
  v108 = v7;
  FlexLogForCategory(2uLL);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v117 = (uint64_t)v6;
    _os_log_impl(&dword_20D016000, v40, OS_LOG_TYPE_DEFAULT, "requesting MAAssetQuery for type %@", buf, 0xCu);
  }
  v109 = v6;

  objc_msgSend_date(MEMORY[0x24BDBCE60], v41, v42, v43, v44);
  v45 = objc_claimAutoreleasedReturnValue();
  MetaDataSync = objc_msgSend_queryMetaDataSync(v17, v46, v47, v48, v49);
  objc_msgSend_setXMLPresent_(self, v51, MetaDataSync != 2, v52, v53);
  FlexLogForCategory(2uLL);
  v54 = objc_claimAutoreleasedReturnValue();
  v110 = v17;
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_results(v17, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_count(v59, v60, v61, v62, v63);
    objc_msgSend_date(MEMORY[0x24BDBCE60], v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v69, v70, v45, v71, v72);
    *(_DWORD *)buf = 134218240;
    v117 = v64;
    v118 = 2048;
    v119 = v73;
    _os_log_impl(&dword_20D016000, v54, OS_LOG_TYPE_DEFAULT, "%ld assets queried in %.2f seconds\n", buf, 0x16u);

  }
  v106 = v45;
  if (MetaDataSync == 2)
  {
    FlexLogForCategory(2uLL);
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v78, OS_LOG_TYPE_DEFAULT, "XML not present", buf, 2u);
    }
  }
  else
  {
    if (!MetaDataSync)
      goto LABEL_22;
    FlexLogForCategory(2uLL);
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend__mobileAssetQueryResultStringValue_(self, v79, MetaDataSync, v80, v81, v45, v108, v6);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v117 = (uint64_t)v82;
      _os_log_impl(&dword_20D016000, v78, OS_LOG_TYPE_DEFAULT, "MetaDataSync query failed with error code %@", buf, 0xCu);

    }
  }

LABEL_22:
  objc_msgSend_results(v17, v74, v75, v76, v77, v106);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v111, (uint64_t)v115, 16);
  if (v85)
  {
    v90 = v85;
    v91 = *(_QWORD *)v112;
    do
    {
      for (i = 0; i != v90; ++i)
      {
        if (*(_QWORD *)v112 != v91)
          objc_enumerationMutation(v83);
        v93 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
        objc_msgSend_attributes(v93, v86, v87, v88, v89);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v94, v95, (uint64_t)CFSTR("_CompatibilityVersion"), v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend_intValue(v98, v99, v100, v101, v102) - 1;

        if (v103 <= 3)
          objc_msgSend_addObject_(v12, v86, (uint64_t)v93, v88, v89);
      }
      v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v111, (uint64_t)v115, 16);
    }
    while (v90);
  }
  objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v86, (uint64_t)v12, v88, v89);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  return v104;
}

+ (id)assetWithNewestContentVersionInAssets:(id)a3 preferInstalled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t i;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  void *v78;
  id obj;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v4 = a4;
  v87 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10 = v5;
  if (!v5 || !objc_msgSend_count(v5, v6, v7, v8, v9))
  {
    v19 = 0;
    goto LABEL_26;
  }
  if (objc_msgSend_count(v10, v11, v12, v13, v14) == 1)
  {
    objc_msgSend_anyObject(v10, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  objc_msgSend_allObjects(v10, v15, v16, v17, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v24 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], v20, (uint64_t)&unk_24C5FAD28, v21, v22, &unk_24C5FAD40, &unk_24C5FAD58, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(v24, v26, (uint64_t)CFSTR("state IN %@"), v27, v28, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_filteredArrayUsingPredicate_(v23, v30, (uint64_t)v29, v31, v32);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v33, v34, v35, v36, v37))
    {
      if (objc_msgSend_count(v33, v38, v39, v40, v41) == 1)
      {
        objc_msgSend_firstObject(v33, v42, v43, v44, v45);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      v23 = v33;
    }
    else
    {
      objc_msgSend_allObjects(v10, v38, v39, v40, v41);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v78 = v10;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v33 = v23;
  v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v46, (uint64_t)&v82, (uint64_t)v86, 16);
  v19 = 0;
  v51 = 0;
  if (!v81)
    goto LABEL_24;
  v80 = *(_QWORD *)v83;
  obj = v33;
  do
  {
    for (i = 0; i != v81; ++i)
    {
      if (*(_QWORD *)v83 != v80)
        objc_enumerationMutation(obj);
      v53 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
      objc_msgSend_attributes(v53, v47, v48, v49, v50);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v54;
      if (v19)
      {
        objc_msgSend_objectForKeyedSubscript_(v54, v55, (uint64_t)CFSTR("_ContentVersion"), v56, v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend_integerValue(v59, v60, v61, v62, v63);
        objc_msgSend_objectForKeyedSubscript_(v51, v65, (uint64_t)CFSTR("_ContentVersion"), v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend_integerValue(v68, v69, v70, v71, v72);

        if (v64 <= v73)
          goto LABEL_22;
        v74 = v53;

      }
      else
      {
        v75 = v53;
      }
      v76 = v58;

      v19 = v53;
      v51 = v76;
LABEL_22:

    }
    v33 = obj;
    v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v82, (uint64_t)v86, 16);
  }
  while (v81);
LABEL_24:

  v10 = v78;
LABEL_25:

LABEL_26:
  return v19;
}

- (id)filterByClientIDForAssets:(id)a3 forMetadataMapping:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_20D02B770;
  v14[3] = &unk_24C5F0298;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v15 = v8;
  objc_msgSend_objectsPassingTest_(v6, v9, (uint64_t)v14, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

+ (id)compatibilityFilterPredicate
{
  if (qword_2549A19A8 != -1)
    dispatch_once(&qword_2549A19A8, &unk_24C5F02B8);
  return (id)qword_2549A19A0;
}

- (void)_loadBundledSongForSongID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char isKindOfClass;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  FlexMobileAssetV2SongAsset *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  FlexMobileAssetManagerV2 *v134;
  void *v135;
  void *v136;
  _QWORD v137[4];
  id v138;
  uint64_t v139;
  _QWORD v140[2];

  v140[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_pathToBundledResourceWithName_(FlexUtilities, v5, (uint64_t)CFSTR("FlexAudio"), v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentsOfDirectoryAtPath_error_(v13, v14, (uint64_t)v12, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v137[0] = MEMORY[0x24BDAC760];
    v137[1] = 3221225472;
    v137[2] = sub_20D02BDCC;
    v137[3] = &unk_24C5F02E0;
    v17 = v4;
    v138 = v17;
    v21 = objc_msgSend_indexOfObjectPassingTest_(v16, v18, (uint64_t)v137, v19, v20);
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_objectAtIndexedSubscript_(v16, v22, v21, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v12, v26, (uint64_t)v25, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__existingSongForUID_(self, v30, (uint64_t)v17, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v33;
      if (!v33)
      {
LABEL_14:

        goto LABEL_15;
      }
      v134 = self;
      v135 = v25;
      v136 = v29;
      objc_msgSend_existingAssetWithID_(v33, v34, (uint64_t)CFSTR("FMSongBundleAssetID"), v35, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend_stringByAppendingPathComponent_(v29, v40, (uint64_t)CFSTR("metadata.smm"), v41, v42);
        v43 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = (void *)v43;
        LODWORD(v43) = objc_msgSend_fileExistsAtPath_(v48, v49, v43, v50, v51);

        if ((_DWORD)v43)
          objc_msgSend_loadSongInFolderWithPath_(FlexSong, v52, (uint64_t)v29, v53, v54);
        else
          objc_msgSend_loadSongAtPath_(FlexMLSong, v52, (uint64_t)v29, v53, v54);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_existingAssetWithID_(v132, v55, (uint64_t)CFSTR("FMSongBundleAssetID"), v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v59, (uint64_t)v29, v60, v61);
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = [FlexMobileAssetV2SongAsset alloc];
        v68 = objc_msgSend_contentVersion(v58, v64, v65, v66, v67);
        v73 = objc_msgSend_compatibilityVersion(v58, v69, v70, v71, v72);
        v131 = (void *)v62;
        v75 = (void *)objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v63, v74, (uint64_t)CFSTR("FMSongBundleAssetID"), v62, (uint64_t)v134, v68, v73);
        objc_msgSend_existingAssetWithID_(v37, v76, (uint64_t)CFSTR("FMSongBundleAssetID"), v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_opt_class();
        v130 = v79;
        FlexDynamicCast(v80, v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v81;
        if (v81)
        {
          v87 = objc_msgSend_newestContentVersion(v81, v82, v83, v84, v85);
          objc_msgSend_setNewestContentVersion_(v75, v88, v87, v89, v90);
          v95 = objc_msgSend_newestCompatibilityVersion(v86, v91, v92, v93, v94);
          objc_msgSend_setNewestCompatibilityVersion_(v75, v96, v95, v97, v98);
        }
        v140[0] = v75;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v82, (uint64_t)v140, 1, v85, v86);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateAssets_(v132, v100, (uint64_t)v99, v101, v102);

        objc_msgSend_existingAssetWithID_(v37, v103, (uint64_t)CFSTR("FMSongArtworkAssetID"), v104, v105);
        v106 = objc_claimAutoreleasedReturnValue();
        v110 = (void *)v106;
        if (v106)
        {
          v139 = v106;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v107, (uint64_t)&v139, 1, v109);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_updateAssets_(v132, v112, (uint64_t)v111, v113, v114);

        }
        objc_msgSend_updateBackend_(v37, v107, (uint64_t)v132, v108, v109);
        objc_msgSend_setWithObject_(MEMORY[0x24BDBCF20], v115, (uint64_t)v17, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__metadataMappingForUUIDSet_(v134, v119, (uint64_t)v118, v120, v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKey_(v122, v123, (uint64_t)v17, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__updateMetadataOnExistingSong_usingMetadataAsset_(v134, v127, (uint64_t)v37, (uint64_t)v126, v128);

        v25 = v135;
        v29 = v136;
        goto LABEL_14;
      }

    }
LABEL_15:

  }
}

- (void)_loadBundledArtworkForSongID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  FlexMobileAssetV2SongAsset *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[2];

  v85[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_pathToBundledResourceWithName_(FlexUtilities, v5, (uint64_t)CFSTR("FlexAudio"), v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentsOfDirectoryAtPath_error_(v13, v14, (uint64_t)v12, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v83[0] = MEMORY[0x24BDAC760];
    v83[1] = 3221225472;
    v83[2] = sub_20D02C0FC;
    v83[3] = &unk_24C5F02E0;
    v17 = v4;
    v84 = v17;
    v21 = objc_msgSend_indexOfObjectPassingTest_(v16, v18, (uint64_t)v83, v19, v20);
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_objectAtIndexedSubscript_(v16, v22, v21, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_versionFromArtworkFilename_(FMSong, v26, (uint64_t)v25, v27, v28);
      objc_msgSend__existingSongForUID_(self, v30, (uint64_t)v17, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v33;
      if (v33)
      {
        objc_msgSend_existingAssetWithID_(v33, v34, (uint64_t)CFSTR("FMSongArtworkAssetID"), v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v38;
        if (v38
          && !objc_msgSend_assetStatus(v38, v39, v40, v41, v42)
          && objc_msgSend_contentVersion(v43, v39, v44, v41, v42) >= v29)
        {

        }
        else
        {
          objc_msgSend_existingAssetWithID_(v37, v39, (uint64_t)CFSTR("FMSongBundleAssetID"), v41, v42);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend_compatibilityVersion(v82, v45, v46, v47, v48);
          v80 = v25;
          objc_msgSend_stringByAppendingPathComponent_(v12, v50, (uint64_t)v25, v51, v52);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v53, (uint64_t)v81, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = [FlexMobileAssetV2SongAsset alloc];
          v63 = (void *)objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v57, v58, (uint64_t)CFSTR("FMSongArtworkAssetID"), (uint64_t)v56, (uint64_t)self, v29, v49);
          if (v43)
          {
            v64 = objc_msgSend_contentVersion(v43, v59, v60, v61, v62);
            objc_msgSend_setNewestContentVersion_(v63, v65, v64, v66, v67);
            v72 = objc_msgSend_compatibilityVersion(v43, v68, v69, v70, v71);
            objc_msgSend_setNewestCompatibilityVersion_(v63, v73, v72, v74, v75);
          }
          v85[0] = v63;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v59, (uint64_t)v85, 1, v62);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_updateAssets_(v37, v77, (uint64_t)v76, v78, v79);

          v25 = v80;
        }
      }

    }
  }

}

- (id)_newestContentSetFromAssets:(id)a3 metadataMapping:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *purgeQueue;
  id v100;
  id v101;
  id v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v109;
  id obj;
  uint64_t v111;
  id v112;
  uint64_t v113;
  void *v114;
  _QWORD block[4];
  id v116;
  id v117;
  id v118;
  id v119;
  id location;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v112 = a4;
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v6, v7, v8, v9);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v10, v11, v12, v13);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v5;
  v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v125, (uint64_t)v130, 16);
  if (v113)
  {
    v111 = *(_QWORD *)v126;
    do
    {
      for (i = 0; i != v113; ++i)
      {
        if (*(_QWORD *)v126 != v111)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
        objc_msgSend_attributes(v20, v15, v16, v17, v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("uuid"), v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v112, v26, (uint64_t)v25, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_attributes(v29, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)CFSTR("recalled"), v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend_BOOLValue(v38, v39, v40, v41, v42);

        if (v43)
        {
          if (v25)
            objc_msgSend_addObject_(v109, v44, (uint64_t)v25, v45, v46);
        }
        else
        {
          objc_msgSend_objectForKey_(v114, v44, (uint64_t)v25, v45, v46);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v50)
            goto LABEL_12;
          objc_msgSend_objectForKeyedSubscript_(v21, v47, (uint64_t)CFSTR("_ContentVersion"), v48, v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend_integerValue(v51, v52, v53, v54, v55);
          objc_msgSend_attributes(v50, v57, v58, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)CFSTR("_ContentVersion"), v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v56) = v56 < objc_msgSend_integerValue(v65, v66, v67, v68, v69);

          if ((v56 & 1) == 0 && (unint64_t)objc_msgSend_state(v20, v70, v71, v72, v73) >= 2)
LABEL_12:
            objc_msgSend_setObject_forKey_(v114, v47, (uint64_t)v20, (uint64_t)v25, v49);

        }
      }
      v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v125, (uint64_t)v130, 16);
    }
    while (v113);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v74 = v109;
  v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v121, (uint64_t)v129, 16);
  if (v79)
  {
    v80 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v79; ++j)
      {
        if (*(_QWORD *)v122 != v80)
          objc_enumerationMutation(v74);
        objc_msgSend_removeObjectForKey_(v114, v76, *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * j), v77, v78);
      }
      v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v76, (uint64_t)&v121, (uint64_t)v129, 16);
    }
    while (v79);
  }

  objc_msgSend_set(MEMORY[0x24BDBCEF0], v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v114, v87, v88, v89, v90))
  {
    objc_msgSend_allValues(v114, v91, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v86, v96, (uint64_t)v95, v97, v98);

  }
  objc_initWeak(&location, self);
  purgeQueue = self->_purgeQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D02C5F0;
  block[3] = &unk_24C5F0330;
  objc_copyWeak(&v119, &location);
  v100 = obj;
  v116 = v100;
  v101 = v86;
  v117 = v101;
  v102 = v74;
  v118 = v102;
  dispatch_async(purgeQueue, block);
  objc_msgSend_setWithSet_(MEMORY[0x24BDBCF20], v103, (uint64_t)v101, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v119);
  objc_destroyWeak(&location);

  return v106;
}

- (void)fetchAllSongsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSString *mobileAssetTypeIdentifier;
  id v22;
  const char *v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_setDownloadPriority_(v5, v6, 1, v7, v8);
  objc_msgSend__mobileAssetDownloadOptionsForClientOptions_(self, v9, (uint64_t)v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_XMLPresent(self, v13, v14, v15, v16) & 1) == 0)
    objc_msgSend_setDiscretionary_(v12, v17, 0, v18, v19);
  v20 = (void *)MEMORY[0x24BE66B90];
  mobileAssetTypeIdentifier = self->_mobileAssetTypeIdentifier;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20D02CBDC;
  v24[3] = &unk_24C5F0358;
  v24[4] = self;
  v25 = v4;
  v22 = v4;
  objc_msgSend_startCatalogDownload_options_then_(v20, v23, (uint64_t)mobileAssetTypeIdentifier, (uint64_t)v12, (uint64_t)v24);

}

- (id)_metadataMappingForUUIDSet:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v4, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v15, (uint64_t)CFSTR("Metadata"), (uint64_t)v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v17;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v20)
  {
    v25 = v20;
    v26 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v18);
        v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend_attributes(v28, v21, v22, v23, v24, (_QWORD)v41);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)CFSTR("uuid"), v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_forKey_(v9, v34, (uint64_t)v28, (uint64_t)v33, v35);
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v25);
  }

  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v36, (uint64_t)v9, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

+ (id)_assetURLForMobileAsset:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v3 = a3;
  objc_msgSend_getLocalUrl(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_state(v3, v9, v10, v11, v12);

  v18 = 0;
  if (v8 && (v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(v19, v20, (uint64_t)v8, MEMORY[0x24BDBD1A8], 4, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend_count(v18, v14, v15, v16, v17))
  {
    objc_msgSend_firstObject(v18, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_assetIDForMobileAsset:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString **v16;
  __CFString *v17;

  objc_msgSend_attributes(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("FMAssetType"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqualToString_(v9, v10, (uint64_t)CFSTR("SongBundle"), v11, v12) & 1) != 0)
  {
    v16 = FMSongBundleAssetID;
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v9, v13, (uint64_t)CFSTR("Artwork"), v14, v15))
    {
      v17 = 0;
      goto LABEL_7;
    }
    v16 = FMSongArtworkAssetID;
  }
  v17 = *v16;
LABEL_7:

  return v17;
}

- (id)_weightedKeywordsFromMetadataAsset:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_attributes(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("weightedKeywords"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v10, v11, v12, v13);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend_allKeys(v9, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v20)
  {
    v24 = v20;
    v25 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v46 != v25)
          objc_enumerationMutation(v18);
        v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v9, v21, v27, v22, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_alloc_init(MEMORY[0x24BDD16F0]);
        objc_msgSend_setNumberStyle_(v29, v30, 1, v31, v32);
        objc_msgSend_numberFromString_(v29, v33, (uint64_t)v28, v34, v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
          objc_msgSend_setObject_forKey_(v44, v36, (uint64_t)v38, v27, v37);

      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v24);
  }

  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v39, (uint64_t)v44, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (void)_updateMetadataOnExistingSong:(id)a3 usingMetadataAsset:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  FlexSongProxy *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  NSObject *v204;
  NSObject *v205;
  __int16 v206;
  unsigned int v207;
  uint64_t v208;
  void *v209;
  int v210;
  uint64_t v211;
  void *v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  uint8_t buf[16];
  uint8_t v218[16];

  v6 = a3;
  v7 = a4;
  v12 = v7;
  if (!v6)
    goto LABEL_48;
  if (!v7)
    goto LABEL_48;
  objc_msgSend_attributes(v7, v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("_ContentVersion"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_integerValue(v17, v18, v19, v20, v21);

  if (v22 <= objc_msgSend_metadataVersion(v6, v23, v24, v25, v26))
    goto LABEL_48;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_existingAssetWithID_(v6, v32, (uint64_t)CFSTR("FMSongArtworkAssetID"), v33, v34);
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
    objc_msgSend_addObject_(v31, v35, v38, v36, v37);
  v208 = v22;
  objc_msgSend_existingAssetWithID_(v6, v35, (uint64_t)CFSTR("FMSongBundleAssetID"), v36, v37);
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
    objc_msgSend_addObject_(v31, v39, v43, v41, v42);
  v212 = v31;
  v213 = (void *)v43;
  objc_msgSend_attributes(v12, v39, v40, v41, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v44, v45, (uint64_t)CFSTR("songName"), v46, v47);
  v215 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_attributes(v12, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v52, v53, (uint64_t)CFSTR("artistName"), v54, v55);
  v211 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_attributes(v12, v56, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v60, v61, (uint64_t)CFSTR("hiddenIDs"), v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = objc_msgSend_containsObject_(v64, v65, (uint64_t)self->_clientID, v66, v67);

  objc_msgSend_attributes(v12, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v72, v73, (uint64_t)CFSTR("recalled"), v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = objc_msgSend_BOOLValue(v76, v77, v78, v79, v80);

  objc_msgSend_attributes(v12, v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v85, v86, (uint64_t)CFSTR("sbFmt"), v87, v88);
  v214 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v89, v90, v91, v92);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attributes(v12, v93, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v97, v98, (uint64_t)CFSTR("tagIDs"), v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v101, v102, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  v111 = (void *)MEMORY[0x24BDBCF20];
  v209 = (void *)v38;
  if (v106)
  {
    objc_msgSend_attributes(v12, v107, v108, v109, v110);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v112, v113, (uint64_t)CFSTR("tagIDs"), v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v111, v117, (uint64_t)v116, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v107, v108, v109, v110);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_attributes(v12, v121, v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v125, v126, (uint64_t)CFSTR("keywords"), v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v129, v130, v131, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  v139 = (void *)MEMORY[0x24BDBCF20];
  if (v134)
  {
    objc_msgSend_attributes(v12, v135, v136, v137, v138);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v140, v141, (uint64_t)CFSTR("keywords"), v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v139, v145, (uint64_t)v144, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v135, v136, v137, v138);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v153 = (void *)v211;
  objc_msgSend_attributes(v12, v149, v150, v151, v152);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v154, v155, (uint64_t)CFSTR("weightedKeywords"), v156, v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = v213;
  if (v158)
  {
    objc_msgSend__weightedKeywordsFromMetadataAsset_(self, v159, (uint64_t)v12, v161, v162);
    v164 = objc_claimAutoreleasedReturnValue();

    v216 = (void *)v164;
  }
  if (v210)
  {
    v165 = v215;
    if (v215)
    {
      if (v211)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend_songName(v6, v159, v160, v161, v162);
      v165 = objc_claimAutoreleasedReturnValue();
      if (v211)
      {
LABEL_19:
        if (!v120)
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    objc_msgSend_artistName(v6, v159, v160, v161, v162);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v120)
    {
LABEL_24:
      objc_msgSend_tagIDs(v6, v159, v160, v161, v162);
      v166 = objc_claimAutoreleasedReturnValue();

      v120 = (void *)v166;
LABEL_25:
      if (!v148 || !objc_msgSend_count(v148, v159, v160, v161, v162))
      {
        objc_msgSend_keywords(v6, v159, v160, v161, v162);
        v167 = objc_claimAutoreleasedReturnValue();

        v148 = (void *)v167;
      }
      v168 = v214;
      if (!v214)
      {
        objc_msgSend_songFormat(v6, v159, v160, v161, v162);
        v168 = objc_claimAutoreleasedReturnValue();
      }
      v214 = v168;
      v215 = v165;
      if (!v216 || !objc_msgSend_count(v216, v159, v160, v161, v162))
      {
        objc_msgSend_weightedKeywords(v6, v159, v160, v161, v162);
        v169 = objc_claimAutoreleasedReturnValue();

        v216 = (void *)v169;
      }
      goto LABEL_33;
    }
LABEL_23:
    if (objc_msgSend_count(v120, v159, v160, v161, v162))
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_33:
  if (objc_msgSend_isLoaded(v6, v159, v160, v161, v162))
  {
    if (v213)
    {
      objc_msgSend_localURL(v213, v170, v171, v172, v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_backendForSongBundleURL_(FlexUtilities, v175, (uint64_t)v174, v176, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();

      if (v178)
      {
        v180 = (void *)v215;
        objc_msgSend_updateSongArtist_title_tags_keywords_weightedKeywords_hidden_recalled_metadataVersion_(v178, v179, (uint64_t)v153, v215, (uint64_t)v120, v148, v216, v207, v210, v208);
        v184 = v209;
        if (v212)
          objc_msgSend_updateAssets_(v178, v181, (uint64_t)v212, v182, v183);
        objc_msgSend_updateBackend_(v6, v181, (uint64_t)v178, v182, v183);
      }
      else
      {
        FlexLogForCategory(2uLL);
        v205 = objc_claimAutoreleasedReturnValue();
        v184 = v209;
        if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v218 = 0;
          _os_log_impl(&dword_20D016000, v205, OS_LOG_TYPE_DEFAULT, "could not create replacement backend", v218, 2u);
        }

        v180 = (void *)v215;
      }

      v203 = (void *)v214;
    }
    else
    {
      FlexLogForCategory(2uLL);
      v204 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D016000, v204, OS_LOG_TYPE_DEFAULT, "could not create replacement backend", buf, 2u);
      }

      v184 = v209;
      v203 = (void *)v214;
      v180 = (void *)v215;
    }
  }
  else
  {
    v185 = [FlexSongProxy alloc];
    objc_msgSend_uid(v6, v186, v187, v188, v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioEncoderPresetName(v6, v191, v192, v193, v194);
    v195 = v148;
    v196 = (uint64_t)v153;
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v206) = v210;
    LOBYTE(v206) = v207;
    v180 = (void *)v215;
    v199 = (void *)objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v185, v198, (uint64_t)v190, v215, v196, v120, v195, v216, v206, v212, v197, v208, v214);

    v153 = (void *)v196;
    v148 = v195;
    v163 = v213;

    objc_msgSend_updateBackend_(v6, v200, (uint64_t)v199, v201, v202);
    v203 = (void *)v214;
    v184 = v209;
  }

LABEL_48:
}

- (void)_updateExistingSong:(id)a3 usingAsset:(id)a4 metadataAsset:(id)a5
{
  objc_msgSend__updateExistingSong_usingAsset_metadataAsset_forceUpdate_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0);
}

- (void)_updateExistingSong:(id)a3 usingAsset:(id)a4 metadataAsset:(id)a5 forceUpdate:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  FlexMobileAssetV2SongAsset *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BOOL4 v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BOOL4 v81;
  int v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  FlexMobileAssetV2SongAsset *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  FlexMobileAssetV2SongAsset *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  __int16 v245;
  void *v246;
  void *v247;
  void *v248;
  char v249;
  char v250;
  void *v251;
  void *v252;
  FlexSongProxy *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  _QWORD v273[2];
  void *v274;
  _QWORD v275[2];
  void *v276;
  _QWORD v277[3];

  v6 = a6;
  v277[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17 = v12;
  if (!v10 || !v11)
    goto LABEL_44;
  if (v12)
  {
    objc_msgSend_attributes(v11, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("FMAssetType"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("SongBundle"), v24, v25))
      objc_msgSend__updateMetadataOnExistingSong_usingMetadataAsset_(self, v26, (uint64_t)v10, (uint64_t)v17, v27);

  }
  objc_msgSend_attributes(v11, v13, v14, v15, v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)CFSTR("_ContentVersion"), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v28, v33, (uint64_t)CFSTR("_CompatibilityVersion"), v34, v35);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__assetIDForMobileAsset_(self, v36, (uint64_t)v11, v37, v38);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_existingAssetWithID_(v10, v39, (uint64_t)v271, v40, v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v267 = v32;
      objc_msgSend__assetURLForMobileAsset_(FlexMobileAssetManagerV2, v42, (uint64_t)v11, v43, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = [FlexMobileAssetV2SongAsset alloc];
      if (v46)
      {
        v52 = objc_msgSend_integerValue(v267, v47, v48, v49, v50);
        v57 = objc_msgSend_integerValue(v270, v53, v54, v55, v56);
        v61 = (void *)objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v51, v58, (uint64_t)v271, (uint64_t)v46, (uint64_t)self, v52, v57);
        if (!v61)
        {
LABEL_12:

          v32 = v267;
          goto LABEL_13;
        }
      }
      else
      {
        objc_msgSend_localURL(v45, v47, v48, v49, v50);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v262 = v28;
        v134 = objc_msgSend_contentVersion(v45, v130, v131, v132, v133);
        v139 = objc_msgSend_compatibilityVersion(v45, v135, v136, v137, v138);
        v140 = v134;
        v28 = v262;
        v61 = (void *)objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v51, v141, (uint64_t)v271, (uint64_t)v129, (uint64_t)self, v140, v139);

        if (!v61)
          goto LABEL_12;
      }
      v277[0] = v61;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v59, (uint64_t)v277, 1, v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateAssets_(v10, v63, (uint64_t)v62, v64, v65);

      goto LABEL_12;
    }
  }
LABEL_13:
  objc_msgSend_existingAssetWithID_(v10, v42, (uint64_t)v271, v43, v44);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v71 = objc_msgSend_integerValue(v32, v66, v67, v68, v69);
    v76 = v71 > objc_msgSend_contentVersion(v70, v72, v73, v74, v75);
  }
  else
  {
    v76 = 0;
  }
  v81 = objc_msgSend_assetStatus(v70, v66, v67, v68, v69) == 1
     && (objc_msgSend_state(v11, v77, v78, v79, v80) & 0xFFFFFFFFFFFFFFFELL) == 2;
  v82 = v76 || v81;
  if (!v70 || v6 || v82)
  {
    if (v70)
    {
      if ((v82 | v6) == 1)
      {
        v83 = objc_msgSend_assetStatus(v70, v77, v78, v79, v80);
        v88 = objc_msgSend_state(v11, v84, v85, v86, v87);
        if (v83 || v88 > 1)
        {
          v265 = v45;
          objc_msgSend__assetURLForMobileAsset_(FlexMobileAssetManagerV2, v89, (uint64_t)v11, v91, v92);
          v142 = objc_claimAutoreleasedReturnValue();
          v143 = [FlexMobileAssetV2SongAsset alloc];
          v148 = objc_msgSend_integerValue(v32, v144, v145, v146, v147);
          v153 = objc_msgSend_integerValue(v270, v149, v150, v151, v152);
          v261 = (void *)v142;
          v155 = (void *)objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v143, v154, (uint64_t)v271, v142, (uint64_t)self, v148, v153);
          if (objc_msgSend_isEqualToString_(v271, v156, (uint64_t)CFSTR("FMSongBundleAssetID"), v157, v158))objc_msgSend_existingAssetWithID_(v10, v159, (uint64_t)CFSTR("FMSongArtworkAssetID"), v160, v161);
          else
            objc_msgSend_existingAssetWithID_(v10, v159, (uint64_t)CFSTR("FMSongBundleAssetID"), v160, v161);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v268 = v32;
          if (objc_msgSend_isLoaded(v10, v163, v164, v165, v166))
          {
            if (v162)
            {
              v275[0] = v162;
              v275[1] = v155;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v167, (uint64_t)v275, 2, v168);
            }
            else
            {
              v274 = v155;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v167, (uint64_t)&v274, 1, v168);
            }
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_updateAssets_(v10, v210, (uint64_t)v209, v211, v212);
            v45 = v265;
          }
          else
          {
            v253 = [FlexSongProxy alloc];
            objc_msgSend_uid(v10, v169, v170, v171, v172);
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attributes(v17, v173, v174, v175, v176);
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v255, v177, (uint64_t)CFSTR("songName"), v178, v179);
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attributes(v17, v180, v181, v182, v183);
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v254, v184, (uint64_t)CFSTR("artistName"), v185, v186);
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_tagIDs(v10, v187, v188, v189, v190);
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_keywords(v10, v191, v192, v193, v194);
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_weightedKeywords(v10, v195, v196, v197, v198);
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            v250 = objc_msgSend_hidden(v10, v199, v200, v201, v202);
            v249 = objc_msgSend_recalled(v10, v203, v204, v205, v206);
            v263 = v28;
            v256 = v155;
            if (v162)
            {
              v273[0] = v162;
              v273[1] = v155;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v207, (uint64_t)v273, 2, v208);
            }
            else
            {
              v272 = v155;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v207, (uint64_t)&v272, 1, v208);
            }
            v45 = v265;
            v247 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attributes(v17, v213, v214, v215, v216);
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v266, v217, (uint64_t)CFSTR("audioEncoderPresetName"), v218, v219);
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attributes(v17, v220, v221, v222, v223);
            v248 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v248, v224, (uint64_t)CFSTR("_ContentVersion"), v225, v226);
            v269 = (void *)objc_claimAutoreleasedReturnValue();
            v231 = objc_msgSend_integerValue(v269, v227, v228, v229, v230);
            objc_msgSend_attributes(v17, v232, v233, v234, v235);
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v236, v237, (uint64_t)CFSTR("sbFmt"), v238, v239);
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            HIBYTE(v245) = v249;
            LOBYTE(v245) = v250;
            v209 = (void *)objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v253, v241, (uint64_t)v260, (uint64_t)v259, (uint64_t)v258, v257, v252, v251, v245, v247, v246, v231, v240);

            objc_msgSend_updateBackend_(v10, v242, (uint64_t)v209, v243, v244);
            v28 = v263;
            v155 = v256;
          }

          v32 = v268;
        }
        else
        {
          v93 = objc_msgSend_integerValue(v32, v89, v90, v91, v92);
          objc_msgSend_setNewestContentVersion_(v70, v94, v93, v95, v96);
          v101 = objc_msgSend_integerValue(v270, v97, v98, v99, v100);
          objc_msgSend_setNewestCompatibilityVersion_(v70, v102, v101, v103, v104);
        }
      }
    }
    else
    {
      objc_msgSend__assetURLForMobileAsset_(FlexMobileAssetManagerV2, v77, (uint64_t)v11, v79, v80);
      v264 = v45;
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = [FlexMobileAssetV2SongAsset alloc];
      v111 = objc_msgSend_integerValue(v32, v107, v108, v109, v110);
      v112 = v32;
      v113 = v28;
      v114 = v111;
      v119 = objc_msgSend_integerValue(v270, v115, v116, v117, v118);
      v120 = v114;
      v28 = v113;
      v32 = v112;
      v122 = (void *)objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v106, v121, (uint64_t)v271, (uint64_t)v105, (uint64_t)self, v120, v119);
      v276 = v122;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v123, (uint64_t)&v276, 1, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateAssets_(v10, v126, (uint64_t)v125, v127, v128);

      v45 = v264;
    }
  }

LABEL_44:
}

- (id)_processResults:(id)a3 metadataMapping:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int8 v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  FlexMobileAssetManagerV2 *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  FlexMobileAssetV2SongAsset *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  void *v219;
  FMSong *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v229;
  void *v230;
  FlexSongProxy *v231;
  unsigned __int8 v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  id v247;
  id obj;
  id v249;
  uint64_t v250;
  uint64_t v251;
  void *v253;
  void *v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  void *v259;
  _BYTE v260[128];
  uint64_t v261;

  v261 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v249 = a4;
  v230 = v5;
  objc_msgSend_allObjects(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v10, v11, (uint64_t)&unk_24C5F0398, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x24BDBCEB8], v15, v16, v17, v18);
  v247 = (id)objc_claimAutoreleasedReturnValue();
  v257 = 0u;
  v258 = 0u;
  v255 = 0u;
  v256 = 0u;
  obj = v14;
  v251 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v255, (uint64_t)v260, 16);
  if (v251)
  {
    v250 = *(_QWORD *)v256;
    do
    {
      for (i = 0; i != v251; ++i)
      {
        if (*(_QWORD *)v256 != v250)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v255 + 1) + 8 * i);
        objc_msgSend__assetIDForMobileAsset_(self, v20, (uint64_t)v24, v21, v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend_attributes(v24, v25, v26, v27, v28);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v253, v30, (uint64_t)CFSTR("uuid"), v31, v32);
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v249, v33, (uint64_t)v254, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_attributes(v36, v37, v38, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v41, v42, (uint64_t)CFSTR("hiddenIDs"), v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend_containsObject_(v45, v46, (uint64_t)self->_clientID, v47, v48);

          objc_msgSend_attributes(v36, v50, v51, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v54, v55, (uint64_t)CFSTR("recalled"), v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend_BOOLValue(v58, v59, v60, v61, v62);

          v64 = self;
          objc_sync_enter(v64);
          objc_msgSend__existingSongForUID_(v64, v65, (uint64_t)v254, v66, v67);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (v71)
          {
            objc_msgSend__updateExistingSong_usingAsset_metadataAsset_forceUpdate_(v64, v68, (uint64_t)v71, (uint64_t)v24, (uint64_t)v36, 0);
            objc_msgSend_addObject_(v247, v72, (uint64_t)v71, v73, v74);
          }
          else if ((v63 & 1) == 0)
          {
            objc_msgSend_objectForKeyedSubscript_(v253, v68, (uint64_t)CFSTR("_ContentVersion"), v69, v70);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            if (v78)
            {
              objc_msgSend_objectForKeyedSubscript_(v253, v75, (uint64_t)CFSTR("_ContentVersion"), v76, v77);
              v245 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v245 = &unk_24C5FAD70;
            }

            objc_msgSend_objectForKeyedSubscript_(v253, v79, (uint64_t)CFSTR("_CompatibilityVersion"), v80, v81);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            if (v85)
            {
              objc_msgSend_objectForKeyedSubscript_(v253, v82, (uint64_t)CFSTR("_CompatibilityVersion"), v83, v84);
              v244 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v244 = &unk_24C5FAD70;
            }

            objc_msgSend__assetURLForMobileAsset_(FlexMobileAssetManagerV2, v86, (uint64_t)v24, v87, v88);
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = [FlexMobileAssetV2SongAsset alloc];
            v94 = objc_msgSend_integerValue(v245, v90, v91, v92, v93);
            v99 = objc_msgSend_integerValue(v244, v95, v96, v97, v98);
            v242 = (void *)objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v89, v100, (uint64_t)v29, (uint64_t)v243, (uint64_t)v64, v94, v99);
            objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v101, v102, v103, v104);
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attributes(v36, v105, v106, v107, v108);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v109, v110, (uint64_t)CFSTR("tagIDs"), v111, v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstObject(v113, v114, v115, v116, v117);
            v118 = (void *)objc_claimAutoreleasedReturnValue();

            v123 = (void *)MEMORY[0x24BDBCF20];
            if (v118)
            {
              objc_msgSend_attributes(v36, v119, v120, v121, v122);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v124, v125, (uint64_t)CFSTR("tagIDs"), v126, v127);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setWithArray_(v123, v129, (uint64_t)v128, v130, v131);
              v240 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend_set(MEMORY[0x24BDBCF20], v119, v120, v121, v122);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend_attributes(v36, v132, v133, v134, v135);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v136, v137, (uint64_t)CFSTR("keywords"), v138, v139);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstObject(v140, v141, v142, v143, v144);
            v145 = (void *)objc_claimAutoreleasedReturnValue();

            v150 = (void *)MEMORY[0x24BDBCF20];
            if (v145)
            {
              objc_msgSend_attributes(v36, v146, v147, v148, v149);
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v151, v152, (uint64_t)CFSTR("keywords"), v153, v154);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setWithArray_(v150, v156, (uint64_t)v155, v157, v158);
              v237 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend_set(MEMORY[0x24BDBCF20], v146, v147, v148, v149);
              v237 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend_attributes(v36, v159, v160, v161, v162);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v163, v164, (uint64_t)CFSTR("weightedKeywords"), v165, v166);
            v167 = (void *)objc_claimAutoreleasedReturnValue();

            v232 = v49;
            if (v167)
            {
              objc_msgSend__weightedKeywordsFromMetadataAsset_(v64, v168, (uint64_t)v36, v169, v170);
              v171 = objc_claimAutoreleasedReturnValue();

              v246 = (void *)v171;
            }
            v231 = [FlexSongProxy alloc];
            objc_msgSend_attributes(v36, v172, v173, v174, v175);
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v241, v176, (uint64_t)CFSTR("songName"), v177, v178);
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attributes(v36, v179, v180, v181, v182);
            v239 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v239, v183, (uint64_t)CFSTR("artistName"), v184, v185);
            v235 = (void *)objc_claimAutoreleasedReturnValue();
            v259 = v242;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v186, (uint64_t)&v259, 1, v187);
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attributes(v36, v188, v189, v190, v191);
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v238, v192, (uint64_t)CFSTR("audioEncoderPresetName"), v193, v194);
            v233 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attributes(v36, v195, v196, v197, v198);
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v199, v200, (uint64_t)CFSTR("_ContentVersion"), v201, v202);
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            v208 = objc_msgSend_integerValue(v203, v204, v205, v206, v207);
            objc_msgSend_attributes(v36, v209, v210, v211, v212);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v213, v214, (uint64_t)CFSTR("sbFmt"), v215, v216);
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            LOWORD(v229) = v232;
            v219 = (void *)objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v231, v218, (uint64_t)v254, (uint64_t)v236, (uint64_t)v235, v240, v237, v246, v229, v234, v233, v208, v217);

            v220 = [FMSong alloc];
            v224 = (void *)objc_msgSend_initWithBackend_(v220, v221, (uint64_t)v219, v222, v223);
            objc_msgSend_addObject_(v247, v225, (uint64_t)v224, v226, v227);

          }
          objc_sync_exit(v64);

        }
      }
      v251 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v255, (uint64_t)v260, 16);
    }
    while (v251);
  }

  return v247;
}

- (void)loadAssetWithID:(id)a3 forSongID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const __CFString *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  id v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  int isEqualToString;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  NSObject *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  char v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  NSObject *v192;
  unsigned int v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  uint8_t buf[16];
  void *v206;
  void *v207;
  _BYTE v208[128];
  uint64_t v209;

  v209 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v11 = v7;
  if (v6 && v7)
  {
    objc_msgSend__existingSongForUID_(self, v8, (uint64_t)v7, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      FlexLogForCategory(2uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D016000, v20, OS_LOG_TYPE_DEFAULT, "attempting to load a song that doesn't exist", buf, 2u);
      }
      goto LABEL_48;
    }
    if (objc_msgSend_isEqualToString_(v6, v12, (uint64_t)CFSTR("FMSongArtworkAssetID"), v13, v14))
    {
      v19 = self->_mobileAssetCacheLock;
      objc_sync_enter(v19);
      if (self->_includeArtworkInQueries)
      {
        objc_sync_exit(v19);

      }
      else
      {
        v199 = v11;
        v197 = v15;
        self->_includeArtworkInQueries = 1;
        objc_sync_exit(v19);

        objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v21, (uint64_t)CFSTR("Artwork"), 0, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_set(MEMORY[0x24BDBCEF0], v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v201 = 0u;
        v202 = 0u;
        v203 = 0u;
        v204 = 0u;
        v29 = v23;
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v201, (uint64_t)v208, 16);
        if (v31)
        {
          v36 = v31;
          v37 = *(_QWORD *)v202;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v202 != v37)
                objc_enumerationMutation(v29);
              objc_msgSend_attributes(*(void **)(*((_QWORD *)&v201 + 1) + 8 * i), v32, v33, v34, v35);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v39, v40, (uint64_t)CFSTR("uuid"), v41, v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (v43)
                objc_msgSend_addObject_(v28, v44, (uint64_t)v43, v45, v46);

            }
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v201, (uint64_t)v208, 16);
          }
          while (v36);
        }

        objc_msgSend__metadataMappingForUUIDSet_(self, v47, (uint64_t)v28, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (id)objc_msgSend__newestContentSetFromAssets_metadataMapping_(self, v51, (uint64_t)v29, (uint64_t)v50, v52);

        v15 = v197;
        v11 = v199;
      }
    }
    objc_msgSend_existingAssetWithID_(v15, v16, (uint64_t)v6, v17, v18);
    v54 = objc_claimAutoreleasedReturnValue();
    v20 = v54;
    if (v54 && (objc_msgSend_isCloudBacked(v54, v55, v56, v57, v58) & 1) != 0)
    {
LABEL_29:
      if (objc_msgSend_isEqualToString_(v6, v55, (uint64_t)CFSTR("FMSongBundleAssetID"), v57, v58))
      {
        objc_msgSend_localURL(v20, v97, v98, v99, v100);
        v101 = objc_claimAutoreleasedReturnValue();
        if (v101)
        {
          v106 = (void *)v101;
          objc_msgSend_array(MEMORY[0x24BDBCEB8], v102, v103, v104, v105);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v107, v108, (uint64_t)v20, v109, v110);
          objc_msgSend_existingAssetWithID_(v15, v111, (uint64_t)CFSTR("FMSongArtworkAssetID"), v112, v113);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          if (v118)
            objc_msgSend_addObject_(v107, v114, (uint64_t)v118, v116, v117);
          objc_msgSend_pathExtension(v106, v114, v115, v116, v117);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v119, v120, (uint64_t)CFSTR("smsbundle"), v121, v122);

          if (isEqualToString)
          {
            objc_msgSend_path(v106, v124, v125, v126, v127);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByAppendingPathComponent_(v128, v129, (uint64_t)CFSTR("metadata.smm"), v130, v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v133, v134, v135, v136);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = objc_msgSend_fileExistsAtPath_(v137, v138, (uint64_t)v132, v139, v140);

            objc_msgSend_path(v106, v142, v143, v144, v145);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            if (v141)
              objc_msgSend_loadSongInFolderWithPath_(FlexSong, v146, (uint64_t)v149, v147, v148);
            else
              objc_msgSend_loadSongAtPath_(FlexMLSong, v146, (uint64_t)v149, v147, v148);
            v150 = objc_claimAutoreleasedReturnValue();

            if (v150)
            {
              v195 = v106;
              v198 = v132;
              v200 = v118;
              objc_msgSend_artistName(v15, v151, v152, v153, v154);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_songName(v15, v155, v156, v157, v158);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_tagIDs(v15, v160, v161, v162, v163);
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_keywords(v15, v165, v166, v167, v168);
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_weightedKeywords(v15, v169, v170, v171, v172);
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              v193 = objc_msgSend_hidden(v15, v174, v175, v176, v177);
              v182 = objc_msgSend_recalled(v15, v178, v179, v180, v181);
              v187 = objc_msgSend_metadataVersion(v15, v183, v184, v185, v186);
              objc_msgSend_updateSongArtist_title_tags_keywords_weightedKeywords_hidden_recalled_metadataVersion_(v150, v188, (uint64_t)v196, (uint64_t)v159, (uint64_t)v164, v194, v173, v193, v182, v187);

              if (v107)
                objc_msgSend_updateAssets_(v150, v189, (uint64_t)v107, v190, v191);
              objc_msgSend_updateBackend_(v15, v189, (uint64_t)v150, v190, v191);
              v132 = v198;
              v118 = v200;
              v106 = v195;
            }
            else
            {
              FlexLogForCategory(2uLL);
              v192 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_20D016000, v192, OS_LOG_TYPE_DEFAULT, "could not create replacement backend", buf, 2u);
              }

            }
          }
          else
          {
            FlexLogForCategory(2uLL);
            v150 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20D016000, v150, OS_LOG_TYPE_DEFAULT, "could not locate smsBundle", buf, 2u);
            }
          }

        }
      }
LABEL_48:

      goto LABEL_49;
    }
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithObject_(MEMORY[0x24BDBCF20], v60, (uint64_t)v11, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__metadataMappingForUUIDSet_(self, v64, (uint64_t)v63, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v6, v68, (uint64_t)CFSTR("FMSongArtworkAssetID"), v69, v70))
    {
      if (!v20)
        objc_msgSend__loadBundledArtworkForSongID_(self, v71, (uint64_t)v11, v72, v73);
      v74 = CFSTR("Artwork");
      v207 = v11;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v71, (uint64_t)&v207, 1, v73);
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v6, v71, (uint64_t)CFSTR("FMSongBundleAssetID"), v72, v73))
      {
LABEL_28:
        objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(self, v75, (uint64_t)v59, (uint64_t)v67, v76);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (id)objc_msgSend__processResults_metadataMapping_(self, v90, (uint64_t)v89, (uint64_t)v67, v91);
        objc_msgSend_existingAssetWithID_(v15, v93, (uint64_t)v6, v94, v95);
        v96 = objc_claimAutoreleasedReturnValue();

        v20 = v96;
        goto LABEL_29;
      }
      v74 = CFSTR("SongBundle");
      v206 = v11;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v75, (uint64_t)&v206, 1, v76);
    }
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v78, (uint64_t)v74, (uint64_t)v77, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v80, v81, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v59, v86, (uint64_t)v85, v87, v88);

    goto LABEL_28;
  }
LABEL_49:

}

- (void)_dispatchNextAsyncAssetDownloadAndPurge
{
  NSObject *triggerDownloadAndPurgeQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  triggerDownloadAndPurgeQueue = self->_triggerDownloadAndPurgeQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_20D02F360;
  v4[3] = &unk_24C5EFC80;
  objc_copyWeak(&v5, &location);
  dispatch_async(triggerDownloadAndPurgeQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_runNextAsyncAssetDownloadAndPurge
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = self->_downloadThrottleLock;
  objc_sync_enter(v3);
  if ((unint64_t)objc_msgSend_count(self->_processingDownloadSet, v4, v5, v6, v7) > 2)
  {
    FlexLogForCategory(2uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend_count(self->_processingDownloadSet, v21, v22, v23, v24);
      v30 = objc_msgSend_count(self->_pendingDownloadSet, v26, v27, v28, v29);
      v41 = 134218240;
      v42 = v25;
      v43 = 2048;
      v44 = v30;
      _os_log_impl(&dword_20D016000, v20, OS_LOG_TYPE_DEFAULT, "There are currently %lu assets downloading and %lu assets in the _pendingDownloadsSet.", (uint8_t *)&v41, 0x16u);
    }

    v16 = 0;
  }
  else
  {
    objc_msgSend_firstObject(self->_pendingDownloadSet, v8, v9, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_removeObject_(self->_pendingDownloadSet, v12, (uint64_t)v16, v14, v15);
      objc_msgSend_addObject_(self->_processingDownloadSet, v17, (uint64_t)v16, v18, v19);
    }
  }
  objc_msgSend_firstObject(self->_pendingPurgeSet, v12, v13, v14, v15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend_removeObject_(self->_pendingPurgeSet, v31, (uint64_t)v34, v32, v33);
    objc_msgSend_addObject_(self->_processingPurgeSet, v35, (uint64_t)v34, v36, v37);
  }
  objc_sync_exit(v3);

  if (v16)
    objc_msgSend__runAsyncAssetDownloadForMobileAsset_(self, v38, (uint64_t)v16, v39, v40);
  if (v34)
    objc_msgSend__purgeAsset_(self, v38, (uint64_t)v34, v39, v40);

}

- (BOOL)_isDownloadingAsset:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableOrderedSet *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_downloadThrottleLock;
  objc_sync_enter(v5);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_pendingDownloadSet;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(v6);
      if ((objc_msgSend_isEqualToSongAsset_(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v13), v8, (uint64_t)v4, v9, v10) & 1) != 0)
        goto LABEL_18;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v26, (uint64_t)v31, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_processingDownloadSet;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v22, (uint64_t)v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v23;
LABEL_11:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v19)
        objc_enumerationMutation(v6);
      if ((objc_msgSend_isEqualToSongAsset_(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v20), v15, (uint64_t)v4, v16, v17, (_QWORD)v22) & 1) != 0)break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v22, (uint64_t)v30, 16);
        if (v18)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v18) = 1;
  }
LABEL_19:

  objc_sync_exit(v5);
  return v18;
}

- (BOOL)_isPurgingAsset:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableOrderedSet *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_downloadThrottleLock;
  objc_sync_enter(v5);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_pendingPurgeSet;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(v6);
      if ((objc_msgSend_isEqualToSongAsset_(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v13), v8, (uint64_t)v4, v9, v10) & 1) != 0)
        goto LABEL_18;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v26, (uint64_t)v31, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_processingPurgeSet;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v22, (uint64_t)v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v23;
LABEL_11:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v19)
        objc_enumerationMutation(v6);
      if ((objc_msgSend_isEqualToSongAsset_(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v20), v15, (uint64_t)v4, v16, v17, (_QWORD)v22) & 1) != 0)break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v22, (uint64_t)v30, 16);
        if (v18)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v18) = 1;
  }
LABEL_19:

  objc_sync_exit(v5);
  return v18;
}

- (void)requestDownloadOfAsset:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  NSObject *downloadRequestQueue;
  _QWORD v39[4];
  id v40;
  FlexMobileAssetManagerV2 *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_songUID(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FlexLogForCategory(2uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_assetID(v6, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v7, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = v12;
    v48 = 2112;
    v49 = v18;
    v50 = 2112;
    v51 = v23;
    _os_log_impl(&dword_20D016000, v13, OS_LOG_TYPE_DEFAULT, "Beginning download of %@ %@ with options %@", buf, 0x20u);

  }
  objc_msgSend__existingSongForUID_(self, v24, (uint64_t)v12, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend_assetStatus(v6, v28, v29, v30, v31)
        && objc_msgSend_localURLExists(v6, v32, v33, v34, v35)
        && (objc_msgSend_contentUpdateAvailable(v6, v32, v33, v34, v35) & 1) == 0)
      {
        FlexLogForCategory(2uLL);
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)buf = 138412290;
        v47 = v12;
        v37 = "Not downloading %@ because asset is already local and there is no cloud update available.";
        goto LABEL_15;
      }
      if (!objc_msgSend_recalled(v27, v32, v33, v34, v35))
      {
        objc_initWeak((id *)buf, self);
        downloadRequestQueue = self->_downloadRequestQueue;
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = sub_20D02FD38;
        v39[3] = &unk_24C5F03C0;
        objc_copyWeak(&v45, (id *)buf);
        v40 = v6;
        v41 = self;
        v42 = v27;
        v43 = v12;
        v44 = v7;
        dispatch_async(downloadRequestQueue, v39);

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)buf);
        goto LABEL_17;
      }
      FlexLogForCategory(2uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v12;
        v37 = "Not downloading %@ due to recall";
LABEL_15:
        _os_log_impl(&dword_20D016000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 0xCu);
      }
    }
    else
    {
      FlexLogForCategory(2uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v12;
        v37 = "Not downloading %@ due to asset not MobileAsset backed";
        goto LABEL_15;
      }
    }
  }
  else
  {
    FlexLogForCategory(2uLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v12;
      v37 = "Not downloading %@ due to no existing song";
      goto LABEL_15;
    }
  }
LABEL_16:

LABEL_17:
}

- (id)_mobileAssetDownloadOptionsForClientOptions:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v9 = objc_msgSend_allowsCellular(v3, v5, v6, v7, v8);
  objc_msgSend_setAllowsCellularAccess_(v4, v10, v9, v11, v12);
  objc_msgSend_reachabilityForInternetConnection(FlexReachability, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_currentReachabilityStatus(v17, v18, v19, v20, v21);

  if (v22 == 1 || !objc_msgSend_downloadPriority(v3, v23, v24, v25, v26))
  {
    objc_msgSend_setTimeoutIntervalForResource_(v4, v23, 120, v25, v26);
    objc_msgSend_setDiscretionary_(v4, v27, 0, v28, v29);
  }
  else
  {
    objc_msgSend_setDiscretionary_(v4, v23, 1, v25, v26);
  }

  return v4;
}

- (void)_runAsyncAssetDownloadForMobileAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  _QWORD v70[4];
  NSObject *v71;
  id v72;
  FlexMobileAssetManagerV2 *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id location;
  _QWORD v79[4];
  id v80;
  id v81;
  uint8_t buf[4];
  NSObject *v83;
  __int16 v84;
  void *v85;
  _QWORD v86[2];
  _QWORD v87[5];

  v87[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend_attributes(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("uuid"), v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend__assetIDForMobileAsset_(self, v15, (uint64_t)v9, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__existingSongForUID_(self, v19, (uint64_t)v14, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_existingAssetWithID_(v22, v23, (uint64_t)v18, v24, v25);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_reachabilityForInternetConnection(FlexReachability, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_currentReachabilityStatus(v30, v31, v32, v33, v34);

    if (v35)
    {
      v79[0] = MEMORY[0x24BDAC760];
      v79[1] = 3221225472;
      v79[2] = sub_20D0305D8;
      v79[3] = &unk_24C5F03E8;
      v36 = v22;
      v80 = v36;
      v37 = v69;
      v81 = v37;
      objc_msgSend_attachProgressCallBack_(v9, v38, (uint64_t)v79, v39, v40);
      objc_msgSend_objectForKey_(self->_dowloadOptionsMapping, v41, (uint64_t)v9, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__mobileAssetDownloadOptionsForClientOptions_(self, v45, (uint64_t)v44, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      FlexLogForCategory(2uLL);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v83 = v14;
        v84 = 2112;
        v85 = v18;
        _os_log_impl(&dword_20D016000, v49, OS_LOG_TYPE_DEFAULT, "Starting download task for UID: %@ assetID: %@", buf, 0x16u);
      }

      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = sub_20D030650;
      v70[3] = &unk_24C5F0410;
      objc_copyWeak(&v77, &location);
      v71 = v14;
      v72 = v18;
      v73 = self;
      v74 = v9;
      v75 = v36;
      v76 = v37;
      objc_msgSend_startDownload_then_(v74, v50, (uint64_t)v48, (uint64_t)v70, v51);

      objc_destroyWeak(&v77);
      objc_destroyWeak(&location);

      v52 = v80;
    }
    else
    {
      FlexLogForCategory(2uLL);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D016000, v53, OS_LOG_TYPE_DEFAULT, "Not downloading since network is not reachable", buf, 2u);
      }

      v54 = *MEMORY[0x24BDD0FD8];
      v86[0] = *MEMORY[0x24BDD0FC8];
      v86[1] = v54;
      v87[0] = CFSTR("Download operation was unsuccessful.");
      v87[1] = CFSTR("No network connection");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v55, (uint64_t)v87, (uint64_t)v86, 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v56, (uint64_t)CFSTR("com.apple.FlexMusicKit"), 0, (uint64_t)v52);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateAsset_downloadProgress_error_(v22, v58, (uint64_t)v69, (uint64_t)v57, v59, -1.0);
      objc_msgSend_updateAsset_downloadProgress_error_(v22, v60, (uint64_t)v69, 0, v61, 0.0);
      v62 = self->_downloadThrottleLock;
      objc_sync_enter(v62);
      objc_msgSend_removeObject_(self->_processingDownloadSet, v63, (uint64_t)v9, v64, v65);
      objc_msgSend_removeObjectForKey_(self->_dowloadOptionsMapping, v66, (uint64_t)v9, v67, v68);
      objc_sync_exit(v62);

    }
  }
  else
  {
    FlexLogForCategory(2uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v14, OS_LOG_TYPE_DEFAULT, "Not downloading due to nil mobile asset", buf, 2u);
    }
  }

}

- (void)cancelDownloadOfAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableOrderedSet *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableSet *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  void *v43;
  BOOL v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  FlexMobileAssetManagerV2 *v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_songUID(v4, v5, v6, v7, v8);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetID(v4, v9, v10, v11, v12);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_downloadThrottleLock;
  objc_sync_enter(v13);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v14 = self->_pendingDownloadSet;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v78, (uint64_t)v89, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v79;
LABEL_3:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v79 != v20)
        objc_enumerationMutation(v14);
      v22 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v21);
      if ((objc_msgSend_isEqualToSongAsset_(v22, v16, (uint64_t)v4, v17, v18) & 1) != 0)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v78, (uint64_t)v89, 16);
        if (v19)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v23 = v22;

    if (v23)
      goto LABEL_21;
  }
  else
  {
LABEL_9:

  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v27 = self->_processingDownloadSet;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v74, (uint64_t)v88, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v75;
LABEL_13:
    v34 = 0;
    while (1)
    {
      if (*(_QWORD *)v75 != v33)
        objc_enumerationMutation(v27);
      v35 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v34);
      if ((objc_msgSend_isEqualToSongAsset_(v35, v29, (uint64_t)v4, v30, v31) & 1) != 0)
        break;
      if (v32 == ++v34)
      {
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v74, (uint64_t)v88, 16);
        if (v32)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
    v23 = v35;

    if (!v23)
      goto LABEL_27;
LABEL_21:
    if (objc_msgSend_containsObject_(self->_pendingDownloadSet, v24, (uint64_t)v23, v25, v26))
      objc_msgSend_removeObject_(self->_pendingDownloadSet, v36, (uint64_t)v23, v37, v38);
    v42 = objc_msgSend_containsObject_(self->_processingDownloadSet, v36, (uint64_t)v23, v37, v38);
    if (v42)
      objc_msgSend_removeObject_(self->_processingDownloadSet, v39, (uint64_t)v23, v40, v41);
    objc_msgSend_objectForKey_(self->_dowloadOptionsMapping, v39, (uint64_t)v23, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43 == 0;

    if (!v44)
    {
      objc_msgSend_removeObjectForKey_(self->_dowloadOptionsMapping, v45, (uint64_t)v23, v46, v47);
      goto LABEL_33;
    }
  }
  else
  {
LABEL_19:

LABEL_27:
    FlexLogForCategory(2uLL);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v83 = v67;
      v84 = 2112;
      v85 = v66;
      _os_log_impl(&dword_20D016000, v48, OS_LOG_TYPE_DEFAULT, "Cancel download failed for mobile asset with songUID: %@ assetID: %@ - no mobile asset associated with song asset", buf, 0x16u);
    }

    LOBYTE(v42) = 0;
    v23 = 0;
  }
  FlexLogForCategory(2uLL);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v83 = v67;
    v84 = 2112;
    v85 = v66;
    v86 = 2112;
    v87 = v23;
    _os_log_impl(&dword_20D016000, v49, OS_LOG_TYPE_DEFAULT, "Cancel: Could not remove download options for songUID: %@ assetID: %@ - no associated options for mobile asset %@", buf, 0x20u);
  }

LABEL_33:
  objc_sync_exit(v13);

  objc_msgSend__existingSongForUID_(self, v50, (uint64_t)v67, v51, v52);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
    v58 = v42;
  else
    v58 = 0;
  if ((v58 & 1) != 0)
  {
    objc_msgSend_refreshState(v23, v53, v54, v55, v56);
    if (objc_msgSend_state(v23, v59, v60, v61, v62) == 4)
    {
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = sub_20D03116C;
      v68[3] = &unk_24C5F0438;
      v69 = v67;
      v70 = v66;
      v71 = self;
      v72 = v57;
      v73 = v4;
      objc_msgSend_cancelDownload_(v23, v63, (uint64_t)v68, v64, v65);

    }
  }

}

- (void)cancelDownloadOfAllAssets
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v41 = self->_downloadThrottleLock;
  objc_sync_enter(v41);
  objc_msgSend_removeAllObjects(self->_pendingDownloadSet, v3, v4, v5, v6);
  v11 = (void *)objc_msgSend_copy(self->_processingDownloadSet, v7, v8, v9, v10);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v11;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend_attributes(v20, v13, v14, v15, v16, v41);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("uuid"), v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend__assetIDForMobileAsset_(self, v26, (uint64_t)v20, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__existingSongForUID_(self, v30, (uint64_t)v25, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_existingAssetWithID_(v33, v34, (uint64_t)v29, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_cancelDownloadOfAsset_(self, v38, (uint64_t)v37, v39, v40);

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v17);
  }

  objc_sync_exit(v41);
}

- (void)_purgeAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *purgeQueue;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  FlexMobileAssetManagerV2 *v32;
  id v33;
  id location;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend_attributes(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("uuid"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__assetIDForMobileAsset_(self, v15, (uint64_t)v9, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__existingSongForUID_(self, v19, (uint64_t)v14, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    purgeQueue = self->_purgeQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20D031718;
    block[3] = &unk_24C5F03C0;
    objc_copyWeak(&v33, &location);
    v28 = v9;
    v29 = v22;
    v30 = v18;
    v31 = v14;
    v32 = self;
    v24 = v14;
    v25 = v18;
    v26 = v22;
    dispatch_async(purgeQueue, block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

}

- (void)requestPurgeOfAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char isEqualToString;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString **v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  __CFString *v35;
  NSObject *triggerDownloadAndPurgeQueue;
  __CFString *v37;
  _QWORD v38[4];
  __CFString *v39;
  id v40;
  FlexMobileAssetManagerV2 *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_assetID(v4, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v9, v10, (uint64_t)CFSTR("FMSongArtworkAssetID"), v11, v12);

    if ((isEqualToString & 1) != 0)
    {
      v18 = FlexMobileAssetPropertyArtwork;
    }
    else
    {
      objc_msgSend_assetID(v4, v14, v15, v16, v17);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend_isEqualToString_(v30, v31, (uint64_t)CFSTR("FMSongBundleAssetID"), v32, v33);

      if (!v34)
      {
        v35 = 0;
        goto LABEL_11;
      }
      v18 = FlexMobileAssetPropertySongBundle;
    }
    v35 = *v18;
LABEL_11:
    objc_initWeak((id *)buf, self);
    triggerDownloadAndPurgeQueue = self->_triggerDownloadAndPurgeQueue;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = sub_20D0321C8;
    v38[3] = &unk_24C5F0330;
    objc_copyWeak(&v42, (id *)buf);
    v39 = v35;
    v40 = v4;
    v41 = self;
    v37 = v35;
    dispatch_async(triggerDownloadAndPurgeQueue, v38);

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);
    goto LABEL_12;
  }
  FlexLogForCategory(2uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_songUID(v4, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetID(v4, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v44 = v24;
    v45 = 2112;
    v46 = v29;
    _os_log_impl(&dword_20D016000, v19, OS_LOG_TYPE_DEFAULT, "attempting to purge on a non MobileAsset backed asset %@ %@", buf, 0x16u);

  }
LABEL_12:

}

- (unint64_t)assetStatus:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend_assetStatus(v3, v4, v5, v6, v7);
  }
  else
  {
    objc_msgSend_localURL(v3, v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = v9 == 0;
    v3 = (id)v9;
  }

  return v8;
}

- (int64_t)_responseForDownloadResult:(int64_t)a3
{
  if ((unint64_t)a3 > 0x23)
    return 3;
  else
    return qword_20D048E28[a3];
}

- (id)_mobileAssetCancelDownloadResultStringValue:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 < 8)
    return off_24C5F0458[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("cancel error %li"), v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_mobileAssetDownloadResultStringValue:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 < 0x24)
    return off_24C5F0498[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("download error %li"), v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_mobileAssetPurgeResultStringValue:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 < 0xC)
    return off_24C5F05B8[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("purge error %li"), v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_mobileAssetQueryResultStringValue:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if ((unint64_t)a3 < 0xD && ((0x17FFu >> a3) & 1) != 0)
  {
    v5 = off_24C5F0618[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("query error %li"), v3, v4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)fetchSongsWithOptions:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  id v132;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  void *v148;
  uint8_t v149[128];
  uint8_t buf[4];
  uint64_t v151;
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (self->_enableFetchCache
    && (objc_msgSend_cloudManagedSongs(self, v4, v5, v6, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend_count(v9, v10, v11, v12, v13),
        v9,
        v14))
  {
    FlexLogForCategory(2uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v15, OS_LOG_TYPE_DEFAULT, "fetchAllSongsWithOptions returning cached songs", buf, 2u);
    }

    objc_msgSend_cloudManagedSongs(self, v16, v17, v18, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v139 = v8;
    FlexLogForCategory(2uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v21, OS_LOG_TYPE_DEFAULT, "fetchAllSongsWithOptions making a query into MobileAsset", buf, 2u);
    }

    objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v22, (uint64_t)CFSTR("SongBundle"), 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v30 = v24;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v144, (uint64_t)v152, 16);
    if (v32)
    {
      v37 = v32;
      v38 = *(_QWORD *)v145;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v145 != v38)
            objc_enumerationMutation(v30);
          objc_msgSend_attributes(*(void **)(*((_QWORD *)&v144 + 1) + 8 * i), v33, v34, v35, v36);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v40, v41, (uint64_t)CFSTR("uuid"), v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
            objc_msgSend_addObject_(v29, v45, (uint64_t)v44, v46, v47);

        }
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v144, (uint64_t)v152, 16);
      }
      while (v37);
    }

    objc_msgSend__metadataMappingForUUIDSet_(self, v48, (uint64_t)v29, v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    v138 = v30;
    objc_msgSend__newestContentSetFromAssets_metadataMapping_(self, v52, (uint64_t)v30, v51, v53);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(self, v54, (uint64_t)v137, v51, v55);
    v56 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(MEMORY[0x24BDBCE60], v57, v58, v59, v60);
    v61 = objc_claimAutoreleasedReturnValue();
    v134 = (void *)v56;
    v135 = (void *)v51;
    objc_msgSend__processResults_metadataMapping_(self, v62, v56, v51, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    FlexLogForCategory(2uLL);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_date(MEMORY[0x24BDBCE60], v66, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceDate_(v70, v71, v61, v72, v73);
      *(_DWORD *)buf = 134217984;
      v151 = v74;
      _os_log_impl(&dword_20D016000, v65, OS_LOG_TYPE_DEFAULT, "fetched songs processed in %.2f seconds\n", buf, 0xCu);

    }
    v136 = (void *)v61;

    objc_msgSend_removeAllObjects(v29, v75, v76, v77, v78);
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v20 = v64;
    v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v79, (uint64_t)&v140, (uint64_t)v149, 16);
    if (v80)
    {
      v85 = v80;
      v86 = *(_QWORD *)v141;
      do
      {
        for (j = 0; j != v85; ++j)
        {
          if (*(_QWORD *)v141 != v86)
            objc_enumerationMutation(v20);
          v88 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * j);
          objc_msgSend_uid(v88, v81, v82, v83, v84);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__existingSongForUID_(self, v90, (uint64_t)v89, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v93)
          {
            v148 = v88;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v94, (uint64_t)&v148, 1, v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__registerSongs_(self, v97, (uint64_t)v96, v98, v99);

            objc_msgSend_uid(v88, v100, v101, v102, v103);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v29, v105, (uint64_t)v104, v106, v107);

          }
        }
        v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v81, (uint64_t)&v140, (uint64_t)v149, 16);
      }
      while (v85);
    }

    if (objc_msgSend_count(v29, v108, v109, v110, v111))
    {
      objc_msgSend_allObjects(v29, v112, v113, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__mobileAssetsForAssetType_andUIDs_(self, v117, (uint64_t)CFSTR("Artwork"), (uint64_t)v116, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__metadataMappingForUUIDSet_(self, v120, (uint64_t)v29, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__newestContentSetFromAssets_metadataMapping_(self, v124, (uint64_t)v119, (uint64_t)v123, v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(self, v127, (uint64_t)v126, (uint64_t)v123, v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();

      v132 = (id)objc_msgSend__processResults_metadataMapping_(self, v130, (uint64_t)v129, (uint64_t)v123, v131);
      v8 = v139;
    }
    else
    {
      v8 = v139;
      v129 = v134;
      v123 = v135;
    }

  }
  return v20;
}

- (id)fetchSongWithUID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend__existingSongForUID_(self, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v10, (uint64_t)CFSTR("uid == %@"), v11, v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPredicate_(v9, v14, (uint64_t)v13, v15, v16);

    objc_msgSend_fetchSongsWithOptions_(self, v17, (uint64_t)v9, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v20, v21, v22, v23, v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (OS_dispatch_queue)purgeQueue
{
  return self->_purgeQueue;
}

- (void)setPurgeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_purgeQueue, a3);
}

- (OS_dispatch_queue)triggerDownloadAndPurgeQueue
{
  return self->_triggerDownloadAndPurgeQueue;
}

- (void)setTriggerDownloadAndPurgeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_triggerDownloadAndPurgeQueue, a3);
}

- (OS_dispatch_queue)downloadRequestQueue
{
  return self->_downloadRequestQueue;
}

- (void)setDownloadRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRequestQueue, a3);
}

- (BOOL)includeArtworkInQueries
{
  return self->_includeArtworkInQueries;
}

- (void)setIncludeArtworkInQueries:(BOOL)a3
{
  self->_includeArtworkInQueries = a3;
}

- (BOOL)XMLPresent
{
  return self->_XMLPresent;
}

- (void)setXMLPresent:(BOOL)a3
{
  self->_XMLPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadRequestQueue, 0);
  objc_storeStrong((id *)&self->_triggerDownloadAndPurgeQueue, 0);
  objc_storeStrong((id *)&self->_purgeQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_processingPurgeSet, 0);
  objc_storeStrong((id *)&self->_pendingPurgeSet, 0);
  objc_storeStrong((id *)&self->_dowloadOptionsMapping, 0);
  objc_storeStrong((id *)&self->_processingDownloadSet, 0);
  objc_storeStrong((id *)&self->_pendingDownloadSet, 0);
  objc_storeStrong((id *)&self->_mobileAssetCacheLock, 0);
  objc_storeStrong((id *)&self->_downloadThrottleLock, 0);
  objc_storeStrong((id *)&self->_mobileAssetTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
