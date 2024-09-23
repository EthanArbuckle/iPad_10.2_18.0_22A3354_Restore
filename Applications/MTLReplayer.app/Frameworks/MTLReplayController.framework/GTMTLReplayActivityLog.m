@implementation GTMTLReplayActivityLog

- (id)init:(BOOL)a3
{
  GTMTLReplayActivityLog *v4;
  GTMTLReplayActivityLog *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityLog;
  v4 = -[GTMTLReplayActivityLog init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_log, &_os_log_default);
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_retainActivityLog = a3;
  }
  return v5;
}

- (GTMTLReplayActivityLog)initWithLog:(id)a3
{
  id *v4;
  GTMTLReplayActivityLog *v5;
  GTMTLReplayActivityLog *v6;
  GTMTLReplayActivityLog *v7;
  objc_super v9;

  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)GTMTLReplayActivityLog;
  v5 = -[GTMTLReplayActivityLog init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v5->_log, v4[1]);
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_gputracePath, v4[2]);
    objc_storeStrong((id *)&v6->_lastBreadcrumb, v4[3]);
    objc_storeStrong((id *)&v6->_lastActivity, v4[4]);
    v6->_retainActivityLog = *((_BYTE *)v4 + 40);
  }
  v7 = v6;
LABEL_6:

  return v7;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = ArrayFromActivities(self->_lastBreadcrumb, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)logActivitiesToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *log;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;

  v4 = ArrayFromActivities(a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 3, 0));

  v7 = objc_alloc((Class)NSURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "temporaryDirectory"));
  v10 = objc_msgSend(v7, "initFileURLWithPath:relativeToURL:", CFSTR("GTMTLReplayActivityLog.json"), v9);

  objc_msgSend(v6, "writeToURL:atomically:", v10, 0);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v12 = log;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "logPath:\t%{public}@", (uint8_t *)&v14, 0xCu);

  }
}

- (void)logCommandBuffer:(id)a3 atIndex:(unsigned int)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSString *v8;
  GTMTLReplayActivity *v9;
  GTMTLReplayActivity *v10;
  GTMTLReplayActivity *v11;
  NSString *v12;
  GTMTLReplayActivity *v13;
  _QWORD v14[4];
  GTMTLReplayActivity *v15;
  NSString *v16;
  GTMTLReplayActivityLog *v17;
  GTMTLReplayActivity *v18;
  unsigned int v19;

  if (a3)
  {
    p_lock = &self->_lock;
    v7 = a3;
    os_unfair_lock_lock(p_lock);
    v8 = self->_gputracePath;
    v9 = self->_lastBreadcrumb;
    v10 = self->_lastActivity;
    -[GTMTLReplayActivity signpostIntervalBegin:](v9, "signpostIntervalBegin:", os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v7));
    os_unfair_lock_unlock(p_lock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __51__GTMTLReplayActivityLog_logCommandBuffer_atIndex___block_invoke;
    v14[3] = &unk_725680;
    v19 = a4;
    v15 = v9;
    v16 = v8;
    v17 = self;
    v18 = v10;
    v11 = v10;
    v12 = v8;
    v13 = v9;
    objc_msgSend(v7, "addCompletedHandler:", v14);

  }
}

- (void)logCommandBuffer:(id)a3 withKey:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSString *v8;
  GTMTLReplayActivity *v9;
  GTMTLReplayActivity *v10;
  GTMTLReplayActivity *v11;
  NSString *v12;
  GTMTLReplayActivity *v13;
  _QWORD v14[4];
  GTMTLReplayActivity *v15;
  NSString *v16;
  GTMTLReplayActivityLog *v17;
  GTMTLReplayActivity *v18;
  unint64_t v19;

  if (a3)
  {
    p_lock = &self->_lock;
    v7 = a3;
    os_unfair_lock_lock(p_lock);
    v8 = self->_gputracePath;
    v9 = self->_lastBreadcrumb;
    v10 = self->_lastActivity;
    -[GTMTLReplayActivity signpostIntervalBegin:](v9, "signpostIntervalBegin:", os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v7));
    os_unfair_lock_unlock(p_lock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __51__GTMTLReplayActivityLog_logCommandBuffer_withKey___block_invoke;
    v14[3] = &unk_7256A8;
    v18 = v10;
    v19 = a4;
    v15 = v9;
    v16 = v8;
    v17 = self;
    v11 = v10;
    v12 = v8;
    v13 = v9;
    objc_msgSend(v7, "addCompletedHandler:", v14);

  }
}

- (void)logSharedCommandBuffer:(id)a3
{
  -[GTMTLReplayActivityLog logCommandBuffer:atIndex:](self, "logCommandBuffer:atIndex:", a3, 0xFFFFFFFFLL);
}

