@implementation PHMediaRequestContext

uint64_t __51__PHMediaRequestContext__registerAndStartRequests___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startRequest");
}

- (void)_registerAndStartRequests:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSMutableSet *inflightRequestIdentifiers;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v31 = v4;
  if (self->_isCancelled)
  {
    os_unfair_lock_unlock(&self->_lock);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          PLImageManagerGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "identifierString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v46 = v12;
            _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "[RM]: %@ Ignoring request start due to cancellation", buf, 0xCu);

          }
          if (PHImageManagerRecordEnabled())
          {
            v13 = objc_msgSend(v10, "requestID");
            objc_msgSend(v10, "identifierString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v13, CFSTR("[RM]: %@ Ignoring request start due to cancellation"), v14);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
      }
      while (v7);
    }
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          -[NSMutableArray addObject:](self->_requests, "addObject:", v20);
          inflightRequestIdentifiers = self->_inflightRequestIdentifiers;
          objc_msgSend(v20, "identifierString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](inflightRequestIdentifiers, "addObject:", v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v17);
    }

    os_unfair_lock_unlock(&self->_lock);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = v15;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v27);
          objc_msgSend(v28, "setSignpostID:", self->_signpostID);
          -[PHMediaRequestContext progressHandler](self, "progressHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setWantsProgress:", v29 != 0);

          if (objc_msgSend(v28, "isSynchronous")
            || dispatch_get_specific(&s_chooserQueueDispatchSpecificKey))
          {
            objc_msgSend(v28, "startRequest");
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __51__PHMediaRequestContext__registerAndStartRequests___block_invoke;
            block[3] = &unk_1E35DF110;
            block[4] = v28;
            dispatch_async((dispatch_queue_t)s_backgroundChooserQueue, block);
          }
          ++v27;
        }
        while (v25 != v27);
        v30 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
        v25 = v30;
      }
      while (v30);
    }
  }

}

- (BOOL)shouldReportProgress
{
  void *v2;
  BOOL v3;

  -[PHMediaRequestContext progressHandler](self, "progressHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)start
{
  NSObject *v3;
  unint64_t managerID;
  uint64_t requestID;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void (**v12)(void *, void *);
  void *v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  const __CFString *v28;
  _QWORD aBlock[5];
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    managerID = self->_managerID;
    requestID = self->_requestID;
    v6 = -[PHMediaRequestContext type](self, "type");
    if (v6 > 6)
      v7 = 0;
    else
      v7 = off_1E35D6AC0[v6];
    -[PHMediaRequestContext asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PHMediaRequestContext isNetworkAccessAllowed](self, "isNetworkAccessAllowed");
    *(_DWORD *)buf = 134219010;
    v11 = CFSTR("N");
    v33 = managerID;
    v34 = 2048;
    if (v10)
      v11 = CFSTR("Y");
    v35 = requestID;
    v36 = 2112;
    v37 = v7;
    v38 = 2112;
    v39 = v9;
    v40 = 2112;
    v41 = v11;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "[RM]: %ld-%ld Starting request with type %@, asset: %@, net: %@", buf, 0x34u);

  }
  if (PHImageManagerRecordEnabled())
  {
    v21 = self->_requestID;
    v22 = self->_managerID;
    v23 = -[PHMediaRequestContext type](self, "type");
    if (v23 > 6)
      v24 = 0;
    else
      v24 = off_1E35D6AC0[v23];
    -[PHMediaRequestContext asset](self, "asset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PHMediaRequestContext isNetworkAccessAllowed](self, "isNetworkAccessAllowed");
    v28 = CFSTR("N");
    if (v27)
      v28 = CFSTR("Y");
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v21, CFSTR("[RM]: %ld-%ld Starting request with type %@, asset: %@, net: %@"), v22, v21, v24, v26, v28);

  }
  if (-[PHMediaRequestContext shouldReportProgress](self, "shouldReportProgress"))
    -[PHMediaRequestContext _setupProgressIfNeeded](self, "_setupProgressIfNeeded");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__PHMediaRequestContext_start__block_invoke;
  aBlock[3] = &unk_1E35D6A28;
  aBlock[4] = self;
  v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PHMediaRequestContext prestartError](self, "prestartError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PHMediaRequestContext prestartError](self, "prestartError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v14);
  }
  else
  {
    -[PHMediaRequestContext initialRequests](self, "initialRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      -[PHMediaRequestContext _registerAndStartRequests:](self, "_registerAndStartRequests:", v14);
    }
    else
    {
      PLImageManagerGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = self->_managerID;
        v17 = self->_requestID;
        *(_DWORD *)buf = 134218240;
        v33 = v16;
        v34 = 2048;
        v35 = v17;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "%ld-%ld Media request started without requesting image or video, this is a no op", buf, 0x16u);
      }

      if (PHImageManagerRecordEnabled())
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", self->_managerID, self->_requestID);
      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = *MEMORY[0x1E0CB2938];
      v31 = CFSTR("Image manager unable to find initial requests, potential request for nonexistent resource");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v19);

      v12[2](v12, v20);
    }
  }

}

