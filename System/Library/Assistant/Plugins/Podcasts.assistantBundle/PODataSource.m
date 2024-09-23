@implementation PODataSource

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_217357C4C;
  block[3] = &unk_24D744D70;
  block[4] = a1;
  if (qword_253E64730 != -1)
    dispatch_once(&qword_253E64730, block);
  return (id)qword_253E64738;
}

- (PODataSource)init
{
  return (PODataSource *)((uint64_t (*)(PODataSource *, char *, _QWORD))MEMORY[0x24BEDD108])(self, sel_initWithPlistPath_, 0);
}

- (PODataSource)initWithPlistPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PODataSource *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  objc_super v39;
  uint8_t buf[4];
  PODataSource *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PODataSource;
  v9 = -[PODataSource init](&v39, sel_init);
  if (v9)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPodcastCollectionsByUUID_(v9, v11, (uint64_t)v10, v12, v13);

    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPodcastStationsByUUID_(v9, v19, (uint64_t)v18, v20, v21);

    objc_msgSend_array(MEMORY[0x24BDBCEB8], v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPodcastRevisions_(v9, v27, (uint64_t)v26, v28, v29);

    objc_msgSend_setPlistBasePath_(v9, v30, (uint64_t)v4, v31, v32);
    objc_msgSend_initializeDataFromDictionary(v9, v33, v34, v35, v36);
  }
  POLogInitIfNeeded();
  if (POLogContextSync)
    v37 = POLogContextSync;
  else
    v37 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v9;
    _os_log_impl(&dword_217352000, v37, OS_LOG_TYPE_INFO, "Data source is %@", buf, 0xCu);
  }

  return v9;
}

- (id)arrayFromPlistURL:(id)a3
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;

  v3 = a3;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v3, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentsAtPath_(v8, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v25 = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v18, (uint64_t)v17, 0, 0, &v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;
    if (!v20)
    {
      v21 = 0;
      if (v19)
        goto LABEL_14;
    }
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  POLogInitIfNeeded();
  if (POLogContextSync)
    v22 = POLogContextSync;
  else
    v22 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_21735CE24();
  _MTLogCategorySiri();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    sub_21735CDB4();

  v21 = v20;
LABEL_14:

  return v19;
}

- (BOOL)isPodcastsInstalled
{
  id v2;
  const char *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDC1540]);
  v8 = 0;
  v4 = (void *)objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v2, v3, (uint64_t)CFSTR("com.apple.podcasts"), 0, (uint64_t)&v8);
  v5 = v8;
  if (v5)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v6 = POLogContextSync;
    else
      v6 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_217352000, v6, OS_LOG_TYPE_INFO, "Could not load application record. If the Podcasts app is actually installed, this represents an error: %@.", buf, 0xCu);
    }
  }

  return v4 != 0;
}

- (void)getURLs:(id)a3
{
  void (**v4)(id, void *, void *, _QWORD);
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
  _QWORD v31[4];
  void (**v32)(id, void *, void *, _QWORD);

  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  objc_msgSend_plistBasePath(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_plistBasePath(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v14, v15, (uint64_t)CFSTR("PodcastsDB.plist"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_plistBasePath(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v23, v24, (uint64_t)CFSTR("PodcastsDiff.plist"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v18, v27, 0);
  }
  else
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_21735814C;
    v31[3] = &unk_24D744D98;
    v32 = v4;
    objc_msgSend_getContainerURL_(self, v28, (uint64_t)v31, v29, v30);

  }
}

- (void)getDatabaseURL:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_217358258;
  v9[3] = &unk_24D744DC0;
  v10 = v4;
  v5 = v4;
  objc_msgSend_getURLs_(self, v6, (uint64_t)v9, v7, v8);

}

- (void)getRevisionURL:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2173582E0;
  v9[3] = &unk_24D744DC0;
  v10 = v4;
  v5 = v4;
  objc_msgSend_getURLs_(self, v6, (uint64_t)v9, v7, v8);

}

