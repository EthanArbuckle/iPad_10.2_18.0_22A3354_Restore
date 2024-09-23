@implementation ATAirlock

- (ATAirlock)init
{
  ATAirlock *v2;
  ATAirlock *v3;
  NSString *basePath;
  NSFileManager *v5;
  NSFileManager *fm;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATAirlock;
  v2 = -[ATAirlock init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    basePath = v2->_basePath;
    v2->_basePath = (NSString *)CFSTR("/var/mobile/Media/Airlock/");

    v5 = (NSFileManager *)objc_alloc_init(MEMORY[0x24BDD1580]);
    fm = v3->_fm;
    v3->_fm = v5;

  }
  return v3;
}

- (void)createAirlockForDataclasses:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    *(_QWORD *)&v6 = 138543362;
    v12 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        -[NSString stringByAppendingPathComponent:](self->_basePath, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSFileManager fileExistsAtPath:](self->_fm, "fileExistsAtPath:", v10))
        {
          v11 = os_log_create("com.apple.amp.AirTraffic", "Framework");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v12;
            v18 = v4;
            _os_log_impl(&dword_20BB5D000, v11, OS_LOG_TYPE_DEFAULT, "Creating airlock for %{public}@", buf, 0xCu);
          }

          -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self->_fm, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

}

