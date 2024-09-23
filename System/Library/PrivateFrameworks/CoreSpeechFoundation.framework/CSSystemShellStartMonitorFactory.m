@implementation CSSystemShellStartMonitorFactory

+ (id)defaultShellStartMonitor
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  __objc2_class **v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getCLFSystemShellSwitcherClass_softClass;
  v12 = getCLFSystemShellSwitcherClass_softClass;
  if (!getCLFSystemShellSwitcherClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getCLFSystemShellSwitcherClass_block_invoke;
    v8[3] = &unk_1E6880290;
    v8[4] = &v9;
    __getCLFSystemShellSwitcherClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "isClarityBoardEnabled");

  v6 = off_1E687CB48;
  if (v5)
    v6 = off_1E687C8D8;
  -[__objc2_class sharedInstance](*v6, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