- (void)getContainerURL:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t path;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD, void *))a3;
  if (v3)
  {
    v4 = container_query_create();
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    v5 = xpc_string_create("com.apple.podcasts");
    container_query_set_identifiers();
    if (!container_query_get_single_result())
    {
      if (container_query_get_last_error() && (v22 = container_error_copy_unlocalized_description()) != 0)
      {
        v26 = (void *)v22;
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v23, v22, v24, v25);
        v27 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v27;
        if (v27)
        {
          v41 = *MEMORY[0x24BDD0BA0];
          v42[0] = v27;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)v42, (uint64_t)&v41, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
        free(v26);
      }
      else
      {
        v29 = 0;
        v30 = 0;
      }
      _MTLogCategorySiri();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v39 = 138412290;
        v40 = (uint64_t)v29;
        _os_log_impl(&dword_217352000, v36, OS_LOG_TYPE_INFO, "We could not access the podcasts container. This probably means the app isn't installed. Description: '%@'", (uint8_t *)&v39, 0xCu);
      }

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v37, (uint64_t)CFSTR("PODataSourceErrorDomain"), 1, (uint64_t)v30);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0, v38);

      goto LABEL_39;
    }
    v6 = container_copy_sandbox_token();
    if (!v6)
      goto LABEL_9;
    v7 = (void *)v6;
    v8 = sandbox_extension_consume();
    _MTLogCategorySiri();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v39 = 134217984;
      v40 = v8;
      _os_log_impl(&dword_217352000, v9, OS_LOG_TYPE_INFO, "Consumed sandbox token and received handle %lli", (uint8_t *)&v39, 0xCu);
    }

    free(v7);
    if (v8)
    {
      path = container_get_path();
      if (v8 == -1)
      {
        _MTLogCategorySiri();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v39) = 0;
          _os_log_impl(&dword_217352000, v33, OS_LOG_TYPE_ERROR, "Something went wrong with getting the sandbox extension.", (uint8_t *)&v39, 2u);
        }

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v34, (uint64_t)CFSTR("PODataSourceErrorDomain"), 2, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v3[2](v3, 0, v35);

        if (!v4)
          goto LABEL_39;
LABEL_29:
        container_query_free();
LABEL_39:

        goto LABEL_40;
      }
      v11 = path;
    }
    else
    {
LABEL_9:
      _MTLogCategorySiri();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_217352000, v12, OS_LOG_TYPE_INFO, "Handle is 0. Maybe we were not issued a token, the app is not sandboxed, or this extension is not needed to access the container.", (uint8_t *)&v39, 2u);
      }

      v11 = container_get_path();
      v8 = 0;
    }
    _MTLogCategorySiri();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v14)
      {
        v39 = 136315138;
        v40 = v11;
        _os_log_impl(&dword_217352000, v13, OS_LOG_TYPE_INFO, "Found container path %s", (uint8_t *)&v39, 0xCu);
      }

      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v15, v11, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x24BDBCF48], v19, (uint64_t)v18, 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v3)[2](v3, v21, 0);

    }
    else
    {
      if (v14)
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_217352000, v13, OS_LOG_TYPE_INFO, "We could not access the podcasts container. This probably means the app isn't installed.", (uint8_t *)&v39, 2u);
      }

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v31, (uint64_t)CFSTR("PODataSourceErrorDomain"), 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0, v18);
    }

    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      _MTLogCategorySiri();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v39 = 134217984;
        v40 = v8;
        _os_log_impl(&dword_217352000, v32, OS_LOG_TYPE_INFO, "Releasing sandbox extension %lli", (uint8_t *)&v39, 0xCu);
      }

      sandbox_extension_release();
    }
    if (!v4)
      goto LABEL_39;
    goto LABEL_29;
  }
LABEL_40:

}

- (BOOL)isPodcastRevisionDataStale
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_217358860;
  v6[3] = &unk_24D744DE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend_getRevisionURL_(self, a2, (uint64_t)v6, v2, v3);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isPodcastDataStale
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_217358A24;
  v6[3] = &unk_24D744DE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend_getDatabaseURL_(self, a2, (uint64_t)v6, v2, v3);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSMutableDictionary)podcastCollectionsByUUID
{
  NSMutableDictionary *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v18[16];

  v3 = self->_podcastCollectionsByUUID;
  objc_sync_enter(v3);
  if (objc_msgSend_isPodcastDataStale(self, v4, v5, v6, v7)
    && (objc_msgSend_constructingData(self, v8, v9, v10, v11) & 1) == 0)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v12 = POLogContextSync;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_217352000, v12, OS_LOG_TYPE_INFO, "Podcast data is stale, going to reinitialize from plist.", v18, 2u);
    }
    objc_msgSend_initializeDataFromDictionary(self, v13, v14, v15, v16);
  }
  objc_sync_exit(v3);

  return self->_podcastCollectionsByUUID;
}

