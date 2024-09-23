@implementation GTMTLReplayActivityRestoreResources

- (GTMTLReplayActivityRestoreResources)initWithRequests:(const GTResourceDownloaderRequest *)a3 count:(int)a4
{
  GTMTLReplayActivityRestoreResources *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityRestoreResources;
  result = -[GTMTLReplayActivity initWithType:](&v7, "initWithType:", CFSTR("restoreResources"));
  if (result)
  {
    result->_requests = a3;
    result->_requestCount = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityRestoreResources;
  result = -[GTMTLReplayActivity copyWithZone:](&v5, "copyWithZone:", a3);
  if (result)
  {
    *((_QWORD *)result + 5) = self->_requests;
    *((_DWORD *)result + 12) = self->_requestCount;
  }
  return result;
}

- (id)summary
{
  return CFSTR("Restoring resources");
}

- (id)jsonObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v10[0] = self->super._activityType;
  v9[0] = CFSTR("activityType");
  v9[1] = CFSTR("requests");
  v3 = ArrayFromDownloadRequests((uint64_t)self->_requests, self->_requestCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10[1] = v4;
  v9[2] = CFSTR("activityStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityStartTime));
  v10[2] = v5;
  v9[3] = CFSTR("activityEndTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityEndTime));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));

  return v7;
}

- (void)outputToLog:(id)a3
{
  NSString *activityType;
  const GTResourceDownloaderRequest *requests;
  int requestCount;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  void *v14;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    requests = self->_requests;
    requestCount = self->_requestCount;
    v8 = a3;
    v9 = ArrayFromDownloadRequests((uint64_t)requests, requestCount);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138543618;
    v12 = activityType;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)signpostIntervalBegin:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  unsigned int v7;
  NSString *activityType;
  int requestCount;
  _DWORD v10[2];
  __int16 v11;
  NSString *v12;
  __int16 v13;
  int v14;

  v5 = g_signpostLog;
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    v7 = -[GTMTLReplayActivity messageSerial](self, "messageSerial");
    activityType = self->super._activityType;
    requestCount = self->_requestCount;
    v10[0] = 67109634;
    v10[1] = v7;
    v11 = 2112;
    v12 = activityType;
    v13 = 1024;
    v14 = requestCount;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "Replayer-3-commandQueue", "%u. %@ x%d", (uint8_t *)v10, 0x18u);
  }

}

@end
