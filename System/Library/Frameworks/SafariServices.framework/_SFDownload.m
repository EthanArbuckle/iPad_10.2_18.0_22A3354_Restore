@implementation _SFDownload

- (_SFDownload)init
{
  _SFDownload *v2;
  _SFDownload *v3;
  uint64_t v4;
  NSDate *dateAdded;
  _SFDownload *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFDownload;
  v2 = -[_SFDownload init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_bytesExpected = -1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    dateAdded = v3->_dateAdded;
    v3->_dateAdded = (NSDate *)v4;

    v6 = v3;
  }

  return v3;
}

+ (id)provisionalDownloadWithMIMEType:(id)a3 request:(id)a4 response:(id)a5 filename:(id)a6 uti:(id)a7 userInitiatedAction:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v44;
  id obj;
  id v46;
  id v47;

  v14 = a3;
  obj = a4;
  v47 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v46 = a8;
  v18 = a8;
  v19 = (char *)objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v19 + 20);
  *((_QWORD *)v19 + 20) = v20;

  if (v16)
  {
    v22 = v16;
    v23 = (uint64_t *)(v19 + 88);
    v24 = (void *)*((_QWORD *)v19 + 11);
    *((_QWORD *)v19 + 11) = v22;
  }
  else
  {
    objc_msgSend(v15, "suggestedFilename");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safari_filenameByFixingIllegalCharacters");
    v25 = objc_claimAutoreleasedReturnValue();
    v23 = (uint64_t *)(v19 + 88);
    v26 = (void *)*((_QWORD *)v19 + 11);
    *((_QWORD *)v19 + 11) = v25;

  }
  v27 = (void *)*v23;
  if (*v23)
  {
    v28 = v17;
    v29 = v14;
    v30 = v15;
    v31 = a5;
    v32 = (void *)MEMORY[0x1E0D4ED18];
    objc_msgSend(v47, "URL");
    v44 = v16;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v32;
    a5 = v31;
    v15 = v30;
    v14 = v29;
    v17 = v28;
    objc_msgSend(v34, "properFilenameForOriginalFilename:typeIdentifier:mimeType:sourceURL:", v27, v28, v14, v33);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)*v23;
    *v23 = v35;

    v16 = v44;
  }
  objc_storeStrong((id *)v19 + 12, obj);
  v37 = objc_msgSend(v17, "copy");
  v38 = (void *)*((_QWORD *)v19 + 17);
  *((_QWORD *)v19 + 17) = v37;

  v39 = objc_msgSend(v14, "copy");
  v40 = (void *)*((_QWORD *)v19 + 18);
  *((_QWORD *)v19 + 18) = v39;

  *((_QWORD *)v19 + 5) = _SFDownloadingFileTypeFromUTIAndMIMEType(v17, v14);
  objc_msgSend(v47, "URL");
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)*((_QWORD *)v19 + 14);
  *((_QWORD *)v19 + 14) = v41;

  objc_storeStrong((id *)v19 + 16, v46);
  if (v15)
  {
    objc_storeStrong((id *)v19 + 19, a5);
    *((_QWORD *)v19 + 21) = objc_msgSend(v15, "expectedContentLength");
  }

  return v19;
}

+ (id)_sharedQueue
{
  if (_sharedQueue_onceToken != -1)
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_75);
  return (id)_sharedQueue_queue;
}