- (NSMutableDictionary)podcastStationsByUUID
{
  NSMutableDictionary *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v18[16];

  v3 = self->_podcastStationsByUUID;
  objc_sync_enter(v3);
  if (objc_msgSend_isPodcastDataStale(self, v4, v5, v6, v7)
    && (objc_msgSend_constructingData(self, v8, v9, v10, v11) & 1) == 0)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v12 = POLogContextSync;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_217352000, v12, OS_LOG_TYPE_INFO, "Podcast data is stale, going to reinitialize from plist.", v18, 2u);
    }
    objc_msgSend_initializeDataFromDictionary(self, v13, v14, v15, v16);
  }
  objc_sync_exit(v3);

  return self->_podcastStationsByUUID;
}

- (id)validity
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_databaseUUID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstRevisionUUID(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("%@-%@"), v14, v15, v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSMutableArray)podcastRevisions
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v18[16];

  v3 = self->_podcastRevisions;
  objc_sync_enter(v3);
  if (objc_msgSend_isPodcastRevisionDataStale(self, v4, v5, v6, v7)
    && (objc_msgSend_constructingData(self, v8, v9, v10, v11) & 1) == 0)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v12 = POLogContextSync;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_217352000, v12, OS_LOG_TYPE_INFO, "Podcast revision data is stale, going to reinitialize from plist.", v18, 2u);
    }
    objc_msgSend_initializeDataFromDictionary(self, v13, v14, v15, v16);
  }
  objc_sync_exit(v3);

  return self->_podcastRevisions;
}

- (void)initializeDataFromDictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];

  if (objc_msgSend_constructingData(self, a2, v2, v3, v4))
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v9 = POLogContextSync;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21735CF54(v9, v10, v11);
  }
  else
  {
    objc_msgSend_setConstructingData_(self, v6, 1, v7, v8);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_217358F00;
    v18[3] = &unk_24D744E10;
    v18[4] = self;
    objc_msgSend_getURLs_(self, v12, (uint64_t)v18, v13, v14);
    objc_msgSend_setConstructingData_(self, v15, 0, v16, v17);
  }
}

