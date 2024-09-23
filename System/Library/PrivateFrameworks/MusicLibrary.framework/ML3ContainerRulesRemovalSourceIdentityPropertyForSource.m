@implementation ML3ContainerRulesRemovalSourceIdentityPropertyForSource

void __ML3ContainerRulesRemovalSourceIdentityPropertyForSource_block_invoke()
{
  void *v0;
  void *v1;

  objc_storeStrong(ML3ContainerRulesRemovalSourceIdentityPropertyForSource_values, CFSTR("container_pid"));
  objc_storeStrong(&ML3ContainerRulesRemovalSourceIdentityPropertyForSource_values[1], CFSTR("sync_id"));
  objc_storeStrong(&ML3ContainerRulesRemovalSourceIdentityPropertyForSource_values[2], CFSTR("store_cloud_id"));
  objc_storeStrong(&ML3ContainerRulesRemovalSourceIdentityPropertyForSource_values[3], CFSTR("sync_id"));
  v0 = (void *)qword_1EEC7CB88;
  qword_1EEC7CB88 = 0;

  v1 = (void *)qword_1EEC7CB90;
  qword_1EEC7CB90 = 0;

  objc_storeStrong((id *)algn_1EEC7CB98, CFSTR("cloud_global_id"));
}

@end