- (void)setProgress:(id)a3 forRequestIdentifier:(id)a4
{
  id v6;
  id v7;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[PHMediaRequestContext _setupProgressIfNeeded](self, "_setupProgressIfNeeded");
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKey:](self->_progressByTaskIdentifier, "setObject:forKey:", v7, v6);

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_setupProgressIfNeeded
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSProgress *v5;
  NSProgress *totalProgress;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSProgress *v13;
  NSProgress *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSMutableDictionary *v20;
  NSMutableDictionary *progressByTaskIdentifier;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!self->_totalProgress)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[PHMediaRequestContext progresses](self, "progresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      if (objc_msgSend(v4, "count") == 1)
      {
        objc_msgSend(v4, "firstObject");
        v5 = (NSProgress *)objc_claimAutoreleasedReturnValue();
        totalProgress = self->_totalProgress;
        self->_totalProgress = v5;

      }
      else
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = v4;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = 0;
          v11 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v7);
              v10 += objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "totalUnitCount");
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          }
          while (v9);
        }
        else
        {
          v10 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v10);
        v13 = (NSProgress *)objc_claimAutoreleasedReturnValue();
        v14 = self->_totalProgress;
        self->_totalProgress = v13;

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v15 = v7;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v23 != v18)
                objc_enumerationMutation(v15);
              -[NSProgress addChild:withPendingUnitCount:](self->_totalProgress, "addChild:withPendingUnitCount:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "totalUnitCount", (_QWORD)v22));
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v17);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", (_QWORD)v22);
    v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    progressByTaskIdentifier = self->_progressByTaskIdentifier;
    self->_progressByTaskIdentifier = v20;

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)prestartError
{
  return self->_prestartError;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (int)requestID
{
  return self->_requestID;
}

- (unint64_t)nextRequestIndex
{
  unint64_t *p_nextID;
  unint64_t result;

  p_nextID = &self->_nextID;
  do
    result = __ldaxr(p_nextID);
  while (__stlxr(result + 1, p_nextID));
  return result;
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (PHImageResourceChooser)imageResourceChooser
{
  PHImageResourceChooser *imageResourceChooser;
  PHResourceChooserList *v4;
  PHImageResourceChooser *v5;
  PHImageResourceChooser *v6;

  imageResourceChooser = self->_imageResourceChooser;
  if (!imageResourceChooser)
  {
    if (self->_asset)
    {
      v4 = objc_alloc_init(PHResourceChooserList);
      v5 = -[PHImageResourceChooser initWithChooserList:asset:resourceHandler:]([PHImageResourceChooser alloc], "initWithChooserList:asset:resourceHandler:", v4, self->_asset, 0);
      v6 = self->_imageResourceChooser;
      self->_imageResourceChooser = v5;

      -[PHImageResourceChooser setIsCloudSharedMode:](self->_imageResourceChooser, "setIsCloudSharedMode:", -[PHAsset isCloudSharedAsset](self->_asset, "isCloudSharedAsset"));
      imageResourceChooser = self->_imageResourceChooser;
    }
    else
    {
      imageResourceChooser = 0;
    }
  }
  return imageResourceChooser;
}

- (PHImageDisplaySpec)displaySpec
{
  return self->_displaySpec;
}

- (void)mediaRequest:(id)a3 didReportProgress:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "identifierString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fractionCompleted");
  v8 = v7;

  -[PHMediaRequestContext requestWithIdentifier:didReportProgress:completed:error:](self, "requestWithIdentifier:didReportProgress:completed:error:", v9, 0, 0, v8);
}

