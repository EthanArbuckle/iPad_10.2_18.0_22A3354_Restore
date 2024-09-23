@implementation ICQuickNoteSessionSettings

+ (void)initialize
{
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D64270];
  v4[0] = CFSTR("ShowOnLockScreen");
  v4[1] = CFSTR("QuickNoteSessionExpiration");
  v5[0] = &unk_1E771A7E0;
  v5[1] = &unk_1E771A7F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v3);

}

+ (int64_t)showOnLockScreen
{
  int64_t v2;
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0D64270], "BOOLForKey:", CFSTR("DisableOnLockScreen")) & 1) != 0)
    return 0;
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("ShowOnLockScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "unsignedIntegerValue"), (unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 3))
    v2 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v2 = 1;

  return v2;
}

+ (void)setShowOnLockScreen:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x1E0D64270];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("ShowOnLockScreen"));

  objc_msgSend(MEMORY[0x1E0D64270], "setBool:forKey:", a3 == 0, CFSTR("DisableOnLockScreen"));
}

+ (int64_t)sessionDuration
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("QuickNoteSessionExpiration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

+ (void)setSessionDuration:(int64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0D64270];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("QuickNoteSessionExpiration"));

}

+ (void)disableNotesOnLockScreenIfNecessary
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Disabling Notes on lock screen because there are no modern accounts", v1, 2u);
}

+ (void)updateNotesOnLockScreenWhenAccountSupportingLockScreenAdded
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (objc_msgSend(a1, "hasAccountSupportingLockScreen"))
  {
    if (objc_msgSend(MEMORY[0x1E0D64270], "BOOLForKey:", CFSTR("DisableOnLockScreen")))
    {
      v3 = objc_msgSend(a1, "showOnLockScreenSettingValue");
      if (v3)
      {
        v4 = v3;
        v5 = os_log_create("com.apple.notes", "QuickNote");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Enabling Notes on lock screen because there are modern accounts", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0D64270], "setBool:forKey:", 0, CFSTR("DisableOnLockScreen"));
        if (v4 != 1)
          objc_msgSend(a1, "setShowOnLockScreen:", 1);
      }
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEFAULT, "Disabling Notes on lock screen because there are no modern accounts", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D64270], "setBool:forKey:", 1, CFSTR("DisableOnLockScreen"));
  }
}

+ (BOOL)hasAccountSupportingLockScreen
{
  void *v2;
  void *v3;

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workerManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = +[ICAccount hasModernAccountInContext:](ICAccount, "hasModernAccountInContext:", v3);
  return (char)v2;
}

+ (int64_t)showOnLockScreenSettingValue
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("ShowOnLockScreen"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "unsignedIntegerValue"), (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") <= 3))
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1;

  return v4;
}

@end
