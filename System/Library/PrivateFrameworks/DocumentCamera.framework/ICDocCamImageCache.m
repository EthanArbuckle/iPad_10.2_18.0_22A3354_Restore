@implementation ICDocCamImageCache

- (ICDocCamImageCache)init
{

  return 0;
}

- (ICDocCamImageCache)initWithDataCryptorDelegate:(id)a3
{
  return -[ICDocCamImageCache initWithDataCryptorDelegate:cachesDirectoryURL:](self, "initWithDataCryptorDelegate:cachesDirectoryURL:", a3, 0);
}

- (ICDocCamImageCache)initWithDataCryptorDelegate:(id)a3 cachesDirectoryURL:(id)a4
{
  id v7;
  id v8;
  ICDocCamImageCache *v9;
  ICDocCamImageCache *v10;
  void *v11;
  uint64_t v12;
  NSURL *docCamImageDirectoryURL;
  DCLRUCache *v14;
  DCLRUCache *inMemoryImageCache;
  NSMutableDictionary *v16;
  NSMutableDictionary *imageSizeCache;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *imageCacheQueue;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)ICDocCamImageCache;
  v9 = -[ICDocCamImageCache init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataCryptorDelegate, a3);
    if (!v8)
    {
      +[DCCachesDirectory sharedCachesDirectory](DCCachesDirectory, "sharedCachesDirectory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cachesDirectoryURL");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)&v10->_cachesDirectoryURL, v8);
    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("Scans"));
    v12 = objc_claimAutoreleasedReturnValue();
    docCamImageDirectoryURL = v10->_docCamImageDirectoryURL;
    v10->_docCamImageDirectoryURL = (NSURL *)v12;

    v14 = -[DCLRUCache initWithMaxSize:]([DCLRUCache alloc], "initWithMaxSize:", 2);
    inMemoryImageCache = v10->_inMemoryImageCache;
    v10->_inMemoryImageCache = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    imageSizeCache = v10->_imageSizeCache;
    v10->_imageSizeCache = v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.documentcamera.DocCamImageCacheQueue", v18);
    imageCacheQueue = v10->_imageCacheQueue;
    v10->_imageCacheQueue = (OS_dispatch_queue *)v19;

    -[ICDocCamImageCache deleteAllImages](v10, "deleteAllImages");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BDF75E0];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v10, sel_applicationWillTerminate_, v22, v23);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x24BDF7538];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v10, sel_didReceiveMemoryWarning_, v25, v26);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICDocCamImageCache;
  -[ICDocCamImageCache dealloc](&v2, sel_dealloc);
}

- (BOOL)makeSureScanDirectoryExists:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[ICDocCamImageCache docCamImageDirectoryURL](self, "docCamImageDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, a3);

  if ((v6 & 1) == 0)
  {
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DCScannedDocument makeSureScanDirectoryExists:].cold.1((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);

  }
  return v6;
}

- (id)setImage:(id)a3 metaData:(id)a4
{
  return -[ICDocCamImageCache setImage:metaData:addToMemoryCache:completion:](self, "setImage:metaData:addToMemoryCache:completion:", a3, a4, 0, 0);
}

- (id)setImage:(id)a3 metaData:(id)a4 addToMemoryCache:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ICDocCamImageCache setImage:metaData:addToMemoryCache:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  v39 = 0;
  v21 = -[ICDocCamImageCache makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v39);
  v22 = v39;
  v23 = 0;
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(v10, "size");
    objc_msgSend(v26, "valueWithCGSize:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageCache imageSizeCache](self, "imageSizeCache");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v25);

    if (v7)
    {
      -[ICDocCamImageCache inMemoryImageCache](self, "inMemoryImageCache");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v10, v25);

    }
    -[ICDocCamImageCache imageCacheQueue](self, "imageCacheQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke;
    v34[3] = &unk_24C5B8910;
    v34[4] = self;
    v31 = v25;
    v35 = v31;
    v36 = v10;
    v37 = v11;
    v38 = v12;
    dispatch_async(v30, v34);

    v32 = v38;
    v23 = v31;

  }
  return v23;
}

