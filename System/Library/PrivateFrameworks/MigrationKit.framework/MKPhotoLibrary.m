@implementation MKPhotoLibrary

- (MKPhotoLibrary)init
{
  MKPhotoLibrary *v2;
  MKPhotoLibrary *v3;
  MKFileProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *rootPath;
  void *v10;
  char v11;
  void *v12;
  NSString *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableSet *v22;
  NSMutableSet *importErrors;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)MKPhotoLibrary;
  v2 = -[MKPhotoLibrary init](&v26, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKPhotoLibrary setContentType:](v2, "setContentType:", 0);
    v4 = objc_alloc_init(MKFileProvider);
    -[MKFileProvider fetchRootPath](v4, "fetchRootPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      MKLocalizedString(CFSTR("MOVE_TO_IOS"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPhotoLibrary setRootPath:](v3, "setRootPath:", v7);

      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        rootPath = v3->_rootPath;
        *(_DWORD *)buf = 138412290;
        v28 = rootPath;
        _os_log_impl(&dword_21EC08000, v8, OS_LOG_TYPE_INFO, "file_storage=%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "fileExistsAtPath:", v3->_rootPath);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v3->_rootPath;
        v25 = 0;
        objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 0, 0, &v25);
        v14 = v25;

        if (v14)
        {
          +[MKLog log](MKLog, "log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[MKPhotoLibrary init].cold.1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

        }
      }
    }
    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    importErrors = v3->_importErrors;
    v3->_importErrors = v22;

  }
  return v3;
}

- (MKPhotoLibrary)initWithContentType:(unint64_t)a3
{
  MKPhotoLibrary *v4;
  MKPhotoLibrary *v5;
  BOOL v6;
  uint64_t v7;
  __objc2_class **v8;
  MKAssetDecoder *v9;
  MKAssetDecoder *decoder;
  MKImportAnalytics *v11;
  MKImportAnalytics *analytics;

  v4 = -[MKPhotoLibrary init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[MKPhotoLibrary setContentType:](v4, "setContentType:", a3);
    v6 = a3 == 0;
    if (a3)
      v7 = 10;
    else
      v7 = 9;
    v8 = off_24E358830;
    if (!v6)
      v8 = &off_24E358850;
    v9 = (MKAssetDecoder *)objc_alloc_init(*v8);
    decoder = v5->_decoder;
    v5->_decoder = v9;

    v11 = -[MKImportAnalytics initWithContentType:]([MKImportAnalytics alloc], "initWithContentType:", v7);
    analytics = v5->_analytics;
    v5->_analytics = v11;

  }
  return v5;
}

- (void)sendAnalytics
{
  uint64_t v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_importCount || -[NSMutableSet count](self->_importErrors, "count"))
  {
    v3 = -[NSMutableSet count](self->_importErrors, "count");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_importErrors;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[MKImportAnalytics send:](self->_analytics, "send:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[MKImportAnalytics complete:](self->_analytics, "complete:", v3 == 0);
  }
}

- (void)addAsset:(id)a3 filename:(id)a4 originalFilename:(id)a5 size:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint8_t *v45;
  id v46;
  id location;
  uint8_t buf[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v12 && v13)
  {
    v16 = a6 == 0;
    +[MKLog log](MKLog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MKPhotoLibrary addAsset:filename:originalFilename:size:completion:].cold.2(v18, v26, v27, v28, v29, v30, v31, v32);

      if (v15)
      {
        v33 = (void *)MEMORY[0x24BDD1540];
        v54 = *MEMORY[0x24BDD0FC8];
        v55 = CFSTR("detected an invalid asset because the file size was zero.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("MKPhotoLibraryError"), 1, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, 0, v35);
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21EC08000, v18, OS_LOG_TYPE_INFO, "PHPhotoLibrary will import an asset.", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      v49 = buf;
      v50 = 0x3032000000;
      v51 = __Block_byref_object_copy__2;
      v52 = __Block_byref_object_dispose__2;
      v53 = 0;
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC760];
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __69__MKPhotoLibrary_addAsset_filename_originalFilename_size_completion___block_invoke;
      v43[3] = &unk_24E359980;
      objc_copyWeak(&v46, &location);
      v45 = buf;
      v21 = v12;
      v44 = v21;
      v36[0] = v20;
      v36[1] = 3221225472;
      v36[2] = __69__MKPhotoLibrary_addAsset_filename_originalFilename_size_completion___block_invoke_2;
      v36[3] = &unk_24E3599A8;
      objc_copyWeak(&v42, &location);
      v41 = buf;
      v37 = v21;
      v38 = v13;
      v39 = v14;
      v40 = v15;
      objc_msgSend(v19, "performChanges:completionHandler:", v43, v36);

      objc_destroyWeak(&v42);
      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MKPhotoLibrary addAsset:filename:originalFilename:size:completion:].cold.1((uint64_t)v12, (uint64_t)v13, v22);

    if (v15)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v56 = *MEMORY[0x24BDD0FC8];
      v57[0] = CFSTR("detected an invalid asset because either path or filename is nil.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("MKPhotoLibraryError"), 1, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, 0, v25);
    }
  }

}

