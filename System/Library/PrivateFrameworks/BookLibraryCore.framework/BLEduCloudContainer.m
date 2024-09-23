@implementation BLEduCloudContainer

+ (id)sharedEduCloudContainer
{
  if (qword_254B61C10 != -1)
    dispatch_once(&qword_254B61C10, &unk_24CE8B1A0);
  return (id)qword_254B61C18;
}

- (BLEduCloudContainer)init
{
  BLEduCloudContainer *v2;
  BLEduCloudContainer *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *containerQueue;
  void *v6;
  uint64_t v7;
  id cloudToken;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  BLEduCloudContainer *v13;
  _QWORD v15[4];
  BLEduCloudContainer *v16;
  id v17;
  uint8_t buf[16];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BLEduCloudContainer;
  v2 = -[BLEduCloudContainer init](&v19, sel_init);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = dispatch_queue_create("com.apple.iBooks.BLEduCloudContainer.containerQueue", 0);
  containerQueue = v3->_containerQueue;
  v3->_containerQueue = (OS_dispatch_queue *)v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ubiquityIdentityToken");
  v7 = objc_claimAutoreleasedReturnValue();
  cloudToken = v3->_cloudToken;
  v3->_cloudToken = (id)v7;

  v9 = v3->_cloudToken;
  BLDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEBUG, "Obtained cloud token.", buf, 2u);
    }

    v12 = v3->_containerQueue;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_212C879D4;
    v15[3] = &unk_24CE8B1C8;
    v13 = v3;
    v16 = v13;
    v17 = v6;
    dispatch_async(v12, v15);

    v3 = v16;
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEBUG, "Not signed in to iCloud. No edu cloud support available.", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)isSignedIn
{
  return self->_cloudToken != 0;
}

- (NSURL)documentsURL
{
  NSURL *documentsURL;
  NSObject *v4;
  _QWORD block[5];

  documentsURL = self->_documentsURL;
  if (!documentsURL)
  {
    -[BLEduCloudContainer containerQueue](self, "containerQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212C87A9C;
    block[3] = &unk_24CE8B1F0;
    block[4] = self;
    dispatch_sync(v4, block);

    documentsURL = self->_documentsURL;
  }
  return documentsURL;
}

- (id)dictionaryAsBookItem:(id)a3 path:(id)a4
{
  BLBookItem *v4;
  id v5;
  BLBookItem *v6;

  v4 = (BLBookItem *)a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    v4 = -[BLBookItem initWithEduCloudData:path:]([BLBookItem alloc], "initWithEduCloudData:path:", v6, v5);

  }
  return v4;
}

- (id)fileNameForPermlink:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "identifierFromPermlink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "stringByAppendingPathExtension:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  else
  {
    BLDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "Warning. Unable to determine path extension from permlink {%@}", buf, 0xCu);
    }

  }
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("cloudItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)cloudUrlForPermlink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[BLEduCloudContainer documentsURL](self, "documentsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLEduCloudContainer fileNameForPermlink:](self, "fileNameForPermlink:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_writePlist:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v7, 1, a5);
  else
    v10 = 0;

  return v10;
}

- (BOOL)_addOrUpdateCloudEntryWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id *v23;
  _BOOL4 v24;
  void *v25;
  id *v26;
  char v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v40;
  id v41;
  id obj;
  _QWORD v43[4];
  NSObject *v44;
  uint64_t *v45;
  uint64_t *v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_212C8837C;
  v52 = sub_212C8838C;
  v53 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("permlink"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[BLEduCloudContainer cloudToken](self, "cloudToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || ((-[BLEduCloudContainer documentsURL](self, "documentsURL"),
         (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      ? (v11 = v8 == 0)
      : (v11 = 1),
        v11 ? (v12 = 0) : (v12 = 1),
        v10,
        v9,
        !v12))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v49[5];
    v49[5] = v20;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLEduCloudContainer cloudUrlForPermlink:](self, "cloudUrlForPermlink:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isUbiquitousItemAtURL:", v14))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
    v47 = 0;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = sub_212C88394;
    v43[3] = &unk_24CE8B218;
    v45 = &v54;
    v44 = v6;
    v46 = &v48;
    v40 = v15;
    objc_msgSend(v15, "coordinateWritingItemAtURL:options:error:byAccessor:", v14, 0, &v47, v43);
    v16 = v47;
    if (!*((_BYTE *)v55 + 24))
    {
      BLDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v49[5];
        *(_DWORD *)buf = 138412546;
        v61 = v14;
        v62 = 2112;
        v63 = v18;
        _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_ERROR, "Failed to write plist to %@. Error: %@", buf, 0x16u);
      }

    }
    v19 = v44;
    goto LABEL_26;
  }
  -[BLEduCloudContainer fileNameForPermlink:](self, "fileNameForPermlink:", v8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingPathComponent:", v40);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeItemAtPath:error:", v16, 0);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id *)(v49 + 5);
  obj = (id)v49[5];
  v24 = -[BLEduCloudContainer _writePlist:toURL:error:](self, "_writePlist:toURL:error:", v6, v22, &obj);
  objc_storeStrong(v23, obj);

  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id *)(v49 + 5);
    v41 = (id)v49[5];
    v27 = objc_msgSend(v13, "setUbiquitous:itemAtURL:destinationURL:error:", 1, v25, v14, &v41);
    objc_storeStrong(v26, v41);
    *((_BYTE *)v55 + 24) = v27;

    if (*((_BYTE *)v55 + 24))
      goto LABEL_27;
    BLDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v28 = v49[5];
      *(_DWORD *)buf = 138412546;
      v61 = v14;
      v62 = 2112;
      v63 = v28;
      v29 = "Failed to add cloud item at %@. Error:  %@";
