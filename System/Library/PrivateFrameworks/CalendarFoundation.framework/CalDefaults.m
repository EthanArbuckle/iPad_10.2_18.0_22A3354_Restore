@implementation CalDefaults

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("display birthdays calendar"), v4, CFSTR("add holiday calendar"), v5, CFSTR("Add default alarms"), v6, CFSTR("Disable invitation alerts"), v7, CFSTR("Disable shared calendar alerts"), v8, CFSTR("CALPrefCrashImmediatelyUponException"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerDefaults:", v10);

  }
}

+ (id)thisProcess
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

+ (id)shared
{
  __CFString *v2;
  id v3;
  _QWORD block[4];
  __CFString *v6;

  v2 = CFSTR("com.apple.mobilecal");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__CalDefaults_shared__block_invoke;
  block[3] = &unk_1E2A84760;
  v6 = v2;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  v3 = (id)shared__defaults;

  return v3;
}

void __21__CalDefaults_shared__block_invoke(uint64_t a1)
{
  void *v2;
  __CFBundle *MainBundle;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  MainBundle = CFBundleGetMainBundle();
  if (objc_msgSend(v2, "isEqualToString:", CFBundleGetIdentifier(MainBundle)))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", *(_QWORD *)(a1 + 32));
  }
  v5 = (void *)shared__defaults;
  shared__defaults = v4;

}

@end
