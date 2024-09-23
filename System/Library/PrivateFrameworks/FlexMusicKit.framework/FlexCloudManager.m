@implementation FlexCloudManager

+ (id)createCloudManager:(int64_t)a3 withLibrary:(id)a4 options:(id)a5
{
  void *v5;
  id v7;
  id v8;
  FlexMobileAssetManagerV2 *v9;
  const char *v10;
  uint64_t v11;

  if (a3)
  {
    v5 = 0;
  }
  else
  {
    v7 = a5;
    v8 = a4;
    v9 = [FlexMobileAssetManagerV2 alloc];
    v5 = (void *)objc_msgSend_initWithLibrary_options_(v9, v10, (uint64_t)v8, (uint64_t)v7, v11);

  }
  return v5;
}

- (FlexCloudManager)initWithLibrary:(id)a3
{
  id v4;
  FlexCloudManager *v5;
  FlexCloudManager *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *cloudManagedSongs;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *cloudManagedSongsByUID;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FlexCloudManager;
  v5 = -[FlexCloudManager init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_library, v4);
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v7, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    cloudManagedSongs = v6->_cloudManagedSongs;
    v6->_cloudManagedSongs = (NSMutableArray *)v11;

    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    cloudManagedSongsByUID = v6->_cloudManagedSongsByUID;
    v6->_cloudManagedSongsByUID = (NSMutableDictionary *)v17;

    v6->_retryCount = 0;
  }

  return v6;
}

- (void)_registerSongs:(id)a3
{
  id v4;
  FlexCloudManager *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v6 = v4;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v53, (uint64_t)v59, 16);
  if (v12)
  {
    v14 = *(_QWORD *)v54;
    *(_QWORD *)&v13 = 138412290;
    v52 = v13;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v6);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v15);
        objc_msgSend_cloudManagedSongsByUID(v5, v8, v9, v10, v11, v52, (_QWORD)v53);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_uid(v16, v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v17, v23, (uint64_t)v22, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          FlexLogForCategory(2uLL);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_uid(v16, v32, v33, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v52;
            v58 = v36;
            _os_log_impl(&dword_20D016000, v31, OS_LOG_TYPE_DEFAULT, "Song with uid: %@ is already registered", buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend_cloudManagedSongs(v5, v27, v28, v29, v30);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v37, v38, (uint64_t)v16, v39, v40);

          objc_msgSend_cloudManagedSongsByUID(v5, v41, v42, v43, v44);
          v31 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_uid(v16, v45, v46, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v31, v50, (uint64_t)v16, (uint64_t)v49, v51);

        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v53, (uint64_t)v59, 16);
    }
    while (v12);
  }

  objc_sync_exit(v5);
}

- (void)retryFetchAllSongs
{
  FlexCloudManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_time_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  uint8_t buf[4];
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v7 = objc_msgSend_retryCount(v2, v3, v4, v5, v6);
  v8 = pow(3.0, (double)(unint64_t)v7);
  FlexLogForCategory(2uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend_retryCount(v2, v10, v11, v12, v13);
    *(_DWORD *)buf = 134217984;
    v27 = pow(3.0, (double)(unint64_t)v14) * 60.0;
    _os_log_impl(&dword_20D016000, v9, OS_LOG_TYPE_DEFAULT, "refresh requested. will try again in %1.0f seconds", buf, 0xCu);
  }

  objc_initWeak((id *)buf, v2);
  v15 = dispatch_time(0, 1000000000 * (uint64_t)(v8 * 60.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D01A330;
  block[3] = &unk_24C5EFC80;
  objc_copyWeak(&v25, (id *)buf);
  dispatch_after(v15, MEMORY[0x24BDAC9B8], block);
  v20 = objc_msgSend_retryCount(v2, v16, v17, v18, v19);
  objc_msgSend_setRetryCount_(v2, v21, v20 + 1, v22, v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
  objc_sync_exit(v2);

}

- (id)fetchSongsWithOptions:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)fetchSongWithUID:(id)a3
{
  return 0;
}

- (void)requestDownloadOfAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend_requestDownloadOfAsset_withOptions_(self, v5, (uint64_t)v4, (uint64_t)v7, v6);

}

- (id)loadCachedSongs
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)requestPurgeOfAsset:(id)a3
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
  void *v13;
  FlexCloudManager *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend_isCloudBacked(v4, v5, v6, v7, v8))
  {
    objc_msgSend_songUID(v4, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self;
    objc_sync_enter(v14);
    objc_msgSend_cloudManagedSongsByUID(v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v19, v20, (uint64_t)v13, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend_assetID(v4, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_existingAssetWithID_(v23, v29, (uint64_t)v28, v30, v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();

      if (v32 == v4)
      {
        objc_msgSend__purgeAndReturnReplacementFor_(v14, v33, (uint64_t)v4, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v36;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v37, (uint64_t)v43, 1, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateAssets_(v23, v40, (uint64_t)v39, v41, v42);

      }
    }
    objc_sync_exit(v14);

  }
}

- (id)_purgeAndReturnReplacementFor:(id)a3
{
  return 0;
}

- (unint64_t)assetStatus:(id)a3
{
  return 1;
}

- (id)_existingSongForUID:(id)a3
{
  id v4;
  FlexCloudManager *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
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
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int isEqualToString;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_cloudManagedSongsByUID(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v10, v11, (uint64_t)v4, v12, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend_library(v5, v15, v16, v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundledSongs(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v44, (uint64_t)v48, 16);
    if (v14)
    {
      v35 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(v29);
          v37 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          objc_msgSend_uid(v37, v31, v32, v33, v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v38, v39, (uint64_t)v4, v40, v41);

          if (isEqualToString)
          {
            v14 = v37;
            goto LABEL_12;
          }
        }
        v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v31, (uint64_t)&v44, (uint64_t)v48, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_12:

  }
  objc_sync_exit(v5);

  return v14;
}

- (FMSongLibrary)library
{
  return (FMSongLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (NSMutableArray)cloudManagedSongs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)cloudManagedSongsByUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudManagedSongsByUID, 0);
  objc_storeStrong((id *)&self->_cloudManagedSongs, 0);
  objc_destroyWeak((id *)&self->_library);
}

@end