- (void)evacuateDataclasses:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSFileManager *fm;
  void *v15;
  NSObject *v16;
  NSFileManager *v17;
  void *v18;
  NSFileManager *v19;
  void *v20;
  NSFileManager *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "Evacuating airlock", buf, 2u);
  }

  v6 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NSFileManager subpathsOfDirectoryAtPath:error:](self->_fm, "subpathsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Media/Airlock/"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v7;
    _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_DEFAULT, "Airlock contents: %{public}@", buf, 0xCu);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("Application"), (_QWORD)v23))
        {
          fm = self->_fm;
          objc_msgSend(CFSTR("/var/mobile/Media/"), "stringByAppendingPathComponent:", CFSTR("PublicStaging"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(fm) = -[NSFileManager fileExistsAtPath:](fm, "fileExistsAtPath:", v15);

          if ((_DWORD)fm)
          {
            v16 = os_log_create("com.apple.amp.AirTraffic", "Framework");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20BB5D000, v16, OS_LOG_TYPE_DEFAULT, "Removing PublicStaging", buf, 2u);
            }

            v17 = self->_fm;
            objc_msgSend(CFSTR("/var/mobile/Media/"), "stringByAppendingPathComponent:", CFSTR("PublicStaging"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSFileManager removeItemAtPath:error:](v17, "removeItemAtPath:error:", v18, 0);

          }
        }
        v19 = self->_fm;
        -[NSString stringByAppendingPathComponent:](self->_basePath, "stringByAppendingPathComponent:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = -[NSFileManager fileExistsAtPath:](v19, "fileExistsAtPath:", v20);

        if ((_DWORD)v19)
        {
          v21 = self->_fm;
          -[NSString stringByAppendingPathComponent:](self->_basePath, "stringByAppendingPathComponent:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSFileManager removeItemAtPath:error:](v21, "removeItemAtPath:error:", v22, 0);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

}

- (void)purgeAssetWithIdentifier:(id)a3 dataclass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString stringByAppendingPathComponent:](self->_basePath, "stringByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_20BB5D000, v12, OS_LOG_TYPE_DEFAULT, "Purging %{public}@ with identifier %{public}@, path: %{public}@", (uint8_t *)&v13, 0x20u);
  }

  -[NSFileManager removeItemAtPath:error:](self->_fm, "removeItemAtPath:error:", v11, 0);
}

- (void)copyAssetToAirlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *basePath;
  void *v11;
  void *v12;
  void *v13;
  NSFileManager *fm;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSFileManager *v21;
  void *v22;
  NSFileManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  BOOL v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  BOOL v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/var/mobile/Media/"), "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  basePath = self->_basePath;
  v38 = v4;
  objc_msgSend(v4, "dataclass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0;
  if (!-[NSFileManager fileExistsAtPath:isDirectory:](self->_fm, "fileExistsAtPath:isDirectory:", v9, &v49))
  {
    v15 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v38;
      _os_log_impl(&dword_20BB5D000, v15, OS_LOG_TYPE_ERROR, "Trying to upload asset with no path! %{public}@", buf, 0xCu);
    }
LABEL_24:
    v31 = 0;
    goto LABEL_25;
  }
  fm = self->_fm;
  if (!v49)
  {
    v43 = 0;
    v32 = -[NSFileManager copyItemAtPath:toPath:error:](fm, "copyItemAtPath:toPath:error:", v9, v13, &v43);
    v31 = v43;
    v33 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    v15 = v33;
    if (v32)
    {
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_DWORD *)buf = 138543618;
      v51 = v9;
      v52 = 2114;
      v53 = v13;
      v34 = "Airlock successfully cloned %{public}@ to %{public}@";
      v35 = v15;
      v36 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      v52 = 2114;
      v53 = v31;
      v34 = "Failed to create clone for upload %{public}@, error: %{public}@";
      v35 = v15;
      v36 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_20BB5D000, v35, v36, v34, buf, 0x16u);
    goto LABEL_25;
  }
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](fm, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[NSFileManager subpathsOfDirectoryAtPath:error:](self->_fm, "subpathsOfDirectoryAtPath:error:", v9, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (!v16)
    goto LABEL_24;
  v17 = v16;
  v37 = v7;
  v42 = 0;
  v18 = *(_QWORD *)v46;
  v40 = v15;
  v41 = v9;
  v39 = v13;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v46 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      v21 = self->_fm;
      objc_msgSend(v9, "stringByAppendingPathComponent:", v20, v37);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = -[NSFileManager fileExistsAtPath:isDirectory:](v21, "fileExistsAtPath:isDirectory:", v22, &v49);

      if ((_DWORD)v21)
      {
        v23 = self->_fm;
        if (v49)
        {
          objc_msgSend(v13, "stringByAppendingPathComponent:", v20);
          v24 = objc_claimAutoreleasedReturnValue();
          -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v24, 1, 0, 0);
LABEL_18:

          continue;
        }
        objc_msgSend(v9, "stringByAppendingPathComponent:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingPathComponent:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v42;
        v27 = -[NSFileManager copyItemAtPath:toPath:error:](v23, "copyItemAtPath:toPath:error:", v25, v26, &v44);
        v28 = v44;

        v29 = os_log_create("com.apple.amp.AirTraffic", "Framework");
        v24 = v29;
        if (v27)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v39;
            objc_msgSend(v39, "stringByAppendingPathComponent:", v20);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v51 = v20;
            v52 = 2114;
            v9 = v41;
            v53 = v41;
            v54 = 2114;
            v55 = v30;
            _os_log_impl(&dword_20BB5D000, v24, OS_LOG_TYPE_DEFAULT, "Airlock cloned subpath %{public}@ of upload %{public}@ to %{public}@", buf, 0x20u);

            v42 = v28;
LABEL_17:
            v15 = v40;
            goto LABEL_18;
          }
        }
        else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v51 = v20;
          v52 = 2114;
          v53 = v38;
          v54 = 2114;
          v55 = v28;
          _os_log_impl(&dword_20BB5D000, v24, OS_LOG_TYPE_ERROR, "Failed to create clone for subpath %{public}@ of upload %{public}@, error: %{public}@", buf, 0x20u);
        }
        v42 = v28;
        v13 = v39;
        v9 = v41;
        goto LABEL_17;
      }
    }
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  }
  while (v17);
  v7 = v37;
  v31 = v42;
LABEL_25:

}

