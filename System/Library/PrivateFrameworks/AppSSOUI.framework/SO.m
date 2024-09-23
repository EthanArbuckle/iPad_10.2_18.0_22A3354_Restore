@implementation SO

void __SO_LOG_SOUIAuthorizationViewController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOUIAuthorizationViewController");
  v1 = (void *)SO_LOG_SOUIAuthorizationViewController_log;
  SO_LOG_SOUIAuthorizationViewController_log = (uint64_t)v0;

}

@end
