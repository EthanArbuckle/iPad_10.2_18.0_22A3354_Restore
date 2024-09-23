@implementation PHCarPlayUtilities

+ (BOOL)activeInterfaceMechanismIsHardware
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  BOOL v9;
  void *v10;
  unsigned __int8 v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_capabilityForKey:", _UIScreenCapabilityInteractionModelsKey));
    v5 = objc_msgSend(v4, "integerValue");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_capabilityForKey:", _UIScreenCapabilityTouchLevelsKey));
    v7 = objc_msgSend(v6, "integerValue");

    v9 = ((v5 & 1) == 0 || v7 == (id)2) && (v5 & 6) != 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("StarkForceHardwareInterface"));

  return v11 | v9;
}

+ (BOOL)activeInterfaceMechanismIsTouchOnly
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  BOOL v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_capabilityForKey:", _UIScreenCapabilityInteractionModelsKey));
    v5 = objc_msgSend(v4, "integerValue");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_capabilityForKey:", _UIScreenCapabilityTouchLevelsKey));
    v7 = objc_msgSend(v6, "integerValue");

    v9 = (v5 & 7) == 1 && v7 != (id)2;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)shouldLimitKeypadAccess
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVExternalDevice currentCarPlayExternalDevice](AVExternalDevice, "currentCarPlayExternalDevice"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "limitedUI"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "limitedUIElements", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      v8 = AVExternalDeviceLimitedUIElementSoftPhoneKeypad;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "isEqualToString:", v8) & 1) != 0)
          {
            v10 = 1;
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_14:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