- (void)dealloc
{
  objc_super v3;

  -[SFDownloadFile invalidate](self->_completedFile, "invalidate");
  -[SFDownloadFile invalidate](self->_placeholderFile, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SFDownload;
  -[_SFDownload dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; identifier=%@>"),
                       objc_opt_class(),
                       self,
                       self->_identifier);
}

- (void)_cancelReportUpdatedProgressTimer
{
  NSTimer *reportUpdatedProgressTimer;

  -[NSTimer invalidate](self->_reportUpdatedProgressTimer, "invalidate");
  reportUpdatedProgressTimer = self->_reportUpdatedProgressTimer;
  self->_reportUpdatedProgressTimer = 0;

}

- (void)_reportUpdatedProgressSoon
{
  NSTimer *v3;
  NSTimer *reportUpdatedProgressTimer;
  id v5;

  if (!self->_reportUpdatedProgressTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__reportUpdatedProgressTimerFired_, 0, 0, 0.2);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    reportUpdatedProgressTimer = self->_reportUpdatedProgressTimer;
    self->_reportUpdatedProgressTimer = v3;

    -[NSTimer setTolerance:](self->_reportUpdatedProgressTimer, "setTolerance:", 0.2);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", self->_reportUpdatedProgressTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)_reportUpdatedProgressNow
{
  id v3;

  -[_SFDownload _cancelReportUpdatedProgressTimer](self, "_cancelReportUpdatedProgressTimer");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_SFDownloadDidChangeNotification"), self);

}

- (double)progress
{
  double result;
  int64_t bytesExpected;

  result = 1.0;
  if (self->_state != 4)
  {
    bytesExpected = self->_bytesExpected;
    if (bytesExpected < 1)
      return 0.0;
    else
      return (double)self->_bytesLoaded / (double)bytesExpected;
  }
  return result;
}

- (BOOL)isIdle
{
  return (self->_state < 5uLL) & (0x1Du >> self->_state);
}

- (void)removeFromDisk
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  _SFDownload *v12;
  id v13;
  uint64_t *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  -[NSString stringByDeletingLastPathComponent](self->_fileDownloadPath, "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = *MEMORY[0x1E0DC4878];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __29___SFDownload_removeFromDisk__block_invoke;
  v15[3] = &unk_1E4ABFC78;
  v15[4] = &v16;
  v6 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.RemoveDownload"), v15);
  v17[3] = v6;
  +[_SFDownload _sharedQueue](_SFDownload, "_sharedQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __29___SFDownload_removeFromDisk__block_invoke_2;
  block[3] = &unk_1E4AC7F68;
  v11 = v3;
  v12 = self;
  v13 = v4;
  v14 = &v16;
  v8 = v4;
  v9 = v3;
  dispatch_async(v7, block);

  _Block_object_dispose(&v16, 8);
}

- (void)removeDataAndPlaceholderFromDisk
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  SFDownloadFile *placeholderFile;
  _QWORD block[4];
  id v11;
  _SFDownload *v12;
  id v13;
  uint64_t *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  -[_SFDownload removeFromDisk](self, "removeFromDisk");
  -[SFDownloadFile URL](self->_placeholderFile, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = *MEMORY[0x1E0DC4878];
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke;
    v15[3] = &unk_1E4ABFC78;
    v15[4] = &v16;
    v6 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.RemoveDownloadPlaceholder"), v15);
    v17[3] = v6;
    +[_SFDownload _sharedQueue](_SFDownload, "_sharedQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_2;
    block[3] = &unk_1E4AC7F68;
    v11 = v3;
    v12 = self;
    v8 = v4;
    v13 = v8;
    v14 = &v16;
    dispatch_async(v7, block);

    -[SFDownloadFile invalidate](self->_placeholderFile, "invalidate");
    placeholderFile = self->_placeholderFile;
    self->_placeholderFile = 0;

    _Block_object_dispose(&v16, 8);
  }

}

- (void)cancel
{
  NSObject *v3;
  int v4;
  _SFDownload *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_INFO, "%{public}@: cancellation requested", (uint8_t *)&v4, 0xCu);
  }
  if (!self->_wasCanceled)
    -[_WKDownload cancel](self->_download, "cancel");
  self->_wasCanceled = 1;
  -[_SFDownload _reportUpdatedProgressNow](self, "_reportUpdatedProgressNow");
}

- (int64_t)fileType
{
  int64_t result;
  NSString *uti;
  void *v5;

  result = self->_cachedFileType;
  if (!result)
  {
    uti = self->_uti;
    -[NSURLResponse MIMEType](self->_response, "MIMEType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cachedFileType = _SFDownloadingFileTypeFromUTIAndMIMEType(uti, v5);

    return self->_cachedFileType;
  }
  return result;
}

- (_WKDownload)wkDownload
{
  return self->_download;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSURL *sourceURL;
  void *v10;
  NSString *uti;
  NSString *mimeType;
  void *v13;
  void *v14;
  void *v15;
  NSData *resumeData;
  void *v17;
  void *v18;
  NSDate *dateAdded;
  NSDate *dateFinished;
  NSURLRequest *request;
  void *v22;
  id v23;
  NSObject *v24;
  NSURLResponse *response;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v31;
  id v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v33[0] = CFSTR("BytesLoaded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bytesLoaded);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  v33[1] = CFSTR("BytesExpected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_bytesExpected);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v4;
  v33[2] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v5;
  v33[3] = CFSTR("Identifier");
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  sourceURL = self->_sourceURL;
  if (sourceURL)
  {
    -[NSURL safari_originalDataAsString](sourceURL, "safari_originalDataAsString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("SourceURL"));

  }
  uti = self->_uti;
  if (uti)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", uti, CFSTR("UTI"));
  mimeType = self->_mimeType;
  if (mimeType)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", mimeType, CFSTR("MIMEType"));
  if (self->_fileDownloadPath)
  {
    _SFSafariContainerURL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_fileDownloadPath, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_relativePathToURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("Path"));

  }
  resumeData = self->_resumeData;
  if (resumeData)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", resumeData, CFSTR("ResumeData"));
  -[SFDownloadFile bookmarkData](self->_placeholderFile, "bookmarkData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("PlaceholderBookmarkData"));
  -[SFDownloadFile bookmarkData](self->_completedFile, "bookmarkData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("BookmarkData"));
  dateAdded = self->_dateAdded;
  if (dateAdded)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", dateAdded, CFSTR("DateAdded"));
  dateFinished = self->_dateFinished;
  if (dateFinished)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", dateFinished, CFSTR("DateFinished"));
  if (self->_explicitlySaved)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ExplicitlySaved"));
  request = self->_request;
  if (request)
  {
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", request, 1, &v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v32;
    if (v22)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("Request"));
    }
    else
    {
      v24 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_SFDownload dictionaryRepresentation].cold.2(v24);
    }

  }
  response = self->_response;
  if (response)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", response, 1, &v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v31;
    if (v26)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("Response"));
    }
    else
    {
      v28 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[_SFDownload dictionaryRepresentation].cold.1(v28);
    }

  }
  v29 = (void *)objc_msgSend(v8, "copy");

  return (NSDictionary *)v29;
}

