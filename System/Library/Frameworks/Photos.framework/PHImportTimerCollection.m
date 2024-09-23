@implementation PHImportTimerCollection

- (id)initForMediaType:(unsigned __int8)a3 fileSize:(unint64_t)a4
{
  NSObject *v7;
  _BOOL4 v8;
  PHImportTimerCollection *v9;
  PHImportTimerCollection *v10;
  uint64_t v11;
  NSMutableArray *timers;
  uint64_t v13;
  NSMutableIndexSet *runningTimers;
  PHImportTimerCollection *v15;
  objc_super v17;

  PLImportGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)PHImportTimerCollection;
    v9 = -[PHImportTimerCollection init](&v17, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_mediaType = a3;
      v9->_fileSize = a4;
      v11 = objc_opt_new();
      timers = v10->_timers;
      v10->_timers = (NSMutableArray *)v11;

      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v13 = objc_claimAutoreleasedReturnValue();
      runningTimers = v10->_runningTimers;
      v10->_runningTimers = (NSMutableIndexSet *)v13;

    }
    self = v10;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: mediaType: %hhu, fileSize: %lu\ntimers:\n%@"), v5, self, self->_mediaType, self->_fileSize, self->_timers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)startTiming:(unsigned __int8)a3 subtype:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  PHImportTimer *v7;

  v4 = a4;
  v5 = a3;
  -[NSMutableIndexSet addIndex:](self->_runningTimers, "addIndex:", a3);
  v7 = -[PHImportTimer initWithType:subtype:]([PHImportTimer alloc], "initWithType:subtype:", v5, v4);
  -[NSMutableArray addObject:](self->_timers, "addObject:", v7);
  -[PHImportTimer start](v7, "start");
  return v7;
}

- (void)stopTiming:(id)a3
{
  NSMutableIndexSet *runningTimers;
  id v4;

  runningTimers = self->_runningTimers;
  v4 = a3;
  -[NSMutableIndexSet removeIndex:](runningTimers, "removeIndex:", objc_msgSend(v4, "type"));
  objc_msgSend(v4, "stop");

}

- (void)processTimesOfType:(unsigned __int8)a3 withBlock:(id)a4
{
  int v4;
  void (**v6)(id, void *, void *);
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, void *))a4;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_timers;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "type", (_QWORD)v15) == v4)
          {
            objc_msgSend(v12, "startTime");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "endTime");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v13, v14);

          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (double)duration:(unsigned __int8)a3
{
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PHImportTimerCollection_duration___block_invoke;
  v5[3] = &unk_1E35DDAA0;
  v5[4] = &v6;
  -[PHImportTimerCollection processTimesOfType:withBlock:](self, "processTimesOfType:withBlock:", a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(unsigned __int8)a3
{
  self->_aspectRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTimers, 0);
  objc_storeStrong((id *)&self->_timers, 0);
}

double __36__PHImportTimerCollection_duration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  double v5;
  double result;

  objc_msgSend(a3, "timeIntervalSinceDate:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

@end
