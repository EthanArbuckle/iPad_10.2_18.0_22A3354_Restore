uint64_t WBS_LOG_CHANNEL_PREFIXPerSitePreferences()
{
  if (WBS_LOG_CHANNEL_PREFIXPerSitePreferences_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPerSitePreferences_onceToken, &__block_literal_global_51);
  return WBS_LOG_CHANNEL_PREFIXPerSitePreferences_log;
}

void sub_1A3B30E70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B310EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3B311C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B312E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B31548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B31750(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B317E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B319C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A3B31BE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXContentBlockers()
{
  if (WBS_LOG_CHANNEL_PREFIXContentBlockers_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXContentBlockers_onceToken, &__block_literal_global_21);
  return WBS_LOG_CHANNEL_PREFIXContentBlockers_log;
}

id pathToRecompilationInformation(void)
{
  void *v0;
  void *v1;

  _SFContentBlockerStoreURL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("RecompiledBlockers.plist"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1A3B31CBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B321DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A3B32528(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B32618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B32698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B32780(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B32980(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3B32AC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B32D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B32F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A3B33150(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B331BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B3322C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3B33298(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B333A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8598C40](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8598C40](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

__n128 __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8598C40](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8598C40](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8598C40](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t _SFDeviceRegionCodeIsRussia()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "countryCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("RU"));
  return v2;
}

void sub_1A3B34D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t _SFShouldShowChineseFeatures()
{
  if ((_SFDeviceRegionCodeIsChina() & 1) != 0)
    return 1;
  else
    return _SFPreferredLanguagesIncludesAnyLanguage(&unk_1E4B27328);
}

uint64_t _SFDeviceRegionCodeIsChina()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "countryCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("CN"));
  return v2;
}

uint64_t _SFShouldShowRussianFeatures()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RU")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("UA")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("TR")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("KZ")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("BY")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = _SFPreferredLanguagesIncludesAnyLanguage(&unk_1E4B27340);
  }

  return v2;
}

uint64_t _SFPreferredLanguagesIncludesAnyLanguage(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "languageCode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v1, "containsObject:", v7);

        if ((v8 & 1) != 0)
        {
          v3 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

uint64_t restrictedValueForKey(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id *v4;
  id v5;
  uint64_t v6;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4F530]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D47138];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4F528]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D47140];
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4F690]) & 1) == 0)
    {

      v5 = 0;
LABEL_11:
      v6 = 0;
      goto LABEL_12;
    }
    v4 = (id *)MEMORY[0x1E0D47130];
  }
  v5 = *v4;

  if (!v5 || !objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", v5))
    goto LABEL_11;
  v6 = objc_msgSend(v2, "BOOLRestrictionForFeature:", v5);
LABEL_12:

  return v6;
}

id _SFLocalizedTitleStringForShortcutItemType(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari.shortcut.openNewTab"))
    || objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari.shortcut.openNewPrivateTab"))
    || objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari.shortcut.openBookmarksView"))
    || objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari.shortcut.openReadingListView")))
  {
    _WBSLocalizedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1A3B35584(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B356C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3B36480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B36CD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v7;

  _Unwind_Resume(a1);
}

id metadataClasses(void)
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v0 = (void *)metadataClasses(void)::classes;
  if (!metadataClasses(void)::classes)
  {
    v1 = (void *)MEMORY[0x1E0C99E60];
    v2 = objc_opt_class();
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v1, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)metadataClasses(void)::classes;
    metadataClasses(void)::classes = v9;

    v0 = (void *)metadataClasses(void)::classes;
  }
  return v0;
}

void sub_1A3B370F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B3729C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B37458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B374E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B38980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B39390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A3B3A938(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B3AB98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B3B028(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A3B3B294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B3B37C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B3B8A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B3C5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _SFShouldShowLinkPreviews()
{
  int AppBooleanValue;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x1E0D4F698], (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppBooleanValue == 0;
  else
    v1 = 0;
  return !v1;
}

id _SFUIActionForToggleShowLinkPreviews()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEF6B0], "elementActionWithType:", 11);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v0, "uiActionForElementInfo:", 0);
  else
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", CFSTR("Toggle Link Preview (Staging)"), 0, 0, &__block_literal_global);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1A3B3E1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a38);
  _Unwind_Resume(a1);
}

void sub_1A3B3EC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak((id *)(v10 - 136));
  _Unwind_Resume(a1);
}

void sub_1A3B3F0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B40E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getWFUserSettingsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!WebContentAnalysisLibraryCore_frameworkLibrary)
  {
    WebContentAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!WebContentAnalysisLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("WFUserSettings");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getWFUserSettingsClass_block_invoke_cold_1();
    free(v3);
  }
  getWFUserSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3B42280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AppStoreComponentsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AppStoreComponentsLibraryCore_frameworkLibrary)
    AppStoreComponentsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AppStoreComponentsLibraryCore_frameworkLibrary;
  if (!AppStoreComponentsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1A3B42698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B43E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3B4407C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B4425C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B44680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

id getWebBookmarkClass(void)
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getWebBookmarkClass(void)::softClass;
  v7 = getWebBookmarkClass(void)::softClass;
  if (!getWebBookmarkClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___ZL19getWebBookmarkClassv_block_invoke;
    v3[3] = &unk_1E4ABFDC0;
    v3[4] = &v4;
    ___ZL19getWebBookmarkClassv_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3B447C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class ___ZL19getWebBookmarkClassv_block_invoke(uint64_t a1)
{
  Class result;

  WebBookmarksLibrary();
  result = objc_getClass("WebBookmark");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWebBookmarkClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    ___ZL19getWebBookmarkClassv_block_invoke_cold_1();
    return (Class)WebBookmarksLibrary();
  }
  return result;
}

uint64_t WebBookmarksLibrary(void)
{
  uint64_t v0;
  void *v2;

  if (!WebBookmarksLibraryCore(char **)::frameworkLibrary)
    WebBookmarksLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v0 = WebBookmarksLibraryCore(char **)::frameworkLibrary;
  if (!WebBookmarksLibraryCore(char **)::frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class ___ZL32getSafariFetcherServerProxyClassv_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  WebBookmarksLibrary();
  result = objc_getClass("SafariFetcherServerProxy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSafariFetcherServerProxyClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = ___ZL32getSafariFetcherServerProxyClassv_block_invoke_cold_1();
    return (Class)___ZL33getWebBookmarksXPCConnectionClassv_block_invoke(v3);
  }
  return result;
}

void ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  WebBookmarksLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WebBookmarksXPCConnection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWebBookmarksXPCConnectionClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)___ZL33getWebBookmarksXPCConnectionClassv_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A3B454D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id processIdentifierString()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%i"), objc_msgSend(v1, "processIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1A3B478EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B47CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B487E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B48AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B48EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void sub_1A3B49394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B505EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3B5162C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id OUTLINED_FUNCTION_7(id a1)
{
  return a1;
}

void sub_1A3B53F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v12 = v10;

  a9.super_class = (Class)_SFWebProcessPlugIn;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t mouseDidMoveOverElementCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t Frame;
  uint64_t result;
  uint64_t v8;

  v5 = WKMutableDictionaryCreate();
  objc_msgSend(CFSTR("linkURL"), "UTF8String");
  WKStringCreateWithUTF8CString();
  WKBundleHitTestResultCopyAbsoluteLinkURL();
  WKDictionarySetItem();
  Frame = WKBundleHitTestResultGetFrame();
  result = WKBundleHitTestResultGetTargetFrame();
  v8 = result;
  if (Frame)
  {
    objc_msgSend(CFSTR("frame"), "UTF8String");
    WKStringCreateWithUTF8CString();
    WKBundleFrameCreateFrameHandle();
    result = WKDictionarySetItem();
  }
  if (v8)
  {
    objc_msgSend(CFSTR("targetFrame"), "UTF8String");
    WKStringCreateWithUTF8CString();
    WKBundleFrameCreateFrameHandle();
    result = WKDictionarySetItem();
  }
  *a4 = v5;
  return result;
}

void willAddMessageWithDetailsToConsoleCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  __CFString *v8;
  uint64_t Size;
  void *v10;
  uint64_t i;
  int v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  _QWORD *v17;
  FILE *v18;
  id v19;
  id v23;

  if (a2)
    v8 = (__CFString *)WKStringCopyCFString();
  else
    v8 = &stru_1E4AC8470;
  Size = WKArrayGetSize();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Size);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (Size)
  {
    for (i = 0; i != Size; ++i)
    {
      WKArrayGetItemAtIndex();
      v12 = WKGetTypeID();
      if (v12 == WKStringGetTypeID())
      {
        v13 = (void *)WKStringCopyCFString();
        objc_msgSend(v10, "addObject:", v13);

      }
    }
  }
  if (objc_msgSend(v10, "count"))
  {
    -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR(" "));
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingString:", v14);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (a6)
    v15 = (__CFString *)WKStringCopyCFString();
  else
    v15 = &stru_1E4AC8470;
  if (-[__CFString length](v15, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%u:%u: %@\n"), v15, a4, a5, v8);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a7, "webProcessPlugIn");
  v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v18 = (FILE *)v17[3];

  v19 = objc_retainAutorelease(v16);
  fprintf(v18, "%s\n", (const char *)objc_msgSend(v19, "cStringUsingEncoding:", 4));

}

void sub_1A3B5428C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3B543F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B55B00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B55CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B55DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B55E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B55EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B55F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

BOOL isDiffieHellmanError(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (objc_msgSend(v1, "_web_errorIsInDomain:", *MEMORY[0x1E0CB32E8])
    && objc_msgSend(v1, "code") == -1200)
  {
    objc_msgSend(v1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0C93028];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C93028]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v4, "integerValue") == -9850;
    }
    else
    {
      objc_msgSend(v1, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7
        && (objc_msgSend(v7, "userInfo"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "objectForKeyedSubscript:", v3),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            v9))
      {
        v5 = objc_msgSend(v9, "integerValue") == -9850;

      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id newAlertToListPossibleClientSideCertificatesWithContext(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  _BYTE buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("authenticationChallenge"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protectionSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_webkit_decodeHostName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_sf_identities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1A3B2D000, v11, OS_LOG_TYPE_DEFAULT, "Displaying identities picker of count: %lu", buf, 0xCu);

  }
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    *(_QWORD *)buf = 0;
    v15 = 0;
    if (!SecIdentityCopyCertificate((SecIdentityRef)objc_msgSend(v9, "objectAtIndex:", 0), (SecCertificateRef *)buf))
    {
      v15 = (__CFString *)SecCertificateCopySubjectSummary(*(SecCertificateRef *)buf);
      CFRelease(*(CFTypeRef *)buf);
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = &stru_1E4AC8470;
    if (v15)
      v18 = v15;
    objc_msgSend(v16, "stringWithFormat:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9928]), "initWithType:title:bodyText:defaultAction:otherAction:tableAction:", 4, v8, v19, 5, 4, 0);
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0DD9928]);
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithType:title:bodyText:defaultAction:otherAction:tableAction:", 4, v8, v13, 4, 0, 5);

    objc_msgSend(v14, "setHideAction:", 4);
  }
  objc_msgSend(v14, "setIdentities:", v9);
  objc_msgSend(v14, "setContext:", v1);

  return v14;
}

void proceedWithClientCertificateIdentity(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  int v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)WBSSecIdentityCopySSLClientAuthenticationChain();
  objc_msgSend(v3, "objectForKey:", CFSTR("completionHandler"));
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("reasonAuthenticationChallenge"))
      || (objc_msgSend(v3, "objectForKey:", CFSTR("authenticationChallenge")),
          (v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v5)
        v5[2](v5, 3, 0);
      goto LABEL_18;
    }
    v8 = (void *)v7;
    v9 = objc_msgSend(v4, "count");
    v10 = (void *)MEMORY[0x1E0C92C60];
    if (v9 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0C92C60], "credentialWithIdentity:certificates:persistence:", a1, 0, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(v4, "subarrayWithRange:", 1, v9 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "credentialWithIdentity:certificates:persistence:", a1, v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
LABEL_7:
        ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v12);
LABEL_15:
        v22 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 134217984;
          v24 = v9;
          _os_log_impl(&dword_1A3B2D000, v22, OS_LOG_TYPE_DEFAULT, "Answered challenge with credential with certificate chain count=%lu", (uint8_t *)&v23, 0xCu);
        }

LABEL_18:
        goto LABEL_19;
      }
    }
    objc_msgSend(v8, "sender");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "useCredential:forAuthenticationChallenge:", v12, v8);

    goto LABEL_15;
  }
  v13 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    proceedWithClientCertificateIdentity_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    if (!v5)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v5)
LABEL_10:
    v5[2](v5, 3, 0);
LABEL_19:

}

id newAlertToHandleClientSideCertificateErrorCode(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("authenticationChallenge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protectionSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sf_identities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (a1 == -1205 && v7 <= 1)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      newAlertToHandleClientSideCertificateErrorCode_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_11:
    v20 = 0;
    goto LABEL_20;
  }
  if (a1 == -1206 && v7 == 1)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("useOnlyAvailableIdentityWithoutPrompting"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
    {
      v18 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1A3B2D000, v18, OS_LOG_TYPE_DEFAULT, "Found one matching identity with preference to skip prompting", (uint8_t *)&v26, 2u);
      }
      objc_msgSend(v6, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      proceedWithClientCertificateIdentity((uint64_t)v19, v3);

      goto LABEL_11;
    }
LABEL_13:
    newAlertToListPossibleClientSideCertificatesWithContext(v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v7)
    goto LABEL_13;
  if (v4)
  {
    v21 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138739971;
      v27 = v4;
      _os_log_impl(&dword_1A3B2D000, v21, OS_LOG_TYPE_DEFAULT, "No identities, but we have a challenge %{sensitive}@", (uint8_t *)&v26, 0xCu);
    }
    objc_msgSend(v4, "sender");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "continueWithoutCredentialForAuthenticationChallenge:", v4);

    v20 = 0;
    v23 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9928]), "initWithType:title:bodyText:defaultAction:otherAction:", 5, v24, v23, 7, 0);

  }
LABEL_20:

  return v20;
}

uint64_t attemptRecovery(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CEF808]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE7D64C0))
    v3 = objc_msgSend(v2, "attemptRecovery");
  else
    v3 = 0;

  return v3;
}

void sub_1A3B59C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCertificateViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CertInfoLibraryCore_frameworkLibrary)
  {
    CertInfoLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CertInfoLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CertificateViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCertificateViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getCertificateViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3B5A79C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3B5A944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B5B89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B5BD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a38);
  _Unwind_Resume(a1);
}

void sub_1A3B5C048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B5C550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B5E2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B60018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B617FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B62228(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1A3B6345C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B64980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B65104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B656B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B65F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B6712C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B678D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;

  return v0;
}

id getCRCameraReaderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCRCameraReaderClass_softClass;
  v7 = getCRCameraReaderClass_softClass;
  if (!getCRCameraReaderClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCRCameraReaderClass_block_invoke;
    v3[3] = &unk_1E4ABFC78;
    v3[4] = &v4;
    __getCRCameraReaderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3B693E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3B6974C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRCameraReaderClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreRecognitionLibrary();
  result = objc_getClass("CRCameraReader");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCRCameraReaderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCRCameraReaderClass_block_invoke_cold_1();
    return (Class)CoreRecognitionLibrary();
  }
  return result;
}

uint64_t CoreRecognitionLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CoreRecognitionLibraryCore_frameworkLibrary)
    CoreRecognitionLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CoreRecognitionLibraryCore_frameworkLibrary;
  if (!CoreRecognitionLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id localObjectLoader(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "_sf_localBookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "_sf_localURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void objectLoader(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1;
  v9[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __objectLoader_block_invoke;
  v7[3] = &unk_1E4AC0CB0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "safari_loadObjectOfClasses:completionHandler:", v5, v7);

}

void sub_1A3B6B050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak((id *)(v11 - 144));
  _Unwind_Resume(a1);
}

uint64_t __objectLoader_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1A3B6BDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLPLinkMetadataClass_block_invoke(uint64_t a1)
{
  LinkPresentationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLPLinkMetadataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLPLinkMetadataClass_block_invoke_cold_1();
    LinkPresentationLibrary();
  }
}

void LinkPresentationLibrary()
{
  void *v0;

  if (!LinkPresentationLibraryCore_frameworkLibrary)
    LinkPresentationLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!LinkPresentationLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getLPFileMetadataClass_block_invoke(uint64_t a1)
{
  _SFExternalPasswordCredentialViewController *v2;
  SEL v3;
  id v4;

  LinkPresentationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LPFileMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLPFileMetadataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (_SFExternalPasswordCredentialViewController *)__getLPFileMetadataClass_block_invoke_cold_1();
    -[_SFExternalPasswordCredentialViewController autoFillWithExternalCredential:](v2, v3, v4);
  }
}

