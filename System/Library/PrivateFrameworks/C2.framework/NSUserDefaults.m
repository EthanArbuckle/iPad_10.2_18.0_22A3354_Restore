@implementation NSUserDefaults

void __46__NSUserDefaults_C2Defaults__c2DefaultsDomain__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.c2"));
  v1 = (void *)c2DefaultsDomain_c2DefaultsDomain;
  c2DefaultsDomain_c2DefaultsDomain = v0;

}

@end
