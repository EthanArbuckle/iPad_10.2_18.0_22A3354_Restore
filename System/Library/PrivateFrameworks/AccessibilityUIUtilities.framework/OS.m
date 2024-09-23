@implementation OS

OS_os_log *__getBFFStyleClass_block_invoke_cold_1()
{
  void *v0;
  SEL v1;

  v0 = (void *)abort_report_np();
  return +[AXUIDaemonApplicationDelegate loggingFacility](v0, v1);
}

@end