void sub_1A3B6D484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B6F464(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B6FA70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B6FB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B6FBC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B6FC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B6FCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B6FD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B6FDE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B6FF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B70238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B702E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A3B70434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B70504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B7061C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B70760(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B70800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B708A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B70A34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id getTPDialPromptAlertClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getTPDialPromptAlertClass_softClass;
  v7 = getTPDialPromptAlertClass_softClass;
  if (!getTPDialPromptAlertClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getTPDialPromptAlertClass_block_invoke;
    v3[3] = &unk_1E4ABFC78;
    v3[4] = &v4;
    __getTPDialPromptAlertClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3B70FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTPDialPromptAlertClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!TelephonyUILibraryCore_frameworkLibrary)
  {
    TelephonyUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TelephonyUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("TPDialPromptAlert");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getTPDialPromptAlertClass_block_invoke_cold_1();
    free(v3);
  }
  getTPDialPromptAlertClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3B71E18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B71F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A3B72024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B72098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B721A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3B72220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B72370(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3B72500(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B727D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B72A34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B72C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3B72D20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B72D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B72E64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B72EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B72FC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B73028(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B731B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3B732B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1A3B7336C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3B734AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A3B7361C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B73754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B7385C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B739C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B73AFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B73E58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B7404C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3B74124(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B742DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3B74490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3B74690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3B74794(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B74884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3B74900(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B74BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1A3B74CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B74D8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3B74EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3B74F64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B75058(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B752CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B753D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void sub_1A3B75820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

Class ___ZL36getCSSearchableItemAttributeSetClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreSpotlightLibraryCore(char **)::frameworkLibrary)
  {
    CoreSpotlightLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!CoreSpotlightLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CSSearchableItemAttributeSet");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)___ZL36getCSSearchableItemAttributeSetClassv_block_invoke_cold_1();
    free(v3);
  }
  getCSSearchableItemAttributeSetClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3B7823C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id subtitleFont()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "monospacedDigitSystemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id verificationCodeFont()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_sf_highLegibilityAlternateFont:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1A3B7A1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B7AE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id estimatedBarMetrics()
{
  void *v0;
  SFNavigationBarMetrics *v1;
  void *v2;

  v0 = (void *)estimatedBarMetrics_metrics;
  if (!estimatedBarMetrics_metrics)
  {
    v1 = objc_alloc_init(SFNavigationBarMetrics);
    v2 = (void *)estimatedBarMetrics_metrics;
    estimatedBarMetrics_metrics = (uint64_t)v1;

    v0 = (void *)estimatedBarMetrics_metrics;
  }
  return v0;
}

void sub_1A3B7E0D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id reverseAnimation(void *a1)
{
  id v1;
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  float v9;
  double v10;

  v1 = a1;
  objc_msgSend(v1, "beginTime");
  v3 = v2;
  objc_msgSend(v1, "beginTimeMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD2918]) & 1) != 0
    || (v5 = -v3, objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD2940])) && v3 != 0.0)
  {
    v5 = CACurrentMediaTime() - v3;
  }
  objc_msgSend(v1, "duration");
  v7 = v6;
  v8 = (void *)objc_msgSend(v1, "copy");
  objc_msgSend(v8, "speed");
  *(float *)&v10 = -v9;
  objc_msgSend(v8, "setSpeed:", v10);
  objc_msgSend(v8, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  objc_msgSend(v8, "setBeginTime:", v5 - v7);

  return v8;
}

void sub_1A3B833C0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3F0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Unwind_Resume(a1);
}

void scaleView(void *a1, CGFloat a2)
{
  id v3;
  CGAffineTransform v4;

  v3 = a1;
  CGAffineTransformMakeScale(&v4, a2, a2);
  objc_msgSend(v3, "setTransform:", &v4);

}

void sub_1A3B86770(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A3B8696C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3B875B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __initializeConstants_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = _SFOnePixel();
  kSeparatorHeight = v1;
  return result;
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id OUTLINED_FUNCTION_6_1@<X0>(int a1@<W8>)
{
  void *v1;
  void *v2;

  if (a1)
    return v1;
  else
    return v2;
}

void sub_1A3B8A7E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3B8A860(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _SFRequestDesktopSiteActivitySourceJavaScriptString()
{
  id v0;

  v0 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend(v0, "initWithBytesNoCopy:length:encoding:freeWhenDone:", requestDesktopSiteUIActivitySource, requestDesktopSiteUIActivitySourceLength, 4, 0);
}

void sub_1A3B8C148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B8DBF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3B8DCBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3B8DD34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3B8DDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  MEMORY[0x1A85987FC](v10, 0x10A1C40D746C084);

  _Unwind_Resume(a1);
}

void sub_1A3B8DE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B8DEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B8DFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3B8E050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B8E0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B8E1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3B8F7C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1A3B8FA58(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A3B8FB38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3B902FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A3B90894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void addURLsInFrameTreeToArray(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "childFrames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        addURLsInFrameTreeToArray(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

uint64_t frameIsDescendantOfFrame(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v7 = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v4, "childFrames", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if ((frameIsDescendantOfFrame(v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
          {
            v7 = 1;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v7;
}

void sub_1A3B93C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B94D14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A3B966A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

Class __getOBWelcomeControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("OBWelcomeController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getOBWelcomeControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getOBWelcomeControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3B96C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_2_1(uint64_t a1, void *a2)
{
  return a2;
}

void sub_1A3B9C258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B9CAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B9CC9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A3B9E13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3B9ED60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3B9F3A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3B9F60C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3B9F794(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3BA27BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;
  void *v11;

  v11 = v10;

  a9.super_class = (Class)_SFFormAutoFillController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A3BA28CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA2944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA29F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA2B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1A3BA2C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BA2CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A3BA2E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A3BA30A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A3BA312C()
{
  JUMPOUT(0x1A3BA311CLL);
}

void sub_1A3BA31F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v17 = v16;

  _Unwind_Resume(a1);
}

void sub_1A3BA32EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v17 = v16;

  _Unwind_Resume(a1);
}

void sub_1A3BA33D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BA3494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BA3544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BA36C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BA3758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA3B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v27 = v25;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v26 - 104));

  _Unwind_Resume(a1);
}

void sub_1A3BA3C18()
{
  JUMPOUT(0x1A3BA3C0CLL);
}

void sub_1A3BA3C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BA3F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BA4078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA4344(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3BA4648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3BA471C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA478C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BA4874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA494C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA49D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BA4A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA4BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A3BA4D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1A3BA4EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3BA4F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA4FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA50E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A3BA5168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA54E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3BA58D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,void *a40)
{
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v45 - 144));
  _Block_object_dispose((const void *)(v45 - 136), 8);

  _Unwind_Resume(a1);
}

void sub_1A3BA5C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3BA5DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__212(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8598C40](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__213(uint64_t a1)
{

}

void sub_1A3BA6018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v31 = v29;

  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BA61AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BA62F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA63D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3BA64A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BA65E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BA667C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA6724(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA67B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA6930(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA6A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA6B1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BA6D24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A3BA6D88()
{
  JUMPOUT(0x1A3BA6D78);
}

void sub_1A3BA6EC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3BA7048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3BA71A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v19 = v16;

  _Unwind_Resume(a1);
}

void sub_1A3BA7404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3BA75C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BA7690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BA78D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BA7A48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BA7B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BA7D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BA7FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1A3BA81E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A3BA82F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A3BA84A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A3BA85D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA86F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3BA87A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA8A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  _Block_object_dispose(&a16, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BA8CA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BA8D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BA8DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BA934C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31)
{
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  _Unwind_Resume(a1);
}

void sub_1A3BA9990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A3BA9B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3BA9D08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BA9F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)(v26 - 88));

  _Unwind_Resume(a1);
}

void sub_1A3BA9FD4()
{
  void *v0;

  JUMPOUT(0x1A3BA9FB0);
}

void sub_1A3BA9FE4()
{
  JUMPOUT(0x1A3BA9FB0);
}

void sub_1A3BA9FF0()
{
  JUMPOUT(0x1A3BA9FB4);
}

void sub_1A3BAA44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A3BAA608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  id *v16;
  void *v17;
  void *v18;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BAA6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BAA7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  id *v16;
  void *v17;
  void *v18;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BAA860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BAA8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BAA97C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BAA9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BAAB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BAABDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BAACF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v16 - 40));

  _Unwind_Resume(a1);
}

void sub_1A3BAAD78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BAAE08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BAAEB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BAAF44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BAAFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BAB0F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BAB174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BAB1F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BAB28C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BAB378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BAB5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BAB78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BAB820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BAB8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BAB95C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BAB9EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BABBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BABDD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BABEDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

Class ___ZL18getUIKeyEventClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UIKitLibraryCore(char **)::frameworkLibrary)
  {
    UIKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!UIKitLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UIKeyEvent");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)___ZL18getUIKeyEventClassv_block_invoke_cold_1();
    free(v3);
  }
  getUIKeyEventClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL18getBEKeyEntryClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!BrowserEngineKitLibraryCore(char **)::frameworkLibrary)
  {
    BrowserEngineKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!BrowserEngineKitLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BEKeyEntry");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)___ZL18getBEKeyEntryClassv_block_invoke_cold_1();
    free(v3);
  }
  getBEKeyEntryClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3BADB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BAF958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getOBWelcomeControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getOBWelcomeControllerClass_softClass_0;
  v7 = getOBWelcomeControllerClass_softClass_0;
  if (!getOBWelcomeControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getOBWelcomeControllerClass_block_invoke_0;
    v3[3] = &unk_1E4ABFC78;
    v3[4] = &v4;
    __getOBWelcomeControllerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3BB0234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBBoldTrayButtonClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getOBBoldTrayButtonClass_softClass;
  v7 = getOBBoldTrayButtonClass_softClass;
  if (!getOBBoldTrayButtonClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getOBBoldTrayButtonClass_block_invoke;
    v3[3] = &unk_1E4ABFC78;
    v3[4] = &v4;
    __getOBBoldTrayButtonClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3BB02EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void enableTrackerProtection()
{
  void *v0;
  void *v1;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setValue:forSetting:", &unk_1E4B275A0, *MEMORY[0x1E0D47120]);

  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "webui_applySafariCookieAcceptPolicy");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0DD9958], 0, 0, 0);
}

id createPromptCancelButtonWithCompletionHandler(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = a1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v2 = (void *)getOBTrayButtonClass_softClass;
  v21 = getOBTrayButtonClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getOBTrayButtonClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getOBTrayButtonClass_block_invoke;
    v17[3] = &unk_1E4ABFC78;
    v17[4] = &v18;
    __getOBTrayButtonClass_block_invoke((uint64_t)v17);
    v2 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v18, 8);
  v5 = objc_alloc_init(v4);
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  v7 = (void *)MEMORY[0x1E0DC3428];
  v12 = v3;
  v13 = 3221225472;
  v14 = __createPromptCancelButtonWithCompletionHandler_block_invoke;
  v15 = &unk_1E4AC0C18;
  v16 = v1;
  v8 = v1;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", &stru_1E4AC8470, 0, 0, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:forControlEvents:", v9, 0x2000, v12, v13, v14, v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v10, 0);

  return v5;
}

void sub_1A3BB054C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getOBWelcomeControllerClass_block_invoke_0(uint64_t a1)
{
  OnBoardingKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("OBWelcomeController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBWelcomeControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBWelcomeControllerClass_block_invoke_cold_1();
    OnBoardingKitLibrary();
  }
}

void OnBoardingKitLibrary()
{
  void *v0;

  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
    OnBoardingKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getOBBoldTrayButtonClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  OnBoardingKitLibrary();
  result = objc_getClass("OBBoldTrayButton");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBBoldTrayButtonClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getOBBoldTrayButtonClass_block_invoke_cold_1();
    return (Class)__createPromptCancelButtonWithCompletionHandler_block_invoke(v3);
  }
  return result;
}

uint64_t __createPromptCancelButtonWithCompletionHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

SFPrivacyReportTrackerDetailViewController *__getOBTrayButtonClass_block_invoke(uint64_t a1)
{
  SFPrivacyReportTrackerDetailViewController *result;
  SFPrivacyReportTrackerDetailViewController *v3;
  SEL v4;
  id v5;

  OnBoardingKitLibrary();
  result = (SFPrivacyReportTrackerDetailViewController *)objc_getClass("OBTrayButton");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBTrayButtonClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SFPrivacyReportTrackerDetailViewController *)__getOBTrayButtonClass_block_invoke_cold_1();
    return -[SFPrivacyReportTrackerDetailViewController initWithTracker:](v3, v4, v5);
  }
  return result;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1A3BB2B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void highlightMatchingRanges(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1 && objc_msgSend(v10, "length"))
  {
    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D8ABE0], "searchPatternForWebsiteComparisonFromSearchPattern:", v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v12;
    }
    v13 = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v9, "length"));

    v15 = (void *)objc_opt_class();
    objc_msgSend(v9, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __highlightMatchingRanges_block_invoke;
    v17[3] = &unk_1E4AC27A0;
    v18 = v9;
    objc_msgSend(v15, "enumerateRangesMatchingPatternWithTokenizer:string:pattern:matchingType:withBlock:", a1, v16, v10, a4, v17);

  }
}

void __highlightMatchingRanges_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v8 = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttributes:range:", v7, a2, a3);

}

void sub_1A3BB57F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

SafariServices::WebProcessPlugInReaderJSController *SafariServices::WebProcessPlugInReaderJSController::WebProcessPlugInReaderJSController(SafariServices::WebProcessPlugInReaderJSController *this, WKWebProcessPlugInFrame *a2, _SFReaderWebProcessPlugInPageController *a3)
{
  WKWebProcessPlugInFrame *v5;
  _SFReaderWebProcessPlugInPageController *v6;
  WKWebProcessPlugInFrame *v7;
  _SFReaderWebProcessPlugInPageController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const OpaqueJSContext *v15;

  v5 = a2;
  v6 = a3;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *(_QWORD *)this = &off_1E4AC2860;
  v7 = v5;
  *((_QWORD *)this + 7) = v7;
  v8 = v6;
  *((_QWORD *)this + 8) = v8;
  *((_QWORD *)this + 9) = 0;
  v9 = (void *)*((_QWORD *)this + 7);
  objc_msgSend(MEMORY[0x1E0CEF628], "normalWorld");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsContextForWorld:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  SafariShared::ReaderJSController::evaluateSharedUINormalWorldScript(this, (const OpaqueJSContext *)objc_msgSend(v11, "JSGlobalContextRef"));
  v12 = (void *)*((_QWORD *)this + 7);
  SafariServices::WebProcessPlugInReaderJSController::isolatedWorld(this);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsContextForWorld:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (const OpaqueJSContext *)objc_msgSend(v14, "JSGlobalContextRef");
  SafariShared::ReaderJSController::evaluateLocalizedStringsScript(this, v15);
  objc_msgSend(MEMORY[0x1E0D8AB88], "sharedUIScriptForContext:", v15);
  JSScriptEvaluate();
  +[_SFReaderCustomProtocols readerUserInterfaceScriptForContext:](_SFReaderCustomProtocols, "readerUserInterfaceScriptForContext:", v15);
  JSScriptEvaluate();
  SafariShared::JSController::addScriptObjectToGlobalObject(this, v15);
  SafariShared::JSController::scriptObjectReady(this, v15);

  return this;
}

void sub_1A3BB6350(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  SafariShared::ReaderJSController::~ReaderJSController((SafariShared::ReaderJSController *)v1);
  _Unwind_Resume(a1);
}

id SafariServices::WebProcessPlugInReaderJSController::isolatedWorld(SafariServices::WebProcessPlugInReaderJSController *this)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 9);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CEF628], "world");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v3;

    v2 = (void *)*((_QWORD *)this + 9);
  }
  return v2;
}

void SafariShared::ReaderJSController::~ReaderJSController(SafariShared::ReaderJSController *this)
{
  uint64_t v2;

  *(_QWORD *)this = MEMORY[0x1E0D8B8C0] + 16;
  v2 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  SafariShared::JSController::~JSController(this);
}

void SafariServices::WebProcessPlugInReaderJSController::~WebProcessPlugInReaderJSController(id *this)
{
  id v2;
  id v3;

  *this = &off_1E4AC2860;
  objc_msgSend(this[9], "clearWrappers");
  v2 = this[9];
  this[9] = 0;

  *this = (id)(MEMORY[0x1E0D8B8C0] + 16);
  v3 = this[6];
  this[6] = 0;
  if (v3)
    (*(void (**)(id))(*(_QWORD *)v3 + 8))(v3);
  SafariShared::JSController::~JSController((SafariShared::JSController *)this);
}

{
  SafariServices::WebProcessPlugInReaderJSController::~WebProcessPlugInReaderJSController(this);
  JUMPOUT(0x1A85987FCLL);
}

