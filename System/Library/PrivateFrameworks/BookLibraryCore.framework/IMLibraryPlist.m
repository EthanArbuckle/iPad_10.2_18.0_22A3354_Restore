@implementation IMLibraryPlist

+ (id)stashedSampleRepositoryPath
{
  void *v2;
  void *v3;

  +[IMLibraryPlist purchasesRepositoryPath](IMLibraryPlist, "purchasesRepositoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Samples"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (IMLibraryPlist)libraryPlistWithKind:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t v11[16];

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDBCF48], "bu_booksRepositoryURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = CFSTR("Books.plist");
      break;
    case 1:
      +[IMLibraryPlist purchasesRepositoryPath](IMLibraryPlist, "purchasesRepositoryPath");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      +[IMLibraryPlist managedRepositoryPath](IMLibraryPlist, "managedRepositoryPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("Managed.plist");
      break;
    case 3:
      if (!+[BLLibraryUtility _isMultiUser](BLLibraryUtility, "_isMultiUser"))
        goto LABEL_13;
      +[IMLibraryPlist sharedRepositoryPath](IMLibraryPlist, "sharedRepositoryPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("Shared.plist");
      break;
    case 4:
      +[IMLibraryPlist sampleRepositoryPath](IMLibraryPlist, "sampleRepositoryPath");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v5 = (void *)v7;
      v6 = CFSTR("Purchases.plist");
      break;
    case 5:
      +[IMLibraryPlist stashedSampleRepositoryPath](IMLibraryPlist, "stashedSampleRepositoryPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("Samples.plist");
      break;
    default:
      BLDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "Invalid plist.", v11, 2u);
      }

LABEL_13:
      v6 = 0;
      v5 = 0;
      break;
  }
  if (-[__CFString length](v6, "length"))
  {
    v9 = -[IMLibraryPlist _initWithDirectory:fileName:]([IMLibraryPlist alloc], "_initWithDirectory:fileName:", v5, v6);
    objc_msgSend(v9, "setKind:", a3);
  }
  else
  {
    v9 = 0;
  }

  return (IMLibraryPlist *)v9;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (id)_initWithDirectory:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  IMLibraryPlist *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[IMLibraryPlist init](self, "init");
  if (v8)
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMLibraryPlist setPath:](v8, "setPath:", v9);

    -[IMLibraryPlist setDirectory:](v8, "setDirectory:", v6);
  }

  return v8;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)calculateChecksum
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (qword_253DB1F68 != -1)
    dispatch_once(&qword_253DB1F68, &unk_24CE8B3A8);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLibraryPlist path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD0C98]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)qword_253DB1F60, "stringFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)path
{
  return self->_path;
}

+ (id)purchasesRepositoryPath
{
  if (qword_253DB20D8 != -1)
    dispatch_once(&qword_253DB20D8, &unk_24CE8B410);
  return (id)qword_253DB20D0;
}

- (NSString)directory
{
  return self->_directory;
}

+ (id)sampleRepositoryPath
{
  return +[IMLibraryPlist purchasesRepositoryPath](IMLibraryPlist, "purchasesRepositoryPath");
}

+ (id)managedRepositoryPath
{
  if (qword_253DB20C8 != -1)
    dispatch_once(&qword_253DB20C8, &unk_24CE8B430);
  return (id)qword_253DB20C0;
}

- (NSString)sidecarPath
{
  void *v2;
  void *v3;

  -[IMLibraryPlist directory](self, "directory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Deletes.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)p_rewriteSidecarWithDeletes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IMLibraryPlist unfilteredSidecarContents](self, "unfilteredSidecarContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = (id)objc_msgSend(v5, "mutableCopyWithZone:", 0);
  else
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = v7;

  +[IMLibraryPlist setDeletesArray:toPlistEntry:](IMLibraryPlist, "setDeletesArray:toPlistEntry:", v4, v9);
  -[IMLibraryPlist sidecarPath](self, "sidecarPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeToFile:atomically:", v8, 1);

}

- (id)p_contents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v3);
    if (!v5
      || (objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, 0),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v7 = (id)objc_msgSend(v6, "attributesOfItemAtPath:error:", v3, &v12);
      v8 = v12;

      if (objc_msgSend(v8, "code") == 257
        && (objc_msgSend(v8, "domain"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = (void *)*MEMORY[0x24BDD0B88],
            v9,
            v9 == v10))
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NSFileReadNoPermissionError"), CFSTR("Permission denied: %@"), v3);
      }
      else if (objc_msgSend(v8, "code") == 260)
      {
        objc_msgSend(v8, "domain");

      }
      v4 = 0;
    }

  }
  return v4;
}

