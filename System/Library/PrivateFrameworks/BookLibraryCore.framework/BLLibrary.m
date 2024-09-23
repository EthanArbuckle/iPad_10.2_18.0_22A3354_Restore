@implementation BLLibrary

+ (void)initialize
{
  if (qword_253DB20B8 != -1)
    dispatch_once(&qword_253DB20B8, &unk_24CE8A428);
}

+ (id)defaultBookLibrary
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212C7E5F4;
  block[3] = &unk_24CE8A448;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_253DB20A8, block);
  return (id)qword_253DB20A0;
}

- (id)_initWithBooksPlist:(id)a3 purchasedPlist:(id)a4 managedPlist:(id)a5 sharedPlist:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BLLibrary *v15;
  BLLibrary *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *dispatchQueue;
  void *v19;
  void *v20;
  objc_super v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BLLibrary;
  v15 = -[BLLibrary init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_purchasedPlist, a4);
    objc_storeStrong((id *)&v16->_booksPlist, a3);
    objc_storeStrong((id *)&v16->_managedPlist, a5);
    objc_storeStrong((id *)&v16->_sharedPlist, a6);
    v17 = dispatch_queue_create("com.apple.BookLibrary.BLLibrary", 0);
    dispatchQueue = v16->_dispatchQueue;
    v16->_dispatchQueue = (OS_dispatch_queue *)v17;

    v23 = CFSTR("BLLibraryAllowsDownloadsViaBookAssetDaemonForITunesUBooks");
    v24[0] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerDefaults:", v19);

  }
  return v16;
}

- (id)_init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[IMLibraryPlist libraryPlistWithKind:](IMLibraryPlist, "libraryPlistWithKind:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist libraryPlistWithKind:](IMLibraryPlist, "libraryPlistWithKind:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist libraryPlistWithKind:](IMLibraryPlist, "libraryPlistWithKind:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist libraryPlistWithKind:](IMLibraryPlist, "libraryPlistWithKind:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BLLibrary _initWithBooksPlist:purchasedPlist:managedPlist:sharedPlist:](self, "_initWithBooksPlist:purchasedPlist:managedPlist:sharedPlist:", v4, v3, v5, v6);

  return v7;
}

- (id)_bookItemsFromPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BLLibrary sharedPlist](self, "sharedPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLLibrary _bookItemsFromPlist:sharedPlist:](BLLibrary, "_bookItemsFromPlist:sharedPlist:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_bookItemsFromPlist:(id)a3 sharedPlist:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BLBookItem *v20;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = 0x24CE89000uLL;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v29;
    v23 = v6;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(*(id *)(v8 + 3488), "folderNameFromPlistEntry:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "directory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v27, "fileExistsAtPath:", v13);
        if (v6 && (v14 & 1) == 0)
        {
          v15 = v7;
          v16 = v5;
          objc_msgSend(v6, "directory");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingPathComponent:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v27, "fileExistsAtPath:", v18))
          {
            objc_msgSend(v6, "directory");
            v19 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v19;
          }

          v5 = v16;
          v7 = v15;
          v8 = 0x24CE89000;
          v6 = v23;
        }
        v20 = -[BLBookItem initWithEntry:basePath:]([BLBookItem alloc], "initWithEntry:basePath:", v10, v12);
        objc_msgSend(v7, "addObject:", v20);

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v26);
  }

  return v7;
}

