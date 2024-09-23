@implementation ASDSyncTaskScheduler

+ (id)sharedInstance
{
  objc_opt_self();
  if (_MergedGlobals_22 != -1)
    dispatch_once(&_MergedGlobals_22, &__block_literal_global);
  return (id)qword_1ECFFA970;
}

- (void)scheduleBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

void __38__ASDSyncTaskScheduler_sharedInstance__block_invoke()
{
  ASDSyncTaskScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(ASDSyncTaskScheduler);
  v1 = (void *)qword_1ECFFA970;
  qword_1ECFFA970 = (uint64_t)v0;

}

@end
