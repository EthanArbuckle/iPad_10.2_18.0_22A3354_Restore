@implementation DDSTrialManagerDataSource

- (id)createTrialClientWithWorkQueue:(id)a3 query:(id)a4
{
  return +[DDSTrialClient createWithWorkQueue:query:](DDSTrialClient, "createWithWorkQueue:query:", a3, a4);
}

- (BOOL)isEnabled
{
  return _os_feature_enabled_impl();
}

@end