- (void)requestWithIdentifier:(id)a3 didReportProgress:(double)a4 completed:(BOOL)a5 error:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  -[PHMediaRequestContext progressHandler](self, "progressHandler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  if (-[PHMediaRequestContext shouldReportProgress](self, "shouldReportProgress")
    && !-[PHMediaRequestContext isCancelled](self, "isCancelled"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKey:](self->_progressByTaskIdentifier, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v12, "setCompletedUnitCount:", vcvtmd_s64_f64((double)objc_msgSend(v12, "totalUnitCount") * a4));
    -[NSProgress fractionCompleted](self->_totalProgress, "fractionCompleted");
    v14 = v13;
    v18 = 0;
    v25 = CFSTR("PHImageResultRequestIDKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_requestID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, id, char *, void *, double))v11)[2](v11, v10, &v18, v16, v14);
    PLImageManagerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v9;
      v21 = 2048;
      v22 = a4;
      v23 = 2048;
      v24 = v14;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %@ request progress is %f, total progress is %f", buf, 0x20u);
    }

    if (PHImageManagerRecordEnabled())
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", self->_requestID, CFSTR("[RM]: %@ request progress is %f, total progress is %f"), v9, *(_QWORD *)&a4, *(_QWORD *)&v14);
    if (v18)
      -[PHMediaRequestContext cancel](self, "cancel");

  }
}

- (BOOL)isCancelled
{
  PHMediaRequestContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isCancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)imageRequest:(id)a3 isQueryingCacheAndDidWait:(BOOL *)a4 didFindImage:(BOOL *)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a3;
  -[PHMediaRequestContext delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaRequestContext:isQueryingCacheForRequest:didWait:didFindImage:resultHandler:", self, v11, a4, a5, v10);

}