- (id)unfilteredContents
{
  void *v3;
  void *v4;

  -[IMLibraryPlist path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLibraryPlist p_contents:](self, "p_contents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)unfilteredSidecarContents
{
  void *v3;
  void *v4;

  -[IMLibraryPlist sidecarPath](self, "sidecarPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLibraryPlist p_contents:](self, "p_contents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contents
{
  IMLibraryPlist *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  int v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  id v32;
  IMLibraryPlist *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  unint64_t v41;
  id obj;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  _BYTE v49[10];
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v2 = self;
  v55 = *MEMORY[0x24BDAC8D0];
  -[IMLibraryPlist unfilteredContents](self, "unfilteredContents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLibraryPlist unfilteredSidecarContents](v2, "unfilteredSidecarContents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist deletesArrayFromPlistEntry:](IMLibraryPlist, "deletesArrayFromPlistEntry:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v34 = v2;
    v35 = v6;
    v37 = v4;
    objc_msgSend(v6, "sortedArrayUsingFunction:context:", sub_212C8BFE4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v5;
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v3;
    v39 = (id)objc_msgSend(v3, "mutableCopyWithZone:", 0);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v41 = 0;
      v14 = *(_QWORD *)v45;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v45 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v15);
          +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
            v18 = v10 == 0;
          else
            v18 = 1;
          if (v18)
          {
LABEL_20:
            objc_msgSend(v43, "addObject:", v16);
          }
          else
          {
            while (1)
            {
              v19 = objc_msgSend(v10, "compare:", v17);
              if (v19 != -1)
                break;
              if (++v13 >= v9)
              {

                v10 = 0;
                goto LABEL_20;
              }
              objc_msgSend(v8, "objectAtIndex:", v13);
              v20 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v20;
            }
            if (v19 == 1)
              goto LABEL_20;
            if (!v19)
            {
              objc_msgSend(v40, "addObject:", v17);
              ++v41;
              if (v13 >= v9)
              {

                v10 = 0;
              }
              else
              {
                objc_msgSend(v8, "objectAtIndex:", v13);
                v21 = objc_claimAutoreleasedReturnValue();

                v10 = (void *)v21;
              }
            }
          }

          ++v15;
        }
        while (v15 != v12);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        v12 = v22;
      }
      while (v22);
    }
    else
    {
      v41 = 0;
    }
    v25 = obj;

    BLDefaultLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v6 = v35;
    v5 = v36;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = objc_msgSend(v35, "count");
      v28 = objc_msgSend(v36, "count");
      v29 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v49 = v27;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v28;
      v50 = 1024;
      v51 = v29;
      v52 = 1024;
      v25 = obj;
      v53 = v41;
      _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_DEBUG, "IMLibraryPlist: Unfiltered: %d; Filter: %d; Filtered: %d; Filter Hit: %d",
        buf,
        0x1Au);
    }

    v3 = v38;
    if (v41)
    {
      if (objc_msgSend(v8, "count") > v41)
        -[IMLibraryPlist p_rewriteSidecarWithDeletes:](v34, "p_rewriteSidecarWithDeletes:", v40);
      +[IMLibraryPlist setBooksArray:toPlistEntry:](IMLibraryPlist, "setBooksArray:toPlistEntry:", v43, v39);

      v4 = v37;
LABEL_44:

      goto LABEL_45;
    }
    +[IMLibraryPlist setBooksArray:toPlistEntry:](IMLibraryPlist, "setBooksArray:toPlistEntry:", v43, v39);

    v4 = v37;
    v2 = v34;
LABEL_41:
    BLDefaultLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      -[IMLibraryPlist sidecarPath](v2, "sidecarPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v49 = v31;
      _os_log_impl(&dword_212C78000, v30, OS_LOG_TYPE_DEBUG, "IMLibraryPlist: Removing sidecar; %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMLibraryPlist sidecarPath](v2, "sidecarPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeItemAtPath:error:", v8, 0);
    goto LABEL_44;
  }
  if (objc_msgSend(v5, "count"))
    v23 = objc_msgSend(v6, "count") == 0;
  else
    v23 = 0;
  v39 = v3;
  BLDefaultLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v49 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_212C78000, v24, OS_LOG_TYPE_DEBUG, "IMLibraryPlist: Nothing to filter; Book Count: %d", buf, 8u);
  }

  if (v23)
    goto LABEL_41;
