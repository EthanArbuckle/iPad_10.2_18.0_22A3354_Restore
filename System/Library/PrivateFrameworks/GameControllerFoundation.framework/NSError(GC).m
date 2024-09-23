@implementation NSError(GC)

- (id)gc_failingKeyPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "gc_objectForKey:ofClass:error:", CFSTR("GCFailingKeyPathErrorKey"), objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