- (void)processCompletedAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *basePath;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  id v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  id v28;
  NSFileManager *fm;
  BOOL v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint32_t v35;
  NSObject *v36;
  NSFileManager *v37;
  BOOL v38;
  NSObject *v39;
  NSFileManager *v40;
  BOOL v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSFileManager *v46;
  id v47;
  NSObject *v48;
  _BOOL4 v49;
  _BOOL4 v50;
  const char *v51;
  const char *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  NSObject *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "storeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  if (v7)
  {
    objc_msgSend(v4, "storeInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByRemovingPercentEncoding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByRemovingPercentEncoding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  basePath = self->_basePath;
  objc_msgSend(v4, "dataclass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/var/mobile/Media/"), "stringByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByStandardizingPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "hasPrefix:", CFSTR("/var/mobile/Media/")) & 1) == 0)
  {
    v22 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_18:
      v28 = 0;
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138543362;
    v58 = v17;
    v24 = "Cannot move asset outside of AFC root: %{public}@";
    v25 = v22;
    v26 = OS_LOG_TYPE_ERROR;
    v27 = 12;
LABEL_17:
    _os_log_impl(&dword_20BB5D000, v25, v26, v24, buf, v27);
    goto LABEL_18;
  }
  if (!objc_msgSend(v4, "isDownload"))
    goto LABEL_14;
  objc_msgSend(v4, "path");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_14;
  v19 = (void *)v18;
  objc_msgSend(v4, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "length"))
  {

    goto LABEL_14;
  }
  v21 = -[NSFileManager fileExistsAtPath:](self->_fm, "fileExistsAtPath:", v14);

  if (!v21)
  {
LABEL_14:
    if ((objc_msgSend(v4, "isDownload") & 1) == 0)
    {
      fm = self->_fm;
      v53 = 0;
      v30 = -[NSFileManager removeItemAtPath:error:](fm, "removeItemAtPath:error:", v14, &v53);
      v28 = v53;
      v31 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      v22 = v31;
      if (v30)
      {
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 138543362;
        v58 = v4;
        v32 = "Removed completed upload for asset %{public}@";
        v33 = v22;
        v34 = OS_LOG_TYPE_DEFAULT;
        v35 = 12;
      }
      else
      {
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_19;
        *(_DWORD *)buf = 138543618;
        v58 = v4;
        v59 = 2114;
        v60 = v28;
        v32 = "Failed ro remove completed upload for asset %{public}@, error: %{public}@";
        v33 = v22;
        v34 = OS_LOG_TYPE_ERROR;
        v35 = 22;
      }
      _os_log_impl(&dword_20BB5D000, v33, v34, v32, buf, v35);
      goto LABEL_19;
    }
    v22 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    *(_DWORD *)buf = 138543618;
    v58 = v4;
    v59 = 2114;
    v60 = v14;
    v24 = "asset not found in airlock. asset=%{public}@, airlockPath=%{public}@";
    v25 = v22;
    v26 = OS_LOG_TYPE_INFO;
    v27 = 22;
    goto LABEL_17;
  }
  objc_msgSend(v17, "stringByDeletingLastPathComponent");
  v22 = objc_claimAutoreleasedReturnValue();
  if (-[NSFileManager fileExistsAtPath:](self->_fm, "fileExistsAtPath:", v22))
  {
    v23 = 0;
  }
  else
  {
    v36 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v58 = v22;
      _os_log_impl(&dword_20BB5D000, v36, OS_LOG_TYPE_DEFAULT, "Airlock destination directory not present, creating %{public}@", buf, 0xCu);
    }

    v37 = self->_fm;
    v56 = 0;
    v38 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v37, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v22, 1, 0, &v56);
    v23 = v56;
    if (!v38)
    {
      _ATLogCategoryFramework();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v58 = v22;
        v59 = 2114;
        v60 = v23;
        _os_log_impl(&dword_20BB5D000, v39, OS_LOG_TYPE_ERROR, "Could not create directory %{public}@, error: %{public}@", buf, 0x16u);
      }

    }
  }
  v40 = self->_fm;
  v55 = v23;
  v41 = -[NSFileManager moveItemAtPath:toPath:error:](v40, "moveItemAtPath:toPath:error:", v14, v17, &v55);
  v28 = v55;

  if (v41)
  {
    v42 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "path");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/var/mobile/Media/"), "stringByAppendingPathComponent:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v14;
      v59 = 2112;
      v60 = v44;
      _os_log_impl(&dword_20BB5D000, v42, OS_LOG_TYPE_DEFAULT, "Airlock moved %{public}@ to %{pubic}@", buf, 0x16u);

    }
