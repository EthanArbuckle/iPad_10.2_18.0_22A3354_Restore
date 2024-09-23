@implementation NewsCoreSensitiveUserDefaults

uint64_t __NewsCoreSensitiveUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.newscore2"));
  v1 = (void *)qword_1ED0F8548;
  qword_1ED0F8548 = v0;

  return _CFPreferencesSetBackupDisabled();
}

@end
