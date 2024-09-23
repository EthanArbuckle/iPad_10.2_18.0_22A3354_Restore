@implementation NTKDebugRadarArgonErrorReporterQueue

- (NTKDebugRadarArgonErrorReporterQueue)initWithQueueDirectoryPath:(id)a3
{
  id v4;
  NTKDebugRadarArgonErrorReporterQueue *v5;
  uint64_t v6;
  NSString *queueDirectoryPath;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  void *v12;
  NTKFirstUnlockQueue *v13;
  NTKFirstUnlockQueue *unlockQueue;
  NTKFirstUnlockQueue *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NTKDebugRadarArgonErrorReporterQueue;
  v5 = -[NTKDebugRadarArgonErrorReporterQueue init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    queueDirectoryPath = v5->_queueDirectoryPath;
    v5->_queueDirectoryPath = (NSString *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.nanotimekit.facesupport.taptoradar", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    objc_initWeak(&location, v5);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke;
    aBlock[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v22, &location);
    v12 = _Block_copy(aBlock);
    v13 = -[NTKFirstUnlockQueue initWithName:]([NTKFirstUnlockQueue alloc], "initWithName:", "com.apple.nanotimekit.facesupport.taptoradar.firstunlock");
    unlockQueue = v5->_unlockQueue;
    v5->_unlockQueue = v13;

    v15 = v5->_unlockQueue;
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke_3;
    v18[3] = &unk_1E6BD1890;
    objc_copyWeak(&v20, &location);
    v16 = v12;
    v19 = v16;
    -[NTKFirstUnlockQueue dispatch:](v15, "dispatch:", v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke_2;
  block[3] = &unk_1E6BCD5F0;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

uint64_t __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCanSubmitReports:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleEnqueuedReports");
}

void __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)enqueueReportWithTitle:(id)a3 description:(id)a4 attachmentURLs:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(a5, "copy");
  -[NTKDebugRadarArgonErrorReporterQueue queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__NTKDebugRadarArgonErrorReporterQueue_enqueueReportWithTitle_description_attachmentURLs___block_invoke;
  v15[3] = &unk_1E6BD17F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __90__NTKDebugRadarArgonErrorReporterQueue_enqueueReportWithTitle_description_attachmentURLs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enqueueReportWithTitle:description:attachmentURLs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_queue_deleteStagedReports
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "LS of path %@ failed %@");
  OUTLINED_FUNCTION_1();
}

- (void)_queue_handleEnqueuedReports
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't find URLs at %@ - %@");
  OUTLINED_FUNCTION_1();
}

id __68__NTKDebugRadarArgonErrorReporterQueue__queue_handleEnqueuedReports__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);

  return v4;
}

void __68__NTKDebugRadarArgonErrorReporterQueue__queue_handleEnqueuedReports__block_invoke_24(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "present");
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      v5 = "User chose to create bug report.";
LABEL_6:
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    v5 = "User chose not to create bug report.";
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__NTKDebugRadarArgonErrorReporterQueue__queue_handleEnqueuedReports__block_invoke_25;
  block[3] = &unk_1E6BCD5F0;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v6, block);

}

uint64_t __68__NTKDebugRadarArgonErrorReporterQueue__queue_handleEnqueuedReports__block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deleteStagedReports");
}

- (void)queue_enqueueReportWithTitle:(id)a3 description:(id)a4 attachmentURLs:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void *, _QWORD, const __CFString *);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NTKDebugRadarArgonErrorReporterQueue *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD aBlock[4];
  NSObject *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NTKDebugRadarArgonErrorReporterQueue queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  if (objc_msgSend(v12, "count"))
  {
    v43 = v8;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKDebugRadarArgonErrorReporterQueue queueDirectoryPath](self, "queueDirectoryPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("URLs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    LOBYTE(v13) = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v52);
    v42 = v52;
    if ((v13 & 1) != 0)
    {
      v36 = v15;
      v37 = self;
      v38 = v14;
      v40 = v10;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __96__NTKDebugRadarArgonErrorReporterQueue_queue_enqueueReportWithTitle_description_attachmentURLs___block_invoke;
      aBlock[3] = &unk_1E6BD60B0;
      v35 = v16;
      v51 = v16;
      v19 = (void (**)(void *, _QWORD, const __CFString *))_Block_copy(aBlock);
      ((void (**)(void *, id, const __CFString *))v19)[2](v19, v43, CFSTR("title.utf8"));
      v33 = v19;
      v41 = v9;
      ((void (**)(void *, id, const __CFString *))v19)[2](v19, v9, CFSTR("description.utf8"));
      v34 = v17;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v39 = v12;
      obj = v12;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v47 != v23)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v25, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "URLByAppendingPathComponent:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0;
            v28 = objc_msgSend(v18, "copyItemAtURL:toURL:error:", v25, v27, &v45);
            v29 = v45;
            if ((v28 & 1) == 0)
            {
              _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v54 = v25;
                v55 = 2112;
                v56 = v27;
                v57 = 2112;
                v58 = v29;
                _os_log_error_impl(&dword_1B72A3000, v30, OS_LOG_TYPE_ERROR, "Couldn't copy URL from %@ to %@ - %@", buf, 0x20u);
              }

            }
          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
        }
        while (v22);
      }

      -[NTKDebugRadarArgonErrorReporterQueue _queue_handleEnqueuedReports](v37, "_queue_handleEnqueuedReports");
      v31 = v51;
      v10 = v40;
      v9 = v41;
      v14 = v38;
      v12 = v39;
      v16 = v35;
      v15 = v36;
      v17 = v34;
    }
    else
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = v42;
        -[NTKDebugRadarArgonErrorReporterQueue queue_enqueueReportWithTitle:description:attachmentURLs:].cold.1();
        goto LABEL_17;
      }
    }
    v32 = v42;
LABEL_17:

    v8 = v43;
  }

}

void __96__NTKDebugRadarArgonErrorReporterQueue_queue_enqueueReportWithTitle_description_attachmentURLs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "writeToFile:atomically:", v8, 1) & 1) == 0)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __96__NTKDebugRadarArgonErrorReporterQueue_queue_enqueueReportWithTitle_description_attachmentURLs___block_invoke_cold_1();

  }
}

- (NSString)queueDirectoryPath
{
  return self->_queueDirectoryPath;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NTKFirstUnlockQueue)unlockQueue
{
  return self->_unlockQueue;
}

- (BOOL)canSubmitReports
{
  return self->_canSubmitReports;
}

- (void)setCanSubmitReports:(BOOL)a3
{
  self->_canSubmitReports = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queueDirectoryPath, 0);
}

- (void)queue_enqueueReportWithTitle:description:attachmentURLs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't create report for path %@ - %@");
  OUTLINED_FUNCTION_1();
}

void __96__NTKDebugRadarArgonErrorReporterQueue_queue_enqueueReportWithTitle_description_attachmentURLs___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't write %@ to %@");
  OUTLINED_FUNCTION_1();
}

@end