LABEL_45:
  v32 = v39;

  return v32;
}

- (BOOL)isPathInDirectory:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLibraryPlist directory](self, "directory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (void)addDeletedFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[IMLibraryPlist unfilteredSidecarContents](self, "unfilteredSidecarContents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = (id)objc_msgSend(v5, "mutableCopyWithZone:", 0);
    else
      v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = v7;

    +[IMLibraryPlist deletesArrayFromPlistEntry:](IMLibraryPlist, "deletesArrayFromPlistEntry:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = (id)objc_msgSend(v9, "mutableCopyWithZone:", 0);
    else
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = v11;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v15);
    }

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v12);
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMLibraryPlist setDeletesArray:toPlistEntry:](IMLibraryPlist, "setDeletesArray:toPlistEntry:", v19, v8);

    BLDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 67109120;
      v28 = v21;
      _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_DEBUG, "addDeletedPaths -- rewritePlist %d entries", buf, 8u);
    }

    -[IMLibraryPlist sidecarPath](self, "sidecarPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeToFile:atomically:", v22, 1);

    -[IMLibraryPlist bumpModificationDate](self, "bumpModificationDate");
  }

}

- (void)removeDeletedPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  IMLibraryPlist *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[IMLibraryPlist unfilteredSidecarContents](self, "unfilteredSidecarContents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      +[IMLibraryPlist deletesArrayFromPlistEntry:](IMLibraryPlist, "deletesArrayFromPlistEntry:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = (void *)objc_msgSend(v8, "mutableCopyWithZone:", 0);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v11 = v4;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v12)
        {
          v13 = v12;
          v24 = v9;
          v25 = v7;
          v23 = self;
          v26 = v4;
          v14 = 0;
          v15 = *(_QWORD *)v29;
          v16 = MEMORY[0x24BDAC760];
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v29 != v15)
                objc_enumerationMutation(v11);
              v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              v27[0] = v16;
              v27[1] = 3221225472;
              v27[2] = sub_212C8C5BC;
              v27[3] = &unk_24CE8B3D0;
              v27[4] = v18;
              objc_msgSend(v10, "indexesOfObjectsPassingTest:", v27, v23);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "count"))
              {
                objc_msgSend(v10, "removeObjectsAtIndexes:", v19);
                v14 = 1;
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          }
          while (v13);

          v4 = v26;
          v9 = v24;
          v7 = v25;
          if ((v14 & 1) != 0)
          {
            BLDefaultLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              v21 = objc_msgSend(v10, "count");
              *(_DWORD *)buf = 67109120;
              v33 = v21;
              _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_DEBUG, "removeDeletedPaths -- rewritePlist %d entries", buf, 8u);
            }

            +[IMLibraryPlist setDeletesArray:toPlistEntry:](IMLibraryPlist, "setDeletesArray:toPlistEntry:", v10, v25);
            -[IMLibraryPlist sidecarPath](v23, "sidecarPath");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "writeToFile:atomically:", v22, 1);

            -[IMLibraryPlist bumpModificationDate](v23, "bumpModificationDate");
          }
        }
        else
        {

        }
      }

    }
  }

}

