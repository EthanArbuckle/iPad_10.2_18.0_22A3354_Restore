@implementation VCPDownloadManager

- (VCPDownloadManager)init
{
  VCPDownloadManager *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *mutex;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *semaphore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPDownloadManager;
  v2 = -[VCPDownloadManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    mutex = v2->_mutex;
    v2->_mutex = (OS_dispatch_semaphore *)v3;

    v5 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v5;

  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_72);
  return (id)sharedManager_instance_0;
}

void __35__VCPDownloadManager_sharedManager__block_invoke()
{
  VCPDownloadManager *v0;
  void *v1;

  v0 = objc_alloc_init(VCPDownloadManager);
  v1 = (void *)sharedManager_instance_0;
  sharedManager_instance_0 = (uint64_t)v0;

}

+ (unint64_t)maxSizeBytes
{
  return 10485760;
}

+ (void)_reportDownload:(unint64_t)a3
{
  void *v4;
  qos_class_t v5;
  void *v6;
  void *v7;
  void *v8;
  qos_class_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    VCPTaskIDDescription(1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = qos_class_self();
    VCPMAQoSDescription(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = CFSTR("com.apple.mediaanalysisd.das.dutycycle.task");
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[DAS QoS] %@: %@ (%@) download %lu bytes", buf, 0x2Au);

  }
  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  VCPTaskIDDescription(1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = qos_class_self();
  VCPMAQoSDescription(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3, CFSTR("taskName"), CFSTR("QoS"), CFSTR("DownloadAssetCount"), CFSTR("DownloadBytes"), v8, v10, &unk_1E6B74C60);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.das.dutycycle.task"), v12);

}

- (id)requestDownloadOfResource:(id)a3
{
  uint64_t v3;
  id v5;
  NSString *localIdentifier;
  void *v7;
  int v8;
  id v9;
  void *v10;
  unint64_t length;
  void *v12;
  NSMutableData *v13;
  NSMutableData *buffer;
  id v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  dispatch_time_t v25;
  uint64_t (**v26)(void);
  int v27;
  void *v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  dispatch_time_t v32;
  NSString *v33;
  NSString *v34;
  id v35;
  void *v36;
  unint64_t v37;
  int v38;
  void *v39;
  void *context;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[10];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  dispatch_semaphore_t v51;
  uint8_t v52[8];
  _QWORD v53[4];
  _QWORD aBlock[5];
  id v55;
  uint64_t *v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[5];
  _BYTE buf[24];
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "fileSize") > 0xA00000)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Requested resource exceeds maximum supported size", buf, 2u);
    }
    v3 = 0;
    goto LABEL_51;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutex, 0xFFFFFFFFFFFFFFFFLL);
  localIdentifier = self->_localIdentifier;
  objc_msgSend(v5, "assetLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(localIdentifier) = -[NSString isEqualToString:](localIdentifier, "isEqualToString:", v7);

  v8 = MediaAnalysisLogLevel();
  if ((_DWORD)localIdentifier)
  {
    if (v8 >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Resource already in the buffer. Skip downloading.", buf, 2u);
    }
    v9 = objc_alloc(MEMORY[0x1E0C99D50]);
    v10 = -[NSMutableData mutableBytes](self->_buffer, "mutableBytes");
    length = self->_length;
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __48__VCPDownloadManager_requestDownloadOfResource___block_invoke;
    v62[3] = &unk_1E6B1A5D0;
    v62[4] = self;
    v3 = objc_msgSend(v9, "initWithBytesNoCopy:length:deallocator:", v10, length, v62);
    goto LABEL_51;
  }
  if (v8 >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "assetLocalIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] requestDownloadOfResource: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v64 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  context = (void *)MEMORY[0x1BCCA1B2C]();
  if (self->_buffer
    || (objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 10485760, context),
        v13 = (NSMutableData *)objc_claimAutoreleasedReturnValue(),
        buffer = self->_buffer,
        self->_buffer = v13,
        buffer,
        self->_buffer))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CD1468]);
    objc_msgSend(v15, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v15, "setDownloadIsTransient:", 1);
    objc_msgSend(v15, "setProgressHandler:", &__block_literal_global_138_0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_139;
    aBlock[3] = &unk_1E6B1A618;
    v56 = &v58;
    aBlock[4] = self;
    v16 = v5;
    v55 = v16;
    v57 = buf;
    v43 = _Block_copy(aBlock);
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v53[3] = 0;
    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)v52 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PHAssetResourceManager_requestDataForAssetResource", ", v52, 2u);
    }

    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__46;
    v50 = __Block_byref_object_dispose__46;
    v51 = dispatch_semaphore_create(0);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_141;
    v45[3] = &unk_1E6B1A640;
    v45[4] = self;
    v45[5] = buf;
    v45[6] = &v58;
    v45[7] = v53;
    v45[8] = &v46;
    v45[9] = v18;
    v42 = _Block_copy(v45);
    objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v21, "requestDataForAssetResource:options:dataReceivedHandler:completionHandler:", v16, v15, v43, v42);

    if ((_DWORD)v3)
    {
      -[VCPDownloadManager cancel](self, "cancel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = -100000000;
        while (1)
        {
          v24 = v47[5];
          v25 = dispatch_time(0, 100000000);
          if (!dispatch_semaphore_wait(v24, v25))
            break;
          v23 += 100000000;
          if (v23 >= 0x3781BF501)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v52 = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Download resource timed-out", v52, 2u);
            }
            goto LABEL_44;
          }
          -[VCPDownloadManager cancel](self, "cancel");
          v26 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
          v27 = v26[2]();

          if (v27)
          {
            if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v52 = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelling download", v52, 2u);
            }
            objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager", context);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "cancelDataRequest:", v3);

            dispatch_semaphore_wait((dispatch_semaphore_t)v47[5], 0xFFFFFFFFFFFFFFFFLL);
            v29 = *(_QWORD *)&buf[8];
            v30 = -128;
            goto LABEL_45;
          }
        }