- (_SFDownload)initWithDictionaryRepresentation:(id)a3 didUpdateRepresentation:(BOOL *)a4
{
  id v6;
  _SFDownload *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *sourceURL;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *uti;
  uint64_t v16;
  NSString *mimeType;
  void *v18;
  uint64_t v19;
  NSData *resumeData;
  NSData *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSURLRequest *request;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSURLResponse *response;
  NSObject *v33;
  void *v34;
  NSUUID *v35;
  NSUUID *v36;
  NSUUID *v37;
  uint64_t v38;
  NSUUID *identifier;
  SFDownloadFile *v40;
  SFDownloadFile *completedFile;
  void *v42;
  SFDownloadFile *v43;
  SFDownloadFile *placeholderFile;
  BOOL *v45;
  void *v46;
  uint64_t v47;
  NSString *fileDownloadPath;
  void **p_fileDownloadPath;
  NSString *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  NSDate *dateFinished;
  uint64_t v61;
  NSDate *v62;
  uint64_t v63;
  NSDate *dateAdded;
  _SFDownload *v65;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  id v71;

  v6 = a3;
  v7 = -[_SFDownload init](self, "init");
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("SourceURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_URLWithDataAsString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    sourceURL = v7->_sourceURL;
    v7->_sourceURL = (NSURL *)v10;

    objc_msgSend(v6, "safari_numberForKey:", CFSTR("BytesLoaded"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_bytesLoaded = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v6, "safari_numberForKey:", CFSTR("BytesExpected"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_bytesExpected = objc_msgSend(v13, "longLongValue");

    objc_msgSend(v6, "safari_stringForKey:", CFSTR("UTI"));
    v14 = objc_claimAutoreleasedReturnValue();
    uti = v7->_uti;
    v7->_uti = (NSString *)v14;

    objc_msgSend(v6, "safari_stringForKey:", CFSTR("MIMEType"));
    v16 = objc_claimAutoreleasedReturnValue();
    mimeType = v7->_mimeType;
    v7->_mimeType = (NSString *)v16;

    objc_msgSend(v6, "safari_numberForKey:", CFSTR("State"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_state = objc_msgSend(v18, "integerValue");

    objc_msgSend(v6, "safari_dataForKey:", CFSTR("ResumeData"));
    v19 = objc_claimAutoreleasedReturnValue();
    resumeData = v7->_resumeData;
    v7->_resumeData = (NSData *)v19;

    if (!-[NSData length](v7->_resumeData, "length"))
    {
      v21 = v7->_resumeData;
      v7->_resumeData = 0;

    }
    objc_msgSend(v6, "safari_dataForKey:", CFSTR("PlaceholderBookmarkData"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_dataForKey:", CFSTR("BookmarkData"));
    v23 = objc_claimAutoreleasedReturnValue();
    v7->_explicitlySaved = objc_msgSend(v6, "safari_BOOLForKey:", CFSTR("ExplicitlySaved"));
    objc_msgSend(v6, "safari_dataForKey:", CFSTR("Request"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v71 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v24, &v71);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v71;
      request = v7->_request;
      v7->_request = (NSURLRequest *)v25;

      if (!v7->_request)
      {
        v28 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[_SFDownload initWithDictionaryRepresentation:didUpdateRepresentation:].cold.3(v28);
      }

    }
    objc_msgSend(v6, "safari_dataForKey:", CFSTR("Response"));
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v70 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v29, &v70);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v70;
      response = v7->_response;
      v7->_response = (NSURLResponse *)v30;

      if (!v7->_response)
      {
        v33 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[_SFDownload initWithDictionaryRepresentation:didUpdateRepresentation:].cold.2(v33);
      }

    }
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("Identifier"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v34);
      v36 = v35;
      if (v35)
      {
        v37 = v35;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v37 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
      identifier = v7->_identifier;
      v7->_identifier = v37;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v38 = objc_claimAutoreleasedReturnValue();
      v36 = v7->_identifier;
      v7->_identifier = (NSUUID *)v38;
    }
    v67 = v29;

    if (v23)
    {
      v40 = -[SFDownloadFile initWithBookmarkData:]([SFDownloadFile alloc], "initWithBookmarkData:", v23, v29);
      completedFile = v7->_completedFile;
      v7->_completedFile = v40;

      -[SFDownloadFile setDelegate:](v7->_completedFile, "setDelegate:", v7);
      if (a4)
      {
        if (!v7->_completedFile)
          *a4 = 1;
      }
    }
    v42 = (void *)v24;
    v69 = (void *)v23;
    if (v22)
    {
      v43 = -[SFDownloadFile initWithBookmarkData:]([SFDownloadFile alloc], "initWithBookmarkData:", v22);
      placeholderFile = v7->_placeholderFile;
      v7->_placeholderFile = v43;

      -[SFDownloadFile setDelegate:](v7->_placeholderFile, "setDelegate:", v7);
      if (a4)
      {
        if (!v7->_placeholderFile)
          *a4 = 1;
      }
    }
    v45 = a4;
    v46 = (void *)v22;
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("Path"), v67);
    v47 = objc_claimAutoreleasedReturnValue();
    p_fileDownloadPath = (void **)&v7->_fileDownloadPath;
    fileDownloadPath = v7->_fileDownloadPath;
    v7->_fileDownloadPath = (NSString *)v47;

    v50 = v7->_fileDownloadPath;
    if (v50)
    {
      v51 = (void *)MEMORY[0x1E0C99E98];
      _SFSafariContainerURL();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "fileURLWithPath:relativeToURL:", v50, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "path");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = *p_fileDownloadPath;
      *p_fileDownloadPath = (void *)v54;

    }
    if (v7->_state == 1)
    {
      v7->_state = 2;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "attributesOfItemAtPath:error:", v7->_fileDownloadPath, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_bytesLoaded = objc_msgSend(v57, "fileSize");

      v58 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[_SFDownload initWithDictionaryRepresentation:didUpdateRepresentation:].cold.1((uint64_t)&v7->_fileDownloadPath, v58);
    }
    objc_msgSend(v6, "safari_dateForKey:", CFSTR("DateFinished"));
    v59 = objc_claimAutoreleasedReturnValue();
    dateFinished = v7->_dateFinished;
    v7->_dateFinished = (NSDate *)v59;

    if (!v7->_dateFinished)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = v7->_dateFinished;
      v7->_dateFinished = (NSDate *)v61;

      if (v45)
        *v45 = 1;
    }
    objc_msgSend(v6, "safari_dateForKey:", CFSTR("DateAdded"));
    v63 = objc_claimAutoreleasedReturnValue();
    dateAdded = v7->_dateAdded;
    v7->_dateAdded = (NSDate *)v63;

    if (!v7->_dateAdded)
    {
      objc_storeStrong((id *)&v7->_dateAdded, v7->_dateFinished);
      if (v45)
        *v45 = 1;
    }
    v65 = v7;

  }
  return v7;
}

- (NSString)filename
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *fileDownloadPath;
  NSString *v8;
  NSString *suggestedFilename;

  -[SFDownloadFile URL](self->_completedFile, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    fileDownloadPath = self->_fileDownloadPath;
    if (fileDownloadPath)
    {
      -[NSString lastPathComponent](fileDownloadPath, "lastPathComponent");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      suggestedFilename = self->_suggestedFilename;
      if (suggestedFilename)
      {
        v8 = suggestedFilename;
      }
      else
      {
        -[NSURL _webkit_suggestedFilenameWithMIMEType:](self->_sourceURL, "_webkit_suggestedFilenameWithMIMEType:", 0);
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
    }
    v6 = v8;
  }

  return (NSString *)v6;
}

- (NSString)filenameWithoutExtension
{
  void *v2;
  void *v3;

  -[_SFDownload filename](self, "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)completedFileURL
{
  return (NSURL *)-[_SFDownload completedFileURL:](self, "completedFileURL:", 0);
}

- (id)completedFileURL:(BOOL *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSString *fileDownloadPath;

  if (self->_state == 4)
  {
    -[SFDownloadFile URL](self->_completedFile, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (a3)
        *a3 = 1;
      v7 = v5;
    }
    else
    {
      fileDownloadPath = self->_fileDownloadPath;
      if (!fileDownloadPath)
      {
        v8 = 0;
        goto LABEL_12;
      }
      if (a3)
      {
        *a3 = 0;
        fileDownloadPath = self->_fileDownloadPath;
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", fileDownloadPath, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
LABEL_12:

    return v8;
  }
  v8 = 0;
  return v8;
}

- (int64_t)dataOwner
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isURLManaged:", self->_sourceURL))
    v4 = 2;
  else
    v4 = 3;

  return v4;
}

- (BOOL)canResume
{
  return !self->_download && (self->_state & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_validateSandboxAccessToURL:(id)a3
{
  id v3;
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a3;
  getpid();
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "fileSystemRepresentation");
  v5 = sandbox_check();
  if (v5 == -1)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[_SFDownload _validateSandboxAccessToURL:].cold.2(v7);
  }
  else if (v5 == 1)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_SFDownload _validateSandboxAccessToURL:].cold.1();
  }

}

- (void)resumeInProcessPool:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSData *resumeData;
  NSData *v14;
  _WKDownload *v15;
  _WKDownload *download;
  NSObject *v17;
  _WKDownload *v18;
  void *v19;
  id v20;
  char v21;
  NSData *v22;
  NSDate *dateFinished;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSURL *v28;
  NSURL *sourceURL;
  _WKDownload *v30;
  _WKDownload *v31;
  NSObject *v32;
  _WKDownload *v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  _SFDownload *v37;
  __int16 v38;
  _WKDownload *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originatingWebView);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "websiteDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEF650], "safari_defaultDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processPool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processPool");
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v12;
  }
  resumeData = self->_resumeData;
  if (resumeData)
  {
    v14 = resumeData;
LABEL_9:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "_resumeDownloadFromData:websiteDataStore:path:originatingWebView:", v14, v8, self->_fileDownloadPath, v6);
      v15 = (_WKDownload *)objc_claimAutoreleasedReturnValue();
      download = self->_download;
      self->_download = v15;

    }
    v17 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = self->_download;
      *(_DWORD *)buf = 138543618;
      v37 = self;
      v38 = 2114;
      v39 = v18;
      _os_log_impl(&dword_1A3B2D000, v17, OS_LOG_TYPE_INFO, "%{public}@: resumed download %{public}@", buf, 0x16u);
    }
    -[SFDownloadFile URL](self->_placeholderFile, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __35___SFDownload_resumeInProcessPool___block_invoke;
      v34[3] = &unk_1E4ABFB20;
      v34[4] = self;
      v20 = v19;
      v35 = v20;
      objc_msgSend(v20, "safari_accessingSecurityScopedResource:", v34);

    }
    v21 = 0;
    goto LABEL_16;
  }
  -[_SFDownload _createResumeData](self, "_createResumeData");
  v14 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_9;
  v27 = (void *)MEMORY[0x1E0C92C80];
  -[NSURLRequest URL](self->_request, "URL");
  v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
  sourceURL = v28;
  if (!v28)
    sourceURL = self->_sourceURL;
  objc_msgSend(v27, "safari_nonAppInitiatedRequestWithURL:", sourceURL);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_downloadURLRequest:websiteDataStore:originatingWebView:", v20, v8, v6);
    v30 = (_WKDownload *)objc_claimAutoreleasedReturnValue();
    v31 = self->_download;
    self->_download = v30;

  }
  v32 = WBS_LOG_CHANNEL_PREFIXDownloads();
  v21 = 1;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = self->_download;
    *(_DWORD *)buf = 138543618;
    v37 = self;
    v38 = 2114;
    v39 = v33;
    _os_log_impl(&dword_1A3B2D000, v32, OS_LOG_TYPE_INFO, "%{public}@: restarted download %{public}@", buf, 0x16u);
  }
  v14 = 0;