- (id)allBookItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLLockFile iTunesSyncLockFile](BLLockFile, "iTunesSyncLockFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "tryLock:", 0))
  {
    -[BLLibrary purchasedPlist](self, "purchasedPlist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLLibrary _bookItemsFromPlist:](self, "_bookItemsFromPlist:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

    -[BLLibrary booksPlist](self, "booksPlist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLLibrary _bookItemsFromPlist:](self, "_bookItemsFromPlist:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

    -[BLLibrary managedPlist](self, "managedPlist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLLibrary _bookItemsFromPlist:](self, "_bookItemsFromPlist:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  else
  {
    BLDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_ERROR, "Failed to obtain the iTunes Sync lock.", v13, 2u);
    }

  }
  return v3;
}

- (void)addITunesUBookToLibraryWithPermlink:(id)a3 title:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  dispatch_semaphore_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  NSObject *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  __int128 *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id obj;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  id v50;
  __int128 v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55[3];

  v55[2] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (v8)
  {
    *(_QWORD *)&v51 = 0;
    *((_QWORD *)&v51 + 1) = &v51;
    v52 = 0x3032000000;
    v53 = sub_212C7F244;
    v54 = sub_212C7F254;
    v55[0] = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = sub_212C7F244;
    v47 = sub_212C7F254;
    obj = 0;
    -[BLLibrary _bookItemFromPermlink:error:](self, "_bookItemFromPermlink:error:", v8, &obj);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v55, obj);
    v48 = v11;
    if (!v44[5])
      goto LABEL_42;
    BLDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_DEFAULT, "Book already exists in local library.", buf, 2u);
    }

    if (!v44[5])
    {
LABEL_42:
      if (-[BLLibrary _isMultiUser](self, "_isMultiUser"))
      {
        -[BLLibrary sharedPlist](self, "sharedPlist");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = sub_212C7F25C;
        v40[3] = &unk_24CE8A470;
        v14 = v8;
        v41 = v14;
        -[BLLibrary _list:testBlock:](self, "_list:testBlock:", v13, v40);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v44[5];
        v44[5] = v15;

        if (v44[5])
        {
          BLDefaultLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_DEFAULT, "Book exists locally in shared container but not in current users library.", buf, 2u);
          }

          v39 = 0;
          v18 = -[BLLibrary _addSharedBookToPurchasesPlistWithPermlink:error:](self, "_addSharedBookToPurchasesPlistWithPermlink:error:", v14, &v39);
          v19 = v39;
          if (!v18)
          {
            BLDefaultLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v19;
              _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_ERROR, "Error adding shared entry to local plist.  %@", buf, 0xCu);
            }

          }
        }

      }
    }
    if (v44[5])
      goto LABEL_30;
    if (-[BLLibrary _isMultiUser](self, "_isMultiUser"))
    {
      BLDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Book does not exist in current users library or the shared library, triggering a download.";
LABEL_28:
        _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
      }
    }
    else
    {
      BLDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Book does not exist in library, triggering a download.";
        goto LABEL_28;
      }
    }

    v25 = dispatch_semaphore_create(0);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_212C7F29C;
    v35[3] = &unk_24CE8A498;
    v37 = &v43;
    v38 = &v51;
    v26 = v25;
    v36 = v26;
    -[BLLibrary _downloadWithPermalink:title:result:](self, "_downloadWithPermalink:title:result:", v8, v9, v35);
    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

LABEL_30:
    +[BLEduCloudContainer sharedEduCloudContainer](BLEduCloudContainer, "sharedEduCloudContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v44[5])
    {
      if (objc_msgSend(v27, "isSignedIn"))
      {
        v29 = v44[5];
        v30 = *((_QWORD *)&v51 + 1);
        v34 = *(id *)(*((_QWORD *)&v51 + 1) + 40);
        v31 = objc_msgSend(v28, "addBookItem:error:", v29, &v34);
        objc_storeStrong((id *)(v30 + 40), v34);
        if ((v31 & 1) == 0)
        {
          BLDefaultLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = *(void **)(*((_QWORD *)&v51 + 1) + 40);
            *(_DWORD *)buf = 138412290;
            v50 = v33;
            _os_log_impl(&dword_212C78000, v32, OS_LOG_TYPE_ERROR, "Failed to add to the cloud. Error:  %@", buf, 0xCu);
          }

        }
      }
    }
    if (v10)
      v10[2](v10, v44[5], *(_QWORD *)(*((_QWORD *)&v51 + 1) + 40));

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v51, 8);

    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BLLibraryErrorDomain"), -1002, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v23);
  }
  else
  {
    BLDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v51) = 138412290;
      *(_QWORD *)((char *)&v51 + 4) = v23;
      _os_log_impl(&dword_212C78000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter.  %@", (uint8_t *)&v51, 0xCu);
    }

  }
