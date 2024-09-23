@implementation OSLogEventLiveStore

- (void)prepareWithCompletionHandler:(id)a3
{
  void (**v3)(id, OSLogEventLiveSource *, _QWORD);
  OSLogEventLiveSource *v4;

  v3 = (void (**)(id, OSLogEventLiveSource *, _QWORD))a3;
  v4 = objc_alloc_init(OSLogEventLiveSource);
  v3[2](v3, v4, 0);

}

+ (id)liveLocalStore
{
  return objc_alloc_init(OSLogEventLiveStore);
}

@end