id SafariServices::WebProcessPlugInReaderJSController::initialConfiguration(id *this)
{
  void *v1;
  void *v2;

  objc_msgSend(this[8], "originalPageController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "initialReaderConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1A3BB654C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::makeFontAvailableIfNecessary(SafariServices::WebProcessPlugInReaderJSController *this, NSString *a2)
{
  NSString *v2;
  uint64_t v3;
  CTFontDescriptorRef v4;
  const __CFArray *v5;
  CTFontDescriptorRef v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CA82D8];
  v7[0] = *MEMORY[0x1E0CA8300];
  v7[1] = v3;
  v8[0] = v2;
  v8[1] = MEMORY[0x1E0C9AAB0];
  v7[2] = *MEMORY[0x1E0CA82E0];
  v8[2] = MEMORY[0x1E0C9AAB0];
  v4 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
  v6 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v5 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  CFRelease(v4);
  CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v5, 0, &__block_literal_global_20);

}

void sub_1A3BB6658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZN14SafariServices34WebProcessPlugInReaderJSController28makeFontAvailableIfNecessaryEP8NSString_block_invoke()
{
  return 1;
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::isInStickyMode(SafariServices::WebProcessPlugInReaderJSController *this)
{
  return 0;
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::originalArticleFinder(id *this)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(this[8], "originalPageController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "originalArticleFinder");

  return v2;
}

void sub_1A3BB66D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id SafariServices::WebProcessPlugInReaderJSController::subframeByIFrameElementId(SafariServices::WebProcessPlugInReaderJSController *this, NSString *a2)
{
  NSString *v3;
  const OpaqueJSContext *v4;
  void *v5;
  void *v6;
  const char *v7;
  const OpaqueJSContext *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const OpaqueJSContext *)*((_QWORD *)this + 5);
  objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", JSContextGetGlobalContext(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "JSValueRef");
  v8 = (const OpaqueJSContext *)SafariShared::JSUtilities::globalJSObjectByName(v4, (const OpaqueJSContext *)"document", v7);
  v9 = SafariShared::JSUtilities::callJSMethodWithArguments(v4, v8, (OpaqueJSValue *)"getElementById", (const char *)&v15, (const OpaqueJSValue *const *)1);
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithJSValueRef:inContext:", v9, v5, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEF620], "nodeHandleWithJSValue:inContext:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "htmlIFrameElementContentFrame");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_1A3BB6828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::prepareNextPageFrame(SafariServices::WebProcessPlugInReaderJSController *this, NSString *a2)
{
  WKWebProcessPlugInScriptWorld *v3;
  void *v4;
  const OpaqueJSContext *v5;
  SafariServices::ArticleFinderJSController *v6;
  uint64_t v7;
  id v8;

  SafariServices::WebProcessPlugInReaderJSController::subframeByIFrameElementId(this, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*((id *)this + 8), "isolatedWorldForNextPageDetection");
    v3 = (WKWebProcessPlugInScriptWorld *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jsContextForWorld:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (const OpaqueJSContext *)objc_msgSend(v4, "JSGlobalContextRef");
    objc_msgSend(MEMORY[0x1E0D8AB88], "articleFinderScriptForContext:", v5);
    JSScriptEvaluate();
    v6 = (SafariServices::ArticleFinderJSController *)operator new();
    SafariServices::ArticleFinderJSController::ArticleFinderJSController(v6, (WKWebProcessPlugInFrame *)v8, v3);
    v7 = *((_QWORD *)this + 6);
    *((_QWORD *)this + 6) = v6;
    if (v7)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
      v6 = (SafariServices::ArticleFinderJSController *)*((_QWORD *)this + 6);
    }
    SafariShared::JSController::addScriptObjectToGlobalObject(v6, v5);
    SafariShared::JSController::scriptObjectReady(*((SafariShared::JSController **)this + 6), v5);

  }
}

void sub_1A3BB6978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  uint64_t v12;

  MEMORY[0x1A85987FC](v12, 0x10A1C406DF74740);

  _Unwind_Resume(a1);
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::readerOperationMode(id *this)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(this[8], "originalPageController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isViewingReadingListArchive"))
    v2 = 2;
  else
    v2 = 0;

  return v2;
}

void sub_1A3BB6A08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::useSmoothScrolling(SafariServices::WebProcessPlugInReaderJSController *this)
{
  return 0;
}

void SafariServices::WebProcessPlugInReaderJSController::contentDidBecomeReady(id *this, NSString *a2)
{
  void *v3;
  NSString *v4;

  v4 = a2;
  objc_msgSend(this[8], "originalPageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readerContentDidBecomeReadyWithArticleText:", v4);

}

void sub_1A3BB6A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::requestOnDeviceSummary(id *this)
{
  id v1;

  objc_msgSend(this[8], "originalPageController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didRequestOnDeviceSummary");

}

void sub_1A3BB6AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::didSetSummary(id *this)
{
  id v1;

  objc_msgSend(this[8], "originalPageController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didSetSummary");

}

void sub_1A3BB6B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id SafariServices::WebProcessPlugInReaderJSController::initialArticleScrollPositionAsDictionary(id *this)
{
  void *v1;
  void *v2;

  objc_msgSend(this[8], "originalPageController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "initalArticleScrollPositionAsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInitalArticleScrollPositionAsDictionary:", 0);

  return v2;
}

void sub_1A3BB6B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::replaceSimpleTweetsWithRichTweets(SafariServices::WebProcessPlugInReaderJSController *this, NSDictionary *a2)
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  SafariShared::JSUtilities *v7;
  objc_object *v8;
  const OpaqueJSContext *GlobalObject;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*((_QWORD *)this + 7);
  objc_msgSend(MEMORY[0x1E0CEF628], "normalWorld");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsContextForWorld:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (SafariShared::JSUtilities *)objc_msgSend(v6, "JSGlobalContextRef");
  v10[0] = SafariShared::JSUtilities::translateNSToJSValue(v7, (const OpaqueJSContext *)v3, v8);
  GlobalObject = JSContextGetGlobalObject(v7);
  SafariShared::JSUtilities::callJSMethodWithArguments(v7, GlobalObject, (OpaqueJSValue *)"replaceSimpleTweetsWithRichTweets", (const char *)v10, (const OpaqueJSValue *const *)1);

}

void sub_1A3BB6C68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::JSUtilities::translateNSToJSValue(SafariShared::JSUtilities *this, const OpaqueJSContext *a2, objc_object *a3)
{
  const OpaqueJSContext *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", JSContextGetGlobalContext(this));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithObject:inContext:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "JSValueRef");

  return v8;
}

void sub_1A3BB6D28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::cachedTopScrollOffset(id *this)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(this[8], "originalPageController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "cachedReaderTopScrollOffset");
  objc_msgSend(v1, "setCachedReaderTopScrollOffset:", 0);

  return v2;
}

void sub_1A3BB6D9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::maxDistanceForLoadingNextPage(SafariServices::WebProcessPlugInReaderJSController *this)
{
  return 0x7FFFFFFFLL;
}

const OpaqueJSValue *SafariServices::WebProcessPlugInReaderJSController::contentInPrintingMailingFrame(SafariServices::WebProcessPlugInReaderJSController *this)
{
  const OpaqueJSContext *v1;
  const OpaqueJSContext *GlobalObject;
  const OpaqueJSValue *v3;
  const OpaqueJSContext *v4;
  const OpaqueJSValue *v5;

  v1 = (const OpaqueJSContext *)*((_QWORD *)this + 5);
  GlobalObject = JSContextGetGlobalObject(v1);
  v3 = (const OpaqueJSValue *)SafariShared::JSUtilities::callJSMethodWithArguments(v1, GlobalObject, (OpaqueJSValue *)"contentInPrintingMailingFrame", 0, 0);
  if (v3)
  {
    v4 = v3;
    if (JSValueIsString(v1, v3))
    {
      SafariShared::JSUtilities::translateJSValueToNS(v1, v4, v5);
      v3 = (const OpaqueJSValue *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

id SafariServices::WebProcessPlugInReaderJSController::printingMailingFrame(SafariShared::JSUtilities **this)
{
  SafariShared::JSUtilities::callJSMethodWithArguments(this[5], this[3], (OpaqueJSValue *)"preparePrintingMailingFrame", 0, 0);
  return SafariServices::WebProcessPlugInReaderJSController::subframeByIFrameElementId((SafariServices::WebProcessPlugInReaderJSController *)this, CFSTR("printing-mailing-frame"));
}

void sub_1A3BB7AD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 248));
  _Unwind_Resume(a1);
}

void sub_1A3BB80C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BB9310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void tryOpeningInDefaultApp(void *a1, void *a2, unsigned int a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  char v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  __int128 *v61;
  void *v62;
  __int128 *v63;
  id v64;
  __CFString *PreferredIdentifierForTag;
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 buf;
  void *v75;
  void *v76;
  id v77;
  id v78;
  __int128 *v79;
  char v80;
  char v81;
  _QWORD v82[9];

  v82[7] = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v67 = a2;
  v11 = a4;
  v12 = a5;
  v68 = a6;
  v13 = v10;
  v14 = v11;
  v15 = v12;
  v16 = v13;
  v17 = v15;
  *(_QWORD *)&v70 = 0;
  *((_QWORD *)&v70 + 1) = &v70;
  *(_QWORD *)&v71 = 0x3032000000;
  *((_QWORD *)&v71 + 1) = __Block_byref_object_copy__1;
  *(_QWORD *)&v72 = __Block_byref_object_dispose__1;
  *((_QWORD *)&v72 + 1) = 0;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v75 = __containerAppBundleIdentifiersForURL_block_invoke;
  v76 = &unk_1E4AC2AB8;
  v18 = v16;
  v77 = v18;
  v79 = &v70;
  v19 = v17;
  v78 = v19;
  objc_msgSend(v18, "safari_accessingSecurityScopedResource:", &buf);
  v69 = *(id *)(*((_QWORD *)&v70 + 1) + 40);

  _Block_object_dispose(&v70, 8);
  if (objc_msgSend(v69, "count"))
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v20 = v69;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, &buf, 16);
    v22 = v21;
    if (v21)
    {
      v23 = *(_QWORD *)v71;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v71 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v24);
          v21 = __appToLaunch_block_invoke(v21, v25, v14);
          if ((_DWORD)v21)
          {
            objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v26 && (objc_msgSend(v26, "supportsOpenInPlace") & 1) != 0)
              goto LABEL_51;

          }
          ++v24;
        }
        while (v22 != v24);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, &buf, 16);
        v22 = v21;
      }
      while (v21);
    }
    v27 = 0;
    goto LABEL_51;
  }
  v20 = v18;
  *(_QWORD *)&buf = *MEMORY[0x1E0C99AD0];
  v28 = buf;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v70 = 0;
  objc_msgSend(v20, "promisedItemResourceValuesForKeys:error:", v29, &v70);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)v70;
  objc_msgSend(v30, "objectForKeyedSubscript:", v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v33 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      tryOpeningInDefaultApp_cold_2((uint64_t)v20, v33, v31);
  }
  else if (v32)
  {
    PreferredIdentifierForTag = v32;
    goto LABEL_23;
  }
  objc_msgSend(v20, "pathExtension");
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v34, "length"))
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v34, 0);
  else
    PreferredIdentifierForTag = 0;

LABEL_23:
  if (PreferredIdentifierForTag)
  {
    v35 = PreferredIdentifierForTag;
    v36 = *MEMORY[0x1E0CA5BF8];
    v82[0] = *MEMORY[0x1E0CA5B90];
    v82[1] = v36;
    v37 = *MEMORY[0x1E0CA5C00];
    v82[2] = *MEMORY[0x1E0CA5AC8];
    v82[3] = v37;
    v38 = *MEMORY[0x1E0CA5AF8];
    v82[4] = *MEMORY[0x1E0CA5B10];
    v82[5] = v38;
    v82[6] = *MEMORY[0x1E0CA5B40];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, &buf, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v71;
      while (2)
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v71 != v42)
            objc_enumerationMutation(v40);
          if (UTTypeConformsTo(v35, *(CFStringRef *)(*((_QWORD *)&v70 + 1) + 8 * i)))
          {

            v55 = WBS_LOG_CHANNEL_PREFIXDownloads();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf) = 138477827;
              *(_QWORD *)((char *)&buf + 4) = v35;
              _os_log_impl(&dword_1A3B2D000, v55, OS_LOG_TYPE_INFO, "Preferring QuickLook for type %{private}@", (uint8_t *)&buf, 0xCu);
            }
            v27 = 0;
            goto LABEL_50;
          }
        }
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, &buf, 16);
        if (v41)
          continue;
        break;
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForURL:isContentManaged:sourceAuditToken:", v20, a3, 0);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x1E0CA59C8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CA59C8]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  objc_msgSend(v44, "applicationsAvailableForOpeningWithHandlerRanks:error:", v46, &buf);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (id)buf;

  if (v48)
  {
    v49 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      tryOpeningInDefaultApp_cold_1(v49, v44, v48);
  }
  objc_msgSend(v47, "objectForKeyedSubscript:", v45);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "firstObject");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51 && objc_msgSend(v51, "supportsOpenInPlace"))
    v52 = v51;
  else
    v52 = 0;

  if (v52)
  {
    objc_msgSend(v52, "bundleIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

    if ((v54 & 1) == 0)
    {
      v27 = v52;
      goto LABEL_49;
    }
  }
  else
  {
    v56 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = PreferredIdentifierForTag;
      _os_log_impl(&dword_1A3B2D000, v56, OS_LOG_TYPE_INFO, "Didn't find owning app to open type %{private}@; falling back to QuickLook",
        (uint8_t *)&buf,
        0xCu);
    }
  }
  v27 = 0;
LABEL_49:

LABEL_50:
LABEL_51:

  if (v67)
  {
    objc_msgSend(v27, "bundleIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v18;
    v59 = v57;
    v60 = v68;
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v75 = __tryOpeningInApp_block_invoke;
    v76 = &unk_1E4AC2B30;
    v80 = 1;
    v77 = v58;
    v61 = (__int128 *)v60;
    v78 = v59;
    v79 = v61;
    v81 = a3;
    v62 = (void *)MEMORY[0x1A8598C40](&buf);
    *(_QWORD *)&v70 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v70 + 1) = 3221225472;
    *(_QWORD *)&v71 = __tryOpeningInApp_block_invoke_4;
    *((_QWORD *)&v71 + 1) = &unk_1E4AC2B58;
    *(_QWORD *)&v72 = v61;
    *((_QWORD *)&v72 + 1) = v62;
    v63 = v61;
    v64 = v62;
    FPExtendBookmarkForDocumentURL();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "_sf_openURL:inApplication:withOptions:completionHandler:", v18, v27, 0, v68);
  }

}

void sub_1A3BB9FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __appToLaunch_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D1D898], "defaultPermission");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "canAppWithBundleIdentifier:performAction:bundleIdentifier:", v4, 2, v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __containerAppBundleIdentifiersForURL_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "br_cloudDocsContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "identifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.icloud.applecorporate")),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(v3, "bundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);

  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v11[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __tryOpeningInApp_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _SFOpenURLOperationDelegate *v14;
  _SFOpenURLOperationDelegate *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, int);
  void *v21;
  id v22;
  id v23;
  char v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0CA57E0];
    v28[0] = v3;
    v6 = *MEMORY[0x1E0CA5818];
    v27[0] = v5;
    v27[1] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v7;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (void **)v28;
    v10 = v27;
    v11 = 2;
  }
  else
  {
    v25 = *MEMORY[0x1E0CA5818];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v26;
    v10 = &v25;
    v11 = 1;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(*(id *)(a1 + 32), "startAccessingSecurityScopedResource");
  v14 = [_SFOpenURLOperationDelegate alloc];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __tryOpeningInApp_block_invoke_2;
  v21 = &unk_1E4AC2B08;
  v22 = *(id *)(a1 + 32);
  v23 = *(id *)(a1 + 48);
  v24 = v13;
  v15 = -[_SFOpenURLOperationDelegate initWithCompletionHandler:](v14, "initWithCompletionHandler:", &v18);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 57), 0, v12, 0, v15, v18, v19, v20, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "start");
}

void __tryOpeningInApp_block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    v3 = *(id *)(a1 + 40);
    FPUpdateLastUsedDate();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
}

