@implementation NSUserDefaults

void __62__NSUserDefaults_ClipServicesExtras__cps_clipServicesDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ClipServices"));
  v1 = (void *)cps_clipServicesDefaults_clipServicesDefaults;
  cps_clipServicesDefaults_clipServicesDefaults = v0;

}

@end
