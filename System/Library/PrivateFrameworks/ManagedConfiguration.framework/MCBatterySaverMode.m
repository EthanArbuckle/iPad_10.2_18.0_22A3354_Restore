@implementation MCBatterySaverMode

+ (BOOL)isBatterySaverModeActive
{
  uint64_t v2;
  _BOOL4 v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v11[16];
  uint64_t state64;
  int out_token;

  out_token = 0;
  state64 = 0;
  if (notify_register_check("com.apple.system.lowpowermode", &out_token))
  {
    v2 = _MCLogObjects;
    v3 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      *(_WORD *)v11 = 0;
      v4 = "Could not check for low power mode\n";
      v5 = v2;
      v6 = OS_LOG_TYPE_ERROR;
LABEL_4:
      _os_log_impl(&dword_19ECC4000, v5, v6, v4, v11, 2u);
LABEL_9:
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    if (notify_get_state(out_token, &state64))
    {
      v7 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Could not get state for low power mode\n", v11, 2u);
      }
      notify_cancel(out_token);
      goto LABEL_9;
    }
    notify_cancel(out_token);
    v8 = state64;
    v9 = _MCLogObjects;
    v3 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (!v3)
        return v3;
      *(_WORD *)v11 = 0;
      v4 = "Low Power Mode is currently disabled";
      v5 = v9;
      v6 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_4;
    }
    if (v3)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_DEFAULT, "Low Power Mode is currently enabled", v11, 2u);
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (BOOL)isBatterySaverModeActive:(int)a3
{
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[8];
  uint64_t state64;

  state64 = 0;
  if (notify_get_state(a3, &state64))
  {
LABEL_2:
    LOBYTE(v3) = 0;
    return v3;
  }
  v4 = state64;
  v5 = _MCLogObjects;
  v3 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v3)
      return v3;
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEFAULT, "Battery Saver Mode is currently disabled", v7, 2u);
    goto LABEL_2;
  }
  if (v3)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_DEFAULT, "Battery Saver Mode is currently enabled", buf, 2u);
  }
  LOBYTE(v3) = 1;
  return v3;
}

+ (id)batterySaverRestrictions
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCHacks sharedHacks](MCHacks, "sharedHacks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantizedAutoLockInSeconds:", &unk_1E4212B50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MCSetValueRestriction:value:", CFSTR("maxInactivity"), v4);

  return v2;
}

+ (id)currentBatterySaverRestrictions
{
  void *v2;

  if (+[MCBatterySaverMode isBatterySaverModeActive](MCBatterySaverMode, "isBatterySaverModeActive"))
  {
    +[MCBatterySaverMode batterySaverRestrictions](MCBatterySaverMode, "batterySaverRestrictions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)currentBatterySaverRestrictions:(int)a3
{
  void *v3;

  if (+[MCBatterySaverMode isBatterySaverModeActive:](MCBatterySaverMode, "isBatterySaverModeActive:", *(_QWORD *)&a3))
  {
    +[MCBatterySaverMode batterySaverRestrictions](MCBatterySaverMode, "batterySaverRestrictions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)setOfActiveRestrictionUUIDs
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MCBatterySaverMode isBatterySaverModeActive](MCBatterySaverMode, "isBatterySaverModeActive"))
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.batterysaver"));
  return v2;
}

@end