void __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "getImageURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataCryptorDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    objc_msgSend(v4, "createNSDataFrom:metaData:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataCryptorDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptData:identifier:", v7, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v10 = objc_msgSend(v9, "writeToURL:options:error:", v2, 1, &v19);
    v11 = v19;

  }
  else
  {
    v18 = 0;
    v10 = objc_msgSend(v4, "writeImage:metaData:toURL:error:", v5, v6, v2, &v18);
    v11 = v18;
  }
  v12 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke_cold_3();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject fileExistsAtPath:](v13, "fileExistsAtPath:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DCScannedDocument copyImageForSaving:toFolderURL:].cold.1();

    }
  }
  else
  {
    v13 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke_cold_2();
    v15 = 0;
  }

  v17 = *(_QWORD *)(a1 + 64);
  if (v17)
    (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, v15);

}

- (BOOL)replaceImage:(id)a3 metaData:(id)a4 uuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  _QWORD v43[2];
  char v44;
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ICDocCamImageCache replaceImage:metaData:uuid:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

  v45 = 0;
  v19 = -[ICDocCamImageCache makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v45);
  v20 = v45;
  if (v19)
  {
    v21 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(v8, "size");
    objc_msgSend(v21, "valueWithCGSize:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageCache imageSizeCache](self, "imageSizeCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v10);

    -[ICDocCamImageCache inMemoryImageCache](self, "inMemoryImageCache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[ICDocCamImageCache inMemoryImageCache](self, "inMemoryImageCache");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v8, v10);

    }
    v42 = 0;
    v43[0] = &v42;
    v43[1] = 0x2020000000;
    v44 = 0;
    -[ICDocCamImageCache imageCacheQueue](self, "imageCacheQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __49__ICDocCamImageCache_replaceImage_metaData_uuid___block_invoke;
    v37[3] = &unk_24C5B8938;
    v37[4] = self;
    v38 = v10;
    v39 = v8;
    v40 = v9;
    v41 = &v42;
    dispatch_sync(v27, v37);

    v28 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[ICDocCamImageCache replaceImage:metaData:uuid:].cold.1((uint64_t)v43, v28, v29, v30, v31, v32, v33, v34);

    v35 = *(_BYTE *)(v43[0] + 24) != 0;
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

void __49__ICDocCamImageCache_replaceImage_metaData_uuid___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  objc_msgSend(*(id *)(a1 + 32), "getImageURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataCryptorDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      objc_msgSend(v7, "createNSDataFrom:metaData:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dataCryptorDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "encryptData:identifier:", v10, *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v12, "writeToURL:atomically:", v2, 1);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v7, "writeImage:metaData:toURL:error:", v8, v9, v2, 0);
    }
  }
  else
  {
    v13 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __49__ICDocCamImageCache_replaceImage_metaData_uuid___block_invoke_cold_1();

  }
}

- (CGSize)getImageSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint8_t v19[16];
  CGSize result;

  v4 = a3;
  -[ICDocCamImageCache imageSizeCache](self, "imageSizeCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "CGSizeValue");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v11 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_20CE8E000, v11, OS_LOG_TYPE_DEFAULT, "Failed to find image size in image size cache. Falling back to asking the image", v19, 2u);
    }

    -[ICDocCamImageCache getImage:](self, "getImage:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    v8 = v13;
    v10 = v14;

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v8, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageCache imageSizeCache](self, "imageSizeCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v4);

  }
  v17 = v8;
  v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)getImageURL:(id)a3
{
  return -[ICDocCamImageCache getImageURL:async:](self, "getImageURL:async:", a3, 1);
}

