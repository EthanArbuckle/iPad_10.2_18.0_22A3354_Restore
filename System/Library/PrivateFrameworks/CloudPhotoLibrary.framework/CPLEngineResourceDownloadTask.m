@implementation CPLEngineResourceDownloadTask

- (CPLEngineResourceDownloadTask)initWithResource:(id)a3 taskIdentifier:(id)a4 target:(id)a5 launchHandler:(id)a6 cancelHandler:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CPLEngineResourceDownloadTask *v23;
  CPLEngineResourceDownloadTask *v24;
  NSMutableArray *v25;
  NSMutableArray *stateProgressDates;
  uint64_t v27;
  uint64_t v28;
  id launchHandler;
  uint64_t v30;
  id cancelHandler;
  uint64_t v32;
  id didStartHandler;
  uint64_t v34;
  id progressHandler;
  uint64_t v36;
  id completionHandler;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  objc_super v57;

  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v57.receiver = self;
  v57.super_class = (Class)CPLEngineResourceDownloadTask;
  v23 = -[CPLResourceTransferTask initWithResource:taskIdentifier:](&v57, sel_initWithResource_taskIdentifier_, a3, a4);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_target, a5);
    if (_CPLEngineResourceDownloadTaskReportStateProgress)
    {
      v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      stateProgressDates = v24->_stateProgressDates;
      v24->_stateProgressDates = v25;

      v27 = MEMORY[0x1E0C809B0];
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke;
      v55[3] = &unk_1E60D9688;
      v56 = v18;
      v28 = objc_msgSend(v55, "copy");
      launchHandler = v24->_launchHandler;
      v24->_launchHandler = (id)v28;

      v30 = objc_msgSend(v19, "copy");
      cancelHandler = v24->_cancelHandler;
      v24->_cancelHandler = (id)v30;

      v53[0] = v27;
      v53[1] = 3221225472;
      v53[2] = __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_2;
      v53[3] = &unk_1E60D9688;
      v54 = v20;
      v32 = objc_msgSend(v53, "copy");
      didStartHandler = v24->_didStartHandler;
      v24->_didStartHandler = (id)v32;

      v51[0] = v27;
      v51[1] = 3221225472;
      v51[2] = __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_3;
      v51[3] = &unk_1E60D96B0;
      v52 = v21;
      v34 = objc_msgSend(v51, "copy");
      progressHandler = v24->_progressHandler;
      v24->_progressHandler = (id)v34;

      v49[0] = v27;
      v49[1] = 3221225472;
      v49[2] = __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_4;
      v49[3] = &unk_1E60D96D8;
      v50 = v22;
      v36 = objc_msgSend(v49, "copy");
      completionHandler = v24->_completionHandler;
      v24->_completionHandler = (id)v36;

      v38 = v56;
    }
    else
    {
      v39 = objc_msgSend(v18, "copy");
      v40 = v24->_launchHandler;
      v24->_launchHandler = (id)v39;

      v41 = objc_msgSend(v19, "copy");
      v42 = v24->_cancelHandler;
      v24->_cancelHandler = (id)v41;

      v43 = objc_msgSend(v20, "copy");
      v44 = v24->_didStartHandler;
      v24->_didStartHandler = (id)v43;

      v45 = objc_msgSend(v21, "copy");
      v46 = v24->_progressHandler;
      v24->_progressHandler = (id)v45;

      v47 = objc_msgSend(v22, "copy");
      v38 = v24->_completionHandler;
      v24->_completionHandler = (id)v47;
    }

  }
  return v24;
}

