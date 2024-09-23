@implementation NSBundle(AFUIUtilities)

+ (uint64_t)afui_assistantUIFrameworkBundle
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AssistantUIFramework"));
}

- (uint64_t)assistantLanguageIsRTL
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCEA0];
  SRUIFGetLanguageCode();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "characterDirectionForLanguage:", v1) == 2)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "assistantLanguageForceRTL");

  }
  return v2;
}

- (id)assistantUILocalizedStringFromSiriLanguageForKey:()AFUIUtilities table:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BE09270];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_assistantUILocalizedStringForKey:value:table:language:", v8, 0, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)assistantUILocalizedStringFromSystemLanguageForKey:()AFUIUtilities table:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BDBCEA0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "preferredLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_assistantUILocalizedStringForKey:value:table:language:", v8, 0, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)assistantUILocalizedStringForKey:()AFUIUtilities table:
{
  return objc_msgSend(a1, "assistantUILocalizedStringForKey:value:table:", a3, 0, a4);
}

- (id)assistantUILocalizedStringForKey:()AFUIUtilities value:table:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  SRUIFGetLanguageCode();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_assistantUILocalizedStringForKey:value:table:language:", v10, v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_assistantUILocalizedStringForKey:()AFUIUtilities value:table:language:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
    goto LABEL_19;
  objc_msgSend(a1, "_assistantUIlocalizationArrayForLanguageCode:", v13);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v15)
  {

LABEL_19:
    v17 = 0;
LABEL_20:
    v21 = v10;
    if (v11)
    {
      if (objc_msgSend(v11, "length"))
        v21 = v11;
      else
        v21 = v10;
    }
    v22 = v21;

    v17 = v22;
    goto LABEL_25;
  }
  v16 = v15;
  v24 = v13;
  v17 = 0;
  v18 = *(_QWORD *)v26;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      v20 = v17;
      if (*(_QWORD *)v26 != v18)
        objc_enumerationMutation(v14);
      objc_msgSend(a1, "_assistantUIStringForKey:value:table:localizationLanguageCode:", v10, v11, v12, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17
        && (objc_msgSend(v17, "isEqualToString:", v10) & 1) == 0
        && (!v11 || !objc_msgSend(v17, "isEqualToString:", v11)))
      {

        goto LABEL_16;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
      continue;
    break;
  }

  if (!v17)
  {
    v13 = v24;
    goto LABEL_20;
  }
LABEL_16:
  v13 = v24;
  if (!objc_msgSend(v17, "length"))
    goto LABEL_20;
LABEL_25:

  return v17;
}

- (CFArrayRef)_assistantUIlocalizationArrayForLanguageCode:()AFUIUtilities
{
  id v4;
  const __CFArray *v5;
  const __CFArray *v6;

  v4 = a3;
  v5 = (const __CFArray *)objc_msgSend(a1, "localizations");
  v6 = (const __CFArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);

  return CFBundleCopyLocalizationsForPreferences(v5, v6);
}

- (id)_assistantUIStringForKey:()AFUIUtilities value:table:localizationLanguageCode:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  CFBundleGetBundleWithIdentifier((CFStringRef)objc_msgSend(a1, "bundleIdentifier"));
  v14 = (void *)CFBundleCopyLocalizedStringForLocalization();

  return v14;
}

@end
