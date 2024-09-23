@implementation BCSBlastDoorHelper

- (BCSBlastDoorHelper)initWithPersistentStore:(id)a3
{
  id v5;
  BCSBlastDoorHelper *v6;
  BCSBlastDoorHelper *v7;
  BCSExecutionTimer *v8;
  id v9;
  uint64_t v10;
  IMMessagesBlastDoorInterface *blastdoor;
  NSObject *v12;
  uint64_t v13;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCSBlastDoorHelper;
  v6 = -[BCSBlastDoorHelper init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = objc_alloc_init(BCSExecutionTimer);
    v9 = objc_alloc(MEMORY[0x24BE666F0]);
    v10 = objc_msgSend(v9, "initWithBlastDoorInstanceType:", *MEMORY[0x24BE0F908]);
    blastdoor = v7->_blastdoor;
    v7->_blastdoor = (IMMessagesBlastDoorInterface *)v10;

    ABSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[BCSExecutionTimer milliseconds](v8, "milliseconds");
      *(_DWORD *)buf = 134217984;
      v17 = v13;
      _os_log_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_DEFAULT, "BlastDoor init took  %llu ms", buf, 0xCu);
    }

  }
  return v7;
}

+ (BCSBlastDoorHelper)defaultHelper
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id *v6;
  BCSBlastDoorHelper *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;

  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("com.apple.businessservicesd/temp"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[BCSBlastDoorPersistentStore initWithCacheURL:]((id *)[BCSBlastDoorPersistentStore alloc], v5);
    v7 = -[BCSBlastDoorHelper initWithPersistentStore:]([BCSBlastDoorHelper alloc], "initWithPersistentStore:", v6);

  }
  else
  {
    ABSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_ERROR, "Error finding default cache directory for BlastDoor image store: %@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (void)warmUpBlastDoor
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20ACAD000, v3, OS_LOG_TYPE_DEFAULT, "Warming up BlastDoor interface", buf, 2u);
  }

  -[BCSBlastDoorHelper store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "fileURLForImageWithName:error:", CFSTR("warmUp.gif"), &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &warmUpBlastDoor_warmUpGIFBytes, 37);
    v7 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject writeToURL:atomically:](v7, "writeToURL:atomically:", v5, 0) & 1) != 0)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __37__BCSBlastDoorHelper_warmUpBlastDoor__block_invoke;
      v11[3] = &unk_24C39BED8;
      v11[4] = self;
      v12 = v5;
      v8 = BCSTimeExecutionOfBlock((uint64_t)v11);
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v15 = v8 / 0xF4240;
        _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "Warmed up BlastDoor interface in %llu ms", buf, 0xCu);
      }

    }
    else
    {
      ABSLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_ERROR, "Error writing temp file for warm up image", buf, 2u);
      }

    }
  }
  else
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = (unint64_t)v6;
      _os_log_error_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_ERROR, "Error creating temp file for warm up image: %@", buf, 0xCu);
    }
  }

}

void __37__BCSBlastDoorHelper_warmUpBlastDoor__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  _QWORD v5[4];
  id v6;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__BCSBlastDoorHelper_warmUpBlastDoor__block_invoke_2;
  v5[3] = &unk_24C39D0F0;
  v6 = v1;
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  objc_msgSend(v2, "generatePreviewforAttachmentWithfileURL:maxPixelDimension:scale:resultHandler:", v6, v5, v3, v4);

}

void __37__BCSBlastDoorHelper_warmUpBlastDoor__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

- (id)safeImageURLFromImageURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  double v8;
  double v9;
  void *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[BCSBlastDoorHelper safeImageURLFromImageURL:error:]";
    _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  LODWORD(v8) = 1127153664;
  LODWORD(v9) = 1.0;
  -[BCSBlastDoorHelper safeImageURLFromImageURL:maxPixelDimension:scale:error:](self, "safeImageURLFromImageURL:maxPixelDimension:scale:error:", v6, a4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)safeImageURLFromImageURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  BCSExecutionTimer *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  const char *v30;
  const char *v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[BCSBlastDoorHelper safeImageURLFromImageURL:maxPixelDimension:scale:error:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v12 = objc_alloc_init(BCSExecutionTimer);
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  -[BCSBlastDoorHelper _blastDoorImagePreviewFromImageURL:maxPixelDimension:scale:error:](self, "_blastDoorImagePreviewFromImageURL:maxPixelDimension:scale:error:", v10, a6, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByDeletingPathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-safe.%@"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[BCSBlastDoorHelper store](self, "store");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fileURLForImageWithName:error:", v20, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    ABSLogCommon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v28 = 0;
      goto LABEL_12;
    }
    v29 = (const char *)*a6;
    *(_DWORD *)buf = 138412290;
    v34 = v29;
    v30 = "Error creating temp file for image copy: %@";
LABEL_14:
    _os_log_error_impl(&dword_20ACAD000, v26, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
    goto LABEL_11;
  }
  objc_msgSend(v15, "image");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "writeToURL:usingEncoding:error:", v22, 0, a6);

  ABSLogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((v24 & 1) == 0)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v32 = (const char *)*a6;
    *(_DWORD *)buf = 138412290;
    v34 = v32;
    v30 = "Error writing BlastDoor image copy: %@";
    goto LABEL_14;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v27 = -[BCSExecutionTimer milliseconds](v12, "milliseconds");
    *(_DWORD *)buf = 134217984;
    v34 = (const char *)v27;
    _os_log_impl(&dword_20ACAD000, v26, OS_LOG_TYPE_DEFAULT, "safeImageURLFromImageURL processing took  %llu ms (total)", buf, 0xCu);
  }

  v28 = v22;