LABEL_16:

  v22 = self->_resumeData;
  self->_resumeData = 0;

  self->_state = 1;
  dateFinished = self->_dateFinished;
  self->_dateFinished = 0;

  self->_wasCanceled = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postNotificationName:object:", CFSTR("_SFDownloadDidStartNotification"), self);

  +[_SFDownloadDispatcher sharedDownloadDispatcher](_SFDownloadDispatcher, "sharedDownloadDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerResumedDownload:", self);

  -[_SFDownload _reportUpdatedProgressNow](self, "_reportUpdatedProgressNow");
  v26 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v21 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v26, "downloadDidResume:", self);

}

- (void)_importPlaceholderIfNeeded:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  id WeakRetained;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  id v19;
  _SFDownload *v20;
  id v21;
  void (**v22)(id, uint64_t);
  uint8_t buf[4];
  _SFDownload *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  if (!self->_placeholderFile)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_loadWeakRetained((id *)&self->_placeholderImporter);
    if (v7)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[_SFDownload _importPlaceholderIfNeeded:].cold.1();
    }
    else if ((objc_opt_respondsToSelector() & 1) == 0
           || (objc_msgSend(WeakRetained, "downloadShouldImportPlaceholderToDownloadsFolder:", self) & 1) == 0)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = self;
        _os_log_impl(&dword_1A3B2D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: not importing placeholder to the Downloads folder because the delegate says not to", buf, 0xCu);
      }
      v4[2](v4, 1);
      goto LABEL_16;
    }
    v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1A3B2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: starting to import placeholder to the Downloads folder", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_fileDownloadPath, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathExtension:", CFSTR("download"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[_SFDownload _sharedQueue](_SFDownload, "_sharedQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke;
    block[3] = &unk_1E4AC7FE0;
    v18 = v10;
    v19 = v12;
    v20 = self;
    v22 = v4;
    v21 = v7;
    v14 = v12;
    v15 = v10;
    dispatch_async(v13, block);

LABEL_16:
    goto LABEL_17;
  }
  v5 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFDownload _importPlaceholderIfNeeded:].cold.2();
  v4[2](v4, 1);
