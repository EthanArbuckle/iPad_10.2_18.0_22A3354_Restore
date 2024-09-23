@implementation NSError

+ (id)gc_VirtualControllerError:(void *)a3 userInfo:
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_self();
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("GCVirtualControllerError"), a2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