LABEL_49:

    goto LABEL_19;
  }
  if (-[NSFileManager fileExistsAtPath:](self->_fm, "fileExistsAtPath:", v17))
  {
    _ATLogCategoryFramework();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v58 = v17;
      _os_log_impl(&dword_20BB5D000, v45, OS_LOG_TYPE_DEFAULT, "File already exists at %{public}@, removing", buf, 0xCu);
    }

    -[NSFileManager removeItemAtPath:error:](self->_fm, "removeItemAtPath:error:", v17, 0);
    v46 = self->_fm;
    v54 = v28;
    -[NSFileManager moveItemAtPath:toPath:error:](v46, "moveItemAtPath:toPath:error:", v14, v17, &v54);
    v47 = v54;

    v28 = v47;
  }
  if (!-[NSFileManager fileExistsAtPath:](self->_fm, "fileExistsAtPath:", v17))
  {
    _ATLogCategoryFramework();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v58 = v4;
      v59 = 2114;
      v60 = v28;
      _os_log_impl(&dword_20BB5D000, v48, OS_LOG_TYPE_ERROR, "Failed to move completed file for asset %{public}@, error: %{public}@", buf, 0x16u);
    }

    v49 = -[NSFileManager fileExistsAtPath:](self->_fm, "fileExistsAtPath:", v22);
    v50 = -[NSFileManager fileExistsAtPath:](self->_fm, "fileExistsAtPath:", v14);
    _ATLogCategoryFramework();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v51 = "does not exist";
      *(_DWORD *)buf = 136315906;
      if (v50)
        v52 = "exists";
      else
        v52 = "does not exist";
      v58 = (id)v52;
      v59 = 2114;
      v60 = v14;
      if (v49)
        v51 = "exists";
      v61 = 2080;
      v62 = v51;
      v63 = 2114;
      v64 = v22;
      _os_log_impl(&dword_20BB5D000, v42, OS_LOG_TYPE_ERROR, "Source %s: %{public}@, Destination %s: %{public}@", buf, 0x2Au);
    }
    goto LABEL_49;
  }
LABEL_19:

}

- (id)artworkPathForDataclass:(id)a3 artworkIdentifier:(id)a4
{
  NSString *basePath;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  basePath = self->_basePath;
  v6 = a4;
  -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Artwork"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)geniusPathForDataclass:(id)a3 geniusIdentifier:(id)a4
{
  NSString *basePath;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  basePath = self->_basePath;
  v6 = a4;
  -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Genius"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)lyricsPathForDataclass:(id)a3 lyricsIdentifier:(id)a4
{
  NSString *basePath;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  basePath = self->_basePath;
  v6 = a4;
  -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Lyrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pathForDataclass:(id)a3
{
  return -[NSString stringByAppendingPathComponent:](self->_basePath, "stringByAppendingPathComponent:", a3);
}

- (id)pathForAsset:(id)a3 withDataclass:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *basePath;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  basePath = self->_basePath;
  objc_msgSend(v5, "dataclass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)evacuate
{
  NSFileManager *fm;
  NSString *basePath;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[NSFileManager fileExistsAtPath:](self->_fm, "fileExistsAtPath:", self->_basePath))
  {
    fm = self->_fm;
    basePath = self->_basePath;
    v8 = 0;
    v5 = -[NSFileManager removeItemAtPath:error:](fm, "removeItemAtPath:error:", basePath, &v8);
    v6 = v8;
    if (!v5)
    {
      v7 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v6;
        _os_log_impl(&dword_20BB5D000, v7, OS_LOG_TYPE_ERROR, "failed to evacuate airlock. err=%{public}@", buf, 0xCu);
      }

    }
  }
  else
  {
    v6 = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_fm, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1708);
  return (id)sharedInstance___sharedAirlock;
}

void __27__ATAirlock_sharedInstance__block_invoke()
{
  ATAirlock *v0;
  void *v1;

  v0 = objc_alloc_init(ATAirlock);
  v1 = (void *)sharedInstance___sharedAirlock;
  sharedInstance___sharedAirlock = (uint64_t)v0;

}

@end