uint64_t __tryOpeningInApp_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __tryOpeningInApp_block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __tryOpeningInApp_block_invoke_5;
    v6[3] = &unk_1E4AC1338;
    v8 = *(id *)(a1 + 40);
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __tryOpeningInApp_block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void *__getQLPreviewGetSupportedMIMETypesSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (QuickLookLibraryCore_frameworkLibrary)
  {
    v2 = (void *)QuickLookLibraryCore_frameworkLibrary;
  }
  else
  {
    QuickLookLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)QuickLookLibraryCore_frameworkLibrary;
    if (!QuickLookLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "QLPreviewGetSupportedMIMETypes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getQLPreviewGetSupportedMIMETypesSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3BBBA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BBE284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BBE6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BC0474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BC31A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t previewContentForElementInfo(_WKActivatedElementInfo *a1)
{
  _WKActivatedElementInfo *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (-[_WKActivatedElementInfo type](v1, "type") == 1)
  {
    +[_SFQRCodeDetectionController sharedController](_SFQRCodeDetectionController, "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "actionForElement:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = 2;
    else
      v4 = 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1A3BC3258(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t shouldProvideActionsForQRCodes(void)
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVKImageAnalyzerClass(void)::softClass;
  v7 = getVKImageAnalyzerClass(void)::softClass;
  if (!getVKImageAnalyzerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___ZL23getVKImageAnalyzerClassv_block_invoke;
    v3[3] = &unk_1E4ABFDC0;
    v3[4] = &v4;
    ___ZL23getVKImageAnalyzerClassv_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  return objc_msgSend(v1, "deviceSupportsImageAnalysis") ^ 1;
}

void sub_1A3BC331C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BC342C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3BC34B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC3534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BC3628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3BC3690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BC37BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3BC3A40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BC3BA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC3C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BC3CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3BC3DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BC3EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BC3F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_SFLinkPreviewHelper;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A3BC4078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC4174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC4264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BC4328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3BC43AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC4404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BC4474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC459C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BC4F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1A3BC5258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1A3BC5330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BC540C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC551C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BC578C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BC5834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BC5A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A3BC5AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BC5C94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BC5D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BC5E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A3BC60D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BC61E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BC6340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A3BC64D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A3BC65D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

Class ___ZL23getVKImageAnalyzerClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    VisionKitCoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!VisionKitCoreLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VKImageAnalyzer");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1();
    free(v3);
  }
  getVKImageAnalyzerClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ___ZZ51___SFLinkPreviewHelper_commitPreviewViewController_ENK3__0clEP5NSURL_block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a2 + 1) >= 4)
  {
    if (a2 == 3)
    {
      v3 = (void *)a1[4];
      v7 = *MEMORY[0x1E0DAB538];
      v8[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "openExternallyWithWebBrowserState:referrerURL:completionHandler:", v4, 0, 0);

    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZZ51___SFLinkPreviewHelper_commitPreviewViewController_ENK3__0clEP5NSURL_block_invoke_2;
    block[3] = &unk_1E4AC0590;
    v2 = (void *)a1[6];
    block[4] = a1[5];
    v6 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void sub_1A3BC6898(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZZ51___SFLinkPreviewHelper_commitPreviewViewController_ENK3__0clEP5NSURL_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openURL:forAction:withTabOrder:", *(_QWORD *)(a1 + 40), 2, 0);
}

id privacyReportTitleForCurrentStatus(int a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  v3 = *MEMORY[0x1E0DC32A0];
  v23[1] = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isPrivacyProxyActive")
    || !objc_msgSend(v6, "isPrivacyProxyOnForEitherTier"))
  {
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isPrivacyProxyOnInICloudSettings"))
    objc_msgSend(v6, "isPrivacyProxyRestrictedToTrackersByUser");
  v7 = objc_alloc(MEMORY[0x1E0CB3778]);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v5);

  if (!v9)
  {
LABEL_6:
    v10 = objc_alloc(MEMORY[0x1E0CB3778]);
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v5);

  }
  objc_msgSend(v9, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("{show-more-less-link}"));
  v15 = v14;

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = v3;
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributes:range:", v17, v13, v15);

  }
  _WBSLocalizedString();
  if (a1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("show-less://");
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("show-more://");
  }
  objc_msgSend(v9, "safari_replaceOccurrenceOfString:withString:link:", CFSTR("{show-more-less-link}"), v18, v19);

  return v9;
}

void sub_1A3BC8254(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BC8418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  os_unfair_lock_unlock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);
  _Unwind_Resume(a1);
}

void sub_1A3BC851C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  os_unfair_lock_unlock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);

  _Unwind_Resume(a1);
}

void sub_1A3BC85D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC870C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A3BC88A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)SFBrowserServiceViewController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

id safariViewControllerProcessPoolStorage(void)
{
  if (safariViewControllerProcessPoolStorage(void)::onceToken != -1)
    dispatch_once(&safariViewControllerProcessPoolStorage(void)::onceToken, &__block_literal_global_345);
  return (id)safariViewControllerProcessPoolStorage(void)::dictionary;
}

id safariViewControllerDataStoreStorage(void)
{
  if (safariViewControllerDataStoreStorage(void)::onceToken != -1)
    dispatch_once(&safariViewControllerDataStoreStorage(void)::onceToken, &__block_literal_global_347_0);
  return (id)safariViewControllerDataStoreStorage(void)::dictionary;
}

void sub_1A3BC8AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BC8BE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BC8CD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BC8DA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3BC8E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BC8EDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC9038(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC916C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC93A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3BC95A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BC9764(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3BC986C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BC9D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_destroyWeak((id *)(v17 - 152));
  _Unwind_Resume(a1);
}

void sub_1A3BC9F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BCA048(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCA0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BCA298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  void *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3BCA324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BCA3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A3BCA53C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCA69C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCA73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCA798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCA8A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCA9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCAA6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BCAAF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BCABA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BCAC7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BCACCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BCAEC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A3BCB27C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3BCB414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A3BCB5F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BCB868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BCB97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A3BCBA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A3BCBAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BCBB2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCBC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BCBD14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BCBD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCBE04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BCBF34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCBFFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCC1BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3BCC254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCC400(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCC57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BCC748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  void *v13;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BCC8BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCC9E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A3BCCB3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BCCC84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BCCD70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BCCE0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCCE9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCCF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1A3BCD040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCD14C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void updatePowerLogEventForAllHostApps(void)
{
  void *v0;
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)allHostAppBundleIDs, "count"))
  {
    if (PLShouldLogRegisteredEvent())
    {
      v1 = CFSTR("bundleIDs");
      objc_msgSend((id)allHostAppBundleIDs, "allObjects");
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      v2[0] = v0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
      PLLogRegisteredEvent();

    }
  }
}

void sub_1A3BCD378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL38safariViewControllerProcessPoolStoragev_block_invoke()
{
  SFProcessDictionary *v0;
  void *v1;

  v0 = -[SFProcessDictionary initWithCacheCapacity:]([SFProcessDictionary alloc], "initWithCacheCapacity:", 10);
  v1 = (void *)safariViewControllerProcessPoolStorage(void)::dictionary;
  safariViewControllerProcessPoolStorage(void)::dictionary = (uint64_t)v0;

}

void ___ZL36safariViewControllerDataStoreStoragev_block_invoke()
{
  SFProcessDictionary *v0;
  void *v1;

  v0 = -[SFProcessDictionary initWithCacheCapacity:]([SFProcessDictionary alloc], "initWithCacheCapacity:", 10);
  v1 = (void *)safariViewControllerDataStoreStorage(void)::dictionary;
  safariViewControllerDataStoreStorage(void)::dictionary = (uint64_t)v0;

}

uint64_t SFDebugMenuEnabled()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x1E0D8A8F8], "hasInternalContent");
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("DebugShowInternalActions"));

    return v2;
  }
  return result;
}

void sub_1A3BCDD80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A3BCEEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3BCEF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCEFE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BCF09C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BCF104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCF340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A3BCF550(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BCF6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3BCF75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BCF990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void sub_1A3BCFAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A3BCFBF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCFE14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BCFFE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3BD01BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A3BD0290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD03A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1A3BD05A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD070C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD0A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  uint64_t v11;

  objc_destroyWeak((id *)(v11 - 120));
  _Unwind_Resume(a1);
}

void sub_1A3BD1A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, void *a20,_Unwind_Exception *exception_objecta,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43)
{
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  _Unwind_Resume(a1);
}

void sub_1A3BD2764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD2CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A3BD2F14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD2F94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD3004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD3078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD30E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD3184(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3BD32F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BD33C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD34EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3BD370C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD3890(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD3914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD399C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD3A24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD3AAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD3C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BD3CF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD3FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1A3BD4274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3BD42D8()
{
  JUMPOUT(0x1A3BD42BCLL);
}

void sub_1A3BD42E0()
{
  JUMPOUT(0x1A3BD42C0);
}

void sub_1A3BD4414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3BD47B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1A3BD4A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3BD4AD4()
{
  JUMPOUT(0x1A3BD4AB8);
}

void sub_1A3BD4ADC()
{
  JUMPOUT(0x1A3BD4ABCLL);
}

void sub_1A3BD4BF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD4D10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD4E28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD4EF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD4FB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD5024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD50C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t OUTLINED_FUNCTION_12(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2113;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_1A3BD6458(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_1A3BD6594(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3BD73C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t contentBlockerDidChange(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  return objc_msgSend(a2, "reloadContentBlockers", a3, a4, a5);
}

void sub_1A3BD767C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD7728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD7788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD7918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;
  void *v11;

  v11 = v10;

  a9.super_class = (Class)SFWebViewController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A3BD7B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD7BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD7CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD7D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD7DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD7E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD7F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD8048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD80F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD8164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD821C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD8298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD8310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD83A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD8418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD84C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD8570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD8618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD86B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD87B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD8848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD88BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD8960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD89F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD8A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD8AFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD8B8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD8C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3BD8D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD8E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD8F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD8FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD91F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD925C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3BD93D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD94A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BD95B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD982C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BD98EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD9970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD9A04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BD9A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BD9B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD9B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BD9BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BD9D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BD9E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A3BD9F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BDA01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3BDA088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BDA2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v21 = v20;

  _Unwind_Resume(a1);
}

void sub_1A3BDA478(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3BDA530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BDA5C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BDA628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BDA6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BDA764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3BDA7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BDA868(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BDA8DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BDA94C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BDA9BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BDAA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3BDAAC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3BE031C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BE0774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BE1B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BE2C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BE34F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id detailStringForPasskey(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "customTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
    objc_msgSend(v1, "customTitle");
  else
    _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1A3BE6184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a68;

  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__127(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A8598C40](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__128(uint64_t a1)
{

}

void sub_1A3BE7680(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)&STACK[0x258]);
  _Unwind_Resume(a1);
}

void sub_1A3BE7DCC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A3BE8294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  uint64_t v24;

  _Block_object_dispose((const void *)(v24 - 224), 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v24 - 128));
  _Unwind_Resume(a1);
}

void sub_1A3BE9434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BEAA50(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3BEB7D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1A3BEB8C0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3BEBE34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1A3BEC140(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3BED588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BED90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BEE904(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)&STACK[0x288]);
  _Unwind_Resume(a1);
}

void sub_1A3BEF114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BEF1DC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3BEF3F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  uint64_t v18;

  _Block_object_dispose((const void *)(v18 - 96), 8);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BEF50C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3BF0B7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

Class __getCNContactPickerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ContactsUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CNContactPickerViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getCNContactPickerViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getCNContactPickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3BF3FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BF56B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BF5F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BFCB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3BFCE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BFD138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEKEventStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!EventKitLibraryCore_frameworkLibrary)
  {
    EventKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!EventKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("EKEventStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getEKEventStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getEKEventStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getEKICSPreviewControllerClass_block_invoke(uint64_t a1)
{
  EventKitUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKICSPreviewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKICSPreviewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getEKICSPreviewControllerClass_block_invoke_cold_1();
    EventKitUILibrary();
  }
}

void EventKitUILibrary()
{
  void *v0;

  if (!EventKitUILibraryCore_frameworkLibrary)
    EventKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!EventKitUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

SFAccountTableViewCell *__getEKEventViewControllerClass_block_invoke(uint64_t a1)
{
  SFAccountTableViewCell *result;
  SFAccountTableViewCell *v3;
  SEL v4;
  int64_t v5;
  id v6;

  EventKitUILibrary();
  result = (SFAccountTableViewCell *)objc_getClass("EKEventViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKEventViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SFAccountTableViewCell *)__getEKEventViewControllerClass_block_invoke_cold_1();
    return -[SFAccountTableViewCell initWithStyle:reuseIdentifier:](v3, v4, v5, v6);
  }
  return result;
}

void __blankImage_block_invoke()
{
  uint64_t v0;
  void *v1;
  CGSize v2;

  objc_msgSend(MEMORY[0x1E0C92670], "tableViewIconSize");
  UIGraphicsBeginImageContextWithOptions(v2, 0, 0.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blankImage_image;
  blankImage_image = v0;

  UIGraphicsEndImageContext();
}

void sub_1A3BFEAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3BFED2C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A3BFF360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SFWebProcessPlugInPageExtensionController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A3BFF404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3BFF55C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3BFF8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A3BFFA74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3BFFC44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

id fileURLForReaderURL(NSURL *a1)
{
  NSURL *v1;
  void *v2;

  v1 = a1;
  if ((-[NSURL safari_hasScheme:](v1, "safari_hasScheme:", CFSTR("safari-reader")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D8AB88], "readerHTMLSourceURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1A3BFFE24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id fileURLForResourceURL(NSURL *a1)
{
  NSURL *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if ((-[NSURL safari_hasScheme:](v1, "safari_hasScheme:", CFSTR("safari-resource")) & 1) != 0)
  {
    -[NSURL lastPathComponent](v1, "lastPathComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", v2, &stru_1E4AC8470);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Safari.Shared"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLForResource:withExtension:", v2, &stru_1E4AC8470);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URLForResource:withExtension:", v2, &stru_1E4AC8470);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1A3BFFF44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C0000C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A3C07904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1A3C082B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

SafariServices::ReaderAvailabilityController *SafariServices::ReaderAvailabilityController::ReaderAvailabilityController(SafariServices::ReaderAvailabilityController *this, _SFWebProcessPlugInReaderEnabledPageController *a2)
{
  _SFWebProcessPlugInReaderEnabledPageController *v3;

  v3 = a2;
  SafariShared::ReaderAvailabilityController::ReaderAvailabilityController(this);
  *(_QWORD *)this = &off_1E4AC4AF8;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = v3;
  *((_BYTE *)this + 104) = 0;
  return this;
}

void sub_1A3C0A304(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SafariServices::ReaderAvailabilityController::createArticleFinderJSController(id *this@<X0>, SafariServices::ArticleFinderJSController **a2@<X8>)
{
  WKWebProcessPlugInScriptWorld *v4;
  SafariServices::ArticleFinderJSController *v5;
  WKWebProcessPlugInFrame *v6;

  objc_msgSend(this[12], "mainFrame");
  v6 = (WKWebProcessPlugInFrame *)objc_claimAutoreleasedReturnValue();
  SafariServices::ReaderAvailabilityController::isolatedWorld((SafariServices::ReaderAvailabilityController *)this);
  v4 = (WKWebProcessPlugInScriptWorld *)objc_claimAutoreleasedReturnValue();
  v5 = (SafariServices::ArticleFinderJSController *)operator new();
  SafariServices::ArticleFinderJSController::ArticleFinderJSController(v5, v6, v4);
  *a2 = v5;

}

void sub_1A3C0A39C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  uint64_t v11;

  MEMORY[0x1A85987FC](v11, 0x10A1C406DF74740);

  _Unwind_Resume(a1);
}

id SafariServices::ReaderAvailabilityController::isolatedWorld(SafariServices::ReaderAvailabilityController *this)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 11);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CEF628], "world");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)this + 11);
    *((_QWORD *)this + 11) = v3;

    objc_msgSend(*((id *)this + 11), "makeAllShadowRootsOpen");
    objc_msgSend(*((id *)this + 11), "disableOverrideBuiltinsBehavior");
    v2 = (void *)*((_QWORD *)this + 11);
  }
  return v2;
}

uint64_t SafariServices::ReaderAvailabilityController::canInjectArticleFinder(id *this)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(this[12], "mainFrame");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "_hasCustomContentProvider") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(v1, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "safari_isHTTPFamilyURL") & 1) != 0)
      v2 = 1;
    else
      v2 = objc_msgSend(v3, "isFileURL");

  }
  return v2;
}

void sub_1A3C0A4A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SafariServices::ReaderAvailabilityController::targetFrameJSContext(id *this)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(this[12], "mainFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SafariServices::ReaderAvailabilityController::isolatedWorld((SafariServices::ReaderAvailabilityController *)this);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsContextForWorld:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "JSGlobalContextRef");

  return v5;
}

void sub_1A3C0A538(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t SafariServices::ReaderAvailabilityController::clearIsolatedWorld(id *this)
{
  return objc_msgSend(this[11], "clearWrappers");
}

uint64_t SafariServices::ReaderAvailabilityController::availabilityWasDetermined(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 96), "didDetermineReaderAvailability:", a2);
  *(_BYTE *)(a1 + 104) = 1;
  return result;
}

uint64_t SafariServices::ReaderAvailabilityController::additionalTextSamplesWereDetermined(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 96), "didDetermineAdditionalTextSamples:", a2);
}

uint64_t SafariServices::ReaderAvailabilityController::determineAvailabilityForDynamicCheck(SafariServices::ReaderAvailabilityController *this)
{
  uint64_t result;

  result = SafariShared::ReaderAvailabilityController::prepareArticleFinder(this);
  if ((_DWORD)result)
  {
    SafariShared::ReaderAvailabilityController::originalArticleFinderJSController(this);
    JUMPOUT(0x1A8598718);
  }
  return result;
}