+ (id)entryForAssetID:(id)a3 contents:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", a4);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_opt_class();
        BUDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v11, v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "isEqualToString:", v5) & 1) != 0)
          goto LABEL_17;
        +[IMLibraryPlist bookEpubIdFromPlistEntry:](IMLibraryPlist, "bookEpubIdFromPlistEntry:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && (objc_msgSend(v14, "isEqualToString:", v5) & 1) != 0)
        {
          v13 = v14;
LABEL_17:
          v15 = v11;

          goto LABEL_18;
        }
        +[IMLibraryPlist uniqueIdFromPlistEntry:](IMLibraryPlist, "uniqueIdFromPlistEntry:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && objc_msgSend(v13, "isEqualToString:", v5))
          goto LABEL_17;

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_18:

  return v15;
}

+ (id)entryForAssetURL:(id)a3 contents:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", a4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_opt_class();
        BUDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v11, v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (v14)
          {

            goto LABEL_12;
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

+ (id)isManagedBookFromURL:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "managedRepositoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hasPrefix:", v5);

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)bumpModificationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v17 = *MEMORY[0x24BDD0C98];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLibraryPlist path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v4, v6, &v12);
  v8 = v12;

  if ((v7 & 1) == 0)
  {
    BLDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[IMLibraryPlist path](self, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "Error changing modification date of %@ --  %@", buf, 0x16u);

    }
  }

  return v7;
}

+ (id)lookupAssetURLStringFromAssetID:(id)a3 contents:(id)a4
{
  return (id)MEMORY[0x24BEDD108](a1, sel_lookupFolderNameFromAssetID_contents_);
}

+ (id)lookupPublicationVersionFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist publicationVersionFromPlistEntry:](IMLibraryPlist, "publicationVersionFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)lookupPublicationVersionNumberFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist publicationVersionNumberFromPlistEntry:](IMLibraryPlist, "publicationVersionNumberFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)lookupHumanReadablePublicationVersionFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist humanReadablePublicationVersionFromPlistEntry:](IMLibraryPlist, "humanReadablePublicationVersionFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)lookupPageProgressionFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist pageProgressionFromPlistEntry:](IMLibraryPlist, "pageProgressionFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)lookupLanguageFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist languageFromPlistEntry:](IMLibraryPlist, "languageFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)lookupCoverWritingModeFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist coverWritingModeFromPlistEntry:](IMLibraryPlist, "coverWritingModeFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)lookupScrollDirectionFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist scrollDirectionFromPlistEntry:](IMLibraryPlist, "scrollDirectionFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)lookupFolderNameFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)lookupBackupFolderNameFromAssetID:(id)a3 contents:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForAssetID:contents:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[IMLibraryPlist backupFolderNameFromPlistEntry:](IMLibraryPlist, "backupFolderNameFromPlistEntry:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)authorFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForAuthor](IMLibraryPlist, "keyNameForAuthor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortAuthorFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForSortAuthor](IMLibraryPlist, "keyNameForSortAuthor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)titleFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForTitle](IMLibraryPlist, "keyNameForTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortTitleFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForSortTitle](IMLibraryPlist, "keyNameForSortTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)genreFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForGenre](IMLibraryPlist, "keyNameForGenre");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)isExplicitContentFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForExplicitContent](IMLibraryPlist, "keyNameForExplicitContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)isProofedAssetFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForProofedAsset](IMLibraryPlist, "keyNameForProofedAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)isEphemeralFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForIsEphemeral](IMLibraryPlist, "keyNameForIsEphemeral");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deletesArrayFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForDeletesArray](IMLibraryPlist, "keyNameForDeletesArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)setDeletesArray:(id)a3 toPlistEntry:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  +[IMLibraryPlist keyNameForDeletesArray](IMLibraryPlist, "keyNameForDeletesArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, v6);

}

+ (id)booksArrayFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForBooksArray](IMLibraryPlist, "keyNameForBooksArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)setBooksArray:(id)a3 toPlistEntry:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  +[IMLibraryPlist keyNameForBooksArray](IMLibraryPlist, "keyNameForBooksArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, v6);

}

+ (BOOL)isPDFFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[IMLibraryPlist backupFolderNameFromPlistEntry:](IMLibraryPlist, "backupFolderNameFromPlistEntry:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v10 = 0;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "pathExtension");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", CFSTR("pdf"));
    if ((v8 & 1) != 0)
      v10 = 1;
  }

  return v10;
}