LABEL_17:

}

- (void)_didImportPlaceholderAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__17;
  v21 = __Block_byref_object_dispose__17;
  v8 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60___SFDownload__didImportPlaceholderAtURL_completionHandler___block_invoke;
  v14[3] = &unk_1E4AC59B0;
  v16 = &v17;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v9, "safari_accessingSecurityScopedResource:", v14);
  if (v18[5])
  {
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __60___SFDownload__didImportPlaceholderAtURL_completionHandler___block_invoke_107;
    block[3] = &unk_1E4AC8008;
    block[4] = self;
    v13 = &v17;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_SFDownload _didImportPlaceholderAtURL:completionHandler:].cold.1();
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)_importCompleteDownloadIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "%{public}@: there is no placeholder; not importing complete download",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3_2();
}

- (void)_didImportFileAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _SFDownload *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];
  id v37;
  _BYTE v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__17;
    v34 = __Block_byref_object_dispose__17;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__17;
    v28 = __Block_byref_object_dispose__17;
    v29 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2;
    v19[3] = &unk_1E4AC8058;
    v10 = v6;
    v20 = v10;
    v21 = self;
    v22 = &v24;
    v23 = &v30;
    objc_msgSend(v10, "safari_accessingSecurityScopedResource:", v19);
    if (v25[5])
    {
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2_113;
      block[3] = &unk_1E4AC5CB0;
      block[4] = self;
      v15 = v10;
      v16 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v11 = &v15;
    }
    else
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v31[5], "safari_privacyPreservingDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFDownload _didImportFileAtURL:completionHandler:].cold.1((uint64_t)self, v13, (uint64_t)v38, v12);
      }

      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_112;
      v17[3] = &unk_1E4AC13D8;
      v17[4] = self;
      v11 = &v18;
      v18 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v17);
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke;
    v36[3] = &unk_1E4AC13D8;
    v36[4] = self;
    v37 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v36);

  }
}

- (BOOL)canReveal
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SFDownloadFile URL](self->_completedFile, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SFDownloadFile URL](self->_placeholderFile, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)reveal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SFDownloadFile URL](self->_completedFile, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[SFDownloadFile URL](self->_placeholderFile, "URL"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
    objc_msgSend(v4, "setScheme:", CFSTR("shareddocuments"));
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("reveal"), CFSTR("YES"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryItems:", v6);

    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.DocumentsApp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sf_openURL:inApplication:withOptions:completionHandler:", v9, v7, 0, 0);

  }
}

- (id)_createResumeData
{
  NSString **p_fileDownloadPath;
  NSURLRequest *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  id v30;

  p_fileDownloadPath = &self->_fileDownloadPath;
  if (!self->_fileDownloadPath)
    return 0;
  v4 = self->_request;
  -[NSURLRequest URL](v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_isHTTPFamilyURL");

  if (v6
    && (-[NSURLRequest HTTPMethod](v4, "HTTPMethod"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", CFSTR("GET")),
        v7,
        v8))
  {
    -[NSURLResponse allHeaderFields](self->_response, "allHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_stringForKey:", CFSTR("Etag"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_stringForKey:", CFSTR("Last-Modified"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11 | v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *p_fileDownloadPath;
      v30 = 0;
      objc_msgSend(v12, "attributesOfItemAtPath:error:", v13, &v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v30;
      objc_msgSend(v14, "safari_numberForKey:", *MEMORY[0x1E0CB2AF0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_SFDownload _createResumeData].cold.1((uint64_t)p_fileDownloadPath, v17);
      if (objc_msgSend(v16, "unsignedIntegerValue"))
      {
        v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E4B26110, CFSTR("NSURLSessionResumeInfoVersion"));
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("NSURLSessionResumeBytesReceived"));
        objc_msgSend(v18, "setObject:forKeyedSubscript:", *p_fileDownloadPath, CFSTR("NSURLSessionResumeInfoLocalPath"));
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
        objc_msgSend(v19, "encodeObject:forKey:", v4, CFSTR("NSKeyedArchiveRootObjectKey"));
        objc_msgSend(v19, "encodedData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("NSURLSessionResumeCurrentRequest"));

        if (v11)
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("NSURLSessionResumeServerDownloadDate"));
        v28 = v16;
        if (v10)
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, CFSTR("NSURLSessionResumeEntityTag"));
        v29 = v15;
        -[NSURLRequest allHTTPHeaderFields](v4, "allHTTPHeaderFields");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safari_stringForKey:", CFSTR("Range"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "hasPrefix:", CFSTR("bytes=")))
        {
          objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("="));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v23, "count") >= 2)
          {
            objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("NSURLSessionResumeByteRange"));

          }
        }
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
        objc_msgSend(v25, "encodeObject:forKey:", v18, CFSTR("NSKeyedArchiveRootObjectKey"));
        objc_msgSend(v25, "encodedData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v28;
        v15 = v29;
      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)_notifyDelegateOfFinishedDownload
{
  NSDate *v3;
  NSDate *dateFinished;
  id WeakRetained;
  _WKDownload *download;
  id v7;

  self->_state = 4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateFinished = self->_dateFinished;
  self->_dateFinished = v3;

  -[_SFDownload _reportUpdatedProgressNow](self, "_reportUpdatedProgressNow");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "downloadDidFinish:", self);

  download = self->_download;
  self->_download = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("_SFDownloadDidStopNotification"), self);

}

- (void)downloadFileContentsDidChange:(id)a3
{
  id WeakRetained;

  if (self->_completedFile == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "downloadContentsDidChange:", self);

  }
}