- (PHMediaRequestContextDelegate)delegate
{
  return (PHMediaRequestContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)mediaRequest:(id)a3 didFinishWithResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t managerID;
  uint64_t requestID;
  objc_class *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  NSMutableSet *inflightRequestIdentifiers;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  objc_class *v24;
  void *v25;
  unint64_t v26;
  __CFString *v27;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PHMediaRequestContext _produceChildRequestsForRequest:withResult:](self, "_produceChildRequestsForRequest:withResult:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext _registerAndStartRequests:](self, "_registerAndStartRequests:", v8);
  if ((objc_msgSend(v7, "containsValidData") & 1) == 0)
  {
    if (objc_msgSend(v7, "isInCloud"))
    {
      if (!-[PHMediaRequestContext isNetworkAccessAllowed](self, "isNetworkAccessAllowed"))
      {
        objc_msgSend(v7, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          PLImageManagerGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            managerID = self->_managerID;
            requestID = self->_requestID;
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[PHMediaRequestContext type](self, "type");
            if (v15 > 6)
              v16 = 0;
            else
              v16 = off_1E35D6AC0[v15];
            *(_DWORD *)buf = 134218754;
            v29 = managerID;
            v30 = 2048;
            v31 = requestID;
            v32 = 2112;
            v33 = v14;
            v34 = 2112;
            v35 = v16;
            _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld %@ subrequest for %@ request should be reporting network access allowed error", buf, 0x2Au);

          }
          if (PHImageManagerRecordEnabled())
          {
            v22 = self->_requestID;
            v23 = self->_managerID;
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[PHMediaRequestContext type](self, "type");
            if (v26 > 6)
              v27 = 0;
            else
              v27 = off_1E35D6AC0[v26];
            +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v22, CFSTR("[RM] %ld-%ld %@ subrequest for %@ request should be reporting network access allowed error"), v23, v22, v25, v27);

          }
          PHNetworkAccessAllowedRequiredError();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setErrorIfNone:", v17);

        }
      }
    }
  }
  -[PHMediaRequestContext processMediaResult:forRequest:](self, "processMediaResult:forRequest:", v7, v6);
  os_unfair_lock_lock(&self->_lock);
  inflightRequestIdentifiers = self->_inflightRequestIdentifiers;
  objc_msgSend(v6, "identifierString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](inflightRequestIdentifiers, "removeObject:", v19);

  v20 = -[NSMutableSet count](self->_inflightRequestIdentifiers, "count");
  os_unfair_lock_unlock(&self->_lock);
  if (!v20)
  {
    -[PHMediaRequestContext delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mediaRequestContextDidFinish:", self);

  }
}

- (id)_produceChildRequestsForRequest:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[PHMediaRequestContext produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:result:](self, "produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:result:", v7, objc_msgSend(v6, "containsValidData"), objc_msgSend(v6, "isDegraded"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)mediaRequest:(id)a3 didFindLocallyAvailableResult:(BOOL)a4 isDegraded:(BOOL)a5
{
  id v6;

  -[PHMediaRequestContext _produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:](self, "_produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext _registerAndStartRequests:](self, "_registerAndStartRequests:", v6);

}

- (id)_produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5
{
  return -[PHMediaRequestContext produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:result:](self, "produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:result:", a3, a4, a5, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prestartError, 0);
  objc_storeStrong((id *)&self->_supplementaryRequestContext, 0);
  objc_storeStrong((id *)&self->_imageResourceChooser, 0);
  objc_storeStrong((id *)&self->_displaySpec, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_totalProgress, 0);
  objc_storeStrong((id *)&self->_progressByTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_inflightRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

+ (id)imageRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 imageRequestOptions:(id)a6 displaySpec:(id)a7 resultHandler:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PHAdjustmentDataRequestContext *v17;
  PHAdjustmentDataRequestContext *v18;

  v12 = *(_QWORD *)&a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (objc_msgSend(v14, "version") == 16)
  {
    v17 = -[PHAdjustmentDataRequestContext initWithRequestID:managerID:asset:options:resultHandler:]([PHAdjustmentDataRequestContext alloc], "initWithRequestID:managerID:asset:options:resultHandler:", v12, a4, v13, v14, v16);
  }
  else if (objc_msgSend(v14, "version") == 17)
  {
    +[PHSingleMediaRequestContext originalAdjustmentDataRequestContextWithRequestID:managerID:asset:options:resultHandler:](PHSingleMediaRequestContext, "originalAdjustmentDataRequestContextWithRequestID:managerID:asset:options:resultHandler:", v12, a4, v13, v14, v16);
    v17 = (PHAdjustmentDataRequestContext *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = -[PHImageRequestContext initWithRequestID:managerID:asset:displaySpec:options:resultHandler:]([PHImageRequestContext alloc], "initWithRequestID:managerID:asset:displaySpec:options:resultHandler:", v12, a4, v13, v15, v14, v16);
  }
  v18 = v17;

  return v18;
}

- (PHMediaRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 resultHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  PHMediaRequestContext *v16;
  PHMediaRequestContext *v17;
  NSObject *v18;
  NSMutableArray *v19;
  NSMutableArray *requests;
  uint64_t v21;
  id resultHandler;
  NSMutableSet *v23;
  NSMutableSet *inflightRequestIdentifiers;
  uint8_t v26[16];
  objc_super v27;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PHMediaRequestContext;
  v16 = -[PHMediaRequestContext init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_requestID = a3;
    v16->_managerID = a4;
    objc_storeStrong((id *)&v16->_asset, a5);
    if (!v17->_asset)
    {
      PLImageManagerGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "Media context with a nil asset is invalid, will result in a no-op media request", v26, 2u);
      }

      if (PHImageManagerRecordEnabled())
        +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v17->_requestID, CFSTR("Media context with a nil asset is invalid, will result in a no-op media request"));
    }
    objc_storeStrong((id *)&v17->_displaySpec, a6);
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requests = v17->_requests;
    v17->_requests = v19;

    if (v15)
    {
      v21 = objc_msgSend(v15, "copy");
      resultHandler = v17->_resultHandler;
      v17->_resultHandler = (id)v21;

    }
    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    inflightRequestIdentifiers = v17->_inflightRequestIdentifiers;
    v17->_inflightRequestIdentifiers = v23;

    v17->_lock._os_unfair_lock_opaque = 0;
    v17->_signpostID = 0;
    atomic_store(0, (unsigned int *)&v17->_repairAttemptCount);
  }

  return v17;
}

+ (void)initialize
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *attr;

  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
    attr = objc_claimAutoreleasedReturnValue();

    v3 = dispatch_queue_create("com.apple.photos.imgmgr.ctxt.bgchooser", attr);
    v4 = (void *)s_backgroundChooserQueue;
    s_backgroundChooserQueue = (uint64_t)v3;

    dispatch_queue_set_specific((dispatch_queue_t)s_backgroundChooserQueue, &s_chooserQueueDispatchSpecificKey, s_chooserQueueDispatchSpecificKey, 0);
  }
}

