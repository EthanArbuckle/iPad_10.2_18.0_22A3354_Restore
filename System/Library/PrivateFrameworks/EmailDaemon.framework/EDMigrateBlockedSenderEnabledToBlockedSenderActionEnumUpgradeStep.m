@implementation EDMigrateBlockedSenderEnabledToBlockedSenderActionEnumUpgradeStep

+ (BOOL)run
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D1E008];
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0D1E008]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "BOOLValue"))
      v5 = &unk_1E94E48B0;
    else
      v5 = &unk_1E94E48C8;
    objc_msgSend(v2, "setValue:forKey:", v5, *MEMORY[0x1E0D1E000]);
  }
  objc_msgSend(v2, "removeObjectForKey:", v3);

  return 1;
}

@end