LABEL_39:

}

- (id)_lookupBookItemExhaustiveFromPermlink:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BLLibraryErrorDomain"), -1002, 0);
      v8 = 0;
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  -[BLLibrary _bookItemFromPermlink:error:](self, "_bookItemFromPermlink:error:", v6, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  if (!-[BLLibrary _isMultiUser](self, "_isMultiUser"))
    goto LABEL_15;
  -[BLLibrary sharedPlist](self, "sharedPlist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_212C7F558;
  v17[3] = &unk_24CE8A470;
  v11 = v6;
  v18 = v11;
  -[BLLibrary _list:testBlock:](self, "_list:testBlock:", v10, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    BLDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_INFO, "Book exists locally in shared container but not in current users library.", buf, 2u);
    }

    v16 = 0;
    v13 = -[BLLibrary _addSharedBookToPurchasesPlistWithPermlink:error:](self, "_addSharedBookToPurchasesPlistWithPermlink:error:", v11, &v16);
    v9 = v16;
    if (!v13)
    {
      BLDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_ERROR, "Error adding shared entry to local plist.  %@", buf, 0xCu);
      }

      if (a4)
      {
        v9 = objc_retainAutorelease(v9);
        *a4 = v9;
      }
    }
  }
  else
  {
    v9 = 0;
  }

LABEL_17:
  return v8;
}