LABEL_25:
      _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);
    }
  }
  else
  {
    BLDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v30 = v49[5];
      *(_DWORD *)buf = 138412546;
      v61 = v14;
      v62 = 2112;
      v63 = v30;
      v29 = "Failed to write plist to %@. Error:  %@";
      goto LABEL_25;
    }
  }
LABEL_26:

LABEL_27:
  objc_msgSend(v14, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributesOfItemAtPath:error:", v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v32, "fileOwnerAccountName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("mobile"));

    if ((v34 & 1) == 0)
    {
      v35 = *MEMORY[0x24BDD0C78];
      v58[0] = *MEMORY[0x24BDD0CB0];
      v58[1] = v35;
      v59[0] = CFSTR("mobile");
      v59[1] = CFSTR("mobile");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v36, v37, 0);

    }
  }

LABEL_31:
  if (a4)
    *a4 = objc_retainAutorelease((id)v49[5]);
  v38 = *((_BYTE *)v55 + 24) != 0;

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return v38;
}

- (BOOL)_coordinatedReadOfPromisesWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  id v30;
  NSObject *v31;
  BOOL v33;
  void *v34;
  id v35;
  void *v36;
  id *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLEduCloudContainer documentsURL](self, "documentsURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v7, &v47);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v47;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 0;
  v11 = v10;
  if (v10)
  {
    v33 = v11;
    v35 = v9;
    v36 = v5;
    v37 = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v34 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v44 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v18, "pathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("cloudItem"));

          if (v20)
          {
            -[BLEduCloudContainer documentsURL](self, "documentsURL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "URLByAppendingPathComponent:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "addObject:", v22);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v15);
    }

    if (objc_msgSend(v12, "count"))
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v24 = v12;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v40 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
            v38 = 0;
            objc_msgSend(v23, "coordinateReadingItemAtURL:options:error:byAccessor:", v29, 1, &v38, &unk_24CE8B258);
            v30 = v38;
            if (v30)
            {
              BLDefaultLog();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v49 = v24;
                v50 = 2112;
                v51 = v30;
                _os_log_impl(&dword_212C78000, v31, OS_LOG_TYPE_ERROR, "Encountered error doing a coordinated read of %@. Error:  %@", buf, 0x16u);
              }

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
        }
        while (v26);
      }

    }
    v5 = v36;
    a3 = v37;
    v8 = v34;
    v9 = v35;
    v11 = v33;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return v11;
}

- (BOOL)removeBookItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    deleteItemAtURLCoordinated(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "permlink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "permlink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLEduCloudContainer cloudUrlForPermlink:](self, "cloudUrlForPermlink:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      deleteItemAtURLCoordinated(v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v6, "_setCloudCoverImageData:", 0);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v9 == 0;
}

- (BOOL)addBookItem:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "_cloudDictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[BLEduCloudContainer _addOrUpdateCloudEntryWithDictionary:error:](self, "_addOrUpdateCloudEntryWithDictionary:error:", v6, a4);

  return (char)a4;
}

- (BOOL)updateBookItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[BLEduCloudContainer _coordinatedReadOfPromisesWithError:](self, "_coordinatedReadOfPromisesWithError:", 0);
  objc_msgSend(v6, "_cloudDictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[BLEduCloudContainer _addOrUpdateCloudEntryWithDictionary:error:](self, "_addOrUpdateCloudEntryWithDictionary:error:", v7, a4);
  return (char)a4;
}

