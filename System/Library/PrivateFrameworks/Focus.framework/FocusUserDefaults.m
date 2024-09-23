@implementation FocusUserDefaults

void ___FocusUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.Focus"));
  v1 = (void *)_FocusUserDefaults___userDefaults;
  _FocusUserDefaults___userDefaults = v0;

}

@end
