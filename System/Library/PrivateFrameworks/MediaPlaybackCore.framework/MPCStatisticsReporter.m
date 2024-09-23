@implementation MPCStatisticsReporter

- (MPCStatisticsReporter)init
{
  MPCStatisticsReporter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *writerQueue;
  NSObject *v5;
  _QWORD block[4];
  MPCStatisticsReporter *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPCStatisticsReporter;
  v2 = -[MPCStatisticsReporter init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlaybackCore/Suntory.statsReporterQueue", 0);
    writerQueue = v2->_writerQueue;
    v2->_writerQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_writerQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__MPCStatisticsReporter_init__block_invoke;
    block[3] = &unk_24CABA2D0;
    v8 = v2;
    dispatch_async(v5, block);

  }
  return v2;
}

- (void)reportRecordedResults:(id)a3
{
  id v4;
  NSObject *writerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MPCStatisticsReporter *v9;

  v4 = a3;
  writerQueue = self->_writerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__MPCStatisticsReporter_reportRecordedResults___block_invoke;
  v7[3] = &unk_24CABA1D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(writerQueue, v7);

}

- (void)flush
{
  NSObject *writerQueue;
  _QWORD block[5];

  writerQueue = self->_writerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__MPCStatisticsReporter_flush__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(writerQueue, block);
}

- (NSString)recordScenarioName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vocalAttenuationStatisticsName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)_writeAnalyticsDataFromRecorder:(id)a3
{
  NSObject *writerQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  MPCStatisticsReporter *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  writerQueue = self->_writerQueue;
  v5 = a3;
  dispatch_assert_queue_V2(writerQueue);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("analytics_%@.plist"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCStatisticsReporter _reportDirectoryURL](self, "_reportDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "msv_compactDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = self;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Writing data to %{public}@ %{public}@", buf, 0x20u);

  }
  v18 = 0;
  objc_msgSend(v11, "writeToURL:error:", v10, &v18);
  v15 = v18;
  if (v15)
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = self;
      v21 = 2114;
      v22 = v17;
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Failed to write: %{public}@ - error:%{public}@", buf, 0x20u);

    }
  }

}

- (void)_sendAnalyticsData
{
  MPCStatisticsReporter *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  id v31;
  void *v32;
  NSObject *v33;
  __int128 v34;
  MPCStatisticsReporter *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD aBlock[4];
  NSObject *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  MPCStatisticsReporter *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v2 = self;
  v54 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writerQueue);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCStatisticsReporter _reportDirectoryURL](v2, "_reportDirectoryURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  objc_msgSend(v3, "enumeratorAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v38, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v2;
    v49 = 2114;
    v50 = v7;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Flushing local analytics files in %{public}@", buf, 0x16u);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v9)
  {
    v11 = v9;
    v12 = CFSTR("analytics");
    v13 = *(_QWORD *)v44;
    *(_QWORD *)&v10 = 138543618;
    v34 = v10;
    v35 = v2;
    v36 = v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v15, "containsString:", v12, v34))
        {
          objc_msgSend(v15, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("plist"));

          if (v17)
          {
            v18 = v12;
            objc_msgSend(v38, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByAppendingPathComponent:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v21, &v42);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v42;
            v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            v25 = v24;
            if (v23)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v48 = v2;
                v49 = 2114;
                v50 = v20;
                v51 = 2114;
                v52 = v23;
                _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Error getting data in %{public}@: %{public}@", buf, 0x20u);
              }
            }
            else
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v22, "msv_compactDescription");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v48 = v35;
                v49 = 2114;
                v50 = v20;
                v51 = 2114;
                v52 = v26;
                _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Sending data in %{public}@: %{public}@", buf, 0x20u);

                v2 = v35;
              }

              aBlock[0] = MEMORY[0x24BDAC760];
              aBlock[1] = 3221225472;
              aBlock[2] = __43__MPCStatisticsReporter__sendAnalyticsData__block_invoke;
              aBlock[3] = &unk_24CAB9B38;
              v41 = v22;
              v27 = _Block_copy(aBlock);
              -[MPCStatisticsReporter coreAnalyticsEventName](v2, "coreAnalyticsEventName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              AnalyticsSendEventLazy();

              v2 = v35;
              v25 = v41;
            }

            v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              v48 = v2;
              v49 = 2114;
              v50 = v20;
              _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Removing %{public}@", buf, 0x16u);
            }

            v39 = 0;
            v30 = objc_msgSend(v37, "removeItemAtPath:error:", v20, &v39);
            v31 = v39;
            v32 = v31;
            if (!v30 || v31)
            {
              v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v48 = v2;
                v49 = 2114;
                v50 = v20;
                v51 = 2114;
                v52 = v32;
                _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Failed to remove: %{public}@ - error:%{public}@", buf, 0x20u);
              }

            }
            v12 = v18;
            v8 = v36;
          }
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v11);
  }

}

