@implementation MFMailDropAttachmentDataProvider

- (MFMailDropAttachmentDataProvider)initWithLibrary:(id)a3
{
  id v4;
  MFMailDropAttachmentDataProvider *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *requests;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailDropAttachmentDataProvider;
  v5 = -[MFAttachmentLibraryDataProvider initWithLibrary:](&v9, sel_initWithLibrary_, v4);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requests = v5->_requests;
    v5->_requests = v6;

  }
  return v5;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MFMailDropAttachmentDataProvider_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1)
    dispatch_once(&log_onceToken_13, block);
  return (OS_os_log *)(id)log_log_13;
}

void __39__MFMailDropAttachmentDataProvider_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;

}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _MFAttachmentActiveRequest *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  _MFAttachmentActiveRequest *v37;
  void *v38;
  void *v39;
  id v40;
  void (**v41)(id, uint64_t, id, _QWORD);
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _BYTE buf[12];
  __int16 v51;
  void *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v40 = a5;
  v41 = (void (**)(id, uint64_t, id, _QWORD))a6;
  v12 = objc_alloc(MEMORY[0x1E0D46120]);
  v53[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v12, "initWithConsumers:expectedSize:", v13, objc_msgSend(v10, "encodedFileSize"));

  v14 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __88__MFMailDropAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  v48[3] = &unk_1E4E8B970;
  v15 = v40;
  v49 = v15;
  objc_msgSend(v42, "setProgressBlock:", v48);
  if (objc_msgSend(v10, "isDataAvailableLocally"))
  {
    v16 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v10, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v16, "dataWithContentsOfFile:options:error:", v17, 1, &v47);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v47;

    v20 = v18 != 0;
    if (v18)
    {
      objc_msgSend(v42, "appendData:", v18);
      v21 = 0;
      v20 = 1;
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    objc_msgSend(v10, "mailDropMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "directUrl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[MFMailDropAttachmentDataProvider _defaultDownloadSessionForAttachment:](self, "_defaultDownloadSessionForAttachment:", v10);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFMailDropAttachmentDataProvider log](MFMailDropAttachmentDataProvider, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        v51 = 2112;
        v52 = v38;
        _os_log_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_DEFAULT, "Downloading Mail Drop attachment: %@ using URL session: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMetadataValue:forKey:");
      objc_msgSend(v10, "setMetadataValue:forKey:", v42, CFSTR("primaryConsumer"));
      objc_msgSend(v10, "mailDropMetadata");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = -[_MFAttachmentActiveRequest initWithAttachment:]([_MFAttachmentActiveRequest alloc], "initWithAttachment:", v10);
      v26 = self->_requests;
      objc_sync_enter(v26);
      v37 = v25;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", v25, v39);
      objc_sync_exit(v26);

      -[_MFAttachmentActiveRequest downloadProgress](v25, "downloadProgress");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addChild:withPendingUnitCount:", v27, objc_msgSend(v15, "totalUnitCount"));

      objc_msgSend(v38, "downloadTaskWithURL:", v18);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTaskDescription:", v39);
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v10);
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D1EE90];
      v44[0] = v14;
      v44[1] = 3221225472;
      v44[2] = __88__MFMailDropAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke_18;
      v44[3] = &unk_1E4E8CD90;
      objc_copyWeak(&v46, (id *)buf);
      v30 = v35;
      v45 = v30;
      objc_msgSend(v29, "tokenWithCancelationBlock:", v44);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addCancelable:", v31);

      objc_msgSend(v30, "resume");
      objc_msgSend(v36, "future");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      objc_msgSend(v32, "result:", &v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v43;
      v20 = objc_msgSend(v33, "BOOLValue");

      objc_msgSend(v10, "setMetadataValue:forKey:", 0, CFSTR("downloadPromise"));
      objc_msgSend(v10, "setMetadataValue:forKey:", 0, CFSTR("primaryConsumer"));
      v34 = self->_requests;
      objc_sync_enter(v34);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0, v39);
      objc_sync_exit(v34);

      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);

      v21 = v20;
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v19 = 0;
    }
  }

  objc_msgSend(v42, "done");
  objc_msgSend(v11, "done");
  v41[2](v41, v20, v19, v21);

}

uint64_t __88__MFMailDropAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", a4);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", a2);
}

void __88__MFMailDropAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[MFMailDropAttachmentDataProvider log](MFMailDropAttachmentDataProvider, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Canceling download for Mail Drop attachment %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)_defaultDownloadSessionForAttachment:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t *v6;
  _QWORD v8[5];
  _QWORD block[5];

  objc_msgSend(a3, "mailDropMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileSize");

  if (v5 >> 22 > 0x18)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__MFMailDropAttachmentDataProvider__defaultDownloadSessionForAttachment___block_invoke_2;
    v8[3] = &unk_1E4E88DC8;
    v8[4] = self;
    if (_defaultDownloadSessionForAttachment__wifiOnlySessionOnceToken != -1)
      dispatch_once(&_defaultDownloadSessionForAttachment__wifiOnlySessionOnceToken, v8);
    v6 = &_defaultDownloadSessionForAttachment__wifiOnlySession;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MFMailDropAttachmentDataProvider__defaultDownloadSessionForAttachment___block_invoke;
    block[3] = &unk_1E4E88DC8;
    block[4] = self;
    if (_defaultDownloadSessionForAttachment__defaultSessionOnceToken != -1)
      dispatch_once(&_defaultDownloadSessionForAttachment__defaultSessionOnceToken, block);
    v6 = &_defaultDownloadSessionForAttachment__defaultSession;
  }
  return (id)*v6;
}

void __73__MFMailDropAttachmentDataProvider__defaultDownloadSessionForAttachment___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C92C98];
  downloadConfiguration((uint64_t)CFSTR("com.apple.mobilemail.MailDropDownload"), 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sessionWithConfiguration:delegate:delegateQueue:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_defaultDownloadSessionForAttachment__defaultSession;
  _defaultDownloadSessionForAttachment__defaultSession = v1;

}

void __73__MFMailDropAttachmentDataProvider__defaultDownloadSessionForAttachment___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C92C98];
  downloadConfiguration((uint64_t)CFSTR("com.apple.mobilemail.MailDropDownloadWIFIOnly"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sessionWithConfiguration:delegate:delegateQueue:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_defaultDownloadSessionForAttachment__wifiOnlySession;
  _defaultDownloadSessionForAttachment__wifiOnlySession = v1;

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *requests;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = a5;
  v8 = self->_requests;
  objc_sync_enter(v8);
  requests = self->_requests;
  objc_msgSend(v15, "taskDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](requests, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  objc_msgSend(v11, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadataValueForKey:", CFSTR("downloadPromise"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v13, "finishWithError:", v7);
  }
  else
  {
    +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithError:", v14);

  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *requests;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v7 = a5;
  v8 = self->_requests;
  objc_sync_enter(v8);
  requests = self->_requests;
  objc_msgSend(v19, "taskDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](requests, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  objc_msgSend(v11, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadataValueForKey:", CFSTR("primaryConsumer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(v7, "resourceSpecifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataWithContentsOfFile:options:error:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v13, "appendData:", v16);
  objc_msgSend(v12, "metadataValueForKey:", CFSTR("downloadPromise"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16 != 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "finishWithResult:", v18);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  NSMutableDictionary *v9;
  NSMutableDictionary *requests;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = self->_requests;
  objc_sync_enter(v9);
  requests = self->_requests;
  objc_msgSend(v14, "taskDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](requests, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v9);
  objc_msgSend(v12, "downloadProgress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompletedUnitCount:", a6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