uint64_t SafariServices::ReaderAvailabilityController::articleContentDidChange(id *this)
{
  return objc_msgSend(this[12], "articleContentDidChange");
}

uint64_t SafariServices::ReaderAvailabilityController::didExtractReaderTextAndPageMetadata(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return objc_msgSend(*(id *)(a1 + 96), "readerTextWasExtracted:withMetadata:wasDeterminingAvailability:", a2, a3, a4 == 1);
}

uint64_t SafariServices::ReaderAvailabilityController::clearAvailability(SafariServices::ReaderAvailabilityController *this)
{
  uint64_t result;

  result = SafariShared::ReaderAvailabilityController::clearAvailability(this);
  *((_BYTE *)this + 104) = 0;
  return result;
}

id SafariServices::ReaderAvailabilityController::collectReadingListItemInformation(SafariServices::ReaderAvailabilityController *this)
{
  SafariShared::ArticleFinderJSController *v2;
  const OpaqueJSContext *v3;
  SafariShared::JSUtilities *v4;
  const OpaqueJSValue *v5;
  void *v6;

  if (SafariShared::ReaderAvailabilityController::prepareArticleFinder(this))
  {
    v2 = (SafariShared::ArticleFinderJSController *)SafariShared::ReaderAvailabilityController::originalArticleFinderJSController(this);
    v3 = (const OpaqueJSContext *)SafariShared::ArticleFinderJSController::collectReadingListItemInformation(v2);
    v4 = (SafariShared::JSUtilities *)(*(uint64_t (**)(SafariServices::ReaderAvailabilityController *))(*(_QWORD *)this + 96))(this);
    if (JSValueIsObject(v4, v3))
      SafariShared::JSUtilities::translateJSValueToNS(v4, v3, v5);
    else
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id SafariServices::ReaderAvailabilityController::articleContent(SafariServices::ReaderAvailabilityController *this)
{
  SafariShared::ArticleFinderJSController *v2;
  const OpaqueJSContext *v3;
  SafariShared::JSUtilities *v4;
  const OpaqueJSValue *v5;
  void *v6;

  if (SafariShared::ReaderAvailabilityController::prepareArticleFinder(this))
  {
    v2 = (SafariShared::ArticleFinderJSController *)SafariShared::ReaderAvailabilityController::originalArticleFinderJSController(this);
    v3 = (const OpaqueJSContext *)SafariShared::ArticleFinderJSController::articleContent(v2);
    v4 = (SafariShared::JSUtilities *)(*(uint64_t (**)(SafariServices::ReaderAvailabilityController *))(*(_QWORD *)this + 96))(this);
    if (JSValueIsObject(v4, v3))
      SafariShared::JSUtilities::translateJSValueToNS(v4, v3, v5);
    else
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void SafariServices::ReaderAvailabilityController::~ReaderAvailabilityController(id *this)
{

  SafariShared::ReaderAvailabilityController::~ReaderAvailabilityController((SafariShared::ReaderAvailabilityController *)this);
}

{

  SafariShared::ReaderAvailabilityController::~ReaderAvailabilityController((SafariShared::ReaderAvailabilityController *)this);
  JUMPOUT(0x1A85987FCLL);
}

void sub_1A3C0AE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C0EA60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C0EAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0EB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0EBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C0EC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C0ED18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0EE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0EFA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3C0F040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0F12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3C0F1A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0F1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0F290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0F33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0F3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0F490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C0F544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0F5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C0F644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0F740(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x1A85987FC](v3, 0x10A1C405B7E95FFLL);

  _Unwind_Resume(a1);
}

void sub_1A3C0F804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C0F8D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C0F990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C0FA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C0FB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v11;

  _Unwind_Resume(a1);
}

void sub_1A3C0FBE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1A3C0FC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C0FD28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C0FE4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C0FFB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3C11EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C13034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C1325C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C13A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C13F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C14130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C14F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)(v19 - 112));
  _Unwind_Resume(a1);
}

void sub_1A3C182A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1A3C18FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C1A64C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1A3C1ACD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13)
{
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(a1);
}

void sub_1A3C1B33C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A3C1B74C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1A3C1BE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSearchUIClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SearchUILibraryCore_frameworkLibrary)
  {
    SearchUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SearchUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SearchUI");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSearchUIClass_block_invoke_cold_1();
    free(v3);
  }
  getSearchUIClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _SFPreferredMailContentTypeForActivityContentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) < 2)
    return 1;
  if (a1 != 5 && a1)
    return 3;
  return 0;
}

void sub_1A3C1D560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLPLinkMetadataClass_block_invoke_0(uint64_t a1)
{
  LinkPresentationLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLPLinkMetadataClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLPLinkMetadataClass_block_invoke_cold_1();
    LinkPresentationLibrary_0();
  }
}

void LinkPresentationLibrary_0()
{
  void *v0;

  if (!LinkPresentationLibraryCore_frameworkLibrary_0)
    LinkPresentationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!LinkPresentationLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

_SFReaderExtractor *__getLPFileMetadataClass_block_invoke_0(uint64_t a1)
{
  _SFReaderExtractor *result;
  _SFReaderExtractor *v3;
  SEL v4;

  LinkPresentationLibrary_0();
  result = (_SFReaderExtractor *)objc_getClass("LPFileMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLPFileMetadataClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (_SFReaderExtractor *)__getLPFileMetadataClass_block_invoke_cold_1();
    return -[_SFReaderExtractor init](v3, v4);
  }
  return result;
}

void sub_1A3C1E1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C1E364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C1F498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1A3C2034C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SFViewControllerViewEmbeddedByPreviewController(void *a1)
{
  uint64_t result;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  result = a1;
  if (result)
  {
    v2 = (void *)result;
    while (1)
    {
      objc_msgSend(v2, "_existingPresentationControllerImmediate:effective:", 0, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "presentationStyle") == 20)
        break;
      objc_msgSend(v2, "parentViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = v4;
      }
      else
      {
        objc_msgSend(v2, "presentingViewController");
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;

      v2 = v7;
      if (!v7)
        return 0;
    }

    return 1;
  }
  return result;
}

BOOL SFViewControllerViewIsVisible(void *a1, _BYTE *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double width;
  double height;
  double v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v3 = a1;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (SFViewControllerViewEmbeddedByPreviewController(v3))
      {
        v7 = 1;
        if (a2)
          *a2 = 1;
        goto LABEL_31;
      }
      objc_msgSend(v3, "view");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        while (1)
        {
          objc_msgSend(v9, "bounds");
          objc_msgSend(v9, "convertRect:toView:", v5);
          v11 = v10;
          v13 = v12;
          v15 = v14;
          v17 = v16;
          objc_msgSend(v5, "bounds");
          v38.origin.x = v18;
          v38.origin.y = v19;
          v38.size.width = v20;
          v38.size.height = v21;
          v36.origin.x = v11;
          v36.origin.y = v13;
          v36.size.width = v15;
          v36.size.height = v17;
          v37 = CGRectIntersection(v36, v38);
          width = v37.size.width;
          height = v37.size.height;
          objc_msgSend(v9, "alpha", v37.origin.x, v37.origin.y);
          v25 = v24 < 0.05 || width < 1.0;
          v26 = v25 || height < 1.0;
          if (v26 || (objc_msgSend(v9, "isHidden") & 1) != 0)
            break;
          objc_msgSend(v9, "superview");
          v27 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v27;
          if (!v27)
            goto LABEL_18;
        }
        v7 = 0;
        goto LABEL_21;
      }
LABEL_18:
      objc_msgSend(v3, "traitCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "userInterfaceIdiom");

      if (v29 == 6)
      {
        objc_msgSend(v5, "windowScene");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9 != 0;
LABEL_21:

LABEL_31:
        goto LABEL_32;
      }
      if (v3)
      {
        v30 = v3;
        while (1)
        {
          v7 = v30 == v6;
          if (v30 == v6)
            break;
          objc_msgSend(v30, "presentingViewController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            v33 = v31;
          }
          else
          {
            objc_msgSend(v30, "parentViewController");
            v33 = (id)objc_claimAutoreleasedReturnValue();
          }
          v34 = v33;

          v3 = 0;
          v30 = v34;
          if (!v34)
            goto LABEL_31;
        }
        v3 = v6;
        goto LABEL_31;
      }
    }
    v7 = 0;
    goto LABEL_31;
  }
  v7 = 0;
LABEL_32:

  return v7;
}

