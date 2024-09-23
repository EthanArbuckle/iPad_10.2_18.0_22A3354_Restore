@implementation GTMTLReplayActivityHarvestResourceObject

- (GTMTLReplayActivityHarvestResourceObject)initWithAttributes:(id)a3
{
  id v5;
  GTMTLReplayActivityHarvestResourceObject *v6;
  GTMTLReplayActivityHarvestResourceObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTMTLReplayActivityHarvestResourceObject;
  v6 = -[GTMTLReplayActivity initWithType:](&v9, "initWithType:", CFSTR("harvestResourceObject"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attributes, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityHarvestResourceObject;
  v4 = -[GTMTLReplayActivity copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 5, self->_attributes);
  return v5;
}

- (id)summary
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  int *v6;
  const char *v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("type")));
  if (!v3)
  {
    v5 = CFSTR("a");
    goto LABEL_9;
  }
  v4 = objc_opt_class(NSNumber, v2);
  v5 = CFSTR("a");
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
LABEL_9:
    v8 = CFSTR("resource");
    goto LABEL_19;
  }
  v6 = (int *)objc_msgSend(v3, "unsignedLongLongValue");
  if ((uint64_t)v6 <= 21)
  {
    if (v6 == (int *)((char *)&dword_0 + 1))
    {
      v7 = "Texture";
      goto LABEL_17;
    }
    if (v6 == (int *)((char *)&dword_0 + 2))
    {
      v7 = "Buffer";
      goto LABEL_17;
    }
  }
  else
  {
    if (v6 == (int *)((char *)&dword_14 + 2))
    {
      v7 = "Threadgroup buffer";
      goto LABEL_17;
    }
    if (v6 == &dword_18)
    {
      v7 = "Indirect command buffer";
      goto LABEL_17;
    }
    if (v6 == (int *)((char *)&stru_20.cmdsize + 3))
    {
      v7 = "Rasterization rate map";
      goto LABEL_17;
    }
  }
  v7 = "Resource";
LABEL_17:
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
  if (v6 == &dword_18)
    v5 = CFSTR("an");
LABEL_19:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Harvesting %@ %@"), v5, v8));

  return v9;
}

- (id)jsonObject
{
  NSString *activityType;
  NSDictionary *attributes;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  activityType = self->super._activityType;
  v9[0] = CFSTR("activityType");
  v9[1] = CFSTR("attributes");
  attributes = self->_attributes;
  v10[0] = activityType;
  v10[1] = attributes;
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
  NSDictionary *attributes;
  int v7;
  NSString *v8;
  __int16 v9;
  NSDictionary *v10;

  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    attributes = self->_attributes;
    v7 = 138543618;
    v8 = activityType;
    v9 = 2114;
    v10 = attributes;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