- (void)_withExtensionParseDataDictionary:(id)a3 revisionDictionary:(id)a4
{
  NSMutableArray *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  NSMutableArray *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSMutableArray *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  NSObject *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  NSMutableArray *v120;
  NSObject *v121;
  NSObject *v122;
  id v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  uint64_t i;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  NSObject *v138;
  NSObject *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  NSMutableArray *v144;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  NSObject *v174;
  NSMutableArray *podcastRevisions;
  NSMutableArray *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  PODataSource *v184;
  uint8_t v185;
  char v186[15];
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  uint8_t v191[128];
  uint8_t buf[4];
  NSMutableArray *v193;
  uint64_t v194;

  v194 = *MEMORY[0x24BDAC8D0];
  v6 = (NSMutableArray *)a3;
  v7 = a4;
  objc_msgSend_arrayFromPlistURL_(self, v8, (uint64_t)v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayFromPlistURL_(self, v12, (uint64_t)v7, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  POLogInitIfNeeded();
  if (POLogContextSync)
    v16 = POLogContextSync;
  else
    v16 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v193 = v6;
    _os_log_impl(&dword_217352000, v16, OS_LOG_TYPE_INFO, "Constructing data source from %@", buf, 0xCu);
  }
  v184 = self;
  if (!v11)
    goto LABEL_38;
  objc_msgSend_objectAtIndexedSubscript_(v11, v17, 0, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("children"), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v25;
  if (!v25)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v108 = POLogContextSync;
    else
      v108 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      sub_21735D080();
    goto LABEL_20;
  }
  if (objc_msgSend_count(v25, v26, v27, v28, v29) == 2)
  {
    v177 = v15;
    v179 = v11;
    v181 = v7;
    objc_msgSend_objectAtIndexedSubscript_(v30, v31, 0, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)CFSTR("children"), v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndexedSubscript_(v30, v39, 1, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)CFSTR("children"), v44, v45);
    v46 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_indexPathWithIndex_(MEMORY[0x24BDD15D8], v47, 0, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_opt_class();
    v183 = (void *)v38;
    objc_msgSend_constructModelObjectsFromDictionaries_withIndexPath_modelObjectClass_(self, v52, v38, (uint64_t)v50, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_removeAllObjects(self->_podcastCollectionsByUUID, v54, v55, v56, v57);
    objc_msgSend_addEntriesFromDictionary_(self->_podcastCollectionsByUUID, v58, (uint64_t)v53, v59, v60);
    objc_msgSend_indexPathWithIndex_(MEMORY[0x24BDD15D8], v61, 1, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_opt_class();
    v66 = (void *)v46;
    objc_msgSend_constructModelObjectsFromDictionaries_withIndexPath_modelObjectClass_(self, v67, v46, (uint64_t)v64, v65);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_removeAllObjects(self->_podcastStationsByUUID, v69, v70, v71, v72);
    objc_msgSend_addEntriesFromDictionary_(self->_podcastStationsByUUID, v73, (uint64_t)v68, v74, v75);
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v76, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v6;
    objc_msgSend_path(v6, v82, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_attributesOfItemAtPath_error_(v80, v87, (uint64_t)v86, 0, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileModificationDate(v89, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPodcastDataPlistLastModified_(v184, v95, (uint64_t)v94, v96, v97);

    self = v184;
    POLogInitIfNeeded();
    if (POLogContextSync)
      v98 = POLogContextSync;
    else
      v98 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      v99 = v98;
      objc_msgSend_podcastDataPlistLastModified(v184, v100, v101, v102, v103);
      v104 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v193 = v104;
      _os_log_impl(&dword_217352000, v99, OS_LOG_TYPE_INFO, "Podcast data last modified is %@", buf, 0xCu);

    }
    v6 = v81;
    v11 = v179;
    v7 = v181;
    v15 = v177;
LABEL_20:
    objc_msgSend_objectForKeyedSubscript_(v21, v105, (uint64_t)CFSTR("uuid"), v106, v107);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (v112)
    {
      objc_msgSend_setDatabaseUUID_(self, v109, (uint64_t)v112, v110, v111);
      POLogInitIfNeeded();
      if (POLogContextSync)
        v113 = POLogContextSync;
      else
        v113 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        v114 = v113;
        objc_msgSend_databaseUUID(self, v115, v116, v117, v118);
        v119 = v15;
        v120 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v193 = v120;
        _os_log_impl(&dword_217352000, v114, OS_LOG_TYPE_INFO, "Database UUID is %@", buf, 0xCu);

        v15 = v119;
        self = v184;

      }
    }
    else
    {
      POLogInitIfNeeded();
      if (POLogContextSync)
        v122 = POLogContextSync;
      else
        v122 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
        sub_21735D020();
    }

LABEL_38:
    if (v15)
    {
      v180 = v11;
      v182 = v7;
      v176 = v6;
      objc_msgSend_removeAllObjects(self->_podcastRevisions, v17, v18, v19, v20);
      v189 = 0u;
      v190 = 0u;
      v187 = 0u;
      v188 = 0u;
      v178 = v15;
      v123 = v15;
      v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v124, (uint64_t)&v187, (uint64_t)v191, 16);
      if (v125)
      {
        v129 = v125;
        v130 = *(_QWORD *)v188;
        v131 = 1;
        do
        {
          for (i = 0; i != v129; ++i)
          {
            if (*(_QWORD *)v188 != v130)
              objc_enumerationMutation(v123);
            v133 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
            if ((v131 & 1) != 0)
            {
              objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v187 + 1) + 8 * i), v126, (uint64_t)CFSTR("uuid"), v127, v128);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              if (v137)
              {
                objc_msgSend_setFirstRevisionUUID_(self, v134, (uint64_t)v137, v135, v136);
                POLogInitIfNeeded();
                if (POLogContextSync)
                  v138 = POLogContextSync;
                else
                  v138 = MEMORY[0x24BDACB70];
                if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
                {
                  v139 = v138;
                  objc_msgSend_firstRevisionUUID(v184, v140, v141, v142, v143);
                  v144 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v193 = v144;
                  _os_log_impl(&dword_217352000, v139, OS_LOG_TYPE_INFO, "First Revision UUID is %@", buf, 0xCu);

                }
              }
              else
              {
                POLogInitIfNeeded();
                if (POLogContextSync)
                  v145 = POLogContextSync;
                else
                  v145 = MEMORY[0x24BDACB70];
                if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                  sub_21735CFEC(&v185, v186, v145);
              }

              self = v184;
            }
            objc_msgSend_objectForKeyedSubscript_(v133, v126, (uint64_t)CFSTR("podcasts"), v127, v128);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            if (v149)
              objc_msgSend_constructRevisionsFromDictionary_isPodcastCollections_(self, v146, (uint64_t)v149, 1, v148);
            objc_msgSend_objectForKeyedSubscript_(v133, v146, (uint64_t)CFSTR("stations"), v147, v148);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            if (v152)
              objc_msgSend_constructRevisionsFromDictionary_isPodcastCollections_(self, v150, (uint64_t)v152, 0, v151);

            v131 = 0;
          }
          v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v126, (uint64_t)&v187, (uint64_t)v191, 16);
          v131 = 0;
        }
        while (v129);
      }

      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v153, v154, v155, v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v182;
      objc_msgSend_path(v182, v158, v159, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_attributesOfItemAtPath_error_(v157, v163, (uint64_t)v162, 0, v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileModificationDate(v165, v166, v167, v168, v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRevisionsDataPlistLastModified_(self, v171, (uint64_t)v170, v172, v173);

      POLogInitIfNeeded();
      if (POLogContextSync)
        v174 = POLogContextSync;
      else
        v174 = MEMORY[0x24BDACB70];
      v6 = v176;
      v15 = v178;
      v11 = v180;
      if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
      {
        podcastRevisions = self->_podcastRevisions;
        *(_DWORD *)buf = 138412290;
        v193 = podcastRevisions;
        _os_log_impl(&dword_217352000, v174, OS_LOG_TYPE_INFO, "Podcast revisions are %@", buf, 0xCu);
      }
    }
    goto LABEL_68;
  }
  POLogInitIfNeeded();
  if (POLogContextSync)
    v121 = POLogContextSync;
  else
    v121 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
    sub_21735D0E0();

LABEL_68:
}

- (void)constructRevisionsFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  uint64_t v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("inserted"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v34, (uint64_t)v41, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_constructRevisionFromDictionary_isPodcastCollections_isDelete_(self, v13, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v16++), v4, 0);
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v34, (uint64_t)v41, 16);
    }
    while (v14);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend_objectForKeyedSubscript_(v6, v17, (uint64_t)CFSTR("deleted"), v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v30, (uint64_t)v40, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v20);
        v27 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v26);
        v38 = CFSTR("uuid");
        v39 = v27;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)&v39, (uint64_t)&v38, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_constructRevisionFromDictionary_isPodcastCollections_isDelete_(self, v29, (uint64_t)v28, v4, 1);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, (uint64_t)v40, 16);
    }
    while (v24);
  }

}