LABEL_38:
        if (!*(_DWORD *)(*(_QWORD *)&buf[8] + 24))
        {
          self->_length = v59[3];
          objc_msgSend(v16, "assetLocalIdentifier");
          v33 = (NSString *)objc_claimAutoreleasedReturnValue();
          v34 = self->_localIdentifier;
          self->_localIdentifier = v33;

          v35 = objc_alloc(MEMORY[0x1E0C99D50]);
          v36 = -[NSMutableData mutableBytes](self->_buffer, "mutableBytes");
          v37 = self->_length;
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_145;
          v44[3] = &unk_1E6B1A5D0;
          v44[4] = self;
          v3 = objc_msgSend(v35, "initWithBytesNoCopy:length:deallocator:", v36, v37, v44);
          v38 = 1;
LABEL_47:

          _Block_object_dispose(&v46, 8);
          _Block_object_dispose(v53, 8);

          goto LABEL_48;
        }
LABEL_46:
        v38 = 10;
        goto LABEL_47;
      }
      v31 = v47[5];
      v32 = dispatch_time(0, 15000000000);
      if (!dispatch_semaphore_wait(v31, v32))
        goto LABEL_38;
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Download resource timed-out", v52, 2u);
      }
LABEL_44:
      objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager", context);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "cancelDataRequest:", v3);

      dispatch_semaphore_wait((dispatch_semaphore_t)v47[5], 0xFFFFFFFFFFFFFFFFLL);
      v29 = *(_QWORD *)&buf[8];
      v30 = -925;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v3 = 16;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to issue resource request", v52, 2u);
        }
      }
      v29 = *(_QWORD *)&buf[8];
      v30 = -18;
    }
LABEL_45:
    *(_DWORD *)(v29 + 24) = v30;
    goto LABEL_46;
  }
  *(_DWORD *)(*(_QWORD *)&buf[8] + 24) = -18;
  v38 = 10;
LABEL_48:
  objc_autoreleasePoolPop(context);
  if (v38 == 10)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_mutex);
    v3 = 0;
  }
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(buf, 8);
LABEL_51:

  return (id)v3;
}

intptr_t __48__VCPDownloadManager_requestDownloadOfResource___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
}

void __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_136(double a1)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v2 = 134217984;
    v3 = a1;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Download progress: %.2f", (uint8_t *)&v2, 0xCu);
  }
}

void __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v5 = objc_msgSend(v3, "length") + v4;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "length");
  v7 = MediaAnalysisLogLevel();
  if (v5 <= v6)
  {
    if (v7 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(v3, "length");
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v10 = objc_msgSend(v3, "length") + v9;
      v11 = objc_msgSend(*(id *)(a1 + 40), "fileSize");
      v14 = 134218496;
      v15 = v8;
      v16 = 2048;
      v17 = v10;
      v18 = 2048;
      v19 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "    Received %llu bytes (Overall: %llu/%llu)", (uint8_t *)&v14, 0x20u);
    }
    v12 = (void *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "mutableBytes")
                 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v13 = objc_retainAutorelease(v3);
    memcpy(v12, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v13, "length");
  }
  else
  {
    if (v7 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Data received exceeds maximum supported size", (uint8_t *)&v14, 2u);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -18;
  }

}

void __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_141(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to download asset resource (%@)", (uint8_t *)&v9, 0xCu);

    }
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -18;
  }
  else
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Successfully downloaded asset resource", (uint8_t *)&v9, 2u);
    }
    objc_msgSend((id)objc_opt_class(), "_reportDownload:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  }
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = a1[9];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PHAssetResourceManager_requestDataForAssetResource", ", (uint8_t *)&v9, 2u);
  }

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[8] + 8) + 40));

}

intptr_t __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_145(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)flush
{
  NSMutableData *buffer;
  id cancel;
  NSString *localIdentifier;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutex, 0xFFFFFFFFFFFFFFFFLL);
  buffer = self->_buffer;
  self->_buffer = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  localIdentifier = self->_localIdentifier;
  self->_localIdentifier = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_mutex);
}

- (id)cancel
{
  return self->_cancel;
}

- (void)setCancel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancel, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_mutex, 0);
}

@end
