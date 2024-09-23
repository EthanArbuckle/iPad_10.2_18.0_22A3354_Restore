@implementation GEORequestResponseMetadataFileManager

+ (id)sharedManager
{
  if (qword_1ECDBBDA0 != -1)
    dispatch_once(&qword_1ECDBBDA0, &__block_literal_global_66);
  return (id)_MergedGlobals_222;
}

void __54__GEORequestResponseMetadataFileManager_sharedManager__block_invoke()
{
  GEORequestResponseMetadataFileManager *v0;
  void *v1;
  id v2;

  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 21);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[GEORequestResponseMetadataFileManager initWithDirectory:]([GEORequestResponseMetadataFileManager alloc], "initWithDirectory:", v2);
  v1 = (void *)_MergedGlobals_222;
  _MergedGlobals_222 = (uint64_t)v0;

}

- (void)commoninit
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *syncQ;
  NSMutableDictionary *v6;
  NSMutableDictionary *metadataFiles;
  OS_dispatch_source *v8;
  OS_dispatch_source *closeTimer;
  NSObject *v10;
  _QWORD handler[5];

  self->_needDir = 1;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("reqRespMetadata", v3);
  syncQ = self->_syncQ;
  self->_syncQ = v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  metadataFiles = self->_metadataFiles;
  self->_metadataFiles = v6;

  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_syncQ);
  closeTimer = self->_closeTimer;
  self->_closeTimer = v8;

  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  v10 = self->_closeTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __51__GEORequestResponseMetadataFileManager_commoninit__block_invoke;
  handler[3] = &unk_1E1BFF6F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_activate((dispatch_object_t)self->_closeTimer);
}

uint64_t __51__GEORequestResponseMetadataFileManager_commoninit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeFiles");
}

- (GEORequestResponseMetadataFileManager)init
{
  GEORequestResponseMetadataFileManager *v2;
  GEORequestResponseMetadataFileManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEORequestResponseMetadataFileManager;
  v2 = -[GEORequestResponseMetadataFileManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GEORequestResponseMetadataFileManager commoninit](v2, "commoninit");
  return v3;
}

- (void)_closeFiles
{
  NSObject *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  GEOGetRRMetadataFileManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "cleanup timer fired", buf, 2u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_metadataFiles;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        GEOGetRRMetadataFileManagerLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v9;
          _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "closing service metadata file '%@'", buf, 0xCu);
        }

        -[NSMutableDictionary objectForKeyedSubscript:](self->_metadataFiles, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "close");

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_metadataFiles, "removeAllObjects");
  -[GEORequestResponseMetadataFileManager _clearTimer](self, "_clearTimer");
}

- (void)_startTimer
{
  NSObject *v3;
  uint64_t UInteger;
  dispatch_time_t v5;
  uint8_t v6[16];

  GEOGetRRMetadataFileManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "scheduling cleanup timer", v6, 2u);
  }

  UInteger = GEOConfigGetUInteger(GeoServicesConfig_RequestResponseMetadataFileInactivityDuration, (uint64_t)off_1EDF4E198);
  v5 = dispatch_time(0, 1000000000 * UInteger);
  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)_clearTimer
{
  NSObject *v3;
  uint8_t v4[16];

  GEOGetRRMetadataFileManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "disabling cleanup timer", v4, 2u);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (id)_filepathFromBatchID:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%llu"), CFSTR("rrmetadata"), a3);
  -[NSString stringByAppendingPathComponent:](self->_fileDirectory, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)saveRequestResponseMetadata:(id)a3 batchID:(unint64_t)a4
{
  id v6;
  NSObject *syncQ;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__GEORequestResponseMetadataFileManager_saveRequestResponseMetadata_batchID___block_invoke;
  block[3] = &unk_1E1C01420;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(syncQ, block);

}

