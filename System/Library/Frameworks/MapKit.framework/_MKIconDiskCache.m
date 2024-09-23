@implementation _MKIconDiskCache

- (_MKIconDiskCache)initWithDirectoryURL:(id)a3
{
  id v5;
  _MKIconDiskCache *v6;
  _MKIconDiskCache *v7;
  NSLock *v8;
  NSLock *lock;
  NSMutableArray *v10;
  NSMutableArray *inProgressUUIDs;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *storingQueue;
  void *v16;
  _MKIconDiskCache *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_MKIconDiskCache;
  v6 = -[_MKIconDiskCache init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directoryURL, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v7->_lock;
    v7->_lock = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    inProgressUUIDs = v7->_inProgressUUIDs;
    v7->_inProgressUUIDs = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = dispatch_queue_create("com.apple.Maps.MKIconDiskCache", v13);
    storingQueue = v7->_storingQueue;
    v7->_storingQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTileGroupObserver:queue:", v7, v7->_storingQueue);

    -[_MKIconDiskCache _updateVersionsInfo](v7, "_updateVersionsInfo");
    v17 = v7;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_MKIconDiskCache;
  -[_MKIconDiskCache dealloc](&v4, sel_dealloc);
}

- (void)_updateVersionsInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSURL *directoryURL;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSURL *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  -[NSURL URLByAppendingPathComponent:](self->_directoryURL, "URLByAppendingPathComponent:", CFSTR("version.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allResourcePaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
  v29[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("ResourceVersions"));
  if ((objc_msgSend(v10, "isEqualToDictionary:", v4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_directoryURL, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      directoryURL = self->_directoryURL;
      v26 = 0;
      v16 = objc_msgSend(v14, "removeItemAtURL:error:", directoryURL, &v26);
      v17 = v26;

      if ((v16 & 1) == 0)
      {
        GEOGetMKIconManagerLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v17;
          _os_log_impl(&dword_18B0B0000, v18, OS_LOG_TYPE_ERROR, "Failed to remove stale Maps images: %@", buf, 0xCu);
        }

      }
    }
    -[NSMutableArray removeAllObjects](self->_inProgressUUIDs, "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->_directoryURL;
    v25 = 0;
    v21 = objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v25);
    v22 = v25;

    if ((v21 & 1) == 0)
    {
      GEOGetMKIconManagerLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl(&dword_18B0B0000, v23, OS_LOG_TYPE_ERROR, "Failed to create Maps image cache directory: %@", buf, 0xCu);
      }

    }
    if ((objc_msgSend(v10, "writeToURL:atomically:", v3, 1) & 1) == 0)
    {
      GEOGetMKIconManagerLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v3;
        _os_log_impl(&dword_18B0B0000, v24, OS_LOG_TYPE_ERROR, "Failed to write Maps image cache version plist to %@", buf, 0xCu);
      }

    }
  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (id)imageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 drawingBlock:(id)a6
{
  -[_MKIconDiskCache imageForStyleAttributes:size:scale:isCarplay:isTransit:isTransparent:isNightMode:drawingBlock:](self, "imageForStyleAttributes:size:scale:isCarplay:isTransit:isTransparent:isNightMode:drawingBlock:", a3, a4, 0, 0, 0, 0, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)imageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 isCarplay:(BOOL)a6 isTransit:(BOOL)a7 isTransparent:(BOOL)a8 isNightMode:(BOOL)a9 drawingBlock:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id v17;
  void (**v18)(void);
  void (**v19)(void);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *storingQueue;
  id v33;
  id v34;
  id v36;
  void (**v37)(void);
  void *v38;
  void *v39;
  _QWORD block[5];
  id v41;
  id v42;
  id v43;
  uint8_t buf[16];
  uint64_t v45;

  v10 = a9;
  v11 = a8;
  v12 = a7;
  v13 = a6;
  v45 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = (void (**)(void))a10;
  v19 = v18;
  v20 = 0;
  v39 = v17;
  if (v17 && v18)
  {
    v37 = v18;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock lock](self->_lock, "lock");
    -[NSMutableArray addObject:](self->_inProgressUUIDs, "addObject:", v38);
    -[NSLock unlock](self->_lock, "unlock");
    v36 = v17;
    _pairStringsForStyleAttributes(objc_msgSend(v36, "featureStyleAttributes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
    *(_QWORD *)buf = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortedArrayUsingDescriptors:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "componentsJoinedByString:", CFSTR("-"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    if (a4 < 6)
      objc_msgSend(v26, "appendString:", off_1E20DA350[a4]);
    if (v13)
      objc_msgSend(v26, "appendString:", CFSTR("-carplay"));
    if (v12)
      objc_msgSend(v26, "appendString:", CFSTR("-transit"));
    if (v11)
      objc_msgSend(v26, "appendString:", CFSTR("-t"));
    if (v10)
      objc_msgSend(v26, "appendString:", CFSTR("-n"));
    if (a5 > 1.0)
      objc_msgSend(v26, "appendFormat:", CFSTR("@%lux"), vcvtpd_u64_f64(a5));
    objc_msgSend(v26, "appendString:", CFSTR(".png"));

    -[NSURL URLByAppendingPathComponent:](self->_directoryURL, "URLByAppendingPathComponent:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "fileExistsAtPath:", v28);

    if (v30
      && (objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v28),
          (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      GEOGetMKIconManagerLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v28;
        _os_log_impl(&dword_18B0B0000, v31, OS_LOG_TYPE_DEBUG, "Get image at %@", buf, 0xCu);
      }

      -[NSLock lock](self->_lock, "lock");
      -[NSMutableArray removeObject:](self->_inProgressUUIDs, "removeObject:", v38);
      -[NSLock unlock](self->_lock, "unlock");
    }
    else
    {
      v37[2]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        storingQueue = self->_storingQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __114___MKIconDiskCache_imageForStyleAttributes_size_scale_isCarplay_isTransit_isTransparent_isNightMode_drawingBlock___block_invoke;
        block[3] = &unk_1E20DA310;
        block[4] = self;
        v41 = v38;
        v33 = v20;
        v42 = v33;
        v43 = v28;
        dispatch_async(storingQueue, block);
        v34 = v33;

      }
    }

    v19 = v37;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressUUIDs, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storingQueue, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