- (NSData)transportScope
{
  CPLTransportScopeMapping *transportScopeMapping;
  void *v3;
  void *v4;
  void *v5;

  transportScopeMapping = self->_transportScopeMapping;
  if (!transportScopeMapping)
    __assert_rtn("-[CPLEngineResourceDownloadTask transportScope]", "CPLEngineResourceDownloadTask.m", 95, "_transportScopeMapping");
  -[CPLResource itemScopedIdentifier](self->_cloudResource, "itemScopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLTransportScopeMapping objectForKeyedSubscript:](transportScopeMapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (void)setTransportScope:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CPLEngineResourceDownloadTask setTransportScope:]", "CPLEngineResourceDownloadTask.m", 100, "0");
}

- (void)associateCloudResource:(id)a3 ofRecord:(id)a4
{
  CPLResource *v6;
  CPLPlaceholderRecord *v7;
  CPLResource *cloudResource;
  CPLPlaceholderRecord *cloudRecord;
  CPLResource *v10;

  v6 = (CPLResource *)a3;
  v7 = (CPLPlaceholderRecord *)a4;
  cloudResource = self->_cloudResource;
  self->_cloudResource = v6;
  v10 = v6;

  cloudRecord = self->_cloudRecord;
  self->_cloudRecord = v7;

}

- (void)launch
{
  (*((void (**)(void))self->_launchHandler + 2))();
}

- (void)cancelTask
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLEngineResourceDownloadTask;
  -[CPLResourceTransferTask cancelTask](&v3, sel_cancelTask);
  (*((void (**)(void))self->_cancelHandler + 2))();
}

- (BOOL)willGenerateReport
{
  return _CPLEngineResourceDownloadTaskReportStateProgress
      && -[CPLResourceTransferTask isHighPriority](self, "isHighPriority");
}

- (void)noteStateDidProgress:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  NSString *transportIdentifier;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[CPLEngineResourceDownloadTask willGenerateReport](self, "willGenerateReport"))
  {
    v5 = -[NSMutableArray count](self->_stateProgressDates, "count");
    if (v5 >= a3)
    {
      v6 = v5;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      while (v6 <= a3)
      {
        -[NSMutableArray addObject:](self->_stateProgressDates, "addObject:", v7);
        ++v6;
      }
      if (a3 != 3)
        goto LABEL_24;
      -[CPLResourceTransferTask resource](self, "resource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(CFSTR("[launch]"), "mutableCopy");
      -[NSMutableArray objectAtIndexedSubscript:](self->_stateProgressDates, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != 3; ++i)
      {
        v11 = v9;
        -[NSMutableArray objectAtIndexedSubscript:](self->_stateProgressDates, "objectAtIndexedSubscript:", i + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", v11);
        objc_msgSend(v8, "appendFormat:", CFSTR("-( %.1fs)-[%@]"), v12, off_1E60D9718[i]);

      }
      v13 = (void *)MEMORY[0x1E0CB34E8];
      objc_msgSend(v28, "identity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromByteCount:countStyle:", objc_msgSend(v14, "fileSize"), 1);
      v15 = objc_claimAutoreleasedReturnValue();

      +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", objc_msgSend(v28, "resourceType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_stateProgressDates, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:", v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_preemptingCount)
        v18 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\n- Preempted %lu times"), self->_preemptingCount);
      else
        v18 = &stru_1E60DF6B8;
      if (self->_activeQueuesStatusAtEnqueingTime)
        v19 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\n- Competing tasks when enqueued:\n%@"), self->_activeQueuesStatusAtEnqueingTime);
      else
        v19 = &stru_1E60DF6B8;
      v20 = (void *)v15;
      if (self->_transportIdentifier)
      {
        if (!_CPLSilentLogging)
        {
          __CPLProgressOSLogDomain();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v28, "itemScopedIdentifier");
            v22 = v18;
            v23 = v16;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            transportIdentifier = self->_transportIdentifier;
            *(_DWORD *)buf = 138414082;
            v30 = v23;
            v31 = 2112;
            v32 = v15;
            v33 = 2112;
            v34 = v24;
            v35 = 2112;
            v36 = v8;
            v37 = 2112;
            v38 = v27;
            v39 = 2112;
            v40 = (__CFString *)transportIdentifier;
            v41 = 2112;
            v42 = v19;
            v43 = 2112;
            v44 = v22;
            _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "[%@ (%@) %@]: %@ [launch: %@] [transport ID: %@]%@%@", buf, 0x52u);

            v16 = v23;
            v18 = v22;
            v20 = (void *)v15;
          }
LABEL_22:

        }
      }
      else if (!_CPLSilentLogging)
      {
        __CPLProgressOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v28, "itemScopedIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413826;
          v30 = v16;
          v31 = 2112;
          v32 = v15;
          v33 = 2112;
          v34 = v26;
          v35 = 2112;
          v36 = v8;
          v37 = 2112;
          v38 = v27;
          v39 = 2112;
          v40 = v19;
          v41 = 2112;
          v42 = v18;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "[%@ (%@) %@]: %@ [launch: %@]%@%@", buf, 0x48u);

        }
        goto LABEL_22;
      }