- (id)getImageURL:(id)a3 async:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  if (a4)
  {
    -[ICDocCamImageCache docCamImageDirectoryURL](self, "docCamImageDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v19[5];
    v19[5] = v8;

  }
  else
  {
    -[ICDocCamImageCache imageCacheQueue](self, "imageCacheQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__ICDocCamImageCache_getImageURL_async___block_invoke;
    block[3] = &unk_24C5B8960;
    v17 = &v18;
    block[4] = self;
    v16 = v6;
    dispatch_sync(v10, block);

  }
  objc_msgSend((id)v19[5], "URLByAppendingPathExtension:", CFSTR("jpg"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v19[5];
  v19[5] = v11;

  v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

void __40__ICDocCamImageCache_getImageURL_async___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "docCamImageDirectoryURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)getImage:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  ICDocCamImageCache *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id v30;

  v4 = a3;
  if (!v4)
  {
    v6 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICDocCamImageCache getImage:].cold.1(v6, v10, v11);
    goto LABEL_7;
  }
  v30 = 0;
  v5 = -[ICDocCamImageCache makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v30);
  v6 = v30;
  if (!v5)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_12;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  -[ICDocCamImageCache inMemoryImageCache](self, "inMemoryImageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v25[5];
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[ICDocCamImageCache imageCacheQueue](self, "imageCacheQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __31__ICDocCamImageCache_getImage___block_invoke;
    v20 = &unk_24C5B8988;
    v21 = self;
    v13 = v4;
    v22 = v13;
    v23 = &v24;
    dispatch_sync(v12, &v17);

    v14 = (void *)v25[5];
    if (v14)
    {
      -[ICDocCamImageCache inMemoryImageCache](self, "inMemoryImageCache", v17, v18, v19, v20, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v25[5], v13);

      v14 = (void *)v25[5];
    }
    v9 = v14;

  }
  _Block_object_dispose(&v24, 8);

LABEL_12:
  return v9;
}

void __31__ICDocCamImageCache_getImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  objc_msgSend(*(id *)(a1 + 32), "getImageURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataCryptorDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v2, 1, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(*(id *)(a1 + 32), "dataCryptorDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "decryptEncryptedData:identifier:", v8, *(_QWORD *)(a1 + 40));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

        }
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v2, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageWithContentsOfFile:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
  }
  else
  {
    v14 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __31__ICDocCamImageCache_getImage___block_invoke_cold_1();

  }
}

