@implementation Initialize

void __Initialize_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  char v5;

  objc_msgSend(MEMORY[0x1E0D22400], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __Initialize_block_invoke_3;
  v4[3] = &__block_descriptor_33_e22_v16__0__NSDictionary_8l;
  v5 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v2, "checkin:reply:", v3, v4);

}

void __Initialize_block_invoke_3(uint64_t a1, void *a2)
{
  int v2;
  id v3;
  __SecTask *v4;
  __SecTask *v5;
  CFTypeRef v6;
  const void *v7;
  CFTypeID v8;
  int v9;
  void *v10;
  void (*v11)(void);
  id v12;
  CFRange v13;

  v2 = *(unsigned __int8 *)(a1 + 32);
  v3 = a2;
  GSFontSetupForUserInstalledFontsCore(v3, v2, 1);
  objc_msgSend(v3, "objectForKey:", CFSTR("fontsInfo"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
    gAllowUserFonts = 1;
  else
    gHideProfileFonts = 1;
  dispatch_group_leave((dispatch_group_t)gUserFontsInitSemaphore);
  v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (!v4)
    goto LABEL_13;
  v5 = v4;
  v6 = SecTaskCopyValueForEntitlement(v4, CFSTR("com.apple.developer.user-fonts"), 0);
  if (!v6)
  {
LABEL_12:
    CFRelease(v5);
    goto LABEL_13;
  }
  v7 = v6;
  v8 = CFGetTypeID(v6);
  if (v8 != CFArrayGetTypeID())
  {
    CFRelease(v7);
    goto LABEL_12;
  }
  v13.length = CFArrayGetCount((CFArrayRef)v7);
  v13.location = 0;
  v9 = CFArrayContainsValue((CFArrayRef)v7, v13, CFSTR("system-installation"));
  CFRelease(v7);
  CFRelease(v5);
  if (v9)
  {
    v10 = dlopen("/System/Library/PrivateFrameworks/FontServices.framework/FontServices", 1);
    if (v10)
    {
      v11 = (void (*)(void))dlsym(v10, "FSFontProviderUpdateApplicationInfo");
      if (v11)
        v11();
    }
  }
LABEL_13:

}

void __Initialize_block_invoke(uint64_t a1)
{
  dispatch_group_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFAllocator *v10;
  const CFDictionaryKeyCallBacks *v11;
  const CFDictionaryValueCallBacks *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  __CFBundle *MainBundle;
  __CFBundle *v18;
  const __CFDictionary *InfoDictionary;
  const __CFDictionary *v20;
  const __CFBoolean *Value;
  const __CFBoolean *v22;
  CFTypeID v23;
  char v24;
  BOOL v25;
  NSObject *v26;
  int v27;
  const __CFDictionary *v28;
  const __CFDictionary *v29;
  char v30;
  const __CFArray *v31;
  const __CFArray *v32;
  CFTypeID v33;
  CFURLRef v34;
  const __CFURL *v35;
  CFIndex Count;
  CFIndex v37;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFString *v40;
  CFTypeID v41;
  const __CFURL *v42;
  const __CFURL *v43;
  const __CFString *Identifier;
  const __CFURL *v45;
  const __CFURL *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  int v52;
  const __CFDictionary *v53;
  const __CFDictionary *v54;
  NSObject *v55;
  CFMutableDictionaryRef Mutable;
  __CFNotificationCenter *LocalCenter;
  dispatch_source_t v59;
  void *v60;
  NSObject *v61;
  const char *v62;
  __int128 *v63;
  __int128 *v64;
  __int128 *v65;
  __int128 *v66;
  __int128 *v67;
  uint64_t v68;
  _QWORD block[4];
  NSObject *v70;
  char v71;
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  __int128 v76;
  int v77;
  __int128 v78;
  int v79;
  __int128 v80;
  int v81;
  __int128 v82;
  int v83;
  __int128 v84;
  int v85;
  __int128 v86;
  int v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  Initialize_curThread = (uint64_t)pthread_self();
  v2 = dispatch_group_create();
  v3 = (void *)gUserFontsInitSemaphore;
  gUserFontsInitSemaphore = (uint64_t)v2;

  GSFontCacheGetData();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)gGSFontCache;
  gGSFontCache = v4;

  GSFontCacheGetData();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)gCTFontInfo;
  gCTFontInfo = v6;

  objc_msgSend((id)gGSFontCache, "objectForKey:", CFSTR("CGCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gGSFontCache, "objectForKey:", CFSTR("__PSToFamilyNamePublic"));
  __PSToFamilyNamePublic = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gCTFontInfo, "objectForKey:", CFSTR("Families"));
  __SystemFontFamilies = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gGSFontCache, "objectForKey:", CFSTR("__HiddenFonts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __HiddenFonts = (uint64_t)CreateCFMutableSetWithCFStringArray(v9);

  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v12 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  __AddedFontFamilies = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  __UserRegisteredFonts = (uint64_t)CFDictionaryCreateMutable(v10, 0, v11, v12);
  CGFontDBGetLocal();
  CGFontDBAddFontsFromPlist();
  objc_msgSend((id)gGSFontCache, "objectForKey:", CFSTR("__PSToFileName"));
  __PSToFileName = objc_claimAutoreleasedReturnValue();
  v87 = -1403227947;
  v86 = xmmword_19EFB9258;
  v85 = 729118884;
  v84 = xmmword_19EFB926C;
  v83 = 1046806126;
  v82 = xmmword_19EFB9280;
  v81 = -188760945;
  v80 = xmmword_19EFB9294;
  v79 = -489993439;
  v78 = xmmword_19EFB92A8;
  v76 = xmmword_19EFB92BC;
  v77 = 886875686;
  v67 = &v76;
  v68 = 0;
  v65 = &v80;
  v66 = &v78;
  v63 = &v84;
  v64 = &v82;
  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    AddToCGFontDB((void *)__PSToFileName);
  }
  else
  {
    objc_msgSend((id)gGSFontCache, "objectForKey:", CFSTR("__PSToFileNameHighRes"), &v84, &v82, &v80, &v78, &v76, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppleColorEmoji"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease((CFTypeRef)__PSToFileName);
      v16 = v14;
      __PSToFileName = (uint64_t)v16;
    }
    else
    {
      v16 = (id)__PSToFileName;
      v15 = CFSTR("/System/Library/Fonts/CoreAddition/AppleColorEmoji-160px.ttc");
    }
    AddToCGFontDB(v16);
    v74[0] = CFSTR("Apple Color Emoji");
    v74[1] = CFSTR(".Apple Color Emoji UI");
    v75[0] = v15;
    v75[1] = v15;
    AddToCGFontDB((void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2));
    if (!v14)
    {
      v72[0] = CFSTR("AppleColorEmoji");
      v72[1] = CFSTR(".AppleColorEmojiUI");
      v73[0] = v15;
      v73[1] = v15;
      AddToCGFontDB((void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2));
      if (MakeFontCacheDictionariesMutable_onceToken != -1)
        dispatch_once(&MakeFontCacheDictionariesMutable_onceToken, &__block_literal_global_77);
      CFDictionarySetValue((CFMutableDictionaryRef)__PSToFileName, CFSTR("AppleColorEmoji"), v15);
      CFDictionarySetValue((CFMutableDictionaryRef)__PSToFileName, CFSTR(".AppleColorEmojiUI"), v15);
    }

  }
  MainBundle = CFBundleGetMainBundle();
  v18 = MainBundle;
  if (!MainBundle)
  {
    v20 = 0;
    goto LABEL_17;
  }
  InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
  v20 = InfoDictionary;
  if (!InfoDictionary)
  {
LABEL_17:
    v25 = 0;
    v24 = 1;
    goto LABEL_18;
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue(InfoDictionary, CFSTR("CTIgnoreUserFonts"));
  if (!Value || (v22 = Value, v23 = CFGetTypeID(Value), v23 != CFBooleanGetTypeID()))
  {
    Identifier = CFBundleGetIdentifier(v18);
    if (Identifier && CFStringCompare(Identifier, CFSTR("com.apple.Preferences"), 0) == kCFCompareEqualTo
      || (v45 = CFBundleCopyBundleURL(v18)) == 0)
    {
      v24 = 0;
      v25 = 0;
      goto LABEL_18;
    }
    v46 = v45;
    v47 = CFURLCopyFileSystemPath(v45, kCFURLPOSIXPathStyle);
    if (!v47)
    {
      v25 = 0;
LABEL_71:
      CFRelease(v46);
      v24 = 0;
      goto LABEL_18;
    }
    v48 = v47;
    if (CFStringHasPrefix(v47, CFSTR("/System/Library/CoreServices/"))
      || CFStringHasPrefix(v48, CFSTR("/Applications/")))
    {
      v49 = (const __CFString *)CFDictionaryGetValue(v20, (const void *)*MEMORY[0x1E0C9AAE0]);
      if (v49)
      {
        v25 = CFStringCompare(v49, CFSTR("APPL"), 0) == kCFCompareEqualTo;
LABEL_70:
        CFRelease(v48);
        goto LABEL_71;
      }
    }
    else if (CFStringCompare(v48, CFSTR("/usr/libexec"), 0) == kCFCompareEqualTo)
    {
      v62 = *(const char **)_CFGetProgname();
      if (!v62 || strcmp(v62, "profiled"))
      {
        NSLog(CFSTR("GSFont IgnoreUserFonts for /usr/libexec/"), v63, v64, v65, v66, v67, v68);
        v25 = 1;
        goto LABEL_70;
      }
    }
    v25 = 0;
    goto LABEL_70;
  }
  v24 = 0;
  v25 = CFBooleanGetValue(v22) != 0;
LABEL_18:
  if (dyld_program_sdk_at_least())
    v26 = 0;
  else
    v26 = &unk_1E4256E10;
  if (v25)
    goto LABEL_25;
  v27 = *(unsigned __int8 *)(a1 + 32);
  v28 = (const __CFDictionary *)CopyAddedFontCache(1);
  if (v28)
  {
    v29 = v28;
    RegisterFontsWithFontsInfoDictionary(v28, v27);
    CFRelease(v29);
  }
  if ((os_variant_has_factory_content() & 1) != 0)
    goto LABEL_25;
  if (v18)
  {
    v50 = CFBundleGetIdentifier(v18);
    if (!v50)
      goto LABEL_25;
    v51 = v50;
    if (CFStringHasPrefix(v50, CFSTR("com.apple.FontServices.UserFont")))
    {
      if (CFStringCompare(v51, CFSTR("com.apple.FontServices.UserFontServices"), 0))
        goto LABEL_25;
      v52 = *(unsigned __int8 *)(a1 + 32);
      v53 = (const __CFDictionary *)CopyAddedFontCache(0);
      if (v53)
      {
        v54 = v53;
        RegisterFontsWithFontsInfoDictionary(v53, v52);
        CFRelease(v54);
      }
      dispatch_get_global_queue(0, 0);
      v55 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v55, &__block_literal_global_141);
    }
    else
    {
      if ((dyld_program_sdk_at_least() & 1) == 0 && CFStringHasPrefix(v51, CFSTR("com.adobe.")))
        gHidePingFang = 1;
      dispatch_group_enter((dispatch_group_t)gUserFontsInitSemaphore);
      dispatch_get_global_queue(0, 0);
      v61 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __Initialize_block_invoke_2;
      block[3] = &unk_1E4255E38;
      v70 = v26;
      v71 = *(_BYTE *)(a1 + 32);
      dispatch_async(v61, block);

      v55 = v70;
    }

LABEL_25:
    if (v18)
      v30 = v24;
    else
      v30 = 1;
    if ((v30 & 1) == 0)
    {
      v31 = (const __CFArray *)CFDictionaryGetValue(v20, CFSTR("UIAppFonts"));
      if (v31)
      {
        v32 = v31;
        v33 = CFGetTypeID(v31);
        if (v33 == CFArrayGetTypeID())
        {
          v34 = CFBundleCopyBundleURL(v18);
          if (v34)
          {
            v35 = v34;
            Count = CFArrayGetCount(v32);
            if (Count >= 1)
            {
              v37 = Count;
              for (i = 0; i != v37; ++i)
              {
                ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v32, i);
                if (ValueAtIndex)
                {
                  v40 = ValueAtIndex;
                  v41 = CFGetTypeID(ValueAtIndex);
                  if (v41 == CFStringGetTypeID())
                  {
                    v42 = CFURLCreateCopyAppendingPathComponent(0, v35, v40, 0);
                    if (v42)
                    {
                      v43 = v42;
                      AddFontsFromURLOrPath(v42, 0, 0, 0, 0, 0, 0, 0);
                      CFRelease(v43);
                    }
                  }
                }
              }
            }
            CFRelease(v35);
          }
        }
      }
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  while (!__ldaxr((unint64_t *)&__ProcessRegisteredFonts))
  {
    if (!__stlxr((unint64_t)Mutable, (unint64_t *)&__ProcessRegisteredFonts))
      goto LABEL_60;
  }
  __clrex();
LABEL_60:
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)__GSFontApplicationDidEnterBackgroundCallBack, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, CFNotificationSuspensionBehaviorDrop);
  v59 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
  v60 = (void *)gMemoryStatusSource;
  gMemoryStatusSource = (uint64_t)v59;

  dispatch_source_set_event_handler((dispatch_source_t)gMemoryStatusSource, &__block_literal_global_145);
  dispatch_resume((dispatch_object_t)gMemoryStatusSource);

}

void __Initialize_block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D22400], "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "checkin:reply:", 0, &__block_literal_global_142);

}

void __Initialize_block_invoke_5()
{
  gAllowUserFonts = 1;
}

uint64_t __Initialize_block_invoke_6()
{
  return CTFontRemoveFromCaches();
}

@end