void __77__GEORequestResponseMetadataFileManager_saveRequestResponseMetadata_batchID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_createIfNeededRequestResponseMetadataDirectory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)) & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    objc_msgSend(*(id *)(a1 + 40), "data");
    v2 = objc_claimAutoreleasedReturnValue();
    GEOGetRRMetadataFileManagerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v6 = 134217984;
      v7 = -[NSObject length](v2, "length");
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "will write service metadata of size %llu", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_filepathFromBatchID:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = -[GEORequestResponseMetadataFile initForWriteWithFilePath:]([GEORequestResponseMetadataFile alloc], "initForWriteWithFilePath:", v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v5, v4);
    }
    objc_msgSend(v5, "writeRequestResponseMetadata:", v2);
    objc_msgSend(*(id *)(a1 + 32), "_startTimer");

  }
  else
  {
    GEOGetRRMetadataFileManagerLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "can't write service metadata; missing directory",
        (uint8_t *)&v6,
        2u);
    }
  }

}

- (int)fileDescriptorOfRequestResponseMetadataFileForBatchID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *syncQ;
  id v9;
  GEORequestResponseMetadataFile *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[GEORequestResponseMetadataFileManager _filepathFromBatchID:](self, "_filepathFromBatchID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__32;
  v22 = __Block_byref_object_dispose__32;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("_%@"), v7);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  syncQ = self->_syncQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__GEORequestResponseMetadataFileManager_fileDescriptorOfRequestResponseMetadataFileForBatchID___block_invoke;
  block[3] = &unk_1E1BFF8F8;
  block[4] = self;
  v9 = v5;
  v16 = v9;
  v17 = &v18;
  dispatch_sync(syncQ, block);
  if (v19[5])
  {
    v10 = [GEORequestResponseMetadataFile alloc];
    v11 = -[GEORequestResponseMetadataFile initForReadWithFilePath:](v10, "initForReadWithFilePath:", v19[5]);
    v12 = v11;
    if (v11)
    {
      v13 = -[NSObject unlinkAndReturnOpenFileDescriptor](v11, "unlinkAndReturnOpenFileDescriptor");
    }
    else
    {
      GEOGetRRMetadataFileManagerLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v25 = a3;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "nothing available for batchID '%llu'", buf, 0xCu);
      }
      v13 = -1;
    }

  }
  else
  {
    v13 = -1;
  }

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __95__GEORequestResponseMetadataFileManager_fileDescriptorOfRequestResponseMetadataFileForBatchID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "close");
    objc_msgSend(*(id *)(a1[4] + 32), "removeObjectForKey:", a1[5]);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[5];
  v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v13 = 0;
  objc_msgSend(v4, "moveItemAtPath:toPath:error:", v5, v6, &v13);
  v7 = v13;

  if (v7)
  {
    GEOGetRRMetadataFileManagerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = a1[5];
      v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "unable to move '%@' to '%@' (%@)", buf, 0x20u);
    }

    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

- (BOOL)_createIfNeededRequestResponseMetadataDirectory:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_needDir
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, 0),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v12);
    v9 = v12;

    if ((v7 & 1) == 0)
    {
      GEOGetRRMetadataFileManagerLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "directory create error : (%@)", buf, 0xCu);
      }

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataFiles, 0);
  objc_storeStrong((id *)&self->_fileDirectory, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_syncQ, 0);
}

- (GEORequestResponseMetadataFileManager)initWithDirectory:(id)a3
{
  id v4;
  GEORequestResponseMetadataFileManager *v5;
  GEORequestResponseMetadataFileManager *v6;
  uint64_t v7;
  NSString *fileDirectory;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORequestResponseMetadataFileManager;
  v5 = -[GEORequestResponseMetadataFileManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEORequestResponseMetadataFileManager commoninit](v5, "commoninit");
    v7 = objc_msgSend(v4, "copy");
    fileDirectory = v6->_fileDirectory;
    v6->_fileDirectory = (NSString *)v7;

    if (-[GEORequestResponseMetadataFileManager _createIfNeededRequestResponseMetadataDirectory:](v6, "_createIfNeededRequestResponseMetadataDirectory:", v4))
    {
      v6->_needDir = 0;
    }
  }

  return v6;
}

@end
