@implementation WFCNContactSystemShortcutsUserDefaults

void __WFCNContactSystemShortcutsUserDefaults_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v1 = objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x24BEC1800]);
  v2 = (void *)WFCNContactSystemShortcutsUserDefaults_systemShortcutsUserDefaults;
  WFCNContactSystemShortcutsUserDefaults_systemShortcutsUserDefaults = v1;

}

@end