- (BOOL)deleteImage:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  id v25;

  v4 = a3;
  v5 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICDocCamImageCache deleteImage:].cold.1();

  v25 = 0;
  v6 = -[ICDocCamImageCache makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v25);
  v7 = v25;
  if (v6)
  {
    -[ICDocCamImageCache imageSizeCache](self, "imageSizeCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v4);

    -[ICDocCamImageCache inMemoryImageCache](self, "inMemoryImageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v4);

    -[ICDocCamImageCache getImageURL:](self, "getImageURL:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    -[ICDocCamImageCache imageCacheQueue](self, "imageCacheQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __34__ICDocCamImageCache_deleteImage___block_invoke;
    v17[3] = &unk_24C5B8988;
    v18 = v11;
    v19 = v10;
    v20 = &v21;
    v13 = v10;
    v14 = v11;
    dispatch_sync(v12, v17);

    v15 = *((_BYTE *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __34__ICDocCamImageCache_deleteImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;

  v2 = a1 + 40;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v3 & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v16 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v16);
    v8 = v16;
    if ((v7 & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v15 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[DCScannedDocument deleteImage:].cold.1();

    }
  }
  else
  {
    v8 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __34__ICDocCamImageCache_deleteImage___block_invoke_cold_2(v2, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (BOOL)deleteAllImages
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  id v22;

  v22 = 0;
  v3 = -[ICDocCamImageCache makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v22);
  v4 = v22;
  if (v3)
  {
    -[ICDocCamImageCache imageSizeCache](self, "imageSizeCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[ICDocCamImageCache inMemoryImageCache](self, "inMemoryImageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageCache docCamImageDirectoryURL](self, "docCamImageDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 1;
    -[ICDocCamImageCache imageCacheQueue](self, "imageCacheQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __37__ICDocCamImageCache_deleteAllImages__block_invoke;
    v14[3] = &unk_24C5B8988;
    v15 = v7;
    v16 = v8;
    v17 = &v18;
    v10 = v8;
    v11 = v7;
    dispatch_sync(v9, v14);

    v12 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __37__ICDocCamImageCache_deleteAllImages__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15;
  _BYTE v16[15];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;

  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        if (v5)
        {
          v14 = os_log_create("com.apple.documentcamera", ");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            __37__ICDocCamImageCache_deleteAllImages__block_invoke_cold_2();

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          goto LABEL_17;
        }
        objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 32);
        v17 = 0;
        v12 = objc_msgSend(v11, "removeItemAtURL:error:", v10, &v17);
        v5 = v17;
        if ((v12 & 1) == 0)
        {
          v13 = os_log_create("com.apple.documentcamera", ");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            __37__ICDocCamImageCache_deleteAllImages__block_invoke_cold_1(&v15, v16, v13);

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

}

- (void)clearInMemoryCache
{
  id v2;

  -[ICDocCamImageCache inMemoryImageCache](self, "inMemoryImageCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (BOOL)writeImage:(id)a3 metaData:(id)a4 toURL:(id)a5 error:(id *)a6
{
  id v9;
  const __CFURL *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  CGImageDestination *v18;
  CGImage *v19;
  const __CFDictionary *v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v9 = a3;
  v10 = (const __CFURL *)a5;
  v11 = a4;
  -[ICDocCamImageCache imagePropertiesFromMetadata:orientation:](self, "imagePropertiesFromMetadata:orientation:", v11, objc_msgSend(v9, "imageOrientation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = (void *)MEMORY[0x24BDD16E0];
  +[DCSettings sharedSettings](DCSettings, "sharedSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageQuality");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD9220]);

  objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = CGImageDestinationCreateWithURL(v10, v17, 1uLL, 0);

  if (v18)
  {
    v19 = (CGImage *)objc_msgSend(v9, "dc_CGImage");
    v20 = (const __CFDictionary *)objc_msgSend(v13, "copy");
    CGImageDestinationAddImage(v18, v19, v20);

    v21 = CGImageDestinationFinalize(v18);
    if (!v21)
    {
      v22 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ICDocCamImageCache writeImage:metaData:toURL:error:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    }
    CFRelease(v18);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)createNSDataFrom:(id)a3 metaData:(id)a4
{
  void *v6;
  id v7;
  UIImage *v8;
  void *v9;
  const __CFData *v10;
  CGImageSource *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *Type;
  __CFData *v19;
  CGImageDestination *v20;
  const __CFDictionary *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (void *)MEMORY[0x24BDBCE50];
  v7 = a4;
  v8 = (UIImage *)a3;
  UIImageJPEGRepresentation(v8, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataWithData:", v9);
  v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  v11 = CGImageSourceCreateWithData(v10, 0);
  v12 = -[UIImage imageOrientation](v8, "imageOrientation");

  -[ICDocCamImageCache imagePropertiesFromMetadata:orientation:](self, "imagePropertiesFromMetadata:orientation:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v15 = (void *)MEMORY[0x24BDD16E0];
  +[DCSettings sharedSettings](DCSettings, "sharedSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageQuality");
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDD9220]);

  Type = CGImageSourceGetType(v11);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v19 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v20 = CGImageDestinationCreateWithData(v19, Type, 1uLL, 0);
  v21 = (const __CFDictionary *)objc_msgSend(v14, "copy");
  CGImageDestinationAddImageFromSource(v20, v11, 0, v21);

  if (!CGImageDestinationFinalize(v20))
  {
    v22 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ICDocCamImageCache createNSDataFrom:metaData:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

  }
  CFRelease(v20);
  CFRelease(v11);

  return v19;
}

- (id)imagePropertiesFromMetadata:(id)a3 orientation:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;

  v4 = a3;
  v21 = v4;
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v25 = *MEMORY[0x24BDD9470];
  objc_msgSend(v5, "objectForKey:", v21);
  v7 = objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BDD95D0];
  objc_msgSend(v6, "objectForKey:");
  v8 = objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDD96E8];
  objc_msgSend(v6, "objectForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD96D8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD96D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDD9668];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD9668]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDD9598];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD9598]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v8;
  if (v8)
  {
    if (v9)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_8:
      if (v11)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_9:
    if (v13)
      goto LABEL_10;
LABEL_18:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_18;
LABEL_10:
  if (v15)
    goto LABEL_11;
LABEL_19:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(v6, "setObject:forKey:", v27, v25);
  objc_msgSend(v6, "setObject:forKey:", v16, v24);
  objc_msgSend(v6, "setObject:forKey:", v9, v23);
  objc_msgSend(v6, "setObject:forKey:", v11, v10);
  objc_msgSend(v6, "setObject:forKey:", v13, v12);
  objc_msgSend(v6, "setObject:forKey:", v15, v14);
  if ((unint64_t)(a4 - 1) > 2)
    v17 = 1;
  else
    v17 = dword_20CF1B3A0[a4 - 1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v18, CFSTR("Orientation"));

  objc_msgSend(v6, "removeObjectForKey:", CFSTR("Diagnostic"));
  v19 = (void *)objc_msgSend(v6, "copy");

  return v19;
}

- (DCDataCryptorDelegate)dataCryptorDelegate
{
  return self->_dataCryptorDelegate;
}

- (void)setDataCryptorDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_dataCryptorDelegate, a3);
}

- (NSURL)cachesDirectoryURL
{
  return self->_cachesDirectoryURL;
}

- (NSURL)docCamImageDirectoryURL
{
  return self->_docCamImageDirectoryURL;
}

- (OS_dispatch_queue)imageCacheQueue
{
  return self->_imageCacheQueue;
}

- (void)setImageCacheQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageCacheQueue, a3);
}

- (DCLRUCache)inMemoryImageCache
{
  return self->_inMemoryImageCache;
}

- (void)setInMemoryImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_inMemoryImageCache, a3);
}

- (NSMutableDictionary)imageSizeCache
{
  return self->_imageSizeCache;
}

- (void)setImageSizeCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageSizeCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSizeCache, 0);
  objc_storeStrong((id *)&self->_inMemoryImageCache, 0);
  objc_storeStrong((id *)&self->_imageCacheQueue, 0);
  objc_storeStrong((id *)&self->_docCamImageDirectoryURL, 0);
  objc_storeStrong((id *)&self->_cachesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_dataCryptorDelegate, 0);
}

- (void)setImage:(uint64_t)a3 metaData:(uint64_t)a4 addToMemoryCache:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, a1, a3, "setImage:metaData:addToMemoryCache:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "setImage: writeToURL failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_20CE8E000, v0, v1, "setImage:metaData:addToMemoryCache: writeToURL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)replaceImage:(uint64_t)a3 metaData:(uint64_t)a4 uuid:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_20CE8E000, a2, a3, "replaceImage:metaData:uuid: success? %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)replaceImage:(uint64_t)a3 metaData:(uint64_t)a4 uuid:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, a1, a3, "replaceImage:metaData:uuid:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __49__ICDocCamImageCache_replaceImage_metaData_uuid___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "No file after writing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getImage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, a1, a3, "ICDocCamImageCache getImage() called with nil uuid", v3);
  OUTLINED_FUNCTION_1_0();
}

void __31__ICDocCamImageCache_getImage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "getImage: unable to find file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deleteImage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_20CE8E000, v0, v1, "deleteImage: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __34__ICDocCamImageCache_deleteImage___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a2, a3, "deleteImage: unable to find file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __37__ICDocCamImageCache_deleteAllImages__block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, a3, (uint64_t)a3, "Removal failed", a1);
}

void __37__ICDocCamImageCache_deleteAllImages__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "enumeration failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeImage:(uint64_t)a3 metaData:(uint64_t)a4 toURL:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "%s -- Failed to finalize image", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createNSDataFrom:(uint64_t)a3 metaData:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "%s -- Failed to finalize image", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