LABEL_24:
    }
  }
}

- (void)noteActiveQueuesStatusAtEnqueingTime:(id)a3
{
  NSString *v4;
  NSString *activeQueuesStatusAtEnqueingTime;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  activeQueuesStatusAtEnqueingTime = self->_activeQueuesStatusAtEnqueingTime;
  self->_activeQueuesStatusAtEnqueingTime = v4;

}

- (void)noteTaskHasBeenPreempted
{
  ++self->_preemptingCount;
}

- (CPLResource)cloudResource
{
  return self->_cloudResource;
}

- (CPLPlaceholderRecord)cloudRecord
{
  return self->_cloudRecord;
}

- (CPLRecordTarget)target
{
  return self->_target;
}

- (CPLTransportScopeMapping)transportScopeMapping
{
  return self->_transportScopeMapping;
}

- (void)setTransportScopeMapping:(id)a3
{
  objc_storeStrong((id *)&self->_transportScopeMapping, a3);
}

- (unint64_t)taskIdentifierForQueue
{
  return self->_taskIdentifierForQueue;
}

- (void)setTaskIdentifierForQueue:(unint64_t)a3
{
  self->_taskIdentifierForQueue = a3;
}

- (BOOL)isCancelledByEngine
{
  return self->_cancelledByEngine;
}

- (void)setCancelledByEngine:(BOOL)a3
{
  self->_cancelledByEngine = a3;
}

- (CPLEngineTransportResourcesDownloadTask)transportTask
{
  return (CPLEngineTransportResourcesDownloadTask *)objc_loadWeakRetained((id *)&self->_transportTask);
}

- (void)setTransportTask:(id)a3
{
  objc_storeWeak((id *)&self->_transportTask, a3);
}

- (id)launchHandler
{
  return self->_launchHandler;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_launchHandler, 0);
  objc_destroyWeak((id *)&self->_transportTask);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_cloudResource, 0);
  objc_storeStrong((id *)&self->_activeQueuesStatusAtEnqueingTime, 0);
  objc_storeStrong((id *)&self->_stateProgressDates, 0);
}

void __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "noteStateDidProgress:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "noteStateDidProgress:", 1);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, float a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "noteStateDidProgress:", 2);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, float))(v5 + 16))(v5, v6, a3);

}

void __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v7, "noteStateDidProgress:", 3);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

+ (void)initialize
{
  void *v2;
  NSObject *v4;
  uint8_t v5[16];

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _CPLEngineResourceDownloadTaskReportStateProgress = objc_msgSend(v2, "BOOLForKey:", CFSTR("CPLReportDownloadStateProgress"));

    if (_CPLEngineResourceDownloadTaskReportStateProgress && _CPLSilentLogging == 0)
    {
      __CPLProgressOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Will report high priority download stats", v5, 2u);
      }

    }
  }
}

+ (unint64_t)maximumResourceDownloadSizeForResourceType:(unint64_t)a3
{
  return 10485760;
}

@end
