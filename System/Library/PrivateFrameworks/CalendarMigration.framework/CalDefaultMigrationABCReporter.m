@implementation CalDefaultMigrationABCReporter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  return (id)sharedInstance_sharedInstance_0;
}

void __48__CalDefaultMigrationABCReporter_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v0;

}

- (void)reportIssueWithType:(id)a3 subtype:(id)a4 context:(id)a5 events:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = (objc_class *)MEMORY[0x24BE13F58];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_msgSend([v9 alloc], "initWithType:subtype:context:", v13, v12, v11);

  objc_msgSend(v14, "setEvents:", v10);
  objc_msgSend(v14, "setIgnoreRateLimiting:", 1);
  objc_msgSend(v14, "report");

}

@end
