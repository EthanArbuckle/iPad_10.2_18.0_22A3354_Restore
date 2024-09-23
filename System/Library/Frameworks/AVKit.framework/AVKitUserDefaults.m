@implementation AVKitUserDefaults

void __AVKitUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.avkit"));
  v1 = (void *)AVKitUserDefaults_AVKitUserDefaults;
  AVKitUserDefaults_AVKitUserDefaults = v0;

}

@end
