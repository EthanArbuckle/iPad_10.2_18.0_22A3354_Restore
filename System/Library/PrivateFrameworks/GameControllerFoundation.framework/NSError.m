@implementation NSError

+ (id)gc_deviceDBError:(void *)a3 userInfo:
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_self();
  +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCDeviceDBError"), a2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)gc_dbFailingPath
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "userInfo");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "gc_objectForKey:ofClass:error:", CFSTR("GCDeviceDBErrorFailingPath"), objc_opt_class(), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)gc_ConfigurationError:(void *)a3 userInfo:
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_self();
  +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCConfigurationError"), a2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (NSError)gc_modelError:(uint64_t)a3 userInfo:
{
  objc_opt_self();
  return +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCModelErrorDomain"), a2, a3);
}

@end
