@implementation NSBundle(SSUAssetPath)

- (id)SSUAssetPathForLocale:()SSUAssetPath
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(a1, "localizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizationsFromArray:forPreferences:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(a1, "URLForResource:withExtension:subdirectory:localization:", CFSTR("nlu.appintents"), 0, 0, v14, (_QWORD)v21);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v18 = (void *)v15;
          CDMOSLoggerForCategory(0);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v26 = "-[NSBundle(SSUAssetPath) SSUAssetPathForLocale:]";
            v27 = 2112;
            v28 = v14;
            _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s [NSBundle] Found lproj SSU asset for localization=%@.", buf, 0x16u);
          }

          v17 = v18;
          v16 = v17;
          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "URLForResource:withExtension:", CFSTR("Metadata.appintents/nlu"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NSBundle(SSUAssetPath) SSUAssetPathForLocale:]";
      _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s [NSBundle] Found non-lproj SSU asset.", buf, 0xCu);
    }
LABEL_15:

  }
  return v16;
}

@end
