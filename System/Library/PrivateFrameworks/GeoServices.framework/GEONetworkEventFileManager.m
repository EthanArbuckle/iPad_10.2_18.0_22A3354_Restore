@implementation GEONetworkEventFileManager

- (void)_startTimer
{
  NSObject *v3;
  uint64_t UInteger;
  dispatch_time_t v5;
  uint8_t v6[16];

  GEOGetNetEventFileManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "scheduling cleanup timer", v6, 2u);
  }

  UInteger = GEOConfigGetUInteger(GeoServicesConfig_NetEventDataFileInactivityDuration, (uint64_t)off_1EDF4E188);
  v5 = dispatch_time(0, 1000000000 * UInteger);
  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void __58__GEONetworkEventFileManager_saveNetworkEventData_atTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_createIfNeededNetworkEventDataDirectory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)) & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    objc_msgSend(*(id *)(a1 + 40), "data");
    v2 = objc_claimAutoreleasedReturnValue();
    GEOGetNetEventFileManagerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v7 = 134217984;
      v8 = -[NSObject length](v2, "length");
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "will write netEvent data of size %llu", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_filepathFromDate:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = -[GEONetworkEventFile initForWriteWithFilePath:]([GEONetworkEventFile alloc], "initForWriteWithFilePath:", v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v5, v4);
    }
    objc_msgSend(*(id *)(a1 + 40), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeNetworkEventData:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_startTimer");
  }
  else
  {
    GEOGetNetEventFileManagerLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "can't write netEvent data; missing directory",
        (uint8_t *)&v7,
        2u);
    }
  }

}

- (id)_filepathFromDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), CFSTR("neteventdata"), v4);
  -[NSString stringByAppendingPathComponent:](self->_fileDirectory, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_createIfNeededNetworkEventDataDirectory:(id)a3
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
      GEOGetNetEventFileManagerLog();
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

- (void)saveNetworkEventData:(id)a3 atTime:(id)a4
{
  id v6;
  id v7;
  NSObject *syncQ;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__GEONetworkEventFileManager_saveNetworkEventData_atTime___block_invoke;
  block[3] = &unk_1E1C01790;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(syncQ, block);

}

+ (id)sharedManager
{
  if (qword_1ECDBB9E8 != -1)
    dispatch_once(&qword_1ECDBB9E8, &__block_literal_global_18);
  return (id)_MergedGlobals_187;
}

void __43__GEONetworkEventFileManager_sharedManager__block_invoke()
{
  GEONetworkEventFileManager *v0;
  void *v1;
  id v2;

  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 19);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[GEONetworkEventFileManager initWithDirectory:]([GEONetworkEventFileManager alloc], "initWithDirectory:", v2);
  v1 = (void *)_MergedGlobals_187;
  _MergedGlobals_187 = (uint64_t)v0;

}

- (void)commoninit
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *syncQ;
  NSDateFormatter *v6;
  NSDateFormatter *dateFormatter;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *netEventFiles;
  OS_dispatch_source *v11;
  OS_dispatch_source *closeTimer;
  NSObject *v13;
  _QWORD handler[5];

  self->_needDir = 1;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("netEventData", v3);
  syncQ = self->_syncQ;
  self->_syncQ = v4;

  v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](self->_dateFormatter, "setLocale:", v8);

  -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", CFSTR("yyyyMMdd"));
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  netEventFiles = self->_netEventFiles;
  self->_netEventFiles = v9;

  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_syncQ);
  closeTimer = self->_closeTimer;
  self->_closeTimer = v11;

  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  v13 = self->_closeTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __40__GEONetworkEventFileManager_commoninit__block_invoke;
  handler[3] = &unk_1E1BFF6F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_activate((dispatch_object_t)self->_closeTimer);
}

uint64_t __40__GEONetworkEventFileManager_commoninit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeFiles");
}

- (GEONetworkEventFileManager)init
{
  GEONetworkEventFileManager *v2;
  GEONetworkEventFileManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEONetworkEventFileManager;
  v2 = -[GEONetworkEventFileManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GEONetworkEventFileManager commoninit](v2, "commoninit");
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
  GEOGetNetEventFileManagerLog();
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
  v4 = self->_netEventFiles;
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
        GEOGetNetEventFileManagerLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v9;
          _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "closing netEvent file '%@'", buf, 0xCu);
        }

        -[NSMutableDictionary objectForKeyedSubscript:](self->_netEventFiles, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "close");

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_netEventFiles, "removeAllObjects");
  -[GEONetworkEventFileManager _clearTimer](self, "_clearTimer");
}

- (void)_clearTimer
{
  NSObject *v3;
  uint8_t v4[16];

  GEOGetNetEventFileManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "disabling cleanup timer", v4, 2u);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (int)fileDescriptorOfNetworkEventDataFileForRepresentativeDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[GEONetworkEventFileManager _filepathFromDate:](self, "_filepathFromDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONetworkEventFileManager _filepathFromDate:](self, "_filepathFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", v6))
  {
    GEOGetNetEventFileManagerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "nothing available now; '%@' is still active",
        (uint8_t *)&v12,
        0xCu);
    }
LABEL_9:
    v9 = -1;
    goto LABEL_10;
  }
  v8 = -[GEONetworkEventFile initForReadWithFilePath:]([GEONetworkEventFile alloc], "initForReadWithFilePath:", v4);
  if (!v8)
  {
    GEOGetNetEventFileManagerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "nothing available; '%@' does not exist",
        (uint8_t *)&v12,
        0xCu);
    }

    v7 = 0;
    goto LABEL_9;
  }
  v7 = v8;
  v9 = -[NSObject unlinkAndReturnOpenFileDescriptor](v8, "unlinkAndReturnOpenFileDescriptor");
LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netEventFiles, 0);
  objc_storeStrong((id *)&self->_fileDirectory, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_syncQ, 0);
}

- (GEONetworkEventFileManager)initWithDirectory:(id)a3
{
  id v4;
  GEONetworkEventFileManager *v5;
  GEONetworkEventFileManager *v6;
  uint64_t v7;
  NSString *fileDirectory;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEONetworkEventFileManager;
  v5 = -[GEONetworkEventFileManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEONetworkEventFileManager commoninit](v5, "commoninit");
    v7 = objc_msgSend(v4, "copy");
    fileDirectory = v6->_fileDirectory;
    v6->_fileDirectory = (NSString *)v7;

    if (-[GEONetworkEventFileManager _createIfNeededNetworkEventDataDirectory:](v6, "_createIfNeededNetworkEventDataDirectory:", v4))
    {
      v6->_needDir = 0;
    }
  }

  return v6;
}

@end
