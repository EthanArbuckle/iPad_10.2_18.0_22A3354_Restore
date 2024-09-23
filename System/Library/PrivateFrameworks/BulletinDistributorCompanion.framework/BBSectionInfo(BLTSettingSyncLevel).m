@implementation BBSectionInfo(BLTSettingSyncLevel)

- (void)bltApplyNotificationLevel:()BLTSettingSyncLevel
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3 == 3)
  {
    objc_msgSend(a1, "setCriticalAlertSetting:", 1);
  }
  else if (a3)
  {
    objc_msgSend(a1, "setAuthorizationStatus:", 2);
    objc_msgSend(a1, "setNotificationCenterSetting:", 2);
    if (a3 == 2)
      v5 = 2;
    else
      v5 = 1;
    objc_msgSend(a1, "setLockScreenSetting:", v5);
    objc_msgSend(a1, "setAlertType:", a3 == 2);
    v6 = objc_msgSend(a1, "pushSettings");
    v7 = (8 * (int)v6) & 0x28;
    if (v7)
    {
      v8 = v7 | v6;
      v9 = v6 & ~v7;
      if (a3 == 2)
        v10 = v8;
      else
        v10 = v9;
      objc_msgSend(a1, "setPushSettings:", v10);
    }
  }
  else
  {
    objc_msgSend(a1, "setAuthorizationStatus:", 1);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "subsections", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "bltApplyNotificationLevel:", a3);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

@end