uint64_t performViewWillAppearInLoadView()
{
  void *v1;
  void *v2;
  uint64_t v3;

  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

void sub_1A3C2A1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t eligibleForSlideInPresentation()
{
  void *v1;
  void *v2;
  uint64_t v3;

  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

void sub_1A3C2C2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C2D194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1A3C2D5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C2D6C4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_1A3C2EA3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3C2EB14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3C2EC6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3C2ECDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3C2ED64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A3C2FDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C303AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C30AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C31888(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t isLiveCameraOnlyAction(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "isLiveCameraOnlyAction");
  else
    v2 = 0;

  return v2;
}

void sub_1A3C31CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBCSQRCodeParserClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!BarcodeSupportLibraryCore_frameworkLibrary)
  {
    BarcodeSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!BarcodeSupportLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BCSQRCodeParser");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getBCSQRCodeParserClass_block_invoke_cold_1();
    free(v3);
  }
  getBCSQRCodeParserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3C347CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C34998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C34BC4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id getMFMailComposeViewControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMFMailComposeViewControllerClass_softClass;
  v7 = getMFMailComposeViewControllerClass_softClass;
  if (!getMFMailComposeViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMFMailComposeViewControllerClass_block_invoke;
    v3[3] = &unk_1E4ABFC78;
    v3[4] = &v4;
    __getMFMailComposeViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3C36B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMFMailComposeViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MessageUILibraryCore_frameworkLibrary)
  {
    MessageUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MessageUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MFMailComposeViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMFMailComposeViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getMFMailComposeViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3C3B9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3C3BC1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3C3BE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)_SFBrowserContentViewController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A3C3C1B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C3C298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C3C388(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C3C414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C3C4C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C3C7FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id getMFMailComposeViewControllerClass(void)
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMFMailComposeViewControllerClass(void)::softClass;
  v7 = getMFMailComposeViewControllerClass(void)::softClass;
  if (!getMFMailComposeViewControllerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___ZL35getMFMailComposeViewControllerClassv_block_invoke;
    v3[3] = &unk_1E4ABFDC0;
    v3[4] = &v4;
    ___ZL35getMFMailComposeViewControllerClassv_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3C3C8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C3C9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C3CBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C3CCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C3CD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C3CE80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3CF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C3D108(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3C3D278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C3D4FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C3D630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

id mobileSafariDefaultDataStore(void)
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)mobileSafariDefaultDataStore(void)::dataStore;
  if (!mobileSafariDefaultDataStore(void)::dataStore)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CEF738]);
    objc_msgSend(v1, "setSourceApplicationBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
    objc_msgSend(MEMORY[0x1E0CEF650], "safari_dataStoreWithConfiguration:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)mobileSafariDefaultDataStore(void)::dataStore;
    mobileSafariDefaultDataStore(void)::dataStore = v2;

    v0 = (void *)mobileSafariDefaultDataStore(void)::dataStore;
  }
  return v0;
}

void sub_1A3C3D73C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3D830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id mobileSafariNonPersistentDataStore(SFSafariViewControllerConfiguration *a1)
{
  SFSafariViewControllerConfiguration *v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF738]), "initNonPersistentConfiguration");
  objc_msgSend(v2, "setSourceApplicationBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  if (-[SFSafariViewControllerConfiguration _isBeingUsedForCellularServiceBootstrap](v1, "_isBeingUsedForCellularServiceBootstrap"))
  {
    objc_msgSend(v2, "setSourceApplicationSecondaryIdentifier:", CFSTR("com.apple.CommCenter.CellularPlanProvisioning"));
  }
  objc_msgSend(MEMORY[0x1E0CEF650], "safari_dataStoreWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1A3C3D8CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3DA14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3C3DDB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3C3DE84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C3DF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C3E0F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C3E1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C3E274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3E318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3C3E384(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3E424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C3E4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C3E608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C3E6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C3EA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C3EAD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C3ED4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1A3C3EF6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3F090(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3F160(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3F1F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3F5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A3C3F6DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3F74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C3FCD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1A3C3FE44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C3FEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C3FFD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A3C400E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C403A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C40468(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C40550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C406C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C40748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C407E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4097C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1A3C40BDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1A3C40CD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C40D44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C40DEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C41040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C41104(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C411E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3C412EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C41354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4143C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4159C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3C41908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C41C6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C41EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C41F38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C42118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  id *v16;
  void *v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3C422BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A3C4239C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1A3C42478(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C42528(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C425F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C42A20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C42B30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C42C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C42CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A3C42EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C42F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C43088(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C431A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4334C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C434F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C43668(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3C43850(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C43930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C43A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C43C38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C43D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C43EF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3C44048(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A3C4416C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  id *v18;

  v18 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C4428C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C443E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3C4450C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C44570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C446CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3C447F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C44854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C44990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;

  v19 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C44AB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C44B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A3C44C70(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

id getSLComposeViewControllerClass(void)
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSLComposeViewControllerClass(void)::softClass;
  v7 = getSLComposeViewControllerClass(void)::softClass;
  if (!getSLComposeViewControllerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___ZL31getSLComposeViewControllerClassv_block_invoke;
    v3[3] = &unk_1E4ABFDC0;
    v3[4] = &v4;
    ___ZL31getSLComposeViewControllerClassv_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3C44D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C450A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1A3C451F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C452E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C453B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C45448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C454FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C45544(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C455C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3C45660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A3C457F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C45990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C45AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3C45BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A3C45EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3C46090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C46148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C462E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  uint64_t v19;
  id *v20;

  v20 = v18;

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v19 - 56));

  _Unwind_Resume(a1);
}

void sub_1A3C466AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  __cxa_guard_abort(&_ZGVZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers);

  _Unwind_Resume(a1);
}

void sub_1A3C467DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A3C468FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C46A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3C46ACC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C46D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;

  v19 = v15;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3C46F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C47064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3C47210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3C472D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C47354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C47414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4752C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C476CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3C47814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C47B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_1A3C47CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A3C47E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A3C47F58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3C480B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3C48178(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C482CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1A3C4845C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C486A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A3C48824(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C48D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,void *a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v37 - 112));

  _Unwind_Resume(a1);
}

void sub_1A3C48F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_1A3C490AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  id *v17;

  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_1A3C49554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C49658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C49A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3C49B9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3C49C60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C49D04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3C49D7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C49E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C4A354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

id getPKAddPassesViewControllerClass(void)
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPKAddPassesViewControllerClass(void)::softClass;
  v7 = getPKAddPassesViewControllerClass(void)::softClass;
  if (!getPKAddPassesViewControllerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___ZL33getPKAddPassesViewControllerClassv_block_invoke;
    v3[3] = &unk_1E4ABFDC0;
    v3[4] = &v4;
    ___ZL33getPKAddPassesViewControllerClassv_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3C4A55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C4A614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A3C4A770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C4A85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4A904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4AA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A3C4AC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A3C4AD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4AFD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3C4B334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A3C4B490(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4B558(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A3C4B834(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A3C4BA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3C4BA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4BB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A3C4BBB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4BC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4BCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4BE04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A3C4BE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4BEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4C20C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A3C4C460(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C4C518(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4C5AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C4C63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4C718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4C7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4C8E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4C958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4C9B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4CB68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _Unwind_Resume(a1);
}

void sub_1A3C4CD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4CDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4CF04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4CFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4D014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4D1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4D27C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4D310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4D4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4D558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4D654(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4D7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C4D8BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4DA8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C4DB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4DC98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4DD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C4DEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A3C4E068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v11;

  _Unwind_Resume(a1);
}

void sub_1A3C4E104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4E1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4E2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4E334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4E3BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A3C4E440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4E4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4E590(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4E67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4E6D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4E71C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4E76C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4E83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4E930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4E9F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C4EC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  id *v17;
  void *v18;
  void *v19;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3C4ED18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C4EDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4EE84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4F5C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  _Block_object_dispose((const void *)(v7 - 120), 8);

  _Unwind_Resume(a1);
}

void sub_1A3C4F804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4F90C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4F9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C4FB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  void *v16;
  uint64_t v17;

  _Block_object_dispose((const void *)(v17 - 80), 8);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A3C4FC50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C4FD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C4FDDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C4FEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3C4FF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C50190(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3C50318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3C50428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A3C5077C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A3C50A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A3C50BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C50C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C50D18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C50DC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C50E58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C50EF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C50F9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C50FF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C51094(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C51124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C511CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C51344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C513BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C514DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C5163C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C516F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C51764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C51804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C5189C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C519E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C51C80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1A3C51D88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C51DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C51EA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C51FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C52010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C520B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C521CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C52240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C52348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C523AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C5245C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C524F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C52578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C52770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A3C5290C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1A3C52958()
{
  JUMPOUT(0x1A3C52944);
}

void sub_1A3C52960()
{
  JUMPOUT(0x1A3C52948);
}

void sub_1A3C52A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C52D84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C52F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C53098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C53168(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C53228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C5337C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A3C534B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C535EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C536C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C5372C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C5379C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C53834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A3C53908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C53A04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C53B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C53BDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C53CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C53D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C53E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C53FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1A3C54158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__358(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__359(uint64_t a1)
{

}

void sub_1A3C54264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C542FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C543B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C5450C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C545E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C547AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A3C54970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A3C549C0()
{
  JUMPOUT(0x1A3C549A8);
}

void sub_1A3C549C8()
{
  JUMPOUT(0x1A3C549ACLL);
}

void sub_1A3C549D0()
{
  JUMPOUT(0x1A3C549B0);
}

void sub_1A3C54A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A3C54AC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C54B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C54C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C54D08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C54D90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C54E38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Class ___ZL35getMFMailComposeViewControllerClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MessageUILibraryCore(char **)::frameworkLibrary)
  {
    MessageUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!MessageUILibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MFMailComposeViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMFMailComposeViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getMFMailComposeViewControllerClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL31getSLComposeViewControllerClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SocialLibraryCore(char **)::frameworkLibrary)
  {
    SocialLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!SocialLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SLComposeViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)___ZL31getSLComposeViewControllerClassv_block_invoke_cold_1();
    free(v3);
  }
  getSLComposeViewControllerClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL33getPKAddPassesViewControllerClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitUILibraryCore(char **)::frameworkLibrary)
  {
    PassKitUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!PassKitUILibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKAddPassesViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1();
    free(v3);
  }
  getPKAddPassesViewControllerClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ___ZL14getPKPassClassv_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PKPass");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKPassClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    ___ZL14getPKPassClassv_block_invoke_cold_1();
    PassKitCoreLibrary();
  }
}

void PassKitCoreLibrary(void)
{
  void *v0;

  if (!PassKitCoreLibraryCore(char **)::frameworkLibrary)
    PassKitCoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  if (!PassKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class ___ZL28getPKPassesXPCContainerClassv_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PassKitCoreLibrary();
  result = objc_getClass("PKPassesXPCContainer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKPassesXPCContainerClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1();
    return (Class)___ZL27getCLKWatchFaceLibraryClassv_block_invoke(v3);
  }
  return result;
}

Class ___ZL27getCLKWatchFaceLibraryClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ClockKitLibraryCore(char **)::frameworkLibrary)
  {
    ClockKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!ClockKitLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLKWatchFaceLibrary");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1();
    free(v3);
  }
  getCLKWatchFaceLibraryClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL19getFKSaveOrderClassv_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FinanceKitUILibraryCore(char **)::frameworkLibrary)
  {
    FinanceKitUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!FinanceKitUILibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FKSaveOrder");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    ___ZL19getFKSaveOrderClassv_block_invoke_cold_1();
    free(v3);
  }
  getFKSaveOrderClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3C57CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *_SFStringFromRequestDesktopSiteSetting(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "integerValue");
    v4 = CFSTR("Unknown");
    if (v3 == 1)
      v4 = CFSTR("Desktop");
    if (v3)
      v5 = v4;
    else
      v5 = CFSTR("Mobile");
  }
  else
  {
    v5 = CFSTR("Unspecified");
  }

  return v5;
}

void sub_1A3C58CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C5921C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SFReaderEnabledWebViewController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A3C59340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C5945C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C5953C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C595D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C596AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C597F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A3C59894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C59904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A3C59960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C599C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A3C59A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill_onceToken, &__block_literal_global_52);
  return WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAppStoreBanner()
{
  if (WBS_LOG_CHANNEL_PREFIXAppStoreBanner_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAppStoreBanner_onceToken, &__block_literal_global_3_0);
  return WBS_LOG_CHANNEL_PREFIXAppStoreBanner_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAuthenticationSession()
{
  if (WBS_LOG_CHANNEL_PREFIXAuthenticationSession_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAuthenticationSession_onceToken, &__block_literal_global_5);
  return WBS_LOG_CHANNEL_PREFIXAuthenticationSession_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken, &__block_literal_global_7);
  return WBS_LOG_CHANNEL_PREFIXAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_onceToken, &__block_literal_global_9);
  return WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXBookmarkSync()
{
  if (WBS_LOG_CHANNEL_PREFIXBookmarkSync_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBookmarkSync_onceToken, &__block_literal_global_11);
  return WBS_LOG_CHANNEL_PREFIXBookmarkSync_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen()
{
  if (WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen_onceToken, &__block_literal_global_13_0);
  return WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCalendarEventDetection()
{
  if (WBS_LOG_CHANNEL_PREFIXCalendarEventDetection_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCalendarEventDetection_onceToken, &__block_literal_global_15);
  return WBS_LOG_CHANNEL_PREFIXCalendarEventDetection_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCertificates()
{
  if (WBS_LOG_CHANNEL_PREFIXCertificates_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCertificates_onceToken, &__block_literal_global_17_0);
  return WBS_LOG_CHANNEL_PREFIXCertificates_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXClientAuthentication()
{
  if (WBS_LOG_CHANNEL_PREFIXClientAuthentication_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXClientAuthentication_onceToken, &__block_literal_global_19);
  return WBS_LOG_CHANNEL_PREFIXClientAuthentication_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXContinuity()
{
  if (WBS_LOG_CHANNEL_PREFIXContinuity_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXContinuity_onceToken, &__block_literal_global_23);
  return WBS_LOG_CHANNEL_PREFIXContinuity_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDownloads()
{
  if (WBS_LOG_CHANNEL_PREFIXDownloads_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDownloads_onceToken, &__block_literal_global_25);
  return WBS_LOG_CHANNEL_PREFIXDownloads_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXEventAttribution()
{
  if (WBS_LOG_CHANNEL_PREFIXEventAttribution_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXEventAttribution_onceToken, &__block_literal_global_27);
  return WBS_LOG_CHANNEL_PREFIXEventAttribution_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXExtensions_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXExtensions_onceToken, &__block_literal_global_29);
  return WBS_LOG_CHANNEL_PREFIXExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXKeychain()
{
  if (WBS_LOG_CHANNEL_PREFIXKeychain_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXKeychain_onceToken, &__block_literal_global_33_0);
  return WBS_LOG_CHANNEL_PREFIXKeychain_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill_onceToken, &__block_literal_global_37);
  return WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXOther()
{
  if (WBS_LOG_CHANNEL_PREFIXOther_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXOther_onceToken, &__block_literal_global_39);
  return WBS_LOG_CHANNEL_PREFIXOther_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswords()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswords_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswords_onceToken, &__block_literal_global_41);
  return WBS_LOG_CHANNEL_PREFIXPasswords_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordsIcons()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordsIcons_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordsIcons_onceToken, &__block_literal_global_43);
  return WBS_LOG_CHANNEL_PREFIXPasswordsIcons_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordSharing()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordSharing_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordSharing_onceToken, &__block_literal_global_45);
  return WBS_LOG_CHANNEL_PREFIXPasswordSharing_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPageLoading()
{
  if (WBS_LOG_CHANNEL_PREFIXPageLoading_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPageLoading_onceToken, &__block_literal_global_47);
  return WBS_LOG_CHANNEL_PREFIXPageLoading_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPencilInput()
{
  if (WBS_LOG_CHANNEL_PREFIXPencilInput_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPencilInput_onceToken, &__block_literal_global_49);
  return WBS_LOG_CHANNEL_PREFIXPencilInput_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrewarming()
{
  if (WBS_LOG_CHANNEL_PREFIXPrewarming_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrewarming_onceToken, &__block_literal_global_53);
  return WBS_LOG_CHANNEL_PREFIXPrewarming_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrinting()
{
  if (WBS_LOG_CHANNEL_PREFIXPrinting_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrinting_onceToken, &__block_literal_global_55_0);
  return WBS_LOG_CHANNEL_PREFIXPrinting_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXProcessDictionary()
{
  if (WBS_LOG_CHANNEL_PREFIXProcessDictionary_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXProcessDictionary_onceToken, &__block_literal_global_57);
  return WBS_LOG_CHANNEL_PREFIXProcessDictionary_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReaderExtraction()
{
  if (WBS_LOG_CHANNEL_PREFIXReaderExtraction_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReaderExtraction_onceToken, &__block_literal_global_61);
  return WBS_LOG_CHANNEL_PREFIXReaderExtraction_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReadingList()
{
  if (WBS_LOG_CHANNEL_PREFIXReadingList_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReadingList_onceToken, &__block_literal_global_63);
  return WBS_LOG_CHANNEL_PREFIXReadingList_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXRequestDesktopSite()
{
  if (WBS_LOG_CHANNEL_PREFIXRequestDesktopSite_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXRequestDesktopSite_onceToken, &__block_literal_global_65);
  return WBS_LOG_CHANNEL_PREFIXRequestDesktopSite_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSearchEngine()
{
  if (WBS_LOG_CHANNEL_PREFIXSearchEngine_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSearchEngine_onceToken, &__block_literal_global_67);
  return WBS_LOG_CHANNEL_PREFIXSearchEngine_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSVCPrivacy()
{
  if (WBS_LOG_CHANNEL_PREFIXSVCPrivacy_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSVCPrivacy_onceToken, &__block_literal_global_69);
  return WBS_LOG_CHANNEL_PREFIXSVCPrivacy_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSVCDeletion()
{
  if (WBS_LOG_CHANNEL_PREFIXSVCDeletion_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSVCDeletion_onceToken, &__block_literal_global_71);
  return WBS_LOG_CHANNEL_PREFIXSVCDeletion_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUniversalLinks()
{
  if (WBS_LOG_CHANNEL_PREFIXUniversalLinks_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUniversalLinks_onceToken, &__block_literal_global_79);
  return WBS_LOG_CHANNEL_PREFIXUniversalLinks_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserInteraction()
{
  if (WBS_LOG_CHANNEL_PREFIXUserInteraction_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserInteraction_onceToken, &__block_literal_global_83);
  return WBS_LOG_CHANNEL_PREFIXUserInteraction_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserInterface()
{
  if (WBS_LOG_CHANNEL_PREFIXUserInterface_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserInterface_onceToken, &__block_literal_global_85);
  return WBS_LOG_CHANNEL_PREFIXUserInterface_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserTrackingDetection()
{
  if (WBS_LOG_CHANNEL_PREFIXUserTrackingDetection_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserTrackingDetection_onceToken, &__block_literal_global_87);
  return WBS_LOG_CHANNEL_PREFIXUserTrackingDetection_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserMediaCapture()
{
  if (WBS_LOG_CHANNEL_PREFIXUserMediaCapture_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserMediaCapture_onceToken, &__block_literal_global_89);
  return WBS_LOG_CHANNEL_PREFIXUserMediaCapture_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXViewService()
{
  if (WBS_LOG_CHANNEL_PREFIXViewService_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXViewService_onceToken, &__block_literal_global_91);
  return WBS_LOG_CHANNEL_PREFIXViewService_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebApp()
{
  if (WBS_LOG_CHANNEL_PREFIXWebApp_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebApp_onceToken, &__block_literal_global_93);
  return WBS_LOG_CHANNEL_PREFIXWebApp_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension()
{
  if (WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken, &__block_literal_global_95);
  return WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXTranslation()
{
  if (WBS_LOG_CHANNEL_PREFIXTranslation_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTranslation_onceToken, &__block_literal_global_97);
  return WBS_LOG_CHANNEL_PREFIXTranslation_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension()
{
  if (WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_onceToken, &__block_literal_global_99);
  return WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXWebExtensions_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebExtensions_onceToken, &__block_literal_global_107_0);
  return WBS_LOG_CHANNEL_PREFIXWebExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebPush()
{
  if (WBS_LOG_CHANNEL_PREFIXWebPush_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebPush_onceToken, &__block_literal_global_109);
  return WBS_LOG_CHANNEL_PREFIXWebPush_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXManagedExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXManagedExtensions_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXManagedExtensions_onceToken, &__block_literal_global_113);
  return WBS_LOG_CHANNEL_PREFIXManagedExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXESim()
{
  if (WBS_LOG_CHANNEL_PREFIXESim_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXESim_onceToken, &__block_literal_global_115);
  return WBS_LOG_CHANNEL_PREFIXESim_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXBrowsingAssistant()
{
  if (WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_onceToken, &__block_literal_global_117);
  return WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_log;
}

void sub_1A3C5B940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __blankImage_block_invoke_0()
{
  uint64_t v0;
  void *v1;
  CGSize v2;

  objc_msgSend(MEMORY[0x1E0C92670], "tableViewIconSize");
  UIGraphicsBeginImageContextWithOptions(v2, 0, 0.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blankImage_image_0;
  blankImage_image_0 = v0;

  UIGraphicsEndImageContext();
}

void sub_1A3C643B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C660D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id redTextColorForDarkBackground(int a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolvedColorWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id greenTextColorForDarkBackground(char a1)
{
  double v1;
  double v2;
  double v3;

  if ((a1 & 1) != 0)
  {
    v1 = 0.501960784;
    v2 = 0.780392157;
    v3 = 0.509803922;
  }
  else
  {
    v1 = 0.262745098;
    v2 = 0.749019608;
    v3 = 0.345098039;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v1, v2, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL colorIsSimilarToColor(void *a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = a2;
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v9, &v8, &v7, 0)
    && objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v10, 0, 0, 0))
  {
    v4 = 0;
    if (v8 >= 0.1 && v7 >= 0.2)
    {
      v5 = vabdd_f64(v9, v10);
      v4 = 1.0 - v5 < 0.15 || v5 < 0.15;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id textColorForDarkBackground(char a1)
{
  if ((a1 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id annotationTextColorForDarkBackground(char a1)
{
  double v1;
  double v2;

  if ((a1 & 1) != 0)
  {
    v1 = 0.6;
    v2 = 1.0;
  }
  else
  {
    v1 = 0.4;
    v2 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v2, v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1A3C6AA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void dialRequestNotificationHandler(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void (**v15)(void);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "pendingRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "successNotificationName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", a3);

        if (!v12)
        {
          objc_msgSend(v10, "failureNotificationName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", a3);

          if (!v14)
            continue;
        }
        objc_msgSend(v10, "completionHandler");
        v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v15[2]();

        objc_msgSend(v4, "removeObserverForRequest:", v10);
        goto LABEL_12;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

void sub_1A3C6E180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C6EE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C6F138(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3C6F260(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3C6F64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C714AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1A3C71588(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id allowedClasses()
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void objectLoader_0(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = a1;
  allowedClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __objectLoader_block_invoke_0;
  v7[3] = &unk_1E4AC0CB0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "safari_loadObjectOfClasses:completionHandler:", v5, v7);

}

uint64_t __objectLoader_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1A3C725AC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t categoryForURL(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasTelephonyScheme") & 1) != 0
    || (objc_msgSend(v1, "isFaceTimeURL") & 1) != 0
    || (objc_msgSend(v1, "isFaceTimeAudioURL") & 1) != 0
    || (objc_msgSend(v1, "isFaceTimeMultiwayURL") & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "safari_hasScheme:", CFSTR("itms-apps")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "safari_isAppleOneURL"))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __navigationResultQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SafariServices._SFNavigationResult", v2);
  v1 = (void *)navigationResultQueue_navigationResultQueue;
  navigationResultQueue_navigationResultQueue = (uint64_t)v0;

}

void __deviceSupportedBiometryType_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D02800], "availableDevices");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    v2 = objc_msgSend(v3, "type");
    if (v2 == 2)
    {
      v1 = v3;
    }
    else
    {
      v1 = v3;
      if (v2 != 1)
        goto LABEL_8;
    }
  }
  else
  {
    v2 = 0;
  }
  deviceSupportedBiometryType_deviceSupportedBiometryType = v2;
LABEL_8:

}

void *getASCLockupContextWebBrowserSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getASCLockupContextWebBrowserSymbolLoc_ptr;
  v6 = getASCLockupContextWebBrowserSymbolLoc_ptr;
  if (!getASCLockupContextWebBrowserSymbolLoc_ptr)
  {
    v1 = (void *)AppStoreComponentsLibrary_0();
    v0 = dlsym(v1, "ASCLockupContextWebBrowser");
    v4[3] = (uint64_t)v0;
    getASCLockupContextWebBrowserSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A3C78C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AppStoreComponentsLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!AppStoreComponentsLibraryCore_frameworkLibrary_0)
    AppStoreComponentsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = AppStoreComponentsLibraryCore_frameworkLibrary_0;
  if (!AppStoreComponentsLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t _SFAutoFillInputViewLabelFont()
{
  return objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

void sub_1A3C7B108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C7B6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C7DCD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C7E1F0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3C7EDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C7F058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBWelcomeControllerClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getOBWelcomeControllerClass_softClass_1;
  v7 = getOBWelcomeControllerClass_softClass_1;
  if (!getOBWelcomeControllerClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getOBWelcomeControllerClass_block_invoke_1;
    v3[3] = &unk_1E4ABFC78;
    v3[4] = &v4;
    __getOBWelcomeControllerClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3C7F110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C7F54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getOBWelcomeControllerClass_block_invoke_1(uint64_t a1)
{
  OnBoardingKitLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("OBWelcomeController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBWelcomeControllerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBWelcomeControllerClass_block_invoke_cold_1();
    OnBoardingKitLibrary_0();
  }
}

void OnBoardingKitLibrary_0()
{
  void *v0;

  if (!OnBoardingKitLibraryCore_frameworkLibrary_1)
    OnBoardingKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!OnBoardingKitLibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getOBBoldTrayButtonClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  OnBoardingKitLibrary_0();
  result = objc_getClass("OBBoldTrayButton");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBBoldTrayButtonClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getOBBoldTrayButtonClass_block_invoke_cold_1();
    return (Class)-[WBSAnalyticsLogger(_SFAnalyticsLogger) _sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:](v3);
  }
  return result;
}

SafariServices::ArticleFinderJSController *SafariServices::ArticleFinderJSController::ArticleFinderJSController(SafariServices::ArticleFinderJSController *this, WKWebProcessPlugInFrame *a2, WKWebProcessPlugInScriptWorld *a3)
{
  WKWebProcessPlugInFrame *v5;
  WKWebProcessPlugInScriptWorld *v6;

  v5 = a2;
  v6 = a3;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_QWORD *)this = &off_1E4AC7DD8;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = v5;
  *((_QWORD *)this + 7) = v6;
  return this;
}

uint64_t SafariServices::ArticleFinderJSController::nodeAtPoint(id *this, double a2, double a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(this[6], "hitTest:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodeHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(this[6], "jsNodeForNodeHandle:inWorld:", v5, this[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "JSValueRef");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1A3C80770(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t SafariServices::ArticleFinderJSController::substituteURLForNextPageURL(SafariServices::ArticleFinderJSController *this, const OpaqueJSContext *a2, const OpaqueJSValue *const *a3)
{
  return (uint64_t)*a3;
}

void SafariServices::ArticleFinderJSController::~ArticleFinderJSController(id *this)
{

  SafariShared::JSController::~JSController((SafariShared::JSController *)this);
}

{

  SafariShared::JSController::~JSController((SafariShared::JSController *)this);
  JUMPOUT(0x1A85987FCLL);
}

void sub_1A3C8263C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3C828D4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3C82DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A3C83240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C83844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

id headerIconForUserInterfaceStyle(unint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = (void *)headerIconForUserInterfaceStyle_iconsForStyle;
  if (!headerIconForUserInterfaceStyle_iconsForStyle)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)headerIconForUserInterfaceStyle_iconsForStyle;
    headerIconForUserInterfaceStyle_iconsForStyle = v3;

    v2 = (void *)headerIconForUserInterfaceStyle_iconsForStyle;
  }
  if (a1 <= 1)
    a1 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "sf_imageNamed:", CFSTR("QRImageHeader"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithTraitCollection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_applicationIconImageForFormat:precomposed:", 5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)headerIconForUserInterfaceStyle_iconsForStyle;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v12);

  }
  v13 = v6;

  return v13;
}

__CFString *typeIdentifierForDownloadFromResponse(void *a1)
{
  const __CFString *v1;
  id v2;
  __CFString *v3;
  __CFString *PreferredIdentifierForTag;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  int v19;
  int v20;
  int IsDynamic;

  v1 = (const __CFString *)*MEMORY[0x1E0CA5A90];
  v2 = a1;
  objc_msgSend(v2, "MIMEType");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v1, v3, 0);

  objc_msgSend(v2, "suggestedFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pathExtension");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = -[__CFString length](v6, "length");
  v8 = PreferredIdentifierForTag;
  v9 = v8;
  v10 = v8;
  if (v7)
  {
    v11 = v8;
    if (-[__CFString isEqualToString:](v8, "isEqualToString:", *MEMORY[0x1E0CA5C20]))
    {
      v11 = (__CFString *)(id)*MEMORY[0x1E0CA5C88];

    }
    v12 = (const __CFString *)*MEMORY[0x1E0CA5A88];
    v13 = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v6, v11);
    v14 = (__CFString *)v13;
    if (v13 && !UTTypeIsDynamic(v13))
    {
      v10 = v14;
    }
    else
    {
      v15 = (__CFString *)*MEMORY[0x1E0CA5B20];
      v16 = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v12, v6, (CFStringRef)*MEMORY[0x1E0CA5B20]);
      if (!-[__CFString isEqualToString:](v9, "isEqualToString:", *MEMORY[0x1E0CA5CE0])
        || (v17 = UTTypeConformsTo(v16, (CFStringRef)*MEMORY[0x1E0CA5A60]), v18 = v16, !v17)
        && (v19 = UTTypeConformsTo(v16, (CFStringRef)objc_msgSend((id)*MEMORY[0x1E0CEC6B0], "identifier")),
            v18 = v16,
            !v19)
        && (v20 = UTTypeConformsTo(v16, CFSTR("com.apple.watchface")), v18 = v16, !v20))
      {
        IsDynamic = UTTypeIsDynamic(v9);
        v18 = v9;
        if (IsDynamic)
        {
          if (UTTypeIsDynamic(v16))
            v18 = v15;
          else
            v18 = v16;
        }
      }
      v10 = v18;

    }
  }

  return v10;
}

uint64_t _SFTypeIsExtractableArchive(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CA5B70];
  v9[0] = CFSTR("org.gnu.gnu-tar-archive");
  v9[1] = v1;
  v2 = *MEMORY[0x1E0CA5AF0];
  v9[2] = CFSTR("org.gnu.gnu-zip-tar-archive");
  v9[3] = v2;
  v9[4] = CFSTR("public.cpio-archive");
  v9[5] = CFSTR("public.tar-archive");
  v3 = *MEMORY[0x1E0CA5CE0];
  v9[6] = CFSTR("public.tar-bzip2-archive");
  v9[7] = v3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a1;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

uint64_t _SFDownloadingFileTypeFromUTIAndMIMEType(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    if (UTTypeConformsTo(v3, CFSTR("com.apple.watchface")))
    {
      v5 = 6;
      goto LABEL_19;
    }
    if (UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E0CA5A58])
      || UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E0CA5A60])
      || UTTypeConformsTo(v3, (CFStringRef)objc_msgSend((id)*MEMORY[0x1E0CEC6B0], "identifier")))
    {
      v5 = 3;
      goto LABEL_19;
    }
    if (UTTypeConformsTo(v3, CFSTR("com.apple.finance.order")))
    {
      v5 = 7;
      goto LABEL_19;
    }
    if (UTTypeConformsTo(v3, CFSTR("com.apple.ical.ics")))
    {
      v5 = 4;
      goto LABEL_19;
    }
    if (UTTypeConformsTo(v3, CFSTR("public.vcard")))
    {
      v5 = 5;
      goto LABEL_19;
    }
    if (!v4)
      v4 = (__CFString *)UTTypeCopyPreferredTagWithClass(v3, (CFStringRef)*MEMORY[0x1E0CA5A90]);
  }
  if (-[__CFString safari_isConfigProfileMIMEType](v4, "safari_isConfigProfileMIMEType"))
    v5 = 1;
  else
    v5 = 2;
LABEL_19:

  return v5;
}

void sub_1A3C870AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A3C87334(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A3C88F68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A3C89228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3C89740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_13(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_14(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_15_0(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_16(uint64_t a1, void *a2)
{
  return a2;
}

void sub_1A3C8B410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C8F490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C8F9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3C90948(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C909E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A3C90A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A3C90BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;

  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1A3C90CFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A3C90E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t sub_1A3C90E90()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t __getWFUserSettingsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:].cold.1(v0);
}

uint64_t ___ZL19getWebBookmarkClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL32getSafariFetcherServerProxyClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL32getSafariFetcherServerProxyClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __50___SFAccountManagerViewController_viewWillAppear___block_invoke_cold_1(v0);
}

void proceedWithClientCertificateIdentity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Challenge rejected due to empty authentication chain", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void newAlertToHandleClientSideCertificateErrorCode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "The one identity installed was rejected by the server", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

uint64_t __getCertificateViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke_cold_1(v0);
}

uint64_t __getCRCameraReaderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2_cold_1(v0);
}

uint64_t __getLPLinkMetadataClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLPFileMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getLPFileMetadataClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[_SFExternalPasswordCredentialViewController _autoFillWithExternalCredential:pageID:frameID:].cold.1(v0);
}

uint64_t __getTPDialPromptAlertClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __70___SFAppPasswordSavingViewController__connectToServiceWithCompletion___block_invoke_cold_1(v0);
}

uint64_t ___ZL36getCSSearchableItemAttributeSetClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2_cold_1(v0);
}

uint64_t __getOBWelcomeControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __57__SFSharedAccountsGroupViewController__saveButtonPressed__block_invoke_2_cold_1(v0);
}

uint64_t ___ZL18getUIKeyEventClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL18getBEKeyEntryClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL18getBEKeyEntryClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SFSharedAccountsGroupMemberDetailViewController _updatePermissionOnExistingGroupForGroupMemberToPermissionLevel:].cold.1(v0);
}

uint64_t __getOBBoldTrayButtonClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getOBTrayButtonClass_block_invoke_cold_1(v0);
}

uint64_t __getOBTrayButtonClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SFWebAppDataProvider updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:].cold.1(v0);
}

void tryOpeningInDefaultApp_cold_1(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a1;
  objc_msgSend(a2, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v8, v9, "Failed to lookup applications available for opening %{sensitive}@: %{public}@", v10, v11, v12, v13, 3u);

  OUTLINED_FUNCTION_0_1();
}

void tryOpeningInDefaultApp_cold_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v6, v7, "Failed to lookup type identifier for %{sensitive}@: %{public}@", v8, v9, v10, v11, 3u);

  OUTLINED_FUNCTION_0_1();
}

uint64_t ___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[_SFManagedFeatureObserver isUserEnrolledInBiometricAuthentication].cold.1(v0);
}

void __getCNContactPickerViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  v0 = (void *)abort_report_np();
  -[_SFSearchEngineController _loadSystemPropertiesForSearchEngine:].cold.1(v0, v1);
}

uint64_t __getEKEventStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getEKICSPreviewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getEKICSPreviewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getEKEventViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getEKEventViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_cold_1(v0);
}

uint64_t __getSearchUIClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return -[_SFReaderExtractor _finishWithContent:error:].cold.1(v0, v1, v2);
}

uint64_t __getBCSQRCodeParserClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __131__SFPasswordSavingServiceViewController_credentialsSubmittedForWebsiteURL_user_password_passwordIsAutoGenerated_completionHandler___block_invoke_cold_1(v0);
}

uint64_t __getMFMailComposeViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_2_cold_1(v0);
}

uint64_t ___ZL31getSLComposeViewControllerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL14getPKPassClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL14getPKPassClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL19getFKSaveOrderClassv_block_invoke_cold_1(v0);
}

void ___ZL19getFKSaveOrderClassv_block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)abort_report_np();
  -[_SFReloadOptionsController didUpdateRequestDesktopSiteDefaultValue:].cold.1(v0, v1);
}

uint64_t ASCLockupViewSizeGetEstimatedSize()
{
  return MEMORY[0x1E0CF9B48]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextDrawImageFromRect()
{
  return MEMORY[0x1E0C9C178]();
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1E0CFA2A0]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1E0CA79F8]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

BOOL CTFontDescriptorMatchFontDescriptorsWithProgressHandler(CFArrayRef descriptors, CFSetRef mandatoryAttributes, CTFontDescriptorProgressHandler progressBlock)
{
  return MEMORY[0x1E0CA7B60](descriptors, mandatoryAttributes, progressBlock);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  CGFloat result;

  MEMORY[0x1E0CA7EE8](line, charIndex, secondaryOffset);
  return result;
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x1E0CAA948]();
}

uint64_t FPUpdateLastUsedDate()
{
  return MEMORY[0x1E0CAAB00]();
}

uint64_t GSCurrentEventTimestamp()
{
  return MEMORY[0x1E0D27AD0]();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1E0D27B50]();
}

JSGlobalContextRef JSContextGetGlobalContext(JSContextRef ctx)
{
  return (JSGlobalContextRef)MEMORY[0x1E0CBDDD8](ctx);
}

JSObjectRef JSContextGetGlobalObject(JSContextRef ctx)
{
  return (JSObjectRef)MEMORY[0x1E0CBDDE0](ctx);
}

JSContextGroupRef JSContextGetGroup(JSContextRef ctx)
{
  return (JSContextGroupRef)MEMORY[0x1E0CBDDE8](ctx);
}

uint64_t JSRemoteInspectorStart()
{
  return MEMORY[0x1E0CBDF88]();
}

uint64_t JSScriptCreateReferencingImmortalASCIIText()
{
  return MEMORY[0x1E0CBDF90]();
}

uint64_t JSScriptEvaluate()
{
  return MEMORY[0x1E0CBDF98]();
}

BOOL JSValueIsObject(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x1E0CBE038](ctx, value);
}

BOOL JSValueIsString(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x1E0CBE048](ctx, value);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

uint64_t PKPeerPaymentGetTopUpSensitiveURL()
{
  return MEMORY[0x1E0D6B178]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE40]();
}

uint64_t PSShouldInsetListView()
{
  return MEMORY[0x1E0D808F8]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x1E0D80998]();
}

uint64_t SFAccessibilityTitleForBarItem()
{
  return MEMORY[0x1E0D4EFB0]();
}

uint64_t SFBarBackgroundAlphaForSquishTransformFactor()
{
  return MEMORY[0x1E0D4EFC0]();
}

uint64_t SFBarContentAlphaForSquishTransformFactor()
{
  return MEMORY[0x1E0D4EFC8]();
}

uint64_t SFChromeVisibilityForScrollDistance()
{
  return MEMORY[0x1E0D4F098]();
}

uint64_t SFCreateAppSuggestionBannerFromMetaTagContent()
{
  return MEMORY[0x1E0D4F0B0]();
}

uint64_t SFCreditCardIconForType()
{
  return MEMORY[0x1E0D4F0B8]();
}

uint64_t SFDataOwnerForWebViewInteraction()
{
  return MEMORY[0x1E0D4F0C0]();
}

uint64_t SFDefaultBrowserSelectionStateKey()
{
  return MEMORY[0x1E0D4F0D8]();
}

uint64_t SFDefaultWebExtensionsPreferenceValues()
{
  return MEMORY[0x1E0D4F0E0]();
}

uint64_t SFDeferrableUpdateViewCanUpdateContents()
{
  return MEMORY[0x1E0D4F0E8]();
}

uint64_t SFDeferrableUpdateViewDidMoveToWindow()
{
  return MEMORY[0x1E0D4F0F0]();
}

uint64_t SFDeferrableUpdateViewShouldAttemptToUpdateContents()
{
  return MEMORY[0x1E0D4F0F8]();
}

uint64_t SFFocusGroupIdentifierForOwner()
{
  return MEMORY[0x1E0D4F158]();
}

uint64_t SFIsMenuActionConfigurable()
{
  return MEMORY[0x1E0D4F160]();
}

uint64_t SFLargeCreditCardIconForType()
{
  return MEMORY[0x1E0D4F168]();
}

uint64_t SFMorePageMenuSections()
{
  return MEMORY[0x1E0D4F1A8]();
}

uint64_t SFSectionToConfigurableMenuActions()
{
  return MEMORY[0x1E0D4F1D8]();
}

uint64_t SFShouldHandleSelectionForPresses()
{
  return MEMORY[0x1E0D4F1E0]();
}

uint64_t SFStringFromCredentialIdentityType()
{
  return MEMORY[0x1E0D8A098]();
}

uint64_t SFSystemImageNameForBarItem()
{
  return MEMORY[0x1E0D4F278]();
}

uint64_t SFSystemImageNameForTogglingMediaStateIcon()
{
  return MEMORY[0x1E0D4F288]();
}

uint64_t SFTintImage()
{
  return MEMORY[0x1E0D4F2F0]();
}

uint64_t SFTitleForTogglingMediaStateIcon()
{
  return MEMORY[0x1E0D4F2F8]();
}

uint64_t SFUnconfigurableMenuAcitons()
{
  return MEMORY[0x1E0D4F308]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1E0CD5FF8](certificate);
}

uint64_t SecCertificateIsValid()
{
  return MEMORY[0x1E0CD6068]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1E0CD6288]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6520](server, hostname);
}

uint64_t SecTrustCopyInfo()
{
  return MEMORY[0x1E0CD6668]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1E0CD66A0]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1E0CD66D8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1E0CD66E0](trust);
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x1E0CD6708]();
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1E0DC44D8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1E0DC49B8]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1E0DC49C0]();
}