LABEL_12:

  return v28;
}

- (id)_blastDoorImagePreviewFromImageURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  id v10;
  BCSExecutionTimer *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = objc_alloc_init(BCSExecutionTimer);
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  -[IMMessagesBlastDoorInterface generateImagePreviewForFileURL:maxPixelDimension:scale:error:](self->_blastdoor, "generateImagePreviewForFileURL:maxPixelDimension:scale:error:", v10, a6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  ABSLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134217984;
      v21 = -[BCSExecutionTimer milliseconds](v11, "milliseconds");
      _os_log_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_DEFAULT, "BlastDoor processing took  %llu ms", (uint8_t *)&v20, 0xCu);
    }

    v17 = v14;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = *a6;
      v20 = 138412290;
      v21 = (uint64_t)v19;
      _os_log_error_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_ERROR, "Error generating BlastDoor preview: %@", (uint8_t *)&v20, 0xCu);
    }

  }
  return v14;
}

- (id)safeImageURLFromImage:(id)a3 imageFormat:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a3;
  ABSLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[BCSBlastDoorHelper safeImageURLFromImage:imageFormat:maxPixelDimension:scale:error:]";
    _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v21, 0xCu);
  }

  -[BCSBlastDoorHelper _fileURLAfterWritingData:extension:error:](self, "_fileURLAfterWritingData:extension:error:", v13, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v16 = a5;
  *(float *)&v17 = a6;
  -[BCSBlastDoorHelper safeImageURLFromImageURL:maxPixelDimension:scale:error:](self, "safeImageURLFromImageURL:maxPixelDimension:scale:error:", v15, a7, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeItemAtURL:error:", v15, 0);

  return v18;
}

- (id)safeImageURLFromImage:(id)a3 imageFormat:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  double v12;
  void *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[BCSBlastDoorHelper safeImageURLFromImage:imageFormat:error:]";
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  LODWORD(v11) = 1127153664;
  LODWORD(v12) = 1.0;
  -[BCSBlastDoorHelper safeImageURLFromImage:imageFormat:maxPixelDimension:scale:error:](self, "safeImageURLFromImage:imageFormat:maxPixelDimension:scale:error:", v9, v8, a5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)safeImageFromImage:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[BCSBlastDoorHelper safeImageFromImage:maxPixelDimension:scale:error:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v20, 0xCu);
  }

  -[BCSBlastDoorHelper _fileURLAfterWritingData:extension:error:](self, "_fileURLAfterWritingData:extension:error:", v10, CFSTR("unknown"), a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  -[BCSBlastDoorHelper _blastDoorImagePreviewFromImageURL:maxPixelDimension:scale:error:](self, "_blastDoorImagePreviewFromImageURL:maxPixelDimension:scale:error:", v12, a6, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBlastDoorHelper _dataFromCGImageRef:](self, "_dataFromCGImageRef:", objc_msgSend(v16, "cgImage"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeItemAtURL:error:", v12, 0);

  return v17;
}

- (id)safeCSSFromData:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)_fileURLAfterWritingData:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (void *)MEMORY[0x24BDD1880];
  v11 = a4;
  objc_msgSend(v10, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[BCSBlastDoorHelper store](self, "store");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fileURLForImageWithName:error:", v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && (objc_msgSend(v8, "writeToURL:atomically:", v16, 0) & 1) == 0)
  {
    ABSLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_ERROR, "Failed to create copy of data", buf, 2u);
    }

    v17 = 0;
  }
  else
  {
    v17 = v16;
  }

  return v17;
}

- (id)_dataFromCGImageRef:(CGImage *)a3
{
  __CFData *v4;
  id v5;
  const __CFString *v6;
  CGImageDestination *v7;
  __CFData *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (__CFData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = CFStringCreateWithCString(0, (const char *)objc_msgSend(v5, "UTF8String"), 0x8000100u);

  v7 = CGImageDestinationCreateWithData(v4, v6, 1uLL, 0);
  CFRelease(v6);
  if (!v7)
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "Failed to create CGImageDestination", buf, 2u);
    }

    goto LABEL_10;
  }
  CGImageDestinationAddImage(v7, a3, 0);
  if (!CGImageDestinationFinalize(v7))
  {
    ABSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_ERROR, "Failed to finalize CGImageDestination", v12, 2u);
    }

    CFRelease(v7);
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  CFRelease(v7);
  v8 = v4;
LABEL_11:

  return v8;
}

- (BCSBlastDoorImageCache)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_blastdoor, 0);
}

@end
