@implementation __NSCFBackgroundAVAggregateAssetDownloadTask

- (__NSCFBackgroundAVAggregateAssetDownloadTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  __NSCFBackgroundAVAggregateAssetDownloadTask *v6;
  double v7;
  double Helper_x8__OBJC_CLASS___AVURLAsset;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *isa;
  _QWORD v14[5];
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  v6 = -[__NSCFBackgroundSessionTask initWithTaskInfo:taskGroup:ident:](&v15, sel_initWithTaskInfo_taskGroup_ident_, a3, a4, a5);
  if (v6)
  {
    if ((objc_msgSend(a3, "initializedWithAVAsset") & 1) != 0)
    {
      v6->_AVAssetDownloadToken = objc_msgSend(a3, "AVAssetDownloadToken");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "AVAssetDownloadToken"));
      Helper_x8__OBJC_CLASS___AVURLAsset = gotLoadHelper_x8__OBJC_CLASS___AVURLAsset(v7);
      v10 = *(void **)(v9 + 952);
      v16 = CFSTR("AVURLAssetDownloadTokenKey");
      v17[0] = v11;
      -[__NSCFBackgroundAVAggregateAssetDownloadTask setURLAsset:](v6, "setURLAsset:", objc_msgSend(v10, "URLAssetWithURL:options:", 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, Helper_x8__OBJC_CLASS___AVURLAsset)));
      v6->_childAssetDownloadTasksSessionIdentifier = (NSString *)(id)objc_msgSend(a3, "avAssetDownloadChildDownloadSessionIdentifier");
      if (v6->_childAssetDownloadTasksSessionIdentifier)
      {
        isa = -[NSURLSessionTask session](v6, "session");
        if (isa)
          isa = isa[15].isa;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke;
        v14[3] = &unk_1E14FE118;
        v14[4] = v6;
        dispatch_async(isa, v14);
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  objc_super v7;

  objc_setProperty_atomic_copy(self, v3, 0, 816);
  objc_setProperty_atomic_copy(self, v4, 0, 824);
  -[__NSCFBackgroundAVAggregateAssetDownloadTask setURLAsset:](self, "setURLAsset:", 0);
  objc_setProperty_atomic_copy(self, v5, 0, 832);
  objc_setProperty_atomic(self, v6, 0, 808);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  -[__NSCFBackgroundSessionTask dealloc](&v7, sel_dealloc);
}

- (BOOL)isKindOfClass:(Class)a3
{
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  if (-[__NSCFBackgroundAVAggregateAssetDownloadTask isKindOfClass:](&v6, sel_isKindOfClass_))
    return 1;
  gotLoadHelper_x8__OBJC_CLASS___AVAggregateAssetDownloadTask(v4);
  return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (id)originalRequest
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("AVAggregateAssetDownloadTask does not support originalRequest property"), 0));
}

- (id)currentRequest
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("AVAggregateAssetDownloadTask does not support currentRequest property"), 0));
}

- (id)response
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("AVAggregateAssetDownloadTask does not support response property"), 0));
}

- (BOOL)_isAVAssetTask
{
  return 1;
}

- (void)_onqueue_resume
{
  NSArray *childAssetDownloadTasks;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_resume](&v13, sel__onqueue_resume);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  if (self)
    childAssetDownloadTasks = self->_childAssetDownloadTasks;
  else
    childAssetDownloadTasks = 0;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](childAssetDownloadTasks, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(childAssetDownloadTasks);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "state", (_QWORD)v9) == 1)
        {
          objc_msgSend(v8, "setEarliestBeginDate:", -[NSURLSessionTask earliestBeginDate](self, "earliestBeginDate"));
          objc_msgSend(v8, "resume");
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](childAssetDownloadTasks, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }
}

- (void)_onqueue_suspend
{
  __NSCFBackgroundAVAggregateAssetDownloadTask *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v2 = self;
  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_suspend](&v12, sel__onqueue_suspend);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  if (v2)
    v2 = (__NSCFBackgroundAVAggregateAssetDownloadTask *)v2->_childAssetDownloadTasks;
  v3 = -[__NSCFBackgroundAVAggregateAssetDownloadTask countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v7, "state", (_QWORD)v8))
          objc_msgSend(v7, "suspend");
      }
      v4 = -[__NSCFBackgroundAVAggregateAssetDownloadTask countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v4);
  }
}

- (void)_onqueue_cancel
{
  __NSCFBackgroundAVAggregateAssetDownloadTask *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (__NSCFBackgroundAVAggregateAssetDownloadTask *)self->_childAssetDownloadSession;
  -[__NSCFBackgroundAVAggregateAssetDownloadTask invalidateAndCancel](self, "invalidateAndCancel");
  v3.receiver = v2;
  v3.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_cancel](&v3, sel__onqueue_cancel);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSURLSession *v8;
  _QWORD block[7];

  v8 = -[NSURLSessionTask session](self, "session", a3);
  if (v8)
    v8 = (NSURLSession *)v8->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E14FE1E0;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(&v8->super, block);
}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  NSURLSession *v10;
  _QWORD v11[8];

  v10 = -[NSURLSessionTask session](self, "session", a3);
  if (v10)
    v10 = (NSURLSession *)v10->_workQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke;
  v11[3] = &unk_1E14FCA28;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a5;
  v11[7] = a6;
  dispatch_async(&v10->super, v11);
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  NSURLSession *v8;
  _QWORD block[7];

  v8 = -[NSURLSessionTask session](self, "session", a3);
  if (v8)
    v8 = (NSURLSession *)v8->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_willDownloadToURL___block_invoke;
  block[3] = &unk_1E14FE1E0;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(&v8->super, block);
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  NSURLSession *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v12 = -[NSURLSessionTask session](self, "session", a3);
  if (v12)
    v12 = (NSURLSession *)v12->_workQueue;
  block[1] = 3221225472;
  v13 = *(_OWORD *)&a5->var0.var3;
  v18 = *(_OWORD *)&a5->var0.var0;
  v19 = v13;
  v14 = *(_OWORD *)&a5->var1.var1;
  v15 = *(_OWORD *)&a7->var1.var1;
  v16 = *(_OWORD *)&a7->var0.var0;
  v22 = *(_OWORD *)&a7->var0.var3;
  v23 = v15;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __140____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke;
  block[3] = &unk_1E14F9AC8;
  block[4] = self;
  block[5] = a4;
  block[6] = a6;
  v20 = v14;
  v21 = v16;
  dispatch_async(&v12->super, block);
}

- (id)cookiesForCurrentRequest
{
  return 0;
}

- (AVURLAsset)URLAsset
{
  return (AVURLAsset *)objc_getProperty(self, a2, 792, 1);
}

- (void)setURLAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

@end