- (void)_clearLocalReports
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  id obj;
  MPCStatisticsReporter *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  MPCStatisticsReporter *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writerQueue);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = self;
  -[MPCStatisticsReporter _reportDirectoryURL](self, "_reportDirectoryURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  objc_msgSend(v3, "enumeratorAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v28, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v26;
    v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Removing local report files in %{public}@", buf, 0x16u);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v31;
    *(_QWORD *)&v9 = 138543874;
    v24 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "pathExtension", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("json")))
        {

        }
        else
        {
          objc_msgSend(v13, "pathExtension");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("csv"));

          if (!v16)
            continue;
        }
        objc_msgSend(v28, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingPathComponent:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v35 = v26;
          v36 = 2114;
          v37 = v18;
          _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Removing %{public}@", buf, 0x16u);
        }

        v29 = 0;
        v20 = objc_msgSend(v27, "removeItemAtPath:error:", v18, &v29);
        v21 = v29;
        v22 = v21;
        if (!v20 || v21)
        {
          v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v35 = v26;
            v36 = 2114;
            v37 = v18;
            v38 = 2114;
            v39 = v22;
            _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Failed to remove: %{public}@ - error:%{public}@", buf, 0x20u);
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v10);
  }

}

- (id)_reportDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writerQueue);
  v2 = (void *)MEMORY[0x24BDBCF48];
  MSVMobileHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = CFSTR("Media/Espresso/Analytics");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  }
  return v5;
}

- (id)_reportingFileForRecorder:(id)a3 extension:(id)a4
{
  id v6;
  NSObject *writerQueue;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  writerQueue = self->_writerQueue;
  v8 = a3;
  dispatch_assert_queue_V2(writerQueue);
  MSVGetDeviceProductType();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("Unknown");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  -[MPCStatisticsReporter recordScenarioName](self, "recordScenarioName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "modelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@__%@"), v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("__%@"), v13);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  objc_msgSend(v16, "stringByAppendingString:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCStatisticsReporter _reportDirectoryURL](self, "_reportDirectoryURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingPathComponent:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)_writeSamplesFromRecorder:(id)a3
{
  NSObject *writerQueue;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  writerQueue = self->_writerQueue;
  v5 = a3;
  dispatch_assert_queue_V2(writerQueue);
  -[MPCStatisticsReporter _reportingFileForRecorder:extension:](self, "_reportingFileForRecorder:extension:", v5, CFSTR(".csv"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v9) ^ 1;

  objc_msgSend(v5, "flushSamplesToCSVDataWithHeader:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[MPCStatisticsReporter _writeData:toFileAtPath:](self, "_writeData:toFileAtPath:", v8, v9);

}

- (void)_writeData:(id)a3 toFileAtPath:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  MPCStatisticsReporter *v31;
  __int16 v32;
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writerQueue);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v28 = 0;
      v12 = -[NSObject seekToEndReturningOffset:error:](v10, "seekToEndReturningOffset:error:", 0, &v28);
      v13 = v28;
      v14 = v13;
      if (!v12 || v13)
      {
        v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v31 = self;
          v32 = 2114;
          v33 = v14;
          _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Unable to seek to file for records update - error: %{public}@", buf, 0x16u);
        }

        goto LABEL_25;
      }
      v27 = 0;
      -[NSObject writeData:error:](v11, "writeData:error:", v6, &v27);
      v15 = v27;
      v14 = v27;
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v31 = self;
          v32 = 2114;
          v33 = v14;
          v18 = "[AP] - %{public}@ - Unable to write data for records update - error: %{public}@";
          v19 = v17;
          v20 = OS_LOG_TYPE_ERROR;
LABEL_23:
          _os_log_impl(&dword_210BD8000, v19, v20, v18, buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v31 = self;
        v32 = 2114;
        v33 = v7;
        v18 = "[AP] - %{public}@ - Records update successful at %{public}@";
        v19 = v17;
        v20 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_23;
      }

      -[NSObject closeFile](v11, "closeFile");
      goto LABEL_25;
    }
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      v23 = "[AP] - %{public}@ - Unable to open file for records update";
      v24 = v14;
      v25 = 12;
      goto LABEL_17;
    }
    goto LABEL_25;
  }
  v29 = 0;
  v21 = objc_msgSend(v6, "writeToFile:options:error:", v7, 0, &v29);
  v11 = v29;
  v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v14 = v22;
  if (!v21 || v11)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      v32 = 2114;
      v33 = v11;
      v23 = "[AP] - %{public}@ - Unable to create file for records - error: %{public}@";
      v24 = v14;
      v25 = 22;
LABEL_17:
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
    }
LABEL_25:

    goto LABEL_26;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = self;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Records creation successful at %{public}@", buf, 0x16u);
  }
  v11 = v14;
LABEL_26:

}

- (id)coreAnalyticsEventName
{
  return CFSTR("com.apple.music.mediaplayback.dsp.evaluation");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPCStatisticsReporter recordScenarioName](self, "recordScenarioName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - recordScenarioName:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_writerQueue, 0);
}

id __43__MPCStatisticsReporter__sendAnalyticsData__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __30__MPCStatisticsReporter_flush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsData");
}

uint64_t __47__MPCStatisticsReporter_reportRecordedResults___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isStoringSamples"))
    objc_msgSend(*(id *)(a1 + 40), "_writeSamplesFromRecorder:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_writeAnalyticsDataFromRecorder:", *(_QWORD *)(a1 + 32));
}

uint64_t __29__MPCStatisticsReporter_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsData");
  return objc_msgSend(*(id *)(a1 + 32), "_clearLocalReports");
}

@end