uint64_t UIEdgeInsetsSubtract()
{
  return MEMORY[0x1E0DC49E0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIKeyboardGetDefaultInputModesForLanguage()
{
  return MEMORY[0x1E0DC4EA8]();
}

uint64_t UIKeyboardGetKeyboardKeyImage()
{
  return MEMORY[0x1E0DC4EC0]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0DC52B8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UIStatusBarStyleFromUIWebClipStatusBarStyle()
{
  return MEMORY[0x1E0DC53B8]();
}

uint64_t UIWebClipStatusBarStyleForMetaTagContent()
{
  return MEMORY[0x1E0DC5600]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1E0CA5970](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5980](inTagClass, inTag, inConformingToUTI);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x1E0CA5988](inUTI1, inUTI2);
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  return MEMORY[0x1E0CA5998](inUTI);
}

uint64_t WBSAXShouldShowAnimatedImageControls()
{
  return MEMORY[0x1E0D8AE30]();
}

uint64_t WBSApplicationIdentifierFromAuditToken()
{
  return MEMORY[0x1E0D8AE48]();
}

uint64_t WBSAuditTokenHasEntitlement()
{
  return MEMORY[0x1E0D8AE50]();
}

uint64_t WBSAuditTokenValueArrayForEntitlement()
{
  return MEMORY[0x1E0D8AE58]();
}

uint64_t WBSAuthenticationPolicyForPasswordManager()
{
  return MEMORY[0x1E0D8AE60]();
}

uint64_t WBSBrowsingAssistantContentOptionsMostProminentRemoteOption()
{
  return MEMORY[0x1E0D8AEC0]();
}

uint64_t WBSBrowsingAssistantContentTypeAvailabilityLabel()
{
  return MEMORY[0x1E0D8AEC8]();
}

uint64_t WBSCreditCardTypeFromNumber()
{
  return MEMORY[0x1E0D8AF80]();
}

uint64_t WBSCreditCardTypeLocalizedName()
{
  return MEMORY[0x1E0D8AF88]();
}

uint64_t WBSDispatchAsyncAndReleaseOnMainQueue()
{
  return MEMORY[0x1E0D8AFF0]();
}

uint64_t WBSDisplayTextForCreditCardNumber()
{
  return MEMORY[0x1E0D8AFF8]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x1E0D8B110]();
}

