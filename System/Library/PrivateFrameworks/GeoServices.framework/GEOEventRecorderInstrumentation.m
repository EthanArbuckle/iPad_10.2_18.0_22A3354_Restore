@implementation GEOEventRecorderInstrumentation

- (GEOEventRecorderInstrumentation)init
{
  GEOEventRecorderInstrumentation *v2;
  uint64_t v3;
  OS_dispatch_queue *loggingQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOEventRecorderInstrumentation;
  v2 = -[GEOEventRecorderInstrumentation init](&v6, sel_init);
  if (v2)
  {
    geo_dispatch_queue_create_with_workloop_qos();
    v3 = objc_claimAutoreleasedReturnValue();
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v3;

    -[GEOEventRecorderInstrumentation _setupLogging](v2, "_setupLogging");
  }
  return v2;
}

+ (id)initializeDefaultInstrumentation
{
  void *v2;
  GEOEventRecorderInstrumentation *v3;
  void *v4;

  v2 = (void *)sDefaultInstrumentation;
  if (!sDefaultInstrumentation)
  {
    v3 = objc_alloc_init(GEOEventRecorderInstrumentation);
    v4 = (void *)sDefaultInstrumentation;
    sDefaultInstrumentation = (uint64_t)v3;

    v2 = (void *)sDefaultInstrumentation;
  }
  return v2;
}

+ (id)defaultInstrumentation
{
  return (id)sDefaultInstrumentation;
}

+ (void)endInstrumentation
{
  void *v2;

  v2 = (void *)sDefaultInstrumentation;
  sDefaultInstrumentation = 0;

}

- (id)getRecordedFilePaths
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0C99D20]);
  return (id)objc_msgSend(v2, "initWithObjects:", *(_QWORD *)(sDefaultInstrumentation + 16), *(_QWORD *)(sDefaultInstrumentation + 24), *(_QWORD *)(sDefaultInstrumentation + 32), 0);
}

- (void)captureUIEvent:(id)a3
{
  -[GEOEventRecorderInstrumentation writeString:ToFilepath:](self, "writeString:ToFilepath:", a3, self->_filepath);
}

- (void)captureUserActionLogMessageEvent:(id)a3
{
  -[GEOEventRecorderInstrumentation writeString:ToFilepath:](self, "writeString:ToFilepath:", a3, self->_geoFilepath);
}

- (void)writeString:(id)a3 ToFilepath:(id)a4
{
  id v6;
  id v7;
  NSObject *loggingQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  loggingQueue = self->_loggingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__GEOEventRecorderInstrumentation_writeString_ToFilepath___block_invoke;
  block[3] = &unk_1E1C01790;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(loggingQueue, block);

}

void __58__GEOEventRecorderInstrumentation_writeString_ToFilepath___block_invoke(_QWORD *a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1[4] + 40), "timeIntervalSinceNow");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%0.1fs)"), -v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@\n"), v4, a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "fileExistsAtPath:", a1[6])
    || (objc_msgSend(v6, "isWritableFileAtPath:", a1[6]) & 1) == 0)
  {
    v7 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CB2A78];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createFileAtPath:contents:attributes:", v7, v8, v10);

  }
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", a1[6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "seekToEndReturningOffset:error:", 0, 0);
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeData:error:", v12, 0);

  objc_msgSend(v11, "closeAndReturnError:", 0);
}

- (void)captureEventRecorderScreenVideo
{
  -[GEOEventRecorderInstrumentation _captureScreenVideo:](self, "_captureScreenVideo:", self->_movieFilepath);
}

- (void)_captureScreenVideo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "copyItemAtPath:toPath:error:", CFSTR("/private/var/mobile/Library/ReplayKit/RPMovie_com.apple.Maps.mp4"), v4, &v10);

  v7 = v10;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v7, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Copying the movie file to our directory failed with error: %@"), v9);

  }
}

- (void)initializeFilepaths
{
  NSDate *v3;
  NSDate *startDate;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *filepath;
  void *v15;
  NSString *v16;
  NSString *geoFilepath;
  NSString *v18;
  NSString *movieFilepath;
  void *v20;
  id v21;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  startDate = self->_startDate;
  self->_startDate = v3;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy_MM_dd_hh_mm_ss"));
  objc_msgSend(v5, "stringFromDate:", self->_startDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rai_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  GEOLogDirectory(&v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (!v9)
  {
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("RecordedIssues"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.txt"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    filepath = self->_filepath;
    self->_filepath = v13;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("raiGEO_%@.txt"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v15);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    geoFilepath = self->_geoFilepath;
    self->_geoFilepath = v16;

    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("movie.mp4"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    movieFilepath = self->_movieFilepath;
    self->_movieFilepath = v18;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_movieFilepath, 0);
  objc_storeStrong((id *)&self->_geoFilepath, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
}

@end
