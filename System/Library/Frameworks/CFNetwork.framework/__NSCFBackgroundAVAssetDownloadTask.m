@implementation __NSCFBackgroundAVAssetDownloadTask

- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskGroup:(id)a3 URLAsset:(id)a4 URL:(id)a5 destinationURL:(id)a6 temporaryDestinationURL:(id)a7 assetTitle:(id)a8 assetArtworkData:(id)a9 ident:(unint64_t)a10 enableSPIDelegateCallbacks:(BOOL)a11
{
  double v11;
  __NSCFBackgroundAVAssetDownloadTask *v19;
  __NSCFBackgroundAVAssetDownloadTask *v20;
  SEL v21;
  SEL v22;
  SEL v23;
  __NSCFBackgroundAVAssetDownloadTask *result;
  objc_super v25;

  gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v11);
  if (objc_opt_class())
  {
    v25.receiver = self;
    v25.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
    v19 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:](&v25, sel_initWithOriginalRequest_ident_taskGroup_, 0, a10, a3);
    v20 = v19;
    if (v19)
    {
      -[__NSCFBackgroundAVAssetDownloadTask setURL:](v19, "setURL:", a5);
      -[__NSCFBackgroundAVAssetDownloadTask setURLAsset:](v20, "setURLAsset:", a4);
      -[__NSCFBackgroundAVAssetDownloadTask setDestinationURL:](v20, "setDestinationURL:", a6);
      objc_setProperty_atomic_copy(v20, v21, a7, 856);
      objc_setProperty_atomic_copy(v20, v22, a8, 864);
      objc_setProperty_atomic_copy(v20, v23, a9, 872);
      v20->_enableSPIDelegateCallbacks = a11;
      v20->_progressLock._os_unfair_lock_opaque = 0;
    }
    return v20;
  }
  else
  {
    result = (__NSCFBackgroundAVAssetDownloadTask *)_os_crash();
    __break(1u);
  }
  return result;
}

- (__NSCFBackgroundAVAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  __NSCFBackgroundAVAssetDownloadTask *v6;
  double v7;
  double Helper_x8__OBJC_CLASS___AVURLAsset;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  id v14;
  SEL v15;
  void *v16;
  SEL v17;
  objc_super v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
  v6 = -[__NSCFBackgroundSessionTask initWithTaskInfo:taskGroup:ident:](&v19, sel_initWithTaskInfo_taskGroup_ident_, a3, a4, a5);
  if (v6)
  {
    -[__NSCFBackgroundAVAssetDownloadTask setURL:](v6, "setURL:", objc_msgSend(a3, "URL"));
    -[__NSCFBackgroundAVAssetDownloadTask setDestinationURL:](v6, "setDestinationURL:", objc_msgSend(a3, "destinationURL"));
    -[__NSCFBackgroundAVAssetDownloadTask setAVAssetDownloadToken:](v6, "setAVAssetDownloadToken:", objc_msgSend(a3, "AVAssetDownloadToken"));
    if (objc_msgSend(a3, "initializedWithAVAsset"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "AVAssetDownloadToken"));
      Helper_x8__OBJC_CLASS___AVURLAsset = gotLoadHelper_x8__OBJC_CLASS___AVURLAsset(v7);
      v10 = *(void **)(v9 + 952);
      v20 = CFSTR("AVURLAssetDownloadTokenKey");
      v21[0] = v11;
      -[__NSCFBackgroundAVAssetDownloadTask setURLAsset:](v6, "setURLAsset:", objc_msgSend(v10, "URLAssetWithURL:options:", 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1, Helper_x8__OBJC_CLASS___AVURLAsset)));
      if (objc_msgSend(a3, "resolvedMediaSelectionPlist"))
      {
        gotLoadHelper_x8__OBJC_CLASS___AVMediaSelection(v12);
        v14 = (id)objc_msgSend(objc_alloc(*(Class *)(v13 + 496)), "initWithAsset:propertyList:", -[__NSCFBackgroundAVAssetDownloadTask URLAsset](v6, "URLAsset"), objc_msgSend(a3, "resolvedMediaSelectionPlist"));
        objc_setProperty_atomic_copy(v6, v15, v14, 880);
      }
    }
    v16 = (void *)objc_msgSend(a3, "temporaryDestinationURL");
    objc_setProperty_atomic_copy(v6, v17, v16, 856);
    v6->_enableSPIDelegateCallbacks = objc_msgSend(a3, "enableSPIDelegateCallbacks");
    v6->_progressLock._os_unfair_lock_opaque = 0;
  }
  return v6;
}

