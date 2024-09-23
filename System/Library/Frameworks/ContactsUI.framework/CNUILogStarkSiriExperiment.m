@implementation CNUILogStarkSiriExperiment

void __CNUILogStarkSiriExperiment_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "SiriABExperiment");
  v1 = (void *)CNUILogStarkSiriExperiment_cn_once_object_11;
  CNUILogStarkSiriExperiment_cn_once_object_11 = (uint64_t)v0;

}

@end
