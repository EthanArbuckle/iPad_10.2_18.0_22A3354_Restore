@implementation FMSongLibrary

+ (id)sharedLibraryWithOptions:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D01C54C;
  block[3] = &unk_24C5EFCC8;
  v9 = v3;
  v4 = qword_2549A1970;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&qword_2549A1970, block);
  v6 = (id)qword_2549A1968;

  return v6;
}

- (FMSongLibrary)init
{
  uint64_t v2;
  uint64_t v3;
  FMSongLibrary *v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = (FMSongLibrary *)objc_msgSend_initWithOptions_(self, a2, MEMORY[0x24BDBD1B8], v2, v3);
  FlexLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20D016000, v5, OS_LOG_TYPE_DEFAULT, "Deprecated: use -initWithOptions: instead", v7, 2u);
  }

  return v4;
}

- (FMSongLibrary)initWithOptions:(id)a3
{
  id v5;
  FMSongLibrary *v6;
  FMSongLibrary *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  objc_super v49;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)FMSongLibrary;
  v6 = -[FMSongLibrary init](&v49, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    objc_msgSend_objectForKey_(v5, v8, (uint64_t)CFSTR("CloudSupportDisabled"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_BOOLValue(v11, v12, v13, v14, v15);

    objc_msgSend_objectForKey_(v5, v17, (uint64_t)CFSTR("NetworkingDisabled"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_networkingIsDisabled = objc_msgSend_BOOLValue(v20, v21, v22, v23, v24);

    if (v7->_networkingIsDisabled)
      v7->_networkStatus = 0;
    else
      objc_msgSend__setupReachability(v7, v25, v26, v27, v28);
    objc_msgSend_date(MEMORY[0x24BDBCE60], v25, v26, v27, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_contactedCloud = 0;
    if ((v16 & 1) == 0)
      objc_msgSend__createCloudManagerOfType_(v7, v29, 0, v31, v32);
    objc_msgSend__loadBundledSongs(v7, v29, v30, v31, v32);
    if (!v7->_networkingIsDisabled)
      objc_msgSend__updateFromCloud(v7, v34, v35, v36, v37);
    FlexLogForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_date(MEMORY[0x24BDBCE60], v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceDate_(v43, v44, (uint64_t)v33, v45, v46);
      *(_DWORD *)buf = 134217984;
      v51 = v47;
      _os_log_impl(&dword_20D016000, v38, OS_LOG_TYPE_DEFAULT, "library initialized in %.2f seconds\n", buf, 0xCu);

    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v6, v7, (uint64_t)self, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)FMSongLibrary;
  -[FMSongLibrary dealloc](&v10, sel_dealloc);
}

- (void)cancelDownloadOfAllAssets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_cloudManager(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelDownloadOfAllAssets(v9, v5, v6, v7, v8);

}

- (id)fetchSongWithUID:(id)a3
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  FMSongLibrary *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a3;
  if (v8)
  {
    objc_msgSend_cloudManager(self, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    objc_msgSend_cloudManager(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchSongWithUID_(v14, v15, (uint64_t)v8, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v9);
    if (!v18)
    {
      v19 = self;
      objc_sync_enter(v19);
      objc_msgSend_bundledSongs(v19, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v24, v25, (uint64_t)v8, v26, v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_sync_exit(v19);
    }
  }
  else
  {
    v18 = 0;
  }
  if (objc_msgSend_recalled(v18, v4, v5, v6, v7))
  {

    v18 = 0;
  }

  return v18;
}

- (id)fetchSongsWithOptions:(id)a3
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
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  FMSongLibrary *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
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
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  int v105;
  uint64_t v106;
  _QWORD v107[3];

  v107[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_date(MEMORY[0x24BDBCE60], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v15, (uint64_t)CFSTR("recalled == NO"), v16, v17);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v4)
  {
    objc_msgSend_predicate(v4, v18, v19, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v22;
    if (v24)
    {
      v25 = (void *)MEMORY[0x24BDD14C0];
      v107[0] = v22;
      objc_msgSend_predicate(v4, v18, v19, v20, v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v107[1] = v26;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v27, (uint64_t)v107, 2, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_andPredicateWithSubpredicates_(v25, v30, (uint64_t)v29, v31, v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend_cloudManager(self, v18, v19, v20, v21);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v33);
  objc_msgSend_cloudManager(self, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchSongsWithOptions_(v38, v39, (uint64_t)v4, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_filteredArrayUsingPredicate_(v42, v43, (uint64_t)v23, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v14, v47, (uint64_t)v46, v48, v49);

  objc_sync_exit(v33);
  v50 = self;
  objc_sync_enter(v50);
  objc_msgSend_bundledSongs(v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v55, v56, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v60, v61, (uint64_t)v23, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v14, v65, (uint64_t)v64, v66, v67);

  objc_sync_exit(v50);
  objc_msgSend_sortDescriptors(v4, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend_sortDescriptors(v4, v73, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v14, v78, (uint64_t)v77, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_removeAllObjects(v14, v82, v83, v84, v85);
    objc_msgSend_addObjectsFromArray_(v14, v86, (uint64_t)v81, v87, v88);

  }
  FlexLogForCategory(0);
  v89 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_date(MEMORY[0x24BDBCE60], v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v94, v95, (uint64_t)v9, v96, v97);
    v105 = 134217984;
    v106 = v98;
    _os_log_impl(&dword_20D016000, v89, OS_LOG_TYPE_DEFAULT, "fetchSongsWithOptions fetched in %.2f seconds\n", (uint8_t *)&v105, 0xCu);

  }
  objc_msgSend_allObjects(v14, v99, v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  return v103;
}

- (void)_loadBundledSongs
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  FMSongLibrary *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_objectForKey_(self->_options, a2, (uint64_t)CFSTR("FMSongLibraryInitOption_CustomBundledSongsPath"), v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    v10 = v5;
  }
  else
  {
    objc_msgSend_pathToBundledResourceWithName_(FlexUtilities, v6, (uint64_t)CFSTR("FlexAudio"), v7, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v10;
  objc_msgSend_loadSongsAndArtworkInFolderAtPath_(FMSong, v11, (uint64_t)v10, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self;
  objc_sync_enter(v16);
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBundledSongs_(v16, v22, (uint64_t)v21, v23, v24);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v25 = v15;
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v54, (uint64_t)v62, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v55 != v32)
          objc_enumerationMutation(v25);
        v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend_bundledSongs(v16, v27, v28, v29, v30, (_QWORD)v54);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_uid(v34, v36, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v35, v41, (uint64_t)v34, (uint64_t)v40, v42);

      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v54, (uint64_t)v62, 16);
    }
    while (v31);
  }

  objc_sync_exit(v16);
  FlexLogForCategory(0);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_bundledSongs(v16, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_count(v48, v49, v50, v51, v52);
    *(_DWORD *)buf = 134218242;
    v59 = v53;
    v60 = 2112;
    v61 = v14;
    _os_log_impl(&dword_20D016000, v43, OS_LOG_TYPE_DEFAULT, "loading %lu songs from %@", buf, 0x16u);

  }
}

- (void)_setupReachability
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  objc_msgSend_reachabilityForInternetConnection(FlexReachability, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFlexReachability_(self, v7, (uint64_t)v6, v8, v9);

  objc_msgSend_flexReachability(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_currentReachabilityStatus(v14, v15, v16, v17, v18);
  objc_msgSend_setNetworkStatus_(self, v20, v19, v21, v22);

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v27, v28, (uint64_t)self, (uint64_t)sel_networkStatusChanged_, (uint64_t)CFSTR("kFlexNetworkReachabilityChangedNotification"), 0);

  objc_msgSend_flexReachability(self, v29, v30, v31, v32);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startNotifier(v37, v33, v34, v35, v36);

}

- (void)networkStatusChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  _QWORD block[5];

  objc_msgSend_flexReachability(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_currentReachabilityStatus(v6, v7, v8, v9, v10);

  if (!objc_msgSend_networkStatus(self, v12, v13, v14, v15) && v11)
  {
    if ((objc_msgSend_contactedCloud(self, v16, v17, v18, v19) & 1) == 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_20D01D06C;
      block[3] = &unk_24C5EFCC8;
      block[4] = self;
      if (qword_2549A1978 != -1)
        dispatch_once(&qword_2549A1978, block);
    }
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postNotificationName_object_(v24, v25, (uint64_t)CFSTR("FMSongLibraryReconnectedToNetwork"), (uint64_t)self, v26);

  }
  objc_msgSend_setNetworkStatus_(self, v16, v11, v18, v19);
}

- (void)_createCloudManagerOfType:(int64_t)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  FMSongLibrary *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_cloudManager(obj, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3 && !v8)
  {
    objc_msgSend_createCloudManager_withLibrary_options_(FlexCloudManager, v9, 0, (uint64_t)obj, (uint64_t)obj->_options);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCloudManager_(obj, v11, (uint64_t)v10, v12, v13);

  }
  objc_sync_exit(obj);

}

- (void)_notifySongsChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  id v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, (uint64_t)a3, v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v7, v6, (uint64_t)CFSTR("FMSongLibraryAvailableSongsChanged"), (uint64_t)self, 0);

}

- (void)_notifySongDownloadInProgressChanged:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObject_forKey_(v6, v8, (uint64_t)v7, (uint64_t)CFSTR("FMSongLibrarySongDownloadInProgressState"), v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v14, v15, (uint64_t)CFSTR("FMSongLibrarySongDownloadInProgressChanged"), (uint64_t)self, (uint64_t)v16);

}

- (void)_updateFromCloud
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_cloudManager(self, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_20D01D2C8;
  v11[3] = &unk_24C5EFD70;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  objc_msgSend_fetchAllSongsWithCompletion_(v7, v8, (uint64_t)v11, v9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)requestDownloadOfAllAssetsWithIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend_requestDownloadOfAllAssetsWithIDs_withOptions_(self, v5, (uint64_t)v4, (uint64_t)v7, v6);

}

- (void)requestDownloadOfAllAssetsWithIDs:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_fetchSongsWithOptions_(self, v8, 0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v11);
        objc_msgSend_requestDownloadOfAllAssetsWithIDs_withOptions_(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v18++), v14, (uint64_t)v6, (uint64_t)v7, v15);
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v16);
  }

}

- (void)purgeAllLocalCachedAssetsWithIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_fetchSongsWithOptions_(self, v5, 0, v6, v7);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v34, (uint64_t)v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = v4;
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v38, 16);
        if (v16)
        {
          v20 = v16;
          v21 = *(_QWORD *)v31;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v31 != v21)
                objc_enumerationMutation(v14);
              objc_msgSend_assetWithID_(v13, v17, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v22), v18, v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_purgeLocalCache(v23, v24, v25, v26, v27);

              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v38, 16);
          }
          while (v20);
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v34, (uint64_t)v39, 16);
    }
    while (v10);
  }

}

- (BOOL)supportForCloud
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_cloudManager(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (BOOL)contactedCloud
{
  return self->_contactedCloud;
}

- (void)setContactedCloud:(BOOL)a3
{
  self->_contactedCloud = a3;
}

- (BOOL)networkingIsDisabled
{
  return self->_networkingIsDisabled;
}

- (NSDictionary)options
{
  return self->_options;
}

- (FlexCloudManager)cloudManager
{
  return self->_cloudManager;
}

- (void)setCloudManager:(id)a3
{
  objc_storeStrong((id *)&self->_cloudManager, a3);
}

- (FlexReachability)flexReachability
{
  return self->_flexReachability;
}

- (void)setFlexReachability:(id)a3
{
  objc_storeStrong((id *)&self->_flexReachability, a3);
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (NSMutableDictionary)bundledSongs
{
  return self->_bundledSongs;
}

- (void)setBundledSongs:(id)a3
{
  objc_storeStrong((id *)&self->_bundledSongs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundledSongs, 0);
  objc_storeStrong((id *)&self->_flexReachability, 0);
  objc_storeStrong((id *)&self->_cloudManager, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