- (void)downloadFileWillBeDeleted:(id)a3
{
  SFDownloadFile *placeholderFile;
  char v5;
  SFDownloadFile *WeakRetained;

  if (self->_completedFile == a3)
  {
    WeakRetained = (SFDownloadFile *)objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();
    placeholderFile = WeakRetained;
    if ((v5 & 1) != 0)
    {
      -[SFDownloadFile downloadWillBeDeleted:](WeakRetained, "downloadWillBeDeleted:", self);
      placeholderFile = WeakRetained;
    }
  }
  else
  {
    -[_WKDownload cancel](self->_download, "cancel");
    -[SFDownloadFile invalidate](self->_placeholderFile, "invalidate");
    placeholderFile = self->_placeholderFile;
    self->_placeholderFile = 0;
  }

}

- (void)downloadFileDidChangeURL:(id)a3
{
  id v4;

  if (self->_completedFile == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("_SFDownloadDidChangeCompletedURLNotification"), self);

  }
}

- (void)_downloadDidStart:(id)a3
{
  _WKDownload *v4;
  NSObject *v5;
  _WKDownload *download;
  _WKDownload *v7;
  void *v8;
  void *v9;
  NSDate *dateFinished;
  void *v11;
  id WeakRetained;
  int v13;
  _SFDownload *v14;
  __int16 v15;
  _WKDownload *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (_WKDownload *)a3;
  v5 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "%{public}@: starting download %{public}@", (uint8_t *)&v13, 0x16u);
  }
  self->_wasCanceled = 0;
  download = self->_download;
  self->_download = v4;
  v7 = v4;

  -[_WKDownload originatingWebView](v7, "originatingWebView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_originatingWebView, v8);

  self->_timeLastProgressNotificationWasSent = CFAbsoluteTimeGetCurrent();
  -[_SFDownload fluidProgressController](self, "fluidProgressController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startFluidProgressWithProgressStateSource:", self);

  self->_state = 1;
  dateFinished = self->_dateFinished;
  self->_dateFinished = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "postNotificationName:object:", CFSTR("_SFDownloadDidStartNotification"), self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "downloadDidStart:", self);

  -[_SFDownload _reportUpdatedProgressNow](self, "_reportUpdatedProgressNow");
}

- (void)_download:(id)a3 didReceiveResponse:(id)a4
{
  NSURLResponse *v5;
  NSObject *v6;
  NSURL *v7;
  NSURL *sourceURL;
  NSString *v9;
  NSString *uti;
  void *v11;
  NSString *v12;
  NSString *mimeType;
  NSURLResponse *response;
  NSURLResponse *v15;
  id WeakRetained;

  v5 = (NSURLResponse *)a4;
  v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_SFDownload _download:didReceiveResponse:].cold.1();
  self->_bytesLoaded = 0;
  self->_bytesExpected = -[NSURLResponse expectedContentLength](v5, "expectedContentLength");
  -[NSURLResponse URL](v5, "URL");
  v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
  sourceURL = self->_sourceURL;
  self->_sourceURL = v7;

  -[WBSFluidProgressState setHasCommittedLoad:](self->_fluidProgressState, "setHasCommittedLoad:", 1);
  typeIdentifierForDownloadFromResponse(v5);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  uti = self->_uti;
  self->_uti = v9;

  -[NSURLResponse MIMEType](v5, "MIMEType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)objc_msgSend(v11, "copy");
  mimeType = self->_mimeType;
  self->_mimeType = v12;

  response = self->_response;
  self->_response = v5;
  v15 = v5;

  self->_cachedFileType = 0;
  -[_SFDownload _reportUpdatedProgressNow](self, "_reportUpdatedProgressNow");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(response) = objc_opt_respondsToSelector();

  if ((response & 1) != 0)
    objc_msgSend(WeakRetained, "downloadDidReceiveResponse:", self);

}

- (void)_download:(id)a3 didWriteData:(unint64_t)a4 totalBytesWritten:(unint64_t)a5 totalBytesExpectedToWrite:(unint64_t)a6
{
  self->_bytesExpected = a6;
  self->_bytesLoaded = a5;
  -[_SFDownload _didUpdateBytesLoaded](self, "_didUpdateBytesLoaded", a3, a4);
}

- (void)_didUpdateBytesLoaded
{
  CFAbsoluteTime Current;
  id v4;

  -[_SFDownload _reportUpdatedProgressSoon](self, "_reportUpdatedProgressSoon");
  if (self->_bytesExpected != -1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - self->_timeLastProgressNotificationWasSent >= 0.2)
    {
      self->_timeLastProgressNotificationWasSent = Current;
      -[_SFDownload fluidProgressController](self, "fluidProgressController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateFluidProgressWithProgressStateSource:", self);

    }
  }
}

+ (id)downloadDestinationPathWithFilename:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_webkit_createTemporaryDirectoryWithTemplatePrefix:", CFSTR("Download"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_web_pathWithUniqueFilenameForPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSString *v14;
  NSString *suggestedFilename;
  id WeakRetained;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v7 = a4;
  v8 = a5;
  v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_SFDownload _download:decideDestinationWithSuggestedFilename:completionHandler:].cold.3();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __82___SFDownload__download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke;
  v20[3] = &unk_1E4AC0E68;
  v20[4] = self;
  v11 = v8;
  v21 = v11;
  v12 = (void *)MEMORY[0x1A8598C40](v20);
  if (self->_wasCanceled)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_SFDownload _download:decideDestinationWithSuggestedFilename:completionHandler:].cold.2();
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }
  else
  {
    if (!self->_suggestedFilename)
    {
      objc_msgSend(MEMORY[0x1E0D4ED18], "properFilenameForOriginalFilename:typeIdentifier:mimeType:sourceURL:", v7, self->_uti, self->_mimeType, self->_sourceURL);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      suggestedFilename = self->_suggestedFilename;
      self->_suggestedFilename = v14;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[_SFDownload _download:decideDestinationWithSuggestedFilename:completionHandler:].cold.1();
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __82___SFDownload__download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_169;
      v18[3] = &unk_1E4AC18A0;
      v18[4] = self;
      v19 = v12;
      objc_msgSend(WeakRetained, "downloadShouldContinueAfterReceivingResponse:decisionHandler:", self, v18);

    }
    else
    {
      -[_SFDownload _continueAfterDownloadConfirmation:destinationCompletionHandler:](self, "_continueAfterDownloadConfirmation:destinationCompletionHandler:", 1, v12);
    }

  }
}