- (id)_requestWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_requests;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifierString", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (int64_t)type
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaRequestContext.m"), 249, CFSTR("Subclasses to implement"));

  return 0;
}

- (BOOL)isSynchronous
{
  return 0;
}

- (BOOL)isNetworkAccessAllowed
{
  return 0;
}

- (double)totalProgressFraction
{
  double result;

  -[NSProgress fractionCompleted](self->_totalProgress, "fractionCompleted");
  return result;
}

- (void)beginCustomAsyncWorkWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_inflightRequestIdentifiers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)finishCustomAsyncWorkWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  uint64_t v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_inflightRequestIdentifiers, "removeObject:", v5);

  v6 = -[NSMutableSet count](self->_inflightRequestIdentifiers, "count");
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    -[PHMediaRequestContext delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaRequestContextDidFinish:", self);

  }
}

- (int)maxRepairRequests
{
  return 1;
}

- (BOOL)shouldLimitRepairRequestsPerProcess
{
  return 1;
}

- (id)initialRequests
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaRequestContext.m"), 301, CFSTR("Subclasses to implement"));

  return 0;
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  return 0;
}

- (id)progressHandler
{
  return 0;
}

- (id)progresses
{
  return 0;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaRequestContext.m"), 372, CFSTR("Subclasses to implement"));

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isCancelled = 1;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_requests;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "cancel", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)representsShareableHighQualityResource
{
  return 0;
}

- (BOOL)retryMediaRequest:(id)a3 afterFailureWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  PHMediaRequestContext *v21;
  PHMediaRequestContext *supplementaryRequestContext;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  unsigned int v27;
  _QWORD block[5];
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = PHRequestRetryTypeForRequest(v6, v7);
  switch(v8)
  {
    case 3:
      PLImageManagerGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "identifierString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v13;
        _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ media request requires additional resources to generate adjustment on demand", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lazyProgressContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRequestProgress:", v14);

      objc_initWeak((id *)buf, self);
      -[PHMediaRequestContext asset](self, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[PHMediaRequestContext requestID](self, "requestID");
      v17 = -[PHMediaRequestContext managerID](self, "managerID");
      v18 = -[PHMediaRequestContext isNetworkAccessAllowed](self, "isNetworkAccessAllowed");
      v19 = objc_msgSend(v6, "downloadIntent");
      v20 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_59;
      v32[3] = &unk_1E35D6A50;
      v9 = v14;
      v33 = v9;
      v29[0] = v20;
      v29[1] = 3221225472;
      v29[2] = __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_2;
      v29[3] = &unk_1E35D6A78;
      objc_copyWeak(&v31, (id *)buf);
      v30 = v6;
      +[PHContentEditingInputRequestContext contentEditingInputRequestContextForAsset:requestID:managerID:networkAccessAllowed:downloadIntent:progressHandler:resultHandler:](PHContentEditingInputRequestContext, "contentEditingInputRequestContextForAsset:requestID:managerID:networkAccessAllowed:downloadIntent:progressHandler:resultHandler:", v16, v27, v17, v18, v19, v32, v29);
      v21 = (PHMediaRequestContext *)objc_claimAutoreleasedReturnValue();
      supplementaryRequestContext = self->_supplementaryRequestContext;
      self->_supplementaryRequestContext = v21;

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_3;
      block[3] = &unk_1E35DF110;
      block[4] = self;
      dispatch_async((dispatch_queue_t)s_backgroundChooserQueue, block);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
      v11 = 1;
      break;
    case 2:
      PLImageManagerGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "identifierString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v24;
        v38 = 2112;
        v39 = v7;
        _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "[RM] %{public}@ media request retrying due to error: %@", buf, 0x16u);

      }
      v25 = s_backgroundChooserQueue;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke;
      v34[3] = &unk_1E35DF110;
      v35 = v6;
      dispatch_async(v25, v34);
      v11 = 1;
      v9 = v35;
      break;
    case 1:
      PLImageManagerGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "identifierString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v10;
        v38 = 2112;
        v39 = v7;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "[RM] %{public}@ media request exceeded retry limit, failing with error: %@", buf, 0x16u);

      }
      v11 = 0;
      break;
    default:
      v11 = 0;
      goto LABEL_15;
  }

