@implementation GTMTLReplayActivityCollectCounters

- (GTMTLReplayActivityCollectCounters)initWithCounters:(id)a3 statLocations:(unint64_t)a4 index:(unint64_t)a5
{
  id v9;
  GTMTLReplayActivityCollectCounters *v10;
  GTMTLReplayActivityCollectCounters *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTMTLReplayActivityCollectCounters;
  v10 = -[GTMTLReplayActivity initWithType:](&v13, "initWithType:", CFSTR("collectCounters"));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_counterNames, a3);
    v11->_locations = a4;
    v11->_index = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityCollectCounters;
  v4 = -[GTMTLReplayActivity copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 5, self->_counterNames);
    v5[6] = (id)self->_locations;
    v5[7] = (id)self->_index;
  }
  return v5;
}

- (unsigned)messageSerial
{
  return self->_index;
}

- (id)summary
{
  return CFSTR("Collecting counters");
}

- (id)jsonObject
{
  NSString *activityType;
  NSArray *counterNames;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[6];

  activityType = self->super._activityType;
  counterNames = self->_counterNames;
  v11[0] = CFSTR("activityType");
  v11[1] = CFSTR("counterNames");
  v12[0] = activityType;
  v12[1] = counterNames;
  v11[2] = CFSTR("locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_locations));
  v12[2] = v5;
  v11[3] = CFSTR("index");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_index));
  v12[3] = v6;
  v11[4] = CFSTR("activityStartTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityStartTime));
  v12[4] = v7;
  v11[5] = CFSTR("activityEndTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&time_scale * (double)self->super._activityEndTime));
  v12[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 6));

  return v9;
}

- (void)outputToLog:(id)a3
{
  NSString *activityType;
  unint64_t index;
  unint64_t locations;
  NSArray *counterNames;
  int v9;
  NSString *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  NSArray *v16;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    index = self->_index;
    locations = self->_locations;
    counterNames = self->_counterNames;
    v9 = 138544130;
    v10 = activityType;
    v11 = 2048;
    v12 = index;
    v13 = 2048;
    v14 = locations;
    v15 = 2114;
    v16 = counterNames;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@(%llu):\t0x%08llx %{public}@", (uint8_t *)&v9, 0x2Au);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterNames, 0);
}

@end