- (void)dealloc
{
  const char *v3;
  SEL v4;
  SEL v5;
  SEL v6;
  objc_super v7;

  -[__NSCFBackgroundAVAssetDownloadTask setURL:](self, "setURL:", 0);
  -[__NSCFBackgroundAVAssetDownloadTask setDestinationURL:](self, "setDestinationURL:", 0);
  if (self)
  {
    objc_setProperty_atomic_copy(self, v3, 0, 856);
    -[__NSCFBackgroundAVAssetDownloadTask setLoadedTimeRanges:](self, "setLoadedTimeRanges:", 0);
    objc_setProperty_atomic_copy(self, v4, 0, 880);
    -[__NSCFBackgroundAVAssetDownloadTask setURLAsset:](self, "setURLAsset:", 0);
    objc_setProperty_atomic_copy(self, v5, 0, 872);
    objc_setProperty_atomic_copy(self, v6, 0, 864);
  }
  else
  {
    objc_msgSend(0, "setLoadedTimeRanges:", 0);
    objc_msgSend(0, "setURLAsset:", 0);
  }
  -[__NSCFBackgroundAVAssetDownloadTask setOptions:](self, "setOptions:", 0);

  v7.receiver = self;
  v7.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
  -[__NSCFBackgroundSessionTask dealloc](&v7, sel_dealloc);
}

