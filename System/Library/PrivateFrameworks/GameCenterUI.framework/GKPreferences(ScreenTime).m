@implementation GKPreferences(ScreenTime)

- (id)screenTimePinCallback
{
  return objc_getAssociatedObject(a1, "_screenTimePinCallback");
}

- (void)setScreenTimePinCallback:()ScreenTime
{
  id v4;

  v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, "_screenTimePinCallback", v4, (void *)3);

}

- (uint64_t)isScreenTimeRestrictionsPasscodeSet
{
  return objc_msgSend(MEMORY[0x1E0D8C090], "isRestrictionsPasscodeSet");
}

- (uint64_t)shouldShowScreenTimePINController
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isAccountModificationRestricted") & 1) != 0)
  {
    v3 = objc_msgSend(a1, "isScreenTimeRestrictionsPasscodeSet");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isAddingFriendsRestricted"))
      v3 = objc_msgSend(a1, "isScreenTimeRestrictionsPasscodeSet");
    else
      v3 = 0;

  }
  return v3;
}

- (uint64_t)activeScreenTimeRemotePinUIWithHandler:()ScreenTime
{
  void *v2;

  objc_msgSend(a1, "setScreenTimePinCallback:");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:suspensionBehavior:", a1, sel_screenTimePINControllerDidFinish_, *MEMORY[0x1E0D8C0A8], 0, 4);

  return objc_msgSend(MEMORY[0x1E0D8C090], "activateRemotePINUI");
}

- (void)screenTimePINControllerDidFinish:()ScreenTime
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a1, "screenTimePinCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D8C0A0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(a1, "screenTimePinCallback");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, v7);

    objc_msgSend(a1, "setScreenTimePinCallback:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", a1);

}

@end