LABEL_15:
  return v11;
}

- (void)mediaRequest:(id)a3 didRequestRetryWithHintsAllowed:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = s_backgroundChooserQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PHMediaRequestContext_mediaRequest_didRequestRetryWithHintsAllowed___block_invoke;
  block[3] = &unk_1E35D6AA0;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (BOOL)mediaRequestCanRequestRepair:(id)a3
{
  int *p_repairAttemptCount;
  int v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  unint64_t managerID;
  uint64_t requestID;
  const char *v11;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[PHMediaRequestContext maxRepairRequests](self, "maxRepairRequests", a3) < 0)
    goto LABEL_7;
  p_repairAttemptCount = &self->_repairAttemptCount;
  do
    v5 = __ldaxr((unsigned int *)p_repairAttemptCount);
  while (__stlxr(v5 + 1, (unsigned int *)p_repairAttemptCount));
  if (v5 < -[PHMediaRequestContext maxRepairRequests](self, "maxRepairRequests"))
  {
LABEL_7:
    if (!-[PHMediaRequestContext shouldLimitRepairRequestsPerProcess](self, "shouldLimitRepairRequestsPerProcess"))
      return 1;
    do
      v6 = __ldaxr((unsigned int *)&sProcessRepairAttemptCount);
    while (__stlxr(v6 + 1, (unsigned int *)&sProcessRepairAttemptCount));
    if (v6 != 0x7FFFFFFF)
      return 1;
    v7 = atomic_load((unsigned int *)&sProcessRepairAttemptCount);
    PLImageManagerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      managerID = self->_managerID;
      requestID = self->_requestID;
      v16 = 134218752;
      v17 = managerID;
      v18 = 2048;
      v19 = requestID;
      v20 = 2048;
      v21 = 0x7FFFFFFFLL;
      v22 = 1024;
      v23 = v7;
      v11 = "[RM]: %ld-%ld Exceeded process wide limit (%ld) for resource repair requests (%d).";
LABEL_13:
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0x26u);
    }
  }
  else
  {
    v13 = atomic_load((unsigned int *)p_repairAttemptCount);
    PLImageManagerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_managerID;
      v15 = self->_requestID;
      v16 = 134218752;
      v17 = v14;
      v18 = 2048;
      v19 = v15;
      v20 = 2048;
      v21 = -[PHMediaRequestContext maxRepairRequests](self, "maxRepairRequests");
      v22 = 1024;
      v23 = v13;
      v11 = "[RM]: %ld-%ld Exceeded context wide limit (%ld) for resource repair requests (%d).";
      goto LABEL_13;
    }
  }

  return 0;
}

- (void)imageRequest:(id)a3 isRequestingScheduledWorkBlock:(id)a4
{
  id v5;
  void (**v6)(id, id);
  NSObject *v7;
  _QWORD block[4];
  void (**v9)(id, id);
  id v10;
  id location;

  v5 = a3;
  v6 = (void (**)(id, id))a4;
  if (v6)
  {
    if (objc_msgSend(v5, "isSynchronous"))
    {
      v6[2](v6, v5);
    }
    else
    {
      objc_initWeak(&location, v5);
      v7 = s_backgroundChooserQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PHMediaRequestContext_imageRequest_isRequestingScheduledWorkBlock___block_invoke;
      block[3] = &unk_1E35DE1A8;
      objc_copyWeak(&v10, &location);
      v9 = v6;
      dispatch_async(v7, block);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

- (void)adjustmentDataRequest:(id)a3 didReportProgress:(double)a4 completed:(BOOL)a5 error:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a5;
  v10 = a6;
  objc_msgSend(a3, "identifierString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext requestWithIdentifier:didReportProgress:completed:error:](self, "requestWithIdentifier:didReportProgress:completed:error:", v11, v6, v10, a4);

}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (unint64_t)signpostLayoutID
{
  return self->_signpostLayoutID;
}

- (void)setSignpostLayoutID:(unint64_t)a3
{
  self->_signpostLayoutID = a3;
}

- (void)setDisplaySpec:(id)a3
{
  objc_storeStrong((id *)&self->_displaySpec, a3);
}

- (void)setImageResourceChooser:(id)a3
{
  objc_storeStrong((id *)&self->_imageResourceChooser, a3);
}

- (PHMediaRequestContext)supplementaryRequestContext
{
  return self->_supplementaryRequestContext;
}

- (void)setSupplementaryRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryRequestContext, a3);
}

- (void)setPrestartError:(id)a3
{
  objc_storeStrong((id *)&self->_prestartError, a3);
}

void __69__PHMediaRequestContext_imageRequest_isRequestingScheduledWorkBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __70__PHMediaRequestContext_mediaRequest_didRequestRetryWithHintsAllowed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "imageResourceChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowHints:", *(unsigned __int8 *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "imageResourceChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveFirst");

  return objc_msgSend(*(id *)(a1 + 40), "startRequest");
}