void __69__MKPhotoLibrary_addAsset_filename_originalFilename_size_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "addAsset:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__MKPhotoLibrary_addAsset_filename_originalFilename_size_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  +[MKLog log](MKLog, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_21EC08000, v7, OS_LOG_TYPE_INFO, "PHPhotoLibrary did import an asset. success=%d, error=%@", buf, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
  v10 = objc_msgSend(v5, "code");
  if (v10 != 3301)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v16 = v5;
    a2 = objc_msgSend(WeakRetained, "photoLibraryDidComplete:filename:originalFilename:success:error:", v11, v12, v13, a2, &v16);
    v14 = v16;

    v5 = v14;
  }
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, BOOL, _QWORD, id))(v15 + 16))(v15, a2, v10 == 3301, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);

}

- (unint64_t)countForCollection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  unint64_t v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v7 = (void *)MEMORY[0x2207B99F4]();
  objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__MKPhotoLibrary_countForCollection_error___block_invoke;
  v14[3] = &unk_24E3599D0;
  v14[4] = self;
  v9 = v6;
  v15 = v9;
  v16 = &v17;
  objc_msgSend(v8, "performChangesAndWait:error:", v14, a4);

  objc_autoreleasePoolPop(v7);
  +[MKLog log](MKLog, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (a4)
      v11 = *a4;
    else
      v11 = 0;
    *(_DWORD *)buf = 138412290;
    v22 = v11;
    _os_log_impl(&dword_21EC08000, v10, OS_LOG_TYPE_INFO, "PHPhotoLibrary did set collections. error=%@", buf, 0xCu);
  }

  v12 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __43__MKPhotoLibrary_countForCollection_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "assetCollection:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "assetCount:", v2);

}

- (void)setCollection:(id)a3 forLocalIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "count"))
  {
    v8 = (void *)MEMORY[0x2207B99F4]();
    objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __52__MKPhotoLibrary_setCollection_forLocalIdentifiers___block_invoke;
    v13[3] = &unk_24E3599F8;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    v12 = 0;
    objc_msgSend(v9, "performChangesAndWait:error:", v13, &v12);
    v10 = v12;

    objc_autoreleasePoolPop(v8);
    +[MKLog log](MKLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "PHPhotoLibrary did set collections. error=%@", buf, 0xCu);
    }

  }
}

void __52__MKPhotoLibrary_setCollection_forLocalIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "assetCollectionChangeRequest:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 48), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAssets:", v3);

  }
}

- (id)addAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contentType)
    objc_msgSend(MEMORY[0x24BDE3490], "creationRequestForAssetFromVideoAtFileURL:", v4);
  else
    objc_msgSend(MEMORY[0x24BDE3490], "creationRequestForAssetFromImageAtFileURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderForCreatedAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)photoLibraryDidComplete:(id)a3 filename:(id)a4 originalFilename:(id)a5 success:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  MKImportAnalytics *analytics;
  __CFString *v21;
  void *v22;
  MKAssetDecoder *decoder;
  id v24;
  NSString *rootPath;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  __CFString *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a6)
  {
    ++self->_importCount;
    v15 = 1;
    if (!a7)
      goto LABEL_28;
    goto LABEL_26;
  }
  if (!a7)
  {
    v17 = 0;
    v16 = CFSTR("unknown");
    goto LABEL_9;
  }
  objc_msgSend(*a7, "domain");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(*a7, "code");
  if (v17 != 3302)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%ld"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](self->_importErrors, "addObject:", v18);
    goto LABEL_10;
  }
  if (!self->_decoder)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%ld"), v16, 3302);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_importErrors, "addObject:", v18);
  -[MKAssetDecoder extractFormatOfAsset:](self->_decoder, "extractFormatOfAsset:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  analytics = self->_analytics;
  objc_msgSend(v12, "pathExtension");
  v21 = v16;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKImportAnalytics send:extension:](analytics, "send:extension:", v19, v22);

  v16 = v21;
  decoder = self->_decoder;
  self->_decoder = 0;

