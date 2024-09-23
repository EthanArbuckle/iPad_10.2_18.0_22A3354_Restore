@implementation APApplication

+ (BOOL)isPhoneAppLocked
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[APApplication lockedAppBundleIdentifiers](APApplication, "lockedAppBundleIdentifiers"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = TUBundleIdentifierPhoneApplication;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "isEqual:", v6, (_QWORD)v10) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

@end