- (void)_continueAfterDownloadConfirmation:(BOOL)a3 destinationCompletionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  NSString *fileDownloadPath;
  NSString *v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!a3)
  {
    fileDownloadPath = self->_fileDownloadPath;
    self->_fileDownloadPath = 0;
LABEL_6:

    -[_SFDownload _continueAfterDecidingFileDownloadPath:](self, "_continueAfterDecidingFileDownloadPath:", v6);
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "downloadDestinationPathWithFilename:", self->_suggestedFilename);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    fileDownloadPath = self->_fileDownloadPath;
    self->_fileDownloadPath = v9;
    goto LABEL_6;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79___SFDownload__continueAfterDownloadConfirmation_destinationCompletionHandler___block_invoke;
  v10[3] = &unk_1E4AC5C20;
  v10[4] = self;
  v11 = v6;
  objc_msgSend(WeakRetained, "createDirectoryForDownload:completionHandler:", self, v10);

LABEL_7:
}

- (void)_continueAfterDecidingFileDownloadPath:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_fileDownloadPath)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke;
    v6[3] = &unk_1E4AC18A0;
    v6[4] = self;
    v7 = v4;
    -[_SFDownload _importPlaceholderIfNeeded:](self, "_importPlaceholderIfNeeded:", v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)_downloadDidFinish:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  int v6;
  _SFDownload *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_wasCanceled)
  {
    -[_SFDownload _downloadDidCancel:](self, "_downloadDidCancel:", a3);
  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_INFO, "%{public}@: finished download", (uint8_t *)&v6, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressController);
    objc_msgSend(WeakRetained, "finishFluidProgressWithProgressStateSource:", self);

    -[_SFDownload _importCompleteDownloadIfNeeded](self, "_importCompleteDownloadIfNeeded");
  }
}

- (void)_download:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSDate *v9;
  NSDate *dateFinished;
  NSData *v11;
  NSData *resumeData;
  NSData *v13;
  id WeakRetained;
  id v15;
  _WKDownload *download;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_SFDownload _download:didFailWithError:].cold.1((uint64_t)self, v8, v6);
  self->_state = 3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateFinished = self->_dateFinished;
  self->_dateFinished = v9;

  objc_msgSend(v7, "resumeData");
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();

  resumeData = self->_resumeData;
  self->_resumeData = v11;

  if (!-[NSData length](self->_resumeData, "length"))
  {
    v13 = self->_resumeData;
    self->_resumeData = 0;

  }
  if (!self->_resumeData)
    -[_SFDownload removeFromDisk](self, "removeFromDisk");
  WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressController);
  objc_msgSend(WeakRetained, "cancelFluidProgressWithProgressStateSource:", self);

  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v15, "downloadDidFail:", self);

  download = self->_download;
  self->_download = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:", CFSTR("_SFDownloadDidStopNotification"), self);

  -[_SFDownload _reportUpdatedProgressNow](self, "_reportUpdatedProgressNow");
}

- (void)_downloadDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  NSDate *v7;
  NSDate *dateFinished;
  NSData *v9;
  NSData *resumeData;
  NSData *v11;
  id v12;
  _WKDownload *download;
  void *v14;
  int v15;
  _SFDownload *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v15 = 138543362;
    v16 = self;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "%{public}@: download was canceled", (uint8_t *)&v15, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressController);
  objc_msgSend(WeakRetained, "cancelFluidProgressWithProgressStateSource:", self);

  -[_SFDownload clearFluidProgressState](self, "clearFluidProgressState");
  self->_state = 2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateFinished = self->_dateFinished;
  self->_dateFinished = v7;

  objc_msgSend(v4, "resumeData");
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();

  resumeData = self->_resumeData;
  self->_resumeData = v9;

  if (!-[NSData length](self->_resumeData, "length"))
  {
    v11 = self->_resumeData;
    self->_resumeData = 0;

  }
  if (!self->_resumeData)
    -[_SFDownload removeFromDisk](self, "removeFromDisk");
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v12, "downloadDidFail:", self);

  download = self->_download;
  self->_download = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("_SFDownloadDidStopNotification"), self);

  -[_SFDownload _reportUpdatedProgressNow](self, "_reportUpdatedProgressNow");
}

- (void)_downloadProcessDidCrash:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_SFDownload _downloadProcessDidCrash:].cold.1();
  -[_SFDownload _downloadDidCancel:](self, "_downloadDidCancel:", v4);

}

- (BOOL)createFluidProgressState
{
  WBSFluidProgressState *v3;
  WBSFluidProgressState *fluidProgressState;
  WBSFluidProgressState *v5;
  void *v6;

  if (!self->_fluidProgressState)
  {
    v3 = (WBSFluidProgressState *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A910]), "initWithType:", 1);
    fluidProgressState = self->_fluidProgressState;
    self->_fluidProgressState = v3;

    v5 = self->_fluidProgressState;
    -[NSURL safari_originalDataAsString](self->_sourceURL, "safari_originalDataAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFluidProgressState setLoadURL:](v5, "setLoadURL:", v6);

    if (self->_response)
      -[WBSFluidProgressState setHasCommittedLoad:](self->_fluidProgressState, "setHasCommittedLoad:", 1);
  }
  return 1;
}

