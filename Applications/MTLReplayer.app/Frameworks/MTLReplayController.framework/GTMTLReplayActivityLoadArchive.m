@implementation GTMTLReplayActivityLoadArchive

- (GTMTLReplayActivityLoadArchive)initWithPath:(id)a3
{
  id v5;
  GTMTLReplayActivityLoadArchive *v6;
  GTMTLReplayActivityLoadArchive *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTMTLReplayActivityLoadArchive;
  v6 = -[GTMTLReplayActivity initWithType:](&v9, "initWithType:", CFSTR("loadArchive"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_path, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityLoadArchive;
  v4 = -[GTMTLReplayActivity copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 5, self->_path);
  return v5;
}

- (id)summary
{
  return CFSTR("Loading gputrace");
}

- (id)jsonObject
{
  NSString *activityType;
  NSString *path;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  activityType = self->super._activityType;
  v9[0] = CFSTR("activityType");
  v9[1] = CFSTR("path");
  path = self->_path;
  v10[0] = activityType;
  v10[1] = path;
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
  NSString *path;
  int v7;
  NSString *v8;
  __int16 v9;
  NSString *v10;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    path = self->_path;
    v7 = 138543618;
    v8 = activityType;
    v9 = 2114;
    v10 = path;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