- (void)constructRevisionFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4 isDelete:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v33 = (id)objc_opt_new();
  v13 = objc_msgSend_count(self->_podcastRevisions, v9, v10, v11, v12);
  objc_msgSend_setRevisionID_(v33, v14, v13, v15, v16);
  if (v5)
    objc_msgSend_setRevisionType_(v33, v17, 2, v18, v19);
  else
    objc_msgSend_setRevisionType_(v33, v17, 0, v18, v19);
  objc_msgSend_objectForKeyedSubscript_(v8, v20, (uint64_t)CFSTR("uuid"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObjectID_(v33, v24, (uint64_t)v23, v25, v26);
  objc_msgSend_setIsPodcastCollection_(v33, v27, v6, v28, v29);
  objc_msgSend_addObject_(self->_podcastRevisions, v30, (uint64_t)v33, v31, v32);

}

- (id)constructModelObjectOfClass:(Class)a3 fromDictionary:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
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
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = a4;
  v6 = objc_alloc_init(a3);
  objc_msgSend_objectForKey_(v5, v7, (uint64_t)CFSTR("uuid"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUuid_(v6, v11, (uint64_t)v10, v12, v13);

  objc_msgSend_objectForKey_(v5, v14, (uint64_t)CFSTR("title"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v6, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_objectForKey_(v5, v21, (uint64_t)CFSTR("feedUrl"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFeedUrl_(v6, v25, (uint64_t)v24, v26, v27);

  objc_msgSend_objectForKey_(v5, v28, (uint64_t)CFSTR("storeId"), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setStoreId_(v6, v32, (uint64_t)v31, v33, v34);
  return v6;
}

- (id)constructModelObjectsFromDictionaries:(id)a3 withIndexPath:(id)a4 modelObjectClass:(Class)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v8;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v16)
  {
    v19 = v16;
    v20 = 0;
    v21 = *(_QWORD *)v41;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend_constructModelObjectOfClass_fromDictionary_(self, v17, (uint64_t)a5, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v22), v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_indexPathByAddingIndex_(v9, v24, v20 + v22, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setIndexPath_(v23, v28, (uint64_t)v27, v29, v30);

        objc_msgSend_uuid(v23, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v14, v36, (uint64_t)v23, (uint64_t)v35, v37);

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v40, (uint64_t)v44, 16);
      v20 += v22;
    }
    while (v19);
  }

  return v14;
}

- (id)podcastModelObjectsInArray:(id)a3 matchingString:(id)a4 maxResults:(int64_t)a5
{
  id v7;
  id v8;
  const char *v9;
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
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = v7;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v16)
  {
    v21 = v16;
    v22 = *(_QWORD *)v31;
LABEL_3:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v22)
        objc_enumerationMutation(v14);
      v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v23);
      objc_msgSend_title(v24, v17, v18, v19, v20, (_QWORD)v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_rangeOfString_options_(v25, v26, (uint64_t)v8, 1, v27);

      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend_addObject_(v13, v17, (uint64_t)v24, v19, v20);
      if (a5 >= 1 && objc_msgSend_count(v13, v17, v18, v19, v20) == a5)
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v34, 16);
        if (v21)
          goto LABEL_3;
        break;
      }
    }
  }

  return v13;
}