- (void)_onqueue_didReceiveProgressUpdateWithTotalBytesWritten:(int64_t)a3 totalBytesExpectedToWrite:(int64_t)a4
{
  NSURLSession *v7;
  int64_t v8;
  int64_t v9;
  NSObject *delegateDispatchQueue;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  NSURLSessionDelegate *delegate_ivar;
  NSURLSession *v16;
  __NSCFBackgroundAVAssetDownloadTask *v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;

  if (-[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived") != a3
    || -[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive") != a4)
  {
    if (self)
    {
      if (self->_enableSPIDelegateCallbacks)
      {
        if (-[NSURLSessionTask session](self, "session"))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v7 = -[NSURLSessionTask session](self, "session");
            v8 = -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived");
            if (v7)
            {
              v9 = a3 - v8;
              v11 = MEMORY[0x1E0C809B0];
              v12 = 3221225472;
              v13 = __102__NSURLSession_delegate_AVAssetDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
              v14 = &unk_1E14FBE60;
              delegateDispatchQueue = v7->_delegateDispatchQueue;
              delegate_ivar = v7->_delegate_ivar;
              v16 = v7;
              v17 = self;
              v18 = v9;
              v19 = a3;
              v20 = a4;
              if (delegateDispatchQueue)
                dispatch_async(delegateDispatchQueue, &v11);
              else
                -[NSOperationQueue addOperationWithBlock:](v7->_delegateQueue_ivar, "addOperationWithBlock:", &v11);
            }
          }
        }
      }
    }
    -[NSURLSessionTask setCountOfBytesReceived:](self, "setCountOfBytesReceived:", a3, v11, v12, v13, v14, delegate_ivar, v16, v17, v18, v19, v20);
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](self, "setCountOfBytesExpectedToReceive:", a4);
    os_unfair_lock_lock(&self->_progressLock);
    -[NSProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", a4);
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", a3);
    os_unfair_lock_unlock(&self->_progressLock);
  }
}

- (void)_onqueue_didLoadTimeRange:(id)a3 totalTimeRangesLoaded:(id)a4 timeRangeExpectedToLoad:(id)a5 forMediaSelectionPropertyList:(id)a6
{
  NSURLSession *v10;
  NSURLSessionDelegate *delegate_ivar;
  NSObject *delegateDispatchQueue;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  -[__NSCFBackgroundAVAssetDownloadTask setLoadedTimeRanges:](self, "setLoadedTimeRanges:", a4);
  if (-[NSURLSessionTask session](self, "session") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = -[NSURLSessionTask session](self, "session");
    if (a3)
    {
      objc_msgSend(a3, "CMTimeRangeValue");
      if (a5)
        goto LABEL_5;
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v16 = 0u;
      if (a5)
      {
LABEL_5:
        objc_msgSend(a5, "CMTimeRangeValue");
        if (!v10)
          return;
        goto LABEL_9;
      }
    }
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    if (!v10)
      return;
LABEL_9:
    delegate_ivar = v10->_delegate_ivar;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__NSURLSession_delegate_AVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke;
    block[3] = &unk_1E14FBEB0;
    block[4] = delegate_ivar;
    block[5] = v10;
    v20 = v16;
    v21 = v17;
    block[6] = self;
    block[7] = a4;
    v22 = v18;
    v23 = v13;
    v24 = v14;
    v25 = v15;
    delegateDispatchQueue = v10->_delegateDispatchQueue;
    if (delegateDispatchQueue)
      dispatch_async(delegateDispatchQueue, block);
    else
      -[NSOperationQueue addOperationWithBlock:](v10->_delegateQueue_ivar, "addOperationWithBlock:", block);
  }
}

- (void)_onqueue_didResolveMediaSelectionPropertyList:(id)a3
{
  double v3;
  uint64_t v6;
  id v7;
  const char *v8;
  NSURLSession *v9;
  const char *v10;
  NSURLSession *v11;
  id Property;
  __NSCFBackgroundAVAssetDownloadTask *v13;

  gotLoadHelper_x8__OBJC_CLASS___AVMediaSelection(v3);
  v7 = (id)objc_msgSend(objc_alloc(*(Class *)(v6 + 496)), "initWithAsset:propertyList:", -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset"), a3);
  if (self)
    objc_setProperty_atomic_copy(self, v8, v7, 880);
  if (-[NSURLSessionTask session](self, "session") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = -[NSURLSessionTask session](self, "session");
    v11 = v9;
    if (self)
    {
      Property = objc_getProperty(self, v10, 880, 1);
      v9 = v11;
      v13 = self;
    }
    else
    {
      v13 = 0;
      Property = 0;
    }
    -[NSURLSession delegate_AVAssetDownloadTask:didResolveMediaSelection:]((uint64_t)v9, (uint64_t)v13, (uint64_t)Property);
  }
}

- (void)_onqueue_didFinishDownloadingToURL:(id)a3
{
  NSURLSession *v5;
  NSObject *delegateDispatchQueue;
  _QWORD block[9];

  if (-[NSURLSessionTask session](self, "session"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = -[NSURLSessionTask session](self, "session");
      if (v5)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __89__NSURLSession_delegate_AVAssetDownloadTask_didFinishDownloadingToURL_completionHandler___block_invoke;
        block[3] = &unk_1E14FDE58;
        delegateDispatchQueue = v5->_delegateDispatchQueue;
        block[4] = v5->_delegate_ivar;
        block[5] = v5;
        block[6] = self;
        block[7] = a3;
        block[8] = &__block_literal_global_192;
        if (delegateDispatchQueue)
          dispatch_async(delegateDispatchQueue, block);
        else
          -[NSOperationQueue addOperationWithBlock:](v5->_delegateQueue_ivar, "addOperationWithBlock:", block);
      }
    }
  }
}

- (void)_onqueue_willDownloadToURL:(id)a3
{
  double v5;
  double Helper_x8__OBJC_CLASS___AVAssetDownloadSession;
  uint64_t v7;
  NSURLSession *v8;
  NSObject *delegateDispatchQueue;
  _QWORD v10[8];

  if (-[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset"))
  {
    Helper_x8__OBJC_CLASS___AVAssetDownloadSession = gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v5);
    objc_msgSend(*(id *)(v7 + 4008), "registerDownloadLocation:forURLAsset:", a3, -[__NSCFBackgroundAVAssetDownloadTask URLAsset](self, "URLAsset", Helper_x8__OBJC_CLASS___AVAssetDownloadSession));
  }
  if (-[NSURLSessionTask session](self, "session"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = -[NSURLSessionTask session](self, "session");
      if (v8)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __63__NSURLSession_delegate_AVAssetDownloadTask_willDownloadToURL___block_invoke;
        v10[3] = &unk_1E14FBED8;
        delegateDispatchQueue = v8->_delegateDispatchQueue;
        v10[4] = v8->_delegate_ivar;
        v10[5] = v8;
        v10[6] = self;
        v10[7] = a3;
        if (delegateDispatchQueue)
          dispatch_async(delegateDispatchQueue, v10);
        else
          -[NSOperationQueue addOperationWithBlock:](v8->_delegateQueue_ivar, "addOperationWithBlock:", v10);
      }
    }
  }
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  SEL v8;
  NSObject *v9;
  void *v10;
  SEL v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSURL *Property;
  NSURL *v16;
  uint64_t v17;
  NSURL *v18;
  objc_super v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  NSURL *v24;
  __int16 v25;
  NSURL *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)objc_msgSend(a3, "domain");
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
      goto LABEL_20;
    v6 = objc_msgSend(a3, "code");
    if (!self || v6 != -999)
      goto LABEL_20;
  }
  else if (!self)
  {
    goto LABEL_20;
  }
  if (objc_getProperty(self, a2, 856, 1))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if (objc_msgSend(v7, "fileExistsAtPath:", objc_msgSend(objc_getProperty(self, v8, 856, 1), "path")))
    {
      v20 = 0;
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", -[NSURL path](-[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"), "path"))&& (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"), &v20) & 1) == 0)
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v9 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          v17 = v20;
          v18 = -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL");
          *(_DWORD *)buf = 138412546;
          v22 = v17;
          v23 = 2112;
          v24 = v18;
          _os_log_error_impl(&dword_183ECA000, v9, OS_LOG_TYPE_ERROR, "Background download error %@ removing item at %@", buf, 0x16u);
        }
      }
      v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      if ((objc_msgSend(v10, "linkItemAtURL:toURL:error:", objc_getProperty(self, v11, 856, 1), -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL"), &v20) & 1) == 0)
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v12 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          v14 = v20;
          Property = (NSURL *)objc_getProperty(self, v13, 856, 1);
          v16 = -[__NSCFBackgroundAVAssetDownloadTask destinationURL](self, "destinationURL");
          *(_DWORD *)buf = 138412802;
          v22 = v14;
          v23 = 2112;
          v24 = Property;
          v25 = 2112;
          v26 = v16;
          _os_log_error_impl(&dword_183ECA000, v12, OS_LOG_TYPE_ERROR, "Background download error %@ linking item at %@ to %@", buf, 0x20u);
        }
      }
    }
  }