- (id)getBreadcrumbSummary
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = BreadcrumbSummary(self->_lastBreadcrumb);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)getBreadcrumbsAsJSON
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = ArrayFromActivities(self->_lastBreadcrumb, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 3, 0));

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)enterActivity:(id)a3
{
  GTMTLReplayActivity *v4;
  GTMTLReplayActivity *lastBreadcrumb;

  v4 = (GTMTLReplayActivity *)a3;
  os_unfair_lock_lock(&self->_lock);
  -[GTMTLReplayActivity setPreviousActivity:](v4, "setPreviousActivity:", self->_lastBreadcrumb);
  lastBreadcrumb = self->_lastBreadcrumb;
  self->_lastBreadcrumb = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)leaveActivity
{
  os_unfair_lock_s *p_lock;
  GTMTLReplayActivity *v4;
  GTMTLReplayActivity *lastBreadcrumb;
  GTMTLReplayActivity *v6;
  GTMTLReplayActivity *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_lastBreadcrumb;
  v4 = (GTMTLReplayActivity *)objc_claimAutoreleasedReturnValue(-[GTMTLReplayActivity previousActivity](v7, "previousActivity"));
  lastBreadcrumb = self->_lastBreadcrumb;
  self->_lastBreadcrumb = v4;

  if (!self->_lastBreadcrumb && self->_retainActivityLog)
  {
    v6 = (GTMTLReplayActivity *)-[GTMTLReplayActivity copy](v7, "copy");

    -[GTMTLReplayActivity setEndTime:](v6, "setEndTime:", mach_absolute_time());
    -[GTMTLReplayActivity setPreviousActivity:](v6, "setPreviousActivity:", self->_lastActivity);
    objc_storeStrong((id *)&self->_lastActivity, v6);
    v7 = v6;
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)enterMessage:(id)a3
{
  id v4;
  GTMTLReplayActivityMessage *v5;

  v4 = a3;
  v5 = -[GTMTLReplayActivityMessage initWithMessage:]([GTMTLReplayActivityMessage alloc], "initWithMessage:", v4);

  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v5);
}

- (void)enterLoadArchiveWithPath:(id)a3
{
  NSString *v4;
  NSString *gputracePath;
  NSString *v6;
  GTMTLReplayActivityLoadArchive *v7;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  gputracePath = self->_gputracePath;
  self->_gputracePath = v4;
  v6 = v4;

  os_unfair_lock_unlock(&self->_lock);
  v7 = -[GTMTLReplayActivityLoadArchive initWithPath:]([GTMTLReplayActivityLoadArchive alloc], "initWithPath:", v6);

  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v7);
}

- (void)enterHarvestResourceObjectWithAttributes:(id)a3
{
  id v4;
  GTMTLReplayActivityHarvestResourceObject *v5;

  v4 = a3;
  v5 = -[GTMTLReplayActivityHarvestResourceObject initWithAttributes:]([GTMTLReplayActivityHarvestResourceObject alloc], "initWithAttributes:", v4);

  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v5);
}

- (void)enterRestoreCommandBufferAtIndex:(unsigned int)a3
{
  GTMTLReplayActivityRestoreCommandBuffer *v4;

  v4 = -[GTMTLReplayActivityRestoreCommandBuffer initWithIndex:]([GTMTLReplayActivityRestoreCommandBuffer alloc], "initWithIndex:", *(_QWORD *)&a3);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v4);

}

- (void)enterRestoreResources:(const GTResourceDownloaderRequest *)a3 count:(int)a4
{
  GTMTLReplayActivityRestoreResources *v5;

  v5 = -[GTMTLReplayActivityRestoreResources initWithRequests:count:]([GTMTLReplayActivityRestoreResources alloc], "initWithRequests:count:", a3, *(_QWORD *)&a4);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v5);

}

- (void)enterRewind
{
  GTMTLReplayActivity *v3;

  v3 = -[GTMTLReplayActivity initWithType:]([GTMTLReplayActivity alloc], "initWithType:", CFSTR("rewind"));
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v3);

}

- (void)enterArgumentBufferUpload
{
  GTMTLReplayActivity *v3;

  v3 = -[GTMTLReplayActivity initWithType:]([GTMTLReplayActivity alloc], "initWithType:", CFSTR("argumentBufferUpload"));
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v3);

}

- (void)enterArgumentBufferDownload
{
  GTMTLReplayActivity *v3;

  v3 = -[GTMTLReplayActivity initWithType:]([GTMTLReplayActivity alloc], "initWithType:", CFSTR("argumentBufferDownload"));
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v3);

}

- (void)enterDebugFuncStopFromIndex:(id)a3 toIndex:(id)a4
{
  GTMTLReplayActivityDebugFuncStop *v5;

  v5 = -[GTMTLReplayActivityDebugFuncStop initWithCurrentIndex:targetIndex:]([GTMTLReplayActivityDebugFuncStop alloc], "initWithCurrentIndex:targetIndex:", a3, a4);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v5);

}