+ (id)temporaryItemIdentifierFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v9;

  v3 = a3;
  +[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifierFromPermlink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = +[IMLibraryPlist isSupplementalContentFromPlistEntry:](IMLibraryPlist, "isSupplementalContentFromPlistEntry:", v3);
    v7 = +[IMLibraryPlist isPDFFromPlistEntry:](IMLibraryPlist, "isPDFFromPlistEntry:", v3);
    if (!v6 || !v7)
      goto LABEL_10;
    +[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {

LABEL_10:
      objc_opt_class();
      objc_msgSend(v3, "objectForKey:", CFSTR("Persistent ID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      BUDynamicCast();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (!v5)
      goto LABEL_10;
  }
LABEL_11:

  return v5;
}

+ (id)persistentIDFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("Persistent ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bookEpubIdFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForPublisherUniqueID](IMLibraryPlist, "keyNameForPublisherUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)albumFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("Album"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)isItunesUFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("Is iTunes U"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)feedURLFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("Feed URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mimeTypeFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("MIME Type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)extensionFromPlistEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("Extension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(a1, "folderNameFromPlistEntry:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "pathExtension");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    if (!objc_msgSend(v6, "length"))
    {

      v6 = 0;
    }
  }

  return v6;
}

+ (id)publicationVersionFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  +[IMLibraryPlist keyNameForPublicationVersion](IMLibraryPlist, "keyNameForPublicationVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_7:

  return v7;
}

+ (id)publicationVersionNumberFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[IMLibraryPlist keyNameForPublicationVersion](IMLibraryPlist, "keyNameForPublicationVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
LABEL_7:

  return v8;
}

+ (id)humanReadablePublicationVersionFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForHumanReadablePublicationVersion](IMLibraryPlist, "keyNameForHumanReadablePublicationVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)pageProgressionFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForPageProgression](IMLibraryPlist, "keyNameForPageProgression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)assetTypeFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForAssetType](IMLibraryPlist, "keyNameForAssetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)languageFromPlistEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "languagesFromPlistEntry:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_opt_class();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      if (v7)
        goto LABEL_12;
    }
    else
    {

    }
  }
  objc_msgSend(a1, "primaryLanguageFromPlistEntry:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (qword_254B61C20 != -1)
      dispatch_once(&qword_254B61C20, &unk_24CE8B3F0);
    objc_msgSend((id)qword_254B61C28, "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

LABEL_12:
  return v7;
}

+ (id)assetIDFromPlistEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assetIDFromPlistEntry:forAssetAtPath:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)assetIDFromPlistEntry:(id)a3 forAssetAtPath:(id)a4
{
  id v5;
  id v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  v7 = +[IMLibraryPlist isSupplementalContentFromPlistEntry:](IMLibraryPlist, "isSupplementalContentFromPlistEntry:", v5);
  v8 = +[IMLibraryPlist isPDFFromPlistEntry:](IMLibraryPlist, "isPDFFromPlistEntry:", v5);
  if (v7 && v8)
  {
    v9 = 0;
  }
  else
  {
    +[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v9, "length"))
  {
    +[BLLibraryUtility dcIdentifierFromBookPath:](BLLibraryUtility, "dcIdentifierFromBookPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      +[IMLibraryPlist uniqueIdFromPlistEntry:](IMLibraryPlist, "uniqueIdFromPlistEntry:", v5);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    if (!objc_msgSend(v13, "length"))
    {
      +[BLLibraryUtility generateFileUniqueIdFromPath:](BLLibraryUtility, "generateFileUniqueIdFromPath:", v6);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }

    v9 = v13;
  }

  return v9;
}

+ (id)coverWritingModeFromPlistEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "keyNameForCoverWritingMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)scrollDirectionFromPlistEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "keyNameForScrollDirection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)languagesFromPlistEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "keyNameForLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)primaryLanguageFromPlistEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "keyNameForPrimaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)uniqueIdFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForUniqueId](IMLibraryPlist, "keyNameForUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_opt_class();
    objc_msgSend(v3, "objectForKey:", CFSTR("iBooks-UniqueId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_opt_class();
      objc_msgSend(v3, "objectForKey:", CFSTR("PersistentID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      BUDynamicCast();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if ((unint64_t)objc_msgSend(v6, "length") <= 1)
  {

    v6 = 0;
  }

  return v6;
}

+ (id)accessDateFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForAccessDate](IMLibraryPlist, "keyNameForAccessDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)setAccessDate:(id)a3 toPlistEntry:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[IMLibraryPlist keyNameForAccessDate](IMLibraryPlist, "keyNameForAccessDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

}

+ (id)folderNameFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForPath](IMLibraryPlist, "keyNameForPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)backupFolderNameFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForBackupPath](IMLibraryPlist, "keyNameForBackupPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)isSampleFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForSampleAsset](IMLibraryPlist, "keyNameForSampleAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)coverPathFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("Cover Path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_opt_class();
    objc_msgSend(v3, "valueForKeyPath:", CFSTR("book-info.cover-image-path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)collectionIdFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[IMLibraryPlist keyNameForCollectionId](IMLibraryPlist, "keyNameForCollectionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "scanHexLongLong:", &v12);

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12);
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject stringValue](v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BLDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v14 = v4;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "Failed to convert key '%{public}@' hex->decimal: [%@]", buf, 0x16u);
      }
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)storePlaylistIdFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  +[IMLibraryPlist keyNameForStorePlaylistId](IMLibraryPlist, "keyNameForStorePlaylistId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "stringValue");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = 0;
        goto LABEL_8;
      }
      v6 = v5;
    }
  }
  else
  {
    +[IMLibraryPlist collectionIdFromPlistEntry:](IMLibraryPlist, "collectionIdFromPlistEntry:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_8:

  return v7;
}

+ (BOOL)isSupplementalContentFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForIsSupplementalContent](IMLibraryPlist, "keyNameForIsSupplementalContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    +[IMLibraryPlist collectionIdFromPlistEntry:](IMLibraryPlist, "collectionIdFromPlistEntry:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[IMLibraryPlist isPDFFromPlistEntry:](IMLibraryPlist, "isPDFFromPlistEntry:", v3);
    if (!objc_msgSend(v8, "length"))
      v7 = 0;

  }
  return v7;
}