uint64_t __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareForRetry");
  return objc_msgSend(*(id *)(a1 + 32), "startRequest");
}

uint64_t __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_59(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)((double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount") * a2));
}

void __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSupplementaryRequestContext:", 0);
  if (objc_msgSend(v3, "containsValidData"))
  {
    objc_msgSend(*(id *)(a1 + 32), "prepareForRetry");
    objc_msgSend(*(id *)(a1 + 32), "startRequest");
  }
  else
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB2938];
      v9[0] = CFSTR("Supplementary content editing request failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 32), "configureWithError:", v5);
    objc_msgSend(*(id *)(a1 + 32), "startRequest");

  }
}

uint64_t __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "start");
}

void __30__PHMediaRequestContext_start__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id WeakRetained;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[1];
  v5 = a2;
  +[PHCompositeMediaResult resultWithRequestID:error:](PHCompositeMediaResult, "resultWithRequestID:error:", objc_msgSend(v3, "requestID"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v4 + 16))(v4, v6, 0, *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "mediaRequestContextDidFinish:", *(_QWORD *)(a1 + 32));

}

+ (id)videoRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 videoRequestOptions:(id)a6 intent:(int64_t)a7 resultHandler:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  PHImageDisplaySpec *v16;
  double v17;
  double v18;
  PHImageDisplaySpec *v19;
  PHVideoRequestContext *v20;

  v12 = *(_QWORD *)&a3;
  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = [PHImageDisplaySpec alloc];
  objc_msgSend(v14, "targetSize");
  v19 = -[PHImageDisplaySpec initWithTargetSize:contentMode:](v16, "initWithTargetSize:contentMode:", objc_msgSend(v14, "contentMode"), v17, v18);
  v20 = -[PHVideoRequestContext initWithRequestID:managerID:asset:displaySpec:options:intent:resultHandler:]([PHVideoRequestContext alloc], "initWithRequestID:managerID:asset:displaySpec:options:intent:resultHandler:", v12, a4, v15, v19, v14, a7, v13);

  return v20;
}

+ (id)livePhotoRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 livePhotoRequestOptions:(id)a6 displaySpec:(id)a7 resultHandler:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PHLivePhotoRequestContext *v17;

  v12 = *(_QWORD *)&a3;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = -[PHLivePhotoRequestContext initWithRequestID:managerID:asset:displaySpec:options:resultHandler:]([PHLivePhotoRequestContext alloc], "initWithRequestID:managerID:asset:displaySpec:options:resultHandler:", v12, a4, v16, v14, v15, v13);

  return v17;
}

+ (id)contentEditingInputRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8
{
  _BOOL8 v8;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  PHContentEditingInputRequestContext *v16;

  v8 = a7;
  v12 = *(_QWORD *)&a3;
  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = -[PHContentEditingInputRequestContext initWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:]([PHContentEditingInputRequestContext alloc], "initWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:", v12, a4, v15, v14, v8, v13);

  return v16;
}

+ (OS_dispatch_queue)chooserQueue
{
  return (OS_dispatch_queue *)(id)s_backgroundChooserQueue;
}

@end