- (void)clearFluidProgressState
{
  WBSFluidProgressState *fluidProgressState;

  fluidProgressState = self->_fluidProgressState;
  self->_fluidProgressState = 0;

}

- (id)progressState
{
  return self->_fluidProgressState;
}

- (id)expectedOrCurrentURL
{
  return self->_sourceURL;
}

- (double)estimatedProgress
{
  int64_t bytesExpected;

  bytesExpected = self->_bytesExpected;
  if (bytesExpected < 1)
    return 0.0;
  else
    return (double)self->_bytesLoaded / (double)bytesExpected;
}

- (BOOL)hasFailedURL
{
  return self->_state == 3;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSString)fileDownloadPath
{
  return self->_fileDownloadPath;
}

- (_WKUserInitiatedAction)userInitiatedAction
{
  return self->_userInitiatedAction;
}

- (NSString)uti
{
  return self->_uti;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSURLResponse)response
{
  return self->_response;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)explicitlySaved
{
  return self->_explicitlySaved;
}

- (void)setExplicitlySaved:(BOOL)a3
{
  self->_explicitlySaved = a3;
}

- (BOOL)suppressesPrompt
{
  return self->_suppressesPrompt;
}

- (void)setSuppressesPrompt:(BOOL)a3
{
  self->_suppressesPrompt = a3;
}

- (int64_t)bytesExpected
{
  return self->_bytesExpected;
}

- (unint64_t)bytesLoaded
{
  return self->_bytesLoaded;
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (NSDate)dateFinished
{
  return self->_dateFinished;
}

- (WBSFluidProgressController)fluidProgressController
{
  return (WBSFluidProgressController *)objc_loadWeakRetained((id *)&self->_fluidProgressController);
}

- (void)setFluidProgressController:(id)a3
{
  objc_storeWeak((id *)&self->_fluidProgressController, a3);
}

- (_SFDownloadDelegate)delegate
{
  return (_SFDownloadDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFDownloadPlaceholderImporter)placeholderImporter
{
  return (_SFDownloadPlaceholderImporter *)objc_loadWeakRetained((id *)&self->_placeholderImporter);
}

- (void)setPlaceholderImporter:(id)a3
{
  objc_storeWeak((id *)&self->_placeholderImporter, a3);
}

- (SFQuickLookDocument)quickLookDocument
{
  return self->_quickLookDocument;
}

- (void)setQuickLookDocument:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookDocument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_destroyWeak((id *)&self->_placeholderImporter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_fluidProgressController);
  objc_storeStrong((id *)&self->_dateFinished, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_userInitiatedAction, 0);
  objc_storeStrong((id *)&self->_fileDownloadPath, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_suggestedFilename, 0);
  objc_storeStrong((id *)&self->_completedFile, 0);
  objc_storeStrong((id *)&self->_placeholderFile, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_destroyWeak((id *)&self->_originatingWebView);
  objc_storeStrong((id *)&self->_reportUpdatedProgressTimer, 0);
  objc_storeStrong((id *)&self->_fluidProgressState, 0);
  objc_storeStrong((id *)&self->_download, 0);
}

- (void)dictionaryRepresentation
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Failed to encode request data: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)initWithDictionaryRepresentation:(uint64_t)a1 didUpdateRepresentation:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v2 = OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend(0, "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_1A3B2D000, v2, v4, "Failed to check file size at %{private}@: %{public}@", v5);

  OUTLINED_FUNCTION_0_1();
}

- (void)initWithDictionaryRepresentation:(void *)a1 didUpdateRepresentation:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Failed to decode response data: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)initWithDictionaryRepresentation:(void *)a1 didUpdateRepresentation:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Failed to decode request data: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_validateSandboxAccessToURL:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1A3B2D000, v0, OS_LOG_TYPE_FAULT, "Download has no sandbox access to placeholder file: %{private}@", v1, 0xCu);
  OUTLINED_FUNCTION_3_2();
}

- (void)_validateSandboxAccessToURL:(void *)a1 .cold.2(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_7(a1);
  __error();
  OUTLINED_FUNCTION_12_0(&dword_1A3B2D000, v2, v3, "Error checking sandbox access to placeholder file: errno=%ld, url=%{private}@", v4, v5, v6, v7, 3u);

  OUTLINED_FUNCTION_6();
}

- (void)_importPlaceholderIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "%{public}@ has custom placeholder importer. Not calling -downloadShouldImportPlaceholderToDownloadsFolder:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_2();
}

- (void)_importPlaceholderIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "%{public}@: we already have a placeholder; skipping import",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3_2();
}

- (void)_didImportPlaceholderAtURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v0, v1, "%{public}@: failed to create bookmark for imported placeholder", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)_didImportFileAtURL:(uint64_t)a3 completionHandler:(NSObject *)a4 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_5(&dword_1A3B2D000, a4, a3, "%{public}@: failed to create bookmark data: %{public}@", (uint8_t *)a3);

}

- (void)_createResumeData
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v4, v5, "Failed to check file size at %{private}@: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

- (void)_download:didReceiveResponse:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2117;
  v4 = v0;
  OUTLINED_FUNCTION_2_3(&dword_1A3B2D000, v1, (uint64_t)v1, "%{public}@: received response: %{sensitive}@", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)_download:decideDestinationWithSuggestedFilename:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "%{public}@: consulting delegate for confirmation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_2();
}

- (void)_download:decideDestinationWithSuggestedFilename:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "%{public}@: Cancelling WebKit download via nil destination because _SFDownload has already been canceled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_2();
}

- (void)_download:decideDestinationWithSuggestedFilename:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "%{public}@: deciding destination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_2();
}

- (void)_download:(void *)a3 didFailWithError:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_1_5(&dword_1A3B2D000, v5, v7, "%{public}@: download failed: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_0_1();
}

- (void)_downloadProcessDidCrash:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v0, v1, "%{public}@: network process crashed", v2);
  OUTLINED_FUNCTION_3_2();
}

@end