- (void)enterCollectCounters:(id)a3 statLocations:(unint64_t)a4 withIndex:(unint64_t)a5
{
  id v8;
  GTMTLReplayActivityCollectCounters *v9;

  v8 = a3;
  v9 = -[GTMTLReplayActivityCollectCounters initWithCounters:statLocations:index:]([GTMTLReplayActivityCollectCounters alloc], "initWithCounters:statLocations:index:", v8, a4, a5);

  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v9);
}

- (void)enterPerformFrameTimingForIndex:(int)a3
{
  GTMTLReplayActivityPerformFrameTiming *v4;

  v4 = -[GTMTLReplayActivityPerformFrameTiming initWithIndex:]([GTMTLReplayActivityPerformFrameTiming alloc], "initWithIndex:", *(_QWORD *)&a3);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v4);

}

- (void)enterDisplayAttachmentAtIndex:(id)a3
{
  GTMTLReplayActivityDisplayAttachment *v4;

  v4 = -[GTMTLReplayActivityDisplayAttachment initWithIndex:]([GTMTLReplayActivityDisplayAttachment alloc], "initWithIndex:", a3);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v4);

}

- (void)enterOptimizeRestores
{
  GTMTLReplayActivity *v3;

  v3 = -[GTMTLReplayActivity initWithType:]([GTMTLReplayActivity alloc], "initWithType:", CFSTR("optimizeRestores"));
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v3);

}

- (NSString)gputracePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_lastBreadcrumb, 0);
  objc_storeStrong((id *)&self->_gputracePath, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __51__GTMTLReplayActivityLog_logCommandBuffer_withKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;

  v3 = a2;
  v4 = g_signpostLog;
  v5 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v3);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled((os_log_t)v4))
    {
      *(_DWORD *)buf = 134217984;
      v21 = objc_msgSend(v3, "status");
      _os_signpost_emit_with_name_impl(&dword_0, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v6, "Replayer-3-commandQueue", "%lu", buf, 0xCu);
    }
  }

  if (objc_msgSend(v3, "status") == (char *)&dword_4 + 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64), CFSTR("GTErrorKeyTraceStreamID")));
    v19[0] = v7;
    v18[1] = CFSTR("GTErrorKeyMTLCommandBuffer");
    v8 = GTMTLReplay_dictionaryFromCommandBuffer(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v19[1] = v9;
    v18[2] = CFSTR("GTErrorKeyReplayerContext");
    v10 = BreadcrumbSummary(*(void **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v19[2] = v11;
    v18[3] = CFSTR("GTErrorKeyReplayerBreadcrumbs");
    v12 = ArrayFromActivities(*(void **)(a1 + 32), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v13, 3, 0));
    v19[3] = v14;
    v18[4] = CFSTR("GTErrorKeyGputracePath");
    v15 = *(void **)(a1 + 40);
    v16 = v15;
    if (!v15)
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v19[4] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 5));
    if (!v15)

    objc_msgSend(*(id *)(a1 + 48), "logActivitiesToFile:", *(_QWORD *)(a1 + 56));
    GTMTLReplay_handleCommandBufferError((uint64_t)v17);

  }
}

void __51__GTMTLReplayActivityLog_logCommandBuffer_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;

  v3 = a2;
  v4 = g_signpostLog;
  v5 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v3);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled((os_log_t)v4))
    {
      *(_DWORD *)buf = 134217984;
      v21 = objc_msgSend(v3, "status");
      _os_signpost_emit_with_name_impl(&dword_0, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v6, "Replayer-3-commandQueue", "%lu", buf, 0xCu);
    }
  }

  if (objc_msgSend(v3, "status") == (char *)&dword_4 + 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64), CFSTR("GTErrorKeyFunctionIndex")));
    v19[0] = v7;
    v18[1] = CFSTR("GTErrorKeyMTLCommandBuffer");
    v8 = GTMTLReplay_dictionaryFromCommandBuffer(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v19[1] = v9;
    v18[2] = CFSTR("GTErrorKeyReplayerContext");
    v10 = BreadcrumbSummary(*(void **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v19[2] = v11;
    v18[3] = CFSTR("GTErrorKeyReplayerBreadcrumbs");
    v12 = ArrayFromActivities(*(void **)(a1 + 32), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v13, 3, 0));
    v19[3] = v14;
    v18[4] = CFSTR("GTErrorKeyGputracePath");
    v15 = *(void **)(a1 + 40);
    v16 = v15;
    if (!v15)
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v19[4] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 5));
    if (!v15)

    objc_msgSend(*(id *)(a1 + 48), "logActivitiesToFile:", *(_QWORD *)(a1 + 56));
    GTMTLReplay_handleCommandBufferError((uint64_t)v17);

  }
}

@end