- (id)podcastCollectionsMatchingString:(id)a3 maxResults:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;

  v6 = a3;
  objc_msgSend_podcastCollections(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_podcastModelObjectsInArray_matchingString_maxResults_(self, v12, (uint64_t)v11, (uint64_t)v6, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)podcastStationsMatchingString:(id)a3 maxResults:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;

  v6 = a3;
  objc_msgSend_podcastStations(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_podcastModelObjectsInArray_matchingString_maxResults_(self, v12, (uint64_t)v11, (uint64_t)v6, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)podcastCollectionWithUUID:(id)a3
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
  void *v13;

  v4 = a3;
  objc_msgSend_podcastCollectionsByUUID(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)podcastCollections
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_podcastCollectionsByUUID(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)podcastStationWithUUID:(id)a3
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
  void *v13;

  v4 = a3;
  objc_msgSend_podcastStationsByUUID(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)podcastStations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_podcastStationsByUUID(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)podcastRevisionsSinceAnchor:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_podcastRevisions(self, v8, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v14)
  {
    v19 = v14;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v12);
        v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend_revisionID(v22, v15, v16, v17, v18) >= a3)
          objc_msgSend_addObject_(v7, v15, (uint64_t)v22, v17, v18);
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v19);
  }

  return v7;
}

- (id)domainObjectWithUUID:(id)a3
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  objc_msgSend_podcastCollectionsByUUID(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_podcastStationsByUUID(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v4, v20, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_SAMPCollection(v13, v14, v15, v16, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)podcastsIndexPath
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_indexPathWithIndex_(MEMORY[0x24BDD15D8], a2, 0, v2, v3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_podcastCollectionsByUUID(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_podcastStationsByUUID(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("%@ (%p) podcast collections: %@, podcast stations: %@"), v17, v18, v5, self, v10, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)setPodcastCollectionsByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_podcastCollectionsByUUID, a3);
}

- (void)setPodcastStationsByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_podcastStationsByUUID, a3);
}

- (void)setPodcastRevisions:(id)a3
{
  objc_storeStrong((id *)&self->_podcastRevisions, a3);
}

- (NSString)databaseUUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDatabaseUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)firstRevisionUUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirstRevisionUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)podcastDataPlistLastModified
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPodcastDataPlistLastModified:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)revisionsDataPlistLastModified
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRevisionsDataPlistLastModified:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)constructingData
{
  return self->_constructingData;
}

- (void)setConstructingData:(BOOL)a3
{
  self->_constructingData = a3;
}

- (NSURL)plistBasePath
{
  return self->_plistBasePath;
}

- (void)setPlistBasePath:(id)a3
{
  objc_storeStrong((id *)&self->_plistBasePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistBasePath, 0);
  objc_storeStrong((id *)&self->_revisionsDataPlistLastModified, 0);
  objc_storeStrong((id *)&self->_podcastDataPlistLastModified, 0);
  objc_storeStrong((id *)&self->_firstRevisionUUID, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_podcastRevisions, 0);
  objc_storeStrong((id *)&self->_podcastStationsByUUID, 0);
  objc_storeStrong((id *)&self->_podcastCollectionsByUUID, 0);
}

@end