+ (id)storeIdFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForStoreId2](IMLibraryPlist, "keyNameForStoreId2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[IMLibraryPlist keyNameForStoreId](IMLibraryPlist, "keyNameForStoreId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "stringValue");
        v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v10 = v12;
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v6;
        v6 = v12;
        goto LABEL_13;
      }
    }
    v10 = 0;
    goto LABEL_15;
  }
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "scanHexLongLong:", &v14);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringValue](v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BLDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "Failed to hex->decimal: [%@]", buf, 0xCu);
    }
    v10 = 0;
  }

LABEL_15:
  if ((unint64_t)objc_msgSend(v10, "length") <= 1)
  {

    v10 = 0;
  }

  return v10;
}

+ (id)permlinkFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("iTunesU Permlink"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)importDateFromPlistEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  +[IMLibraryPlist keyNameForImportDate](IMLibraryPlist, "keyNameForImportDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)assetIDFromItunesMetadataEntry:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[IMLibraryPlist publisherUniqueIDFromItunesMetadataEntry:](IMLibraryPlist, "publisherUniqueIDFromItunesMetadataEntry:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[IMLibraryPlist uniqueIDFromItunesMetadataEntry:](IMLibraryPlist, "uniqueIDFromItunesMetadataEntry:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[IMLibraryPlist packageFileHashFromItunesMetadataEntry:](IMLibraryPlist, "packageFileHashFromItunesMetadataEntry:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

+ (id)publisherUniqueIDFromItunesMetadataEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("book-info.publisher-unique-id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)uniqueIDFromItunesMetadataEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("book-info.unique-id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)packageFileHashFromItunesMetadataEntry:(id)a3
{
  return (id)objc_msgSend(a3, "valueForKeyPath:", CFSTR("book-info.package-file-hash"));
}

+ (id)coverPathFromItunesMetadataEntry:(id)a3
{
  return (id)objc_msgSend(a3, "valueForKeyPath:", CFSTR("book-info.cover-image-path"));
}

+ (id)coverHashFromItunesMetadataEntry:(id)a3
{
  return (id)objc_msgSend(a3, "valueForKeyPath:", CFSTR("book-info.cover-image-hash"));
}

+ (id)titleFromItunesMetadataEntry:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("itemName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "valueForKeyPath:", CFSTR("playlistName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)endOfBookExperiencesFromItunesMetadataEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("experiences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)experienceKindFromExperienceEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("kind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)experienceLocationFromExperienceEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("loc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)experienceLocationTypeFromExperienceEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("locType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)experienceVersionFromExperienceEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)experienceParamsFromExperienceEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("params"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)experienceConfidenceFromExperienceParamEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("confidence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)keyNameForImportDate
{
  return CFSTR("importDate");
}

+ (id)keyNameForAuthor
{
  return CFSTR("Artist");
}

+ (id)keyNameForTitle
{
  return CFSTR("Name");
}

+ (id)keyNameForGenre
{
  return CFSTR("Genre");
}

+ (id)keyNameForExplicitContent
{
  return CFSTR("isExplicit");
}

+ (id)keyNameForComments
{
  return CFSTR("comments");
}

+ (id)keyNameForBookDescription
{
  return CFSTR("bookDescription");
}

+ (id)keyNameForYear
{
  return CFSTR("year");
}

+ (id)keyNameForLastOpened
{
  return CFSTR("BKLastOpenedDate");
}

+ (id)keyNameForFirstOpened
{
  return CFSTR("BKFirstOpenedDate");
}

+ (id)keyNameForRating
{
  return CFSTR("rating");
}

+ (id)keyNameForReadingLocation
{
  return CFSTR("currentReadingLocation");
}

+ (id)keyNameForHighWaterMark
{
  return CFSTR("highWaterMark");
}

+ (id)keyNameForGeneration
{
  return CFSTR("generation");
}

+ (id)keyNameForSampleAsset
{
  return CFSTR("isSample");
}

+ (id)keyNameForPublisherUniqueID
{
  return CFSTR("Publisher Unique ID");
}

+ (id)keyNameForProofedAsset
{
  return CFSTR("isProof");
}

+ (id)keyNameForPath
{
  return CFSTR("Path");
}

+ (id)keyNameForAccessDate
{
  return CFSTR("BLLastUserAccessDate");
}

+ (id)keyNameForBackupPath
{
  return CFSTR("Backup-Path");
}

+ (id)keyNameForStoreId
{
  return CFSTR("s");
}

+ (id)keyNameForStoreId2
{
  return CFSTR("Item ID");
}

+ (id)keyNameForUniqueId
{
  return CFSTR("Package Hash");
}

+ (id)keyNameForAssetType
{
  return CFSTR("AssetType");
}

+ (id)keyNameForFlavor
{
  return CFSTR("Flavor");
}

+ (id)keyNameForSubject
{
  return CFSTR("Subject");
}

+ (id)keyNameForBooksArray
{
  return CFSTR("Books");
}

+ (id)keyNameForDeletesArray
{
  return CFSTR("Deletes");
}

+ (id)keyNameForSortAuthor
{
  return CFSTR("Sort Artist");
}

+ (id)keyNameForSortTitle
{
  return CFSTR("Sort Name");
}

+ (id)keyNameForPublicationVersion
{
  return CFSTR("Publication Version");
}

+ (id)keyNameForHumanReadablePublicationVersion
{
  return CFSTR("Human Readable Publication Version");
}

+ (id)keyNameForPageProgression
{
  return CFSTR("Page Progression Direction");
}

+ (id)keyNameForLanguages
{
  return CFSTR("languages");
}

+ (id)keyNameForPrimaryLanguage
{
  return CFSTR("primaryLanguage");
}

+ (id)keyNameForScrollDirection
{
  return CFSTR("scroll-axis");
}

+ (id)keyNameForCoverWritingMode
{
  return CFSTR("cover-writing-mode");
}

+ (id)keyNameForIsEphemeral
{
  return CFSTR("Ephemeral");
}

+ (id)keyNameForIsSupplementalContent
{
  return CFSTR("isSupplementalContent");
}

+ (id)keyNameForStorePlaylistId
{
  return CFSTR("PlaylistID");
}

+ (id)keyNameForCollectionId
{
  return CFSTR("Collection ID");
}

+ (id)booksRepositoryPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "bu_booksRepositoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedContainerURL
{
  if (qword_253DB2068 != -1)
    dispatch_once(&qword_253DB2068, &unk_24CE8B450);
  return (id)qword_253DB2060;
}

+ (id)sharedRepositoryPath
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212C8F600;
  block[3] = &unk_24CE8A448;
  block[4] = a1;
  if (qword_254B61C38 != -1)
    dispatch_once(&qword_254B61C38, block);
  return (id)qword_254B61C30;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