LABEL_20:
  v19.receiver = self;
  v19.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_didFinishWithError:](&v19, sel__onqueue_didFinishWithError_, a3);
}

- (void)_onqueue_willDownloadVariants:(id)a3
{
  NSURLSession *v5;
  NSObject *delegateDispatchQueue;
  _QWORD v7[8];

  if (-[NSURLSessionTask session](self, "session"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = -[NSURLSessionTask session](self, "session");
      if (v5)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __66__NSURLSession_delegate_AVAssetDownloadTask_willDownloadVariants___block_invoke;
        v7[3] = &unk_1E14FBED8;
        delegateDispatchQueue = v5->_delegateDispatchQueue;
        v7[4] = v5->_delegate_ivar;
        v7[5] = v5;
        v7[6] = self;
        v7[7] = a3;
        if (delegateDispatchQueue)
          dispatch_async(delegateDispatchQueue, v7);
        else
          -[NSOperationQueue addOperationWithBlock:](v5->_delegateQueue_ivar, "addOperationWithBlock:", v7);
      }
    }
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundAVAssetDownloadTask;
  if (-[__NSCFBackgroundAVAssetDownloadTask isKindOfClass:](&v5, sel_isKindOfClass_)
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (id)originalRequest
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("AVAssetDownloadTask does not support originalRequest property"), 0));
}

- (id)currentRequest
{
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  __NSCFBackgroundAVAssetDownloadTask *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v3 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_debug_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEBUG, "%@<%p> simulating currentRequest property", (uint8_t *)&v5, 0x16u);
  }
  return +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", self->_URL);
}

- (id)response
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("AVAssetDownloadTask does not support response property"), 0));
}

- (BOOL)_isAVAssetTask
{
  return 1;
}

- (id)progress
{
  os_unfair_lock_s *p_progressLock;
  int64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  p_progressLock = &self->_progressLock;
  os_unfair_lock_lock(&self->_progressLock);
  if (!self->_progress)
  {
    if (-[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive") < 1)
      v4 = -1;
    else
      v4 = -[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive");
    self->_progress = (NSProgress *)(id)objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v4);
    if (-[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived") >= 1)
      -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived"));
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke;
    v9[3] = &unk_1E14FE118;
    v9[4] = self;
    -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke_2;
    v8[3] = &unk_1E14FE118;
    v8[4] = self;
    -[NSProgress setPausingHandler:](self->_progress, "setPausingHandler:", v8);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke_3;
    v7[3] = &unk_1E14FE118;
    v7[4] = self;
    -[NSProgress setResumingHandler:](self->_progress, "setResumingHandler:", v7);
  }
  os_unfair_lock_unlock(p_progressLock);
  return self->_progress;
}

- (void)_finishProgressReporting
{
  os_unfair_lock_s *p_progressLock;

  if (!self->_didCleanupProgress)
  {
    self->_didCleanupProgress = 1;
    p_progressLock = &self->_progressLock;
    os_unfair_lock_lock(&self->_progressLock);
    if (!-[NSURLSessionTask error](self, "error") && !-[NSProgress isFinished](self->_progress, "isFinished"))
      -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"));
    -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", 0);
    -[NSProgress setPausingHandler:](self->_progress, "setPausingHandler:", 0);
    -[NSProgress setResumingHandler:](self->_progress, "setResumingHandler:", 0);
    os_unfair_lock_unlock(p_progressLock);
  }
}

- (id)cookiesForCurrentRequest
{
  return 0;
}

- (unint64_t)AVAssetDownloadToken
{
  return self->_AVAssetDownloadToken;
}

- (void)setAVAssetDownloadToken:(unint64_t)a3
{
  self->_AVAssetDownloadToken = a3;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 816, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 816);
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 824, 1);
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 824);
}

- (AVURLAsset)URLAsset
{
  return (AVURLAsset *)objc_getProperty(self, a2, 832, 1);
}

- (void)setURLAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 840, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 840);
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)objc_getProperty(self, a2, 848, 1);
}

- (void)setLoadedTimeRanges:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 848);
}

@end