- (id)allBookItems
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLEduCloudContainer cloudToken](self, "cloudToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v33 = 0;
    v5 = -[BLEduCloudContainer _coordinatedReadOfPromisesWithError:](self, "_coordinatedReadOfPromisesWithError:", &v33);
    v6 = v33;
    if (!v5)
    {
      BLDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v6;
        _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "Failed to read cloud container with error:  %@", buf, 0xCu);
      }

    }
    if (v6)
    {
      v8 = 0;
    }
    else
    {
      -[BLEduCloudContainer documentsURL](self, "documentsURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v10, &v32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v32;

      if (!v6)
      {
        if (!objc_msgSend(v8, "count"))
          goto LABEL_12;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v11 = v8;
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v14)
        {
          v15 = v14;
          v26 = v3;
          v16 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v11);
              v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              if (objc_msgSend(v18, "hasSuffix:", CFSTR("cloudItem")))
              {
                -[BLEduCloudContainer documentsURL](self, "documentsURL");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "URLByAppendingPathComponent:", v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                v21 = (void *)MEMORY[0x24BDBCE70];
                objc_msgSend(v20, "path");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "dictionaryWithContentsOfFile:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v20, "path");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[BLEduCloudContainer dictionaryAsBookItem:path:](self, "dictionaryAsBookItem:path:", v23, v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (v25)
                  objc_msgSend(v27, "addObject:", v25);

              }
            }
            v15 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          }
          while (v15);
          v8 = v11;
          v6 = 0;
          v3 = v26;
        }
        else
        {
          v8 = v11;
        }
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
    }
    BLDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_ERROR, "Failed to get contents of cloud documents directory. Error:  %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)performMetadataActionOnCloudURL:(id)a3 action:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v18;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v6, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithContentsOfFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = objc_msgSend(v14, "hash");
    v7[2](v7, v14);
    if (objc_msgSend(v14, "hash") == v15)
    {
      v16 = 0;
    }
    else
    {
      v18 = 0;
      -[BLEduCloudContainer _addOrUpdateCloudEntryWithDictionary:error:](self, "_addOrUpdateCloudEntryWithDictionary:error:", v14, &v18);
      v16 = v18;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)bookItemForURL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_212C8837C;
  v21 = sub_212C8838C;
  v22 = 0;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEBUG, "bookItemForURL: %@", buf, 0xCu);
  }

  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_212C89234;
  v16[3] = &unk_24CE8B2D0;
  v16[4] = self;
  v16[5] = &v17;
  v7 = (void *)MEMORY[0x2199A44E0](v16);
  if (objc_msgSend(v4, "isUbiquitous"))
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
    v15 = 0;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = sub_212C89348;
    v12[3] = &unk_24CE8B2F8;
    v13 = 0;
    v14 = v7;
    -[NSObject coordinateReadingItemAtURL:options:error:byAccessor:](v8, "coordinateReadingItemAtURL:options:error:byAccessor:", v4, 1, &v15, v12);
    v9 = v15;

  }
  else
  {
    BLDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "Expected to have a ubiquitous URL but instead got %@", buf, 0xCu);
    }
  }

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (id)bookItemForPermlink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  BLEduCloudContainer *v13;
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_212C8837C;
  v21 = sub_212C8838C;
  v22 = 0;
  -[BLEduCloudContainer cloudUrlForPermlink:](self, "cloudUrlForPermlink:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
  v16 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C89610;
  v11[3] = &unk_24CE8B320;
  v12 = 0;
  v13 = self;
  v7 = v5;
  v14 = v7;
  v15 = &v17;
  objc_msgSend(v6, "coordinateReadingItemAtURL:options:error:byAccessor:", v7, 1, &v16, v11);
  v8 = v16;
  v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (id)bookItemsForPermlinks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLEduCloudContainer allBookItems](self, "allBookItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "permlink");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v12))
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)cloudToken
{
  return self->_cloudToken;
}

- (void)setCloudToken:(id)a3
{
  objc_storeStrong(&self->_cloudToken, a3);
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (void)setContainerURL:(id)a3
{
  objc_storeStrong((id *)&self->_containerURL, a3);
}

- (OS_dispatch_queue)containerQueue
{
  return self->_containerQueue;
}

- (void)setContainerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_containerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerQueue, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong(&self->_cloudToken, 0);
  objc_storeStrong((id *)&self->_documentsURL, 0);
}

@end