- (BOOL)_addBookItemToEduContainer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[BLEduCloudContainer sharedEduCloudContainer](BLEduCloudContainer, "sharedEduCloudContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5 || !objc_msgSend(v6, "isSignedIn"))
  {
    v9 = 0;
    goto LABEL_9;
  }
  v13 = 0;
  v8 = objc_msgSend(v7, "addBookItem:error:", v5, &v13);
  v9 = v13;
  if ((v8 & 1) != 0)
  {
LABEL_9:
    v11 = 1;
    goto LABEL_10;
  }
  BLDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_ERROR, "Failed to add to the cloud. Error:  %@", buf, 0xCu);
  }

  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v11 = 0;
    *a4 = v9;
  }
  else
  {
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (BOOL)removeBookFromLibraryWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_212C7F244;
  v21 = sub_212C7F254;
  v22 = 0;
  +[BLLockFile iTunesSyncLockFile](BLLockFile, "iTunesSyncLockFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212C7F838;
  v12[3] = &unk_24CE8A4C0;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v14 = &v23;
  v15 = &v17;
  v16 = a4;
  objc_msgSend(v7, "lockWithBlock:error:", v12, a4);
  if (a4)
  {
    v9 = (void *)v18[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (BOOL)_removeBookFromLibraryWithPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_212C7F244;
  v21 = sub_212C7F254;
  v22 = 0;
  +[BLLockFile iTunesSyncLockFile](BLLockFile, "iTunesSyncLockFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212C7FCC4;
  v12[3] = &unk_24CE8A4C0;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v14 = &v23;
  v15 = &v17;
  v16 = a4;
  objc_msgSend(v7, "lockWithBlock:error:", v12, a4);
  if (a4)
  {
    v9 = (void *)v18[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (id)bookIdentifierFromURL:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLLibraryUtility identifierFromBookPath:error:](BLLibraryUtility, "identifierFromBookPath:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_allPlists
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  -[BLLibrary booksPlist](self, "booksPlist");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = MEMORY[0x24BDBD1A8];
  if (v3)
    v6 = v3;
  else
    v6 = MEMORY[0x24BDBD1A8];
  -[BLLibrary purchasedPlist](self, "purchasedPlist", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = v5;
  v15[1] = v9;
  -[BLLibrary managedPlist](self, "managedPlist");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = v5;
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_list:(id)a3 testBlock:(id)a4
{
  unsigned int (**v6)(id, void *);
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int (**)(id, void *))a4;
  -[BLLibrary _bookItemsFromPlist:](self, "_bookItemsFromPlist:", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (v6[2](v6, v11))
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_findBookItemWithTestBlock:(id)a3 foundWhere:(int64_t *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[BLLibrary _allPlists](self, "_allPlists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = 3;
  v8 = 0;
  while (1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLLibrary _list:testBlock:](self, "_list:testBlock:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      break;
    if (++v8 == 3)
      goto LABEL_9;
  }
  if (a4)
    *a4 = v8;
LABEL_9:

  return v10;
}

- (id)_bookItemFromStoreID:(id)a3 permlink:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = sub_212C80414;
  v18 = &unk_24CE8A4E8;
  v10 = v8;
  v19 = v10;
  v11 = v9;
  v20 = v11;
  -[BLLibrary _findBookItemWithTestBlock:foundWhere:](self, "_findBookItemWithTestBlock:foundWhere:", &v15, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (a5 && !v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4, 0, v15, v16, v17, v18, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_bookItemFromPermlink:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C80554;
  v11[3] = &unk_24CE8A470;
  v7 = v6;
  v12 = v7;
  -[BLLibrary _findBookItemWithTestBlock:foundWhere:](self, "_findBookItemWithTestBlock:foundWhere:", v11, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a4 && !v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)_isMultiUser
{
  return +[BLLibraryUtility _isMultiUser](BLLibraryUtility, "_isMultiUser");
}

- (BOOL)_isShareableBook:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;

  v3 = a3;
  +[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = +[IMLibraryPlist isSupplementalContentFromPlistEntry:](IMLibraryPlist, "isSupplementalContentFromPlistEntry:", v3);
  v8 = +[IMLibraryPlist isPDFFromPlistEntry:](IMLibraryPlist, "isPDFFromPlistEntry:", v3);
  v9 = 0;
  if ((v6 & 1) == 0 && (!v7 || !v8))
  {
    if (objc_msgSend(v4, "length"))
    {
      v9 = 1;
    }
    else
    {
      +[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v10 != 0;

    }
  }

  return v9;
}

- (id)_perUserBookURLForBookURL:(id)a3
{
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
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  BLLibrary *v44;
  void *v45;
  void *v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLLibrary sharedPlist](self, "sharedPlist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByStandardizingPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "isEqualToString:", v10);

  if (!(_DWORD)v8)
    goto LABEL_30;
  objc_msgSend(v6, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLLibrary sharedPlist](self, "sharedPlist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  v44 = self;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v12))
        {
          +[IMLibraryPlist assetIDFromPlistEntry:](IMLibraryPlist, "assetIDFromPlistEntry:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:](IMLibraryPlist, "temporaryItemIdentifierFromPlistEntry:", v20);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v17)
        continue;
      break;
    }
    v46 = 0;
    v22 = 0;
LABEL_12:
    self = v44;
  }
  else
  {
    v46 = 0;
    v22 = 0;
  }

  if (objc_msgSend(v22, "length") || objc_msgSend(v46, "length"))
  {
    v43 = v10;
    -[BLLibrary purchasedPlist](self, "purchasedPlist");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v49;
      v41 = v6;
      v42 = v4;
      while (2)
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v49 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
          +[IMLibraryPlist assetIDFromPlistEntry:](IMLibraryPlist, "assetIDFromPlistEntry:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:](IMLibraryPlist, "temporaryItemIdentifierFromPlistEntry:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "isEqualToString:", v32) & 1) != 0
            || objc_msgSend(v46, "isEqualToString:", v33))
          {
            v40 = (void *)MEMORY[0x24BDBCF48];
            -[BLLibrary purchasedPlist](v44, "purchasedPlist");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringByDeletingLastPathComponent");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v31);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringByAppendingPathComponent:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "fileURLWithPath:", v38);
            v34 = (id)objc_claimAutoreleasedReturnValue();

            v6 = v41;
            v4 = v42;
            goto LABEL_28;
          }

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        v34 = 0;
        v6 = v41;
        v4 = v42;
        if (v28)
          continue;
        break;
      }
    }
    else
    {
      v34 = 0;
    }
LABEL_28:

    v10 = v43;
  }
  else
  {
    v34 = 0;
  }

  if (!v34)
LABEL_30:
    v34 = v4;

  return v34;
}

- (void)_downloadWithPermalink:(id)a3 title:(id)a4 result:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[BLDownloadQueueNonUI sharedInstance](BLDownloadQueueNonUI, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_212C80BB0;
  v14[3] = &unk_24CE8A510;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "addDownloadWithPermlink:title:completion:", v13, v12, v14);

}

- (BOOL)_addSharedBookToPurchasesPlistWithPermlink:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_212C7F244;
  v21 = sub_212C7F254;
  v22 = 0;
  +[BLLockFile iTunesSyncLockFile](BLLockFile, "iTunesSyncLockFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212C80E28;
  v12[3] = &unk_24CE8A4C0;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v14 = &v23;
  v15 = &v17;
  v16 = a4;
  objc_msgSend(v7, "lockWithBlock:error:", v12, a4);
  if (a4)
  {
    v9 = (void *)v18[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (BOOL)_bookItemIsShared:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[BLLibrary sharedPlist](self, "sharedPlist", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLLibrary _bookItemsFromPlist:](self, "_bookItemsFromPlist:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = v4;
        v12 = v10;
        objc_msgSend(v11, "permlink");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13
          && (v14 = (void *)v13,
              objc_msgSend(v12, "permlink"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v14,
              v15))
        {
          objc_msgSend(v11, "permlink");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "permlink");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);
        }
        else
        {
          objc_msgSend(v11, "storeIdentifier");
          v19 = objc_claimAutoreleasedReturnValue();
          if (!v19
            || (v20 = (void *)v19,
                objc_msgSend(v12, "storeIdentifier"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v21,
                v20,
                !v21))
          {

            continue;
          }
          objc_msgSend(v11, "storeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "storeIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);
        }
        v22 = v18;

        if ((v22 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_17;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }
LABEL_17:

  return v7;
}

- (void)_bookWasOpenedWithStoreID:(id)a3 permlink:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BLLibrary *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BLLibrary dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_212C81528;
  v15[3] = &unk_24CE8A538;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

+ (BOOL)_addDate:(id)a3 toPlist:(id)a4 bookItem:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  id *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_212C7F244;
  v30 = sub_212C7F254;
  v31 = 0;
  +[BLLockFile iTunesSyncLockFile](BLLockFile, "iTunesSyncLockFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_212C817E8;
  v19[3] = &unk_24CE8A560;
  v13 = v10;
  v20 = v13;
  v14 = v11;
  v21 = v14;
  v15 = v9;
  v22 = v15;
  v23 = &v32;
  v24 = &v26;
  v25 = a6;
  objc_msgSend(v12, "lockWithBlock:error:", v19, a6);
  if (a6)
  {
    v16 = (void *)v27[5];
    if (v16)
      *a6 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (IMLibraryPlist)booksPlist
{
  return self->_booksPlist;
}

- (void)setBooksPlist:(id)a3
{
  objc_storeStrong((id *)&self->_booksPlist, a3);
}

- (IMLibraryPlist)purchasedPlist
{
  return self->_purchasedPlist;
}

- (void)setPurchasedPlist:(id)a3
{
  objc_storeStrong((id *)&self->_purchasedPlist, a3);
}

- (IMLibraryPlist)managedPlist
{
  return self->_managedPlist;
}

- (void)setManagedPlist:(id)a3
{
  objc_storeStrong((id *)&self->_managedPlist, a3);
}

- (IMLibraryPlist)sharedPlist
{
  return self->_sharedPlist;
}

- (void)setSharedPlist:(id)a3
{
  objc_storeStrong((id *)&self->_sharedPlist, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sharedPlist, 0);
  objc_storeStrong((id *)&self->_managedPlist, 0);
  objc_storeStrong((id *)&self->_purchasedPlist, 0);
  objc_storeStrong((id *)&self->_booksPlist, 0);
}

@end