LABEL_10:
LABEL_11:
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v14, "length"))
  {
    v39 = v16;
    v40 = v13;
    objc_msgSend(v24, "addObject:", v14);
    rootPath = self->_rootPath;
    objc_msgSend(v14, "stringByDeletingLastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](rootPath, "stringByAppendingPathComponent:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v29 = objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, 0, &v45);
    v30 = v45;

    +[MKLog log](MKLog, "log");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v30, "description");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109379;
      v48 = v29;
      v49 = 2113;
      v50 = v32;
      _os_log_impl(&dword_21EC08000, v31, OS_LOG_TYPE_INFO, "did create directory. success=%d, error=%{private}@", buf, 0x12u);

    }
    v16 = v39;
    v13 = v40;
  }
  objc_msgSend(v24, "addObject:", v13);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = v24;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v33);
        if (-[MKPhotoLibrary copy:filename:error:](self, "copy:filename:error:", v12, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), a7))
        {
          v15 = 1;
          goto LABEL_25;
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v35)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_25:

  if (a7)
  {
LABEL_26:
    if (v15)
      *a7 = 0;
  }
LABEL_28:

  return v15;
}

- (BOOL)copy:(id)a3 filename:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSString *rootPath;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  char v29;
  id *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  rootPath = self->_rootPath;
  if (rootPath)
  {
    -[NSString stringByAppendingPathComponent:](rootPath, "stringByAppendingPathComponent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "fileExistsAtPath:", v11))
    {
      v31 = a5;
      v33 = v8;
      objc_msgSend(v9, "stringByDeletingPathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v9;
      objc_msgSend(v9, "pathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %ld"), v13, v15 + 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(".%@"), v14);
          v17 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v17;
        }
        -[NSString stringByAppendingPathComponent:](self->_rootPath, "stringByAppendingPathComponent:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v12, "fileExistsAtPath:", v18);
        if ((v19 & 1) == 0)
          break;
        ++v15;
        v11 = v18;
        if (v15 == 2147483645)
        {

          LOBYTE(v20) = 0;
          v9 = v32;
          v8 = v33;
          goto LABEL_20;
        }
      }

      v9 = v32;
      v8 = v33;
      a5 = v31;
    }
    else
    {
      v18 = v11;
    }
    v20 = objc_msgSend(v12, "moveItemAtPath:toPath:error:", v8, v18, a5);
    +[MKLog log](MKLog, "log");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v35 = v20;
      _os_log_impl(&dword_21EC08000, v28, OS_LOG_TYPE_INFO, "Local File Storage did import an asset. success=%d", buf, 8u);
    }

    v29 = v20 ^ 1;
    if (!a5)
      v29 = 1;
    if ((v29 & 1) == 0)
    {
      *a5 = 0;
      LOBYTE(v20) = 1;
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MKPhotoLibrary copy:filename:error:].cold.1((uint64_t)self, v21, v22, v23, v24, v25, v26, v27);

    LOBYTE(v20) = 0;
  }
LABEL_20:

  return v20;
}

- (id)assetCollectionChangeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MKPhotoLibrary assetCollection:](self, "assetCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(MEMORY[0x24BDE34A0], "changeRequestForAssetCollection:", v5);
  else
    objc_msgSend(MEMORY[0x24BDE34A0], "creationRequestForAssetCollectionWithTitle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)assetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("localizedTitle = %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)assetCount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDE3488];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "fetchAssetsInAssetCollection:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_importErrors, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "error=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)addAsset:(os_log_t)log filename:originalFilename:size:completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "path=%@, filename=%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)addAsset:(uint64_t)a3 filename:(uint64_t)a4 originalFilename:(uint64_t)a5 size:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a1, a3, "size=%ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)copy:(uint64_t)a3 filename:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ can't import a file because it could not find a root path.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
