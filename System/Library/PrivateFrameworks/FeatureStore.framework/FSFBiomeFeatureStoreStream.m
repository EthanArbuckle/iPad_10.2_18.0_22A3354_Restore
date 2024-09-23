@implementation FSFBiomeFeatureStoreStream

- (FSFBiomeFeatureStoreStream)initWithConfig:(id)a3 streamId:(id)a4
{
  id v6;
  id v7;
  FSFBiomeFeatureStoreStream *v8;
  void *v9;
  void *v10;
  void *v11;
  FSFBiomeFeatureStoreStream *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  +[FSFErrorHandler assertThatUserIsSupported](FSFErrorHandler, "assertThatUserIsSupported");
  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    v14.receiver = self;
    v14.super_class = (Class)FSFBiomeFeatureStoreStream;
    v8 = -[FSFBiomeFeatureStoreStream init](&v14, sel_init);
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C9D0]), "initWithStream:permission:config:", v7, 1, v6);
      -[FSFBiomeFeatureStoreStream setWriteStore:](v8, "setWriteStore:", v9);

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C9D0]), "initWithStream:permission:config:", v7, 0, v6);
      -[FSFBiomeFeatureStoreStream setReadStore:](v8, "setReadStore:", v10);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C9D0]), "initWithStream:permission:config:", v7, 2, v6);
      -[FSFBiomeFeatureStoreStream setPruneStore:](v8, "setPruneStore:", v11);

    }
    self = v8;
    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for non-iOS  platforms"));
    v12 = 0;
  }

  return v12;
}

- (BOOL)insert:(id)a3 withInteractionId:(id)a4 atTime:(double)a5
{
  id v7;
  char v8;
  void *v9;
  uint8_t v11[16];

  v7 = a3;
  if (+[FSFUtils isUnderLegalRestriction](FSFUtils, "isUnderLegalRestriction"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_212552000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Does not insert into FeatureStore: under privacy restriction", v11, 2u);
    }
    v8 = 0;
  }
  else
  {
    -[FSFBiomeFeatureStoreStream writeStore](self, "writeStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "writeEventWithEventBody:timestamp:", v7, a5);

  }
  return v8;
}

- (id)retrieve:(id)a3
{
  id v4;
  double Current;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  Current = CFAbsoluteTimeGetCurrent();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FSFBiomeFeatureStoreStream readStore](self, "readStore", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchEventsFrom:to:", 0.0, Current + 2.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "eventBody");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "serialize");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
            objc_msgSend(v4, "addObject:", v15);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v4;
}

- (id)retrieveEvents:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v9, "setDay:", 1);
  objc_msgSend(v9, "setMonth:", 1);
  objc_msgSend(v9, "setYear:", 2001);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateFromComponents:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0.0;
  if (v7 && v12)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v12);
    v13 = v14;
  }
  v15 = CFAbsoluteTimeGetCurrent() + 2.5;
  if (v8 && v12)
    objc_msgSend(v8, "timeIntervalSinceDate:", v12, v15);
  v16 = v15 + 1.0;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v13 <= v16)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[FSFBiomeFeatureStoreStream readStore](self, "readStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchEventsFrom:to:", v13, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v17, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v23++));
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v21);
    }

  }
  else
  {
    NSLog(CFSTR("startTime is newer then endTime. startTime:%f endTime:%f"), *(_QWORD *)&v13, *(_QWORD *)&v16);
  }

  return v17;
}

- (BOOL)deleteCurrentStream
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[FSFBiomeFeatureStoreStream pruneStore](self, "pruneStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeEventsFrom:to:reason:pruneFutureEvents:usingBlock:", 0, 0, &__block_literal_global, 0.0, CFAbsoluteTimeGetCurrent());

  -[FSFBiomeFeatureStoreStream readStore](self, "readStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchEventsFrom:to:", 0.0, CFAbsoluteTimeGetCurrent());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  return v6;
}

- (BMStreamDatastore)writeStore
{
  return self->_writeStore;
}

- (void)setWriteStore:(id)a3
{
  objc_storeStrong((id *)&self->_writeStore, a3);
}

- (BMStreamDatastore)readStore
{
  return self->_readStore;
}

- (void)setReadStore:(id)a3
{
  objc_storeStrong((id *)&self->_readStore, a3);
}

- (BMStreamDatastore)pruneStore
{
  return self->_pruneStore;
}

- (void)setPruneStore:(id)a3
{
  objc_storeStrong((id *)&self->_pruneStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruneStore, 0);
  objc_storeStrong((id *)&self->_readStore, 0);
  objc_storeStrong((id *)&self->_writeStore, 0);
}

@end
