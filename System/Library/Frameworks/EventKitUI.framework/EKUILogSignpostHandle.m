@implementation EKUILogSignpostHandle

void __EKUILogSignpostHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(EKUILogSubsystem, "signpost");
  v1 = (void *)EKUILogSignpostHandle_handle;
  EKUILogSignpostHandle_handle = (uint64_t)v0;

}

@end