uint64_t WBSLastDigitsOfCreditCardNumber()
{
  return MEMORY[0x1E0D8B120]();
}

uint64_t WBSLoadBuiltInContentBlockersWithStore()
{
  return MEMORY[0x1E0D8B140]();
}

uint64_t WBSLogWithDifferentialPrivacy()
{
  return MEMORY[0x1E0D8B158]();
}

uint64_t WBSMakeAccessibilityIdentifier()
{
  return MEMORY[0x1E0D8B160]();
}

uint64_t WBSOngoingSharingInvitationFallbackURL()
{
  return MEMORY[0x1E0D8B1A8]();
}

uint64_t WBSReaderThemeColor()
{
  return MEMORY[0x1E0D8B338]();
}

uint64_t WBSReaderThemeLocalizedName()
{
  return MEMORY[0x1E0D8B348]();
}

uint64_t WBSRespondWithRandomDelay()
{
  return MEMORY[0x1E0D8B388]();
}

uint64_t WBSSearchProviderBaiduTrackingCodeTemplateParameterValues()
{
  return MEMORY[0x1E0D8B4E8]();
}

uint64_t WBSSearchProviderDefinitions()
{
  return MEMORY[0x1E0D8B518]();
}

uint64_t WBSSecIdentityCopySSLClientAuthenticationChain()
{
  return MEMORY[0x1E0D8B588]();
}

uint64_t WBSTabOrderManagerDefaultPreferenceValues()
{
  return MEMORY[0x1E0D8B690]();
}

uint64_t WBSTimeUntilNextWeeklyAnalyticsReportForKey()
{
  return MEMORY[0x1E0D8B6A0]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecision()
{
  return MEMORY[0x1E0D8B6F0]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecisionCamera()
{
  return MEMORY[0x1E0D8B6F8]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecisionMicrophone()
{
  return MEMORY[0x1E0D8B700]();
}

uint64_t WKArrayGetItemAtIndex()
{
  return MEMORY[0x1E0CEF740]();
}

uint64_t WKArrayGetSize()
{
  return MEMORY[0x1E0CEF748]();
}

uint64_t WKBundleFrameCreateFrameHandle()
{
  return MEMORY[0x1E0CEF750]();
}

uint64_t WKBundleHitTestResultCopyAbsoluteLinkURL()
{
  return MEMORY[0x1E0CEF758]();
}

uint64_t WKBundleHitTestResultGetFrame()
{
  return MEMORY[0x1E0CEF760]();
}

uint64_t WKBundleHitTestResultGetTargetFrame()
{
  return MEMORY[0x1E0CEF768]();
}

uint64_t WKBundlePageIsUsingEphemeralSession()
{
  return MEMORY[0x1E0CEF770]();
}

uint64_t WKBundlePageSetUIClient()
{
  return MEMORY[0x1E0CEF778]();
}

uint64_t WKDictionarySetItem()
{
  return MEMORY[0x1E0CEF780]();
}

uint64_t WKGetTypeID()
{
  return MEMORY[0x1E0CEF790]();
}

uint64_t WKMutableDictionaryCreate()
{
  return MEMORY[0x1E0CEF798]();
}

uint64_t WKStringCopyCFString()
{
  return MEMORY[0x1E0CEF7A0]();
}

uint64_t WKStringCreateWithUTF8CString()
{
  return MEMORY[0x1E0CEF7A8]();
}

uint64_t WKStringGetTypeID()
{
  return MEMORY[0x1E0CEF7B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _SFAccessibilityIdentifierForBarItem()
{
  return MEMORY[0x1E0D4F388]();
}

uint64_t _SFApplicationNameForDesktopUserAgent()
{
  return MEMORY[0x1E0D4F3A0]();
}

uint64_t _SFApplicationNameForUserAgent()
{
  return MEMORY[0x1E0D4F3A8]();
}

uint64_t _SFBackdropGroupNameForOwner()
{
  return MEMORY[0x1E0D4F3C8]();
}

uint64_t _SFBarItemEnumerateCases()
{
  return MEMORY[0x1E0D4F3D0]();
}

uint64_t _SFCGRectOfSizeAlignedWithinRect()
{
  return MEMORY[0x1E0D4F3F0]();
}

uint64_t _SFCeilingFloatToPixels()
{
  return MEMORY[0x1E0D4F3F8]();
}

uint64_t _SFClamp()
{
  return MEMORY[0x1E0D4F400]();
}

uint64_t _SFContentBlockerStoreURL()
{
  return MEMORY[0x1E0D4F418]();
}

uint64_t _SFContextInfoWithComment()
{
  return MEMORY[0x1E0D4F420]();
}

uint64_t _SFCustomUserAgentStringIfNeeded()
{
  return MEMORY[0x1E0D4F428]();
}

uint64_t _SFDeviceAlertStyle()
{
  return MEMORY[0x1E0D4F468]();
}

uint64_t _SFDeviceIsPad()
{
  return MEMORY[0x1E0D4F470]();
}

uint64_t _SFDeviceStatusBarHasNonTransparentBackground()
{
  return MEMORY[0x1E0D4F478]();
}

uint64_t _SFDeviceSupportsDesktopSitesByDefault()
{
  return MEMORY[0x1E0D4F480]();
}

uint64_t _SFEqualWithEpsilon()
{
  return MEMORY[0x1E0D4F4C8]();
}

uint64_t _SFFloorFloatToPixels()
{
  return MEMORY[0x1E0D4F4D8]();
}

uint64_t _SFGreaterThanOrEqualWithEpsilon()
{
  return MEMORY[0x1E0D4F4E0]();
}

uint64_t _SFIPhoneSafariUserAgentString()
{
  return MEMORY[0x1E0D4F4E8]();
}

uint64_t _SFImageForMediaStateIcon()
{
  return MEMORY[0x1E0D4F4F0]();
}

uint64_t _SFInsetIsInvalid()
{
  return MEMORY[0x1E0D4F500]();
}

uint64_t _SFInterpolate()
{
  return MEMORY[0x1E0D4F508]();
}

uint64_t _SFIsDarkTintStyle()
{
  return MEMORY[0x1E0D4F518]();
}

uint64_t _SFIsPrivateTintStyle()
{
  return MEMORY[0x1E0D4F520]();
}

uint64_t _SFMacSafariUserAgentString()
{
  return MEMORY[0x1E0D4F550]();
}

uint64_t _SFMediaStateIconIsMuted()
{
  return MEMORY[0x1E0D4F588]();
}

uint64_t _SFMediaStateIconMutedVariant()
{
  return MEMORY[0x1E0D4F590]();
}

uint64_t _SFOnePixel()
{
  return MEMORY[0x1E0D4F5A0]();
}

uint64_t _SFPopoverSourceInfoForViewController()
{
  return MEMORY[0x1E0D4F5B8]();
}

uint64_t _SFPopoverSourceInfoUnwrap()
{
  return MEMORY[0x1E0D4F5C0]();
}

uint64_t _SFRoundEdgeInsetsToPixels()
{
  return MEMORY[0x1E0D4F5E8]();
}

uint64_t _SFRoundFloatToPixels()
{
  return MEMORY[0x1E0D4F5F0]();
}

uint64_t _SFRoundPointToPixels()
{
  return MEMORY[0x1E0D4F5F8]();
}

uint64_t _SFRoundRectToPixels()
{
  return MEMORY[0x1E0D4F600]();
}

uint64_t _SFSFAppContainerURL()
{
  return MEMORY[0x1E0D4F608]();
}

uint64_t _SFSafariContainerPath()
{
  return MEMORY[0x1E0D4F610]();
}

uint64_t _SFSafariContainerURL()
{
  return MEMORY[0x1E0D4F618]();
}

uint64_t _SFSafariIconLinkImage()
{
  return MEMORY[0x1E0D4F630]();
}

uint64_t _SFSafariTestContentDirectoryPath()
{
  return MEMORY[0x1E0D4F640]();
}

uint64_t _SFScreenScale()
{
  return MEMORY[0x1E0D4F650]();
}

uint64_t _SFSizeClassForWidth()
{
  return MEMORY[0x1E0D4F668]();
}

uint64_t _SFToolbarContentSizeCategoryForPreferredCategory()
{
  return MEMORY[0x1E0D4F678]();
}

uint64_t _SFWidthIsCompactSizeClass()
{
  return MEMORY[0x1E0D4F6A8]();
}

uint64_t _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection()
{
  return MEMORY[0x1E0DC56C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x1E0D8B798]();
}

uint64_t SafariShared::JSUtilities::globalJSObjectByName(SafariShared::JSUtilities *this, const OpaqueJSContext *a2, const char *a3)
{
  return MEMORY[0x1E0D8B7A0](this, a2, a3);
}

uint64_t SafariShared::JSUtilities::translateJSValueToNS(SafariShared::JSUtilities *this, const OpaqueJSContext *a2, const OpaqueJSValue *a3)
{
  return MEMORY[0x1E0D8B7A8](this, a2, a3);
}

uint64_t SafariShared::JSUtilities::callJSMethodWithArguments(SafariShared::JSUtilities *this, const OpaqueJSContext *a2, OpaqueJSValue *a3, const char *a4, const OpaqueJSValue *const *a5)
{
  return MEMORY[0x1E0D8B7B0](this, a2, a3, a4, a5);
}

uint64_t SafariShared::JSController::scriptObjectReady(SafariShared::JSController *this, const OpaqueJSContext *a2)
{
  return MEMORY[0x1E0D8B7B8](this, a2);
}

uint64_t SafariShared::JSController::addScriptObjectToGlobalObject(SafariShared::JSController *this, const OpaqueJSContext *a2)
{
  return MEMORY[0x1E0D8B7C0](this, a2);
}

void SafariShared::JSController::~JSController(SafariShared::JSController *this)
{
  MEMORY[0x1E0D8B7C8](this);
}

uint64_t SafariShared::ReaderJSController::loadNewArticle(SafariShared::ReaderJSController *this)
{
  return MEMORY[0x1E0D8B7D0](this);
}

uint64_t SafariShared::ReaderJSController::setArticleLocale(SafariShared::ReaderJSController *this, NSString *a2)
{
  return MEMORY[0x1E0D8B7D8](this, a2);
}

uint64_t SafariShared::ReaderJSController::setConfiguration(SafariShared::ReaderJSController *this, NSDictionary *a2)
{
  return MEMORY[0x1E0D8B7E0](this, a2);
}

uint64_t SafariShared::ReaderJSController::setArticleSummary()
{
  return MEMORY[0x1E0D8B7E8]();
}

uint64_t SafariShared::ReaderJSController::setReaderIsActive(SafariShared::ReaderJSController *this)
{
  return MEMORY[0x1E0D8B7F0](this);
}

uint64_t SafariShared::ReaderJSController::evaluateLocalizedStringsScript(SafariShared::ReaderJSController *this, const OpaqueJSContext *a2)
{
  return MEMORY[0x1E0D8B7F8](this, a2);
}

uint64_t SafariShared::ReaderJSController::evaluateSharedUINormalWorldScript(SafariShared::ReaderJSController *this, const OpaqueJSContext *a2)
{
  return MEMORY[0x1E0D8B800](this, a2);
}

uint64_t SafariShared::ReaderJSController::setOnDeviceSummaryButtonWithTitle(SafariShared::ReaderJSController *this, NSString *a2)
{
  return MEMORY[0x1E0D8B808](this, a2);
}

uint64_t SafariShared::ReaderJSController::updateSummaryTextAddingSummarizedChunk(SafariShared::ReaderJSController *this, NSString *a2)
{
  return MEMORY[0x1E0D8B810](this, a2);
}

uint64_t SafariShared::ArticleFinderJSController::articleContent(SafariShared::ArticleFinderJSController *this)
{
  return MEMORY[0x1E0D8B818](this);
}

uint64_t SafariShared::ArticleFinderJSController::collectReadingListItemInformation(SafariShared::ArticleFinderJSController *this)
{
  return MEMORY[0x1E0D8B820](this);
}

uint64_t SafariShared::ArticleFinderJSController::detectAvailabilityForUIProcessDrivenCheck(SafariShared::ArticleFinderJSController *this)
{
  return MEMORY[0x1E0D8B828](this);
}

uint64_t SafariShared::TranslatedFileURLProtocol::registerProtocol()
{
  return MEMORY[0x1E0D8B830]();
}

uint64_t SafariShared::ReaderAvailabilityController::didFinishLoad(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B838](this);
}

uint64_t SafariShared::ReaderAvailabilityController::clearAvailability(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B840](this);
}

uint64_t SafariShared::ReaderAvailabilityController::configureProcessPool(SafariShared::ReaderAvailabilityController *this, WKProcessPool *a2)
{
  return MEMORY[0x1E0D8B848](this, a2);
}

uint64_t SafariShared::ReaderAvailabilityController::prepareArticleFinder(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B850](this);
}

uint64_t SafariShared::ReaderAvailabilityController::didFinishDocumentLoad(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B858](this);
}

uint64_t SafariShared::ReaderAvailabilityController::originalArticleFinder(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B860](this);
}

uint64_t SafariShared::ReaderAvailabilityController::prepareToTransitionToReader(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B868](this);
}

uint64_t SafariShared::ReaderAvailabilityController::detectAvailabilityAfterDelay()
{
  return MEMORY[0x1E0D8B870]();
}

uint64_t SafariShared::ReaderAvailabilityController::readerHasBeenActivatedRecently(SafariShared::ReaderAvailabilityController *this, NSDate *a2)
{
  return MEMORY[0x1E0D8B878](this, a2);
}

uint64_t SafariShared::ReaderAvailabilityController::setCanRunAvailabilityDetection(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B880](this);
}

uint64_t SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(SafariShared::ReaderAvailabilityController *this, WKProcessPool *a2)
{
  return MEMORY[0x1E0D8B888](this, a2);
}

uint64_t SafariShared::ReaderAvailabilityController::detectAvailabilityAfterSameDocumentNavigation(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B890](this);
}

uint64_t SafariShared::ReaderAvailabilityController::ReaderAvailabilityController(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B898](this);
}

void SafariShared::ReaderAvailabilityController::~ReaderAvailabilityController(SafariShared::ReaderAvailabilityController *this)
{
  MEMORY[0x1E0D8B8A0](this);
}

uint64_t SafariShared::ReaderJSController::reloadArticle(SafariShared::ReaderJSController *this)
{
  return MEMORY[0x1E0D8B8B0](this);
}

uint64_t SafariShared::ReaderAvailabilityController::originalArticleFinderJSController(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1E0D8B8B8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete()
{
  return off_1E4ABF328();
}

uint64_t operator new()
{
  return off_1E4ABF330();
}

uint64_t __UIApplicationLinkedOnOrAfter()
{
  return MEMORY[0x1E0DC5B30]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
}

uint64_t defaultTranslationPreferenceValues()
{
  return MEMORY[0x1E0D8B8D0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x1E0C83150]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1E0C85398](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t showInternalTranslationActions()
{
  return MEMORY[0x1E0D8B8E0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

