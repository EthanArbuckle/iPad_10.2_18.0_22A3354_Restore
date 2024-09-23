const void *CPDateFormatStringForFormatType(const void *a1)
{
  const __CFLocale *v2;
  const void *v3;
  CFStringRef *v5;
  CFStringRef VersionString;
  const __CFString *v7;
  CFPropertyListRef v8;
  CFPropertyListRef v9;
  const __CFDictionary *v10;
  unint64_t v11;
  __CFDateFormatter *v12;
  CFTypeRef v13;
  int v14;
  CFStringRef Format;
  __CFDateFormatter *v16;
  CFStringRef v17;
  const __CFString *v18;
  CFArrayRef v19;
  const __CFArray *v20;
  CFIndex Count;
  CFIndex v22;
  CFIndex i;
  __CFDictionary *v24;
  const void *v25;
  const void *ValueAtIndex;
  CFIndex Length;
  CFMutableStringRef MutableCopy;
  CFIndex v29;
  CFIndex v30;
  CFIndex v31;
  CFStringRef Copy;
  const void *v33;
  CFStringRef v34;
  const __CFString *v35;
  CFStringRef v36;
  uint64_t v37;
  void *v38;
  id v39;
  CFStringRef *v40;
  const void *v41;
  const __CFDictionary *v42;
  const __CFDictionary *v43;
  const __CFString *v44;
  const __CFString *v45;
  CFIndex v46;
  __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  CFIndex v50;
  __CFString *v51;
  CFStringRef v52;
  CFStringRef v53;
  const __CFString *v54;
  CFPropertyListRef v55;
  const void *v56;
  CFPropertyListRef v57;
  const void *v58;
  __CFDictionary *v59;
  const void *v60;
  void *v61;
  CFTypeRef v62;
  CFTypeRef v63;
  _QWORD *v64;
  CFTypeRef v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const void *v70;
  const __CFString *value;
  void *values[2];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  const __CFString *v79;
  uint64_t v80;
  CFRange v81;
  CFRange v82;
  CFRange v83;
  CFRange v84;

  v80 = *MEMORY[0x1E0C80C00];
  if (_RegisterForLocaleChangeNotificationIfNecessary_onceToken != -1)
    dispatch_once(&_RegisterForLocaleChangeNotificationIfNecessary_onceToken, &__block_literal_global);
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  v2 = CFLocaleCopyCurrent();
  if (!__LocaleDateFormats)
  {
    __LocaleDateFormats = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Caches/DateFormats.plist")));
    v5 = (CFStringRef *)MEMORY[0x1E0C9B228];
    if (!__LocaleDateFormats)
      goto LABEL_18;
    VersionString = _CreateVersionString();
    v7 = *v5;
    v8 = CFPreferencesCopyAppValue(CFSTR("AppleICUForce12HourTime"), *v5);
    v9 = CFPreferencesCopyAppValue(CFSTR("AppleICUForce24HourTime"), v7);
    v10 = (const __CFDictionary *)__LocaleDateFormats;
    v11 = MEMORY[0x193FF68B4](v2);
    if (!_CachedValueIsEqualToExpectedValue(v10, CFSTR("Locale"), v11)
      || !_CachedValueIsEqualToExpectedValue((const __CFDictionary *)__LocaleDateFormats, CFSTR("Version"), (unint64_t)VersionString)|| !_CachedValueIsEqualToExpectedValue((const __CFDictionary *)__LocaleDateFormats, CFSTR("AppleICUForce12HourTime"), (unint64_t)v8)|| !_CachedValueIsEqualToExpectedValue((const __CFDictionary *)__LocaleDateFormats, CFSTR("AppleICUForce24HourTime"), (unint64_t)v9))
    {
      CFRelease((CFTypeRef)__LocaleDateFormats);
      __LocaleDateFormats = 0;
    }
    if (VersionString)
      CFRelease(VersionString);
    if (v8)
      CFRelease(v8);
    if (v9)
      CFRelease(v9);
    if (!__LocaleDateFormats)
    {
LABEL_18:
      v76 = xmmword_1E2881218;
      v77 = *(_OWORD *)&off_1E2881228;
      v78 = xmmword_1E2881238;
      v79 = CFSTR("y");
      *(_OWORD *)values = xmmword_1E28811D8;
      v73 = *(_OWORD *)&off_1E28811E8;
      v74 = xmmword_1E28811F8;
      v75 = *(_OWORD *)&off_1E2881208;
      __LocaleDateFormats = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v12 = CFDateFormatterCreate(0, v2, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
      v13 = CFDateFormatterCopyProperty(v12, (CFDateFormatterKey)*MEMORY[0x1E0C9AEC8]);
      v70 = a1;
      if (v13 || (v13 = CFDateFormatterCopyProperty(v12, (CFDateFormatterKey)*MEMORY[0x1E0C9AF10])) != 0)
      {
        CFRelease(v13);
        v14 = 0;
      }
      else
      {
        v14 = 1;
      }
      Format = CFDateFormatterGetFormat(v12);
      value = (const __CFString *)CFRetain(Format);
      CFRelease(v12);
      v16 = CFDateFormatterCreate(0, v2, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
      v17 = CFDateFormatterGetFormat(v16);
      v18 = (const __CFString *)CFRetain(v17);
      CFRelease(v16);
      v19 = CFArrayCreate(0, (const void **)values, 15, MEMORY[0x1E0C9B378]);
      v20 = (const __CFArray *)MEMORY[0x193FF6794](0, v19, 0, v2);
      CFRelease(v19);
      Count = CFArrayGetCount(v20);
      if (Count >= 1)
      {
        v22 = Count;
        for (i = 0; i != v22; ++i)
        {
          v24 = (__CFDictionary *)__LocaleDateFormats;
          v25 = *(&off_1E2881160 + i);
          ValueAtIndex = CFArrayGetValueAtIndex(v20, i);
          CFDictionarySetValue(v24, v25, ValueAtIndex);
        }
      }
      CFRelease(v20);
      Length = CFStringGetLength(v18);
      MutableCopy = CFStringCreateMutableCopy(0, Length, v18);
      v81.location = 0;
      v81.length = Length;
      v29 = CFStringFindAndReplace(MutableCopy, CFSTR(","), CFSTR(" "), v81, 0);
      v82.location = 0;
      v82.length = Length;
      v30 = CFStringFindAndReplace(MutableCopy, CFSTR("/"), CFSTR(" "), v82, 0) + v29;
      v83.location = 0;
      v83.length = Length;
      v31 = CFStringFindAndReplace(MutableCopy, CFSTR("-"), CFSTR(" "), v83, 0);
      v84.location = 0;
      v84.length = Length;
      if (v30 + v31 + CFStringFindAndReplace(MutableCopy, CFSTR("  "), CFSTR(" "), v84, 0) < 1)
      {
        CFRetain(v18);
        Copy = v18;
      }
      else
      {
        Copy = CFStringCreateCopy(0, MutableCopy);
      }
      CFRelease(MutableCopy);
      CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("UIAbbreviatedDateFormatWithoutCommas"), Copy);
      CFRelease(Copy);
      a1 = v70;
      if (v14)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("UINoAMPMTimeFormat"), value);
        v33 = CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, CFSTR("UIMinutelessTimeFormat"));
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("UIHourFormat"), v33);
      }
      else
      {
        v34 = _StripAMPMAndCopy(value);
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("UINoAMPMTimeFormat"), v34);
        CFRelease(v34);
        v35 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, CFSTR("UIMinutelessTimeFormat"));
        v36 = _StripAMPMAndCopy(v35);
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("UIHourFormat"), v36);
        CFRelease(v36);
      }
      CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("UINotesFormatWithYear"), v18);
      v37 = MEMORY[0x193FF68B4](v2);
      if (_CopyPathForLocaleOverrides_onceToken != -1)
        dispatch_once(&_CopyPathForLocaleOverrides_onceToken, &__block_literal_global_112);
      v38 = (void *)objc_msgSend((id)_CopyPathForLocaleOverrides_appSupportBundle, "pathForResource:ofType:inDirectory:", v37, CFSTR("plist"), CFSTR("DateFormats"), v70);
      if (!v38)
      {
        v61 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
        objc_msgSend(v61, "setObject:forKey:", CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E0C9B088]), *MEMORY[0x1E0C997E8]);
        v62 = CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E0C9B090]);
        if (v62)
          objc_msgSend(v61, "setObject:forKey:", v62, *MEMORY[0x1E0C99820]);
        v63 = CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
        v64 = (_QWORD *)MEMORY[0x1E0C997B0];
        if (v63)
          objc_msgSend(v61, "setObject:forKey:", v63, *MEMORY[0x1E0C997B0]);
        v65 = CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E0C9B050]);
        if (v65)
          objc_msgSend(v61, "setObject:forKey:", v65, CFSTR("calendar"));
        v66 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v61);
        v38 = (void *)objc_msgSend((id)_CopyPathForLocaleOverrides_appSupportBundle, "pathForResource:ofType:inDirectory:", v66, CFSTR("plist"), CFSTR("DateFormats"));
        if (v63 && !v38)
        {
          objc_msgSend(v61, "removeObjectForKey:", *v64);
          v67 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v61);
          v38 = (void *)objc_msgSend((id)_CopyPathForLocaleOverrides_appSupportBundle, "pathForResource:ofType:inDirectory:", v67, CFSTR("plist"), CFSTR("DateFormats"));
        }
        if (v65 && !v38)
        {
          objc_msgSend(v61, "removeObjectForKey:", CFSTR("calendar"));
          if (v63)
            objc_msgSend(v61, "setObject:forKey:", v63, *v64);
          v68 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v61);
          v38 = (void *)objc_msgSend((id)_CopyPathForLocaleOverrides_appSupportBundle, "pathForResource:ofType:inDirectory:", v68, CFSTR("plist"), CFSTR("DateFormats"));
          if (v63 && !v38)
          {
            objc_msgSend(v61, "removeObjectForKey:", *v64);
            v69 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v61);
            v38 = (void *)objc_msgSend((id)_CopyPathForLocaleOverrides_appSupportBundle, "pathForResource:ofType:inDirectory:", v69, CFSTR("plist"), CFSTR("DateFormats"));
          }
        }
      }
      v39 = v38;
      v40 = (CFStringRef *)MEMORY[0x1E0C9B228];
      if (v39)
      {
        v41 = v39;
        v42 = (const __CFDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v39);
        if (v42)
        {
          v43 = v42;
          CFDictionaryApplyFunction(v42, (CFDictionaryApplierFunction)_AddOverrideToFormatsDictionary, (void *)__LocaleDateFormats);
          CFRelease(v43);
        }
        CFRelease(v41);
      }
      v44 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, CFSTR("UIAbbreviatedMonthDayFormat"));
      if (v44)
      {
        v45 = v44;
        v46 = CFStringGetLength(v44);
        v47 = CFStringCreateMutableCopy(0, v46, v45);
        CFStringAppend(v47, CFSTR("   "));
        CFStringAppend(v47, value);
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("UINotesDisplayFormat"), v47);
        CFRelease(v47);
      }
      v48 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, CFSTR("UINotesFormatWithYear"));
      if (v48)
      {
        v49 = v48;
        v50 = CFStringGetLength(v48);
        v51 = CFStringCreateMutableCopy(0, v50, v49);
        CFStringAppend(v51, CFSTR("   "));
        CFStringAppend(v51, value);
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("UINotesDisplayFormatWithYear"), v51);
        CFRelease(v51);
      }
      CFRelease(v18);
      CFRelease(value);
      v52 = _CreateVersionString();
      if (v52)
      {
        v53 = v52;
        v54 = *v40;
        v55 = CFPreferencesCopyAppValue(CFSTR("AppleICUForce24HourTime"), *v40);
        if (v55)
        {
          v56 = v55;
          CFDictionaryAddValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("AppleICUForce24HourTime"), v55);
          CFRelease(v56);
        }
        v57 = CFPreferencesCopyAppValue(CFSTR("AppleICUForce12HourTime"), v54);
        if (v57)
        {
          v58 = v57;
          CFDictionaryAddValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("AppleICUForce12HourTime"), v57);
          CFRelease(v58);
        }
        v59 = (__CFDictionary *)__LocaleDateFormats;
        v60 = (const void *)MEMORY[0x193FF68B4](v2);
        CFDictionaryAddValue(v59, CFSTR("Locale"), v60);
        CFDictionaryAddValue((CFMutableDictionaryRef)__LocaleDateFormats, CFSTR("Version"), v53);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", __LocaleDateFormats, 200, 0, 0), "writeToFile:options:error:", objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Caches/DateFormats.plist")), 1, 0);
        CFRelease(v53);
      }
    }
  }
  CFRelease(v2);
  v3 = CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  return v3;
}

BOOL _CachedValueIsEqualToExpectedValue(const __CFDictionary *a1, const void *a2, unint64_t a3)
{
  const void *Value;
  unint64_t v5;

  Value = CFDictionaryGetValue(a1, a2);
  v5 = (unint64_t)Value;
  return a3 && Value && CFEqual(Value, (CFTypeRef)a3) || (a3 | v5) == 0;
}

CFStringRef _StripAMPMAndCopy(CFStringRef theString)
{
  CFStringRef Copy;
  CFMutableStringRef MutableCopy;
  CFIndex v3;
  CFIndex v4;
  CFRange v6;
  CFRange v7;
  CFRange v8;

  Copy = theString;
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  v6.length = CFStringGetLength(MutableCopy);
  v6.location = 0;
  v3 = CFStringFindAndReplace(MutableCopy, CFSTR("a "), &stru_1E2882B60, v6, 0);
  v7.length = CFStringGetLength(MutableCopy);
  v7.location = 0;
  v4 = CFStringFindAndReplace(MutableCopy, CFSTR(" a"), &stru_1E2882B60, v7, 0) + v3;
  v8.length = CFStringGetLength(MutableCopy);
  v8.location = 0;
  if (v4 + CFStringFindAndReplace(MutableCopy, CFSTR("a"), &stru_1E2882B60, v8, 0) < 1)
    CFRetain(Copy);
  else
    Copy = CFStringCreateCopy(0, MutableCopy);
  CFRelease(MutableCopy);
  return Copy;
}

void _AddOverrideToFormatsDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

unint64_t _CPTimeFormatIs24HourMode()
{
  __CFDateFormatter *v0;
  const __CFLocale *v1;
  const __CFString *Format;
  unint64_t v3;

  if (_RegisterForLocaleChangeNotificationIfNecessary_onceToken != -1)
    dispatch_once(&_RegisterForLocaleChangeNotificationIfNecessary_onceToken, &__block_literal_global);
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  v0 = (__CFDateFormatter *)todayFormatter;
  if (!todayFormatter)
  {
    v1 = CFLocaleCopyCurrent();
    todayFormatter = (uint64_t)CFDateFormatterCreate(0, v1, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    CFRelease(v1);
    v0 = (__CFDateFormatter *)todayFormatter;
  }
  Format = CFDateFormatterGetFormat(v0);
  v3 = (unint64_t)Format;
  if (Format)
    v3 = CFStringFind(Format, CFSTR("H"), 0).location != -1
      || CFStringFind((CFStringRef)v3, CFSTR("k"), 0).location != -1;
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  return v3;
}

void _LocaleWillChangeCallback()
{
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  if (__LocaleDateFormats)
  {
    CFRelease((CFTypeRef)__LocaleDateFormats);
    __LocaleDateFormats = 0;
  }
  if (todayFormatter)
  {
    CFRelease((CFTypeRef)todayFormatter);
    todayFormatter = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
}

CFStringRef _CreateVersionString()
{
  uint8_t versionArray[4];
  char versionString[20];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)versionArray = 0;
  ulocdata_getCLDRVersion();
  u_versionToString(versionArray, versionString);
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%d-%s"), 6, versionString);
}

void CPFreeSpaceRequestBytesAtPathWithCompletionBlock(unint64_t a1, CFURLRef anURL, const __CFDictionary *a3, void *a4)
{
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t TotalCapacityAndAvailableCapacityForMountPoint;
  void *v12;
  void *Value;
  unsigned int v14;
  unint64_t v15;
  void (*v16)(void *, uint64_t, unint64_t, _QWORD);
  void *v17;
  uint64_t v18;
  unint64_t v19;
  _BOOL4 v20;
  _QWORD v21[8];
  unint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  _BYTE v25[18];
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a4)
    v6 = a4;
  else
    v6 = &__block_literal_global_0;
  if (!anURL)
    anURL = (CFURLRef)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", NSHomeDirectory(), 1);
  v7 = (__CFString *)CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v25 = a1;
    *(_WORD *)&v25[8] = 2080;
    *(_QWORD *)&v25[10] = -[__CFString UTF8String](v7, "UTF8String");
    v26 = 2048;
    v27 = v6;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: new request for %llu bytes at path %s for block %p", buf, 0x20u);
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v7) & 1) == 0)
  {
    do
    {
      if (!-[__CFString length](v7, "length"))
        break;
      v8 = (void *)-[__CFString stringByDeletingLastPathComponent](v7, "stringByDeletingLastPathComponent");

      v7 = v8;
    }
    while (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v7));
  }
  v9 = v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v10 = -[__CFString UTF8String](v7, "UTF8String");
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v25 = v10;
    *(_WORD *)&v25[8] = 2048;
    *(_QWORD *)&v25[10] = v6;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: rationalized path to %s for block %p", buf, 0x16u);
  }
  v22 = 0;
  v23 = 0;
  TotalCapacityAndAvailableCapacityForMountPoint = GetTotalCapacityAndAvailableCapacityForMountPoint(v7, &v23, &v22);
  if (TotalCapacityAndAvailableCapacityForMountPoint)
  {
    v12 = (void *)TotalCapacityAndAvailableCapacityForMountPoint;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      CPFreeSpaceRequestBytesAtPathWithCompletionBlock_cold_2(v12);
    (*((void (**)(void *, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v12);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v25 = v23;
    *(_WORD *)&v25[8] = 2048;
    *(_QWORD *)&v25[10] = v22;
    v26 = 2048;
    v27 = v6;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: got total space %llu and available space %llu for block %p", buf, 0x20u);
  }
  if (!a3)
    goto LABEL_26;
  Value = (void *)CFDictionaryGetValue(a3, CFSTR("CPFreeSpaceEffortLevelKey"));
  if (!Value)
    goto LABEL_26;
  v14 = objc_msgSend(Value, "intValue");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v25 = v14;
    *(_WORD *)&v25[4] = 2048;
    *(_QWORD *)&v25[6] = v6;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: caller requested effort level %d for block %p", buf, 0x12u);
  }
  if (v14 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      CPFreeSpaceRequestBytesAtPathWithCompletionBlock_cold_1((uint64_t)v6, v14);
LABEL_26:
    v14 = 1;
  }
  if (v23 < a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v25 = v6;
      _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: not satisfied (total space < requested space) for block %p", buf, 0xCu);
    }
    v15 = v22;
    v16 = (void (*)(void *, uint64_t, unint64_t, _QWORD))*((_QWORD *)v6 + 2);
    v17 = v6;
    v18 = 0;
    goto LABEL_45;
  }
  v19 = v22;
  if (v22 >= a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v25 = v6;
      _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: satisfied (available space >= requested space) for block %p", buf, 0xCu);
      v19 = v22;
    }
    v16 = (void (*)(void *, uint64_t, unint64_t, _QWORD))*((_QWORD *)v6 + 2);
    v17 = v6;
    v18 = 1;
    goto LABEL_44;
  }
  v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
  if (!v14)
  {
    if (v20)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v25 = v6;
      _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: not satisfied (effort needed but not allowed) for block %p", buf, 0xCu);
      v19 = v22;
    }
    v16 = (void (*)(void *, uint64_t, unint64_t, _QWORD))*((_QWORD *)v6 + 2);
    v17 = v6;
    v18 = 0;
LABEL_44:
    v15 = v19;
LABEL_45:
    v16(v17, v18, v15, 0);
    return;
  }
  if (v20)
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v25 = v6;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: will enqueue request for block %p", buf, 0xCu);
  }
  if (GetFreeSpaceDispatchQueue___once != -1)
    dispatch_once(&GetFreeSpaceDispatchQueue___once, &__block_literal_global_21);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __CPFreeSpaceRequestBytesAtPathWithCompletionBlock_block_invoke_7;
  v21[3] = &unk_1E2881310;
  v21[6] = v6;
  v21[7] = a1;
  v21[4] = v7;
  v21[5] = 0;
  dispatch_async((dispatch_queue_t)GetFreeSpaceDispatchQueue___queue, v21);
}

uint64_t GetTotalCapacityAndAvailableCapacityForMountPoint(void *a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  statfs v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(&v17, 0, 512);
  if (statfs((const char *)objc_msgSend(a1, "fileSystemRepresentation"), &v17))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      GetTotalCapacityAndAvailableCapacityForMountPoint_cold_1();
    v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("POSIX filesystem error"), *MEMORY[0x1E0CB2D50]);
    return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C9AFD0], *__error(), v6);
  }
  else
  {
    v8 = v17.f_blocks * v17.f_bsize;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v8;
      _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: real total capacity %llu", buf, 0xCu);
    }
    v14 = 0;
    v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfFileSystemForPath:error:", a1, &v14);
    v7 = v14;
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "free space request: failed to get attributes for the mount point", buf, 2u);
        return v14;
      }
    }
    else
    {
      v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]), "unsignedLongLongValue");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v16 = v10;
        _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "free space request: real available capacity %llu", buf, 0xCu);
      }
      if (a2)
      {
        v11 = v8 - 157286400;
        if (v8 < 0x9600000)
          v11 = 0;
        *a2 = v11;
      }
      v7 = 0;
      if (a3)
      {
        v12 = v10 - 157286400;
        if (v10 < 0x9600000)
          v12 = 0;
        *a3 = v12;
      }
    }
  }
  return v7;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

const void *CPCityGetLocalizedCityName(const __CFArray *a1)
{
  return CFArrayGetValueAtIndex(a1, 5);
}

const void *CPCityGetLocalizedCountryName(const __CFArray *a1)
{
  return CFArrayGetValueAtIndex(a1, 6);
}

const void *CPCityGetTimeZoneFile(const __CFArray *a1)
{
  return CFArrayGetValueAtIndex(a1, 3);
}

const void *CPCityGetIdentifier(const __CFArray *a1)
{
  return CFArrayGetValueAtIndex(a1, 9);
}

uint64_t CPFSSizeStrings(float a1)
{
  return CPFSSizeStringsWithStyle(0, a1);
}

uint64_t CPFSSizeStringsWithStyle(int a1, float a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6[3];

  if (a2 == 0.0)
    return __diskSizeStringForKey((uint64_t)CFSTR("0 bytes"));
  if (a2 == 1.0)
    return __diskSizeStringForKey((uint64_t)CFSTR("1 byte"));
  v6[1] = v2;
  v6[2] = v3;
  v6[0] = 0;
  v5 = __localizedScaledSizeAndFormatWithStyle(a1, v6, a2, a2);
  return objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6[0], v5);
}

uint64_t __diskSizeStringForKey(uint64_t a1)
{
  id v2;

  v2 = (id)__thisBundle;
  if (__thisBundle)
    return objc_msgSend(v2, "localizedStringForKey:value:table:", a1, &stru_1E2882B60, CFSTR("CPDiskSizes"));
  v2 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppSupport"));
  __thisBundle = (uint64_t)v2;
  if (v2)
    return objc_msgSend(v2, "localizedStringForKey:value:table:", a1, &stru_1E2882B60, CFSTR("CPDiskSizes"));
  else
    return a1;
}

uint64_t CPFSProgressString(float a1, float a2)
{
  return CPFSProgressStringWithStyle(0, a1, a2);
}

uint64_t CPFSProgressStringWithStyle(int a1, float a2, float a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = __localizedScaledSizeAndFormatWithStyle(a1, 0, a2, a3);
  v6 = CPFSSizeStringsWithStyle(a1, a3);
  return objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", __diskSizeStringForKey((uint64_t)CFSTR("%@ of %@")), v5, v6);
}

uint64_t __localizedScaledSizeAndFormatWithStyle(int a1, uint64_t *a2, float a3, float a4)
{
  uint64_t v6;
  double v7;
  uint64_t result;
  double v10;
  float v11;
  __CFString *v13;
  const __CFString *v14;
  double v15;
  const __CFString *v16;
  const __CFString *v18;
  double v19;
  double v21;
  double v23;

  if (a4 < 100.0)
  {
    v6 = __diskSizeStringForKey((uint64_t)CFSTR("%d bytes"));
    v7 = floorf(a3);
    goto LABEL_3;
  }
  v10 = (float)(a3 * 0.00097656);
  v11 = a4 * 0.00097656;
  if (v11 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1)
      v13 = CFSTR("%.0f");
    else
      v13 = CFSTR("%.1f");
    v14 = CFSTR("KB");
    goto LABEL_14;
  }
  v15 = v11 * 0.0009765625;
  if (v15 < 1.0)
  {
    if (a1)
    {
      v16 = CFSTR("%.0fKB");
LABEL_67:
      v6 = __diskSizeStringForKey((uint64_t)v16);
      v7 = v10;
LABEL_3:
      result = __localizedIntegerNumber(v7);
      if (!a2)
        return result;
      goto LABEL_4;
    }
    v18 = CFSTR("%dKB");
    goto LABEL_31;
  }
  v10 = v10 * 0.0009765625;
  if (v15 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1)
      v13 = CFSTR("%.0f");
    else
      v13 = CFSTR("%.1f");
    v14 = CFSTR("MB");
    goto LABEL_14;
  }
  if (v15 < 1000.0)
  {
    if (a1)
    {
      v16 = CFSTR("%.0fMB");
      goto LABEL_67;
    }
    v18 = CFSTR("%dMB");
LABEL_31:
    v6 = __diskSizeStringForKey((uint64_t)v18);
    v7 = floor(v10);
    goto LABEL_3;
  }
  v10 = v10 * 0.0009765625;
  v19 = v15 * 0.0009765625;
  if (v19 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1)
      v13 = CFSTR("%.0f");
    else
      v13 = CFSTR("%.1f");
    v14 = CFSTR("GB");
    goto LABEL_14;
  }
  if (v19 < 1000.0)
  {
    if (a1)
    {
      v16 = CFSTR("%.0fGB");
      goto LABEL_67;
    }
    v18 = CFSTR("%dGB");
    goto LABEL_31;
  }
  v10 = v10 * 0.0009765625;
  v21 = v19 * 0.0009765625;
  if (v21 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1)
      v13 = CFSTR("%.0f");
    else
      v13 = CFSTR("%.1f");
    v14 = CFSTR("TB");
    goto LABEL_14;
  }
  if (v21 < 1000.0)
  {
    if (a1)
    {
      v16 = CFSTR("%.0fTB");
      goto LABEL_67;
    }
    v18 = CFSTR("%dTB");
    goto LABEL_31;
  }
  v10 = v10 * 0.0009765625;
  v23 = v21 * 0.0009765625;
  if (v23 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1)
      v13 = CFSTR("%.0f");
    else
      v13 = CFSTR("%.1f");
    v14 = CFSTR("PB");
    goto LABEL_14;
  }
  if (v23 < 1000.0)
  {
    if (a1)
    {
      v16 = CFSTR("%.0fPB");
      goto LABEL_67;
    }
    v18 = CFSTR("%dPB");
    goto LABEL_31;
  }
  if (v23 * 0.0009765625 < 10.0)
  {
    v10 = v10 * 0.0009765625;
    if (fmod(v10, 1.0) < 0.05 && a1 == 1)
      v13 = CFSTR("%.0f");
    else
      v13 = CFSTR("%.1f");
    v14 = CFSTR("EB");
LABEL_14:
    v6 = __diskSizeStringForKey(-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v14));
    result = __localizedFormattedNumber(a1, v10);
    if (!a2)
      return result;
LABEL_4:
    *a2 = v6;
    return result;
  }
  v6 = __diskSizeStringForKey((uint64_t)CFSTR("%.1fEB"));
  result = 0;
  if (a2)
    goto LABEL_4;
  return result;
}

uint64_t __localizedIntegerNumber(double a1)
{
  void *v2;
  uint64_t v3;

  pthread_mutex_lock(&__integerMutex);
  v2 = (void *)__integerFormatter;
  if (!__integerFormatter)
  {
    __integerFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend((id)__integerFormatter, "setLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale"));
    objc_msgSend((id)__integerFormatter, "setAlwaysShowsDecimalSeparator:", 0);
    objc_msgSend((id)__integerFormatter, "setMaximumFractionDigits:", 0);
    objc_msgSend((id)__integerFormatter, "setMinimumIntegerDigits:", 1);
    v2 = (void *)__integerFormatter;
  }
  v3 = objc_msgSend(v2, "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1));
  pthread_mutex_unlock(&__integerMutex);
  return v3;
}

uint64_t __localizedFormattedNumber(int a1, double a2)
{
  double v4;
  void *v6;
  uint64_t v7;

  v4 = fmod(a2, 1.0);
  if (a1 == 1 && v4 < 0.05)
    return __localizedIntegerNumber(a2);
  pthread_mutex_lock(&__decimalMutex);
  v6 = (void *)__decimalFormatter;
  if (!__decimalFormatter)
  {
    __decimalFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend((id)__decimalFormatter, "setLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale"));
    objc_msgSend((id)__decimalFormatter, "setAlwaysShowsDecimalSeparator:", 1);
    objc_msgSend((id)__decimalFormatter, "setMinimumFractionDigits:", 1);
    objc_msgSend((id)__decimalFormatter, "setMinimumIntegerDigits:", 1);
    v6 = (void *)__decimalFormatter;
  }
  v7 = objc_msgSend(v6, "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2));
  pthread_mutex_unlock(&__decimalMutex);
  return v7;
}

CFRunLoopSourceRef CPCreateMIGServerSource(uint64_t a1, int a2, CFIndex a3)
{
  return CPCreateMIGServerSourceWithContext(a1, a2, a3, 0);
}

CFRunLoopSourceRef CPCreateMIGServerSourceWithContext(uint64_t a1, int a2, CFIndex a3, uint64_t a4)
{
  _QWORD *v8;
  CFRunLoopSourceRef v9;
  CFRunLoopSourceContext context;

  pthread_once(&__CPMIGServerCalloutContextKeyOnce, (void (*)(void))makeCalloutContextKey);
  v8 = malloc_type_malloc(0x18uLL, 0x10A0040FC6C5850uLL);
  *(_DWORD *)v8 = a2;
  v8[1] = a1;
  v8[2] = a4;
  context.version = 1;
  context.info = v8;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C834A8];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))migHelperCopyDescription;
  context.equal = (Boolean (__cdecl *)(const void *, const void *))migHelperEqual;
  context.hash = (CFHashCode (__cdecl *)(const void *))migHelperHash;
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperGetPort;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperRecievePortCallout;
  v9 = CFRunLoopSourceCreate(0, a3, &context);
  if (!v9)
    free(v8);
  return v9;
}

uint64_t makeCalloutContextKey()
{
  return pthread_key_create((pthread_key_t *)&__CPMIGServerCalloutContextKey, 0);
}

CFStringRef migHelperCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<CFRunLoopSource MIG Server> {port = %u, subsystem = %p, context = %p}"), *a1, *((_QWORD *)a1 + 1), *((_QWORD *)a1 + 2));
}

BOOL migHelperEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t migHelperHash(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperRecievePortCallout(mach_msg_header_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  mach_msg_id_t msgh_id;
  int v8;
  BOOL v9;
  int v10;
  void (*v11)(mach_msg_header_t *, mach_msg_header_t *);
  char v12;
  size_t v13;
  mach_msg_header_t *v14;
  mach_msg_header_t *v15;
  mach_port_t msgh_remote_port;
  const void *v17;
  mach_msg_bits_t msgh_bits;
  mach_port_t v19;
  mach_msg_option_t v20;
  mach_msg_return_t v21;
  FILE *v23;
  char *v24;

  v6 = *(_QWORD *)(a4 + 8);
  msgh_id = a1->msgh_id;
  v8 = *(_DWORD *)(v6 + 8);
  v9 = __OFSUB__(msgh_id, v8);
  v10 = msgh_id - v8;
  if (v10 < 0 != v9 || msgh_id >= *(_DWORD *)(v6 + 12))
  {
    v11 = 0;
  }
  else
  {
    v11 = *(void (**)(mach_msg_header_t *, mach_msg_header_t *))(v6 + 40 * v10 + 40);
    if (v11)
    {
      v12 = 0;
      v13 = *(unsigned int *)(v6 + 40 * v10 + 64);
      goto LABEL_7;
    }
  }
  v12 = 1;
  v13 = 36;
LABEL_7:
  v14 = (mach_msg_header_t *)malloc_type_malloc(v13, 0x18E20578uLL);
  if (v14)
  {
    v15 = v14;
    msgh_remote_port = a1->msgh_remote_port;
    v14->msgh_bits = a1->msgh_bits & 0x1F;
    v14->msgh_size = 36;
    *(_QWORD *)&v14->msgh_remote_port = msgh_remote_port;
    v14->msgh_voucher_port = 0;
    v14->msgh_id = a1->msgh_id + 100;
    if ((v12 & 1) != 0)
    {
      *(_QWORD *)&v14[1].msgh_bits = *MEMORY[0x1E0C804E8];
      v14[1].msgh_remote_port = -303;
    }
    else
    {
      v17 = *(const void **)(a4 + 16);
      if (v17)
      {
        pthread_setspecific(__CPMIGServerCalloutContextKey, v17);
        v11(a1, v15);
        pthread_setspecific(__CPMIGServerCalloutContextKey, 0);
      }
      else
      {
        v11(a1, v14);
      }
    }
    msgh_bits = v15->msgh_bits;
    if ((v15->msgh_bits & 0x80000000) == 0)
    {
      v19 = v15[1].msgh_remote_port;
      if (v19 == -305)
      {
LABEL_31:
        free(v15);
        return 0;
      }
      if (v19 && (a1->msgh_bits & 0x80000000) != 0)
      {
        a1->msgh_remote_port = 0;
        mach_msg_destroy(a1);
        msgh_bits = v15->msgh_bits;
      }
    }
    if (v15->msgh_remote_port)
    {
      if ((msgh_bits & 0x1F) == 0x12)
        v20 = 1;
      else
        v20 = 17;
      v21 = mach_msg(v15, v20, v15->msgh_size, 0, 0, 0, 0);
      if ((v21 - 268435459) >= 2 && v21 != 0)
      {
        v23 = (FILE *)*MEMORY[0x1E0C80C10];
        v24 = mach_error_string(v21);
        fprintf(v23, "<CFRunLoopSource MIG Server> mach_msg send error in reply: %s\n", v24);
        goto LABEL_31;
      }
      if ((v21 - 268435459) > 1)
        goto LABEL_31;
      msgh_bits = v15->msgh_bits;
    }
    if ((msgh_bits & 0x80000000) != 0)
      mach_msg_destroy(v15);
    goto LABEL_31;
  }
  return 0;
}

uint64_t CPGetMachPortForMIGServerSource(__CFRunLoopSource *a1)
{
  CFRunLoopSourceContext context;

  memset(&context.info, 0, 64);
  context.version = 1;
  CFRunLoopSourceGetContext(a1, &context);
  return *(unsigned int *)context.info;
}

void *CPGetContextForCalloutCurrentMIGServerSource()
{
  return pthread_getspecific(__CPMIGServerCalloutContextKey);
}

uint64_t CPGetDeviceRegionCode()
{
  if (CPGetDeviceRegionCode_onceToken != -1)
    dispatch_once(&CPGetDeviceRegionCode_onceToken, &__block_literal_global_1);
  return CPGetDeviceRegionCode___regionCode;
}

const void *CPSharedResourcesDirectory()
{
  uint64_t v0;
  const void *Value;
  char *pw_dir;
  CFStringRef v3;
  passwd *v4;

  pthread_mutex_lock(&CPSharedResourcesDirectory_lock);
  v0 = geteuid();
  if (!(_DWORD)v0)
    v0 = getuid();
  if (CPSharedResourcesDirectory_pathDictionary)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)CPSharedResourcesDirectory_pathDictionary, (const void *)v0);
    if (Value)
      goto LABEL_13;
  }
  else
  {
    CPSharedResourcesDirectory_pathDictionary = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  }
  pw_dir = getenv("IPHONE_SHARED_RESOURCES_DIRECTORY");
  if ((pw_dir || (v4 = getpwuid(v0)) != 0 && (pw_dir = v4->pw_dir) != 0)
    && (v3 = CFStringCreateWithFileSystemRepresentation(0, pw_dir)) != 0)
  {
    Value = v3;
    CFDictionarySetValue((CFMutableDictionaryRef)CPSharedResourcesDirectory_pathDictionary, (const void *)v0, v3);
    CFRelease(Value);
  }
  else
  {
    NSLog((NSString *)CFSTR("Returning NULL path from CPSharedResourcesDirectory for uid %d"), v0);
    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&CPSharedResourcesDirectory_lock);
  return Value;
}

CFStringRef CPCopySharedResourcesPreferencesDomainForDomain(uint64_t a1)
{
  const void *v2;

  v2 = CPSharedResourcesDirectory();
  return CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"), v2, a1);
}

uint64_t CPSystemRootDirectory()
{
  if (CPSystemRootDirectory_onceToken != -1)
    dispatch_once(&CPSystemRootDirectory_onceToken, &__block_literal_global_7);
  return CPSystemRootDirectory_systemRootDirectory;
}

void sub_18EB12F24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CPCopyBundleIdentifierFromAuditToken(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  _BYTE *v3;
  int v4;
  void *v5;
  id v6;
  char v7;
  _BYTE buffer[4096];
  uint64_t v10;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v10 = *MEMORY[0x1E0C80C00];
  v4 = proc_pidpath(*(_DWORD *)(v1 + 20), buffer, 0x1000u);
  if (v4 < 1)
  {
    v6 = 0;
    if (v3)
      goto LABEL_6;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v4, 4);
    v6 = -[_CPBundleIdentifierString _initWithExecutablePath:]([_CPBundleIdentifierString alloc], "_initWithExecutablePath:", v5);

    if (v3)
    {
      if (v6)
      {
        v7 = objc_msgSend(v6, "_isProcessName");
LABEL_7:
        *v3 = v7;
        return v6;
      }
LABEL_6:
      v7 = 0;
      goto LABEL_7;
    }
  }
  return v6;
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken(_OWORD *a1, _QWORD *a2, _QWORD *a3)
{
  __int128 v5;
  __SecTask *v6;
  uint64_t v7;
  audit_token_t v9;

  v5 = a1[1];
  *(_OWORD *)v9.val = *a1;
  *(_OWORD *)&v9.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(0, &v9);
  v7 = CPCopyBundleIdentifierAndTeamFromSecTaskRef(v6, a2, a3);
  if (v6)
    CFRelease(v6);
  return v7;
}

uint64_t CPCopyBundleIdentifierAndTeamFromSecTaskRef(__SecTask *a1, _QWORD *a2, _QWORD *a3)
{
  CFTypeRef v5;
  const void *v6;
  CFTypeID v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v5 = SecTaskCopyValueForEntitlement(a1, CFSTR("application-identifier"), 0);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 == CFStringGetTypeID())
    v8 = CPCopyBundleIdentifierAndTeamFromApplicationIdentifier((uint64_t)v6, a2, a3);
  else
    v8 = 0;
  CFRelease(v6);
  return v8;
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  _BOOL4 v10;
  id v12;
  CFTypeRef v13;

  if (!result)
    return result;
  v5 = (void *)result;
  if ((unint64_t)objc_msgSend((id)result, "length") < 0xB
    || objc_msgSend(v5, "characterAtIndex:", 10) != 46)
  {
    goto LABEL_20;
  }
  v6 = (void *)objc_msgSend(v5, "substringWithRange:", 0, 10);
  v7 = 0;
  do
  {
    v8 = objc_msgSend(v5, "characterAtIndex:", v7);
    v10 = (v8 - 65) < 0x1A || (v8 - 48) < 0xA;
  }
  while (v10 && v7++ < 9);
  if (!v10)
  {
LABEL_20:
    v12 = 0;
LABEL_21:
    v13 = CFRetain(v5);
    if (a2)
      goto LABEL_19;
LABEL_22:
    if (v13)
      CFRelease(v13);
    goto LABEL_24;
  }
  v12 = v6;
  v13 = (id)objc_msgSend(v5, "substringWithRange:", 11, objc_msgSend(v5, "length") - 11);
  if (!v13)
    goto LABEL_21;
  if (!a2)
    goto LABEL_22;
LABEL_19:
  *a2 = v13;
LABEL_24:
  if (a3)
  {
    *a3 = v12;
  }
  else if (v12)
  {
    CFRelease(v12);
  }
  return 1;
}

uint64_t CPCanSendMail()
{
  id v0;
  Class v1;
  Class v2;
  uint64_t CanSendMail;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v1 = NSClassFromString((NSString *)CFSTR("MFMailAccountProxy"));
  if (v1 && (v2 = v1, (objc_opt_respondsToSelector() & 1) != 0))
  {
    -[objc_class performSelector:](v2, "performSelector:", sel_reloadAccounts);
    CanSendMail = -[objc_class performSelector:](v2, "performSelector:", sel_defaultMailAccountForDelivery) != 0;
  }
  else
  {
    if (CPCanSendMail_onceToken != -1)
      dispatch_once(&CPCanSendMail_onceToken, &__block_literal_global_37);
    if (CPCanSendMail_MailServicesCanSendMail)
      CanSendMail = CPCanSendMail_MailServicesCanSendMail();
    else
      CanSendMail = 0;
  }

  return CanSendMail;
}

BOOL CPCanSendMMS()
{
  int v0;
  int v1;
  uint64_t state64;

  v0 = CPCanSendMMS_token;
  if (CPCanSendMMS_token == -1)
  {
    notify_register_check("com.apple.MobileSMS.MMSCapable", &CPCanSendMMS_token);
    v0 = CPCanSendMMS_token;
  }
  state64 = 0;
  notify_get_state(v0, &state64);
  if (!state64)
    return 0;
  v1 = CPCanSendMMS_seatbeltCheck;
  if (CPCanSendMMS_seatbeltCheck == -1)
  {
    v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isWritableFileAtPath:", objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/SMS/sms.db")));
    CPCanSendMMS_seatbeltCheck = v1;
  }
  return v1 != 0;
}

uint64_t CPIsInternalDevice()
{
  if (CPIsInternalDevice_onceToken != -1)
    dispatch_once(&CPIsInternalDevice_onceToken, &__block_literal_global_49);
  return CPIsInternalDevice_result;
}

double CPMachAbsoluteTime()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  return CPMachAbsoluteTimeIntervalToCFTimeInterval(v0);
}

double CPMachAbsoluteTimeIntervalToCFTimeInterval(unint64_t a1)
{
  double v2;
  unint64_t v3;
  unint64_t v4;
  mach_timebase_info info;

  v2 = *(double *)&CPMachAbsoluteTimeIntervalToCFTimeInterval___timebaseFactor;
  if (*(double *)&CPMachAbsoluteTimeIntervalToCFTimeInterval___timebaseFactor == 0.0)
  {
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v4) = info.denom;
    LODWORD(v3) = info.numer;
    v2 = (double)v3 / (double)v4 * 0.000000001;
    CPMachAbsoluteTimeIntervalToCFTimeInterval___timebaseFactor = *(_QWORD *)&v2;
  }
  return v2 * (double)a1;
}

double CPTimeBlock(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = mach_absolute_time();
  (*(void (**)(uint64_t))(a1 + 16))(a1);
  v3 = mach_absolute_time() - v2;
  return CPMachAbsoluteTimeIntervalToCFTimeInterval(v3);
}

uint64_t CPOpenTemporaryFile(uint64_t a1, char *a2, size_t a3)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/.%@.XXXXXX"), objc_msgSend(v7, "stringByDeletingLastPathComponent"), objc_msgSend(v7, "lastPathComponent"));
  strlcpy(a2, (const char *)objc_msgSend(v8, "fileSystemRepresentation"), a3);
  v9 = mkstemp(a2);

  objc_msgSend(v6, "drain");
  return v9;
}

void CPBasename(const char *a1, char *a2, CFIndex a3)
{
  size_t v6;
  const __CFURL *v7;
  const __CFURL *v8;
  const __CFString *PathComponent;
  const __CFString *v10;

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v6 = strlen(a1);
        v7 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)a1, v6, 0);
        if (v7)
        {
          v8 = v7;
          PathComponent = CFURLCopyLastPathComponent(v7);
          if (PathComponent)
          {
            v10 = PathComponent;
            CFStringGetCString(PathComponent, a2, a3, 0x8000100u);
            CFRelease(v10);
          }
          CFRelease(v8);
        }
      }
    }
  }
}

void CPTemporaryPath(const char *a1, char *a2, size_t a3)
{
  const char *v6;
  const char *v7;
  char *__source;

  __source = 0;
  v6 = -[NSString fileSystemRepresentation](NSTemporaryDirectory(), "fileSystemRepresentation");
  NSLog((NSString *)CFSTR("%s: tempdir returned by [NSTemporaryDirectory() fileSystemRepresentation] is %s"), "void CPTemporaryPath(const char *, char *, size_t)", v6);
  if (v6[strlen(v6) - 1] == 47)
    v7 = "";
  else
    v7 = "/";
  asprintf(&__source, "%s%s%s.XXXXXX", v6, v7, a1);
  if (__source)
  {
    NSLog((NSString *)CFSTR("%s: will attempt to use path %s"), "void CPTemporaryPath(const char *, char *, size_t)", __source);
    if (mkstemp(__source) == -1)
    {
      NSLog((NSString *)CFSTR("CPTemporaryPath failed with result %i at path %s"), 0xFFFFFFFFLL, __source);
      if (!a2)
        goto LABEL_8;
    }
    else if (!a2)
    {
LABEL_8:
      free(__source);
      return;
    }
    strlcpy(a2, __source, a3);
    goto LABEL_8;
  }
}

_QWORD *CPSqliteDatabaseCreateWithPath(const __CFString *a1)
{
  _QWORD *v2;

  v2 = malloc_type_calloc(1uLL, 0x130uLL, 0x10E0040C156DB45uLL);
  *v2 = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1);
  return v2;
}

CFStringRef CPSqliteDatabaseSetVFSModuleName(CFStringRef result, const __CFString *a2)
{
  CFStringRef v2;

  if (result)
  {
    v2 = result;
    result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v2[7].length = (uint64_t)result;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetVersion(uint64_t result, int a2)
{
  if (result)
  {
    *(_WORD *)(result + 116) |= 1u;
    *(_DWORD *)(result + 112) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetJournalModeWAL(uint64_t result)
{
  if (result)
    *(_WORD *)(result + 116) |= 0x400u;
  return result;
}

uint64_t CPSqliteDatabaseSetAutoVacuumLevel(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 256) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetAccessRequestHandler(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 40) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetDataProtectionLevel(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 260) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetSupportsReadOnlyConnections(uint64_t result)
{
  if (result)
    *(_WORD *)(result + 116) |= 2u;
  return result;
}

uint64_t CPSqliteDatabaseSetAutoRetryStatements(uint64_t result, int a2)
{
  __int16 v2;

  if (result)
  {
    if (a2)
      v2 = 2048;
    else
      v2 = 0;
    *(_WORD *)(result + 116) = *(_WORD *)(result + 116) & 0xF7FF | v2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetShouldUseInhibitorForConnections(uint64_t result, int a2)
{
  __int16 v2;

  if (result)
  {
    if (a2)
      v2 = 4096;
    else
      v2 = 0;
    *(_WORD *)(result + 116) = *(_WORD *)(result + 116) & 0xEFFF | v2;
  }
  return result;
}

uint64_t CPSqliteConnectionDatabaseVersion(CFMutableDictionaryRef *a1)
{
  return CPSqliteConnectionIntegerForPropertyWithDefaultValue(a1, CFSTR("_ClientVersion"), 0);
}

uint64_t CPSqliteConnectionIntegerForProperty(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  return CPSqliteConnectionIntegerForPropertyWithDefaultValue(a1, a2, 0);
}

uint64_t CPSqliteConnectionSetDatabaseVersion(CFMutableDictionaryRef *a1, int a2)
{
  return CPSqliteConnectionSetIntegerForProperty(a1, CFSTR("_ClientVersion"), a2);
}

uint64_t CPSqliteConnectionSetIntegerForProperty(CFMutableDictionaryRef *a1, const __CFString *a2, int a3)
{
  uint64_t v3;
  const void *v7;
  uint64_t v8;
  char *v9;
  __CFDictionary *v10;
  const void *v11;

  v3 = 1;
  if (a1 && a2 && (!*a1 || (*((_WORD *)*a1 + 58) & 4) == 0))
  {
    v7 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
           0);
    if (v7)
    {
      v8 = (uint64_t)v7;
      v9 = (char *)_CPCreateUTF8StringFromCFString(a2);
      v3 = _performSetIntegerPropertyStatement(v8, v9, a3);
      if ((_DWORD)v3 == 17)
      {
        v10 = a1[2];
        if (v10
          && (CFDictionaryRemoveValue(v10, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);")),
              (v11 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
                       0)) != 0))
        {
          v3 = _performSetIntegerPropertyStatement((uint64_t)v11, v9, a3);
        }
        else
        {
          v3 = 17;
        }
      }
      free(v9);
    }
  }
  return v3;
}

uint64_t CPSqliteDatabaseSetSetupHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 16) = a2;
    *(_QWORD *)(result + 48) = a3;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetShouldMigrateInProcess(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 88) = a2 ^ 1;
  return result;
}

CFStringRef CPSqliteDatabaseSetMigrationPluginBundleID(CFStringRef result, const __CFString *a2)
{
  CFStringRef v2;

  if (result)
  {
    v2 = result;
    result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v2[3].isa = (void *)result;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetDatabaseInitializer(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetConnectionInitializer(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetCommitHookCallback(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 192) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetUpdateHookCallback(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 200) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetExternalConversionChecker(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 208) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetPropertiesEnabled(uint64_t result, int a2)
{
  __int16 v2;

  if (result)
  {
    if (a2)
      v2 = 0;
    else
      v2 = 4;
    *(_WORD *)(result + 116) = *(_WORD *)(result + 116) & 0xFFFB | v2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetStatementCacheLimit(uint64_t result, int a2)
{
  *(_DWORD *)(result + 288) = a2;
  return result;
}

uint64_t CPSqliteDatabaseGetStatementCacheLimit(uint64_t a1)
{
  return *(unsigned int *)(a1 + 288);
}

uint64_t CPSqliteDatabaseSetThreadSafeEnabled(uint64_t result)
{
  __int16 v1;
  uint64_t v2;
  pthread_mutexattr_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(_WORD *)(result + 116);
  if ((v1 & 8) == 0)
  {
    v2 = result;
    *(_WORD *)(result + 116) = v1 | 8;
    v3.__sig = 0;
    *(_QWORD *)v3.__opaque = 0;
    pthread_mutexattr_init(&v3);
    pthread_mutexattr_settype(&v3, 2);
    return pthread_mutex_init((pthread_mutex_t *)(v2 + 120), &v3);
  }
  return result;
}

_QWORD *CPSqliteDatabaseSetMigrationHandlers(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    result[7] = a2;
    result[8] = a3;
    result[13] = a4;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetCorruptionHandler(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 72) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetDatabaseDeletedCallback(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 80) = a2;
  return result;
}

uint64_t CPSqliteDatabaseSetStatementCompileErrorCallback(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 296) = a2;
  return result;
}

void CPSqliteDatabaseClose(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  if ((*(_WORD *)(a1 + 116) & 0x80) != 0)
    notify_cancel(*(_DWORD *)(a1 + 232));
  v2 = *(const void **)(a1 + 240);
  if (v2)
    _Block_release(v2);
  CPSqliteDatabaseCloseAllConnections(a1);
  CFRelease(*(CFTypeRef *)a1);
  v3 = *(const void **)(a1 + 248);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 96);
  if (v4)
    CFRelease(v4);
  free((void *)a1);
}

void CPSqliteDatabaseCloseAllConnections(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    CPSqliteConnectionClose(v2);
    *(_QWORD *)(a1 + 8) = 0;
  }
  v3 = *(_QWORD *)(a1 + 280);
  if (v3)
  {
    CPSqliteConnectionClose(v3);
    *(_QWORD *)(a1 + 280) = 0;
  }
}

uint64_t CPSqliteDatabasePath(uint64_t a1)
{
  return *(_QWORD *)a1;
}

BOOL CPSqliteDatabaseIsAccessPermitted(uint64_t a1)
{
  int v2;

  v2 = 0;
  _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, &v2);
  return v2 != 3;
}

uint64_t CPSqliteDatabaseConnectionForWritingWithSqlite3OpenFlagsAndReturnError(uint64_t a1, int a2, _DWORD *a3)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, a2, a3);
}

uint64_t CPSqliteDatabaseConnectionForReading(uint64_t a1)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, (*(unsigned __int16 *)(a1 + 116) >> 1) & 1, 0, 0);
}

uint64_t CPSqliteDatabaseConnectionForReadingWithSqlite3OpenFlags(uint64_t a1, int a2)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, (*(unsigned __int16 *)(a1 + 116) >> 1) & 1, a2, 0);
}

uint64_t _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(uint64_t result, int a2, int a3, _DWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  int v15;

  v15 = 0;
  if (result)
  {
    v7 = result;
    if ((*(_WORD *)(result + 116) & 8) != 0)
      pthread_mutex_lock((pthread_mutex_t *)(result + 120));
    v8 = 8;
    if (a2)
    {
      v8 = 280;
      v9 = (uint64_t *)(v7 + 280);
    }
    else
    {
      v9 = (uint64_t *)(v7 + 8);
    }
    result = *(_QWORD *)(v7 + v8);
    if (!result)
    {
      MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(*(CFStringRef *)v7);
      v11 = (char *)malloc_type_calloc(MaximumSizeOfFileSystemRepresentation + 1, 1uLL, 0x100004077774924uLL);
      CFStringGetFileSystemRepresentation(*(CFStringRef *)v7, v11, MaximumSizeOfFileSystemRepresentation);
      v14 = 0;
      v12 = _connectAndCheckVersion(v7, v11, &v14, a2, a3, &v15);
      if (v12)
      {
        v13 = (_QWORD *)v12;
        free(v11);
        goto LABEL_10;
      }
      if (v14)
      {
        v13 = (_QWORD *)_connectAndCheckVersion(v7, v11, &v14, a2, a3, &v15);
        free(v11);
        if (v13)
        {
LABEL_10:
          *v13 = v7;
          if (a2)
            *(_QWORD *)(v7 + 280) = v13;
          else
            *(_QWORD *)(v7 + 8) = v13;
        }
      }
      else
      {
        free(v11);
      }
      result = *v9;
    }
  }
  if (a4)
    *a4 = v15;
  return result;
}

uint64_t CPSqliteDatabaseConnectionForWriting(uint64_t a1)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
}

uint64_t CPSqliteDatabaseConnectionForWritingWithSqlite3OpenFlags(uint64_t a1, int a2)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, a2, 0);
}

uint64_t *CPSqliteDatabaseReleaseSqliteConnection(uint64_t *result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *result;
    if (*result)
    {
      if ((*(_WORD *)(v1 + 116) & 8) != 0)
        return (uint64_t *)pthread_mutex_unlock((pthread_mutex_t *)(v1 + 120));
    }
  }
  return result;
}

void CPSqliteConnectionClose(uint64_t a1)
{
  sqlite3 *v2;
  uint64_t v3;
  void (*v4)(_QWORD);

  if (a1)
  {
    CPSqliteConnectionFlushStatementCache(a1);
    v2 = *(sqlite3 **)(a1 + 8);
    if (v2)
    {
      if (*(_QWORD *)a1 && (*(_WORD *)(*(_QWORD *)a1 + 116) & 0x1000) != 0)
      {
        v3 = CPStartAnInhibitor();
        sqlite3_close(*(sqlite3 **)(a1 + 8));
        if (v3)
          CPStopInhibitorWithIdentifier(v3);
      }
      else
      {
        sqlite3_close(v2);
      }
    }
    v4 = *(void (**)(_QWORD))(a1 + 40);
    if (v4)
      v4(*(_QWORD *)(a1 + 32));
    free((void *)a1);
  }
}

const void *CPSqliteDatabaseStatementForReading(uint64_t a1, const __CFString *a2)
{
  CFMutableDictionaryRef *v3;
  CFMutableDictionaryRef *v4;
  const void *v5;
  CFMutableDictionaryRef v6;

  v3 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, (*(unsigned __int16 *)(a1 + 116) >> 1) & 1, 0, 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(v3, a2, 0);
  v6 = *v4;
  if (*v4 && (*((_WORD *)v6 + 58) & 8) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v6 + 120));
  return v5;
}

const void *CPSqliteConnectionStatementForSQL(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  return CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, a2, 0);
}

const void *CPSqliteDatabaseStatementForWriting(uint64_t a1, const __CFString *a2)
{
  CFMutableDictionaryRef *v3;
  CFMutableDictionaryRef *v4;
  const void *v5;
  CFMutableDictionaryRef v6;

  v3 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(v3, a2, 0);
  v6 = *v4;
  if (*v4 && (*((_WORD *)v6 + 58) & 8) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v6 + 120));
  return v5;
}

uint64_t **CPSqliteDatabaseReleaseSqliteStatement(uint64_t **result)
{
  uint64_t v1;

  if (result)
  {
    if (*result)
    {
      v1 = **result;
      if (v1)
      {
        if ((*(_WORD *)(v1 + 116) & 8) != 0)
          return (uint64_t **)pthread_mutex_unlock((pthread_mutex_t *)(v1 + 120));
      }
    }
  }
  return result;
}

CFStringRef CPSqliteDatabaseCopyUniqueIdentifier(uint64_t a1)
{
  return CPSqliteDatabaseCopyValueForProperty(a1, CFSTR("_UniqueIdentifier"));
}

CFStringRef CPSqliteDatabaseCopyValueForProperty(uint64_t a1, const __CFString *a2)
{
  CFMutableDictionaryRef *v3;
  CFMutableDictionaryRef *v4;
  CFStringRef v5;
  CFMutableDictionaryRef v6;

  v3 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, (*(unsigned __int16 *)(a1 + 116) >> 1) & 1, 0, 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CPSqliteConnectionCopyValueForProperty(v3, a2);
  v6 = *v4;
  if (*v4 && (*((_WORD *)v6 + 58) & 8) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v6 + 120));
  return v5;
}

CFStringRef CPSqliteConnectionCopyValueForProperty(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  const void *v3;
  uint64_t v4;
  UInt8 *v5;
  CFStringRef v6;

  if (!a1 || *a1 && (*((_WORD *)*a1 + 58) & 4) != 0)
    return 0;
  v3 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, CFSTR("SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;"),
         0);
  if (!v3)
    return 0;
  v4 = (uint64_t)v3;
  v5 = _CPCreateUTF8StringFromCFString(a2);
  sqlite3_bind_text(*(sqlite3_stmt **)(v4 + 8), 1, (const char *)v5, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  v6 = CPSqliteStatementCopyStringResult(v4);
  CPSqliteStatementReset(v4);
  return v6;
}

uint64_t CPSqliteDatabaseSetValueForProperty(uint64_t a1, const __CFString *a2, UInt8 *a3)
{
  CFMutableDictionaryRef *v5;
  CFMutableDictionaryRef *v6;
  uint64_t v7;
  CFMutableDictionaryRef v8;

  v5 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
  if (!v5)
    return 1;
  v6 = v5;
  v7 = CPSqliteConnectionSetValueForProperty(v5, a2, a3);
  v8 = *v6;
  if (*v6 && (*((_WORD *)v8 + 58) & 8) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v8 + 120));
  return v7;
}

uint64_t CPSqliteConnectionSetValueForProperty(CFMutableDictionaryRef *a1, const __CFString *a2, UInt8 *a3)
{
  uint64_t v3;
  const void *v7;
  uint64_t v8;
  char *v9;
  __CFDictionary *v10;
  const void *v11;

  v3 = 1;
  if (a1 && a2 && (!*a1 || (*((_WORD *)*a1 + 58) & 4) == 0))
  {
    v7 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
           0);
    if (v7)
    {
      v8 = (uint64_t)v7;
      v9 = (char *)_CPCreateUTF8StringFromCFString(a2);
      if (a3)
        a3 = _CPCreateUTF8StringFromCFString((const __CFString *)a3);
      v3 = _performSetStringPropertyStatement(v8, v9, (const char *)a3);
      if ((_DWORD)v3 == 17)
      {
        v10 = a1[2];
        if (v10
          && (CFDictionaryRemoveValue(v10, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);")),
              (v11 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
                       0)) != 0))
        {
          v3 = _performSetStringPropertyStatement((uint64_t)v11, v9, (const char *)a3);
        }
        else
        {
          v3 = 17;
        }
      }
      free(v9);
      if (a3)
        free(a3);
    }
  }
  return v3;
}

uint64_t CPSqliteDatabaseRemoveProperty(uint64_t a1, const __CFString *a2)
{
  CFMutableDictionaryRef *v3;
  CFMutableDictionaryRef *v4;
  uint64_t v5;
  CFMutableDictionaryRef v6;

  v3 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
  if (!v3)
    return 1;
  v4 = v3;
  v5 = CPSqliteConnectionRemoveProperty(v3, a2);
  v6 = *v4;
  if (*v4 && (*((_WORD *)v6 + 58) & 8) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v6 + 120));
  return v5;
}

uint64_t CPSqliteConnectionRemoveProperty(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  uint64_t v2;
  const void *v5;
  uint64_t v6;
  char *v7;
  __CFDictionary *v8;
  const void *v9;

  v2 = 1;
  if (a1 && a2 && (!*a1 || (*((_WORD *)*a1 + 58) & 4) == 0))
  {
    v5 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, CFSTR("DELETE FROM _SqliteDatabaseProperties WHERE key = ?;"),
           0);
    if (v5)
    {
      v6 = (uint64_t)v5;
      v7 = (char *)_CPCreateUTF8StringFromCFString(a2);
      v2 = _performRemovePropertyStatement(v6, v7);
      if ((_DWORD)v2 == 17)
      {
        v8 = a1[2];
        if (v8
          && (CFDictionaryRemoveValue(v8, CFSTR("DELETE FROM _SqliteDatabaseProperties WHERE key = ?;")),
              (v9 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, CFSTR("DELETE FROM _SqliteDatabaseProperties WHERE key = ?;"),
                      0)) != 0))
        {
          v2 = _performRemovePropertyStatement((uint64_t)v9, v7);
        }
        else
        {
          v2 = 17;
        }
      }
      free(v7);
    }
  }
  return v2;
}

uint64_t CPSqliteDatabaseRegisterFunction(uint64_t a1, const char *a2, void (__cdecl *a3)(sqlite3_context *, int, sqlite3_value **), int a4, void *a5)
{
  uint64_t v9;
  uint64_t *v10;
  uint64_t function;
  uint64_t v12;

  v9 = _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
  if (!v9)
    return 1;
  v10 = (uint64_t *)v9;
  function = sqlite3_create_function(*(sqlite3 **)(v9 + 8), a2, a4, 1, a5, a3, 0, 0);
  v12 = *v10;
  if (*v10 && (*(_WORD *)(v12 + 116) & 8) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)(v12 + 120));
  return function;
}

uint64_t CPSqliteDatabaseSetProfileCallback(uint64_t a1, void (__cdecl *a2)(void *, const char *, sqlite3_uint64))
{
  return CPSqliteDatabaseSetProfileCallbackWithContext(a1, a2, 0);
}

uint64_t CPSqliteDatabaseSetProfileCallbackWithContext(uint64_t result, void (__cdecl *a2)(void *, const char *, sqlite3_uint64), void *a3)
{
  uint64_t *v5;
  uint64_t v6;

  if (result)
  {
    result = _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(result, 0, 0, 0);
    if (result)
    {
      v5 = (uint64_t *)result;
      result = (uint64_t)sqlite3_profile(*(sqlite3 **)(result + 8), a2, a3);
      v6 = *v5;
      if (*v5)
      {
        if ((*(_WORD *)(v6 + 116) & 8) != 0)
          return pthread_mutex_unlock((pthread_mutex_t *)(v6 + 120));
      }
    }
  }
  return result;
}

uint64_t CPSqliteDatabaseSetLoggingEnabled(uint64_t a1, int a2)
{
  int v4;
  int v5;
  void (__cdecl *v6)(void *, const char *, sqlite3_uint64);

  v4 = _debugLoggingEnabled();
  if (__debugLoggingForced == -1)
  {
    __debugLoggingForced = getenv("CPSQLDEBUG") != 0;
    if (__debugLoggingForced)
      goto LABEL_3;
  }
  else if (__debugLoggingForced)
  {
    goto LABEL_3;
  }
  __debugLoggingEnabled = a2 != 0;
LABEL_3:
  v5 = _debugLoggingEnabled();
  if (v5 != v4)
  {
    if (v5)
      v6 = (void (__cdecl *)(void *, const char *, sqlite3_uint64))CPSqliteDatabaseDefaultProfileCallback;
    else
      v6 = 0;
    CPSqliteDatabaseSetProfileCallbackWithContext(a1, v6, 0);
  }
  return 0;
}

void CPSqliteDatabaseDefaultProfileCallback(uint64_t a1, const char *a2, unint64_t a3)
{
  syslog(4, "==\nCPSqlite: %s\nTime: %llu ms\n", a2, a3 >> 20);
}

void *CPSqliteSetupLoggingForDatabaseHandle(sqlite3 *a1)
{
  void *result;

  result = (void *)_debugLoggingEnabled();
  if (a1)
  {
    if ((_DWORD)result)
      return sqlite3_profile(a1, (void (__cdecl *)(void *, const char *, sqlite3_uint64))CPSqliteDatabaseDefaultProfileCallback, 0);
  }
  return result;
}

uint64_t CPSqliteDatabaseSetBusyHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 216) = a2;
    *(_QWORD *)(result + 224) = a3;
  }
  return result;
}

void CPSqliteRegisterYieldNotifyBlock(uint64_t a1, void *aBlock)
{
  const void *v3;
  void *v4;

  if (a1)
  {
    v3 = *(const void **)(a1 + 240);
    if (aBlock)
      v4 = _Block_copy(aBlock);
    else
      v4 = 0;
    *(_QWORD *)(a1 + 240) = v4;
    if (v3)
      _Block_release(v3);
  }
}

uint64_t CPSqliteDatabaseUnlockRequested(uint64_t result)
{
  if (result)
    return (*(unsigned __int16 *)(result + 116) >> 9) & 1;
  return result;
}

uint64_t CPSqliteDatabaseSetShouldRequestUnlock(uint64_t result, int a2)
{
  __int16 v2;

  if (result)
  {
    if (a2)
      v2 = 16;
    else
      v2 = 0;
    *(_WORD *)(result + 116) = *(_WORD *)(result + 116) & 0xFFEF | v2;
  }
  return result;
}

void CPSqliteDatabaseSetShouldYieldWhenRequested(uint64_t a1, int a2)
{
  __int16 v3;
  __int16 v4;
  char *NotifyName;
  NSObject *global_queue;
  _QWORD handler[5];

  if (a1)
  {
    if (a2)
      v3 = 32;
    else
      v3 = 0;
    v4 = *(_WORD *)(a1 + 116) & 0xFFDF | v3;
    *(_WORD *)(a1 + 116) = v4;
    if ((v4 & 0x60) == 0x20)
    {
      *(_WORD *)(a1 + 116) = v4 | 0x40;
      NotifyName = createNotifyName((const __CFString **)a1);
      global_queue = dispatch_get_global_queue(2, 0);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 0x40000000;
      handler[2] = __updateNotifyRegistration_block_invoke;
      handler[3] = &__block_descriptor_tmp;
      handler[4] = a1;
      if (!notify_register_dispatch(NotifyName, (int *)(a1 + 232), global_queue, handler))
        *(_WORD *)(a1 + 116) |= 0x80u;
      free(NotifyName);
    }
    else if ((v4 & 0xA0) == 0x80)
    {
      notify_cancel(*(_DWORD *)(a1 + 232));
      *(_WORD *)(a1 + 116) &= 0xFF3Fu;
      *(_DWORD *)(a1 + 232) = 0;
    }
  }
}

void CPSqliteDatabaseRequestUnlock(uint64_t a1)
{
  double Current;
  double v3;
  char *NotifyName;

  if (a1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v3 = Current - *(double *)(a1 + 272);
    if (v3 < 0.0 || v3 > 1.0)
    {
      *(double *)(a1 + 272) = Current;
      NotifyName = createNotifyName((const __CFString **)a1);
      notify_post(NotifyName);
      *(_WORD *)(a1 + 116) |= 0x100u;
      free(NotifyName);
    }
  }
}

char *createNotifyName(const __CFString **a1)
{
  UInt8 *v1;
  char *v3;

  v1 = _CPCreateUTF8StringFromCFString(*a1);
  v3 = 0;
  asprintf(&v3, "com.apple.AppSupport-%s", (const char *)v1);
  free(v1);
  return v3;
}

sqlite3_stmt *CPSqlitePreparedStatement(uint64_t *a1, char *zSql, int a3)
{
  sqlite3 *v4;
  int v7;
  sqlite3_stmt *v8;
  const char *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t, char *, const char *);
  uint64_t v12;
  char *v14;
  char *v15;
  char *v16;
  const __CFString *v17;
  UInt8 *v18;
  int v19;
  _QWORD v21[2];
  uint64_t v22;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (!a1)
    return 0;
  v4 = (sqlite3 *)a1[1];
  if (!v4)
    return 0;
  do
    v7 = sqlite3_prepare_v2(v4, zSql, -1, &ppStmt, 0);
  while ((v7 - 5) < 2);
  v8 = ppStmt;
  if (v7 || !ppStmt)
  {
    if (!a3)
    {
      v9 = sqlite3_errmsg(v4);
      syslog(4, "%sCould not compile statement %s: %s\n", "warning: ", zSql, v9);
      v10 = *a1;
      if (*a1)
      {
        v11 = *(void (**)(uint64_t, uint64_t *, uint64_t, char *, const char *))(v10 + 296);
        if (v11)
        {
          v12 = sqlite3_errcode(v4);
          v11(v10, a1, v12, zSql, v9);
        }
      }
      v8 = ppStmt;
    }
    if (!v8)
      return v8;
    sqlite3_finalize(v8);
    return 0;
  }
  if ((CPSqlitePreparedStatement_checkedEnv & 1) != 0)
  {
    if (!(_BYTE)CPSqlitePreparedStatement_sExplainSettings)
      return v8;
  }
  else
  {
    CPSqlitePreparedStatement_checkedEnv = 1;
    v14 = getenv("CPSQLEXPLAIN");
    BYTE1(CPSqlitePreparedStatement_sExplainSettings) = v14 != 0;
    v15 = getenv("CPSQLEXPLAIN_TABLES");
    HIBYTE(CPSqlitePreparedStatement_sExplainSettings) = v15 != 0;
    v16 = getenv("CPSQLEXPLAIN_ONLY_NON_INDEXED");
    BYTE2(CPSqlitePreparedStatement_sExplainSettings) = v16 != 0;
    HIBYTE(CPSqlitePreparedStatement_sExplainSettings) = ((unint64_t)v15 | (unint64_t)v16) != 0;
    LOBYTE(CPSqlitePreparedStatement_sExplainSettings) = ((unint64_t)v14 | (unint64_t)v15 | (unint64_t)v16) != 0;
    if (!((unint64_t)v14 | (unint64_t)v15 | (unint64_t)v16))
      return v8;
  }
  v21[1] = zSql;
  v22 = 0;
  v21[0] = CPSqlitePreparedStatement_sExplainSettings;
  v17 = CFStringCreateWithFormat(0, 0, CFSTR("EXPLAIN QUERY PLAN %s"), zSql);
  v18 = _CPCreateUTF8StringFromCFString(v17);
  sqlite3_exec(v4, (const char *)v18, (int (__cdecl *)(void *, int, char **, char **))ExplainQueryPlanCallback, v21, 0);
  free(v18);
  if (v17)
    CFRelease(v17);
  if (HIDWORD(v22))
  {
    syslog(4, "----------------------------\n");
    v19 = HIDWORD(v22)--;
    if (v19 >= 2)
    {
      do
        syslog(4, "\n");
      while (HIDWORD(v22)-- > 1);
    }
  }
  return ppStmt;
}

uint64_t ExplainQueryPlanCallback(uint64_t a1, int a2, char **a3, const char **a4)
{
  int v8;
  uint64_t v9;
  char *v10;
  const char *v11;

  v8 = *(unsigned __int8 *)(a1 + 16);
  if (!*(_BYTE *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 1))
    {
      syslog(4, "----- Explaining Query -----\n%s\n", *(const char **)(a1 + 8));
      v8 = 1;
      *(_BYTE *)(a1 + 16) = 1;
      *(_DWORD *)(a1 + 20) = 1;
    }
    else
    {
      v8 = 0;
    }
  }
  if (a2 >= 1)
  {
    v9 = a2;
    while (strcmp(*a4, "detail"))
    {
      ++a3;
      ++a4;
      if (!--v9)
        return 0;
    }
    v10 = *a3;
    if (!strstr(*a3, "WITH INDEX") && !strstr(v10, "USING PRIMARY KEY"))
    {
      if (*(_BYTE *)(a1 + 2))
        v11 = " ***** NO INDEX *****";
      else
        v11 = "";
      if (!v8 && *(_BYTE *)(a1 + 2) && !*(_BYTE *)(a1 + 1))
      {
        syslog(4, "--------------------------\n !!!!! NOT INDEXED !!!!!\n--------------------------\n%s\n--------------------------\n", *(const char **)(a1 + 8));
        *(_BYTE *)(a1 + 16) = 1;
        *(_DWORD *)(a1 + 20) = 2;
        v10 = *a3;
      }
      goto LABEL_14;
    }
    v11 = "";
    if (!*(_BYTE *)(a1 + 2) || v8)
LABEL_14:
      syslog(4, " ==>>%s %s\n", v11, v10);
  }
  return 0;
}

const void *CPSqliteConnectionStatementForSQLAndIgnoreErrors(CFMutableDictionaryRef *a1, const __CFString *key, int a3)
{
  const __CFDictionary *v6;
  CFMutableDictionaryRef *v7;
  const void *Value;
  CFMutableDictionaryRef *v9;
  const void *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex v13;
  const void **v14;
  const void **v15;
  const void **v16;
  const void **v17;
  const void *v18;
  double *v19;
  uint32_t v20;
  double v21;
  uint32_t v22;
  uint64_t v23;
  double *v24;
  double v25;
  _QWORD *v26;
  CFDictionaryValueCallBacks v28;

  if (!a1)
    return 0;
  v7 = a1 + 2;
  v6 = a1[2];
  if (!v6)
  {
    *(_OWORD *)&v28.version = 0uLL;
    v28.copyDescription = 0;
    v28.equal = 0;
    v28.release = (CFDictionaryReleaseCallBack)CPSqliteStatementFinalize;
    v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], &v28);
    *v7 = v6;
  }
  if (*((int *)*a1 + 72) >= 1 && !a1[3])
  {
    memset(&v28, 0, sizeof(v28));
    a1[3] = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], &v28);
    v6 = a1[2];
  }
  Value = CFDictionaryGetValue(v6, key);
  if (!Value)
  {
    if (!*((_DWORD *)*a1 + 72))
    {
      Value = CPSqliteStatementForSQLUncachedAndIgnoreErrors((uint64_t *)a1, key, a3);
      if (!Value)
        return Value;
      goto LABEL_32;
    }
    v9 = a1 + 3;
    v10 = CFDictionaryGetValue(a1[3], key);
    if (v10)
    {
      Value = v10;
      CFDictionaryRemoveValue(*v9, key);
LABEL_32:
      CFDictionarySetValue(*v7, key, Value);
      return Value;
    }
    Value = CPSqliteStatementForSQLUncachedAndIgnoreErrors((uint64_t *)a1, key, a3);
    if (Value)
    {
      Count = CFDictionaryGetCount(a1[3]);
      v12 = *((unsigned int *)*a1 + 72);
      if ((int)v12 >= 1)
      {
        v13 = Count;
        if (Count >= v12)
        {
          v14 = (const void **)malloc_type_malloc(8 * Count, 0x10040436913F5uLL);
          if (v14)
          {
            v15 = v14;
            v16 = (const void **)malloc_type_malloc(8 * v13, 0x2004093837F09uLL);
            if (v16)
            {
              v17 = v16;
              CFDictionaryGetKeysAndValues(*v9, v15, v16);
              v18 = *v15;
              v19 = (double *)*v17;
              v20 = arc4random_uniform(v13);
              v21 = CPMachAbsoluteTime();
              v22 = v20;
              while (1)
              {
                v23 = v22;
                v24 = (double *)v17[v22];
                v25 = v24[2];
                if (v21 - v25 > 300.0)
                  break;
                if (v25 < v19[2])
                {
                  v18 = v15[v23];
                  v19 = v24;
                }
                if (v13 == (_DWORD)v23 + 1)
                  v22 = 0;
                else
                  v22 = v23 + 1;
                if (v22 == v20)
                  goto LABEL_29;
              }
              v18 = v15[v23];
LABEL_29:
              v26 = CFDictionaryGetValue(*v9, v18);
              CPSqliteStatementFinalize((int)v26, v26);
              CFDictionaryRemoveValue(*v9, v18);
              free(v17);
            }
            free(v15);
          }
        }
      }
      v7 = v9;
      goto LABEL_32;
    }
  }
  return Value;
}

uint64_t CPSqliteConnectionPerformSQL(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, a2, 0);
  if (!v2)
    return 1;
  v3 = (uint64_t)v2;
  v4 = CPSqliteStatementPerform((uint64_t)v2);
  CPSqliteStatementReset(v3);
  return v4;
}

uint64_t CPSqliteStatementPerform(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (!a1 || !*(_QWORD *)(a1 + 8))
    return 1;
  v2 = CPSqliteStatementStep(a1);
  v3 = **(_QWORD **)a1;
  v4 = (*(_WORD *)(v3 + 116) & 2) != 0 && *(_QWORD *)(v3 + 8) == 0;
  checkResultWithStatement((_QWORD *)v3, v4, *(sqlite3 **)(*(_QWORD *)a1 + 8), v2, (uint64_t)"CPSqliteStatementPerform", a1);
  return v2;
}

uint64_t CPSqliteStatementReset(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  sqlite3 *v6;
  unsigned int v7;

  if (!a1)
    return 1;
  v2 = *(sqlite3_stmt **)(a1 + 8);
  if (!v2)
    return 1;
  v3 = sqlite3_reset(v2);
  v4 = **(_QWORD **)a1;
  v5 = (*(_WORD *)(v4 + 116) & 2) != 0 && *(_QWORD *)(v4 + 8) == 0;
  v6 = *(sqlite3 **)(*(_QWORD *)a1 + 8);
  v7 = sqlite3_errcode(v6);
  checkResultWithStatement((_QWORD *)v4, v5, v6, v7, (uint64_t)"CPSqliteStatementReset", a1);
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 8));
  return v3;
}

void CPSqliteConnectionFlushStatementCache(uint64_t a1)
{
  const void *v2;
  const __CFDictionary *v3;
  CFIndex Count;
  const void **v5;
  int v6;
  const void **v7;
  _QWORD *v8;

  if (a1)
  {
    v2 = *(const void **)(a1 + 16);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 16) = 0;
    }
    v3 = *(const __CFDictionary **)(a1 + 24);
    if (v3)
    {
      Count = CFDictionaryGetCount(v3);
      v5 = (const void **)malloc_type_malloc(8 * Count, 0x2004093837F09uLL);
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 24), 0, v5);
      CFRelease(*(CFTypeRef *)(a1 + 24));
      *(_QWORD *)(a1 + 24) = 0;
      if (Count >= 1)
      {
        v7 = v5;
        do
        {
          v8 = *v7++;
          CPSqliteStatementFinalize(v6, v8);
          --Count;
        }
        while (Count);
      }
      free(v5);
    }
  }
}

void CPSqliteStatementFinalize(int a1, _QWORD *a2)
{
  sqlite3_stmt *v3;

  if (a2)
  {
    v3 = (sqlite3_stmt *)a2[1];
    if (v3)
      sqlite3_finalize(v3);
  }
  free(a2);
}

uint64_t CPSqliteConnectionBeginTransactionType(uint64_t a1, unsigned int a2)
{
  CFMutableDictionaryRef v4;
  int v5;
  __int16 v6;
  uint64_t result;
  const __CFString *v8;
  BOOL v9;
  int v10;

  if (!a1)
    return 1;
  if (*(_DWORD *)(a1 + 64) != 0xFFFF)
    return 0;
  v4 = *(CFMutableDictionaryRef *)a1;
  if (*(_QWORD *)a1)
  {
    if (sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8)))
    {
      v5 = *((unsigned __int16 *)v4 + 58);
      if ((~v5 & 0x220) == 0)
      {
        if ((v5 & 0x100) != 0)
        {
          v6 = v5 & 0xFEFF;
        }
        else
        {
          usleep(0xF4240u);
          v6 = *((_WORD *)v4 + 58);
        }
        *((_WORD *)v4 + 58) = v6 & 0xFDFF;
      }
    }
  }
  if (a2 > 2)
  {
    result = 0;
  }
  else
  {
    v8 = off_1E2881460[a2];
    result = sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8));
    if ((_DWORD)result)
      result = _performSqlUsingConnection((CFMutableDictionaryRef *)a1, v8);
  }
  if ((_DWORD)result)
    v9 = (_DWORD)result == 101;
  else
    v9 = 1;
  v10 = v9;
  if (a2 != 0xFFFF)
  {
    if (v10)
      *(_DWORD *)(a1 + 64) = a2;
  }
  return result;
}

uint64_t _performSqlUsingConnection(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  _QWORD *v2;
  uint64_t v3;
  int v4;

  v2 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, a2, 0);
  if (!v2)
    return 1;
  v3 = (uint64_t)v2;
  if (!v2[1])
    return 1;
  v4 = CPSqliteStatementPerform((uint64_t)v2);
  CPSqliteStatementReset(v3);
  if (v4 == 101)
    return 101;
  else
    return sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)v3 + 8));
}

uint64_t CPSqliteConnectionGetActiveTransactionType(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 64);
  else
    return 0xFFFFLL;
}

uint64_t CPSqliteConnectionBegin(uint64_t a1)
{
  return CPSqliteConnectionBeginTransactionType(a1, 0);
}

uint64_t CPSqliteConnectionCommit(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 1;
  result = _performSqlUsingConnection((CFMutableDictionaryRef *)a1, CFSTR("COMMIT;"));
  *(_DWORD *)(a1 + 64) = 0xFFFF;
  return result;
}

uint64_t CPSqliteConnectionRollback(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 1;
  if (sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8)))
    return 0;
  result = _performSqlUsingConnection((CFMutableDictionaryRef *)a1, CFSTR("ROLLBACK;"));
  *(_DWORD *)(a1 + 64) = 0xFFFF;
  return result;
}

BOOL CPSqliteConnectionShouldCacheStatements(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 68) != 0;
  return result;
}

uint64_t CPSqliteConnectionSetShouldCacheStatements(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 68) = a2;
  return result;
}

void CPSqliteStatementBindValuesForColumns(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  sqlite3_stmt *v5;
  int v6;
  uint64_t v7;

  if (a1 && a3)
  {
    v5 = *(sqlite3_stmt **)(a1 + 8);
    v6 = a4 + 1;
    v7 = a3;
    do
    {
      _bindColumnValueAtIndex(v5, a2, v6);
      a2 += 24;
      ++v6;
      --v7;
    }
    while (v7);
  }
}

void _bindColumnValueAtIndex(sqlite3_stmt *a1, uint64_t a2, int a3)
{
  const __CFString *v6;
  UInt8 *v7;
  const __CFData *v8;
  const UInt8 *BytePtr;
  int Length;
  double v11;
  const __CFNumber *v12;
  double valuePtr;

  switch(*(_DWORD *)(a2 + 8))
  {
    case 0:
      sqlite3_bind_int(a1, a3, *(_DWORD *)(a2 + 16));
      return;
    case 1:
      sqlite3_bind_int64(a1, a3, *(_QWORD *)(a2 + 16));
      return;
    case 2:
      v6 = *(const __CFString **)(a2 + 16);
      if (!v6)
        goto LABEL_16;
      v7 = _CPCreateUTF8StringFromCFString(v6);
      sqlite3_bind_text(a1, a3, (const char *)v7, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
      return;
    case 3:
    case 5:
      syslog(4, "%s does not handle raw data types yet.", "void _bindColumnValueAtIndex(sqlite3_stmt *, CPWriteColumnDescriptor *, unsigned int)");
      return;
    case 4:
      v8 = *(const __CFData **)(a2 + 16);
      if (!v8)
        goto LABEL_16;
      BytePtr = CFDataGetBytePtr(v8);
      Length = CFDataGetLength(*(CFDataRef *)(a2 + 16));
      sqlite3_bind_blob(a1, a3, BytePtr, Length, 0);
      return;
    case 6:
      v11 = *(float *)(a2 + 16);
      goto LABEL_15;
    case 7:
      v12 = *(const __CFNumber **)(a2 + 16);
      if (!v12)
        goto LABEL_16;
      valuePtr = 0.0;
      if (CFNumberIsFloatType(v12))
      {
        CFNumberGetValue(*(CFNumberRef *)(a2 + 16), kCFNumberDoubleType, &valuePtr);
        sqlite3_bind_double(a1, a3, valuePtr);
      }
      else
      {
        CFNumberGetValue(*(CFNumberRef *)(a2 + 16), kCFNumberSInt64Type, &valuePtr);
        sqlite3_bind_int64(a1, a3, *(sqlite3_int64 *)&valuePtr);
      }
      break;
    case 8:
      if (*(_QWORD *)(a2 + 16))
      {
        v11 = MEMORY[0x193FF67C4]();
LABEL_15:
        sqlite3_bind_double(a1, a3, v11);
      }
      else
      {
LABEL_16:
        sqlite3_bind_null(a1, a3);
      }
      break;
    default:
      return;
  }
}

uint64_t CPSqliteConnectionAddRecord(CFMutableDictionaryRef *a1, const __CFString *a2, const char **a3, unsigned int a4)
{
  return CPSqliteConnectionAddRecordWithRowid(a1, a2, -1, a3, a4);
}

uint64_t CPSqliteConnectionAddRecordWithRowid(CFMutableDictionaryRef *a1, const __CFString *a2, sqlite3_int64 a3, const char **a4, unsigned int a5)
{
  const char **v9;
  _BOOL4 v11;
  CFMutableStringRef v12;
  const char *v13;
  const __CFAllocator *v14;
  CFMutableStringRef Mutable;
  CFMutableStringRef v16;
  sqlite3_stmt **v17;
  void *v18;
  const __CFString *v19;
  const char **v20;
  uint64_t v21;
  const __CFString *v22;
  CFMutableStringRef MutableCopy;
  const void *v24;
  uint64_t v25;
  sqlite3_stmt *v26;
  uint64_t v27;
  sqlite3_stmt *v28;
  CFMutableStringRef v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v37;

  if (!a1)
    return 1;
  if (a5)
  {
    v9 = a4;
    v11 = a3 == -1 && a5 < 3;
    if (v11)
    {
      if (a5 == 1)
        v12 = CFSTR("?");
      else
        v12 = CFSTR("?, ?");
      v13 = *a4;
      v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    }
    else
    {
      v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v12 = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      CFStringAppend(v12, CFSTR("?"));
      v13 = *v9;
      Mutable = CFStringCreateMutable(v14, 0);
      if (a3 != -1)
      {
        CFStringAppend(v12, CFSTR(", ?"));
        CFStringAppend(Mutable, CFSTR("ROWID, "));
      }
    }
    v19 = CFStringCreateWithCString(v14, v13, 0x8000100u);
    CFStringAppend(Mutable, v19);
    CFRelease(v19);
    v37 = a5;
    if (a5 >= 2)
    {
      v20 = v9 + 3;
      v21 = a5 - 1;
      do
      {
        v22 = CFStringCreateWithCString(v14, *v20, 0x8000100u);
        CFStringAppend(Mutable, CFSTR(", "));
        CFStringAppend(Mutable, v22);
        CFRelease(v22);
        if (!v11)
          CFStringAppend(v12, CFSTR(", ?"));
        v20 += 3;
        --v21;
      }
      while (v21);
    }
    MutableCopy = CFStringCreateMutableCopy(0, 0, CFSTR("INSERT INTO "));
    CFStringAppend(MutableCopy, a2);
    CFStringAppend(MutableCopy, CFSTR(" ("));
    CFStringAppend(MutableCopy, Mutable);
    CFStringAppend(MutableCopy, CFSTR(") VALUES ("));
    CFStringAppend(MutableCopy, v12);
    CFStringAppend(MutableCopy, CFSTR(");"));
    v24 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, MutableCopy, 0);
    if (v24)
    {
      v25 = (uint64_t)v24;
      v26 = (sqlite3_stmt *)*((_QWORD *)v24 + 1);
      if (a3 == -1)
      {
        v30 = 0;
        do
        {
          _bindColumnValueAtIndex(v26, (uint64_t)v9, ++v30);
          v9 += 3;
        }
        while (v37 != v30);
      }
      else
      {
        sqlite3_bind_int64(*((sqlite3_stmt **)v24 + 1), 1, a3);
        v27 = 0;
        v28 = *(sqlite3_stmt **)(v25 + 8);
        do
        {
          _bindColumnValueAtIndex(v28, (uint64_t)v9, v27++ + 2);
          v9 += 3;
        }
        while (v37 != v27);
      }
      v31 = CPSqliteStatementPerform(v25);
      CPSqliteStatementReset(v25);
      CFRelease(MutableCopy);
      CFRelease(Mutable);
      if (!v11)
        CFRelease(v12);
      return v31;
    }
    if (v12)
      CFRelease(v12);
    if (Mutable)
      CFRelease(Mutable);
    if (MutableCopy)
    {
      v29 = MutableCopy;
LABEL_43:
      CFRelease(v29);
      return 1;
    }
    return 1;
  }
  v16 = CFStringCreateMutableCopy(0, 0, CFSTR("INSERT INTO "));
  CFStringAppend(v16, a2);
  if (a3 == -1)
  {
    CFStringAppend(v16, CFSTR(" (ROWID) VALUES(NULL);"));
    v18 = (void *)CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, v16, 0);
    if (v18)
      goto LABEL_40;
  }
  else
  {
    CFStringAppend(v16, CFSTR(" (ROWID) VALUES(?);"));
    v17 = (sqlite3_stmt **)CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, v16, 0);
    if (v17)
    {
      v18 = v17;
      sqlite3_bind_int64(v17[1], 1, a3);
LABEL_40:
      v32 = CPSqliteStatementPerform((uint64_t)v18);
      CPSqliteStatementReset((uint64_t)v18);
      CFRelease(v16);
      return v32;
    }
  }
  if (v16)
  {
    v29 = v16;
    goto LABEL_43;
  }
  return 1;
}

uint64_t CPSqliteConnectionUpdateRecord(CFMutableDictionaryRef *a1, const __CFString *a2, sqlite3_int64 a3, __int128 *a4, unsigned int a5)
{
  uint64_t v5;
  const __CFAllocator *v10;
  CFMutableStringRef Mutable;
  uint64_t v12;
  const __CFString *v13;
  const void *v14;
  uint64_t v15;
  sqlite3_stmt *v16;
  __int128 v19;
  uint64_t v20;

  v5 = 1;
  if (a1 && a5)
  {
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    CFStringAppend(Mutable, CFSTR("UPDATE "));
    CFStringAppend(Mutable, a2);
    CFStringAppend(Mutable, CFSTR(" SET "));
    v12 = 0;
    do
    {
      v13 = CFStringCreateWithCString(v10, *(const char **)((char *)a4 + v12), 0x8000100u);
      if (v12)
        CFStringAppend(Mutable, CFSTR(", "));
      CFStringAppend(Mutable, v13);
      CFStringAppend(Mutable, CFSTR(" = ?"));
      CFRelease(v13);
      v12 += 24;
    }
    while (24 * a5 != v12);
    CFStringAppend(Mutable, CFSTR(" WHERE ROWID = ?;"));
    v14 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, Mutable, 0);
    CFRelease(Mutable);
    if (v14)
    {
      v15 = 0;
      v16 = (sqlite3_stmt *)*((_QWORD *)v14 + 1);
      do
      {
        v19 = *a4;
        v20 = *((_QWORD *)a4 + 2);
        _bindColumnValueAtIndex(v16, (uint64_t)&v19, ++v15);
        a4 = (__int128 *)((char *)a4 + 24);
      }
      while (a5 != v15);
      sqlite3_bind_int64(v16, v15 + 1, a3);
      v5 = CPSqliteStatementPerform((uint64_t)v14);
      CPSqliteStatementReset((uint64_t)v14);
    }
    else
    {
      return 1;
    }
  }
  return v5;
}

CFStringRef CPSqliteStatementCopyStringResult(uint64_t a1)
{
  const unsigned __int8 *v2;

  if (a1
    && *(_QWORD *)(a1 + 8)
    && CPSqliteStatementStep(a1) == 100
    && (v2 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0)) != 0)
  {
    return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const char *)v2, 0x8000100u);
  }
  else
  {
    return 0;
  }
}

CFMutableDictionaryRef *CPSqliteConnectionCopyValuesForPropertiesLike(CFMutableDictionaryRef *result, const __CFString *a2, __CFArray **a3, __CFArray **a4)
{
  sqlite3_stmt **v7;
  UInt8 *v8;
  __CFArray *v9;
  __CFArray *Mutable;
  const __CFAllocator *v11;
  const void *v12;
  const CFArrayCallBacks *v13;
  int v14;
  const unsigned __int8 *v15;
  CFStringRef v16;
  const void *v17;
  const unsigned __int8 *v18;
  CFStringRef v19;
  const void *v20;
  const char *v21;

  if (!result || *result && (*((_WORD *)*result + 58) & 4) != 0)
    return result;
  result = (CFMutableDictionaryRef *)CPSqliteConnectionStatementForSQLAndIgnoreErrors(result, CFSTR("SELECT key, value FROM _SqliteDatabaseProperties WHERE key LIKE ?;"),
                                       0);
  if (!result)
    return result;
  v7 = result;
  v8 = _CPCreateUTF8StringFromCFString(a2);
  sqlite3_bind_text(v7[1], 1, (const char *)v8, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  v9 = 0;
  Mutable = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v12 = (const void *)*MEMORY[0x1E0C9B0D0];
  v13 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  while (1)
  {
    v14 = CPSqliteStatementStep((uint64_t)v7);
    if (v14 != 100)
      break;
    if (!a3)
      goto LABEL_19;
    v15 = sqlite3_column_text(v7[1], 0);
    if (v15)
      v16 = CFStringCreateWithCString(v11, (const char *)v15, 0x8000100u);
    else
      v16 = 0;
    if ((unint64_t)a4 | (unint64_t)v16)
    {
      if (!Mutable)
        Mutable = CFArrayCreateMutable(v11, 0, v13);
      if (v16)
        v17 = v16;
      else
        v17 = v12;
      CFArrayAppendValue(Mutable, v17);
      if (v16)
        CFRelease(v16);
LABEL_19:
      if (a4)
      {
        v18 = sqlite3_column_text(v7[1], 1);
        v19 = v18 ? CFStringCreateWithCString(v11, (const char *)v18, 0x8000100u) : 0;
        if ((unint64_t)a3 | (unint64_t)v19)
        {
          if (!v9)
            v9 = CFArrayCreateMutable(v11, 0, v13);
          if (v19)
            v20 = v19;
          else
            v20 = v12;
          CFArrayAppendValue(v9, v20);
          if (v19)
            CFRelease(v19);
        }
      }
    }
  }
  if (v14 != 101)
  {
    v21 = sqlite3_errmsg(*((sqlite3 **)*v7 + 1));
    syslog(4, "%s: %s\n", "CPSqliteConnectionCopyValuesForPropertiesLike", v21);
  }
  result = (CFMutableDictionaryRef *)CPSqliteStatementReset((uint64_t)v7);
  if (a3 && Mutable)
    *a3 = Mutable;
  if (a4 && v9)
    *a4 = v9;
  return result;
}

uint64_t CPSqliteStatementStep(uint64_t a1)
{
  unsigned int v3;
  int v4;
  double v5;
  int i;
  uint64_t v7;
  useconds_t v8;
  double Current;
  BOOL v10;
  unsigned int v11;

  if ((*(_WORD *)(**(_QWORD **)a1 + 116) & 0x800) == 0)
    return sqlite3_step(*(sqlite3_stmt **)(a1 + 8));
  v11 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0.0;
  while (2)
  {
    for (i = 3 * v3; ; i += 3)
    {
      v7 = sqlite3_step(*(sqlite3_stmt **)(a1 + 8));
      if (v7 > 0xDu)
      {
        if (v7 != 14)
        {
          v10 = v7 == 100;
          goto LABEL_39;
        }
        if (v4 > 2)
          goto LABEL_38;
        if (v5 == 0.0)
          v5 = CFAbsoluteTimeGetCurrent() + 240.0;
        ++v4;
        if (v3 <= 0xA)
          v8 = i + 1;
        else
          v8 = v3 + 1101;
        goto LABEL_30;
      }
      if (v7 != 5)
      {
        if (v7 != 6)
          goto LABEL_38;
        if (!*(_BYTE *)(a1 + 24))
          sqlite3_reset(*(sqlite3_stmt **)(a1 + 8));
        if (v5 == 0.0)
          v5 = CFAbsoluteTimeGetCurrent() + 240.0;
        if (v3 <= 0xA)
          v8 = 3 * v3 + 1;
        else
          v8 = v3 + 1101;
        goto LABEL_30;
      }
      if (!*(_BYTE *)(a1 + 24))
        sqlite3_reset(*(sqlite3_stmt **)(a1 + 8));
      if (v5 == 0.0)
        v5 = CFAbsoluteTimeGetCurrent() + 240.0;
      if (v3 >= 0x2711)
      {
        if (v3 - 10000 >= 0xB)
          v8 = v3 - 8899;
        else
          v8 = i - 29999;
LABEL_30:
        usleep(v8);
      }
      if (v5 != 0.0)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current > v5)
          break;
      }
      ++v3;
    }
    if (v11 <= 7)
    {
      ++v3;
      v5 = Current + 30.0;
      ++v11;
      continue;
    }
    break;
  }
  CFLog();
LABEL_38:
  v10 = 0;
LABEL_39:
  *(_BYTE *)(a1 + 24) = v10;
  return v7;
}

uint64_t CPSqliteConnectionIntegerForPropertyWithDefaultValue(CFMutableDictionaryRef *a1, const __CFString *a2, uint64_t a3)
{
  uint64_t v4;
  int v7;
  BOOL v8;

  v8 = 0;
  v7 = 0;
  v4 = _integerForProperty(a1, a2, &v7, &v8, 0);
  if (v8)
    return v4;
  if ((v7 - 100) >= 2 && v7 != 0)
    syslog(4, "SQLite error fetching integer property: %i", v7);
  return a3;
}

uint64_t _integerForProperty(CFMutableDictionaryRef *a1, const __CFString *a2, int *a3, BOOL *a4, int a5)
{
  sqlite3_stmt **v9;
  sqlite3_stmt **v10;
  UInt8 *v11;
  uint64_t v12;
  int v14;

  if (a4)
    *a4 = 0;
  if (!a1)
    return 0;
  v9 = (sqlite3_stmt **)CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, CFSTR("SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;"),
                          a5);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = _CPCreateUTF8StringFromCFString(a2);
  v14 = 101;
  sqlite3_bind_text(v10[1], 1, (const char *)v11, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  v12 = CPSqliteStatementIntegerResult(v10, &v14);
  if (a4)
    *a4 = v14 == 100;
  CPSqliteStatementReset((uint64_t)v10);
  if (a3)
    *a3 = sqlite3_errcode(a1[1]);
  return v12;
}

uint64_t _performSetStringPropertyStatement(uint64_t a1, char *a2, const char *a3)
{
  sqlite3_stmt *v5;

  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 1, a2, -1, 0);
  v5 = *(sqlite3_stmt **)(a1 + 8);
  if (a3)
    sqlite3_bind_text(v5, 2, a3, -1, 0);
  else
    sqlite3_bind_null(v5, 2);
  CPSqliteStatementPerform(a1);
  return CPSqliteStatementReset(a1);
}

uint64_t _performSetIntegerPropertyStatement(uint64_t a1, char *a2, int a3)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 1, a2, -1, 0);
  sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 8), 2, a3);
  CPSqliteStatementPerform(a1);
  return CPSqliteStatementReset(a1);
}

uint64_t _performRemovePropertyStatement(uint64_t a1, char *a2)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 1, a2, -1, 0);
  CPSqliteStatementPerform(a1);
  return CPSqliteStatementReset(a1);
}

sqlite3_int64 CPSqliteConnectionRowidOfLastInsert(uint64_t a1)
{
  sqlite3 *v1;

  if (a1 && (v1 = *(sqlite3 **)(a1 + 8)) != 0)
    return sqlite3_last_insert_rowid(v1);
  else
    return -1;
}

uint64_t CPSqliteConnectionCheckNoConnectionError(uint64_t a1, int a2, const char *a3)
{
  const char *v5;

  if ((a2 - 100) < 2 || a2 == 0)
    return 0;
  v5 = sqlite3_errmsg(*(sqlite3 **)(a1 + 8));
  syslog(4, "sqlite3 error in %s: %s\n", a3, v5);
  return 1;
}

void CPSqliteConnectionEnableProgressHandlerCallback(_QWORD *a1, int a2, uint64_t a3, uint64_t a4)
{
  sqlite3 *v5;

  if (a1 && a2 >= 1 && a3)
  {
    v5 = (sqlite3 *)a1[1];
    if (v5)
    {
      a1[6] = a3;
      a1[7] = a4;
      sqlite3_progress_handler(v5, a2, (int (__cdecl *)(void *))_CPSqliteConnectionDefaultProgressHandler, a1);
    }
  }
}

uint64_t _CPSqliteConnectionDefaultProgressHandler(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  v1 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 48);
  if (v1)
    return v1(a1, *(_QWORD *)(a1 + 56));
  else
    return 0;
}

void CPSqliteConnectionDisableProgressHandlerCallback(uint64_t a1)
{
  sqlite3 *v1;

  if (a1)
  {
    v1 = *(sqlite3 **)(a1 + 8);
    if (v1)
      sqlite3_progress_handler(v1, 0, 0, 0);
  }
}

void checkResultWithStatement(_QWORD *a1, int a2, sqlite3 *db, unsigned int a4, uint64_t a5, uint64_t a6)
{
  int v12;
  const char *v13;
  uint64_t (*v14)(_QWORD *);
  sqlite3_stmt *v15;

  v12 = sqlite3_extended_errcode(db);
  if (a4 - 1 <= 0x62)
  {
    v13 = sqlite3_errmsg(db);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      checkResultWithStatement_cold_1((uint64_t)v13, a4, v12);
  }
  if (a4 > 0x1A)
    goto LABEL_16;
  if (((1 << a4) & 0x4000C00) == 0)
  {
    if (((1 << a4) & 0x80100) != 0)
    {
LABEL_13:
      if (a6)
        v15 = *(sqlite3_stmt **)(a6 + 8);
      else
        v15 = 0;
      sqlite3PrintErrorWithStatement(db, a5, v15);
      return;
    }
LABEL_16:
    if (a4 - 5 > 1)
      return;
    goto LABEL_13;
  }
  v14 = (uint64_t (*)(_QWORD *))a1[9];
  if (!v14 || (v14(a1) & 1) == 0)
  {
    switch(a4)
    {
      case 0xAu:
        handleSqliteIOError(a1, a2, (uint64_t)db, a6, v12);
        break;
      case 0x1Au:
        handleSqliteNotADBError(a1, a2, db, a6);
      case 0xBu:
        handleSqliteCorruptError(a1, a2, db, a6);
    }
  }
}

uint64_t CPSqliteStatementIntegerResult(sqlite3_stmt **a1, int *a2)
{
  uint64_t v4;

  if (!a1 || !a1[1])
    return 0;
  if (CPSqliteStatementStep((uint64_t)a1) == 100)
  {
    v4 = sqlite3_column_int(a1[1], 0);
    if (!a2)
      return v4;
    goto LABEL_8;
  }
  v4 = 0;
  if (a2)
LABEL_8:
    *a2 = sqlite3_errcode(*((sqlite3 **)*a1 + 1));
  return v4;
}

sqlite3_int64 CPSqliteStatementInteger64Result(sqlite3_stmt **a1, int *a2)
{
  sqlite3_int64 v4;

  if (!a1 || !a1[1])
    return 0;
  if (CPSqliteStatementStep((uint64_t)a1) == 100)
  {
    v4 = sqlite3_column_int64(a1[1], 0);
    if (!a2)
      return v4;
    goto LABEL_8;
  }
  v4 = 0;
  if (a2)
LABEL_8:
    *a2 = sqlite3_errcode(*((sqlite3 **)*a1 + 1));
  return v4;
}

uint64_t CPSqliteStatementSendResults(_QWORD *a1, unsigned int (*a2)(_QWORD *, uint64_t), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  if (!a1 || !a1[1] || !*a1 || !*(_QWORD *)(*a1 + 8))
    return 1;
  while (1)
  {
    v6 = CPSqliteStatementStep((uint64_t)a1);
    if ((_DWORD)v6 != 100)
      break;
    if (a2(a1, a3))
    {
      v7 = 100;
      goto LABEL_11;
    }
  }
  v7 = v6;
  if ((v6 - 102) > 0xFFFFFFFD)
  {
    v7 = 101;
  }
  else
  {
    v8 = sqlite3_errmsg(*(sqlite3 **)(*a1 + 8));
    syslog(4, "%s: %s\n", "CPSqliteStatementSendResults", v8);
  }
LABEL_11:
  CPSqliteStatementReset((uint64_t)a1);
  return v7;
}

void CPSqliteStatementApplyValuesFromRecord(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  _sqliteStatementApplyValuesFromRecordWithNullValue(a1, a2, a3, a4, 0, 0);
}

void _sqliteStatementApplyValuesFromRecordWithNullValue(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, sqlite3_int64 a5, int a6)
{
  sqlite3_stmt *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  sqlite3_int64 v19;
  const unsigned __int8 *v20;
  BOOL v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  sqlite3_int64 v25;
  const unsigned __int8 *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  const UInt8 *v31;
  BOOL v32;
  char v33;
  unsigned int v34;
  const void *v35;
  BOOL v36;
  sqlite3_int64 v37;
  char v38;
  float v39;
  int v40;
  const __CFAllocator *v41;
  CFNumberType v42;
  int v43;
  double v44;
  CFNumberRef v45;
  const __CFAllocator *alloc;
  double valuePtr;

  if (a1)
  {
    v10 = *(sqlite3_stmt **)(a1 + 8);
    sqlite3_column_count(v10);
    if (a3)
    {
      alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v11 = a3;
      v12 = a2 + 8;
      v13 = 1;
      do
      {
        v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v12;
        if (*(_QWORD *)v12)
        {
          v15 = *(_DWORD *)(v12 - 8);
          v16 = *(_QWORD *)(v12 + 8);
          switch(*(_DWORD *)(v12 - 4))
          {
            case 0:
              v17 = sqlite3_column_int(v10, *(_DWORD *)(v12 - 8));
              v18 = v14(a4, v16, v17);
              goto LABEL_39;
            case 1:
              v19 = sqlite3_column_int64(v10, *(_DWORD *)(v12 - 8));
              goto LABEL_21;
            case 2:
              v20 = sqlite3_column_text(v10, *(_DWORD *)(v12 - 8));
              if (v20)
                v21 = 0;
              else
                v21 = a6 == 0;
              if (v21)
                goto LABEL_54;
              if (v20)
              {
                v22 = CFStringCreateWithCString(alloc, (const char *)v20, 0x8000100u);
                v23 = a4;
                v24 = v16;
                v25 = (sqlite3_int64)v22;
                goto LABEL_62;
              }
              v28 = a4;
              v29 = v16;
              v19 = a5;
LABEL_22:
              v18 = v14(v28, v29, v19);
LABEL_39:
              v33 = v18;
              break;
            case 3:
              v26 = sqlite3_column_text(v10, *(_DWORD *)(v12 - 8));
              if (v26)
                v27 = 0;
              else
                v27 = a6 == 0;
              if (v27)
                goto LABEL_54;
              if (v26)
                v19 = (sqlite3_int64)v26;
              else
                v19 = a5;
LABEL_21:
              v28 = a4;
              v29 = v16;
              goto LABEL_22;
            case 4:
              v30 = sqlite3_column_bytes(v10, *(_DWORD *)(v12 - 8));
              v31 = (const UInt8 *)sqlite3_column_blob(v10, v15);
              if (v31)
                v32 = 0;
              else
                v32 = a6 == 0;
              if (v32)
                goto LABEL_46;
              if (!v31)
              {
                v38 = v14(a4, v16, a5);
                goto LABEL_66;
              }
              v22 = CFDataCreate(alloc, v31, v30);
              v33 = v14(a4, v16, (uint64_t)v22);
              if (!v22)
                break;
              goto LABEL_63;
            case 5:
              v34 = sqlite3_column_bytes(v10, *(_DWORD *)(v12 - 8));
              v35 = sqlite3_column_blob(v10, v15);
              if (v35)
                v36 = 0;
              else
                v36 = a6 == 0;
              if (v36)
              {
LABEL_46:
                v33 = 1;
              }
              else
              {
                if (v35)
                  v37 = (sqlite3_int64)v35;
                else
                  v37 = a5;
                v38 = ((uint64_t (*)(uint64_t, uint64_t, sqlite3_int64, _QWORD))v14)(a4, v16, v37, v34);
LABEL_66:
                v33 = v38;
              }
              break;
            case 6:
              v39 = sqlite3_column_double(v10, *(_DWORD *)(v12 - 8));
              v18 = ((uint64_t (*)(uint64_t, uint64_t, float))v14)(a4, v16, v39);
              goto LABEL_39;
            case 7:
              v40 = sqlite3_column_type(v10, *(_DWORD *)(v12 - 8));
              if (v40 == 5)
                goto LABEL_47;
              valuePtr = 0.0;
              if (v40 == 2)
              {
                valuePtr = sqlite3_column_double(v10, v15);
                v41 = alloc;
                v42 = kCFNumberDoubleType;
              }
              else
              {
                valuePtr = COERCE_DOUBLE(sqlite3_column_int64(v10, v15));
                v41 = alloc;
                v42 = kCFNumberSInt64Type;
              }
              v45 = CFNumberCreate(v41, v42, &valuePtr);
              goto LABEL_52;
            case 8:
              v43 = sqlite3_column_type(v10, *(_DWORD *)(v12 - 8));
              if (v43 == 5)
              {
LABEL_47:
                v22 = 0;
              }
              else
              {
                if (v43 == 2)
                  v44 = sqlite3_column_double(v10, v15);
                else
                  v44 = (double)sqlite3_column_int64(v10, v15);
                v45 = CFDateCreate(0, v44);
LABEL_52:
                v22 = v45;
                if (v45)
                  goto LABEL_58;
              }
              if (!a6)
                goto LABEL_54;
LABEL_58:
              if (v22)
                v25 = (sqlite3_int64)v22;
              else
                v25 = a5;
              v23 = a4;
              v24 = v16;
LABEL_62:
              v33 = v14(v23, v24, v25);
              if (v22)
LABEL_63:
                CFRelease(v22);
              break;
            default:
              goto LABEL_54;
          }
        }
        else
        {
LABEL_54:
          v33 = 1;
        }
        if (v13 >= v11)
          break;
        v12 += 24;
        ++v13;
      }
      while ((v33 & 1) != 0);
    }
  }
}

void CPSqliteStatementApplyValuesFromRecordWithNullValue(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, sqlite3_int64 a5)
{
  _sqliteStatementApplyValuesFromRecordWithNullValue(a1, a2, a3, a4, a5, 1);
}

uint64_t CPSqliteStatementProcessPhoneQuery(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t (*a4)(uint64_t, _QWORD, void *, uint64_t, uint64_t), uint64_t a5)
{
  const __CFString *v9;
  CFMutableStringRef MutableCopy;
  const __CFAllocator *v11;
  CFIndex Length;
  void *v13;
  const __CFAllocator *v14;
  const unsigned __int8 *v15;
  const UInt8 *v16;
  size_t v17;
  CFStringRef v18;
  void *v19;
  int v20;

  v9 = CPPhoneNumberCopyHomeCountryCode();
  MutableCopy = 0;
  if (a1)
  {
    if (a2)
    {
      MutableCopy = 0;
      if (a4)
      {
        if (*(_QWORD *)(a1 + 8))
        {
          v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          if (a3)
          {
            Length = CFStringGetLength(a3);
            MutableCopy = CFStringCreateMutableCopy(v11, Length, a3);
            CFStringLowercase(MutableCopy, 0);
          }
          else
          {
            MutableCopy = 0;
          }
          v13 = (void *)PNCopyBestGuessNormalizedNumberForCountry();
          decomposePhoneNumber((uint64_t)v13, MutableCopy);
          if (CPSqliteStatementStep(a1) == 100)
          {
            v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
            do
            {
              v15 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0);
              if (v15)
              {
                v16 = v15;
                v17 = strlen((const char *)v15);
                v18 = CFStringCreateWithBytesNoCopy(v11, v16, v17, 0x8000100u, 0, v14);
                v19 = (void *)PNCopyBestGuessNormalizedNumberForCountry();
                decomposePhoneNumber((uint64_t)v19, v9);
                if (decomposedPhoneNumbersEqual())
                {
                  v20 = a4(a1, 0, v19, 1, a5);
                  CFRelease(v18);
                  free(v19);
                  if (v20)
                    break;
                }
                else
                {
                  CFRelease(v18);
                  free(v19);
                }
              }
            }
            while (CPSqliteStatementStep(a1) == 100);
          }
          if (v13)
            free(v13);
        }
      }
    }
  }
  if (v9)
    CFRelease(v9);
  if (MutableCopy)
    CFRelease(MutableCopy);
  return 0;
}

void CPSqlitePhoneNumberContainsAlphaCharacters(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  size_t v6;
  size_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  if (a2 != 1)
  {
    sqlite3_result_error(a1, "CPSqlitePhoneNumberContainsAlphaCharacters: wrong number of arguments", -1);
    return;
  }
  v4 = sqlite3_value_text(*a3);
  if (!v4 || (v5 = v4, (v6 = strlen((const char *)v4)) == 0))
  {
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  v7 = v6;
  v8 = MEMORY[0x1E0C80978];
  while (1)
  {
    v9 = *(char *)v5++;
    v10 = v9;
    if (v9 < 0)
      break;
    if ((*(_DWORD *)(v8 + 4 * v10 + 60) & 0x100) != 0)
      goto LABEL_12;
LABEL_9:
    if (!--v7)
      goto LABEL_10;
  }
  if (!__maskrune(v10, 0x100uLL))
    goto LABEL_9;
LABEL_12:
  v11 = 1;
LABEL_13:
  sqlite3_result_int(a1, v11);
}

size_t CPSqliteCompareSortKeyPrefixes(char *__s, char *a2, int a3)
{
  size_t result;
  size_t v7;
  char *v8;
  char *v9;
  size_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  char *v16;
  BOOL v17;
  char *v18;
  char *v19;
  BOOL v20;

  result = 0;
  if (__s)
  {
    if (a2)
    {
      result = strlen(__s);
      if (result)
      {
        v7 = result;
        v8 = strchr(__s, 1);
        v9 = strchr(__s, 2);
        v10 = strlen(a2);
        v11 = strchr(a2, 2);
        if (!v8)
          v8 = &__s[v7];
        if (!v9)
          v9 = v8;
        while (1)
        {
          v12 = v9 - __s;
          if (v11 && v12 < v10)
          {
            v13 = v9;
            v14 = v11;
            do
            {
              if (v12 != v14 - a2 || v13 == v8)
                break;
              v16 = strchr(v13 + 1, 2);
              v17 = v8 < v16 || v16 == 0;
              v13 = v17 ? v8 : v16;
              v12 = v13 - __s;
              if (!*v14)
                break;
              v18 = strchr(v14 + 1, 2);
              if (!v18)
                break;
              v14 = v18;
            }
            while (v12 < v10);
          }
          if ((a3 & 1) == 0 && v10 <= v12 && !strncmp(a2, __s, v10) || a3 && v10 == v12 && !strncmp(a2, __s, v10))
            break;
          if (*v9)
          {
            __s = v9 + 1;
            v19 = strchr(v9 + 1, 2);
            v20 = v8 < v19 || v19 == 0;
            v9 = v20 ? v8 : v19;
            if (__s <= v8)
              continue;
          }
          return 0;
        }
        return 1;
      }
    }
  }
  return result;
}

void CPSqliteHasSortKeyPrefix(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  sqlite3_value *v4;
  sqlite3_value *v5;
  char *v6;
  _BOOL4 v7;
  int v8;

  if (a2 != 3)
  {
    sqlite3_result_error(a1, "CPSqliteHasSortKeyPrefix: wrong number of arguments", -1);
    return;
  }
  v4 = a3[1];
  v5 = a3[2];
  if (!*a3)
  {
    v6 = 0;
    if (!v4)
      goto LABEL_5;
    goto LABEL_4;
  }
  v6 = (char *)sqlite3_value_blob(*a3);
  if (v4)
LABEL_4:
    v4 = (sqlite3_value *)sqlite3_value_blob(v4);
LABEL_5:
  if (v5)
    v7 = sqlite3_value_int(v5) != 0;
  else
    v7 = 0;
  v8 = CPSqliteCompareSortKeyPrefixes(v6, (char *)v4, v7);
  sqlite3_result_int(a1, v8);
}

uint64_t CPSqliteUtilitiesGetSchemaVersionAtPath(const __CFString *a1)
{
  return _CPSqliteUtilitiesGetIntegerResultAtPathWithKey(a1, "SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;",
           "_ClientVersion");
}

uint64_t _CPSqliteUtilitiesGetIntegerResultAtPathWithKey(const __CFString *a1, const char *a2, const char *a3)
{
  UInt8 *v5;
  int v6;
  sqlite3 *v7;
  uint64_t v8;
  int v9;
  int v10;
  sqlite3_stmt *v11;
  int v12;
  sqlite3_stmt *pStmt;
  sqlite3 *ppDb;

  v5 = _CPCreateUTF8StringFromCFString(a1);
  ppDb = 0;
  v6 = sqlite3_open_v2((const char *)v5, &ppDb, 1, 0);
  v7 = ppDb;
  if (ppDb)
  {
    if (v6)
    {
      v8 = 0xFFFFFFFFLL;
    }
    else
    {
      pStmt = 0;
      v9 = strlen(a2);
      v10 = sqlite3_prepare_v2(ppDb, a2, v9, &pStmt, 0);
      v11 = pStmt;
      if (pStmt)
      {
        if (v10)
        {
          v8 = 0xFFFFFFFFLL;
        }
        else
        {
          if (a3)
          {
            v12 = strlen(a3);
            sqlite3_bind_text(pStmt, 1, a3, v12, 0);
            v11 = pStmt;
          }
          if (sqlite3_step(v11) == 100)
            v8 = sqlite3_column_int(pStmt, 0);
          else
            v8 = 0xFFFFFFFFLL;
          sqlite3_reset(pStmt);
          v11 = pStmt;
        }
        sqlite3_finalize(v11);
      }
      else
      {
        v8 = 0xFFFFFFFFLL;
      }
      v7 = ppDb;
    }
    sqlite3_close(v7);
  }
  else
  {
    v8 = 0xFFFFFFFFLL;
  }
  free(v5);
  return v8;
}

uint64_t CPSqliteUtilitiesGetIntegerQueryResultAtPath(const char *a1, const __CFString *a2)
{
  return _CPSqliteUtilitiesGetIntegerResultAtPathWithKey(a2, a1, a1);
}

uint64_t CPSqliteSetDefaultPageCacheSize(uint64_t result)
{
  if ((int)result >= 10)
    __defaultPageCacheSize = result;
  return result;
}

uint64_t CPSqliteSetDefaultSharedCacheModeEnabledState(uint64_t result)
{
  __defaultSharedCacheModeEnabledState = result;
  return result;
}

uint64_t CPSqliteDatabaseIsCorrupted(sqlite3 *db)
{
  uint64_t v1;
  int v2;
  const unsigned __int8 *v4;
  int v5;
  sqlite3_stmt *ppStmt;

  v1 = (uint64_t)db;
  if (!db)
    return v1;
  ppStmt = 0;
  v2 = sqlite3_prepare_v2(db, "PRAGMA integrity_check;", -1, &ppStmt, 0);
  if ((v2 - 5) <= 1)
    goto LABEL_3;
  if (!v2)
  {
    v2 = sqlite3_step(ppStmt);
    if ((v2 - 5) <= 1)
    {
LABEL_3:
      syslog(4, "Got SQLite error %i when running integrity check on db handle at %p.  Not flagging as corrupt.\n", v2, (const void *)v1);
      v1 = 0;
      goto LABEL_6;
    }
    if (v2 == 100)
    {
      v4 = sqlite3_column_text(ppStmt, 0);
      v5 = sqlite3_column_bytes(ppStmt, 0);
      v1 = 1;
      if (v4 && v5 >= 1)
        v1 = strncmp((const char *)v4, "ok", 3uLL) != 0;
      goto LABEL_6;
    }
  }
  v1 = 1;
LABEL_6:
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v1;
}

BOOL CPSqliteDatabaseDelete(sqlite3 *a1)
{
  return truncateDatabaseWithSettings(a1, 0, 0, 0);
}

BOOL truncateDatabaseWithSettings(sqlite3 *a1, int a2, int a3, int a4)
{
  _BOOL8 v5;
  int v6;
  int v8;

  if (!a1)
    return 0;
  v8 = a2;
  if (a3 == 1)
  {
    a2 |= 8u;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    a2 |= 0xCu;
LABEL_7:
    v8 = a2;
  }
  if (a4)
    v8 = a2 | 0x80;
  v6 = sqlite3_file_control(a1, 0, 101, &v8);
  v5 = v6 == 0;
  if (v6)
    syslog(4, "Failed to delete db handle %p!  SQLite error %i.\n", a1, v6);
  return v5;
}

BOOL CPSqliteDatabaseDeleteUsingJournalModeWAL(sqlite3 *a1, int a2)
{
  return truncateDatabaseWithSettings(a1, a2, 0, 0);
}

uint64_t truncateDatabase(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  sqlite3 *v4;
  int v5;
  UInt8 *v6;
  UInt8 *v7;
  unsigned int v8;
  int v9;
  UInt8 *v10;
  sqlite3 *ppDb;

  v1 = a1;
  ppDb = 0;
  if (!a1)
    return v1;
  if ((*(_WORD *)(a1 + 116) & 0x1000) != 0)
    v2 = CPStartAnInhibitor();
  else
    v2 = 0;
  v3 = *(_QWORD *)(v1 + 8);
  if (v3)
  {
    v4 = *(sqlite3 **)(v3 + 8);
    if (v4)
    {
      v5 = 0;
      ppDb = *(sqlite3 **)(v3 + 8);
      goto LABEL_15;
    }
  }
  if (*(_QWORD *)v1)
  {
    v6 = _CPCreateUTF8StringFromCFString(*(const __CFString **)v1);
    if (v6)
    {
      v7 = v6;
      v8 = *(_DWORD *)(v1 + 260);
      v9 = v8 >= 4 ? 2 : 4194306 - (v8 << 20);
      sqlite3_open_v2((const char *)v6, &ppDb, v9, 0);
      free(v7);
      v4 = ppDb;
      if (ppDb)
      {
        v5 = 1;
LABEL_15:
        v1 = truncateDatabaseWithSettings(v4, (*(unsigned __int16 *)(v1 + 116) >> 10) & 1, *(_DWORD *)(v1 + 256), 1);
        if (v5)
          sqlite3_close(ppDb);
        goto LABEL_18;
      }
    }
  }
  v10 = _CPCreateUTF8StringFromCFString(*(const __CFString **)v1);
  syslog(4, "Could not get handle to truncate database %s!\n", (const char *)v10);
  free(v10);
  v1 = 0;
LABEL_18:
  if (v2)
    CPStopInhibitorWithIdentifier(v2);
  return v1;
}

uint64_t CPSqliteDatabaseGetAutoVacuumLevel(sqlite3 *a1)
{
  uint64_t v1;
  sqlite3_stmt *ppStmt;

  if (!a1)
    return 0;
  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "PRAGMA auto_vacuum;", -1, &ppStmt, 0) || sqlite3_step(ppStmt) != 100)
    v1 = 0;
  else
    v1 = sqlite3_column_int(ppStmt, 0);
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v1;
}

uint64_t _connectAndCheckVersion(uint64_t a1, const char *a2, _BYTE *a3, int a4, int a5, _DWORD *a6)
{
  uint64_t (*v12)(uint64_t);
  sqlite3 **v13;
  uint64_t v14;
  const void *v15;
  int v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  int v18;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  BOOL v24;
  void (*v25)(uint64_t, uint64_t);
  sqlite3 **v26;
  CFStringRef v27;
  int v28;
  unsigned int v29;
  void (*v30)(uint64_t, uint64_t);
  unsigned int v31;
  void (*v32)(uint64_t, uint64_t, _QWORD);
  void *v33;
  void *v34;
  void (*v35)(_QWORD);
  unsigned int (*v36)(uint64_t, _QWORD, uint64_t, _QWORD);
  int v37;
  void (*v38)(void);
  void (*v39)(void);
  CFStringRef v40;
  sqlite3 **v41;
  uint64_t v42;
  char v43;
  int v44;
  int v45[2];

  *(_QWORD *)v45 = 0;
  v44 = 0;
  v12 = *(uint64_t (**)(uint64_t))(a1 + 40);
  if (v12 && (v12(a1) & 1) == 0)
  {
    v44 = 3;
    goto LABEL_10;
  }
  v13 = _createConnection(a1, a2, a4, a5, &v44);
  *(_QWORD *)v45 = v13;
  if (!v13 || (*(_WORD *)(a1 + 116) & 4) != 0)
    goto LABEL_10;
  v14 = (uint64_t)v13;
  v43 = 0;
  v15 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(v13, CFSTR("SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;"),
          1);
  v16 = *(unsigned __int16 *)(a1 + 116) & (a4 ^ 1);
  v17 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 208);
  if (!v15)
  {
    if (!v17)
    {
      checkConnectionStatus((uint64_t *)v45, &v43);
      v22 = 0;
      v14 = *(_QWORD *)v45;
      if (*(_QWORD *)v45)
        v23 = v43 == 0;
      else
        v23 = 0;
      v18 = v23;
      v20 = -1;
      if (v43)
        goto LABEL_42;
      goto LABEL_54;
    }
    v21 = v17(a1, v14);
    switch(v21)
    {
      case 2:
        CPSqliteConnectionClose(v14);
        v14 = 0;
        v18 = 0;
        goto LABEL_36;
      case 1:
        v24 = 0;
        v22 = 0;
        v18 = 0;
        v43 = 1;
        v20 = -1;
LABEL_43:
        if (v24 || (a4 & 1) != 0)
          goto LABEL_50;
        syslog(4, "%s may be out of date (version %d, expected %d), we will create a new database.\n", a2, v20, *(_DWORD *)(a1 + 112));
        if ((truncateDatabase(a1) & 1) != 0)
        {
          v25 = *(void (**)(uint64_t, uint64_t))(a1 + 80);
          if (v25)
          {
            v18 = 1;
            v25(a1, 1);
LABEL_50:
            if (v14)
              CPSqliteConnectionClose(v14);
            v26 = _createConnection(a1, a2, a4, a5, &v44);
            *(_QWORD *)v45 = v26;
            if (!v26)
              goto LABEL_10;
            v14 = (uint64_t)v26;
            CPSqliteConnectionBeginTransactionType((uint64_t)v26, 0);
            goto LABEL_54;
          }
        }
        else
        {
          syslog(4, "Failed to delete database at %s!\n", a2);
        }
        v18 = 1;
        goto LABEL_50;
      case 0:
        v22 = 0;
        v18 = 1;
LABEL_37:
        v20 = -1;
        goto LABEL_41;
    }
LABEL_26:
    v18 = 0;
    v22 = 0;
    goto LABEL_37;
  }
  if (v17 && v17(a1, v14) == 2)
  {
    CPSqliteConnectionClose(v14);
    v14 = 0;
    v18 = 0;
    v16 = 0;
LABEL_36:
    v22 = 0;
    *(_QWORD *)v45 = 0;
    goto LABEL_37;
  }
  if (!v16)
    goto LABEL_26;
  v20 = CPSqliteConnectionIntegerForPropertyWithDefaultValue((CFMutableDictionaryRef *)v14, CFSTR("_ClientVersion"), 0);
  checkConnectionStatus((uint64_t *)v45, &v43);
  v14 = *(_QWORD *)v45;
  if (!*(_QWORD *)v45 || v20 == *(_DWORD *)(a1 + 112))
    goto LABEL_40;
  _beginImmediateTransaction(*(uint64_t *)v45);
  checkConnectionStatus((uint64_t *)v45, &v43);
  if (!*(_QWORD *)v45)
  {
    v14 = 0;
LABEL_40:
    v18 = 0;
    v22 = 0;
    v16 = 1;
    goto LABEL_41;
  }
  v16 = 1;
  v42 = _integerForProperty(*(CFMutableDictionaryRef **)v45, CFSTR("_ClientVersion"), &v44, 0, 1);
  checkConnectionStatus((uint64_t *)v45, &v43);
  v14 = *(_QWORD *)v45;
  if (!*(_QWORD *)v45)
    goto LABEL_92;
  if (v44 == 17)
  {
    CPSqliteConnectionClose(*(uint64_t *)v45);
    *(_QWORD *)v45 = 0;
    v14 = 0;
    if (a3)
    {
      v18 = 0;
      *a3 = 1;
LABEL_93:
      v22 = 1;
LABEL_94:
      v20 = v42;
      goto LABEL_41;
    }
LABEL_92:
    v18 = 0;
    goto LABEL_93;
  }
  v20 = v42;
  if (*(_DWORD *)(a1 + 112) == (_DWORD)v42)
  {
    v18 = 0;
    v24 = v43 == 0;
    v22 = 1;
    goto LABEL_43;
  }
  if (!*(_BYTE *)(a1 + 88))
  {
    v36 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a1 + 56);
    if (!v36 || !*(_QWORD *)(a1 + 64))
    {
      v24 = 0;
      v18 = 0;
      v22 = 1;
      v43 = 1;
      goto LABEL_43;
    }
    if (v36(a1, *(_QWORD *)v45, v42, *(_QWORD *)(a1 + 104)))
    {
      v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 64))(a1, v14, v42, *(_QWORD *)(a1 + 104));
      if (v37 == 2)
      {
        CPSqliteConnectionClose(v14);
        v14 = 0;
        v18 = 0;
        *(_QWORD *)v45 = 0;
        goto LABEL_93;
      }
      if (v37 != 1)
      {
        if (!v37)
          CPSqliteConnectionSetIntegerForProperty((CFMutableDictionaryRef *)v14, CFSTR("_ClientVersion"), *(_DWORD *)(a1 + 112));
        goto LABEL_92;
      }
    }
    v24 = 0;
    v18 = 0;
    v22 = 1;
LABEL_103:
    v43 = 1;
    v20 = v42;
    goto LABEL_43;
  }
  CPSqliteConnectionClose(*(uint64_t *)v45);
  *(_QWORD *)v45 = 0;
  v22 = 1;
  v33 = dlopen("/System/Library/PrivateFrameworks/DataMigration.framework/DataMigration", 1);
  if (!v33)
  {
LABEL_102:
    v14 = 0;
    v24 = 0;
    v18 = 0;
    goto LABEL_103;
  }
  v34 = v33;
  if (*(_QWORD *)(a1 + 96))
  {
    v35 = (void (*)(_QWORD))dlsym(v33, "DMPerformMigrationReturningAfterPlugin");
    if (v35)
    {
      v35(*(_QWORD *)(a1 + 96));
      goto LABEL_98;
    }
    goto LABEL_101;
  }
  v38 = (void (*)(void))dlsym(v33, "DMPerformMigration");
  if (!v38)
  {
LABEL_101:
    dlclose(v34);
    goto LABEL_102;
  }
  v39 = v38;
  v40 = CFStringCreateWithFormat(0, 0, CFSTR("Database version conflict detected: %s"), a2);
  v39();
  CFRelease(v40);
LABEL_98:
  dlclose(v34);
  v41 = _createConnection(a1, a2, a4, 0, &v44);
  v14 = (uint64_t)v41;
  *(_QWORD *)v45 = v41;
  if (!v41)
  {
    v18 = 0;
    v16 = 1;
    goto LABEL_94;
  }
  CPSqliteConnectionBeginTransactionType((uint64_t)v41, 0);
  v20 = CPSqliteConnectionIntegerForPropertyWithDefaultValue((CFMutableDictionaryRef *)v14, CFSTR("_ClientVersion"), 0);
  v16 = 1;
  if (v20 != *(_DWORD *)(a1 + 112))
  {
    v24 = 0;
    v18 = 0;
    v43 = 1;
    goto LABEL_43;
  }
  v18 = 0;
LABEL_41:
  if (v43)
  {
LABEL_42:
    v24 = 0;
    goto LABEL_43;
  }
LABEL_54:
  if ((v18 & 1) == 0 && v14)
  {
    if ((a4 & 1) == 0)
    {
      v27 = CPSqliteConnectionCopyValueForProperty((CFMutableDictionaryRef *)v14, CFSTR("_UniqueIdentifier"));
      if (v27)
        CFRelease(v27);
      else
        _addUniqueIdentifierToDatabase(v14, 1);
    }
    if (v22)
    {
      _performSqlUsingConnection((CFMutableDictionaryRef *)v14, CFSTR("COMMIT;"));
      *(_DWORD *)(v14 + 64) = 0xFFFF;
    }
  }
  if (v14 && ((v18 ^ 1) & 1) == 0 && (a4 & 1) == 0)
  {
    _beginImmediateTransaction(v14);
    if (!v16
      || (v28 = _integerForProperty((CFMutableDictionaryRef *)v14, CFSTR("_ClientVersion"), &v44, 0, 1), v44)
      || *(_DWORD *)(a1 + 112) != v28)
    {
      v29 = sqlite3_exec(*(sqlite3 **)(v14 + 8), "pragma legacy_file_format = 0;", 0, 0, 0);
      checkResultWithStatement((_QWORD *)a1, 0, *(sqlite3 **)(v14 + 8), v29, (uint64_t)"CPSqliteDatabaseSetNewFileFormatPragma", 0);
      v30 = *(void (**)(uint64_t, uint64_t))(a1 + 24);
      if (v30)
        v30(a1, v14);
      v31 = sqlite3_exec(*(sqlite3 **)(v14 + 8), "CREATE TABLE IF NOT EXISTS _SqliteDatabaseProperties (key TEXT, value TEXT, UNIQUE(key));",
              0,
              0,
              0);
      checkResultWithStatement((_QWORD *)a1, 0, *(sqlite3 **)(v14 + 8), v31, (uint64_t)"_connectAndCheckVersion", 0);
      if (v31)
      {
        *(_QWORD *)(a1 + 8) = 0;
        goto LABEL_10;
      }
      v32 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 16);
      if (v32)
        v32(a1, v14, *(_QWORD *)(a1 + 48));
      if ((*(_WORD *)(a1 + 116) & 1) != 0)
        CPSqliteConnectionSetIntegerForProperty((CFMutableDictionaryRef *)v14, CFSTR("_ClientVersion"), *(_DWORD *)(a1 + 112));
      _addUniqueIdentifierToDatabase(v14, 0);
    }
    _performSqlUsingConnection((CFMutableDictionaryRef *)v14, CFSTR("COMMIT;"));
    *(_DWORD *)(v14 + 64) = 0xFFFF;
  }
LABEL_10:
  if (a6)
    *a6 = v44;
  return *(_QWORD *)v45;
}

sqlite3 **_createConnection(uint64_t a1, const char *a2, int a3, int a4, int *a5)
{
  sqlite3 **v10;
  uid_t st_uid;
  int *v12;
  char *v13;
  const __CFString *v14;
  UInt8 *v15;
  BOOL v16;
  int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  sqlite3 **v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  CFStringRef v27;
  int v28;
  sqlite3 *v29;
  int v30;
  int (__cdecl *v31)(void *, int);
  sqlite3 **v32;
  void (*v33)(uint64_t, sqlite3 **);
  const void *v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  CFComparisonResult v38;
  stat v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = (sqlite3 **)malloc_type_calloc(1uLL, 0x48uLL, 0x10A004006D1BBC6uLL);
  if ((a3 & 1) == 0)
  {
    if (strcmp(a2, ":memory:"))
    {
      if (access(a2, 6) == -1 && *__error() != 2)
      {
        memset(&v40, 0, sizeof(v40));
        if (!stat(a2, &v40))
        {
          st_uid = v40.st_uid;
          if (st_uid == geteuid())
          {
            syslog(3, "fixing permissions on %s", a2);
            if (chmod(a2, 0x180u) < 0)
            {
              v12 = __error();
              v13 = strerror(*v12);
              syslog(3, "error %s setting permissions on %s", v13, a2);
            }
          }
        }
      }
    }
  }
  v14 = *(const __CFString **)(a1 + 248);
  if (v14)
    v15 = _CPCreateUTF8StringFromCFString(v14);
  else
    v15 = 0;
  if (__defaultSharedCacheModeEnabledState)
    v16 = (a4 & 0x40000) == 0;
  else
    v16 = 0;
  if (v16)
    v17 = a4 | 0x20000;
  else
    v17 = a4;
  v18 = *(_DWORD *)(a1 + 260);
  if (v18 >= 4)
    v19 = 0;
  else
    v19 = 0x400000 - (v18 << 20);
  if ((*(_WORD *)(a1 + 116) & 0x1000) != 0)
    v20 = CPStartAnInhibitor();
  else
    v20 = 0;
  v21 = v10 + 1;
  if (a3)
    v22 = 1;
  else
    v22 = 2;
  v23 = v17 | v22 | v19;
  v24 = sqlite3_open_v2(a2, v10 + 1, v23, (const char *)v15);
  v25 = v24;
  if (!(_DWORD)v24)
  {
    v28 = 0;
    if (!v15)
      goto LABEL_32;
    goto LABEL_31;
  }
  v26 = sqlite3_errstr(v24);
  syslog(3, "Error opening database: %s", v26);
  v27 = CFStringCreateWithFormat(0, 0, CFSTR("com.apple.AppSupport._createConnectionForWriting.sqlite3_open_v2.error.%d"), v25);
  CPAggregateDictionaryAddValueForScalarKey((uint64_t)v27, 1);
  CFRelease(v27);
  if (*v21)
    sqlite3_close(*v21);
  v28 = sqlite3_open_v2(a2, v10 + 1, v23 | 4, (const char *)v15);
  if (v15)
LABEL_31:
    free(v15);
LABEL_32:
  v29 = *v21;
  if (!*v21 || v28)
  {
    if (v29)
      sqlite3_close(v29);
    free(v10);
    v10 = 0;
  }
  else
  {
    *v10 = (sqlite3 *)a1;
    *((_DWORD *)v10 + 16) = 0xFFFF;
    if ((*(_WORD *)(a1 + 116) & 0x800) != 0)
      v30 = 30000;
    else
      v30 = 0x7FFFFFFF;
    if (sqlite3_busy_timeout(v29, v30))
      syslog(3, "Failed to set busy timout");
    v31 = *(int (__cdecl **)(void *, int))(a1 + 216);
    if (v31)
    {
      v32 = *(sqlite3 ***)(a1 + 224);
    }
    else
    {
      v31 = (int (__cdecl *)(void *, int))defaultBusyHandler;
      v32 = v10;
    }
    if (sqlite3_busy_handler(v10[1], v31, v32))
      syslog(3, "Failed to set busy handler");
    sqlite3_commit_hook(*v21, (int (__cdecl *)(void *))commitHook, (void *)a1);
    sqlite3_update_hook(*v21, (void (__cdecl *)(void *, int, const char *, const char *, sqlite3_int64))updateHook, (void *)a1);
    CPSqliteSetupLoggingForDatabaseHandle(*v21);
    if (__defaultPageCacheSize >= 10)
    {
      snprintf((char *)&v40, 0x80uLL, "PRAGMA cache_size=%d;", __defaultPageCacheSize);
      sqlite3_exec(*v21, (const char *)&v40, 0, 0, 0);
    }
    v33 = *(void (**)(uint64_t, sqlite3 **))(a1 + 32);
    if (v33)
      v33(a1, v10);
    if ((_DWORD)v25)
    {
      if (*(_DWORD *)(a1 + 256))
      {
        snprintf((char *)&v40, 0x80uLL, "PRAGMA auto_vacuum=%d;", *(_DWORD *)(a1 + 256));
        sqlite3_exec(*v21, (const char *)&v40, 0, 0, 0);
      }
LABEL_56:
      if ((*(_WORD *)(a1 + 116) & 0x400) != 0)
        sqlite3_exec(*v21, "PRAGMA journal_mode = WAL;", 0, 0, 0);
      goto LABEL_63;
    }
    v34 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(v10, CFSTR("PRAGMA journal_mode;"), 0);
    if (!v34)
      goto LABEL_63;
    v35 = (uint64_t)v34;
    v36 = CPSqliteStatementCopyStringResult((uint64_t)v34);
    if (!v36)
    {
      CPSqliteStatementReset(v35);
      goto LABEL_63;
    }
    v37 = v36;
    v38 = CFStringCompare(v36, CFSTR("wal"), 1uLL);
    CFRelease(v37);
    CPSqliteStatementReset(v35);
    if (v38)
      goto LABEL_56;
  }
LABEL_63:
  if (v20)
    CPStopInhibitorWithIdentifier(v20);
  if (a5)
    *a5 = v28;
  return v10;
}

void checkConnectionStatus(uint64_t *a1, _BYTE *a2)
{
  int v4;
  int v5;
  const char *v6;

  v4 = sqlite3_errcode(*(sqlite3 **)(*a1 + 8));
  if (v4)
  {
    v5 = v4;
    if ((v4 - 5) > 1)
    {
      if (v4 != 1)
      {
        if (v4 == 11)
        {
          CPSqliteConnectionClose(*a1);
          *a1 = 0;
          *a2 = 1;
        }
        else
        {
          v6 = sqlite3_errmsg(*(sqlite3 **)(*a1 + 8));
          syslog(3, "encountered sqlite error %d: %s", v5, v6);
        }
      }
    }
    else
    {
      CPSqliteConnectionClose(*a1);
      *a1 = 0;
    }
  }
}

uint64_t _beginImmediateTransaction(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = 5;
  do
  {
    CPSqliteConnectionBeginTransactionType(a1, 1u);
    result = sqlite3_errcode(*(sqlite3 **)(a1 + 8));
    if ((result - 7) < 0xFFFFFFFE)
      break;
    result = usleep(0x3E8u);
    --v2;
  }
  while (v2);
  return result;
}

void _addUniqueIdentifierToDatabase(uint64_t a1, int a2)
{
  const __CFAllocator *v4;
  const __CFUUID *v5;
  UInt8 *v6;

  if (a1)
  {
    if (a2)
      CPSqliteConnectionBeginTransactionType(a1, 0);
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v6 = (UInt8 *)CFUUIDCreateString(v4, v5);
    CPSqliteConnectionSetValueForProperty((CFMutableDictionaryRef *)a1, CFSTR("_UniqueIdentifier"), v6);
    if (v6)
      CFRelease(v6);
    CFRelease(v5);
    if (a2)
    {
      _performSqlUsingConnection((CFMutableDictionaryRef *)a1, CFSTR("COMMIT;"));
      *(_DWORD *)(a1 + 64) = 0xFFFF;
    }
  }
}

uint64_t defaultBusyHandler(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*busy)(uint64_t, uint64_t);

  v4 = *a1;
  if ((*(_WORD *)(v4 + 116) & 0x10) != 0)
    CPSqliteDatabaseRequestUnlock(v4);
  if (a1[1])
  {
    busy = (uint64_t (*)(uint64_t, uint64_t))_sqlite3_system_busy_handler();
    return busy(a1[1], a2);
  }
  else
  {
    syslog(3, "Failed to call _sqlite3_system_busy_handler, count %i", a2);
    return 0;
  }
}

uint64_t commitHook(uint64_t a1)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(a1 + 192);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t updateHook(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 200);
  if (v1)
    return v1();
  return result;
}

BOOL _debugLoggingEnabled()
{
  int v0;

  v0 = __debugLoggingForced;
  if (__debugLoggingForced == -1)
  {
    v0 = getenv("CPSQLDEBUG") != 0;
    __debugLoggingForced = v0;
  }
  return (v0 | __debugLoggingEnabled) != 0;
}

uint64_t __updateNotifyRegistration_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 232) == a2)
  {
    *(_WORD *)(v2 + 116) |= 0x200u;
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(_QWORD *)(v2 + 240);
  if (result)
  {
    if ((*(_WORD *)(v2 + 116) & 0x200) != 0)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

_QWORD *CPSqliteStatementForSQLUncachedAndIgnoreErrors(uint64_t *a1, const __CFString *a2, int a3)
{
  char *v5;
  char *v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *v8;
  _QWORD *v9;
  _QWORD *v10;

  v5 = (char *)_CPCreateUTF8StringFromCFString(a2);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = CPSqlitePreparedStatement(a1, v5, a3);
  if (v7)
  {
    v8 = v7;
    v9 = malloc_type_malloc(0x20uLL, 0x10200402C28E7A6uLL);
    v10 = v9;
    if (v9)
    {
      *v9 = a1;
      v9[1] = v8;
      *((double *)v9 + 2) = CPMachAbsoluteTime();
    }
    else
    {
      sqlite3_finalize(v8);
    }
  }
  else
  {
    v10 = 0;
  }
  free(v6);
  return v10;
}

void handleSqliteCorruptError(_QWORD *a1, int a2, sqlite3 *a3, uint64_t a4)
{
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Got SQLITE_CORRUPT error.  Will try to delete database, but only if the pragma integrity_check fails.", buf, 2u);
  }
  syslog(4, "Got SQLITE_CORRUPT for db %p.  Will try to delete database, but only if the pragma integrity_check fails.\n", a1);
  runIntegrityCheckAndAbort(a1, a2, a3, a4);
}

void handleSqliteNotADBError(_QWORD *a1, int a2, sqlite3 *a3, uint64_t a4)
{
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Got SQLITE_NOTADB error.  Will try to delete database, but only if the pragma integrity_check fails.", buf, 2u);
  }
  syslog(4, "Got SQLITE_NOTADB for db %p.  Will try to delete database, but only if the pragma integrity_check fails.\n", a1);
  runIntegrityCheckAndAbort(a1, a2, a3, a4);
}

uint64_t handleSqliteIOError(const void *a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  _QWORD v11[7];
  char v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v14 = a5;
    _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Got SQLITE_IOERR with extended error code %i.  Will try to delete database, but only if the pragma integrity_check fails.\n", buf, 8u);
  }
  syslog(4, "Got SQLITE_IOERR with extended error code %i for db %p.  Will try to delete database, but only if the pragma integrity_check fails.\n", a5, a1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __handleSqliteIOError_block_invoke;
  v11[3] = &__block_descriptor_tmp_132;
  v12 = a2;
  v11[4] = a1;
  v11[5] = a3;
  v11[6] = a4;
  return runWithExtendedSQLiteErrorCode_SQLITE_IOERR_BLOCKED((uint64_t)v11);
}

void sqlite3PrintErrorWithStatement(sqlite3 *a1, uint64_t a2, sqlite3_stmt *a3)
{
  sqlite3_errmsg(a1);
  if (a3)
  {
    sqlite3_sql(a3);
    syslog(4, "%s: %s for %s\n");
  }
  else
  {
    syslog(4, "%s: %s\n");
  }
}

void runIntegrityCheckAndAbort(_QWORD *a1, int a2, sqlite3 *a3, uint64_t a4)
{
  uint64_t v7;
  int v8;
  UInt8 *v9;
  const char *v10;
  uint64_t v11;
  char v12;
  sqlite3 *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int v17;
  void (*v18)(_QWORD *, _QWORD);
  sqlite3 *v19;
  sqlite3 *ppDb;

  v19 = a3;
  if (a4)
    sqlite3PrintErrorWithStatement(a3, (uint64_t)"runIntegrityCheckAndAbort", *(sqlite3_stmt **)(a4 + 8));
  if (a1 && (*((_WORD *)a1 + 58) & 0x1000) != 0)
    v7 = CPStartAnInhibitor();
  else
    v7 = 0;
  v8 = sqlite3_close(a3);
  if (v8)
    syslog(4, "Failed to close db handle %p, with SQLite error %i.\n", a1, v8);
  if (!a1 || !*a1 || (v9 = _CPCreateUTF8StringFromCFString((const __CFString *)*a1)) == 0)
    abortAfterFailingToGetPath(a1);
  v10 = (const char *)v9;
  if (integrityCheckDatabase((const char *)v9, &v19, (uint64_t)a1, a2)
    || (sqlite3_close(v19),
        v11 = random() % 5000000,
        syslog(4, "Failed first integrity check, waiting %i useconds.", v11),
        usleep(v11),
        integrityCheckDatabase(v10, &v19, (uint64_t)a1, a2)))
  {
    v12 = 0;
  }
  else
  {
    if (a2)
    {
      syslog(4, "Failed second integrity check, but leaving read-only database in place.");
    }
    else
    {
      syslog(4, "Failed second integrity check, deleting the database files.");
      v13 = v19;
      if (CPIsInternalDevice()
        || CFPreferencesGetAppBooleanValue(CFSTR("CopyCorruptDatabases"), (CFStringRef)*MEMORY[0x1E0C9B228], 0))
      {
        v14 = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0xA585852uLL);
        v15 = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0xDC4422AFuLL);
        v16 = 0;
        ppDb = 0;
        if ((*((_WORD *)a1 + 58) & 0x1000) != 0)
          v16 = CPStartAnInhibitor();
        CPBasename(v10, v14, 1024);
        CPTemporaryPath(v14, v15, 0x400uLL);
        v17 = sqlite3_open(v15, &ppDb);
        if (v17)
        {
          syslog(2, "%s: Unable to sqlite3_open corruptCopyPath %s with sql result code %d", "void deleteCorruptDatabase(char *, sqlite3 *, CPSqliteDatabase *)", v15, v17);
        }
        else
        {
          if (sqlite3_file_control(ppDb, 0, 102, v13))
            syslog(2, "Tried to copy possible corrupt database at path %s, but we failed with SQLite error %i.\n");
          else
            syslog(2, "Database at path %s may be corrupt. Copied it to %s for further investigation.\n");
          sqlite3_close(ppDb);
        }
        if (v16)
          CPStopInhibitorWithIdentifier(v16);
        free(v14);
        free(v15);
      }
      if ((truncateDatabase((uint64_t)a1) & 1) != 0)
      {
        v18 = (void (*)(_QWORD *, _QWORD))a1[10];
        if (v18)
          v18(a1, 0);
      }
      else
      {
        syslog(2, "Failed to delete database at %s!\n");
      }
    }
    v12 = 1;
  }
  sqlite3_close(v19);
  if (v7)
    CPStopInhibitorWithIdentifier(v7);
  if ((v12 & 1) != 0)
    abortAfterFailingIntegrityCheck(v10);
  abortAfterPassingIntegrityCheck(v10);
}

uint64_t integrityCheckDatabase(const char *a1, sqlite3 **a2, uint64_t a3, int a4)
{
  const __CFString *v8;
  UInt8 *v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;

  v8 = *(const __CFString **)(a3 + 248);
  if (v8)
    v9 = _CPCreateUTF8StringFromCFString(v8);
  else
    v9 = 0;
  v10 = *(_DWORD *)(a3 + 260);
  if (v10 >= 4)
    v11 = 0;
  else
    v11 = 0x400000 - (v10 << 20);
  if (a4)
    v12 = 1;
  else
    v12 = 6;
  v13 = sqlite3_open_v2(a1, a2, v11 | v12, (const char *)v9);
  if (v9)
    free(v9);
  if ((v13 - 5) >= 2)
  {
    if (v13)
      return 0;
    else
      return CPSqliteDatabaseIsCorrupted(*a2) ^ 1;
  }
  else
  {
    syslog(4, "Got SQLite error %i when trying to open db at %s.  Skipping integrity check.\n", v13, a1);
    return 1;
  }
}

void abortAfterPassingIntegrityCheck(const char *a1)
{
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exiting after passing the integrity check", buf, 2u);
  }
  syslog(4, "%s passed the integrity check, but we exited anyways\n", a1);
  abort();
}

void abortAfterFailingIntegrityCheck(const char *a1)
{
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exiting after failing the integrity check", buf, 2u);
  }
  syslog(4, "%s failed the integrity check\n", a1);
  abort();
}

void abortAfterFailingToGetPath(const void *a1)
{
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not get path for database", buf, 2u);
  }
  syslog(4, "Could not get path for database at %p\n", a1);
  abort();
}

void __handleSqliteIOError_block_invoke(uint64_t a1)
{
  runIntegrityCheckAndAbort(*(_QWORD **)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(sqlite3 **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t runWithExtendedSQLiteErrorCode_SQLITE_IOERR_BLOCKED(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

CFStringRef Int64SetKeyCopyDescription(_QWORD *a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%llu"), *a1);
}

BOOL Int64SetKeyEqual(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t Int64SetKeyHash(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t CPIntShow(int a1)
{
  return fprintf((FILE *)*MEMORY[0x1E0C80C10], "%d", a1);
}

uint64_t CPFloatShow(float *a1)
{
  return fprintf((FILE *)*MEMORY[0x1E0C80C10], "%f", *a1);
}

CFStringRef copyString(CFStringRef theString)
{
  return CFStringCreateCopy(0, theString);
}

uint64_t CPRecordGetTypeID()
{
  pthread_once(&kCPRecordRegisterClass, (void (*)(void))CPRecordRegisterClass);
  return kCPRecordTypeID;
}

CFDataRef CPRecordRegisterClass()
{
  CFDataRef result;

  kCPRecordTypeID = _CFRuntimeRegisterClass();
  result = CFDataCreate(0, 0, 0);
  __CPNotNullDataValue = (uint64_t)result;
  return result;
}

uint64_t CPRecordCreate(uint64_t a1)
{
  return CPRecordCreateWithRecordID(a1, -1);
}

uint64_t CPRecordCreateWithRecordID(uint64_t a1, int a2)
{
  uint64_t Instance;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double Current;
  uint64_t v8;
  uint64_t v10;

  Instance = _createInstance(a1, a2);
  if (Instance && *(int *)(a1 + 72) >= 1)
  {
    v4 = 0;
    v5 = *MEMORY[0x1E0C9B0D0];
    v6 = 8;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)(a1 + 80) + v6) == 4)
      {
        Current = CFAbsoluteTimeGetCurrent();
        v8 = (uint64_t)Current;
        if (!(uint64_t)Current || *(_QWORD *)(Instance + 8 * v4 + 72) != v8)
        {
          if (v8)
            v10 = (uint64_t)Current;
          else
            v10 = v5;
          CPRecordPropertyLoadHandler(Instance, v4, v10);
        }
      }
      ++v4;
      v6 += 40;
    }
    while (v4 < *(int *)(a1 + 72));
  }
  return Instance;
}

CFStringRef CPRecordCopyTableName(CFStringRef result)
{
  if (result)
    return CFStringCreateWithCString(0, **(const char ***)(result->length + 80), 0x8000100u);
  return result;
}

uint64_t CPRecordCreateCopy(uint64_t a1)
{
  uint64_t v2;
  uint64_t Instance;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  if (!a1)
    return 0;
  v2 = *(_QWORD *)(a1 + 24);
  Instance = _createInstance(v2, *(_DWORD *)(a1 + 32));
  v4 = Instance;
  if (Instance)
  {
    *(_BYTE *)(Instance + 56) = *(_BYTE *)(a1 + 56);
    v5 = *(unsigned int *)(v2 + 72);
    if ((int)v5 >= 1)
    {
      v6 = 0;
      v7 = a1 + 72;
      do
      {
        v8 = *(_QWORD *)(v7 + 8 * v6);
        if (v8)
          v9 = *(_QWORD *)(v4 + 8 * v6 + 72) == v8;
        else
          v9 = 0;
        if (!v9)
          CPRecordPropertyLoadHandler(v4, v6, v8);
        ++v6;
      }
      while (v5 != v6);
    }
  }
  return v4;
}

uint64_t CPRecordGetClass(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t _createInstance(uint64_t a1, int a2)
{
  int v4;
  size_t v5;
  uint64_t Instance;
  uint64_t v7;
  void (*v8)(uint64_t);

  v4 = 8 * *(_DWORD *)(a1 + 72) + 72;
  pthread_once(&kCPRecordRegisterClass, (void (*)(void))CPRecordRegisterClass);
  v5 = v4 - 16;
  Instance = _CFRuntimeCreateInstance();
  v7 = Instance;
  if (Instance)
  {
    bzero((void *)(Instance + 16), v5);
    *(_QWORD *)(v7 + 24) = a1;
    *(_DWORD *)(v7 + 32) = a2;
    v8 = *(void (**)(uint64_t))(a1 + 8);
    if (v8)
      v8(v7);
  }
  return v7;
}

uint64_t CPRecordGetID(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 32);
  else
    return 0xFFFFFFFFLL;
}

uint64_t CPRecordInitializePropertyAndAllowLoading(uint64_t result, int a2, uint64_t a3, int a4)
{
  uint64_t v4;

  if (result && (!a3 || *(_QWORD *)(result + 8 * a2 + 72) != a3))
  {
    v4 = *MEMORY[0x1E0C9B0D0];
    if (a4)
      v4 = 0;
    if (!a3)
      a3 = v4;
    return CPRecordPropertyLoadHandler(result, a2, a3);
  }
  return result;
}

uint64_t CPRecordInitializeProperty(uint64_t result, int a2, uint64_t a3)
{
  if (result && (!a3 || *(_QWORD *)(result + 8 * a2 + 72) != a3))
  {
    if (!a3)
      a3 = *MEMORY[0x1E0C9B0D0];
    return CPRecordPropertyLoadHandler(result, a2, a3);
  }
  return result;
}

uint64_t CPRecordDetachWithRecordID(uint64_t result, int a2)
{
  *(_QWORD *)(result + 16) = 0;
  *(_BYTE *)(result + 56) = 1;
  *(_DWORD *)(result + 32) = a2;
  return result;
}

void CPRecordDestroy(void *context)
{
  void (*v2)(void *);
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  const __CFDictionary *v11;
  const void *v12;

  if (context)
  {
    v2 = *(void (**)(void *))(*((_QWORD *)context + 3) + 24);
    if (v2)
      v2(context);
    v3 = (const void *)*((_QWORD *)context + 5);
    if (v3)
      CFRelease(v3);
    v4 = *((_QWORD *)context + 3);
    if (*(int *)(v4 + 72) >= 1)
    {
      v5 = 0;
      v6 = *MEMORY[0x1E0C9B0D0];
      v7 = 16;
      do
      {
        v8 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(v4 + 80) + v7) + 8);
        if (v8)
        {
          v9 = *((_QWORD *)context + v5 + 9);
          if (v9 && v9 != v6)
          {
            v8();
            v4 = *((_QWORD *)context + 3);
          }
        }
        ++v5;
        v7 += 40;
      }
      while (v5 < *(int *)(v4 + 72));
    }
    v11 = (const __CFDictionary *)*((_QWORD *)context + 6);
    if (v11)
    {
      CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)_ClearOriginalProperty, context);
      CFRelease(*((CFTypeRef *)context + 6));
    }
    v12 = (const void *)*((_QWORD *)context + 8);
    if (v12)
      CFRelease(v12);
  }
}

uint64_t _ClearOriginalProperty(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  if (*MEMORY[0x1E0C9B0D0] != a2 && a2)
  {
    v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) + 80)
                                                       + 40 * (int)result
                                                       + 16)
                                           + 8);
    if (v3)
      return v3(a2);
  }
  return result;
}

uint64_t CPRecordPropertyLoadHandler(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v10;
  BOOL v11;
  void (*v12)(void);
  uint64_t (*v13)(uint64_t);

  v5 = a1 + 8 * a2;
  v8 = *(_QWORD *)(v5 + 72);
  v7 = (uint64_t *)(v5 + 72);
  v6 = v8;
  v10 = *MEMORY[0x1E0C9B0D0];
  if (v8)
    v11 = v6 == v10;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * a2 + 16) + 8);
    if (v12)
      v12();
  }
  if (a3)
  {
    if (v10 != a3)
    {
      v13 = **(uint64_t (***)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * a2 + 16);
      if (v13)
        a3 = v13(a3);
    }
  }
  *v7 = a3;
  return 1;
}

uint64_t CPRecordUnloadProperty(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  __CFDictionary *v4;
  const __CFDictionary *v5;
  const void *Value;
  const void *v7;
  void (*v8)(void);
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t (*v13)(void);

  if (result)
  {
    LODWORD(v2) = a2;
    v3 = result;
    v4 = *(__CFDictionary **)(result + 40);
    if (v4)
      CFDictionaryRemoveValue(v4, (const void *)a2);
    v5 = *(const __CFDictionary **)(v3 + 48);
    if (v5)
    {
      v2 = (int)v2;
      Value = CFDictionaryGetValue(v5, (const void *)(int)v2);
      v7 = (const void *)*MEMORY[0x1E0C9B0D0];
      if (Value)
      {
        if (Value != v7)
        {
          v8 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 24) + 80) + 40 * (int)v2 + 16) + 8);
          if (v8)
            v8();
        }
      }
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 48), (const void *)(int)v2);
    }
    else
    {
      v7 = (const void *)*MEMORY[0x1E0C9B0D0];
      v2 = (int)v2;
    }
    v9 = v3 + 8 * v2;
    v11 = *(_QWORD *)(v9 + 72);
    v10 = (_QWORD *)(v9 + 72);
    result = v11;
    if (v11)
      v12 = result == (_QWORD)v7;
    else
      v12 = 1;
    if (!v12)
    {
      v13 = *(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 24) + 80) + 40 * (int)v2 + 16) + 8);
      if (v13)
        result = v13();
    }
    *v10 = 0;
  }
  return result;
}

CFArrayRef CPRecordCopyChangedProperties(uint64_t a1)
{
  const __CFDictionary *v2;
  CFIndex Count;
  CFIndex v4;
  const void **v5;
  CFArrayRef v6;

  if (!a1)
    return 0;
  v2 = *(const __CFDictionary **)(a1 + 40);
  if (!v2)
    return 0;
  Count = CFDictionaryGetCount(v2);
  if (Count < 1)
    return 0;
  v4 = Count;
  v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), v5, 0);
  v6 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, v4, 0);
  free(v5);
  return v6;
}

void CPRecordMarkPropertyChanged(uint64_t a1, uint64_t a2)
{
  __CFDictionary *Mutable;
  void (*v5)(uint64_t, uint64_t);

  if (a1)
  {
    Mutable = *(__CFDictionary **)(a1 + 40);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
      *(_QWORD *)(a1 + 40) = Mutable;
    }
    CFDictionarySetValue(Mutable, (const void *)(int)a2, (const void *)1);
    v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 24) + 112);
    if (v5)
      v5(a1, a2);
  }
}

void CPRecordSetProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *updated;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  const __CFSet *v10;
  uint64_t v11;
  const __CFDictionary *v12;
  __CFSet *Mutable;
  uint64_t Property;
  const void *v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const __CFDictionary *Value;
  uint64_t v22;
  __CFDictionary *v23;

  updated = _updateDetachedRecord(a1);
  if (!updated)
    return;
  v7 = (uint64_t)updated;
  v8 = updated[3];
  if ((*(_BYTE *)(v8 + 56) & 4) != 0 && *(int *)(v8 + 136) >= 3)
  {
    v9 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 144);
    if (v9)
      v9(updated, a2, a3);
  }
  if (*(_BYTE *)(v7 + 58))
  {
    v10 = *(const __CFSet **)(v7 + 64);
    if (!v10 || (v11 = (int)a2, !CFSetContainsValue(v10, (const void *)(int)a2)))
    {
      v12 = *(const __CFDictionary **)(v7 + 48);
      if (!v12 || (v11 = (int)a2, !CFDictionaryGetValue(v12, (const void *)(int)a2)))
      {
        Mutable = *(__CFSet **)(v7 + 64);
        if (!Mutable)
        {
          Mutable = CFSetCreateMutable(0, *(int *)(*(_QWORD *)(v7 + 24) + 72), 0);
          *(_QWORD *)(v7 + 64) = Mutable;
        }
        v11 = (int)a2;
        CFSetAddValue(Mutable, (const void *)(int)a2);
        Property = CPRecordGetProperty(a1, a2);
        if (Property)
        {
          v15 = (const void *)Property;
          v16 = **(uint64_t (***)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v7 + 24) + 80) + 40 * (int)a2 + 16);
          if (v16)
            v15 = (const void *)v16(Property);
        }
        else
        {
          v15 = (const void *)*MEMORY[0x1E0C9B0D0];
        }
        v23 = *(__CFDictionary **)(v7 + 48);
        if (!v23)
        {
          v23 = CFDictionaryCreateMutable(0, 0, 0, 0);
          *(_QWORD *)(v7 + 48) = v23;
        }
        CFDictionaryAddValue(v23, (const void *)(int)a2, v15);
        CFSetRemoveValue(*(CFMutableSetRef *)(v7 + 64), (const void *)(int)a2);
        if (!a3)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
  }
  else
  {
    v11 = (int)a2;
  }
  if (!a3)
  {
LABEL_19:
    if (a3)
      v17 = a3;
    else
      v17 = *MEMORY[0x1E0C9B0D0];
    CPRecordPropertyLoadHandler(v7, a2, v17);
    goto LABEL_23;
  }
LABEL_18:
  if (*(_QWORD *)(v7 + 8 * v11 + 72) != a3)
    goto LABEL_19;
LABEL_23:
  CPRecordMarkPropertyChanged(v7, a2);
  v18 = *(_QWORD *)(v7 + 16);
  if (!v18)
    return;
  v19 = *(const __CFDictionary **)(v18 + 24);
  if (v19)
  {
    if (CFDictionaryContainsKey(v19, (const void *)v7))
      return;
    v18 = *(_QWORD *)(v7 + 16);
  }
  v20 = *(const __CFDictionary **)(v18 + 40);
  if (!v20
    || (Value = (const __CFDictionary *)CFDictionaryGetValue(v20, *(const void **)(v7 + 24))) == 0
    || !CFDictionaryContainsKey(Value, (const void *)*(int *)(v7 + 32)))
  {
    if ((*(_BYTE *)(*(_QWORD *)(v7 + 16) + 57) & 1) != 0)
    {
      if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 24) + 80) + 40 * (int)v11 + 25) & 1) != 0)
        v22 = 2;
      else
        v22 = 3;
    }
    else
    {
      v22 = 2;
    }
    _addChangeActions((_QWORD *)v7, v22);
  }
}

const void *_updateDetachedRecord(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  __CFDictionary *Cache;
  __CFDictionary *v5;
  int v6;
  const void *InstanceFromDB;

  if (!a1)
    return 0;
  CFRetain((CFTypeRef)a1);
  v2 = *(_QWORD *)(a1 + 16);
  v3 = (const void *)a1;
  if (v2)
  {
    v3 = (const void *)a1;
    if (*(_BYTE *)(a1 + 56))
    {
      Cache = (__CFDictionary *)CPRecordStoreGetCache(v2, *(void **)(a1 + 24));
      v5 = Cache;
      v6 = *(_DWORD *)(a1 + 32);
      if (v6 != -1 && Cache)
      {
        CFDictionarySetValue(Cache, (const void *)v6, (const void *)a1);
        v6 = *(_DWORD *)(a1 + 32);
      }
      InstanceFromDB = _loadInstanceFromDB(*(_QWORD *)(a1 + 16), *(const char ***)(a1 + 24), v6);
      if (InstanceFromDB)
      {
        v3 = InstanceFromDB;
        *(_BYTE *)(a1 + 56) = 0;
      }
      else
      {
        if (v5)
          CFDictionaryRemoveValue(v5, (const void *)*(int *)(a1 + 32));
        v3 = 0;
        *(_BYTE *)(a1 + 57) = 1;
      }
    }
  }
  CFRelease((CFTypeRef)a1);
  return v3;
}

uint64_t CPRecordGetProperty(uint64_t result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  int v5;
  _QWORD *updated;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t *ReaderConnection;

  if (result)
  {
    v3 = (_QWORD *)result;
    v4 = *(_QWORD *)(result + 8 * (int)a2 + 72);
    if (v4)
      goto LABEL_3;
    v5 = a2;
    updated = _updateDetachedRecord(result);
    if (updated)
    {
      v4 = updated[(int)a2 + 9];
      if (v4)
      {
LABEL_3:
        if (*MEMORY[0x1E0C9B0D0] == v4)
          return 0;
        else
          return v4;
      }
      v3 = updated;
    }
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[3] + 80) + 40 * v5 + 16) + 24);
    if (v4)
    {
      v7 = (const __CFDictionary *)v3[5];
      if (v7 && CFDictionaryContainsKey(v7, (const void *)(int)a2))
      {
        v4 = 0;
      }
      else
      {
        v8 = v3[2];
        if (v8)
          ReaderConnection = (uint64_t *)_getReaderConnection(v8);
        else
          ReaderConnection = 0;
        (*(void (**)(_QWORD *, uint64_t, uint64_t *))(*(_QWORD *)(*(_QWORD *)(v3[3] + 80) + 40 * v5 + 16)
                                                             + 24))(v3, a2, ReaderConnection);
        if (ReaderConnection)
          CPSqliteDatabaseReleaseSqliteConnection(ReaderConnection);
        v4 = v3[(int)a2 + 9];
      }
    }
    goto LABEL_3;
  }
  return result;
}

void _addChangeActions(_QWORD *key, uint64_t a2)
{
  const __CFDictionary *v4;
  const void *v5;

  v4 = *(const __CFDictionary **)(key[2] + 32);
  if (!v4)
  {
    *(_QWORD *)(key[2] + 32) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
    v4 = *(const __CFDictionary **)(key[2] + 32);
  }
  v5 = (const void *)((unint64_t)CFDictionaryGetValue(v4, key) | a2);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(key[2] + 32), key, v5);
}

CFMutableDictionaryRef *_getReaderConnection(uint64_t a1)
{
  uint64_t Database;
  CFMutableDictionaryRef *v3;
  CFMutableDictionaryRef *v4;

  Database = CPRecordStoreGetDatabase(a1);
  if (!Database)
    return 0;
  v3 = (CFMutableDictionaryRef *)CPSqliteDatabaseConnectionForReading(Database);
  v4 = v3;
  if (v3 && *(_DWORD *)(a1 + 96) == -1 && (*(_BYTE *)(a1 + 57) & 2) == 0)
    *(_DWORD *)(a1 + 96) = CPSqliteConnectionIntegerForProperty(v3, CFSTR("__CPRecordSequenceNumber"));
  return v4;
}

uint64_t CPRecordGetCachedProperty(uint64_t result, int a2)
{
  if (result)
  {
    if (*MEMORY[0x1E0C9B0D0] == *(_QWORD *)(result + 8 * a2 + 72))
      return 0;
    else
      return *(_QWORD *)(result + 8 * a2 + 72);
  }
  return result;
}

uint64_t CPRecordGetIntegerProperty(uint64_t a1, uint64_t a2)
{
  return CPRecordGetProperty(a1, a2);
}

const void *CPRecordGetOriginalProperty(const void *result, uint64_t a2)
{
  uint64_t v3;
  const __CFDictionary *v4;

  if (result)
  {
    v3 = (uint64_t)result;
    v4 = (const __CFDictionary *)*((_QWORD *)result + 6);
    if (v4 && (result = CFDictionaryGetValue(v4, (const void *)(int)a2)) != 0)
    {
      if (result == (const void *)*MEMORY[0x1E0C9B0D0])
        return 0;
    }
    else
    {
      return (const void *)CPRecordGetProperty(v3, a2);
    }
  }
  return result;
}

uint64_t CPRecordIsDeleted(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 57);
}

uint64_t CPRecordCopyProperty(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t result;
  uint64_t (**v5)(void);

  v2 = a2;
  result = CPRecordGetProperty(a1, a2);
  if (result)
  {
    v5 = *(uint64_t (***)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * v2 + 16);
    if (*v5)
      return (*v5)();
  }
  return result;
}

uint64_t CPRecordShow(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  FILE **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Property;
  uint64_t v9;
  void (*v10)(uint64_t);
  int v11;
  const __CFString *v13;
  const __CFString *v14;
  char buffer[2048];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 24);
    v3 = *(uint64_t (**)(uint64_t))(v2 + 40);
    if (v3)
    {
      return v3(result);
    }
    else
    {
      v4 = *(unsigned int *)(v2 + 72);
      v5 = (FILE **)MEMORY[0x1E0C80C10];
      result = fprintf((FILE *)*MEMORY[0x1E0C80C10], "CPRecord/%s instance %p:\n", *(const char **)v2, (const void *)result);
      if ((int)v4 >= 1)
      {
        v6 = 0;
        v7 = 0;
        do
        {
          Property = CPRecordGetProperty(v1, v7);
          fprintf(*v5, " %s (%d) = ", *(const char **)(*(_QWORD *)(*(_QWORD *)(v1 + 24) + 80) + v6), v7);
          v9 = *(_QWORD *)(*(_QWORD *)(v1 + 24) + 80);
          if (Property && (v10 = *(void (**)(uint64_t))(*(_QWORD *)(v9 + v6 + 16) + 16)) != 0)
          {
            v10(Property);
          }
          else
          {
            v11 = *(_DWORD *)(v9 + v6 + 8);
            if ((v11 - 6) < 2 || v11 == 2)
            {
              v13 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), Property);
              if (v13)
              {
                v14 = v13;
                CFStringGetCString(v13, buffer, 2048, 0x8000100u);
                fputs(buffer, *v5);
                CFRelease(v14);
              }
              else
              {
                fwrite("(nil)", 5uLL, 1uLL, *v5);
              }
            }
            else if (v11 == 1)
            {
              fprintf(*v5, "%d");
            }
            else
            {
              fprintf(*v5, "%p");
            }
          }
          result = fputc(10, *v5);
          v7 = (v7 + 1);
          v6 += 40;
        }
        while (40 * v4 != v6);
      }
    }
  }
  return result;
}

uint64_t CPRecordGetPropertyDescriptor(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v4;

  result = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (*(_DWORD *)(v4 + 72) <= (signed int)a2)
      return 0;
    else
      return *(_QWORD *)(v4 + 80) + 40 * a2;
  }
  return result;
}

uint64_t CPRecordGetStore(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

void CPRecordMarkChanged(_QWORD *a1)
{
  uint64_t v1;

  if (a1)
  {
    v1 = a1[2];
    if (v1)
    {
      if ((*(_BYTE *)(v1 + 57) & 1) != 0 && (*(_BYTE *)(a1[3] + 56) & 2) != 0)
        _addChangeActions(a1, 1);
    }
  }
}

uint64_t CPRecordStoreSetContext(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 88) = a2;
  return result;
}

uint64_t CPRecordStoreGetContext(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

void CPRecordStoreSetValueForProperty(uint64_t a1, void *key, const void *a3)
{
  __CFDictionary *Mutable;
  const void *v7;

  Mutable = *(__CFDictionary **)(a1 + 80);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    *(_QWORD *)(a1 + 80) = Mutable;
  }
  if (a3)
    v7 = a3;
  else
    v7 = (const void *)*MEMORY[0x1E0C9B0D0];
  CFDictionarySetValue(Mutable, key, v7);
}

CFStringRef CPRecordStoreCopyValueForProperty(uint64_t a1, const __CFString *key)
{
  const __CFDictionary *v4;
  const __CFString *Value;
  CFStringRef v6;
  uint64_t Database;

  v4 = *(const __CFDictionary **)(a1 + 80);
  if (v4)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v4, key);
    if (Value)
    {
      v6 = Value;
      CFRetain(Value);
LABEL_6:
      if ((CFStringRef)*MEMORY[0x1E0C9B0D0] == v6)
      {
        CFRelease(v6);
        return 0;
      }
      return v6;
    }
  }
  Database = CPRecordStoreGetDatabase(a1);
  if (!Database)
    return 0;
  v6 = CPSqliteDatabaseCopyValueForProperty(Database, key);
  if (v6)
    goto LABEL_6;
  return v6;
}

uint64_t CPRecordStoreGetDatabase(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;

  result = *(_QWORD *)(a1 + 8);
  if (!result)
  {
    v3 = CPSqliteDatabaseCreateWithPath(*(const __CFString **)a1);
    *(_QWORD *)(a1 + 8) = v3;
    CPSqliteDatabaseSetSetupHandler((uint64_t)v3, (uint64_t)_sqliteDatabaseSetupHandler, a1);
    return *(_QWORD *)(a1 + 8);
  }
  return result;
}

void CPRecordStoreRemoveProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t Database;
  __CFDictionary *v5;

  Database = CPRecordStoreGetDatabase(a1);
  if (Database)
  {
    CPSqliteDatabaseRemoveProperty(Database, a2);
    v5 = *(__CFDictionary **)(a1 + 80);
    if (v5)
      CFDictionaryRemoveValue(v5, a2);
  }
}

uint64_t CPRecordIndexOfPropertyNamed(const char **a1, int a2, char *__s1)
{
  uint64_t v5;
  uint64_t v6;

  if (a2 < 1)
    return 0;
  v5 = 0;
  v6 = a2;
  while (strcmp(__s1, *a1))
  {
    ++v5;
    a1 += 5;
    if (v6 == v5)
      return v6;
  }
  return v5;
}

_DWORD *CPRecordStoreCreateWithPathAndOptions(const __CFString *a1, char a2)
{
  _DWORD *v4;

  v4 = malloc_type_calloc(1uLL, 0x80uLL, 0x10F0040CCCEF908uLL);
  if (v4)
  {
    *(_QWORD *)v4 = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1);
    v4[24] = -1;
    *((_BYTE *)v4 + 57) = *((_BYTE *)v4 + 57) & 0xF9 | (2 * (a2 & 3));
  }
  return v4;
}

_DWORD *CPRecordStoreCreateWithPath(const __CFString *a1)
{
  return CPRecordStoreCreateWithPathAndOptions(a1, 0);
}

uint64_t CPRecordStoreSetSetupHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 64) = a2;
  result = *(_QWORD *)(a1 + 8);
  if (result)
    return CPSqliteDatabaseSetSetupHandler(result, (uint64_t)_sqliteDatabaseSetupHandler, a1);
  return result;
}

void _sqliteDatabaseSetupHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);
  const __CFSet *v6;
  _QWORD v7[2];

  v5 = *(void (**)(uint64_t, uint64_t))(a3 + 64);
  if (v5)
  {
    v5(a3, a2);
  }
  else
  {
    CPSqliteDatabaseDefaultSetupHandler(a1, a2);
    v6 = *(const __CFSet **)(a3 + 72);
    if (v6)
    {
      v7[0] = a3;
      v7[1] = a2;
      CFSetApplyFunction(v6, (CFSetApplierFunction)_createTablesForClassInStore, v7);
    }
  }
}

uint64_t CPRecordStoreLogChanges(uint64_t result, char a2)
{
  *(_BYTE *)(result + 57) = *(_BYTE *)(result + 57) & 0xFE | a2;
  return result;
}

uint64_t CPRecordStoreIsLoggingChanges(uint64_t a1)
{
  return *(_BYTE *)(a1 + 57) & 1;
}

uint64_t CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionType(uint64_t a1, int a2, unsigned int a3, CFErrorRef *a4)
{
  return _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(a1, 1, a2, a3, a4);
}

uint64_t _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(uint64_t result, int a2, int a3, unsigned int a4, CFErrorRef *a5)
{
  uint64_t v9;
  uint64_t Database;
  CFMutableDictionaryRef *v11;
  int v12;
  int v13;
  CFErrorRef v14;
  _QWORD v15[3];

  if (result)
  {
    v9 = result;
    Database = CPRecordStoreGetDatabase(result);
    result = CPSqliteDatabaseConnectionForWriting(Database);
    if (result)
    {
      v11 = (CFMutableDictionaryRef *)result;
      CPSqliteConnectionBeginTransactionType(result, a4);
      v12 = CPSqliteConnectionIntegerForProperty(v11, CFSTR("__CPRecordSequenceNumber"));
      if (!a3 || (v13 = *(_DWORD *)(v9 + 96), v13 == -1) || v12 == v13)
      {
        *(_DWORD *)(v9 + 96) = v12;
        v15[1] = v11;
        v15[2] = 0;
        v15[0] = v9;
        if (a2)
          _CPRecordStoreSaveAddedRecords(v15);
        else
          _CPRecordStoreSaveDeletedRecords(v15);
        return 1;
      }
      else if (a5)
      {
        v14 = CFErrorCreate(0, CFSTR("CPRecord"), 2, 0);
        result = 0;
        *a5 = v14;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CPRecordStoreProcessDeletedRecordsWithPolicyAndTransactionType(uint64_t a1, int a2, unsigned int a3, CFErrorRef *a4)
{
  return _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(a1, 0, a2, a3, a4);
}

uint64_t CPRecordProcessAddImmediate(uint64_t a1, const void *a2)
{
  uint64_t result;
  uint64_t v5;
  signed int Value;
  __CFSet *Mutable;
  _QWORD v8[3];

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = CPRecordStoreGetDatabase(a1);
      if (result)
      {
        result = CPSqliteDatabaseConnectionForWriting(result);
        if (result)
        {
          v5 = result;
          result = *(_QWORD *)(a1 + 24);
          if (result)
          {
            result = CFDictionaryContainsKey((CFDictionaryRef)result, a2);
            if ((_DWORD)result)
            {
              v8[1] = v5;
              v8[2] = 0;
              v8[0] = a1;
              Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), a2);
              CPRecordStoreSaveRecord((uint64_t)a2, Value, (uint64_t)v8);
              CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 24), a2);
              if (*(_BYTE *)(a1 + 56))
              {
                Mutable = *(__CFSet **)(a1 + 48);
                if (!Mutable)
                {
                  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
                  *(_QWORD *)(a1 + 48) = Mutable;
                }
                CFSetAddValue(Mutable, a2);
              }
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

void CPRecordStoreSaveRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  const char **v6;
  const char *v7;
  int v8;
  const char **v9;
  const char *v10;
  const __CFString *v11;
  __CFDictionary *Cache;
  sqlite3_int64 v13;
  uint64_t v14;
  int RecordIDForRowid;
  uint64_t v16;
  sqlite3_int64 Insert;
  const __CFDictionary *v18;
  CFIndex Count;
  uint64_t v20;
  unint64_t v21;
  const void **v22;
  size_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  signed int v31;
  uint64_t v32;
  __CFArray *v33;
  const void *v34;
  void (*v35)(uint64_t);
  size_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFArray *Mutable;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, _QWORD);
  const char *v51;
  const void *v52;
  const __CFDictionary *v53;
  uint64_t v54;
  size_t v55;
  const __CFDictionary *v56;
  uint64_t v57;
  const char **v58;
  uint64_t v59;
  const void *v60;
  CFAllocatorRef v61;
  unsigned int v62;
  uint64_t v63;

  v3 = a3;
  v63 = *MEMORY[0x1E0C80C00];
  v6 = *(const char ***)(a1 + 24);
  v7 = v6[6];
  if (v7)
    ((void (*)(uint64_t, _QWORD))v7)(a1, *(_QWORD *)(a3 + 8));
  v62 = 0;
  v8 = *(_DWORD *)(a1 + 32);
  _updateModificationDateProperties(a1);
  v9 = (const char **)CPRecordStoreWriteColumnsForRecord(a1, (int *)&v62, 1);
  v10 = *v6;
  v61 = (CFAllocatorRef)*MEMORY[0x1E0C9AE00];
  v11 = CFStringCreateWithCString(v61, v10, 0x8000100u);
  Cache = (__CFDictionary *)CPRecordStoreGetCache(*(_QWORD *)v3, v6);
  v13 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v13 == -1)
    goto LABEL_8;
  v14 = *(_QWORD *)v3;
  if (!*(_QWORD *)v3)
    goto LABEL_8;
  if ((int)v13 >= -1)
    goto LABEL_9;
  if ((v13 & 0x7FFFFFFF) >= *(_DWORD *)(v14 + 104))
LABEL_8:
    v13 = -1;
  else
    v13 = *(_QWORD *)(*(_QWORD *)(v14 + 112) + 8 * (v13 & 0x7FFFFFFF));
LABEL_9:
  CPSqliteConnectionAddRecordWithRowid(*(CFMutableDictionaryRef **)(v3 + 8), v11, v13, v9, v62);
  RecordIDForRowid = *(_DWORD *)(a1 + 32);
  if (RecordIDForRowid == -1)
  {
    v16 = *(_QWORD *)v3;
    Insert = CPSqliteConnectionRowidOfLastInsert(*(_QWORD *)(v3 + 8));
    RecordIDForRowid = CPRecordStoreGetRecordIDForRowid(v16, Insert);
    *(_DWORD *)(a1 + 32) = RecordIDForRowid;
  }
  if (Cache)
    CFDictionarySetValue(Cache, (const void *)RecordIDForRowid, (const void *)a1);
  CFRelease(v11);
  free(v9);
  v18 = *(const __CFDictionary **)(a1 + 40);
  if (!v18)
  {
    if (v8 != -1)
      goto LABEL_62;
    goto LABEL_39;
  }
  *(_QWORD *)(a1 + 40) = 0;
  if (v8 == -1)
  {
LABEL_39:
    v56 = v18;
    v57 = a2;
    v58 = v6;
    v59 = v3;
    v60 = &v54;
    v36 = *(unsigned int *)(*(_QWORD *)(a1 + 24) + 72);
    ((void (*)(void))MEMORY[0x1E0C80A78])();
    v37 = (char *)&v54 - ((v36 + 15) & 0x1FFFFFFF0);
    if ((int)v36 < 1)
    {
LABEL_60:
      v3 = v59;
LABEL_61:
      LOBYTE(a2) = v57;
      v6 = v58;
      v18 = v56;
      goto LABEL_62;
    }
    bzero((char *)&v54 - ((v36 + 15) & 0x1FFFFFFF0), v36);
    v38 = 0;
    v39 = 0;
    v40 = v36 - 1;
    v41 = 1;
    v55 = v36 - 1;
    while (v37[v39])
    {
LABEL_59:
      ++v39;
      ++v41;
      v38 += 40;
      if (v39 == v36)
        goto LABEL_60;
    }
    v42 = *(_QWORD *)(a1 + 24);
    v43 = *(_QWORD *)(v42 + 80);
    if ((*(_BYTE *)(v43 + 40 * v39 + 25) & 2) == 0)
    {
      v44 = *(_QWORD *)(v43 + 40 * v39 + 16);
      v45 = *(_QWORD *)(v44 + 40);
      if (v45)
      {
        if (v39 < v40)
        {
          Mutable = 0;
          v47 = v38;
          v48 = (char *)v41;
          do
          {
            v49 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + v47;
            if ((*(_BYTE *)(v49 + 65) & 2) == 0 && *(_QWORD *)(*(_QWORD *)(v49 + 56) + 40) == v45)
            {
              if (!Mutable)
              {
                Mutable = CFArrayCreateMutable(v61, v36, 0);
                CFArrayAppendValue(Mutable, (const void *)v39);
              }
              CFArrayAppendValue(Mutable, v48);
              v48[(_QWORD)v37] = 1;
            }
            ++v48;
            v47 += 40;
          }
          while ((char *)v36 != v48);
          v42 = *(_QWORD *)(a1 + 24);
          if (Mutable)
          {
            (*(void (**)(uint64_t, __CFArray *, _QWORD))(*(_QWORD *)(*(_QWORD *)(v42 + 80) + 40 * v39 + 16)
                                                                 + 40))(a1, Mutable, *(_QWORD *)(v59 + 8));
            CFRelease(Mutable);
            v40 = v55;
            goto LABEL_58;
          }
          v40 = v55;
        }
        v44 = *(_QWORD *)(*(_QWORD *)(v42 + 80) + 40 * v39 + 16);
      }
      v50 = *(void (**)(uint64_t, uint64_t, _QWORD))(v44 + 32);
      if (v50)
        v50(a1, v39, *(_QWORD *)(v59 + 8));
    }
LABEL_58:
    v37[v39] = 1;
    goto LABEL_59;
  }
  Count = CFDictionaryGetCount(v18);
  if (Count)
  {
    v20 = Count;
    v57 = a2;
    v58 = v6;
    v54 = (uint64_t)&v54;
    MEMORY[0x1E0C80A78](Count);
    v22 = (const void **)((char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v21 >= 0x200)
      v23 = 512;
    else
      v23 = v21;
    bzero((char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
    v56 = v18;
    CFDictionaryGetKeysAndValues(v18, v22, 0);
    MEMORY[0x1E0C80A78](v24);
    v25 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v20 >= 1)
    {
      bzero((char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
      v26 = 0;
      v59 = v3;
      while (1)
      {
        if (!v25[v26])
        {
          v27 = v22[v26];
          v28 = *(_QWORD *)(a1 + 24);
          v29 = *(_QWORD *)(*(_QWORD *)(v28 + 80) + 40 * (int)v27 + 16);
          v30 = *(_QWORD *)(v29 + 40);
          if (!v30)
            goto LABEL_34;
          v31 = v22[v26];
          v32 = v26 + 1;
          if (v26 + 1 >= v20)
            goto LABEL_33;
          v60 = (const void *)(int)v27;
          v55 = (size_t)v27;
          v33 = 0;
          do
          {
            v34 = (const void *)SLODWORD(v22[v32]);
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * (int)v34 + 16) + 40) == v30)
            {
              if (!v33)
              {
                v33 = CFArrayCreateMutable(v61, v20, 0);
                CFArrayAppendValue(v33, v60);
              }
              CFArrayAppendValue(v33, v34);
              v25[v32] = 1;
            }
            ++v32;
          }
          while (v20 != v32);
          v28 = *(_QWORD *)(a1 + 24);
          if (!v33)
          {
            v3 = v59;
            v31 = (int)v60;
LABEL_33:
            v29 = *(_QWORD *)(*(_QWORD *)(v28 + 80) + 40 * v31 + 16);
LABEL_34:
            v35 = *(void (**)(uint64_t))(v29 + 32);
            if (v35)
              v35(a1);
            goto LABEL_36;
          }
          v3 = v59;
          (*(void (**)(uint64_t, __CFArray *, _QWORD))(*(_QWORD *)(*(_QWORD *)(v28 + 80) + 40 * (int)v60 + 16)
                                                               + 40))(a1, v33, *(_QWORD *)(v59 + 8));
          CFRelease(v33);
        }
LABEL_36:
        v25[v26++] = 1;
        if (v26 == v20)
          goto LABEL_61;
      }
    }
    goto LABEL_61;
  }
LABEL_62:
  if ((*(_BYTE *)(*(_QWORD *)v3 + 57) & 1) != 0
    && (a2 & 1) != 0
    && (*(_BYTE *)(*(_QWORD *)(a1 + 24) + 56) & 2) != 0)
  {
    _logRecordEvent(*(CFMutableDictionaryRef **)(v3 + 8), a1, 0, 0);
  }
  v51 = v6[13];
  if (v51)
    ((void (*)(uint64_t, _QWORD, const __CFDictionary *))v51)(a1, *(_QWORD *)(v3 + 8), v18);
  if (v18)
    CFRelease(v18);
  v52 = *(const void **)(a1 + 40);
  if (v52)
  {
    CFRelease(v52);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v53 = *(const __CFDictionary **)(a1 + 48);
  if (v53)
  {
    CFDictionaryApplyFunction(v53, (CFDictionaryApplierFunction)_ClearOriginalProperty, (void *)a1);
    CFRelease(*(CFTypeRef *)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
  }
  *(_BYTE *)(a1 + 58) = 1;
}

uint64_t CPRecordProcessChangesImmediate(uint64_t a1, const void *a2)
{
  uint64_t result;
  uint64_t v5;
  signed int Value;
  _QWORD v7[3];

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = CPRecordStoreGetDatabase(a1);
      if (result)
      {
        result = CPSqliteDatabaseConnectionForWriting(result);
        if (result)
        {
          v5 = result;
          result = *(_QWORD *)(a1 + 32);
          if (result)
          {
            result = CFDictionaryContainsKey((CFDictionaryRef)result, a2);
            if ((_DWORD)result)
            {
              v7[1] = v5;
              v7[2] = 0;
              v7[0] = a1;
              Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
              CPRecordStoreUpdateRecord((uint64_t)a2, Value, (uint64_t)v7);
              CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 32), a2);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

void CPRecordStoreUpdateRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFMutableDictionaryRef **v3;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD);
  __int128 *v8;
  const char *v9;
  const __CFString *v10;
  CFMutableDictionaryRef *v11;
  sqlite3_int64 v12;
  const __CFDictionary *v13;
  CFIndex Count;
  uint64_t v15;
  unint64_t v16;
  const void **v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  signed int v26;
  uint64_t v27;
  __CFArray *Mutable;
  const void *v29;
  void (*v30)(uint64_t);
  void (*v31)(uint64_t, CFMutableDictionaryRef *, const __CFDictionary *);
  const __CFDictionary *v32;
  uint64_t v33;
  const __CFDictionary *v34;
  uint64_t v35;
  uint64_t v36;
  CFMutableDictionaryRef **v37;
  const void *v38;
  CFAllocatorRef v39;
  const void *v40;
  unsigned int v41;
  uint64_t v42;

  v3 = (CFMutableDictionaryRef **)a3;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(void (**)(uint64_t, _QWORD))(v6 + 48);
  if (v7)
    v7(a1, *(_QWORD *)(a3 + 8));
  v41 = 0;
  _updateModificationDateProperties(a1);
  v8 = (__int128 *)CPRecordStoreWriteColumnsForRecord(a1, (int *)&v41, 0);
  v9 = *(const char **)v6;
  v39 = (CFAllocatorRef)*MEMORY[0x1E0C9AE00];
  v10 = CFStringCreateWithCString(v39, v9, 0x8000100u);
  v11 = *v3;
  if (!*v3)
    goto LABEL_42;
  v12 = *(int *)(a1 + 32);
  if ((int)v12 < -1)
  {
    if ((v12 & 0x7FFFFFFF) < *((_DWORD *)v11 + 26))
    {
      v12 = *((_QWORD *)v11[14] + (v12 & 0x7FFFFFFF));
      goto LABEL_7;
    }
LABEL_42:
    v12 = -1;
  }
LABEL_7:
  CPSqliteConnectionUpdateRecord(v3[1], v10, v12, v8, v41);
  CFRelease(v10);
  free(v8);
  v13 = *(const __CFDictionary **)(a1 + 40);
  if (v13)
  {
    *(_QWORD *)(a1 + 40) = 0;
    Count = CFDictionaryGetCount(v13);
    if (Count)
    {
      v15 = Count;
      v35 = a2;
      v36 = v6;
      v33 = (uint64_t)&v33;
      MEMORY[0x1E0C80A78](Count);
      v17 = (const void **)((char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
      if (v16 >= 0x200)
        v18 = 512;
      else
        v18 = v16;
      bzero((char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
      v34 = v13;
      CFDictionaryGetKeysAndValues(v13, v17, 0);
      MEMORY[0x1E0C80A78](v19);
      v20 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v15 >= 1)
      {
        bzero((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
        v21 = 0;
        v37 = v3;
        do
        {
          if (!v20[v21])
          {
            v22 = v17[v21];
            v23 = *(_QWORD *)(a1 + 24);
            v24 = *(_QWORD *)(*(_QWORD *)(v23 + 80) + 40 * (int)v22 + 16);
            v25 = *(_QWORD *)(v24 + 40);
            if (!v25)
              goto LABEL_27;
            v26 = v17[v21];
            v27 = v21 + 1;
            if (v21 + 1 >= v15)
              goto LABEL_26;
            v40 = (const void *)(int)v22;
            v38 = v22;
            Mutable = 0;
            do
            {
              v29 = (const void *)SLODWORD(v17[v27]);
              if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * (int)v29 + 16) + 40) == v25)
              {
                if (!Mutable)
                {
                  Mutable = CFArrayCreateMutable(v39, v15, 0);
                  CFArrayAppendValue(Mutable, v40);
                }
                CFArrayAppendValue(Mutable, v29);
                v20[v27] = 1;
              }
              ++v27;
            }
            while (v15 != v27);
            v23 = *(_QWORD *)(a1 + 24);
            if (!Mutable)
            {
              v3 = v37;
              v26 = (int)v40;
LABEL_26:
              v24 = *(_QWORD *)(*(_QWORD *)(v23 + 80) + 40 * v26 + 16);
LABEL_27:
              v30 = *(void (**)(uint64_t))(v24 + 32);
              if (v30)
                v30(a1);
              goto LABEL_29;
            }
            v3 = v37;
            (*(void (**)(uint64_t, __CFArray *, CFMutableDictionaryRef *))(*(_QWORD *)(*(_QWORD *)(v23 + 80)
                                                                                               + 40 * (int)v40
                                                                                               + 16)
                                                                                   + 40))(a1, Mutable, v37[1]);
            CFRelease(Mutable);
          }
LABEL_29:
          v20[v21++] = 1;
        }
        while (v21 != v15);
      }
      v13 = v34;
      LOBYTE(a2) = v35;
      v6 = v36;
    }
  }
  if ((a2 & 1) != 0 && (*((_BYTE *)*v3 + 57) & 1) != 0 && (*(_BYTE *)(*(_QWORD *)(a1 + 24) + 56) & 2) != 0)
    _logRecordEvent(v3[1], a1, 1, v13);
  v31 = *(void (**)(uint64_t, CFMutableDictionaryRef *, const __CFDictionary *))(v6 + 104);
  if (v31)
    v31(a1, v3[1], v13);
  if (v13)
    CFRelease(v13);
  v32 = *(const __CFDictionary **)(a1 + 48);
  if (v32)
  {
    CFDictionaryApplyFunction(v32, (CFDictionaryApplierFunction)_ClearOriginalProperty, (void *)a1);
    CFRelease(*(CFTypeRef *)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
  }
}

uint64_t CPRecordStoreProcessAddedRecordsWithPolicy(uint64_t a1, int a2, CFErrorRef *a3)
{
  return _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(a1, 1, a2, 0, a3);
}

uint64_t CPRecordStoreProcessAddedRecords(uint64_t a1, CFErrorRef *a2)
{
  return _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(a1, 1, 0, 0, a2);
}

uint64_t CPRecordStoreGetSequenceNumber(uint64_t a1)
{
  CFMutableDictionaryRef *ReaderConnection;
  uint64_t *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  ReaderConnection = _getReaderConnection(a1);
  if (!ReaderConnection)
    return 0;
  v2 = (uint64_t *)ReaderConnection;
  v3 = CPSqliteConnectionIntegerForProperty(ReaderConnection, CFSTR("__CPRecordSequenceNumber"));
  CPSqliteDatabaseReleaseSqliteConnection(v2);
  return v3;
}

uint64_t CPRecordStoreGetLastSequenceNumber(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 96);
  else
    return 0xFFFFFFFFLL;
}

uint64_t CPRecordStoreGetRecordIDForRowid(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const __CFSet *Mutable;
  void *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t value;

  value = a2;
  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = a2;
  if ((unint64_t)(a2 - 0x80000000) <= 0xFFFFFFFF7FFFFFFELL)
  {
    Mutable = *(const __CFSet **)(a1 + 120);
    if (!Mutable)
    {
      v5 = malloc_type_malloc(0x8000uLL, 0x100004000313F17uLL);
      *(_QWORD *)(a1 + 112) = v5;
      if (!v5)
        return 0xFFFFFFFFLL;
      Mutable = CFSetCreateMutable(0, 4096, &Int64SetKeyCallbacks);
      *(_QWORD *)(a1 + 120) = Mutable;
      *(_DWORD *)(a1 + 108) = 4096;
    }
    v6 = *(_BYTE **)(a1 + 112);
    v7 = CFSetGetValue(Mutable, &value);
    if (v7)
      return ((unint64_t)(v7 - v6) >> 3) | 0x80000000;
    v8 = *(unsigned int *)(a1 + 104);
    if (*(_DWORD *)(a1 + 108) != (_DWORD)v8)
    {
LABEL_16:
      v13 = &v6[8 * (int)v8];
      *v13 = value;
      *(_DWORD *)(a1 + 104) = v8 + 1;
      v2 = v8 | 0x80000000;
      CFSetSetValue(*(CFMutableSetRef *)(a1 + 120), v13);
      return v2;
    }
    v9 = (3 * (int)v8) >> 1;
    v10 = reallocf(v6, 8 * v9);
    if (v10)
    {
      v6 = v10;
      if (v10 != *(_BYTE **)(a1 + 112))
      {
        CFSetRemoveAllValues(*(CFMutableSetRef *)(a1 + 120));
        if ((int)v8 >= 1)
        {
          v11 = v8;
          v12 = v6;
          do
          {
            CFSetSetValue(*(CFMutableSetRef *)(a1 + 120), v12);
            v12 += 8;
            --v11;
          }
          while (v11);
        }
        *(_QWORD *)(a1 + 112) = v6;
      }
      *(_DWORD *)(a1 + 108) = v9;
      goto LABEL_16;
    }
    return 0xFFFFFFFFLL;
  }
  return v2;
}

uint64_t CPRecordStoreGetRowidForRecordID(uint64_t a1, int a2)
{
  if (!a1)
    return -1;
  if (a2 >= -1)
    return a2;
  if ((a2 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104))
    return *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * (a2 & 0x7FFFFFFF));
  else
    return -1;
}

CFArrayRef CPRecordStoreCopyAddedRecords(uint64_t a1)
{
  return _createRecordsArrayFromDictionary(*(const __CFDictionary **)(a1 + 24), MEMORY[0x1E0C9B378]);
}

CFArrayRef _createRecordsArrayFromDictionary(const __CFDictionary *a1, const CFArrayCallBacks *a2)
{
  CFIndex Count;
  CFIndex v5;
  const void **v6;
  CFArrayRef v7;

  if (!a1)
    return 0;
  Count = CFDictionaryGetCount(a1);
  if (Count < 1)
    return 0;
  v5 = Count;
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(a1, v6, 0);
  v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, v5, a2);
  free(v6);
  return v7;
}

CFArrayRef CPRecordStoreCopyChangedRecords(uint64_t a1)
{
  return _createRecordsArrayFromDictionary(*(const __CFDictionary **)(a1 + 32), MEMORY[0x1E0C9B378]);
}

__CFArray *CPRecordStoreCopyDeletedRecords(uint64_t a1)
{
  const __CFDictionary *v2;
  CFIndex Count;
  uint64_t v4;
  __CFArray *Mutable;
  const void **v6;
  uint64_t i;
  const __CFDictionary *Value;
  CFIndex v9;
  uint64_t v10;
  const void **v11;
  const void **v12;
  uint64_t v13;

  v2 = *(const __CFDictionary **)(a1 + 40);
  if (!v2)
    return 0;
  Count = CFDictionaryGetCount(v2);
  if (!Count)
    return 0;
  v4 = Count;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v6 = (const void **)malloc_type_malloc(8 * v4, 0x2004093837F09uLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), v6, 0);
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v6[i]);
      v9 = CFDictionaryGetCount(Value);
      if (v9)
      {
        v10 = v9;
        v11 = (const void **)malloc_type_malloc(8 * v9, 0xC0040B8AA526DuLL);
        CFDictionaryGetKeysAndValues(Value, 0, v11);
        v12 = v11;
        if (v10 >= 1)
        {
          do
          {
            v13 = (uint64_t)*v12++;
            CFArrayAppendValue(Mutable, *(const void **)(v13 + 16));
            --v10;
          }
          while (v10);
        }
        free(v11);
      }
    }
  }
  free(v6);
  return Mutable;
}

CFArrayRef CPRecordStoreCopyDeletedRecordIDsOfClass(uint64_t a1, const void *a2)
{
  const __CFDictionary *Value;

  Value = *(const __CFDictionary **)(a1 + 40);
  if (Value)
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, a2);
  return _createRecordsArrayFromDictionary(Value, 0);
}

uint64_t CPRecordStoreProcessAddedRecordsOfClassWithPolicyAndTransactionType(uint64_t a1, uint64_t a2, int a3, unsigned int a4, CFErrorRef *a5)
{
  return CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionTypeMatchingPredicate(a1, (unsigned int (*)(uint64_t, const void *, uint64_t))_matchClassPredicate, a2, a3, a4, a5);
}

uint64_t CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionTypeMatchingPredicate(uint64_t a1, unsigned int (*a2)(uint64_t, const void *, uint64_t), uint64_t a3, int a4, unsigned int a5, CFErrorRef *a6)
{
  uint64_t result;
  uint64_t Database;
  uint64_t v14;
  uint64_t v15;
  CFMutableDictionaryRef *v16;
  int v17;
  int v18;
  int v19;
  CFIndex Count;
  const void **v21;
  const void **v22;
  const void **v23;
  const void *v24;
  const __CFSet *v25;
  signed int Value;
  _QWORD v27[3];

  result = 0;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      v27[0] = a1;
      v27[2] = 0;
      Database = CPRecordStoreGetDatabase(a1);
      if (Database)
      {
        v14 = Database;
        v15 = CPSqliteDatabaseConnectionForWriting(Database);
        if (v15)
        {
          v16 = (CFMutableDictionaryRef *)v15;
          CPSqliteConnectionBeginTransactionType(v15, a5);
          v27[1] = v16;
          v17 = CPSqliteConnectionIntegerForProperty(v16, CFSTR("__CPRecordSequenceNumber"));
          if (a4)
          {
            v18 = *(_DWORD *)(a1 + 96);
            if (v18 != -1 && v17 != v18)
            {
              v19 = 0;
              if (a6)
                *a6 = CFErrorCreate(0, CFSTR("CPRecord"), 2, 0);
LABEL_22:
              if ((*(_WORD *)(v14 + 116) & 8) != 0)
                CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v16);
              return v19 != 0;
            }
          }
          *(_DWORD *)(a1 + 96) = v17;
          Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 24));
          v21 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
          if (v21)
          {
            v22 = v21;
            CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 24), v21, 0);
            *(_BYTE *)(a1 + 56) = 1;
            if (Count >= 1)
            {
              v23 = v22;
              do
              {
                v24 = *v23;
                if (a2(a1, *v23, a3))
                {
                  v25 = *(const __CFSet **)(a1 + 48);
                  if (v25 && CFSetContainsValue(v25, v24))
                  {
                    CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 48), v24);
                  }
                  else
                  {
                    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), v24);
                    CPRecordStoreSaveRecord((uint64_t)v24, Value, (uint64_t)v27);
                  }
                  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 24), v24);
                }
                ++v23;
                --Count;
              }
              while (Count);
            }
            *(_BYTE *)(a1 + 56) = 0;
            free(v22);
            v19 = 1;
            goto LABEL_22;
          }
        }
      }
      v19 = 0;
      return v19 != 0;
    }
    return 1;
  }
  return result;
}

BOOL _matchClassPredicate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)(a2 + 24) == a3;
}

uint64_t CPRecordStoreProcessAddedRecordsOfClassWithPolicy(uint64_t a1, uint64_t a2, int a3, CFErrorRef *a4)
{
  return CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionTypeMatchingPredicate(a1, (unsigned int (*)(uint64_t, const void *, uint64_t))_matchClassPredicate, a2, a3, 0, a4);
}

uint64_t CPRecordStoreProcessAddedRecordsOfClass(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  return CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionTypeMatchingPredicate(a1, (unsigned int (*)(uint64_t, const void *, uint64_t))_matchClassPredicate, a2, 0, 0, a3);
}

void CPRecordInvalidateRecord(uint64_t a1)
{
  int v2;
  int i;
  const void *v4;

  if (a1)
  {
    v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 72);
    if (v2 >= 1)
    {
      for (i = 0; i != v2; ++i)
        CPRecordUnloadProperty(a1, i);
    }
    *(_BYTE *)(a1 + 56) = 1;
    *(_BYTE *)(a1 + 58) = 0;
    v4 = *(const void **)(a1 + 64);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 64) = 0;
    }
  }
}

uint64_t CPRecordStoreSaveWithCallbackAndTransactionType(uint64_t a1, void (*a2)(uint64_t, CFMutableDictionaryRef *), int a3, unsigned int a4, CFErrorRef *a5)
{
  return CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, a2, 0, a3, a4, a5);
}

uint64_t CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(uint64_t a1, void (*a2)(uint64_t, CFMutableDictionaryRef *), void (*a3)(uint64_t, CFMutableDictionaryRef *), int a4, unsigned int a5, CFErrorRef *a6)
{
  uint64_t Database;
  uint64_t v13;
  CFMutableDictionaryRef *v14;
  CFIndex v15;
  CFErrorRef v16;
  _BOOL8 v17;
  int v18;
  int v19;
  int v20;
  const __CFDictionary *v22;
  const void *v23;
  const __CFDictionary *v24;
  int v25;
  int v26;
  uint64_t context;
  CFMutableDictionaryRef *v28;
  uint64_t v29;

  if (a1
    && !a2
    && !a3
    && !*(_QWORD *)(a1 + 24)
    && !*(_QWORD *)(a1 + 32)
    && !*(_QWORD *)(a1 + 40)
    && !*(_QWORD *)(a1 + 80)
    && !*(_QWORD *)(a1 + 16))
  {
    return 1;
  }
  Database = CPRecordStoreGetDatabase(a1);
  v13 = CPSqliteDatabaseConnectionForWriting(Database);
  if (!v13)
  {
    if (a6)
    {
      v15 = 1;
      goto LABEL_16;
    }
    return 0;
  }
  v14 = (CFMutableDictionaryRef *)v13;
  if (a4 && (*(_BYTE *)(a1 + 57) & 2) != 0)
  {
    if (a6)
    {
      v15 = 3;
LABEL_16:
      v16 = CFErrorCreate(0, CFSTR("CPRecord"), v15, 0);
      v17 = 0;
LABEL_17:
      *a6 = v16;
      return v17;
    }
    return 0;
  }
  CPSqliteConnectionBeginTransactionType(v13, a5);
  v18 = CPSqliteConnectionIntegerForProperty(v14, CFSTR("__CPRecordSequenceNumber"));
  v19 = v18;
  if (a4)
  {
    v20 = *(_DWORD *)(a1 + 96);
    if (v20 != -1 && v18 != v20)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s: database changed externally\n", "_Bool CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(CPRecordStoreRef, CPRecordStoreSaveCallback, CPRecordStoreSaveCallback, CPRecordConflictPolicy, CPSqliteTransactionType, CFErrorRef *)");
      if (a6)
        *a6 = CFErrorCreate(0, CFSTR("CPRecord"), 2, 0);
      CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v14);
      return 0;
    }
  }
  context = a1;
  v28 = v14;
  v29 = 0;
  *(_DWORD *)(a1 + 96) = v18;
  if (a2)
    a2(a1, v14);
  _CPRecordStoreSaveDeletedRecords(&context);
  _CPRecordStoreSaveAddedRecords(&context);
  if (context)
  {
    if (v28)
    {
      v22 = *(const __CFDictionary **)(context + 32);
      if (v22)
      {
        *(_QWORD *)(context + 32) = 0;
        CFDictionaryApplyFunction(v22, (CFDictionaryApplierFunction)CPRecordStoreUpdateRecord, &context);
        CFRelease(v22);
        v23 = *(const void **)(context + 32);
        if (v23)
        {
          CFRelease(v23);
          *(_QWORD *)(context + 32) = 0;
        }
      }
    }
  }
  v24 = *(const __CFDictionary **)(a1 + 80);
  if (v24)
  {
    CFDictionaryApplyFunction(v24, (CFDictionaryApplierFunction)_saveProperty, &context);
    CFRelease(*(CFTypeRef *)(a1 + 80));
    *(_QWORD *)(a1 + 80) = 0;
  }
  v25 = v19 + 1;
  *(_DWORD *)(a1 + 96) = v19 + 1;
  if (v19 <= 0 && (*(_BYTE *)(a1 + 57) & 4) != 0)
  {
    CFLog();
    v25 = *(_DWORD *)(a1 + 96);
  }
  CPSqliteConnectionSetIntegerForProperty(v14, CFSTR("__CPRecordSequenceNumber"), v25);
  if (a3)
    a3(a1, v14);
  if (a5 == 0xFFFF)
  {
    v26 = 101;
  }
  else
  {
    v26 = CPSqliteConnectionCommit((uint64_t)v14);
    CPSqliteConnectionCheckNoConnectionError((uint64_t)v14, v26, "_Bool CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(CPRecordStoreRef, CPRecordStoreSaveCallback, CPRecordStoreSaveCallback, CPRecordConflictPolicy, CPSqliteTransactionType, CFErrorRef *)");
  }
  CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v14);
  v17 = v26 == 101;
  if (a6 && v26 != 101)
  {
    v16 = CFErrorCreate(0, CFSTR("CPRecordSQLite"), v26, 0);
    goto LABEL_17;
  }
  return v17;
}

void _CPRecordStoreSaveDeletedRecords(_QWORD *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *Copy;

  if (a1 && *a1 && a1[1])
  {
    v2 = *(const __CFDictionary **)(*a1 + 40);
    if (v2)
    {
      Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2);
      CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)CPRecordStoreDeleteRecordsInDictionary, a1);
      CFRelease(Copy);
      CFRelease(*(CFTypeRef *)(*a1 + 40));
      *(_QWORD *)(*a1 + 40) = 0;
    }
  }
}

void _CPRecordStoreSaveAddedRecords(_QWORD *a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  const __CFDictionary *Copy;
  const __CFDictionary *v5;
  uint64_t v6;
  const void *v7;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      if (a1[1])
      {
        v3 = *(const __CFDictionary **)(v2 + 24);
        if (v3)
        {
          *(_BYTE *)(v2 + 56) = 1;
          Copy = CFDictionaryCreateCopy(0, v3);
          if (Copy)
          {
            v5 = Copy;
            CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)CPRecordStoreSaveRecordIfNotAdded, a1);
            CFRelease(v5);
          }
          v6 = *a1;
          *(_BYTE *)(v6 + 56) = 0;
          CFRelease(*(CFTypeRef *)(v6 + 24));
          v2 = *a1;
          *(_QWORD *)(*a1 + 24) = 0;
        }
        v7 = *(const void **)(v2 + 48);
        if (v7)
        {
          CFRelease(v7);
          *(_QWORD *)(*a1 + 48) = 0;
        }
      }
    }
  }
}

uint64_t _saveProperty(const __CFString *a1, UInt8 *a2, uint64_t a3)
{
  CFMutableDictionaryRef *v4;
  UInt8 *v5;

  v4 = *(CFMutableDictionaryRef **)(a3 + 8);
  if ((UInt8 *)*MEMORY[0x1E0C9B0D0] == a2)
    v5 = 0;
  else
    v5 = a2;
  return CPSqliteConnectionSetValueForProperty(v4, a1, v5);
}

uint64_t CPRecordStoreSave(uint64_t a1, CFErrorRef *a2)
{
  return CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, 0, 0, 0, 0, a2);
}

uint64_t CPRecordStoreSaveWithCallback(uint64_t a1, void (*a2)(uint64_t, CFMutableDictionaryRef *), int a3, CFErrorRef *a4)
{
  return CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, a2, 0, a3, 0, a4);
}

void CPRecordStoreDestroy(void *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  void *v10;

  v2 = (const __CFDictionary *)*((_QWORD *)a1 + 2);
  if (v2)
  {
    CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)_disownRecordsForClass, 0);
    CFRelease(*((CFTypeRef *)a1 + 2));
  }
  v3 = (const __CFDictionary *)*((_QWORD *)a1 + 3);
  if (v3)
  {
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)_disownRecordKey, 0);
    CFRelease(*((CFTypeRef *)a1 + 3));
  }
  v4 = (const void *)*((_QWORD *)a1 + 6);
  if (v4)
    CFRelease(v4);
  v5 = *((_QWORD *)a1 + 1);
  if (v5)
    CPSqliteDatabaseClose(v5);
  v6 = (const void *)*((_QWORD *)a1 + 4);
  if (v6)
    CFRelease(v6);
  v7 = (const void *)*((_QWORD *)a1 + 5);
  if (v7)
    CFRelease(v7);
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
  v8 = (const void *)*((_QWORD *)a1 + 9);
  if (v8)
    CFRelease(v8);
  v9 = (const void *)*((_QWORD *)a1 + 15);
  if (v9)
    CFRelease(v9);
  v10 = (void *)*((_QWORD *)a1 + 14);
  if (v10)
    free(v10);
  free(a1);
}

void _disownRecordsForClass(int a1, CFDictionaryRef theDict)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_disownRecordValue, 0);
}

uint64_t _disownRecordKey(uint64_t result)
{
  *(_QWORD *)(result + 16) = 0;
  return result;
}

void CPRecordStoreCreateTablesForClass(uint64_t a1, CFMutableDictionaryRef *a2, int a3)
{
  char v6;
  CFMutableStringRef MutableCopy;
  uint64_t v8;
  char v9;
  int *v10;
  int v11;
  void *v12;
  const char *v13;
  const void *v14;
  const __CFString *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unsigned int v21;
  const __CFString *v22;
  int v23;
  __CFString *Mutable;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  _QWORD *v33;
  CFMutableStringRef v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  int v39;
  int v40;
  const __CFString *v42;
  const __CFAllocator *alloc;
  char v44;
  CFMutableDictionaryRef *v45;

  if (a2)
  {
    v6 = *(_BYTE *)(a1 + 56);
    alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("CREATE TABLE IF NOT EXISTS "));
    CFStringAppendCString(MutableCopy, *(const char **)a1, 0x8000100u);
    v8 = *(unsigned int *)(a1 + 120);
    v45 = a2;
    v44 = v6;
    if ((int)v8 < 1)
      goto LABEL_7;
    v9 = 0;
    v10 = *(int **)(a1 + 128);
    do
    {
      v11 = *v10;
      v10 += 4;
      v9 |= v11 == 1;
      --v8;
    }
    while (v8);
    if ((v9 & 1) != 0)
    {
      CFStringAppend(MutableCopy, CFSTR(" ("));
    }
    else
    {
LABEL_7:
      v12 = (void *)CFRetain(CFSTR("ROWID"));
      v13 = *(const char **)(a1 + 96);
      if (v13)
        v12 = (void *)CFStringCreateWithCString(0, v13, 0x600u);
      v14 = v12;
      CFStringAppendFormat(MutableCopy, 0, CFSTR(" (%@ INTEGER PRIMARY KEY"), v12, alloc);
      if ((v6 & 1) != 0)
        v15 = CFSTR(" AUTOINCREMENT, ");
      else
        v15 = CFSTR(", ");
      CFStringAppend(MutableCopy, v15);
      CFRelease(v14);
    }
    v16 = *(_DWORD *)(a1 + 72);
    if (v16 >= 1)
    {
      v17 = 0;
      v18 = 0;
      v19 = 1;
      do
      {
        v20 = *(_QWORD *)(a1 + 80) + v17;
        if ((*(_BYTE *)(v20 + 24) & 4) != 0 || !*(_DWORD *)(v20 + 8))
          goto LABEL_28;
        if ((v19 & 1) == 0)
          CFStringAppend(MutableCopy, CFSTR(", "));
        CFStringAppendCString(MutableCopy, *(const char **)v20, 0x8000100u);
        v21 = *(_DWORD *)(v20 + 8) - 1;
        v22 = CFSTR(" TEXT");
        if (v21 <= 6)
          v22 = off_1E28816B8[v21];
        CFStringAppend(MutableCopy, v22);
        v23 = *(_DWORD *)(v20 + 24);
        if ((v23 & 0xE0) == 0)
          goto LABEL_26;
        Mutable = CFStringCreateMutable(0, 0);
        v25 = Mutable;
        if ((v23 & 0x20) != 0)
        {
          CFStringAppend(Mutable, CFSTR(" UNIQUE"));
          if ((v23 & 0x40) == 0)
          {
LABEL_24:
            if ((v23 & 0x80) != 0)
              goto LABEL_32;
            goto LABEL_25;
          }
        }
        else if ((v23 & 0x40) == 0)
        {
          goto LABEL_24;
        }
        CFStringAppend(v25, CFSTR(" NOT NULL"));
        if ((v23 & 0x80) != 0)
        {
LABEL_32:
          CFStringAppend(v25, CFSTR(" DEFAULT 0"));
          if (v25)
            goto LABEL_27;
LABEL_26:
          v25 = (__CFString *)CFRetain(&stru_1E2882B60);
          goto LABEL_27;
        }
LABEL_25:
        if (!v25)
          goto LABEL_26;
LABEL_27:
        CFStringAppend(MutableCopy, v25);
        CFRelease(v25);
        v19 = 0;
        v16 = *(_DWORD *)(a1 + 72);
LABEL_28:
        ++v18;
        v17 += 40;
      }
      while (v18 < v16);
    }
    if (*(int *)(a1 + 120) >= 1)
    {
      v26 = 0;
      while (1)
      {
        v27 = *(_QWORD *)(a1 + 128);
        v28 = *(_DWORD *)(v27 + 16 * v26);
        if (v28 == 1)
          break;
        if (v28 == 2)
        {
          v29 = CFSTR(", UNIQUE (");
LABEL_40:
          CFStringAppend(MutableCopy, v29);
        }
        v30 = v27 + 16 * v26;
        v31 = (int *)(v30 + 4);
        if (*(int *)(v30 + 4) >= 1)
        {
          v32 = 0;
          v33 = (_QWORD *)(v30 + 8);
          do
          {
            if (v32)
              CFStringAppend(MutableCopy, CFSTR(", "));
            CFStringAppendCString(MutableCopy, *(const char **)(*(_QWORD *)(a1 + 80) + 40 * *(int *)(*v33 + 4 * v32++)), 0x8000100u);
          }
          while (v32 < *v31);
        }
        CFStringAppend(MutableCopy, CFSTR(")"));
        if (++v26 >= *(int *)(a1 + 120))
          goto LABEL_47;
      }
      v29 = CFSTR(", PRIMARY KEY (");
      goto LABEL_40;
    }
LABEL_47:
    CFStringAppend(MutableCopy, CFSTR(");"));
    CPSqliteConnectionPerformSQL(v45, MutableCopy);
    CFRelease(MutableCopy);
    if (a3)
    {
      if ((v44 & 2) != 0)
      {
        v34 = CFStringCreateMutableCopy(alloc, 0, CFSTR("CREATE TABLE IF NOT EXISTS "));
        CFStringAppendCString(v34, *(const char **)a1, 0x8000100u);
        CFStringAppend(v34, CFSTR("Changes (record INTEGER, type INTEGER"));
        if ((v44 & 0x10) != 0)
          CFStringAppend(v34, CFSTR(", sequence_number INTEGER"));
        if (*(int *)(a1 + 72) < 1)
        {
LABEL_65:
          CFStringAppend(v34, CFSTR(");"));
          CPSqliteConnectionPerformSQL(v45, v34);
          CFRelease(v34);
          return;
        }
        v35 = 0;
        v36 = 0;
        while (1)
        {
          v37 = *(_QWORD *)(a1 + 80) + v35;
          v38 = *(const char **)v37;
          v39 = *(_DWORD *)(v37 + 8);
          v40 = *(_DWORD *)(v37 + 24);
          if (v39 && (v40 & 2) != 0)
            break;
          if ((v40 & 8) != 0)
          {
            CFStringAppend(v34, CFSTR(", "));
            CFStringAppendCString(v34, v38, 0x8000100u);
            v42 = CFSTR(" INTEGER");
LABEL_63:
            CFStringAppend(v34, v42);
          }
          ++v36;
          v35 += 40;
          if (v36 >= *(int *)(a1 + 72))
            goto LABEL_65;
        }
        CFStringAppend(v34, CFSTR(", "));
        CFStringAppendCString(v34, v38, 0x8000100u);
        v42 = CFSTR(" TEXT");
        if ((v39 - 1) < 7)
          v42 = off_1E28816B8[v39 - 1];
        goto LABEL_63;
      }
    }
  }
}

void CPRecordStoreRegisterClass(uint64_t a1, void *value)
{
  __CFSet *Mutable;

  Mutable = *(__CFSet **)(a1 + 72);
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable(0, 0, 0);
    *(_QWORD *)(a1 + 72) = Mutable;
  }
  CFSetAddValue(Mutable, value);
}

char *CPRecordStoreCreateReadColumns(uint64_t a1, _DWORD *a2, CFDictionaryRef theDict, uint64_t (*a4)(int a1), uint64_t (*(*a5)())(uint64_t a1, int a2, uint64_t a3))
{
  uint64_t v6;
  uint64_t (*v7)(int);
  uint64_t (*(*v8)())(uint64_t, int, uint64_t);
  CFIndex Count;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v14;
  char *v15;
  const void **v16;
  int v17;
  const void **v18;
  const void **v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  char v23;
  uint64_t v24;
  unsigned int *v25;
  int v26;
  CFIndex v27;
  char *v28;
  uint64_t v29;
  char *v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  int v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  const void **v44;
  const void **v45;
  uint64_t v47;
  uint64_t (*(*v48)())(uint64_t, int, uint64_t);
  char *v49;
  uint64_t (*v50)(void);

  v6 = a1;
  v7 = CPRecordStoreColumnTypeForPropertyType;
  if (a4)
    v7 = a4;
  v50 = (uint64_t (*)(void))v7;
  v8 = returnCPRecordPropertyLoadHandler;
  if (a5)
    v8 = a5;
  v48 = v8;
  if (theDict)
  {
    Count = CFDictionaryGetCount(theDict);
  }
  else
  {
    v10 = *(unsigned int *)(a1 + 72);
    if ((int)v10 < 1)
    {
      v15 = 0;
      LODWORD(Count) = 0;
      goto LABEL_29;
    }
    Count = 0;
    v11 = *(_QWORD *)(a1 + 80) + 24;
    v12 = (char *)v11;
    do
    {
      v13 = *v12;
      v12 += 40;
      if ((v13 & 4) == 0)
      {
        if (*(_DWORD *)(v11 - 16))
          Count = (Count + 1);
        else
          Count = Count;
      }
      v11 = (uint64_t)v12;
      --v10;
    }
    while (v10);
  }
  v14 = Count;
  if ((int)Count < 1)
  {
    v15 = 0;
    if (theDict)
      goto LABEL_18;
LABEL_29:
    if (*(int *)(v6 + 72) >= 1)
    {
      v32 = 0;
      v33 = 0;
      v34 = 0;
      do
      {
        v35 = *(_QWORD *)(v6 + 80) + v32;
        if ((*(_BYTE *)(v35 + 24) & 4) == 0 && (*(_DWORD *)(v35 + 8) ? (v36 = (int)v34 < (int)Count) : (v36 = 0), v36))
        {
          v37 = (v34 + 1);
          v38 = v34;
          v39 = &v15[24 * (int)v34];
          *(_DWORD *)v39 = v37;
          v40 = v15;
          *((_DWORD *)v39 + 1) = v50();
          if ((*(_BYTE *)(v35 + 24) & 1) != 0)
          {
            *(_QWORD *)&v40[24 * v38 + 8] = 0;
          }
          else
          {
            v41 = ((uint64_t (*)(_QWORD))v48)(*(unsigned int *)(v35 + 8));
            v42 = &v40[24 * v38];
            *((_QWORD *)v42 + 1) = v41;
            *((_QWORD *)v42 + 2) = v33;
          }
          v15 = v40;
        }
        else
        {
          v37 = v34;
        }
        ++v33;
        v32 += 40;
        v34 = v37;
      }
      while (v33 < *(int *)(v6 + 72));
    }
    v31 = a2;
    goto LABEL_43;
  }
  v15 = (char *)malloc_type_calloc(Count, 0x18uLL, 0x1080040D2F62047uLL);
  if (!theDict)
    goto LABEL_29;
LABEL_18:
  v49 = v15;
  v16 = (const void **)malloc_type_malloc(8 * (int)Count, 0x80040B8603338uLL);
  v44 = (const void **)malloc_type_malloc(8 * (int)Count, 0x80040B8603338uLL);
  v45 = v16;
  CFDictionaryGetKeysAndValues(theDict, v16, v44);
  if ((int)Count >= 1)
  {
    v17 = 0;
    v19 = v44;
    v18 = v16;
    v47 = v6;
    do
    {
      v20 = *(_QWORD *)(v6 + 80);
      v21 = v20 + 40 * *(unsigned int *)v18;
      v23 = *(_BYTE *)(v21 + 24);
      v22 = (_BYTE *)(v21 + 24);
      if ((v23 & 4) == 0)
      {
        v24 = v20 + 40 * *(unsigned int *)v18;
        v26 = *(_DWORD *)(v24 + 8);
        v25 = (unsigned int *)(v24 + 8);
        if (v26)
        {
          v27 = Count;
          v28 = &v49[24 * v17];
          *(_DWORD *)v28 = *v19;
          *((_DWORD *)v28 + 1) = v50();
          if ((*v22 & 1) != 0)
          {
            *(_QWORD *)&v49[24 * v17 + 8] = 0;
          }
          else
          {
            v29 = ((uint64_t (*)(_QWORD))v48)(*v25);
            v30 = &v49[24 * v17];
            *((_QWORD *)v30 + 1) = v29;
            *((_QWORD *)v30 + 2) = *v18;
          }
          Count = v27;
          ++v17;
          v6 = v47;
        }
      }
      ++v19;
      ++v18;
      --v14;
    }
    while (v14);
  }
  free(v45);
  free(v44);
  v31 = a2;
  v15 = v49;
LABEL_43:
  *v31 = Count;
  return v15;
}

uint64_t CPRecordStoreColumnTypeForPropertyType(int a1)
{
  uint64_t v1;
  int *v2;
  int v3;

  v1 = 0;
  v2 = typemap;
  do
  {
    v3 = *v2;
    v2 += 2;
    if (v3 == a1)
      break;
    ++v1;
  }
  while (v1 != 7);
  return typemap[2 * v1 + 1];
}

uint64_t (*returnCPRecordPropertyLoadHandler())(uint64_t a1, int a2, uint64_t a3)
{
  return CPRecordPropertyLoadHandler;
}

__CFString *CPRecordStoreCreateSelectPrefixFromRecordDescriptor(const char **a1)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, 0, 0, 0);
}

__CFString *CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(const char **a1, CFArrayRef theArray)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, 0, theArray, 0);
}

__CFString *CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumn(const char **a1, void *a2)
{
  const __CFArray *v3;
  __CFString *SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  void *values;

  values = a2;
  if (!a2)
    return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, 0, 0, 0);
  v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, 0);
  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, 0, v3, 0);
  CFRelease(v3);
  return SelectPrefixFromRecordDescriptorWithAdditionalColumns;
}

__CFString *CPRecordStoreCreateColumnListFromRecordDescriptor(uint64_t a1)
{
  return _CPRecordStoreCreateColumnListFromRecordDescriptor(a1, 0, 0, 0, 0);
}

__CFString *_CPRecordStoreCreateColumnListFromRecordDescriptor(uint64_t a1, int a2, CFStringRef theString, CFMutableDictionaryRef *a4, const __CFArray *a5)
{
  const __CFString *v7;
  const __CFAllocator *v10;
  __CFString *MutableCopy;
  __CFString *v12;
  uint64_t v13;
  char *v14;
  int v15;
  uint64_t v16;
  int v17;
  CFIndex Count;
  CFIndex v19;
  CFIndex i;
  const __CFString *ValueAtIndex;

  v7 = theString;
  if (theString)
  {
    if (CFStringGetLength(theString) && CFStringGetLength(v7))
      v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@."), v7);
    else
      v7 = 0;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("SELECT "));
  v12 = MutableCopy;
  if (a2)
    CFStringAppend(MutableCopy, CFSTR("DISTINCT "));
  if (v7)
    CFStringAppend(v12, v7);
  CFStringAppend(v12, CFSTR("ROWID"));
  if (a4)
    *a4 = CFDictionaryCreateMutable(v10, 0, 0, 0);
  if (*(int *)(a1 + 72) >= 1)
  {
    v13 = 0;
    v14 = 0;
    v15 = 1;
    do
    {
      v16 = *(_QWORD *)(a1 + 80) + v13;
      v17 = *(_DWORD *)(v16 + 24);
      if ((v17 & 4) == 0 && *(_DWORD *)(v16 + 8))
      {
        if ((v17 & 1) != 0)
        {
          if (!a4)
            CFStringAppend(v12, CFSTR(", NULL"));
        }
        else
        {
          CFStringAppend(v12, CFSTR(", "));
          if (v7)
            CFStringAppend(v12, v7);
          CFStringAppendCString(v12, *(const char **)(*(_QWORD *)(a1 + 80) + v13), 0x8000100u);
          if (a4)
            CFDictionarySetValue(*a4, v14, (const void *)v15++);
        }
      }
      ++v14;
      v13 += 40;
    }
    while ((uint64_t)v14 < *(int *)(a1 + 72));
  }
  if (a5)
  {
    if (CFArrayGetCount(a5))
    {
      Count = CFArrayGetCount(a5);
      if (Count >= 1)
      {
        v19 = Count;
        for (i = 0; i != v19; ++i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a5, i);
          CFStringAppend(v12, CFSTR(", "));
          CFStringAppend(v12, ValueAtIndex);
        }
      }
    }
  }
  if (v7)
    CFRelease(v7);
  return v12;
}

__CFString *CPRecordStoreCreateDistinctColumnList(uint64_t a1, int a2, CFMutableDictionaryRef *a3)
{
  return _CPRecordStoreCreateColumnListFromRecordDescriptor(a1, a2, 0, a3, 0);
}

__CFString *CPRecordStoreCreateColumnList(uint64_t a1, CFMutableDictionaryRef *a2)
{
  return _CPRecordStoreCreateColumnListFromRecordDescriptor(a1, 0, 0, a2, 0);
}

__CFString *CPRecordStoreCreateColumnListWithAliasAndExtraColumns(uint64_t a1, CFStringRef theString, const __CFArray *a3, CFMutableDictionaryRef *a4)
{
  return _CPRecordStoreCreateColumnListFromRecordDescriptor(a1, 0, theString, a4, a3);
}

__CFString *_CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(const char **a1, const __CFString *a2, CFStringRef theString, CFArrayRef theArray, CFMutableDictionaryRef *a5)
{
  const __CFString *v7;
  __CFString *ColumnListFromRecordDescriptor;
  const __CFString *v11;

  v7 = theString;
  if (theString && !CFStringGetLength(theString))
    v7 = 0;
  if (theArray && !a5 && !v7)
    CFArrayGetCount(theArray);
  ColumnListFromRecordDescriptor = _CPRecordStoreCreateColumnListFromRecordDescriptor((uint64_t)a1, 0, v7, a5, theArray);
  CFStringAppend(ColumnListFromRecordDescriptor, CFSTR(" FROM "));
  if (a2 && CFStringGetLength(a2))
  {
    v11 = CFStringCreateWithFormat(0, 0, CFSTR("(%@)"), a2);
    CFStringAppend(ColumnListFromRecordDescriptor, v11);
    CFRelease(v11);
    if (!v7)
      return ColumnListFromRecordDescriptor;
    goto LABEL_13;
  }
  CFStringAppendCString(ColumnListFromRecordDescriptor, *a1, 0x8000100u);
  if (v7)
LABEL_13:
    CFStringAppendFormat(ColumnListFromRecordDescriptor, 0, CFSTR(" AS %@"), v7);
  return ColumnListFromRecordDescriptor;
}

__CFString *CPRecordStoreCreateJoinableSelectPrefixFromRecordDescriptor(const char **a1, CFStringRef theString)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, theString, 0, 0);
}

__CFString *CPRecordStoreCreateSelectPrefixWithTableExpressionAndAlias(const char **a1, const __CFString *a2, const __CFString *a3)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, a2, a3, 0, 0);
}

__CFString *CPRecordStoreCreateSelectStatement(const char **a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  __CFString *SelectPrefixFromRecordDescriptorWithAdditionalColumns;

  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, a2, a3, 0, 0);
  if (SelectPrefixFromRecordDescriptorWithAdditionalColumns)
  {
    if (a4 && CFStringGetLength(a4) >= 1)
    {
      CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, CFSTR(" "));
      CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, a4);
    }
    CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, CFSTR(";"));
  }
  return SelectPrefixFromRecordDescriptorWithAdditionalColumns;
}

__CFString *CPRecordStoreCreateSelectPrefix(const char **a1, CFStringRef theString, CFArrayRef theArray, CFMutableDictionaryRef *a4)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, theString, theArray, a4);
}

uint64_t CPRecordStoreProcessStatementWithPropertyIndices(uint64_t a1, void *a2, _QWORD *a3, uint64_t a4, uint64_t a5, CFDictionaryRef theDict)
{
  return CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, a3, a4, 0, a5, theDict, 0);
}

uint64_t CPRecordStoreProcessRecordStatementWithPropertyIndices(uint64_t a1, void *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, const __CFDictionary *a7)
{
  return CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, a3, a4, a5, a6, a7, 0);
}

uint64_t CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(uint64_t a1, void *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, CFDictionaryRef theDict, uint64_t a8)
{
  uint64_t v15;
  char *Columns;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  if (!a3)
    return 0;
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  if (a8)
    v15 = a8;
  else
    v15 = (uint64_t)a2;
  Columns = CPRecordStoreCreateReadColumns(v15, (_DWORD *)&v22 + 2, theDict, 0, 0);
  v17 = 0;
  *((_QWORD *)&v21 + 1) = Columns;
  if (a8 | (unint64_t)Columns)
  {
    v18 = Columns;
    *(_QWORD *)&v22 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    if ((_QWORD)v22)
    {
      *(_QWORD *)&v20 = a1;
      *((_QWORD *)&v20 + 1) = a2;
      *(_QWORD *)&v21 = CPRecordStoreGetCache(a1, a2);
      *(_QWORD *)&v23 = a4;
      *((_QWORD *)&v23 + 1) = a5;
      v24 = a6;
      HIDWORD(v22) = -1;
      CPSqliteStatementSendResults(a3, (unsigned int (*)(_QWORD *, uint64_t))CPRecordLoadHandler, (uint64_t)&v20);
      v18 = (void *)*((_QWORD *)&v21 + 1);
      v17 = v22;
    }
    else
    {
      v17 = 0;
    }
    free(v18);
  }
  return v17;
}

const void *CPRecordStoreGetCache(uint64_t a1, void *key)
{
  const __CFDictionary *Mutable;
  const void *Value;

  Mutable = *(const __CFDictionary **)(a1 + 16);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    *(_QWORD *)(a1 + 16) = Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, key);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), key, Value);
    CFRelease(Value);
  }
  return Value;
}

uint64_t CPRecordLoadHandler(uint64_t a1, uint64_t a2)
{
  int v4;
  int RecordIDForRowid;
  sqlite3_int64 v6;
  const __CFDictionary *v7;
  const __CFDictionary *Value;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, _QWORD);
  char v11;
  uint64_t Instance;
  _BYTE *v13;
  uint64_t (*v14)(uint64_t, uint64_t, _QWORD);
  __CFArray *v15;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = sqlite3_column_type(*(sqlite3_stmt **)(a1 + 8), 0);
  if (v4 == 5)
  {
    RecordIDForRowid = -1;
    goto LABEL_8;
  }
  v6 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), 0);
  RecordIDForRowid = CPRecordStoreGetRecordIDForRowid(*(_QWORD *)a2, v6);
  v7 = *(const __CFDictionary **)(*(_QWORD *)a2 + 40);
  if (v7)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v7, *(const void **)(a2 + 8));
    if (Value)
    {
      if (CFDictionaryContainsKey(Value, (const void *)RecordIDForRowid))
        return 0;
    }
  }
LABEL_8:
  v10 = *(uint64_t (**)(uint64_t, _QWORD))(a2 + 48);
  if (v10)
  {
    v11 = v10(a1, *(_QWORD *)(a2 + 64));
    v9 = v11 & 1;
    if ((v11 & 2) == 0)
      return v9;
  }
  else
  {
    v9 = 0;
  }
  if (v4 != 5)
  {
    v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid);
    if (v13)
    {
      Instance = (uint64_t)v13;
      if (v13[56])
      {
        CPSqliteStatementApplyValuesFromRecordWithNullValue(a1, *(_QWORD *)(a2 + 24), *(_DWORD *)(a2 + 40), (uint64_t)v13, *MEMORY[0x1E0C9B0D0]);
        *(_BYTE *)(Instance + 56) = 0;
      }
    }
    else
    {
      Instance = _createInstance(*(_QWORD *)(a2 + 8), RecordIDForRowid);
      if (!Instance)
        goto LABEL_20;
      CPSqliteStatementApplyValuesFromRecordWithNullValue(a1, *(_QWORD *)(a2 + 24), *(_DWORD *)(a2 + 40), Instance, *MEMORY[0x1E0C9B0D0]);
      *(_QWORD *)(Instance + 16) = *(_QWORD *)a2;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid, (const void *)Instance);
      CFRelease((CFTypeRef)Instance);
    }
    *(_BYTE *)(Instance + 58) = 1;
    goto LABEL_20;
  }
  Instance = *MEMORY[0x1E0C9B0D0];
LABEL_20:
  v14 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a2 + 56);
  if (v14)
  {
    if ((v14(a1, Instance, *(_QWORD *)(a2 + 64)) & 1) != 0)
      v9 = 1;
    else
      v9 = v9;
  }
  v15 = *(__CFArray **)(a2 + 32);
  if (v15)
    CFArrayAppendValue(v15, (const void *)Instance);
  return v9;
}

uint64_t CPRecordStoreProcessStatement(uint64_t a1, void *a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  return CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, a3, a4, 0, a5, 0, 0);
}

uint64_t CPRecordStoreProcessQuery(uint64_t a1, void *a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  return CPRecordStoreProcessQueryWithBindBlock(a1, a2, a3, a4, a5, 0);
}

uint64_t CPRecordStoreProcessQueryWithBindBlock(uint64_t a1, void *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  CFMutableDictionaryRef *ReaderConnection;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t Descriptor;

  ReaderConnection = _getReaderConnection(a1);
  if (!ReaderConnection)
    return 0;
  v13 = (uint64_t *)ReaderConnection;
  v14 = CPSqliteConnectionStatementForSQL(ReaderConnection, a3);
  if (v14)
  {
    v15 = v14;
    if (a6)
      (*(void (**)(uint64_t, _QWORD *))(a6 + 16))(a6, v14);
    Descriptor = CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, v15, a4, 0, a5, 0, 0);
  }
  else
  {
    Descriptor = 0;
  }
  CPSqliteDatabaseReleaseSqliteConnection(v13);
  return Descriptor;
}

uint64_t CPRecordStoreCopyAllInstancesOfClassWhere(uint64_t a1, const char **a2, const __CFString *a3)
{
  return CPRecordStoreCopyAllInstancesOfClassWhereWithBindBlock(a1, a2, a3, 0);
}

uint64_t CPRecordStoreCopyAllInstancesOfClassWhereWithBindBlock(uint64_t a1, const char **a2, const __CFString *a3, uint64_t a4)
{
  __CFString *SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  __CFString *v9;
  uint64_t v10;

  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a2, 0, 0, 0, 0);
  v9 = SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  if (a3)
  {
    CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, CFSTR(" "));
    CFStringAppend(v9, a3);
  }
  CFStringAppend(v9, CFSTR(";"));
  v10 = CPRecordStoreProcessQueryWithBindBlock(a1, a2, v9, 0, 0, a4);
  CFRelease(v9);
  return v10;
}

uint64_t CPRecordStoreCopyAllInstancesOfClassWithAliasAndFilter(uint64_t a1, const char **a2, const __CFString *a3, const __CFString *a4, uint64_t a5)
{
  __CFString *SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  __CFString *v10;
  uint64_t v11;

  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a2, 0, a3, 0, 0);
  v10 = SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  if (a4)
  {
    CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, CFSTR(" "));
    CFStringAppend(v10, a4);
  }
  CFStringAppend(v10, CFSTR(";"));
  v11 = CPRecordStoreProcessQueryWithBindBlock(a1, a2, v10, 0, 0, a5);
  CFRelease(v10);
  return v11;
}

uint64_t CPRecordStoreCopyAllInstancesOfClass(uint64_t a1, const char **a2)
{
  return CPRecordStoreCopyAllInstancesOfClassWhereWithBindBlock(a1, a2, 0, 0);
}

const void *CPRecordStoreGetInstanceOfClassWithUID(uint64_t a1, void *a2, int a3)
{
  const void *result;

  result = _CPRecordStoreGetCachedInstanceOfClassWithUID(a1, a2, a3);
  if (!result)
    return _loadInstanceFromDB(a1, (const char **)a2, a3);
  return result;
}

const void *_CPRecordStoreGetCachedInstanceOfClassWithUID(uint64_t a1, void *a2, int a3)
{
  const __CFDictionary *Cache;
  const void *v7;
  const void *Value;
  const void *updated;
  const __CFDictionary *DeletedRecords;

  Cache = (const __CFDictionary *)CPRecordStoreGetCache(a1, a2);
  if (!Cache)
    return 0;
  v7 = (const void *)a3;
  Value = CFDictionaryGetValue(Cache, (const void *)a3);
  if (!Value)
    return 0;
  updated = _updateDetachedRecord((uint64_t)Value);
  if (updated)
  {
    DeletedRecords = (const __CFDictionary *)CPRecordStoreGetDeletedRecords(a1, a2);
    if (DeletedRecords)
    {
      if (CFDictionaryContainsKey(DeletedRecords, v7))
        return 0;
    }
  }
  return updated;
}

const void *_loadInstanceFromDB(uint64_t a1, const char **a2, int a3)
{
  __CFString *SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  const __CFString *v7;
  CFMutableDictionaryRef *ReaderConnection;
  uint64_t *v9;
  const void *v10;
  _QWORD *v11;
  sqlite3_stmt *v12;
  sqlite3_int64 v13;
  const void *ValueAtIndex;
  const __CFArray *Descriptor;
  const __CFArray *v16;

  if (!CPRecordStoreGetDatabase(a1)
    || (SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a2, 0, 0, 0, 0)) == 0)
  {
    ValueAtIndex = 0;
    goto LABEL_21;
  }
  v7 = SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, CFSTR(" WHERE ROWID = ?;"));
  ReaderConnection = _getReaderConnection(a1);
  if (ReaderConnection)
  {
    v9 = (uint64_t *)ReaderConnection;
    v10 = CPSqliteConnectionStatementForSQL(ReaderConnection, v7);
    if (!v10)
      goto LABEL_16;
    v11 = v10;
    v12 = (sqlite3_stmt *)*((_QWORD *)v10 + 1);
    if (!v12)
      goto LABEL_16;
    if (!a1)
      goto LABEL_24;
    if (a3 >= -1)
    {
      v13 = a3;
      goto LABEL_13;
    }
    if ((a3 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104))
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * (a3 & 0x7FFFFFFF));
    else
LABEL_24:
      v13 = -1;
LABEL_13:
    sqlite3_bind_int64(v12, 1, v13);
    Descriptor = (const __CFArray *)CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, v11, 0, 0, 0, 0, 0);
    if (Descriptor)
    {
      v16 = Descriptor;
      if (CFArrayGetCount(Descriptor) < 1)
        ValueAtIndex = 0;
      else
        ValueAtIndex = CFArrayGetValueAtIndex(v16, 0);
      CFRelease(v16);
      goto LABEL_19;
    }
LABEL_16:
    ValueAtIndex = 0;
LABEL_19:
    CPSqliteDatabaseReleaseSqliteConnection(v9);
    goto LABEL_20;
  }
  ValueAtIndex = 0;
LABEL_20:
  CFRelease(v7);
LABEL_21:
  if (ValueAtIndex == (const void *)*MEMORY[0x1E0C9B0D0])
    return 0;
  else
    return ValueAtIndex;
}

sqlite3_stmt **CPRecordStoreCopyInstancesOfClassWithUIDs(uint64_t a1, void *a2, const __CFArray *a3)
{
  const __CFDictionary *Cache;
  const __CFDictionary *v7;
  CFIndex Count;
  const __CFAllocator *v9;
  sqlite3_stmt **Mutable;
  CFIndex v11;
  CFMutableSetRef v12;
  CFIndex v13;
  const void *ValueAtIndex;
  const void *Value;
  uint64_t v16;
  const void *updated;
  __CFString *SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  __CFString *v19;
  CFMutableDictionaryRef *ReaderConnection;
  CFMutableDictionaryRef *v21;
  CFIndex v22;
  sqlite3_stmt **v23;
  CFIndex v24;
  int v25;
  sqlite3_int64 v26;

  Cache = (const __CFDictionary *)CPRecordStoreGetCache(a1, a2);
  if (!Cache)
    return 0;
  v7 = Cache;
  Count = CFArrayGetCount(a3);
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = (sqlite3_stmt **)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v11 = CFArrayGetCount(a3);
  v12 = CFSetCreateMutable(v9, v11, 0);
  if (Count < 1)
  {
LABEL_9:
    CFRelease(v12);
    if (Mutable)
      return Mutable;
  }
  else
  {
    v13 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v13);
      Value = CFDictionaryGetValue(v7, ValueAtIndex);
      if (!Value)
        break;
      v16 = (uint64_t)Value;
      if (!CFSetContainsValue(v12, ValueAtIndex))
      {
        updated = _updateDetachedRecord(v16);
        if (updated)
        {
          CFArrayAppendValue((CFMutableArrayRef)Mutable, updated);
          CFSetAddValue(v12, ValueAtIndex);
        }
      }
      if (Count == ++v13)
        goto LABEL_9;
    }
    CFRelease(Mutable);
    CFRelease(v12);
  }
  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns((const char **)a2, 0, 0, 0, 0);
  if (!SelectPrefixFromRecordDescriptorWithAdditionalColumns)
    return 0;
  v19 = SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  ReaderConnection = _getReaderConnection(a1);
  if (ReaderConnection)
  {
    v21 = ReaderConnection;
    CFStringAppend(v19, CFSTR(" WHERE ROWID IN("));
    if (Count >= 1)
    {
      v22 = Count;
      do
      {
        CFStringAppend(v19, CFSTR("?"));
        if (v22 != 1)
          CFStringAppend(v19, CFSTR(", "));
        --v22;
      }
      while (v22);
    }
    CFStringAppend(v19, CFSTR(") "));
    v23 = (sqlite3_stmt **)CPSqliteConnectionStatementForSQL(v21, v19);
    Mutable = v23;
    if (v23)
    {
      if (v23[1])
      {
        if (Count >= 1)
        {
          v24 = 0;
          while (1)
          {
            v25 = CFArrayGetValueAtIndex(a3, v24);
            if (!a1)
              break;
            if (v25 < -1)
            {
              if ((v25 & 0x7FFFFFFF) >= *(_DWORD *)(a1 + 104))
                break;
              v26 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * (v25 & 0x7FFFFFFF));
            }
            else
            {
              v26 = v25;
            }
LABEL_28:
            sqlite3_bind_int64(Mutable[1], ++v24, v26);
            if (Count == v24)
              goto LABEL_33;
          }
          v26 = -1;
          goto LABEL_28;
        }
LABEL_33:
        Mutable = (sqlite3_stmt **)CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, Mutable, 0, 0, 0, 0, 0);
      }
      else
      {
        Mutable = 0;
      }
    }
    CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v21);
  }
  else
  {
    Mutable = 0;
  }
  CFRelease(v19);
  return Mutable;
}

void CPRecordStoreAddRecord(uint64_t a1, void **a2)
{
  _CPRecordStoreAddRecord(a1, a2, 0);
}

void _CPRecordStoreAddRecord(uint64_t a1, void **key, int a3)
{
  void **v3;
  uint64_t v5;
  const void *v6;
  void **CachedInstanceOfClassWithUID;
  void **v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t Property;
  const __CFDictionary *v16;
  const __CFDictionary *Value;
  __CFDictionary *v18;
  const __CFDictionary *v19;
  __CFDictionary *Mutable;
  const __CFDictionary *v21;
  __CFDictionary *Cache;
  CFRange v23;

  if (!key)
    return;
  v3 = key;
  key[2] = (void *)a1;
  if ((*(_BYTE *)(a1 + 57) & 1) != 0)
    v5 = 3;
  else
    v5 = 2;
  v6 = (const void *)*((int *)key + 8);
  if (a3)
  {
    if ((_DWORD)v6 == -1
      || (CachedInstanceOfClassWithUID = (void **)_CPRecordStoreGetCachedInstanceOfClassWithUID(a1, key[3], (int)v6)) == 0)
    {
      v8 = v3;
    }
    else
    {
      v8 = CachedInstanceOfClassWithUID;
      v9 = CPRecordCopyChangedProperties((uint64_t)v3);
      v10 = CPRecordCopyChangedProperties((uint64_t)v8);
      if (v9)
      {
        Count = CFArrayGetCount(v9);
        if (Count >= 1)
        {
          v12 = Count;
          for (i = 0; i != v12; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v9, i);
            if (v10)
            {
              v23.length = CFArrayGetCount(v10);
              v23.location = 0;
              if (CFArrayContainsValue(v10, v23, (const void *)(int)ValueAtIndex))
                continue;
            }
            Property = CPRecordGetProperty((uint64_t)v3, (uint64_t)ValueAtIndex);
            CPRecordSetProperty((uint64_t)v8, (uint64_t)ValueAtIndex, Property);
          }
        }
        CFRelease(v9);
      }
      if (v10)
        CFRelease(v10);
    }
    v21 = (const __CFDictionary *)v8[5];
    if (v21 && CFDictionaryGetCount(v21) >= 1)
      _addChangeActions(v8, v5);
    v3 = v8;
    goto LABEL_32;
  }
  v16 = *(const __CFDictionary **)(a1 + 40);
  if (v16)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v16, key[3]);
    if (Value)
    {
      v18 = Value;
      if (CFDictionaryContainsKey(Value, (const void *)*((int *)v3 + 8)))
      {
        CFDictionaryRemoveValue(v18, (const void *)*((int *)v3 + 8));
        goto LABEL_32;
      }
    }
  }
  v19 = *(const __CFDictionary **)(a1 + 24);
  if (v19)
  {
    if (CFDictionaryContainsKey(v19, v3))
      goto LABEL_32;
    Mutable = *(__CFDictionary **)(a1 + 24);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
    *(_QWORD *)(a1 + 24) = Mutable;
  }
  CFDictionarySetValue(Mutable, v3, (const void *)v5);
LABEL_32:
  if ((_DWORD)v6 != -1)
  {
    Cache = (__CFDictionary *)CPRecordStoreGetCache(a1, v3[3]);
    if (Cache)
      CFDictionaryAddValue(Cache, v6, v3);
  }
}

void CPRecordStoreAddExistingRecord(uint64_t a1, void **a2)
{
  _CPRecordStoreAddRecord(a1, a2, 1);
}

void CPRecordStoreRemoveRecordInternal(uint64_t a1, uint64_t a2, void *key, int a4)
{
  int v4;
  __CFDictionary *DeletedRecords;
  __CFDictionary *v8;
  char v9;
  uint64_t Instance;
  _BYTE *v11;
  char v12;
  __CFDictionary *v13;

  v4 = a4;
  if (a2 && a4 == -1)
    v4 = *(_DWORD *)(a2 + 32);
  if (v4 == -1)
  {
    if (!a2)
      return;
    v13 = *(__CFDictionary **)(a1 + 24);
    if (!v13)
      return;
LABEL_18:
    CFDictionaryRemoveValue(v13, (const void *)a2);
    return;
  }
  if (a2 && !key)
    key = *(void **)(a2 + 24);
  DeletedRecords = (__CFDictionary *)CPRecordStoreGetDeletedRecords(a1, key);
  if (DeletedRecords)
  {
    v8 = DeletedRecords;
    v9 = *(_BYTE *)(a1 + 57);
    pthread_once(&kCPRecordDeleteInfoRegisterClass, (void (*)(void))CPRecordDeleteInfoRegisterClass);
    Instance = _CFRuntimeCreateInstance();
    if (Instance)
    {
      v11 = (_BYTE *)Instance;
      v12 = v9 & 1;
      *(_QWORD *)(Instance + 16) = 0;
      *(_QWORD *)(Instance + 24) = 0;
      if (a2)
        *(_QWORD *)(Instance + 16) = CFRetain((CFTypeRef)a2);
      v11[24] = v12;
      CFDictionarySetValue(v8, (const void *)v4, v11);
      CFRelease(v11);
    }
  }
  if (a2)
  {
    v13 = *(__CFDictionary **)(a1 + 32);
    if (v13)
      goto LABEL_18;
  }
}

const void *CPRecordStoreGetDeletedRecords(uint64_t a1, void *key)
{
  const __CFDictionary *Mutable;
  const void *Value;

  Mutable = *(const __CFDictionary **)(a1 + 40);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    *(_QWORD *)(a1 + 40) = Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, key);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, Value);
    CFRelease(Value);
  }
  return Value;
}

void CPRecordStoreRemoveRecord(uint64_t a1, uint64_t a2)
{
  if (a2)
    CPRecordStoreRemoveRecordInternal(a1, a2, *(void **)(a2 + 24), *(_DWORD *)(a2 + 32));
}

void CPRecordStoreRemoveRecordOfClassWithUID(uint64_t a1, void *key, int a3)
{
  CPRecordStoreRemoveRecordInternal(a1, 0, key, a3);
}

_QWORD *CPRecordIsPendingAdd(_QWORD *key)
{
  const void *v1;
  uint64_t v2;

  if (key)
  {
    v1 = key;
    v2 = key[2];
    if (v2)
    {
      key = *(_QWORD **)(v2 + 24);
      if (key)
        return (_QWORD *)(CFDictionaryContainsKey((CFDictionaryRef)key, v1) != 0);
    }
    else
    {
      return 0;
    }
  }
  return key;
}

_QWORD *CPRecordIsPendingChange(_QWORD *key)
{
  const void *v1;
  uint64_t v2;

  if (key)
  {
    v1 = key;
    v2 = key[2];
    if (v2)
    {
      key = *(_QWORD **)(v2 + 32);
      if (key)
        return (_QWORD *)(CFDictionaryContainsKey((CFDictionaryRef)key, v1) != 0);
    }
    else
    {
      return 0;
    }
  }
  return key;
}

const __CFDictionary *CPRecordIsPendingDelete(const __CFDictionary *result)
{
  const __CFDictionary *v1;

  if (result)
  {
    v1 = result;
    result = (const __CFDictionary *)*((_QWORD *)result + 2);
    if (result)
    {
      if (*((_QWORD *)result + 5))
      {
        result = (const __CFDictionary *)CPRecordStoreGetDeletedRecords((uint64_t)result, *((void **)v1 + 3));
        if (result)
          return (const __CFDictionary *)(CFDictionaryContainsKey(result, (const void *)*((int *)v1 + 8)) != 0);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CPRecordStoreHasUnsavedChanges(_QWORD *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  uint64_t result;
  uint64_t context;

  v2 = (const __CFDictionary *)a1[3];
  if (v2 && CFDictionaryGetCount(v2) > 0)
    return 1;
  v3 = (const __CFDictionary *)a1[4];
  if (v3)
  {
    if (CFDictionaryGetCount(v3) > 0)
      return 1;
  }
  result = a1[5];
  if (result)
  {
    context = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)_countEntriesInDictionaryValue, &context);
    return context > 0;
  }
  return result;
}

CFIndex _countEntriesInDictionaryValue(int a1, CFDictionaryRef theDict, _DWORD *a3)
{
  CFIndex result;

  result = CFDictionaryGetCount(theDict);
  *a3 += result;
  return result;
}

void CPRecordStoreRevert(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const __CFDictionary *v6;

  v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v6 = *(const __CFDictionary **)(a1 + 16);
  if (v6)
    CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)_revertRecordsForClass, 0);
  *(_DWORD *)(a1 + 96) = -1;
}

void _revertRecordsForClass(int a1, CFDictionaryRef theDict)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0);
}

void CPRecordStoreInvalidateCaches(uint64_t a1)
{
  const void *v2;

  CPRecordStoreRevert(a1);
  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
}

const __CFDictionary *CPRecordStoreCountCachedRecords(uint64_t a1)
{
  const __CFDictionary *result;
  uint64_t context;

  context = 0;
  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)_countCachedRecords, &context);
    return (const __CFDictionary *)context;
  }
  return result;
}

CFIndex _countCachedRecords(int a1, CFDictionaryRef theDict, _QWORD *a3)
{
  CFIndex result;

  result = CFDictionaryGetCount(theDict);
  *a3 += result;
  return result;
}

uint64_t CPRecordStoreGetChangesForClass(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return CPRecordStoreGetChangesForClassWithProperties(a1, a2, a3, a4, 0, a6, a7, a8, 0);
}

uint64_t CPRecordStoreGetChangesForClassWithProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, 0, 0, a5, 0, 0, &a9);
}

uint64_t _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, const __CFString *a8, uint64_t a9, _QWORD *a10)
{
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  const char **v20;
  _QWORD **v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v30;
  _QWORD *v31;

  v30 = a10;
  v31 = a10 + 1;
  if (!*a10)
    return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesA(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, 0, 0);
  v17 = 0;
  v18 = 0;
  do
  {
    v19 = v31;
    v31 += 2;
    ++v18;
    v17 += 8;
  }
  while (v19[1]);
  v20 = (const char **)malloc_type_malloc(v17, 0x10040436913F5uLL);
  v21 = (_QWORD **)malloc_type_malloc(v17, 0x80040B8603338uLL);
  v22 = v21;
  v23 = 0;
  v24 = v18;
  do
  {
    v20[v23] = (const char *)*v30;
    v25 = v30 + 1;
    v30 += 2;
    v21[v23++] = (_QWORD *)*v25;
    --v24;
  }
  while (v24);
  v26 = _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesA(a1, a2, a3, a4, a5, a6, a7, a8, a9, v20, v21, v18);
  free(v20);
  free(v22);
  return v26;
}

uint64_t CPRecordStoreGetChangesForClassWithBindBlockAndProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, 0, 0, a5, 0, a6, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesForClassWithProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, const __CFString *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, 0, a6, 0, 0, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, a6, a7, 0, 0, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesForClassWithBindBlockAndProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, const __CFString *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, 0, a6, 0, a7, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithBindBlockAndProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, a6, a7, 0, a8, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithBindBlockAndPropertiesA(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, uint64_t a8, const char **a9, uint64_t a10, int a11)
{
  _QWORD **v19;
  void *v20;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  v19 = (_QWORD **)malloc_type_calloc(a11, 8uLL, 0x80040B8603338uLL);
  if (v19)
  {
    v20 = v19;
    if (a11 >= 1)
    {
      v22 = a11;
      v23 = v19;
      do
      {
        *v23++ = a10;
        a10 += 8;
        --v22;
      }
      while (v22);
    }
    v24 = _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesA(a1, a2, a3, a4, a5, a6, a7, 0, a8, a9, v19, a11);
    free(v20);
    return v24;
  }
  else
  {
    CFLog();
    return 0xFFFFFFFFLL;
  }
}

uint64_t _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesA(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, const __CFString *a8, uint64_t a9, const char **a10, _QWORD **a11, int a12)
{
  uint64_t v19;
  __CFString *Mutable;
  int v21;
  const char **v22;
  _QWORD **v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  const char **v28;
  const char *v29;
  unint64_t v30;
  const char **v31;
  const char *v32;
  const char **v33;
  uint64_t v34;
  int *v35;
  int v36;
  int v37;
  char *v38;
  _QWORD *v39;
  int v40;
  const CFArrayCallBacks *v41;
  uint64_t v42;
  const char *v43;
  const __CFString *v44;
  CFMutableDictionaryRef *ReaderConnection;
  const void *v46;
  const __CFAllocator *v47;
  sqlite3_int64 v48;
  sqlite3_int64 v49;
  __CFArray *v50;
  int RecordIDForRowid;
  int v52;
  int v53;
  sqlite3_int64 v54;
  uint64_t v55;
  sqlite3_int64 v56;
  __CFArray *v57;
  uint64_t v58;
  _QWORD **v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  const __CFString *v65;
  __CFArray **v66;
  CFMutableArrayRef *v67;
  __CFArray **v68;
  CFMutableArrayRef *v69;
  uint64_t v70;
  CFMutableStringRef theString;
  uint64_t v73;
  int v74;
  CFMutableDictionaryRef *v75;

  v19 = a12;
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("SELECT ROWID, record, type"));
  theString = Mutable;
  if ((*(_BYTE *)(a2 + 56) & 0x10) != 0)
  {
    CFStringAppend(Mutable, CFSTR(", sequence_number"));
    v21 = 4;
  }
  else
  {
    v21 = 3;
  }
  v74 = v21;
  if (a12 < 1)
  {
    v23 = 0;
  }
  else
  {
    v65 = a8;
    v66 = a3;
    v67 = a4;
    v68 = a5;
    v69 = a6;
    v70 = a1;
    v22 = a10;
    v23 = (_QWORD **)malloc_type_calloc(a12, 0x18uLL, 0x1080040D2F62047uLL);
    v24 = 0;
    v73 = a2;
    do
    {
      v25 = (char *)v23;
      v26 = v19;
      v27 = *(unsigned int *)(a2 + 72);
      if ((int)v27 < 1)
      {
        v33 = 0;
      }
      else
      {
        v28 = *(const char ***)(a2 + 80);
        v29 = a10[v24];
        v30 = 1;
        v31 = v28;
        do
        {
          v32 = *v31;
          v31 += 5;
          if (!strcmp(v32, v29))
            v33 = v28;
          else
            v33 = 0;
          if (v30 >= v27)
            break;
          ++v30;
          v28 = v31;
        }
        while (!v33);
      }
      v23 = (_QWORD **)v25;
      *(_DWORD *)&v25[24 * v24] = v74 + v24;
      if (((_BYTE)v33[3] & 8) != 0)
      {
        v37 = 0;
        v19 = v26;
        a2 = v73;
      }
      else
      {
        v34 = 0;
        v35 = typemap;
        v19 = v26;
        a2 = v73;
        do
        {
          v36 = *v35;
          v35 += 2;
          if (v36 == *((_DWORD *)v33 + 2))
            break;
          ++v34;
        }
        while (v34 != 7);
        v37 = typemap[2 * v34 + 1];
      }
      v38 = &v25[24 * v24];
      *((_DWORD *)v38 + 1) = v37;
      *((_QWORD *)v38 + 1) = ChangeLogPropertySetter;
      v39 = malloc_type_calloc(8uLL, 1uLL, 0xB9982FB0uLL);
      if (((_BYTE)v33[3] & 8) != 0 || (v40 = *((_DWORD *)v33 + 2) - 2, v40 > 5))
        v41 = 0;
      else
        v41 = (const CFArrayCallBacks *)qword_1E28816F0[v40];
      *v39 = CFArrayCreateMutable(0, 0, v41);
      *(_QWORD *)&v25[24 * v24++ + 16] = v39;
    }
    while (v24 != v19);
    v42 = v19;
    do
    {
      CFStringAppend(theString, CFSTR(", "));
      v43 = *v22++;
      CFStringAppendCString(theString, v43, 0x8000100u);
      --v42;
    }
    while (v42);
    a6 = v69;
    a1 = v70;
    a4 = v67;
    a5 = v68;
    a8 = v65;
    a3 = v66;
  }
  CFStringAppendFormat(theString, 0, CFSTR(" FROM %sChanges"), *(_QWORD *)a2);
  if (a7)
  {
    CFStringAppendFormat(theString, 0, CFSTR(" WHERE "));
    CFStringAppend(theString, a7);
  }
  v44 = CFSTR("ORDER BY ROWID ASC");
  if (a8)
    v44 = a8;
  CFStringAppendFormat(theString, 0, CFSTR(" %@;"), v44);
  ReaderConnection = _getReaderConnection(a1);
  v46 = CPSqliteConnectionStatementForSQL(ReaderConnection, theString);
  CFRelease(theString);
  if (!v46 || !*((_QWORD *)v46 + 1))
  {
    v58 = 0xFFFFFFFFLL;
    goto LABEL_60;
  }
  if (a9)
    (*(void (**)(uint64_t, const void *))(a9 + 16))(a9, v46);
  v47 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *a3 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  *a4 = CFArrayCreateMutable(v47, 0, 0);
  if (a5)
    *a5 = CFArrayCreateMutable(v47, 0, 0);
  if (a6)
    *a6 = CFArrayCreateMutable(v47, 0, 0);
  if (sqlite3_step(*((sqlite3_stmt **)v46 + 1)) == 100)
  {
    v75 = ReaderConnection;
    v48 = *MEMORY[0x1E0C9B0D0];
    do
    {
      v49 = sqlite3_column_int64(*((sqlite3_stmt **)v46 + 1), 1);
      v50 = *a3;
      RecordIDForRowid = CPRecordStoreGetRecordIDForRowid(a1, v49);
      CFArrayAppendValue(v50, (const void *)RecordIDForRowid);
      v52 = sqlite3_column_int(*((sqlite3_stmt **)v46 + 1), 2);
      CFArrayAppendValue(*a4, (const void *)v52);
      if (a6)
      {
        v53 = sqlite3_column_int(*((sqlite3_stmt **)v46 + 1), 3);
        CFArrayAppendValue(*a6, (const void *)v53);
      }
      v54 = sqlite3_column_int64(*((sqlite3_stmt **)v46 + 1), 0);
      v55 = v54;
      if (a5)
      {
        if (v54 == -1)
        {
          v57 = *a5;
          v56 = v48;
        }
        else
        {
          v56 = (int)CPRecordStoreGetRecordIDForRowid(a1, v54);
          v57 = *a5;
        }
        CFArrayAppendValue(v57, (const void *)v56);
      }
      CPSqliteStatementApplyValuesFromRecordWithNullValue((uint64_t)v46, (uint64_t)v23, v19, 0, v48);
    }
    while (sqlite3_step(*((sqlite3_stmt **)v46 + 1)) == 100);
    if (v55 == -1)
      v58 = 0xFFFFFFFFLL;
    else
      v58 = CPRecordStoreGetRecordIDForRowid(a1, v55);
    ReaderConnection = v75;
  }
  else
  {
    v58 = 0xFFFFFFFFLL;
  }
  CPSqliteStatementReset((uint64_t)v46);
  CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)ReaderConnection);
  if ((int)v19 >= 1)
  {
    v60 = v23 + 2;
    v61 = v19;
    do
    {
      v62 = *a11++;
      *v62 = **v60;
      v63 = *v60;
      v60 += 3;
      free(v63);
      --v61;
    }
    while (v61);
LABEL_60:
    if ((int)v19 >= 1)
      free(v23);
  }
  return v58;
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithOrderAndBindBlockAndProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, const __CFString *a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t *)va);
}

uint64_t CPRecordStoreDeleteChangesForClassWithIndices(uint64_t a1, _QWORD *a2, const __CFArray *a3)
{
  uint64_t result;
  uint64_t v7;
  CFMutableStringRef Mutable;
  CFIndex Count;
  uint64_t v10;
  CFIndex v11;
  CFMutableDictionaryRef *v12;
  sqlite3_stmt **v13;
  CFIndex v14;
  int ValueAtIndex;
  sqlite3_int64 v16;
  int v17;

  result = CPRecordStoreGetDatabase(a1);
  if (result)
  {
    v7 = result;
    Mutable = CFStringCreateMutable(0, 0);
    CFStringAppendFormat(Mutable, 0, CFSTR("DELETE FROM %sChanges"), *a2);
    CFStringAppend(Mutable, CFSTR(" WHERE ROWID IN("));
    Count = CFArrayGetCount(a3);
    v10 = Count;
    if (Count >= 1)
    {
      v11 = Count;
      do
      {
        CFStringAppend(Mutable, CFSTR("?"));
        if (v11 != 1)
          CFStringAppend(Mutable, CFSTR(", "));
        --v11;
      }
      while (v11);
    }
    CFStringAppend(Mutable, CFSTR(");"));
    v12 = (CFMutableDictionaryRef *)CPSqliteDatabaseConnectionForWriting(v7);
    v13 = (sqlite3_stmt **)CPSqliteConnectionStatementForSQL(v12, Mutable);
    CFRelease(Mutable);
    if (v13 && v13[1])
    {
      if (v10 >= 1)
      {
        v14 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a3, v14);
          if (!a1)
            break;
          if (ValueAtIndex < -1)
          {
            if ((ValueAtIndex & 0x7FFFFFFF) >= *(_DWORD *)(a1 + 104))
              break;
            v16 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * (ValueAtIndex & 0x7FFFFFFF));
          }
          else
          {
            v16 = ValueAtIndex;
          }
LABEL_16:
          sqlite3_bind_int64(v13[1], ++v14, v16);
          if (v10 == v14)
            goto LABEL_19;
        }
        v16 = -1;
        goto LABEL_16;
      }
LABEL_19:
      v17 = CPSqliteStatementPerform((uint64_t)v13);
      CPSqliteStatementReset((uint64_t)v13);
      CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v12);
      return v17 == 101;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

sqlite3_stmt *CPRecordStoreDeleteChangesForClassToIndexWhereWithBindBlock(uint64_t a1, _QWORD *a2, int a3, const __CFString *a4, uint64_t a5)
{
  return _CPRecordStoreDeleteChangesForClassWhereWithBindBlock(a1, a2, a3, a4, 1, 0, a5);
}

sqlite3_stmt *_CPRecordStoreDeleteChangesForClassWhereWithBindBlock(uint64_t a1, _QWORD *a2, int a3, const __CFString *a4, int a5, int a6, uint64_t a7)
{
  sqlite3_stmt *result;
  uint64_t v15;
  CFMutableStringRef Mutable;
  const __CFString *v17;
  CFMutableDictionaryRef *v18;
  const void *v19;
  sqlite3_int64 v20;
  int v21;

  result = (sqlite3_stmt *)CPRecordStoreGetDatabase(a1);
  if (result)
  {
    v15 = (uint64_t)result;
    Mutable = CFStringCreateMutable(0, 0);
    CFStringAppendFormat(Mutable, 0, CFSTR("DELETE FROM %sChanges WHERE "), *a2);
    v17 = CFSTR("1");
    if (a6)
      v17 = CFSTR("sequence_number <= ?");
    if (a5)
      CFStringAppendFormat(Mutable, 0, CFSTR("ROWID <= ?"));
    else
      CFStringAppendFormat(Mutable, 0, v17);
    if (a4)
    {
      CFStringAppend(Mutable, CFSTR(" AND "));
      CFStringAppend(Mutable, a4);
    }
    CFStringAppend(Mutable, CFSTR(";"));
    v18 = (CFMutableDictionaryRef *)CPSqliteDatabaseConnectionForWriting(v15);
    v19 = CPSqliteConnectionStatementForSQL(v18, Mutable);
    CFRelease(Mutable);
    if (!v19)
      return 0;
    result = (sqlite3_stmt *)*((_QWORD *)v19 + 1);
    if (result)
    {
      if (a1)
      {
        if (a3 >= -1)
        {
          v20 = a3;
LABEL_16:
          sqlite3_bind_int64(result, 1, v20);
          if (a7)
            (*(void (**)(uint64_t, const void *, uint64_t))(a7 + 16))(a7, v19, 2);
          v21 = CPSqliteStatementPerform((uint64_t)v19);
          CPSqliteStatementReset((uint64_t)v19);
          CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v18);
          return (sqlite3_stmt *)(v21 == 101);
        }
        if ((a3 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * (a3 & 0x7FFFFFFF));
          goto LABEL_16;
        }
      }
      v20 = -1;
      goto LABEL_16;
    }
  }
  return result;
}

sqlite3_stmt *CPRecordStoreDeleteChangesForClassToIndexWhere(uint64_t a1, _QWORD *a2, int a3, const __CFString *a4)
{
  return _CPRecordStoreDeleteChangesForClassWhereWithBindBlock(a1, a2, a3, a4, 1, 0, 0);
}

sqlite3_stmt *CPRecordStoreDeleteChangesForClassToIndex(uint64_t a1, _QWORD *a2, int a3)
{
  return _CPRecordStoreDeleteChangesForClassWhereWithBindBlock(a1, a2, a3, 0, 1, 0, 0);
}

sqlite3_stmt *CPRecordStoreDeleteChangesForClassToSequenceNumberWhere(uint64_t a1, _QWORD *a2, int a3, const __CFString *a4)
{
  return _CPRecordStoreDeleteChangesForClassWhereWithBindBlock(a1, a2, a3, a4, 0, 1, 0);
}

void CPRecordStoreInvalidateCachedInstancesOfClassWithBlock(uint64_t a1, const void *a2, uint64_t a3)
{
  const __CFDictionary *v4;
  const __CFDictionary *Value;
  __CFDictionary *v8;
  const __CFDictionary *Copy;
  CFIndex Count;
  CFIndex v11;
  CFIndex i;
  _DWORD *ValueAtIndex;
  __CFDictionary *v14;
  int v15;
  uint64_t v16;
  CFArrayRef theArray;

  v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v4, a2);
    if (Value)
    {
      if (a3)
      {
        v8 = Value;
        Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Value);
        v16 = a3;
        theArray = 0;
        CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)_forwardDictionaryEntry, &v16);
        CFRelease(Copy);
        if (theArray)
        {
          Count = CFArrayGetCount(theArray);
          if (Count >= 1)
          {
            v11 = Count;
            for (i = 0; i != v11; ++i)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
              v14 = *(__CFDictionary **)(a1 + 32);
              if (v14)
                CFDictionaryRemoveValue(v14, ValueAtIndex);
              if (ValueAtIndex)
                v15 = ValueAtIndex[8];
              else
                v15 = -1;
              CFDictionaryRemoveValue(v8, (const void *)v15);
            }
          }
          CFRelease(theArray);
        }
      }
      else
      {
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), a2);
      }
    }
  }
}

void _forwardDictionaryEntry(uint64_t a1, const void *a2, _QWORD *a3)
{
  __CFArray *Mutable;

  if (a2 && (*(unsigned int (**)(void))(*a3 + 16))())
  {
    Mutable = (__CFArray *)a3[1];
    if (!Mutable)
    {
      Mutable = CFArrayCreateMutable(0, 0, 0);
      a3[1] = Mutable;
    }
    CFArrayAppendValue(Mutable, a2);
  }
}

void CPRecordStoreInvalidateCachedInstancesOfClass(uint64_t a1, const void *a2, _QWORD *a3, uint64_t a4)
{
  _QWORD v4[6];

  if (a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 0x40000000;
    v4[2] = __CPRecordStoreInvalidateCachedInstancesOfClass_block_invoke;
    v4[3] = &__block_descriptor_tmp_0;
    v4[4] = a3;
    v4[5] = a4;
    a3 = v4;
  }
  CPRecordStoreInvalidateCachedInstancesOfClassWithBlock(a1, a2, (uint64_t)a3);
}

uint64_t CPRecordStoreGetCountOfInstancesOfClassWithFilterAndBindBlock(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return _CPRecordStoreGetCountOfInstancesOfClassWithFilterAndBindBlock(a1, a2, a3, 0, a4);
}

uint64_t _CPRecordStoreGetCountOfInstancesOfClassWithFilterAndBindBlock(uint64_t a1, _QWORD *a2, uint64_t a3, int a4, uint64_t a5)
{
  const __CFAllocator *v8;
  const char *v9;
  CFStringRef v10;
  const __CFString *v11;
  CFMutableDictionaryRef *ReaderConnection;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;

  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (a3)
  {
    v9 = "";
    if (a4)
      v9 = " WHERE";
    v10 = CFStringCreateWithFormat(v8, 0, CFSTR("SELECT %s.ROWID FROM %s%s %@;"), *a2, *a2, v9, a3);
  }
  else
  {
    v10 = CFStringCreateWithFormat(v8, 0, CFSTR("SELECT ROWID FROM %s;"), *a2);
  }
  v11 = v10;
  ReaderConnection = _getReaderConnection(a1);
  if (ReaderConnection)
  {
    v13 = (uint64_t *)ReaderConnection;
    v14 = CPSqliteConnectionStatementForSQL(ReaderConnection, v11);
    CFRelease(v11);
    if (v14 && v14[1])
    {
      if (a5)
        (*(void (**)(uint64_t, _QWORD *))(a5 + 16))(a5, v14);
      v17[0] = CPRecordStoreGetDeletedRecords(a1, a2);
      v17[1] = a1;
      v18 = 0;
      CPSqliteStatementSendResults(v14, (unsigned int (*)(_QWORD *, uint64_t))nonDeletedCountHandler, (uint64_t)v17);
      v15 = v18;
      CPSqliteStatementReset((uint64_t)v14);
    }
    else
    {
      v15 = 0xFFFFFFFFLL;
    }
    CPSqliteDatabaseReleaseSqliteConnection(v13);
  }
  else
  {
    CFRelease(v11);
    return 0xFFFFFFFFLL;
  }
  return v15;
}

uint64_t CPRecordStoreGetCountOfInstancesOfClassWhere(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return _CPRecordStoreGetCountOfInstancesOfClassWithFilterAndBindBlock(a1, a2, a3, 1, 0);
}

CFStringRef CPRecordDescribe(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<CPRecord: %p %s>"), a1, **(_QWORD **)(a1 + 24));
}

void _createTablesForClassInStore(uint64_t a1, uint64_t a2)
{
  CPRecordStoreCreateTablesForClass(a1, *(CFMutableDictionaryRef **)(a2 + 8), 0);
}

void _updateModificationDateProperties(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  CFAbsoluteTime Current;

  v1 = *(_QWORD *)(a1 + 24);
  if (*(int *)(v1 + 72) >= 1)
  {
    v3 = 0;
    v4 = 8;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)(v1 + 80) + v4) == 5)
      {
        Current = CFAbsoluteTimeGetCurrent();
        CPRecordInitializeProperty(a1, v3, (uint64_t)Current);
        CPRecordMarkPropertyChanged(a1, v3);
        v1 = *(_QWORD *)(a1 + 24);
      }
      ++v3;
      v4 += 40;
    }
    while (v3 < *(int *)(v1 + 72));
  }
}

_QWORD *CPRecordStoreWriteColumnsForRecord(uint64_t a1, int *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  int v10;
  const __CFDictionary *v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int *v19;
  int v20;
  uint64_t v22;
  int *v23;
  int v24;
  const __CFString *Property;
  const __CFDictionary *v26;
  int v29;

  v5 = *(_QWORD *)(a1 + 24);
  if (*(int *)(v5 + 72) < 1)
  {
    v8 = 0;
    goto LABEL_17;
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = *(_QWORD *)(v5 + 80) + v6;
    v10 = *(_DWORD *)(v9 + 24);
    if ((v10 & 4) == 0 && *(_DWORD *)(v9 + 8))
    {
      if ((v10 & 1) != 0)
      {
        if (a3 && (v10 & 0x240) != 0)
LABEL_12:
          ++v8;
      }
      else
      {
        if (a3)
          goto LABEL_12;
        v11 = *(const __CFDictionary **)(a1 + 40);
        if (v11)
        {
          if (CFDictionaryGetValueIfPresent(v11, v7, 0))
            goto LABEL_12;
        }
      }
    }
    ++v7;
    v5 = *(_QWORD *)(a1 + 24);
    v6 += 40;
  }
  while ((uint64_t)v7 < *(int *)(v5 + 72));
  if (v8 >= 1)
  {
    v12 = malloc_type_calloc(1uLL, 24 * v8, 0x1072040C107B9A8uLL);
    v5 = *(_QWORD *)(a1 + 24);
    goto LABEL_18;
  }
LABEL_17:
  v12 = 0;
LABEL_18:
  if (*(int *)(v5 + 72) >= 1)
  {
    v13 = 0;
    v14 = 0;
    v29 = a3;
    do
    {
      v15 = *(_QWORD *)(v5 + 80);
      v16 = v15 + 40 * v13;
      if ((*(_DWORD *)(v16 + 24) & 4) == 0)
      {
        v17 = v15 + 40 * v13;
        v20 = *(_DWORD *)(v17 + 8);
        v19 = (int *)(v17 + 8);
        v18 = v20;
        if (v20)
        {
          if ((*(_DWORD *)(v16 + 24) & 1) != 0)
          {
            if (!a3)
              goto LABEL_49;
            if ((*(_DWORD *)(v16 + 24) & 0x240) == 0 || v14 >= v8)
              goto LABEL_49;
            goto LABEL_32;
          }
          if (a3)
          {
            if (v14 < v8)
              goto LABEL_32;
          }
          else
          {
            v26 = *(const __CFDictionary **)(a1 + 40);
            if (v26 && CFDictionaryGetValueIfPresent(v26, (const void *)v13, 0) && v14 < v8)
            {
              v18 = *v19;
LABEL_32:
              v22 = 0;
              v12[3 * v14] = *(_QWORD *)v16;
              v23 = typemap;
              do
              {
                v24 = *v23;
                v23 += 2;
                if (v24 == v18)
                  break;
                ++v22;
              }
              while (v22 != 7);
              LODWORD(v12[3 * v14 + 1]) = typemap[2 * v22 + 1];
              Property = (const __CFString *)CPRecordGetProperty(a1, v13);
              if (!Property)
              {
                if ((*(_BYTE *)(v16 + 24) & 0x40) != 0)
                {
                  if (*v19 == 3)
                  {
                    pthread_once(&kCPRecordRegisterClass, (void (*)(void))CPRecordRegisterClass);
                    Property = (const __CFString *)__CPNotNullDataValue;
                  }
                  else if (*v19 == 2)
                  {
                    Property = &stru_1E2882B60;
                  }
                  else
                  {
                    Property = 0;
                  }
                }
                else
                {
                  Property = 0;
                }
              }
              v12[3 * v14++ + 2] = Property;
              a3 = v29;
            }
          }
        }
      }
LABEL_49:
      ++v13;
      v5 = *(_QWORD *)(a1 + 24);
    }
    while (v13 < *(int *)(v5 + 72));
  }
  *a2 = v8;
  return v12;
}

void _logRecordEvent(CFMutableDictionaryRef *a1, uint64_t a2, int a3, const __CFDictionary *a4)
{
  char v6;
  CFMutableStringRef Mutable;
  uint64_t v8;
  int v9;
  signed int v10;
  _DWORD *v11;
  uint64_t v12;
  CFTypeRef *v13;
  int v14;
  uint64_t v15;
  signed int v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int *v22;
  int v23;
  const void *v24;
  char *v25;
  _DWORD *v26;
  _BOOL4 v27;
  uint64_t v28;
  signed int v29;
  const void *v30;
  uint64_t v31;
  sqlite3_stmt *v32;
  uint64_t v33;
  sqlite3_int64 v34;
  int v35;
  uint64_t v36;
  CFTypeRef *v37;
  char v38;
  uint64_t (*v40)(uint64_t, uint64_t);

  v6 = *(_BYTE *)(*(_QWORD *)(a2 + 24) + 56);
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("INSERT INTO %sChanges (ROWID, record, type"), **(_QWORD **)(a2 + 24));
  if ((v6 & 0x10) != 0)
    CFStringAppendFormat(Mutable, 0, CFSTR(", sequence_number"));
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_DWORD *)(v8 + 72);
  if (v9 < 1)
  {
    v14 = 0;
    v10 = 0;
    v13 = 0;
  }
  else
  {
    v10 = 0;
    v11 = (_DWORD *)(*(_QWORD *)(v8 + 80) + 24);
    v12 = *(unsigned int *)(v8 + 72);
    do
    {
      if ((*v11 & 8) != 0 || (*v11 & 2) != 0 && *(v11 - 4))
        ++v10;
      v11 += 10;
      --v12;
    }
    while (v12);
    if (v10 < 1)
    {
      v13 = 0;
    }
    else
    {
      v13 = (CFTypeRef *)malloc_type_calloc(1uLL, 24 * v10, 0x1072040C107B9A8uLL);
      v8 = *(_QWORD *)(a2 + 24);
      v9 = *(_DWORD *)(v8 + 72);
    }
    v38 = v6;
    if (v9 >= 1)
    {
      v15 = 0;
      v16 = 0;
      v17 = CPRecordGetProperty;
      if (a3 == 2)
        v17 = (uint64_t (*)(uint64_t, uint64_t))CPRecordGetOriginalProperty;
      v40 = v17;
      do
      {
        v18 = *(_QWORD *)(v8 + 80) + 40 * v15;
        v19 = *(_DWORD *)(v18 + 8);
        v20 = *(_DWORD *)(v18 + 24);
        if (v19 && (v20 & 2) != 0 && v16 < v10)
        {
          v21 = 0;
          v13[3 * v16] = *(CFTypeRef *)v18;
          v22 = typemap;
          do
          {
            v23 = *v22;
            v22 += 2;
            if (v23 == v19)
              break;
            ++v21;
          }
          while (v21 != 7);
          LODWORD(v13[3 * v16 + 1]) = typemap[2 * v21 + 1];
          switch(v19)
          {
            case 1:
            case 4:
            case 5:
              LODWORD(v13[3 * v16 + 2]) = v40(a2, v15);
              break;
            case 2:
            case 3:
            case 6:
            case 7:
              v24 = (const void *)v40(a2, v15);
              v13[3 * v16 + 2] = v24;
              if (v24)
                CFRetain(v24);
              break;
            default:
              break;
          }
        }
        else
        {
          if ((v20 & 8) == 0 || v16 >= v10)
            goto LABEL_37;
          v25 = (char *)&v13[3 * v16];
          *(_QWORD *)v25 = *(_QWORD *)v18;
          v26 = v25 + 8;
          if (a3 == 1)
          {
            *v26 = 0;
            if (a4)
              v27 = CFDictionaryGetValue(a4, (const void *)v15) != 0;
            else
              v27 = 0;
            LODWORD(v13[3 * v16 + 2]) = v27;
          }
          else
          {
            *v26 = 2;
            v13[3 * v16 + 2] = 0;
          }
        }
        ++v16;
LABEL_37:
        ++v15;
        v8 = *(_QWORD *)(a2 + 24);
      }
      while (v15 < *(int *)(v8 + 72));
    }
    if (v10 < 1)
    {
      v14 = 0;
      v6 = v38;
    }
    else
    {
      v28 = 0;
      v6 = v38;
      do
      {
        CFStringAppend(Mutable, CFSTR(", "));
        CFStringAppendCString(Mutable, (const char *)v13[v28], 0x8000100u);
        v28 += 3;
      }
      while (3 * v10 != v28);
      v8 = *(_QWORD *)(a2 + 24);
      v14 = 1;
    }
  }
  CFStringAppendFormat(Mutable, 0, CFSTR(") VALUES(IFNULL(1 + (SELECT MAX(ROWID) FROM %sChanges), 0), ?, ?"), *(_QWORD *)v8);
  if ((v6 & 0x10) != 0)
    CFStringAppendFormat(Mutable, 0, CFSTR(", ?"));
  if (v14)
  {
    v29 = v10;
    do
    {
      CFStringAppend(Mutable, CFSTR(", ?"));
      --v29;
    }
    while (v29);
  }
  CFStringAppend(Mutable, CFSTR(");"));
  v30 = CPSqliteConnectionStatementForSQL(a1, Mutable);
  if (v30)
  {
    v31 = (uint64_t)v30;
    v32 = (sqlite3_stmt *)*((_QWORD *)v30 + 1);
    if (v32)
    {
      v33 = *(_QWORD *)(a2 + 16);
      if (v33)
      {
        v34 = *(int *)(a2 + 32);
        if ((int)v34 >= -1)
        {
LABEL_54:
          sqlite3_bind_int64(v32, 1, v34);
          v35 = 2;
          sqlite3_bind_int(*(sqlite3_stmt **)(v31 + 8), 2, a3);
          if ((v6 & 0x10) != 0)
          {
            v35 = 3;
            sqlite3_bind_int(*(sqlite3_stmt **)(v31 + 8), 3, *(_DWORD *)(*(_QWORD *)(a2 + 16) + 96) + 1);
          }
          CPSqliteStatementBindValuesForColumns(v31, (uint64_t)v13, v10, v35);
          CPSqliteStatementPerform(v31);
          CPSqliteStatementReset(v31);
          goto LABEL_57;
        }
        if ((v34 & 0x7FFFFFFF) < *(_DWORD *)(v33 + 104))
        {
          v34 = *(_QWORD *)(*(_QWORD *)(v33 + 112) + 8 * (v34 & 0x7FFFFFFF));
          goto LABEL_54;
        }
      }
      v34 = -1;
      goto LABEL_54;
    }
  }
LABEL_57:
  if (v14)
  {
    v36 = v10;
    v37 = v13 + 2;
    do
    {
      switch(*((_DWORD *)v37 - 2))
      {
        case 2:
        case 3:
        case 6:
        case 7:
          if (*v37)
            CFRelease(*v37);
          break;
        default:
          break;
      }
      v37 += 3;
      --v36;
    }
    while (v36);
  }
  free(v13);
  CFRelease(Mutable);
}

void CPRecordStoreDeleteRecordsInDictionary(uint64_t a1, CFDictionaryRef theDict, _QWORD *a3)
{
  a3[2] = a1;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)CPRecordStoreDeleteRecord, a3);
}

void CPRecordStoreDeleteRecord(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  const __CFString *v6;
  const void *v7;
  uint64_t v8;
  sqlite3_stmt *v9;
  uint64_t v10;
  sqlite3_int64 v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  __CFDictionary *Cache;

  v5 = *(_QWORD *)(a2 + 16);
  if ((*(_BYTE *)(*a3 + 57) & 1) != 0 && (*(_BYTE *)(*(_QWORD *)(v5 + 24) + 56) & 2) != 0 && *(_BYTE *)(a2 + 24))
    _logRecordEvent((CFMutableDictionaryRef *)a3[1], *(_QWORD *)(a2 + 16), 2, 0);
  v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("DELETE FROM %s WHERE ROWID = ?;"),
         *(_QWORD *)a3[2]);
  v7 = CPSqliteConnectionStatementForSQL((CFMutableDictionaryRef *)a3[1], v6);
  if (v7)
  {
    v8 = (uint64_t)v7;
    v9 = (sqlite3_stmt *)*((_QWORD *)v7 + 1);
    if (v9)
    {
      v10 = *a3;
      if (*a3)
      {
        if ((int)a1 >= -1)
        {
          v11 = (int)a1;
LABEL_12:
          sqlite3_bind_int64(v9, 1, v11);
          CPSqliteStatementPerform(v8);
          CPSqliteStatementReset(v8);
          goto LABEL_13;
        }
        if ((a1 & 0x7FFFFFFF) < *(_DWORD *)(v10 + 104))
        {
          v11 = *(_QWORD *)(*(_QWORD *)(v10 + 112) + 8 * (a1 & 0x7FFFFFFF));
          goto LABEL_12;
        }
      }
      v11 = -1;
      goto LABEL_12;
    }
  }
LABEL_13:
  CFRelease(v6);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(a3[2] + 32);
  if (v12)
    v12(a1, v5, a3[1]);
  if (v5)
    *(_BYTE *)(v5 + 58) = 0;
  Cache = (__CFDictionary *)CPRecordStoreGetCache(*a3, (void *)a3[2]);
  if (Cache)
    CFDictionaryRemoveValue(Cache, (const void *)(int)a1);
}

void CPRecordStoreSaveRecordIfNotAdded(_QWORD *value, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const __CFSet *v7;

  if (value)
  {
    v4 = value[2];
    if (v4)
    {
      v7 = *(const __CFSet **)(v4 + 48);
      if (!v7 || !CFSetContainsValue(v7, value))
        CPRecordStoreSaveRecord((uint64_t)value, a2, a3);
    }
  }
}

void _disownRecordValue(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = 0;
}

void _revertRecord(uint64_t a1, uint64_t a2)
{
  CPRecordInvalidateRecord(a2);
}

uint64_t ChangeLogPropertySetter(int a1, CFMutableArrayRef *a2, void *value)
{
  CFArrayAppendValue(*a2, value);
  return 1;
}

uint64_t nonDeletedCountHandler(uint64_t a1, uint64_t a2)
{
  sqlite3_int64 v3;
  int RecordIDForRowid;

  v3 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), 0);
  RecordIDForRowid = CPRecordStoreGetRecordIDForRowid(*(_QWORD *)(a2 + 8), v3);
  if (!*(_QWORD *)a2 || !CFDictionaryContainsKey(*(CFDictionaryRef *)a2, (const void *)RecordIDForRowid))
    ++*(_DWORD *)(a2 + 16);
  return 0;
}

uint64_t CPRecordDeleteInfoRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kCPRecordDeleteInfoTypeID = result;
  return result;
}

void CPRecordDeleteInfoDestroy(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 16);
  if (v1)
    CFRelease(v1);
}

CFStringRef CPRecordDeleteInfoDescribe(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<CPRecordDeleteInfo: %p>"), a1);
}

uint64_t decomposePhoneNumber(uint64_t a1, const __CFString *a2)
{
  const __CFString *v3;
  uint64_t v4;

  v3 = a2;
  if (!a2)
    v3 = CPPhoneNumberCopyHomeCountryCode();
  v4 = PNDecomposeForCountry();
  if (v3 != a2 && v3)
    CFRelease(v3);
  return v4;
}

const __CFString *CPPhoneNumberCopyHomeCountryCode()
{
  const __CFString *result;

  result = (const __CFString *)copyCountryCode(&__CurrentHomeCountryCode, __CurrentHomeCountryCodeListenerRegistered, CFSTR("CPHomeCountryCode"), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberHomeCountryCodeChanged, CFSTR("CPHomeCountryCodeChanged.Internal"));
  if (!result)
    return CPPhoneNumberCopyActiveCountryCode();
  return result;
}

uint64_t CPPhoneNumberCopyNormalized(const char *a1)
{
  size_t v2;
  CFStringRef v3;
  const __CFString *v4;
  uint64_t v5;

  v2 = strlen(a1);
  v3 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)a1, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  v4 = CPPhoneNumberCopyHomeCountryCode();
  v5 = PNCopyBestGuessNormalizedNumberForCountry();
  CFRelease(v3);
  if (v4)
    CFRelease(v4);
  return v5;
}

uint64_t _phoneNumbersEqual(const char *a1, uint64_t a2, const char *a3)
{
  const __CFAllocator *v5;
  size_t v6;
  const __CFAllocator *v7;
  CFStringRef v8;
  size_t v9;
  CFStringRef v10;
  uint64_t v11;

  if (!a1 || !a3)
    return 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = strlen(a1);
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  v8 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)a1, v6, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  v9 = strlen(a3);
  v10 = CFStringCreateWithBytesNoCopy(v5, (const UInt8 *)a3, v9, 0x8000100u, 0, v7);
  v11 = PNPhoneNumbersEqual();
  CFRelease(v8);
  CFRelease(v10);
  return v11;
}

uint64_t CPPhoneNumbersEqualWithCountries(const char *a1, uint64_t a2, const char *a3)
{
  return _phoneNumbersEqual(a1, a2, a3);
}

uint64_t CPPhoneNumbersEqual(const char *a1, const char *a2, uint64_t a3)
{
  return _phoneNumbersEqual(a1, a3, a2);
}

uint64_t CPPhoneNumbersEqualStrict(const char *a1, const char *a2)
{
  const __CFString *v4;
  uint64_t v5;

  v4 = CPPhoneNumberCopyHomeCountryCode();
  v5 = _phoneNumbersEqual(a1, (uint64_t)v4, a2);
  if (v4)
    CFRelease(v4);
  return v5;
}

char *CPPhoneNumberGetLastFour(const __CFString *a1, char *a2)
{
  CFIndex Length;
  const UniChar *CharactersPtr;
  char *result;
  int v7;
  CFIndex v8;
  CFIndex v9;
  uint64_t v10;
  CFIndex v11;
  UniChar v12;
  CFIndex v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  CFIndex v17;
  CFIndex v18;
  char v19[3];
  _BYTE v20[2];
  UniChar buffer[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CFStringRef v29;
  const UniChar *v30;
  char *v31;
  uint64_t v32;
  CFIndex v33;
  CFIndex v34;
  CFIndex v35;
  CFRange v36;

  Length = CFStringGetLength(a1);
  v29 = a1;
  v32 = 0;
  v33 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  result = 0;
  v30 = CharactersPtr;
  if (!CharactersPtr)
    result = (char *)CFStringGetCStringPtr(a1, 0x600u);
  v31 = result;
  v34 = 0;
  v35 = 0;
  v20[1] = 0;
  if (!Length)
    goto LABEL_31;
  v7 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = -Length;
  v9 = Length + 64;
  *(_OWORD *)buffer = 0u;
  v22 = 0u;
  do
  {
    if ((unint64_t)Length >= 5)
      v10 = 5;
    else
      v10 = Length;
    if (Length >= 1)
    {
      v11 = v33;
      if (v33 >= Length)
      {
        if (v30)
        {
          v12 = v30[Length - 1 + v32];
        }
        else if (v31)
        {
          v12 = v31[v32 - 1 + Length];
        }
        else
        {
          if (v35 < Length || (v13 = v34, v34 >= Length))
          {
            v14 = -v10;
            v15 = v10 + v8;
            v16 = v9 - v10;
            v17 = Length + v14;
            v18 = v17 + 64;
            if (v17 + 64 >= v33)
              v18 = v33;
            v34 = v17;
            v35 = v18;
            if (v33 >= v16)
              v11 = v16;
            v36.length = v11 + v15;
            v36.location = v17 + v32;
            CFStringGetCharacters(v29, v36, buffer);
            v13 = v34;
          }
          v12 = *(_WORD *)&v20[2 * Length + -2 * v13];
        }
        result = (char *)v12;
        if ((unsigned __int16)((v12 & 0xFFDF) - 65) > 0x19u)
        {
          if (v12 - 48 > 9)
            goto LABEL_27;
        }
        else
        {
          result = (char *)__toupper(v12);
          v12 = __KeyMap[(int)result - 65];
        }
        if (v12)
          v19[3 - v7++] = v12;
      }
    }
LABEL_27:
    if (!--Length)
      break;
    ++v8;
    --v9;
  }
  while (v7 < 4);
  if (v7 >= 1)
    return strncpy(a2, &v19[4 - v7], (v7 + 1));
LABEL_31:
  *a2 = 0;
  return result;
}

CFTypeRef CPPhoneNumberCopyActiveCountryCodeNoDefault()
{
  return copyCountryCode(&__CurrentCountryCode, __CurrentCountryCodeListenerRegistered, CFSTR("CPActiveCountryCode"), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberActiveCountryCodeChanged, CFSTR("CPActiveCountryCodeChanged.Internal"));
}

CFTypeRef copyCountryCode(const void **a1, _BYTE *a2, const __CFString *a3, void (__cdecl *a4)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef), const __CFString *a5)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v11;
  const void *v12;
  CFTypeRef v13;
  const __CFString *v14;
  const __CFString *v15;
  CFPropertyListRef v16;

  if (a2 && !*a2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, a4, a5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    *a2 = 1;
  }
  pthread_mutex_lock(&__CountryCodeLock);
  v11 = *a1;
  v12 = (const void *)*MEMORY[0x1E0C9B0D0];
  if (*a1 == (const void *)*MEMORY[0x1E0C9B0D0])
    goto LABEL_10;
  if (v11)
  {
    v13 = CFRetain(v11);
    goto LABEL_13;
  }
  v14 = CPCopySharedResourcesPreferencesDomainForDomain((uint64_t)CFSTR("com.apple.AppSupport"));
  if (!v14)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_13;
  }
  v15 = v14;
  v16 = CFPreferencesCopyValue(a3, v14, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  *a1 = v16;
  if (v16)
  {
    v13 = CFRetain(v16);
  }
  else
  {
    v13 = 0;
    *a1 = v12;
  }
  CFRelease(v15);
LABEL_13:
  pthread_mutex_unlock(&__CountryCodeLock);
  return v13;
}

void _CPPhoneNumberActiveCountryCodeChanged()
{
  handleCountryChanged(__ActiveCountryCodeNoteCount, CFSTR("CPActiveCountryCode"), &__CurrentCountryCode, 0, CFSTR("CPActiveCountryCodeChanged"));
}

const __CFString *CPPhoneNumberCopyActiveCountryCode()
{
  CFTypeRef v0;
  const __CFLocale *v1;
  const __CFLocale *v2;
  const __CFString *Value;
  __CFString *MutableCopy;

  v0 = copyCountryCode(&__CurrentCountryCode, __CurrentCountryCodeListenerRegistered, CFSTR("CPActiveCountryCode"), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberActiveCountryCodeChanged, CFSTR("CPActiveCountryCodeChanged.Internal"));
  if (!v0)
  {
    v1 = CFLocaleCopyCurrent();
    if (v1)
    {
      v2 = v1;
      Value = (const __CFString *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
      if (Value)
      {
        MutableCopy = CFStringCreateMutableCopy(0, 0, Value);
        v0 = MutableCopy;
        if (MutableCopy)
          CFStringLowercase(MutableCopy, v2);
      }
      else
      {
        v0 = 0;
      }
      CFRelease(v2);
    }
    else
    {
      v0 = 0;
    }
  }
  if (v0)
    return (const __CFString *)v0;
  else
    return CFSTR("us");
}

CFTypeRef copyHomeCountryCodeNoDefault()
{
  return copyCountryCode(&__CurrentHomeCountryCode, __CurrentHomeCountryCodeListenerRegistered, CFSTR("CPHomeCountryCode"), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberHomeCountryCodeChanged, CFSTR("CPHomeCountryCodeChanged.Internal"));
}

CFTypeRef CPPhoneNumberCopyNetworkCountryCode()
{
  return copyCountryCode(&__CurrentNetworkCountryCode, __CurrentNetworkCountryCodeListenerRegistered, CFSTR("CPNetworkCountryCode"), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberNetworkCountryCodeChanged, CFSTR("CPNetworkCountryCodeChanged.Internal"));
}

void _CPPhoneNumberNetworkCountryCodeChanged()
{
  handleCountryChanged(&__NetworkCountryCodeNoteCount, CFSTR("CPNetworkCountryCode"), &__CurrentNetworkCountryCode, &__LastKnownNetworkCountryCode, CFSTR("CPNetworkCountryCodeChanged"));
}

CFTypeRef CPPhoneNumberCopyLastKnownNetworkCountryCode()
{
  CFTypeRef result;

  result = copyCountryCode(&__CurrentNetworkCountryCode, __CurrentNetworkCountryCodeListenerRegistered, CFSTR("CPNetworkCountryCode"), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberNetworkCountryCodeChanged, CFSTR("CPNetworkCountryCodeChanged.Internal"));
  if (!result)
    return copyCountryCode(&__LastKnownNetworkCountryCode, 0, CFSTR("CPLastKnownNetworkCountryCode"), 0, 0);
  return result;
}

const __CFString *CPPhoneNumberCopyCountryCodeForIncomingNumber()
{
  const __CFString *result;

  result = (const __CFString *)copyCountryCode(&__CurrentNetworkCountryCode, __CurrentNetworkCountryCodeListenerRegistered, CFSTR("CPNetworkCountryCode"), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberNetworkCountryCodeChanged, CFSTR("CPNetworkCountryCodeChanged.Internal"));
  if (!result)
    return CPPhoneNumberCopyActiveCountryCode();
  return result;
}

const __CFString *CPPhoneNumberCopyCountryCodeForIncomingVoiceCall()
{
  return CPPhoneNumberCopyCountryCodeForIncomingNumber();
}

void CPPhoneNumberSetActiveCountryCode(__CFString *a1)
{
  setCountryCode(a1, (uint64_t (*)(void))CPPhoneNumberCopyActiveCountryCodeNoDefault, CFSTR("CPActiveCountryCode"), 0, CFSTR("CPActiveCountryCodeChanged.Internal"), &__CurrentCountryCode, 0, __ActiveCountryCodeNoteCount);
}

void setCountryCode(CFMutableStringRef MutableCopy, uint64_t (*a2)(void), const __CFString *a3, const __CFString *a4, const __CFString *a5, CFTypeRef *a6, _QWORD *a7, _DWORD *a8)
{
  CFIndex Length;
  unint64_t v17;
  const void *v18;
  int v19;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (getuid())
  {
    if (MutableCopy)
    {
      Length = CFStringGetLength(MutableCopy);
      MutableCopy = CFStringCreateMutableCopy(0, Length + 1, MutableCopy);
      CFStringLowercase(MutableCopy, 0);
    }
    v17 = a2();
    v18 = (const void *)v17;
    v19 = MutableCopy == 0;
    v20 = MutableCopy != 0;
    if (v17)
      v20 = 0;
    else
      v19 = 0;
    if (v19 != v20)
      goto LABEL_10;
    if (!((unint64_t)MutableCopy | v17))
      return;
    if (CFStringCompare((CFStringRef)v17, MutableCopy, 0))
    {
LABEL_10:
      pthread_mutex_lock(&__CountryCodeLock);
      v21 = CPCopySharedResourcesPreferencesDomainForDomain((uint64_t)CFSTR("com.apple.AppSupport"));
      if (v21)
      {
        v22 = v21;
        v23 = (const __CFString *)*MEMORY[0x1E0C9B250];
        CFPreferencesSetValue(a3, MutableCopy, v21, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
        if (a4 && MutableCopy)
          CFPreferencesSetValue(a4, MutableCopy, v22, CFSTR("mobile"), v23);
        CFPreferencesSynchronize(v22, CFSTR("mobile"), v23);
        CFRelease(v22);
      }
      ++*a8;
      if (*a6)
        CFRelease(*a6);
      *a6 = MutableCopy;
      if (MutableCopy)
      {
        CFRetain(MutableCopy);
        if (a7)
        {
          *a7 = MutableCopy;
          CFRetain(MutableCopy);
        }
      }
      pthread_mutex_unlock(&__CountryCodeLock);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, a5, 0, 0, 1u);
    }
    if (v18)
      CFRelease(v18);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
}

void CPPhoneNumberSetHomeCountryCode(__CFString *a1)
{
  setCountryCode(a1, (uint64_t (*)(void))copyHomeCountryCodeNoDefault, CFSTR("CPHomeCountryCode"), 0, CFSTR("CPHomeCountryCodeChanged.Internal"), &__CurrentHomeCountryCode, 0, &__HomeCountryCodeNoteCount);
}

void CPPhoneNumberSetNetworkCountryCode(__CFString *a1)
{
  setCountryCode(a1, (uint64_t (*)(void))CPPhoneNumberCopyNetworkCountryCode, CFSTR("CPNetworkCountryCode"), CFSTR("CPLastKnownNetworkCountryCode"), CFSTR("CPNetworkCountryCodeChanged.Internal"), &__CurrentNetworkCountryCode, &__LastKnownNetworkCountryCode, &__NetworkCountryCodeNoteCount);
}

const char *CPPhoneNumberCopyCountryCodeForInternationalCallingCode(const char *result)
{
  const UInt8 *v1;
  size_t v2;
  CFStringRef v3;
  uint64_t v4;

  if (result)
  {
    v1 = (const UInt8 *)result;
    v2 = strlen(result);
    v3 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    v4 = _PNCopyCountryCodeForInternationalCode();
    CFRelease(v3);
    return (const char *)v4;
  }
  return result;
}

uint64_t CPPhoneNumberCopyFormattedStringForVoiceCall()
{
  const __CFString *v0;
  uint64_t v1;

  v0 = CPPhoneNumberCopyCountryCodeForIncomingNumber();
  v1 = PNCreateFormattedStringWithCountry();
  if (v0)
    CFRelease(v0);
  return v1;
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  const __CFString *v0;
  uint64_t v1;

  v0 = CPPhoneNumberCopyActiveCountryCode();
  v1 = PNCreateFormattedStringWithCountry();
  CFRelease(v0);
  return v1;
}

void handleCountryChanged(_DWORD *a1, const __CFString *a2, const void **a3, const void **a4, const __CFString *a5)
{
  __CFNotificationCenter *LocalCenter;
  const void *v11;
  const void **v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  id v17;

  pthread_mutex_lock(&__CountryCodeLock);
  if (*a1)
  {
    --*a1;
    goto LABEL_3;
  }
  v11 = *a3;
  v12 = (const void **)MEMORY[0x1E0C9B0D0];
  if (*a3)
  {
    if (v11 != (const void *)*MEMORY[0x1E0C9B0D0])
      CFRelease(v11);
    *a3 = 0;
  }
  if (getuid())
  {
    v13 = CPCopySharedResourcesPreferencesDomainForDomain((uint64_t)CFSTR("com.apple.AppSupport"));
    if (v13)
    {
      v14 = v13;
      v15 = (const __CFString *)*MEMORY[0x1E0C9B250];
      CFPreferencesSynchronize(v13, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
      *a3 = CFPreferencesCopyValue(a2, v14, CFSTR("mobile"), v15);
      CFRelease(v14);
    }
  }
  else
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/com.apple.AppSupport.plist"));
    if (v16)
    {
      v17 = (id)objc_msgSend(v16, "valueForKey:", a2);
      *a3 = v17;
      if (!a4)
        goto LABEL_17;
      goto LABEL_15;
    }
  }
  v17 = (id)*a3;
  if (!a4)
    goto LABEL_17;
LABEL_15:
  if (!v17)
  {
LABEL_18:
    *a3 = *v12;
    goto LABEL_19;
  }
  *a4 = v17;
  CFRetain(v17);
  v17 = (id)*a3;
LABEL_17:
  if (!v17)
    goto LABEL_18;
LABEL_19:
  if (a4 && !*a4)
    *a4 = *v12;
LABEL_3:
  pthread_mutex_unlock(&__CountryCodeLock);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, a5, 0, 0, 1u);
}

void _CPPhoneNumberHomeCountryCodeChanged()
{
  handleCountryChanged(&__HomeCountryCodeNoteCount, CFSTR("CPHomeCountryCode"), &__CurrentHomeCountryCode, 0, CFSTR("CPHomeCountryCodeChanged"));
}

CFURLRef CPFileBuildDirectoriesToPath(CFStringRef filePath, uint64_t a2)
{
  const __CFURL *v3;
  const __CFURL *v4;
  CFURLRef v5;

  if (!filePath)
    return 0;
  v3 = CFURLCreateWithFileSystemPath(0, filePath, kCFURLPOSIXPathStyle, 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CPFileBuildDirectoriesToURL(v3, a2);
  CFRelease(v4);
  return v5;
}

CFURLRef CPFileBuildDirectoriesToURL(const __CFURL *a1, uint64_t a2)
{
  CFURLRef result;
  const void *v5;
  int v6;

  if ((CPPathUtils_MakePath(a1, a2) & 1) != 0)
    return (CFURLRef)1;
  result = CFURLCreateCopyDeletingLastPathComponent(0, a1);
  if (result)
  {
    v5 = result;
    v6 = CPFileBuildDirectoriesToURL(result, a2);
    CFRelease(v5);
    if (v6)
      return CPPathUtils_MakePath(a1, a2);
    else
      return 0;
  }
  return result;
}

BOOL CPDeleteFile(const char *a1)
{
  return unlink(a1) == 0;
}

BOOL CPSecureDeleteFile(const char *a1)
{
  int v2;
  int64_t st_blksize;
  off_t st_size;
  _BYTE *v5;
  pid_t v6;
  _BYTE *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  stat v12;

  memset(&v12, 0, sizeof(v12));
  if (lstat(a1, &v12) == -1)
    return 0;
  if ((v12.st_mode & 0xF000) == 0x8000)
  {
    v2 = open(a1, 1, 0);
    if (v2 < 0)
    {
      if (*__error() != 13)
        return 0;
      chmod(a1, 0x1FFu);
      v2 = open(a1, 1, 0);
      if (v2 < 0)
        return 0;
    }
    st_blksize = v12.st_blksize;
    st_size = v12.st_size;
    v5 = malloc_type_malloc(v12.st_blksize, 0x58B81F3EuLL);
    if ((__CPRandomizeBuffer_initalized & 1) == 0)
    {
      v6 = getpid();
      srandom(v6);
      __CPRandomizeBuffer_initalized = 1;
    }
    if ((_DWORD)st_blksize)
    {
      v7 = v5;
      v8 = st_blksize;
      do
      {
        *v7++ = random();
        --v8;
      }
      while (v8);
    }
    if (st_size >= st_blksize)
      v9 = st_size - st_blksize;
    else
      v9 = 0;
    lseek(v2, 0, 0);
    if (v9 < 1)
    {
      v10 = 0;
LABEL_21:
      write(v2, v5, st_size - v10);
    }
    else
    {
      v10 = 0;
      while (write(v2, v5, st_blksize) != -1)
      {
        v10 += write(v2, v5, st_blksize);
        if (v10 >= v9)
          goto LABEL_21;
      }
    }
    lseek(v2, 0, 0);
    free(v5);
    close(v2);
  }
  if ((unlink(a1) & 0x80000000) == 0)
    return 1;
  if (*__error() == 1)
  {
    chmod(a1, 0x1FFu);
    return unlink(a1) >= 0;
  }
  return 0;
}

FTS *CPDeleteTree(char *a1, int a2)
{
  FTS *result;
  FTS *v4;
  FTSENT *v5;
  FTSENT *v6;
  const char *fts_path;
  char *v8[3];

  v8[2] = *(char **)MEMORY[0x1E0C80C00];
  v8[0] = a1;
  v8[1] = 0;
  result = fts_open(v8, 20, 0);
  if (!result)
    return result;
  v4 = result;
  v5 = fts_read(result);
  if (!v5)
  {
LABEL_14:
    if (fts_close(v4) == -1)
    {
      if (logHandle_onceToken != -1)
        dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
      if (os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR))
        CPDeleteTree_cold_1();
    }
    return (FTS *)1;
  }
  v6 = v5;
  while (2)
  {
    switch(v6->fts_info)
    {
      case 2u:
      case 4u:
        if (fts_close(v4) != -1)
          return 0;
        if (logHandle_onceToken != -1)
          dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
        result = (FTS *)os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR);
        if ((_DWORD)result)
          goto LABEL_41;
        return result;
      case 6u:
        rmdir(v6->fts_path);
        goto LABEL_13;
      case 7u:
        if (fts_close(v4) != -1)
          return 0;
        if (logHandle_onceToken != -1)
          dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
        result = (FTS *)os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR);
        if ((_DWORD)result)
          goto LABEL_41;
        return result;
      case 8u:
      case 0xCu:
      case 0xDu:
        fts_path = v6->fts_path;
        if (a2)
        {
          if (!CPSecureDeleteFile(fts_path))
          {
            if (fts_close(v4) != -1)
              return 0;
            if (logHandle_onceToken != -1)
              dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
            result = (FTS *)os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR);
            if ((_DWORD)result)
              goto LABEL_41;
            return result;
          }
LABEL_13:
          v6 = fts_read(v4);
          if (!v6)
            goto LABEL_14;
          continue;
        }
        if ((unlink(fts_path) & 0x80000000) == 0)
          goto LABEL_13;
        if (*__error() != 13)
          goto LABEL_13;
        chmod(v6->fts_path, 0x1FFu);
        if ((unlink(v6->fts_path) & 0x80000000) == 0)
          goto LABEL_13;
        if (fts_close(v4) != -1)
          return 0;
        if (logHandle_onceToken != -1)
          dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
        result = (FTS *)os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR);
        if ((_DWORD)result)
        {
LABEL_41:
          CPDeleteTree_cold_1();
          return 0;
        }
        return result;
      default:
        goto LABEL_13;
    }
  }
}

uint64_t CPTemporaryFileWithUniqueName(uint64_t a1, int *a2)
{
  const char *v3;
  int v4;
  int v5;
  uint64_t v6;
  char v8[1025];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString fileSystemRepresentation](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", a1), "fileSystemRepresentation");
  v4 = CPOpenTemporaryFile((uint64_t)v3, v8, 0x400uLL);
  if (v4 == -1)
    return 0;
  v5 = v4;
  v6 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v8, 0, 0);
  if (a2)
    *a2 = v5;
  else
    close(v5);
  return v6;
}

CFURLRef CPPathUtils_MakePath(const __CFURL *a1, mode_t a2)
{
  CFURLRef result;
  const void *v4;
  const __CFString *v5;
  const __CFString *v6;
  int CString;
  int v8;
  NSObject *v9;
  stat v10;
  char buffer[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = CFURLCopyAbsoluteURL(a1);
  if (!result)
    return result;
  v4 = result;
  v5 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
  if (!v5)
  {
    CFRelease(v4);
    return 0;
  }
  v6 = v5;
  CString = CFStringGetCString(v5, buffer, 1024, 0x8000100u);
  CFRelease(v6);
  CFRelease(v4);
  if (!CString)
    return 0;
  memset(&v10, 0, sizeof(v10));
  if (stat(buffer, &v10) != -1)
    return (CFURLRef)1;
  v8 = *__error();
  if (v8 != 20 && v8 != 2 || *(unsigned __int16 *)buffer == 47)
  {
    if (logHandle_onceToken != -1)
      dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
    v9 = logHandle_logHandle;
    if (os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR))
      CPPathUtils_MakePath_cold_1((uint64_t)buffer, v8, v9);
  }
  return (CFURLRef)(mkdir(buffer, a2) == 0);
}

os_log_t __logHandle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.AppSupport", "CPFileUtilities");
  logHandle_logHandle = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

char *OUTLINED_FUNCTION_2(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_3()
{
  return __error();
}

BOOL CPScheduleWakeAtDateWithIdentifier(const __CFDate *a1, const __CFString *a2)
{
  return IOPMSchedulePowerEvent(a1, a2, CFSTR("wake")) == 0;
}

void CPCancelWakeAtDateWithIdentifier(const __CFDate *a1, CFStringRef my_id)
{
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  const __CFString *v10;
  const __CFDate *v11;

  if (a1)
  {
    IOPMCancelScheduledPowerEvent(a1, my_id, CFSTR("wake"));
  }
  else if (my_id)
  {
    v3 = IOPMCopyScheduledPowerEvents();
    if (v3)
    {
      v4 = v3;
      Count = CFArrayGetCount(v3);
      if (Count >= 1)
      {
        v6 = Count;
        for (i = 0; i != v6; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, i);
          Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("scheduledby"));
          if (Value)
          {
            if (CFStringCompare(my_id, Value, 0) == kCFCompareEqualTo)
            {
              v10 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("eventtype"));
              if (v10)
              {
                if (CFStringCompare(v10, CFSTR("wake"), 0) == kCFCompareEqualTo)
                {
                  v11 = (const __CFDate *)CFDictionaryGetValue(ValueAtIndex, CFSTR("time"));
                  if (v11)
                    IOPMCancelScheduledPowerEvent(v11, my_id, CFSTR("wake"));
                }
              }
            }
          }
        }
      }
      CFRelease(v4);
    }
  }
}

CFIndex __CPPowerAssertionsGetCount()
{
  CFIndex Count;

  pthread_mutex_lock(&_IdentifiedPowerAssertionsLock);
  if (_IdentifiedPowerAssertions)
    Count = CFDictionaryGetCount((CFDictionaryRef)_IdentifiedPowerAssertions);
  else
    Count = 0;
  pthread_mutex_unlock(&_IdentifiedPowerAssertionsLock);
  return Count;
}

uint64_t __CPPowerAssertionGetTimeouts(uint64_t a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  uint64_t v6;

  pthread_mutex_lock(&_PowerAssertionsLock);
  Count = _PowerAssertions;
  if (_PowerAssertions)
    Count = CFArrayGetCount((CFArrayRef)_PowerAssertions);
  if (Count < a2)
    a2 = Count;
  if (a2 >= 1)
  {
    v5 = 0;
    do
    {
      objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)_PowerAssertions, v5), "timeout");
      *(_QWORD *)(a1 + 8 * v5++) = v6;
    }
    while (a2 != v5);
  }
  pthread_mutex_unlock(&_PowerAssertionsLock);
  return a2;
}

uint64_t _CompareAssertionTimeouts(void *a1, void *a2)
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "timeout");
  v4 = v3;
  objc_msgSend(a2, "timeout");
  if (v4 < v5)
    return -1;
  else
    return v5 < v4;
}

uint64_t CPSetPowerAssertionWithIdentifier(int a1, const void *a2)
{
  uint64_t v4;
  const __CFDictionary *Mutable;
  int v6;
  _CPPowerAssertion *v7;
  _CPPowerAssertion *v8;

  if (pthread_mutex_lock(&_IdentifiedPowerAssertionsLock))
    return 0;
  Mutable = (const __CFDictionary *)_IdentifiedPowerAssertions;
  if (!_IdentifiedPowerAssertions)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    _IdentifiedPowerAssertions = (uint64_t)Mutable;
  }
  v6 = CFDictionaryContainsKey(Mutable, a2);
  if (!a1 || v6)
  {
    v4 = 1;
    if ((a1 & 1) == 0 && v6)
      CFDictionaryRemoveValue((CFMutableDictionaryRef)_IdentifiedPowerAssertions, a2);
  }
  else
  {
    v7 = -[_CPPowerAssertion initWithIdentifier:timeout:]([_CPPowerAssertion alloc], "initWithIdentifier:timeout:", a2, 0.0);
    if (v7)
    {
      v8 = v7;
      CFDictionarySetValue((CFMutableDictionaryRef)_IdentifiedPowerAssertions, a2, v7);
      CFRelease(v8);
      v4 = 1;
    }
    else
    {
      v4 = 0;
    }
  }
  pthread_mutex_unlock(&_IdentifiedPowerAssertionsLock);
  return v4;
}

_CPPowerAssertion *CPPowerAssertionCreate(uint64_t a1, double a2)
{
  return -[_CPPowerAssertion initWithIdentifier:timeout:]([_CPPowerAssertion alloc], "initWithIdentifier:timeout:", a1, a2);
}

UInt8 *_CPCreateUTF8StringFromCFString(const __CFString *a1)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  UInt8 *v4;
  CFIndex usedBufLen;
  CFRange v7;

  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  usedBufLen = 0;
  v4 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x633AAD5AuLL);
  v7.location = 0;
  v7.length = Length;
  CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v4, MaximumSizeForEncoding, &usedBufLen);
  v4[usedBufLen] = 0;
  return v4;
}

void sub_18EB21818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t _notificationServerWasRestarted(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_notificationServerWasRestarted");
}

uint64_t _CPDNDeliverNotification(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2, a3, 4);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a5, 0);
  if (!a5)
  {
    v12 = 0;
LABEL_6:
    objc_msgSend(CPGetContextForCalloutCurrentMIGServerSource(), "deliverNotification:userInfo:", v10, v12);
    goto LABEL_7;
  }
  v12 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, 0);
  if (!v12)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
LABEL_7:

  return 0;
}

uint64_t _CPDNCheckIn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = +[CPDistributedNotificationCenter centerForServerPort:](CPDistributedNotificationCenter, "centerForServerPort:", a1);
  if ((a2 - 1) <= 0xFFFFFFFD)
    objc_msgSend(v7, "_receivedCheckIn:auditToken:", a2, a3);

  return 0;
}

void *dictionaryWithoutLargestNSData(void *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t *v15;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_opt_class();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v15 = a2;
    v16 = a3;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(a1);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(a1, "objectForKey:", v12, v15, v16);
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (unint64_t)objc_msgSend(v13, "length") >= 0x4000
          && (objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v12;
          v9 = v13;
        }
      }
      v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
    if (v8)
    {
      a1 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1);
      objc_msgSend(a1, "removeObjectForKey:", v8);
    }
    else
    {
      v9 = 0;
    }
    a2 = v15;
    a3 = v16;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  *a2 = v8;
  *a3 = v9;
  return a1;
}

CFDataRef createDataFromVMDeallocateBytes(const UInt8 *a1, void *a2)
{
  const __CFAllocator *v4;
  CFDataRef v5;
  CFAllocatorContext v7;

  v7.version = 0;
  memset(&v7.retain, 0, 40);
  v7.info = a2;
  v7.deallocate = (CFAllocatorDeallocateCallBack)vmDeallocateCallback;
  v7.preferredSize = 0;
  v4 = CFAllocatorCreate(0, &v7);
  v5 = CFDataCreateWithBytesNoCopy(0, a1, (CFIndex)a2, v4);
  CFRelease(v4);
  return v5;
}

uint64_t _CPDMMessage(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, UInt8 *a8, unsigned int a9, uint64_t a10)
{
  return processMessage(a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

uint64_t processMessage(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, UInt8 *DataFromVMDeallocateBytes, unsigned int a8, uint64_t a9, unsigned int a10, unsigned int a11)
{
  _BYTE *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v26;
  void *v27;
  id v29;
  uint64_t v31;

  v18 = CPGetContextForCalloutCurrentMIGServerSource();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
  if ((objc_msgSend(v18, "_isTaskEntitled:", a9) & 1) != 0)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if (DataFromVMDeallocateBytes)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a5, a6, 4);
      DataFromVMDeallocateBytes = (UInt8 *)createDataFromVMDeallocateBytes(DataFromVMDeallocateBytes, (void *)a8);
    }
    else
    {
      v20 = 0;
    }
    if (a4)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
      if (v20)
        v24 = DataFromVMDeallocateBytes == 0;
      else
        v24 = 1;
      v26 = !v24 || a11 != 0;
      v27 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v23, v26, 0, 0);

    }
    else
    {
      v27 = 0;
    }
    v18[84] = a11 != 0;
    v31 = 0;
    v18[85] = 0;
    *((_DWORD *)v18 + 20) = a10;
    if (v19)
    {
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v20 && DataFromVMDeallocateBytes)
          objc_msgSend(v27, "setObject:forKey:", DataFromVMDeallocateBytes, v20);
        if (a11)
          objc_msgSend(v27, "setObject:forKey:", -[CPDistributedMessagingCenter _initClientWithPort:]([CPDistributedMessagingCenter alloc], "_initClientWithPort:", a11), CFSTR("_kCPDistributedMessagingMagicCenterCreationKeyValue"));
        objc_msgSend(v18, "_dispatchMessageNamed:userInfo:reply:auditToken:", v19, v27, &v31, a9);
      }
    }

    if (a10 - 1 > 0xFFFFFFFD || v18[85])
    {
      if (v31)
        NSLog((NSString *)CFSTR("%@ ignoring reply dictionary for a one-way or delayed message named %@."), *((_QWORD *)v18 + 1), v19);
    }
    else
    {
      objc_msgSend(v18, "_sendReplyMessage:portPassing:onMachPort:", v31, v18[84], a10);
    }

    objc_msgSend(v29, "drain");
    return 4294966991;
  }
  else
  {
    v21 = objc_opt_class();
    v22 = objc_msgSend(v18, "_requiredEntitlement");
    if (v19)
    {
      NSLog((NSString *)CFSTR("%@ ignoring message '%@' from client lacking the '%@' entitlement"), v21, v19, v22);

    }
    else
    {
      NSLog((NSString *)CFSTR("%@ ignoring message from client lacking the '%@' entitlement"), v21, v22);
    }
    return 5;
  }
}

uint64_t _CPDMNonBlockingMessage(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, UInt8 *a8, unsigned int a9, uint64_t a10)
{
  return processMessage(a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

uint64_t _CPDMTwoWayMessage(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, UInt8 *a11, unsigned int a12, _QWORD *a13, _DWORD *a14, _QWORD *a15, _DWORD *a16, uint64_t a17)
{
  *a13 = 0;
  *a14 = 0;
  *a15 = 0;
  *a16 = 0;
  return processMessage(a3, a4, a5, a6, a9, a10, a11, a12, a17, a2, 0);
}

uint64_t _CPDMTwoWayMessageWithPortPassing(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned int a11, UInt8 *a12, unsigned int a13, _QWORD *a14, _DWORD *a15, _QWORD *a16, _DWORD *a17, uint64_t a18)
{
  *a14 = 0;
  *a15 = 0;
  *a16 = 0;
  *a17 = 0;
  return processMessage(a4, a5, a6, a7, a10, a11, a12, a13, a18, a2, a3);
}

void vmDeallocateCallback()
{
  JUMPOUT(0x193FF7DD8);
}

uint64_t _NotifyObserver(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, "performSelector:withObject:", a2, a3);
}

void *_RetainReachabilityContextInfo(void *a1)
{
  id v2;

  v2 = a1;
  return a1;
}

uint64_t _ReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(a3, "reachabilityChangedWithFlags:", a2);
  return objc_msgSend(v5, "drain");
}

CPNetworkObserver *_CPNetworkObserverSharedInitialize()
{
  CPNetworkObserver *result;

  result = objc_alloc_init(CPNetworkObserver);
  _CPNetworkObserverShared = (uint64_t)result;
  return result;
}

uint64_t _NetworkReachabilityCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(a3, "_networkReachableCallBack:", a2);
  return objc_msgSend(v5, "drain");
}

uint64_t _WiFiCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_wifiCallBack:", a2);
}

BOOL _WiFiIsSettingEnabled(const __SCPreferences *a1)
{
  const __CFBoolean *Value;
  CFTypeID TypeID;
  _BOOL8 v4;

  Value = (const __CFBoolean *)SCPreferencesGetValue(a1, CFSTR("AllowEnable"));
  if (Value && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(Value)))
    v4 = CFBooleanGetValue(Value) != 0;
  else
    v4 = *MEMORY[0x1E0C9AE50] == (_QWORD)Value;
  SCPreferencesSynchronize(a1);
  return v4;
}

uint64_t CPAggregateDictionaryAddValueForScalarKey(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(+[CPAggregateDictionary sharedAggregateDictionary](CPAggregateDictionary, "sharedAggregateDictionary"), "addValue:forKey:", a2, a1);
}

CPAggregateDictionary *initializeAggregateDictionary()
{
  CPAggregateDictionary *result;
  void *v2;
  size_t v3;
  __int16 v4;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 8;
  result = (CPAggregateDictionary *)sysctlbyname("hw.model", &v4, &v3, 0, 0);
  if (v4 != 14414 || v5 != 50)
  {
    result = (CPAggregateDictionary *)dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 1);
    if (result)
    {
      v2 = result;
      __ADClientCommit = (uint64_t (*)(void))dlsym(result, "ADClientCommit");
      __ADClientSignificantTimeChanged = (uint64_t (*)(void))dlsym(v2, "ADClientSignificantTimeChanged");
      __ADClientClearScalarKey = (uint64_t (*)(_QWORD))dlsym(v2, "ADClientClearScalarKey");
      __ADClientSetValueForScalarKey = (uint64_t (*)(_QWORD, _QWORD))dlsym(v2, "ADClientSetValueForScalarKey");
      __ADClientAddValueForScalarKey = (uint64_t (*)(_QWORD, _QWORD))dlsym(v2, "ADClientAddValueForScalarKey");
      __ADClientClearDistributionKey = (uint64_t (*)(_QWORD))dlsym(v2, "ADClientClearDistributionKey");
      __ADClientSetValueForDistributionKey = (uint64_t (*)(_QWORD, double))dlsym(v2, "ADClientSetValueForDistributionKey");
      __ADClientPushValueForDistributionKey = (uint64_t (*)(_QWORD, double))dlsym(v2, "ADClientPushValueForDistributionKey");
      result = objc_alloc_init(CPAggregateDictionary);
      __aggregateDictionary = (uint64_t)result;
    }
  }
  return result;
}

void sub_18EB26ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPSqliteDatabaseRegisterMatchesSearchStringFunction(uint64_t a1, const char *a2)
{
  return CPSqliteDatabaseRegisterMatchesSearchStringFunctionWithMatchType(a1, a2, 5);
}

uint64_t CPSqliteDatabaseRegisterMatchesSearchStringFunctionWithMatchType(uint64_t a1, const char *a2, int a3)
{
  void *v6;
  void (*v7)(sqlite3_context *, int, sqlite3_value **);
  void (__cdecl *v8)(sqlite3_context *, int, sqlite3_value **);
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    return 1;
  CPSqliteDatabaseConnectionForWriting(a1);
  v6 = *(void **)(*(_QWORD *)(a1 + 8) + 32);
  if (!v6)
    v6 = malloc_type_calloc(1uLL, 0x10uLL, 0xD0040D45F9286uLL);
  v7 = CPSqliteMatchesSearchString;
  if (a3 == 6)
    v7 = CPSqliteMatchesSearchStringByWord;
  if (a3 == 4)
    v8 = (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))CPSqliteMatchesSearchStringExactly;
  else
    v8 = (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))v7;
  v9 = CPSqliteDatabaseRegisterFunction(a1, a2, v8, 2, v6);
  v10 = *(_QWORD *)(a1 + 8);
  if ((_DWORD)v9)
  {
    if (!*(_QWORD *)(v10 + 32))
      free(v6);
  }
  else
  {
    *(_QWORD *)(v10 + 32) = v6;
    *(_QWORD *)(v10 + 40) = SearchStringCacheDestroy;
  }
  return v9;
}

uint64_t CPSqliteDatabaseRegisterMatchesSearchStringByWordFunction(uint64_t a1, const char *a2)
{
  return CPSqliteDatabaseRegisterMatchesSearchStringFunctionWithMatchType(a1, a2, 6);
}

uint64_t CPSqliteDatabaseRegisterMatchesExactSearchStringFunction(uint64_t a1, const char *a2)
{
  return CPSqliteDatabaseRegisterMatchesSearchStringFunctionWithMatchType(a1, a2, 4);
}

void CPSqliteMatchesSearchStringExactly(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  CPSqliteMatchesSearchStringWithMatchType(a1, a2, a3, 4);
}

void CPSqliteMatchesSearchStringByWord(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  CPSqliteMatchesSearchStringWithMatchType(a1, a2, a3, 6);
}

void CPSqliteMatchesSearchString(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  CPSqliteMatchesSearchStringWithMatchType(a1, a2, a3, 5);
}

void SearchStringCacheDestroy(id *a1)
{
  id v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);

    free(a1);
  }
}

void CPSqliteMatchesSearchStringWithMatchType(sqlite3_context *a1, int a2, sqlite3_value **a3, uint64_t a4)
{
  const unsigned __int8 *v7;
  id *v8;
  id v9;
  void *v10;
  const unsigned __int8 *v11;
  int v12;

  if (a2 != 2)
  {
    sqlite3_result_error(a1, "CPSqliteMatchesSearchString: wrong number of arguments", -1);
    return;
  }
  v7 = sqlite3_value_text(*a3);
  v8 = (id *)sqlite3_user_data(a1);
  v9 = *v8;
  if (!*v8)
    goto LABEL_5;
  if (strcmp((const char *)v7, (const char *)v9))
  {
    free(v9);

LABEL_5:
    *v8 = strdup((const char *)v7);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v7);
    v8[1] = -[CPSearchMatcher initWithSearchString:]([CPSearchMatcher alloc], "initWithSearchString:", v10);

  }
  v11 = sqlite3_value_text(a3[1]);
  if (v11)
    v12 = objc_msgSend(v8[1], "matchesUTF8String:matchType:matchOptions:", v11, a4, (_DWORD)a4 != 6);
  else
    v12 = 0;
  sqlite3_result_int(a1, v12);
}

uint64_t matche(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  unsigned __int8 v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned __int8 *v18;
  unint64_t v19;
  char v20;
  _BOOL4 v21;
  unsigned __int8 *v22;
  char v23;
  int v24;
  int v25;
  unint64_t v26;
  unsigned __int8 *v27;
  BOOL v28;
  int v29;
  _BOOL4 v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  unsigned int v44;
  unint64_t v45;
  int v46;
  int v47;
  unsigned int v48;
  int v49;
  int v50;
  unsigned __int8 *v51;
  unsigned __int8 *v52;
  BOOL v53;
  uint64_t v54;
  int64_t v55;
  int v56;
  unsigned __int8 *v57;
  unsigned __int8 *i;
  unsigned int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  unint64_t v63;
  unsigned int v64;
  int v65;
  uint64_t v67;
  int v68;
  int v69;
  unsigned int v70;
  int v71;
  uint64_t v72;
  unsigned __int8 *v73;
  unsigned __int8 *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  __int16 *v82;
  int v83;
  unsigned int v84;
  int v86;
  unsigned int v87;
  BOOL v91;
  BOOL v95;
  uint64_t v96;
  int v97;
  int v98;
  uint64_t v99;
  int v100;
  int v101;
  unint64_t v102;
  uint64_t v103;
  unsigned __int8 *v104;
  _BOOL8 v105;
  uint64_t v106;
  unint64_t v107;
  int v108;
  unsigned __int8 *v109;
  BOOL v110;
  int v111;
  uint64_t result;
  _QWORD *v113;
  int v114;
  unsigned int v115;
  unint64_t v116;
  unint64_t v117;
  unsigned __int8 *char_start;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unsigned int v123;
  uint64_t v124;
  char *v125;
  char v126;
  unsigned int v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  unsigned int v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  char v135;
  unsigned int v136;
  unsigned int v138;
  unsigned __int8 *v139;
  unsigned __int8 *v140;
  int v141;
  unint64_t v142;
  uint64_t v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char v148;
  unsigned __int8 *v151;
  _BYTE *v153;
  _QWORD *v154;
  int v155;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unsigned __int8 *v160;
  uint64_t v161;
  uint64_t v162;
  unsigned __int8 *v163;
  int v164;
  int v165;
  unsigned __int8 *v166;
  uint64_t v167;
  int v168;
  _WORD v169[5];

  v7 = a3;
  v8 = (unint64_t)a2;
  v9 = a1;
  v168 = 0;
  v167 = 0;
  LODWORD(v10) = *a1;
  if (!*a1)
  {
    v155 = 0;
    v166 = 0;
    LOWORD(v16) = 0;
    LOWORD(v17) = 0;
    v18 = a2;
    goto LABEL_402;
  }
  v11 = 0;
  v12 = 0;
  v155 = 0;
  v164 = 0;
  v165 = 0;
  v157 = 0;
  v13 = 0;
  v160 = 0;
  v151 = 0;
  v166 = 0;
  v14 = 0;
  v15 = 0;
  LOWORD(v16) = 0;
  LOWORD(v17) = 0;
  v18 = a2;
  v154 = a5;
  while (1)
  {
    v19 = *v18;
    if (!*v18)
      goto LABEL_395;
    v158 = v13;
    v20 = v10 - 34;
    v21 = (v10 - 34) < 0x3Fu;
    if (*(_BYTE *)(v8 + v12))
    {
      ++v12;
    }
    else
    {
      if (v11 > 2 * v12)
        return 0;
      ++v11;
    }
    v161 = v12;
    v162 = v11;
    if (v10 == 92)
    {
      ++v157;
      v22 = v9 + 1;
      LOBYTE(v10) = v9[1];
      v151 = v9;
    }
    else if (v10 == 42)
    {
      v22 = v9 + 1;
      while (v10 == 42)
      {
        v23 = *v22++;
        LOBYTE(v10) = v23;
      }
      if (!(_BYTE)v10)
      {
        if (v19 < 0xC0)
        {
          if (!a5)
            return 1;
          goto LABEL_380;
        }
        v107 = utf8_byte_length_noerror_utf8_len_table[v19 >> 4];
        v169[0] = v16;
        v108 = utf8_decodestr(v18, v107, v169, &v167, 2, &v168, 0);
        LOWORD(v16) = v169[0];
        if (v108)
        {
          v9 = v22 - 1;
          v155 = 1;
          goto LABEL_395;
        }
        if (v169[0] - 12441 >= 2)
        {
          v110 = (v7 & 2) != 0 || v169[0] - 768 >= 0x70;
          v111 = !v110;
          result = v111 ^ 1u;
          if (!v110 || !a5)
            return result;
LABEL_380:
          v109 = v166;
          *a5 = &v166[-v8];
LABEL_489:
          *a6 = v18 - v109;
          return 1;
        }
        return 0;
      }
      if (v10 == 92)
      {
        if (*v22 != (_DWORD)v19)
        {
          v158 = 0;
          LOBYTE(v10) = 92;
          v160 = --v22;
          goto LABEL_32;
        }
        LOBYTE(v10) = *v18;
      }
      else
      {
        v158 = 0;
        v160 = --v22;
      }
    }
    else
    {
      v22 = v9;
    }
    if (v10 >= 0xC0u)
    {
      if ((v10 + 29) < 0xCu)
      {
        v165 = 1;
LABEL_30:
        v15 = v22;
        goto LABEL_37;
      }
      if (v10 == 239)
      {
        if (v22[1] < 0xACu)
        {
          v165 = 1;
          LOBYTE(v10) = -17;
          goto LABEL_30;
        }
      }
      else if (v10 == 226 && v22[1] > 0xB9u)
      {
        v165 = 1;
        LOBYTE(v10) = -30;
        goto LABEL_30;
      }
      v165 = 0;
      goto LABEL_30;
    }
LABEL_32:
    if ((v10 & 0x80u) == 0)
      v15 = 0;
    v24 = v165;
    if ((v10 & 0x80u) == 0)
      v24 = 0;
    v165 = v24;
LABEL_37:
    if (v19 >= 0xC0)
    {
      if ((v19 + 29) < 0xCu)
      {
LABEL_39:
        v164 = 1;
LABEL_51:
        v14 = v18;
        goto LABEL_52;
      }
      if ((_DWORD)v19 == 239)
      {
        if (v18[1] < 0xACu)
          goto LABEL_39;
      }
      else if ((_DWORD)v19 == 226 && v18[1] > 0xB9u)
      {
        goto LABEL_39;
      }
      v164 = 0;
      goto LABEL_51;
    }
    if ((v19 & 0x80u) == 0)
      v14 = 0;
    v25 = v164;
    if ((v19 & 0x80u) == 0)
      v25 = 0;
    v164 = v25;
LABEL_52:
    if ((_DWORD)v19 != v10)
      break;
    LOWORD(v17) = 0;
    LOWORD(v16) = 0;
    LODWORD(v26) = 0;
    v27 = v166;
    if (v166)
      v28 = 1;
    else
      v28 = a5 == 0;
    if (!v28)
      v27 = v18;
    v166 = v27;
    v13 = 1;
LABEL_147:
    v10 = &v14[(int)v26] - v18;
    if ((_DWORD)v26)
      v14 = 0;
    else
      v10 = 1;
    if (v13 && v160 && !v22[v13])
    {
      v54 = v18[v10];
      if ((v7 & 4) != 0)
      {
        if ((v54 & 0x80) == 0 && separator_map[v54])
          goto LABEL_288;
      }
      else if (v54 <= 1)
      {
        goto LABEL_288;
      }
      v13 = 0;
      v157 = 0;
      v22 = v160;
    }
LABEL_288:
    v9 = &v22[v13];
    v18 += v10;
    LOBYTE(v10) = v22[v13];
    v12 = v161;
    v11 = v162;
    if (!(_BYTE)v10)
      goto LABEL_395;
  }
  v17 = 0;
  v16 = 0u;
  v159 = 0;
  LODWORD(v26) = 0;
  v29 = v21 & (0x4000000000000021uLL >> v20);
  v30 = ((unint64_t)v15 | (unint64_t)v14) == 0;
  if ((unint64_t)v15 | (unint64_t)v14)
    v29 = 1;
  v31 = v29 ^ 1;
  if (v165)
    v31 = 1;
  if (v164)
    v32 = 0;
  else
    v32 = v7 & (v165 == 0);
  v153 = v22 + 1;
  if (v164)
    v33 = 1;
  else
    v33 = v31;
  v163 = v15;
  while (2)
  {
    if (v32)
    {
      if (v30)
      {
        v34 = tolower_map[*v22];
        v35 = *v18;
        if (v34 == tolower_map[v35])
          goto LABEL_138;
        if (v22 == v160 && v35 >= 2)
        {
          v36 = v18 + 1;
          while (((char)*v36 & 0x80000000) == 0)
          {
            v37 = *v36;
            if (v37 < 2)
            {
              v15 = 0;
              v14 = 0;
              v8 = (unint64_t)a2;
              v7 = a3;
              a5 = v154;
LABEL_132:
              v13 = v158;
              goto LABEL_133;
            }
            ++v36;
            if (v34 == tolower_map[v37])
            {
              v18 = v36 - 1;
              v22 = v160;
              goto LABEL_138;
            }
          }
          v18 = v36;
        }
        goto LABEL_102;
      }
      if (v17)
      {
LABEL_83:
        if (!v16)
          goto LABEL_84;
      }
      else
      {
        if (v15)
        {
          v38 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v15 >> 4];
          v169[0] = 0;
          v159 = v38;
          v39 = utf8_decodestr(v15, v38, v169, &v167, 2, &v168, 0);
          v17 = v169[0];
          if (v39)
            goto LABEL_393;
          goto LABEL_83;
        }
        v17 = *v22;
        if (!v16)
        {
LABEL_84:
          if (v14)
          {
            v26 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v14 >> 4];
            v169[0] = 0;
            v40 = utf8_decodestr(v14, v26, v169, &v167, 2, &v168, 0);
            v16 = v169[0];
            if (v40)
            {
LABEL_393:
              v155 = 1;
              goto LABEL_394;
            }
          }
          else
          {
            v16 = *v18;
          }
        }
      }
      v41 = map_case((unsigned __int16)v16);
      if (v17 == v41)
        goto LABEL_330;
      v42 = v41;
      v43 = map_case((unsigned __int16)v17);
      if (v43 == v42)
        goto LABEL_330;
      v15 = v163;
      if (v16 == v43)
        goto LABEL_138;
      if (v17 == 223)
      {
        if (v16 != 115)
        {
LABEL_98:
          v17 = 223;
          goto LABEL_102;
        }
        if (v18[1] != 115)
        {
          v16 = 0x73u;
          goto LABEL_98;
        }
        ++v18;
        LOWORD(v16) = 115;
        LOWORD(v17) = 223;
      }
      else
      {
        if (v17 != 115)
          goto LABEL_102;
        if (v16 != 223)
          goto LABEL_102;
        v17 = 115;
        if (*v153 != 115)
          goto LABEL_102;
        ++v22;
      }
LABEL_138:
      v8 = (unint64_t)a2;
      v7 = a3;
      a5 = v154;
      goto LABEL_139;
    }
LABEL_102:
    if (v33)
    {
      if (v160)
      {
        v13 = 0;
        v8 = (unint64_t)a2;
        v55 = &v160[v157] - v22;
        if (v22 <= v160)
          v55 = 0;
        v18 += v55;
        v22 = v160;
        v157 = 0;
        v7 = a3;
        a5 = v154;
        goto LABEL_147;
      }
      a5 = v154;
      v57 = v166;
      if (v154)
        v57 = 0;
      v166 = v57;
      v8 = (unint64_t)a2;
      v7 = a3;
      if ((a3 & 4) == 0)
        goto LABEL_494;
LABEL_178:
      if ((v7 & 8) == 0)
      {
        if (*a1 - 48 < 0xA && *v18 - 48 <= 9)
        {
          i = v18;
          do
          {
            v60 = *++i;
            v59 = v60;
          }
          while (v60 - 48 < 0xA);
          v61 = 0;
          goto LABEL_260;
        }
        v62 = -1;
        for (i = v18; ; i += v67)
        {
          v63 = *i;
          v64 = *i;
          if ((char)*i < 0)
          {
            if (v64 != 239)
            {
              if (v64 == 227 && i[1] == 128 && i[2] == 128)
              {
                v61 = 0;
                goto LABEL_259;
              }
LABEL_210:
              i += utf8_byte_length_noerror_utf8_len_table[v63 >> 4];
              v61 = 1;
              goto LABEL_259;
            }
            v68 = i[1];
            if (v68 != 188 && (v68 != 189 || i[2] > 0x9Fu))
              goto LABEL_210;
            v169[0] = v16;
            v69 = utf8_decodestr(i, 3uLL, v169, &v167, 2, &v168, 0);
            LOWORD(v16) = v169[0];
            if (v69)
            {
              v61 = 0;
              v155 = 1;
LABEL_259:
              v59 = *i;
              a5 = v154;
LABEL_260:
              if (v59 < 2 || v61 != 0)
              {
                v15 = 0;
                v14 = 0;
                v13 = 0;
                v10 = 0;
                v22 = a1;
                v18 = i;
                goto LABEL_288;
              }
              if (v59 == 227)
              {
                v15 = 0;
                v14 = 0;
                v13 = 0;
                v10 = 0;
                v18 = i + 3;
                v22 = a1;
                goto LABEL_288;
              }
              v86 = *a1;
              if (v59 == v86 && v86 != 92)
                goto LABEL_276;
              if (v86 == 92)
              {
                if (v59 != a1[1])
                {
                  v15 = 0;
                  v14 = 0;
                  v13 = 0;
                  v22 = a1;
                  v18 = i;
                  goto LABEL_287;
                }
LABEL_276:
                v87 = ((_DWORD)v22 - (v157 + (_DWORD)a1)) & ~(((int)v22 - ((int)v157 + (int)a1)) >> 31);
                if (v87 >= 2)
                  v18 = &i[-v87 + 1];
                else
                  v18 = i;
                v15 = 0;
                v14 = 0;
                v10 = 0;
                v22 = a1;
                v13 = 0;
              }
              else
              {
                v15 = 0;
                if (i != v18 && (char)v86 < 0)
                  goto LABEL_276;
                v22 = a1;
                v18 = i;
                v14 = 0;
                v13 = 0;
LABEL_287:
                v10 = 1;
              }
              goto LABEL_288;
            }
            v16 = v169[0] - 65248;
            if (((LOBYTE(v169[0]) + 32) & 0x80) != 0)
            {
              v67 = 3;
            }
            else
            {
              if (separator_map[(LOBYTE(v169[0]) + 32)])
                goto LABEL_205;
              v67 = 3;
            }
          }
          else
          {
            v65 = separator_map[v63];
            if (v64 < 2 || v65 != 0)
            {
LABEL_205:
              v61 = 0;
              goto LABEL_259;
            }
            v16 = *i;
            v67 = 1;
          }
          v70 = v16 - 97;
          if (v62 <= 1 && v70 > 0x19)
          {
            v61 = 1;
            goto LABEL_259;
          }
          v62 = v70 < 0x1A;
        }
      }
      goto LABEL_494;
    }
    if (v17)
    {
      v44 = v17;
      if (!v16)
        goto LABEL_111;
    }
    else if (v15)
    {
      v45 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v15 >> 4];
      v169[0] = 0;
      v159 = v45;
      v46 = utf8_decodestr(v15, v45, v169, &v167, 2, &v168, 0);
      v44 = v169[0];
      if (v46)
        goto LABEL_381;
      v15 = v163;
      if (!v16)
        goto LABEL_111;
    }
    else
    {
      v44 = *v22;
      if (!v16)
      {
LABEL_111:
        if (v14)
        {
          v26 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v14 >> 4];
          v169[0] = 0;
          v47 = utf8_decodestr(v14, v26, v169, &v167, 2, &v168, 0);
          v16 = v169[0];
          if (v47)
          {
LABEL_381:
            v155 = 1;
            LOWORD(v17) = v44;
LABEL_394:
            v9 = v22;
            v8 = (unint64_t)a2;
            v7 = a3;
            a5 = v154;
            goto LABEL_395;
          }
          v15 = v163;
        }
        else
        {
          v16 = *v18;
        }
      }
    }
    v48 = v44 - 65281;
    if (v44 == 12288)
      v49 = 32;
    else
      v49 = v44;
    if (v48 >= 0x5E)
      v17 = v49;
    else
      v17 = v44 - 65248;
    if (v16 - 65281 <= 0x5D)
    {
      v50 = v16 - 65248;
LABEL_129:
      v16 = v50;
      if (v17 != v50)
        continue;
      LOWORD(v16) = v17;
      goto LABEL_138;
    }
    break;
  }
  if (v16 == 12288)
    v50 = 32;
  else
    v50 = v16;
  if (v16 == 12288 || v44 == 12288 || v48 <= 0x5D)
    goto LABEL_129;
  if ((v17 | 0x20) == 0xF8)
  {
    v8 = (unint64_t)a2;
    v7 = a3;
    a5 = v154;
    if ((v16 & 0xFFFFFFDF) == 0x4F)
    {
      if ((a3 & 1) != 0)
      {
        if (v17 == 216)
          v17 = 248;
        v16 = tolower_map[v16];
      }
      v56 = v18[1];
      if (v56 == 101 || v56 == 204 && v18[2] == 136)
      {
        if (v56 == 101)
          ++v18;
        goto LABEL_139;
      }
    }
  }
  else
  {
    v8 = (unint64_t)a2;
    v7 = a3;
    a5 = v154;
  }
  if ((v16 | 0x20) == 0xF8 && (v17 & 0xFFFFFFDF) == 0x4F)
  {
    if ((v7 & 1) != 0)
    {
      if (v16 == 216)
        v16 = 248;
      v17 = tolower_map[v17];
    }
    v71 = *v153;
    if (v71 == 101 || v71 == 204 && v22[2] == 136)
    {
      if (v71 == 101)
        ++v22;
      goto LABEL_139;
    }
  }
  v72 = 0;
  v73 = v18 + 1;
  v74 = v18 + 2;
  while (2)
  {
    v75 = (unsigned __int16)ligatures[v72];
    if (v17 != v75)
      goto LABEL_241;
    v76 = LOBYTE(ligatures[v72 + 1]);
    if ((v7 & 1) == 0)
    {
      if (v16 == (_DWORD)v76)
      {
        v79 = *v73;
        if (v79 == HIBYTE(ligatures[v72 + 1]))
          goto LABEL_273;
        if (v79 == 204 && LOBYTE(ligatures[v72 + 2]) && *v74 == 136)
          goto LABEL_291;
      }
LABEL_241:
      if (v16 != v75)
        goto LABEL_254;
      LODWORD(v76) = LOBYTE(ligatures[v72 + 1]);
      if ((v7 & 1) != 0)
      {
LABEL_243:
        if (v17 != (_DWORD)v76 && tolower_map[v17] != tolower_map[v76])
          goto LABEL_254;
        v80 = *v153;
        v81 = HIBYTE(ligatures[v72 + 1]);
        if ((_DWORD)v80 == (_DWORD)v81 || tolower_map[v80] == tolower_map[v81])
        {
LABEL_272:
          ++v22;
          goto LABEL_139;
        }
        if ((_DWORD)v80 != 204)
          goto LABEL_254;
        v82 = &ligatures[v72];
      }
      else
      {
        if (v17 != (_DWORD)v76)
          goto LABEL_254;
        v83 = *v153;
        v82 = &ligatures[v72];
        if (v83 == HIBYTE(ligatures[v72 + 1]))
          goto LABEL_272;
        if (v83 != 204)
          goto LABEL_254;
      }
      if (*((_BYTE *)v82 + 4) && v22[2] == 136)
      {
        v22 += 2;
        goto LABEL_139;
      }
      goto LABEL_254;
    }
    if (v16 == (_DWORD)v76 || tolower_map[v16] == tolower_map[v76])
    {
      v77 = *v73;
      v78 = HIBYTE(ligatures[v72 + 1]);
      if ((_DWORD)v77 == (_DWORD)v78 || tolower_map[v77] == tolower_map[v78])
      {
LABEL_273:
        ++v18;
        goto LABEL_139;
      }
      if ((_DWORD)v77 == 204 && LOBYTE(ligatures[v72 + 2]) && *v74 == 136)
      {
LABEL_291:
        v18 += 2;
        goto LABEL_139;
      }
    }
    if (v16 == v17)
      goto LABEL_243;
LABEL_254:
    v72 += 3;
    if (v72 != 18)
      continue;
    break;
  }
  if ((v7 & 2) == 0)
    goto LABEL_132;
  v13 = v158;
  if (v17 != 778)
  {
    if (v16 == 778)
    {
      v84 = v17 & 0xFFFFFFDF;
      goto LABEL_284;
    }
    if (v17 - 8220 <= 0x17 && ((1 << (v17 - 28)) & 0x80000B) != 0)
    {
      if (v16 != 34)
        goto LABEL_133;
LABEL_139:
      v52 = v166;
      if (v166)
        v53 = 1;
      else
        v53 = a5 == 0;
      if (!v53)
        v52 = v18;
      v166 = v52;
      if (v159)
        v13 = &v15[v159] - v22;
      else
        v13 = 1;
      goto LABEL_147;
    }
    v91 = v17 == 8219 || v17 >> 1 == 4108 || v17 == 8242 || v17 == 96;
    if (v16 == 39 && v91)
    {
      LOWORD(v16) = 39;
      goto LABEL_139;
    }
    if (v16 - 8220 <= 0x17 && ((1 << (v16 - 28)) & 0x80000B) != 0)
    {
      if (v17 != 34)
        goto LABEL_133;
      goto LABEL_139;
    }
    v95 = v16 == 8219 || v16 >> 1 == 4108 || v16 == 8242 || v16 == 96;
    if (v17 == 39 && v95)
    {
      LOWORD(v17) = 39;
LABEL_330:
      v8 = (unint64_t)a2;
      v7 = a3;
      a5 = v154;
      v15 = v163;
      goto LABEL_139;
    }
    if (v17 == 776 && v18 > a2)
    {
      v96 = *(v18 - 1);
      v97 = tolower_map[v96];
      if ((v97 - 97) > 0x14 || ((1 << (v97 - 97)) & 0x104001) == 0)
        goto LABEL_355;
      v98 = tolower_map[*v18];
      if (v98 == 101)
      {
        if ((a3 & 1) != 0 || *(v22 - 1) == (_DWORD)v96)
        {
          LOWORD(v17) = 776;
          goto LABEL_330;
        }
LABEL_355:
        if (unicode_combinable((unsigned __int16)v17))
        {
          if (v160)
            v102 = v159;
          else
            v102 = 0;
          v157 += v102;
          v103 = &v163[v159] - v22;
          v163 = 0;
LABEL_361:
          if (v16 >= 0x80 && unicode_combinable((unsigned __int16)v16))
          {
            v104 = &v14[v26];
            v14 = 0;
            v10 = v104 - v18;
          }
          else
          {
            v10 = 0;
          }
          if (v103)
          {
            v165 = 0;
            v164 = 0;
            v8 = (unint64_t)a2;
            v7 = a3;
            a5 = v154;
            v15 = v163;
            v13 = v103;
            goto LABEL_288;
          }
          if (v10)
          {
            if (v157)
            {
              v165 = 0;
              v164 = 0;
              v105 = v22 - 1 == v151;
              if (v22 - 1 == v151)
                --v22;
              v106 = v157 - v105;
              v13 = 0;
              v157 = v106;
            }
            else
            {
              v13 = 0;
              v157 = 0;
              v165 = 0;
              v164 = 0;
            }
            v8 = (unint64_t)a2;
            v7 = a3;
            a5 = v154;
            v15 = v163;
            goto LABEL_288;
          }
          v13 = 0;
          v8 = (unint64_t)a2;
          v7 = a3;
          a5 = v154;
          v15 = v163;
          goto LABEL_133;
        }
LABEL_360:
        v103 = 0;
        goto LABEL_361;
      }
      if (v97 != 97 || v98 != 97)
        goto LABEL_355;
      LOWORD(v17) = 776;
LABEL_353:
      v8 = (unint64_t)a2;
      v7 = a3;
      a5 = v154;
      v15 = v163;
      goto LABEL_132;
    }
    if (v22 > a1 && v16 == 776)
    {
      v99 = *(v22 - 1);
      v100 = tolower_map[v99];
      if ((v100 - 97) <= 0x14 && ((1 << (v100 - 97)) & 0x104001) != 0)
      {
        v101 = tolower_map[*v22];
        if (v101 == 101)
        {
          if ((a3 & 1) != 0 || (_DWORD)v99 == *(v18 - 1))
          {
            LOWORD(v16) = 776;
            goto LABEL_330;
          }
        }
        else if (v100 == 97 && v101 == 97)
        {
          LOWORD(v16) = 776;
          goto LABEL_353;
        }
      }
    }
    if (v17 < 0x80)
      goto LABEL_360;
    goto LABEL_355;
  }
  v84 = v16 & 0xFFFFFFDF;
LABEL_284:
  if (v84 == 65)
    goto LABEL_139;
LABEL_133:
  v51 = v166;
  if (a5)
    v51 = 0;
  v166 = v51;
  if ((v7 & 4) != 0)
    goto LABEL_178;
  if (v160)
  {
    v157 = 0;
    v22 = v160;
    goto LABEL_147;
  }
LABEL_494:
  v9 = v22;
LABEL_395:
  LODWORD(v10) = *v9;
  if ((unint64_t)v18 > v8 && (v7 & 4) != 0 && !*v9)
  {
    v113 = a5;
    v114 = 0;
    if (((char)*(v18 - 1) & 0x80000000) == 0 && *(v18 - 1) - 58 <= 0xFFFFFFF5)
      v114 = separator_map[*(v18 - 1)];
    v115 = *v18;
    goto LABEL_405;
  }
LABEL_402:
  v113 = a5;
  v115 = *v18;
  v114 = 0;
  if ((_DWORD)v10)
  {
    if ((v115 & 0x80) != 0)
      goto LABEL_424;
  }
  else
  {
LABEL_405:
    if ((v7 & 2) != 0 && v115 >= 0xC0)
    {
      while (1)
      {
        v116 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v18 >> 4];
        v169[0] = v16;
        if (utf8_decodestr(v18, v116, v169, &v167, 2, &v168, 0))
          break;
        LOWORD(v16) = v169[0];
        v18 += v116;
        if (!unicode_combinable(v169[0]))
          goto LABEL_411;
      }
      v116 = 0;
      v155 = 1;
LABEL_411:
      v18 -= v116;
      v115 = *v18;
      v8 = (unint64_t)a2;
    }
  }
  if (v115 >= 2 && ((v115 & 0x80) != 0 || (v7 & 4) == 0 || !separator_map[v115]) || (v7 & 2) == 0 || *v9 < 0xC0u)
  {
LABEL_424:
    if (v155)
      goto LABEL_425;
    v128 = *v18;
    if (v128 >= 2)
    {
      if (v114)
      {
        if ((v7 & 4) == 0)
          goto LABEL_425;
      }
      else if ((v128 & 0x80) != 0 || (v128 - 58) > 0xFFFFFFF5)
      {
        if ((_DWORD)v128 != 227 || v18[1] != 128 || (v7 & 4) == 0 || v18[2] != 128)
          goto LABEL_425;
      }
      else if ((v7 & 4) == 0 || !separator_map[v128])
      {
        goto LABEL_425;
      }
    }
    if (*v9 && (*v9 != 42 || v9[1]))
      goto LABEL_425;
    if (!v113)
      return 1;
    v109 = v166;
    *v113 = &v166[-v8];
    goto LABEL_489;
  }
  v117 = 0;
  while (1)
  {
    v9 += v117;
    if (!*v9)
    {
LABEL_423:
      v8 = (unint64_t)a2;
      goto LABEL_424;
    }
    v117 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v9 >> 4];
    v169[0] = v17;
    if (utf8_decodestr(v9, v117, v169, &v167, 2, &v168, 0))
      break;
    LOWORD(v17) = v169[0];
    if (v169[0] - 12441 < 2 || !unicode_combinable(v169[0]))
      goto LABEL_423;
  }
  v8 = (unint64_t)a2;
LABEL_425:
  result = 0;
  if (v18 == (unsigned __int8 *)v8 || (v7 & 4) == 0 || *v9)
    return result;
  char_start = (unsigned __int8 *)utf8_prev_char_start(v8, (unint64_t)v18);
  v119 = (unint64_t)char_start;
  v120 = *char_start;
  v121 = v120 >> 4;
  v122 = utf8_byte_length_utf8_len_table[v120 >> 4];
  v123 = v120 & utf8_to_code_point_utf8_first_char_mask[v122];
  if ((~(_BYTE)v121 & 0xC) != 0)
  {
    v127 = v123;
  }
  else
  {
    v122 = v122 <= 2 ? 2 : v122;
    v124 = v122 - 1;
    v125 = (char *)(char_start + 1);
    do
    {
      v126 = *v125++;
      v127 = v126 & 0x3F | (v123 << 6);
      v123 = v127;
      --v124;
    }
    while (v124);
  }
  v129 = *v18;
  v130 = utf8_byte_length_utf8_len_table[v129 >> 4];
  v131 = v129 & utf8_to_code_point_utf8_first_char_mask[v130];
  if ((~(v129 >> 4) & 0xC) != 0)
  {
    v136 = v129 & utf8_to_code_point_utf8_first_char_mask[v130];
  }
  else
  {
    v132 = v130 <= 2 ? 2 : utf8_byte_length_utf8_len_table[v129 >> 4];
    v133 = v132 - 1;
    v134 = (char *)(v18 + 1);
    do
    {
      v135 = *v134++;
      v136 = v135 & 0x3F | (v131 << 6);
      v131 = v136;
      --v133;
    }
    while (v133);
  }
  result = 0;
  if (v136 > 0xFFFE)
    return result;
  if (v136 - 880 > 0xFFFFFF8F || v127 > 0xFFFE)
    return result;
  v138 = v136 - 48;
  if (v127 - 48 > 9)
  {
    if (v138 < 0xA)
      return 1;
    if (v127 - 123 >= 0xFFFFFFE6)
    {
      if (v136 > 0x7F)
        result = __maskrune(v136, 0x8000uLL);
      else
        result = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v136 + 60) & 0x8000;
      if ((_DWORD)result)
        return 1;
      return result;
    }
    result = 0;
    if (v127 - 91 < 0xFFFFFFE6 || v136 - 91 < 0xFFFFFFE6)
      return result;
    v139 = (unsigned __int8 *)utf8_prev_char_start(v8, v119);
    if (utf8_to_code_point(v139) - 91 >= 0xFFFFFFE6)
    {
      v140 = &v18[v130];
      v141 = utf8_to_code_point(v140);
      if ((v141 - 880) >= 0xFFFFFF90)
      {
        LOBYTE(v142) = *v140;
        do
        {
          v140 += utf8_byte_length_utf8_len_table[v142 >> 4];
          v142 = *v140;
          v143 = utf8_byte_length_utf8_len_table[v142 >> 4];
          v144 = utf8_to_code_point_utf8_first_char_mask[v143] & v142;
          if ((~(v142 >> 4) & 0xC) != 0)
          {
            v141 = utf8_to_code_point_utf8_first_char_mask[v143] & v142;
          }
          else
          {
            if (v143 <= 2)
              v145 = 2;
            else
              v145 = utf8_byte_length_utf8_len_table[v142 >> 4];
            v146 = v145 - 1;
            v147 = (char *)(v140 + 1);
            do
            {
              v148 = *v147++;
              v141 = v148 & 0x3F | (v144 << 6);
              v144 = v141;
              --v146;
            }
            while (v146);
          }
        }
        while ((v141 - 880) > 0xFFFFFF8F);
      }
      if ((v141 - 91) <= 0xFFFFFFE5)
        return 1;
    }
    return 0;
  }
  return v138 >= 0xA;
}

unint64_t utf8_prev_char_start(unint64_t a1, unint64_t a2)
{
  char v2;
  unsigned int v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  int v10;

  do
  {
    if (a2 <= a1)
      break;
    do
    {
      v3 = *(unsigned __int8 *)--a2;
      v2 = v3;
      v4 = (unint64_t)v3 >> 4;
      v5 = v4 & 0xC;
    }
    while (v5 == 8);
    v6 = utf8_byte_length_utf8_len_table[v4];
    v7 = (utf8_to_code_point_utf8_first_char_mask[v6] & v2);
    if (v5 == 12)
    {
      v8 = v6 <= 2 ? 2 : v6;
      for (i = 1; i != v8; ++i)
      {
        v10 = *(_BYTE *)(a2 + i) & 0x3F | (v7 << 6);
        v7 = v10;
      }
    }
    else
    {
      v10 = v7;
    }
  }
  while ((v10 - 880) > 0xFFFFFF8F);
  return a2;
}

unint64_t utf8_to_code_point(unsigned __int8 *a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  unint64_t result;

  v1 = *a1;
  v2 = v1 >> 4;
  v3 = utf8_byte_length_utf8_len_table[v1 >> 4];
  v4 = v1 & utf8_to_code_point_utf8_first_char_mask[v3];
  if ((~(_BYTE)v2 & 0xC) != 0)
    return v4;
  if (v3 <= 2)
    v5 = 2;
  else
    v5 = v3;
  v6 = (char *)(a1 + 1);
  v7 = v5 - 1;
  do
  {
    v8 = *v6++;
    result = v8 & 0x3Fu | ((_DWORD)v4 << 6);
    LODWORD(v4) = v8 & 0x3F | ((_DWORD)v4 << 6);
    --v7;
  }
  while (v7);
  return result;
}

uint64_t unicode_combinable(unsigned int a1)
{
  int v1;

  if (a1 < 0x300)
    return 0;
  v1 = __CFUniCharCombiningBitmap[(unint64_t)a1 >> 8];
  if (!__CFUniCharCombiningBitmap[(unint64_t)a1 >> 8])
    return 0;
  if (v1 == 255)
    return 1;
  return (__CFUniCharCombiningBitmap[(a1 >> 3) + 256 + 32 * v1 - 32] >> (a1 & 7)) & 1;
}

uint64_t unicode_decomposeable(unsigned int a1)
{
  int v1;

  if (a1 < 0xC0)
    return 0;
  v1 = __CFUniCharDecomposableBitmap[(unint64_t)a1 >> 8];
  if (!__CFUniCharDecomposableBitmap[(unint64_t)a1 >> 8])
    return 0;
  if (v1 == 255)
    return 1;
  return (__CFUniCharDecomposableBitmap[(a1 >> 3) + 256 + 32 * v1 - 32] >> (a1 & 7)) & 1;
}

uint64_t utf8_encodelen(unsigned __int16 *a1, unint64_t a2, int a3, char a4)
{
  uint64_t result;
  unint64_t v6;
  __int16 v7;
  unsigned __int16 v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;

  if (a2 < 2)
    return 0;
  result = 0;
  v6 = a2 >> 1;
  if (a3)
    v7 = a3;
  else
    v7 = 95;
  do
  {
    v9 = *a1++;
    v8 = v9;
    v10 = bswap32(v9) >> 16;
    if ((a4 & 1) != 0)
      v8 = v10;
    v11 = v8;
    if (!v8)
      v8 = 9216;
    if (v11 == 47)
      v8 = v7;
    if (v8 >= 0x80u)
    {
      if (v8 >= 0x800u)
      {
        if (v8 >> 11 == 27)
          v12 = 2;
        else
          v12 = 3;
      }
      else
      {
        v12 = 2;
      }
    }
    else
    {
      v12 = 1;
    }
    result += v12;
    --v6;
  }
  while (v6);
  return result;
}

uint64_t utf8_encodestr(unsigned __int16 *a1, unint64_t a2, _BYTE *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  _BYTE *v8;
  int v10;
  unsigned __int16 *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  int v19;
  _QWORD *v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int16 v25;
  __int16 v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned __int16 v31;
  _BYTE v32[22];

  *(_QWORD *)&v32[14] = *MEMORY[0x1E0C80C00];
  if (a2 < 2)
  {
    result = 0;
    v8 = a3;
    goto LABEL_39;
  }
  result = 0;
  v10 = 0;
  v11 = 0;
  v12 = (unint64_t)&a3[a5 - ((a7 & 2) == 0)];
  v13 = a2 >> 1;
  v8 = a3;
  while (1)
  {
    while (1)
    {
      --v13;
      if (v10 < 1)
      {
        v16 = *a1++;
        v14 = v16;
        v17 = bswap32(v16) >> 16;
        if ((a7 & 1) != 0)
          v14 = v17;
        if ((a7 & 4) != 0)
        {
          v18 = (unsigned __int16)v14;
          if ((unsigned __int16)v14 >= 0xC0u)
          {
            v19 = __CFUniCharDecomposableBitmap[(unint64_t)(unsigned __int16)v14 >> 8];
            if (!__CFUniCharDecomposableBitmap[(unint64_t)(unsigned __int16)v14 >> 8]
              || v19 != 255
              && ((__CFUniCharDecomposableBitmap[(v14 >> 3) + 256 + 32 * v19 - 32] >> (v14 & 7)) & 1) == 0)
            {
              goto LABEL_18;
            }
            v30 = result;
            v20 = a4;
            v21 = a3;
            v22 = a6;
            v23 = a7;
            v24 = unicode_decompose(v14, &v31);
            a7 = v23;
            a6 = v22;
            a3 = v21;
            a4 = v20;
            v10 = v24 - 1;
            result = v30;
            v13 += v10;
            v14 = v31;
            v11 = (unsigned __int16 *)v32;
          }
        }
      }
      else
      {
        v15 = *v11++;
        v14 = v15;
        --v10;
      }
      if (!(_WORD)v14)
      {
        LOBYTE(v14) = 0;
        LOBYTE(v25) = 2;
        LOBYTE(v26) = -112;
        goto LABEL_23;
      }
      if ((unsigned __int16)v14 == 47)
      {
        v14 = a6;
        if (!(_DWORD)a6)
          break;
      }
      v18 = (unsigned __int16)v14;
      if ((unsigned __int16)v14 < 0x80u)
        goto LABEL_35;
LABEL_18:
      if ((unsigned __int16)v14 > 0x7FFu)
      {
        v26 = (unsigned __int16)v14 >> 6;
        v25 = (unsigned __int16)v14 >> 12;
        if ((unsigned __int16)v14 >> 10 != 54 || !v13)
          goto LABEL_23;
        v27 = *a1;
        v28 = bswap32(v27) >> 16;
        if ((a7 & 1) != 0)
          LOWORD(v27) = v28;
        if ((unsigned __int16)v27 >> 10 == 55)
        {
          if ((unint64_t)(v8 + 3) >= v12)
            goto LABEL_38;
          v29 = (v18 << 10) + (unsigned __int16)v27 - 56613888;
          --v13;
          ++a1;
          *v8 = (v29 >> 18) | 0xF0;
          v8[1] = (v29 >> 12) & 0x3F | 0x80;
          v8[2] = (v29 >> 6) & 0x3F | 0x80;
          v8[3] = v27 & 0x3F | 0x80;
          v8 += 4;
          if (!v13)
            goto LABEL_39;
        }
        else
        {
LABEL_23:
          if ((unint64_t)(v8 + 2) >= v12)
            goto LABEL_38;
          *v8 = v25 | 0xE0;
          v8[1] = v26 & 0x3F | 0x80;
          v8[2] = v14 & 0x3F | 0x80;
          v8 += 3;
          if (!v13)
            goto LABEL_39;
        }
      }
      else
      {
        if ((unint64_t)(v8 + 1) >= v12)
          goto LABEL_38;
        *v8 = (v14 >> 6) | 0xC0;
        v8[1] = v14 & 0x3F | 0x80;
        v8 += 2;
        if (!v13)
          goto LABEL_39;
      }
    }
    LOBYTE(v14) = 95;
    result = 22;
LABEL_35:
    if ((unint64_t)v8 >= v12)
      break;
    *v8++ = v14;
    if (!v13)
      goto LABEL_39;
  }
LABEL_38:
  result = 63;
LABEL_39:
  *a4 = v8 - a3;
  if ((a7 & 2) == 0)
    v8[1] = 0;
  return result;
}

uint64_t unicode_decompose(__int16 a1, _WORD *a2)
{
  unsigned __int16 v2;

  v2 = a1 + 21504;
  if ((unsigned __int16)(a1 + 21504) > 0x2BA4u)
    return unicode_recursive_decompose(a1, a2);
  *a2 = ((28533 * (unsigned __int16)(a1 + 21504)) >> 24) | 0x1100;
  a2[1] = v2 % 0x24Cu / 0x1C + 4449;
  if (!(v2 % 0x1Cu))
    return 2;
  a2[2] = (unsigned __int16)(a1 + 21504) % 0x1Cu + 4519;
  return 3;
}

uint64_t utf8_decodestr(unsigned __int8 *a1, unint64_t a2, _WORD *a3, _QWORD *a4, uint64_t a5, _DWORD *a6, char a7)
{
  unint64_t v9;
  unint64_t v10;
  _WORD *v11;
  unsigned __int8 *v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  BOOL v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  _WORD *v24;
  __int16 v25;
  int v26;
  int v27;
  int v28;
  uint64_t result;
  int v30;
  unsigned int v31;
  unsigned int v32;
  _QWORD *v33;
  unsigned int v34;
  int v35;
  _QWORD *v36;
  int v37;
  uint64_t v38;
  _WORD *v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  _DWORD *v43;
  _DWORD *v44;
  _WORD v45[8];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  *a6 = 0;
  if (!a2)
  {
    result = 0;
    v11 = a3;
    goto LABEL_66;
  }
  v9 = a2;
  v10 = (unint64_t)a3 + a5;
  v11 = a3;
  v12 = a1;
  while (1)
  {
    v14 = *v12++;
    v13 = v14;
    if (!v14)
    {
LABEL_61:
      result = 0;
      goto LABEL_66;
    }
    --v9;
    if ((v13 & 0x80) == 0)
      goto LABEL_56;
    v15 = utf_extrabytes[v13 >> 3];
    v16 = v9 >= v15;
    v9 -= v15;
    if (!v16)
      goto LABEL_63;
    if ((_DWORD)v15 != 3)
      break;
    v19 = *v12;
    if ((v19 & 0xC0) != 0x80
      || (v20 = a1[2], (v20 & 0xC0) != 0x80)
      || (v21 = a1[3], (v21 & 0xC0) != 0x80)
      || (v22 = v21 + (((v19 << 6) + ((_DWORD)v13 << 12) + v20) << 6) - 63512704, v22 >> 20))
    {
LABEL_63:
      result = 22;
      goto LABEL_66;
    }
    v23 = (v22 >> 10) - 10240;
    if ((a7 & 1) != 0)
    {
      *v11 = bswap32(v23) >> 16;
      v24 = v11 + 1;
      if ((unint64_t)(v11 + 1) >= v10)
      {
LABEL_67:
        result = 63;
        v11 = v24;
        goto LABEL_66;
      }
      v25 = __rev16(v22 & 0x3FF | 0xDC00);
    }
    else
    {
      *v11 = v23;
      v24 = v11 + 1;
      if ((unint64_t)(v11 + 1) >= v10)
        goto LABEL_67;
      v25 = v22 & 0x3FF | 0xDC00;
    }
    v12 = a1 + 4;
    v11[1] = v25;
    v11 += 2;
LABEL_60:
    a1 = v12;
    if (!v9)
      goto LABEL_61;
  }
  if ((_DWORD)v15 == 2)
  {
    v26 = *v12;
    if ((v26 & 0xC0) != 0x80)
      goto LABEL_63;
    v27 = a1[2];
    if ((v27 & 0xC0) != 0x80)
      goto LABEL_63;
    v28 = (v26 << 6) + ((_DWORD)v13 << 12) + v27;
    v18 = v28 - 925824;
    if ((v28 - 925824) < 0x800)
      goto LABEL_63;
    v12 = a1 + 3;
    if (v18 >> 11 >= 0x1B)
    {
      result = 22;
      if (v18 < 0xE000 || (v28 & 0x3FFFFE) == 0xF207E)
        goto LABEL_66;
    }
  }
  else
  {
    if ((_DWORD)v15 != 1)
      goto LABEL_63;
    v17 = *v12;
    if ((v17 & 0xC0) != 0x80)
      goto LABEL_63;
    v18 = v17 + ((_DWORD)v13 << 6) - 12416;
    if (v18 < 0x80)
      goto LABEL_63;
    v12 = a1 + 2;
  }
  if ((a7 & 4) == 0)
  {
    if ((a7 & 8) != 0 && (unsigned __int16)v18 >= 0x300u)
    {
      v30 = __CFUniCharCombiningBitmap[BYTE1(v18)];
      if (__CFUniCharCombiningBitmap[BYTE1(v18)])
      {
        if (v30 == 255
          || ((__CFUniCharCombiningBitmap[(v18 >> 3) + 256 + 32 * v30 - 32] >> (v18 & 7)) & 1) != 0)
        {
          *a6 = 1;
          if (v11 == a3)
          {
            v11 = a3;
          }
          else
          {
            v31 = (unsigned __int16)*(v11 - 1);
            v32 = bswap32(v31) >> 16;
            if ((a7 & 1) != 0)
              LOWORD(v31) = v32;
            v33 = a4;
            v43 = a6;
            v34 = unicode_combine((unsigned __int16)v31, (unsigned __int16)v18);
            a6 = v43;
            a4 = v33;
            if (v34)
            {
              --v11;
              v18 = v34;
            }
          }
        }
      }
    }
LABEL_53:
    if (v18 == 9216)
      LODWORD(v13) = 0;
    else
      LODWORD(v13) = v18;
LABEL_56:
    if ((unint64_t)v11 >= v10)
      goto LABEL_65;
    v42 = bswap32(v13) >> 16;
    if ((a7 & 1) != 0)
      LOWORD(v13) = v42;
    *v11++ = v13;
    goto LABEL_60;
  }
  if ((unsigned __int16)v18 < 0xC0u)
    goto LABEL_53;
  v35 = __CFUniCharDecomposableBitmap[BYTE1(v18)];
  if (!__CFUniCharDecomposableBitmap[BYTE1(v18)]
    || v35 != 255
    && ((__CFUniCharDecomposableBitmap[(v18 >> 3) + 256 + 32 * v35 - 32] >> (v18 & 7)) & 1) == 0)
  {
    goto LABEL_53;
  }
  v44 = a6;
  v36 = a4;
  v37 = unicode_decompose(v18, v45);
  if (v37 < 1)
  {
    a4 = v36;
    a6 = v44;
    goto LABEL_60;
  }
  v38 = 0;
  a4 = v36;
  a6 = v44;
  while (1)
  {
    v39 = &v11[v38];
    v40 = (unsigned __int16)v45[v38];
    v41 = bswap32(v40) >> 16;
    if ((a7 & 1) != 0)
      LOWORD(v40) = v41;
    *v39 = v40;
    if ((unint64_t)(v39 + 1) >= v10)
      break;
    if (v37 == ++v38)
    {
      v11 = (_WORD *)((char *)v11 + v38 * 2);
      goto LABEL_60;
    }
  }
  v11 = v39 + 1;
LABEL_65:
  result = 63;
LABEL_66:
  *a4 = (char *)v11 - (char *)a3;
  return result;
}

uint64_t unicode_combine(unsigned int a1, unsigned int a2)
{
  __int16 v2;
  __int16 v3;
  unsigned __int16 v4;
  unsigned int *v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int *v8;
  unint64_t v9;
  unsigned int v10;
  char *v11;
  unsigned __int16 *v12;
  uint64_t v14;
  unsigned __int16 *v15;
  unsigned int v16;

  if (a2 - 4449 > 0x61)
  {
    if ((unsigned __int16)(a2 - 12443) < 0xD265u)
      return 0;
  }
  else
  {
    if (a2 >> 1 <= 0x8BA && (unsigned __int16)(a1 - 4352) <= 0x12u)
    {
      v2 = 28 * a2 + 588 * a1;
      v3 = -18076;
      return (unsigned __int16)(v2 + v3);
    }
    if (a2 >> 3 >= 0x235 && (unsigned __int16)((unsigned __int16)(a1 + 21504) >> 2) <= 0xAE8u)
    {
      HIDWORD(v9) = -1227133513 * a1 - 1840706560;
      LODWORD(v9) = HIDWORD(v9);
      if ((v9 >> 2) > 0x9249249)
        return 0;
      v2 = a1 + a2;
      v3 = -4519;
      return (unsigned __int16)(v2 + v3);
    }
  }
  v5 = (unsigned int *)&__CFUniCharPrecompSourceTable;
  v6 = (unsigned int *)&unk_18EB4471C;
  while (1)
  {
    v7 = ((char *)v6 - (char *)v5) >> 4;
    v8 = &v5[2 * v7];
    if (*v8 <= a2)
      break;
    v6 = v8 - 2;
LABEL_12:
    if (v5 > v6)
      return 0;
  }
  if (*v8 < a2)
  {
    v5 = v8 + 2;
    goto LABEL_12;
  }
  v10 = v5[2 * v7 + 1];
  if (v10)
  {
    v11 = (char *)&__CFUniCharBMPPrecompDestinationTable + 4 * (unsigned __int16)v10;
    if (*(unsigned __int16 *)v11 <= a1)
    {
      v12 = (unsigned __int16 *)&v11[4 * HIWORD(v10) - 4];
      if (*v12 >= a1)
      {
        while (1)
        {
          v14 = ((char *)v12 - v11) >> 3;
          v15 = (unsigned __int16 *)&v11[4 * v14];
          v16 = *v15;
          if (v16 <= a1)
          {
            if (v16 >= a1)
              return *(unsigned __int16 *)&v11[4 * v14 + 2];
            v11 = (char *)(v15 + 2);
          }
          else
          {
            v12 = v15 - 2;
          }
          v4 = 0;
          if (v11 > (char *)v12)
            return v4;
        }
      }
    }
  }
  return 0;
}

uint64_t unicode_recursive_decompose(unsigned int a1, _WORD *a2)
{
  _WORD *v2;
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  char *v10;
  unsigned __int16 *v11;
  uint64_t result;
  __int16 *v13;
  __int16 v14;
  __int16 v15;

  v2 = a2;
  if ((unsigned __int16)(a1 + 1201) < 0x571u)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v3 = (unsigned __int16 *)&__CFUniCharDecompositionTable;
  v4 = (unsigned __int16 *)&unk_18EB48144;
  while (1)
  {
    v5 = ((char *)v4 - (char *)v3) >> 3;
    v6 = &v3[2 * v5];
    v7 = *v6;
    if (v7 <= a1)
      break;
    v4 = v6 - 2;
LABEL_7:
    if (v3 > v4)
      goto LABEL_8;
  }
  if (v7 < a1)
  {
    v3 = v6 + 2;
    goto LABEL_7;
  }
  v8 = v3[2 * v5 + 1];
LABEL_9:
  v9 = (v8 >> 12) & 7;
  v15 = v8 & 0xFFF;
  v10 = (char *)&__CFUniCharMultipleDecompositionTable + 2 * (v8 & 0xFFF);
  v11 = (unsigned __int16 *)&v15;
  if (v9 != 1)
    v11 = (unsigned __int16 *)((char *)&__CFUniCharMultipleDecompositionTable + 2 * (v8 & 0xFFF));
  if ((v8 & 0x8000) == 0)
  {
    LODWORD(result) = 0;
    goto LABEL_17;
  }
  result = unicode_recursive_decompose(*v11, a2);
  if ((_DWORD)result)
  {
    --v9;
    v13 = &v15;
    if (v9)
      v13 = (__int16 *)v10;
    v11 = (unsigned __int16 *)(v13 + 1);
    v2 += result;
LABEL_17:
    for (result = (result + v9); v9; --v9)
    {
      v14 = *v11++;
      *v2++ = v14;
    }
  }
  return result;
}

uint64_t check_and_decompose_string(unsigned __int8 *a1, unint64_t a2, unsigned __int8 **a3, unint64_t *a4)
{
  unint64_t v8;
  unsigned __int8 *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  _WORD *v13;
  size_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int16 v22;
  unint64_t v23;
  int v24;

  *a3 = a1;
  *a4 = a2;
  if (!a2)
    return 0;
  v8 = 0;
  v24 = 0;
  v23 = 0;
  v9 = a1;
  while (((char)*v9 & 0x80000000) == 0)
  {
LABEL_10:
    ++v8;
    ++v9;
    if (v8 >= a2)
      goto LABEL_11;
  }
  v10 = utf8_byte_length_noerror_utf8_len_table_0[(unint64_t)*v9 >> 4];
  if (utf8_decodestr(v9, v10, &v22, &v23, 4, &v24, 0))
    return 22;
  if (v22 < 0xC0u
    || (v11 = __CFUniCharDecomposableBitmap[(unint64_t)v22 >> 8]) == 0
    || v11 != 255
    && ((__CFUniCharDecomposableBitmap[(v22 >> 3) + 256 + 32 * v11 - 32] >> (v22 & 7)) & 1) == 0)
  {
    v8 += v10 - 1;
    v9 += v10 - 1;
    goto LABEL_10;
  }
LABEL_11:
  if (v8 >= a2)
  {
    if (v8 <= a2)
      return 0;
    return 22;
  }
  v12 = (a2 >> 1) & 0x7FFFFFFFFFFFFFFELL;
  v13 = malloc_type_malloc(v12 + 2 * a2 + 2, 0x4262708EuLL);
  if (v13)
  {
    v14 = 2 * a2 + v12 + 66;
    do
    {
      v15 = utf8_decodestr(a1, a2, v13, &v23, v14 - 64, &v24, 4);
      if (!v15)
        break;
      if (v15 == 22)
      {
        free(v13);
        return 22;
      }
      free(v13);
      v13 = malloc_type_malloc(v14, 0x4262708EuLL);
      v14 += 64;
    }
    while (v13);
  }
  v16 = v23;
  v17 = utf8_encodelen(v13, v23, 47, 0);
  v18 = malloc_type_malloc(v17 + 1, 0xFABA5E61uLL);
  v19 = utf8_encodestr(v13, v16, v18, &v23, v17 + 1, 47, 4);
  if ((_DWORD)v19)
  {
    v20 = v19;
    free(v13);
    free(v18);
    return v20;
  }
  v18[v17] = 0;
  *a3 = v18;
  *a4 = v17 + 1;
  free(v13);
  return 0;
}

uint64_t map_case(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  unsigned __int16 *v3;
  int __key;

  v1 = a1;
  if (a1 > 0x7F)
  {
    if ((unsigned __int16)(a1 + 223) < 0x3Au || a1 < 0x587 || (unsigned __int16)(a1 - 7680) <= 0x6E9u)
    {
      __key = (unsigned __int16)a1;
      v3 = (unsigned __int16 *)bsearch(&__key, &case_mapping_table, 0x57AuLL, 4uLL, (int (__cdecl *)(const void *, const void *))case_cmp);
      if (v3)
        return v3[1];
    }
  }
  else
  {
    if ((a1 - 97) > 0x19)
      v2 = &tolower_map;
    else
      v2 = (char *)&toupper_map;
    return v2[a1];
  }
  return v1;
}

uint64_t case_cmp(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 - *a2;
}

void get_canonical_language_identifier_for_string(char *cStr, char *a2, int a3)
{
  const __CFString *v5;
  const __CFString *CanonicalLanguageIdentifierFromString;

  *a2 = 0;
  v5 = CFStringCreateWithCStringNoCopy(0, cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, v5);
  CFStringGetCString(CanonicalLanguageIdentifierFromString, a2, a3, 0x8000100u);
  CFRelease(CanonicalLanguageIdentifierFromString);
  CFRelease(v5);
}

const void *CRCopyRestrictionsDictionary()
{
  double Current;
  const void *v1;
  const __CFAllocator *v2;
  CFNumberRef v3;
  const void *v5[4];
  void *keys[2];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&CRCopyRestrictionsDictionary_lastSynchronizationTimeMutex);
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&CRCopyRestrictionsDictionary_lastSynchronizationTime > 2.0)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
    CRCopyRestrictionsDictionary_lastSynchronizationTime = *(_QWORD *)&Current;
  }
  pthread_mutex_unlock(&CRCopyRestrictionsDictionary_lastSynchronizationTimeMutex);
  v1 = CFPreferencesCopyAppValue(CFSTR("SBParentalControlsMCContentRestrictions"), CFSTR("com.apple.springboard"));
  if (!v1)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &CRMaxRank);
    *(_OWORD *)keys = xmmword_1E2881998;
    v7 = *(_OWORD *)off_1E28819A8;
    v5[0] = v3;
    v5[1] = v3;
    v5[2] = v3;
    v5[3] = &stru_1E2882B60;
    v1 = CFDictionaryCreate(v2, (const void **)keys, v5, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFPreferencesSetAppValue(CFSTR("SBParentalControlsMCContentRestrictions"), v1, CFSTR("com.apple.springboard"));
    if (v3)
      CFRelease(v3);
  }
  return v1;
}

const void *CRCopyCountryCode()
{
  return _CRCopyValueForKey(CFSTR("countryCode"));
}

const void *_CRCopyValueForKey(const void *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const void *Value;
  const void *v5;

  v2 = (const __CFDictionary *)CRCopyRestrictionsDictionary();
  if (!v2)
    return 0;
  v3 = v2;
  Value = CFDictionaryGetValue(v2, a1);
  v5 = Value;
  if (Value)
    CFRetain(Value);
  CFRelease(v3);
  return v5;
}

const void *CRCopyMoviesRank()
{
  return _CRCopyValueForKey(CFSTR("movies"));
}

const void *CRCopyTVShowsRank()
{
  return _CRCopyValueForKey(CFSTR("tvshows"));
}

const void *CRCopyAppsRank()
{
  return _CRCopyValueForKey(CFSTR("apps"));
}

void _DisposeICUSQLiteContext(_QWORD *a1)
{
  UText *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;

  if (a1)
  {
    usearch_close();
    ubrk_close();
    CPICUReleaseSearchCollator();
    v2 = (UText *)a1[5];
    if (v2)
      utext_close(v2);
    v3 = (void *)a1[24];
    if (v3)
      free(v3);
    v4 = (_QWORD *)a1[26];
    if (v4 && v4 != a1 + 27)
      free(v4);
    v5 = (_QWORD *)a1[22];
    if (v5)
    {
      if (v5 != a1 + 6)
        free(v5);
    }
    free(a1);
  }
}

_QWORD *_CreateICUSQLiteContext(uint64_t a1, char a2)
{
  _QWORD *v4;
  const char *v5;
  __int128 v7;
  uint64_t v8;
  UErrorCode v9;

  v9 = U_ZERO_ERROR;
  v4 = malloc_type_malloc(0x2E0uLL, 0x10B004033E6159AuLL);
  v4[3] = 0;
  *((_WORD *)v4 + 24) = 65;
  v4[22] = v4 + 6;
  *((_DWORD *)v4 + 46) = 128;
  v4[24] = 0;
  v4[5] = 0;
  *((_DWORD *)v4 + 50) = 0;
  *((_BYTE *)v4 + 188) = 1;
  v4[26] = v4 + 27;
  *((_DWORD *)v4 + 182) = 256;
  CPICUCreateSearchCollator(a1, (uint64_t *)&v7);
  *(_OWORD *)v4 = v7;
  v4[2] = v8;
  v4[4] = ubrk_open();
  if ((a2 & 1) != 0)
  {
    ucol_setAttribute();
    if ((a2 & 2) != 0)
      goto LABEL_6;
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_6;
  }
  ucol_setAttribute();
LABEL_6:
  if ((a2 & 4) != 0)
    ucol_setAttribute();
  v4[3] = usearch_openFromCollator();
  if (v9 >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    _DisposeICUSQLiteContext(v4);
    v5 = u_errorName(v9);
    NSLog((NSString *)CFSTR("Failed to open ICUSQLite collator: %s"), v5);
    return 0;
  }
  return v4;
}

uint64_t ICUSearchContextPattern(uint64_t a1)
{
  return *(_QWORD *)(a1 + 176);
}

UChar *_ICUSQLiteMatch(const char *a1, char *__s2, int a3, int a4, uint64_t a5)
{
  void *v9;
  size_t v10;
  void *v11;
  void *v12;
  UChar *v13;
  UChar *v14;
  void *v15;
  int32_t v16;
  uint64_t v17;
  __int16 *v18;
  __int16 v19;
  __int16 v20;
  int32_t v21;
  UChar *result;
  UChar *v23;
  void *v24;
  int32_t v25;
  int v26;
  BOOL v27;
  _BOOL4 v28;
  int v29;
  int v30;
  char v31;
  UText *v32;
  UChar32 v33;
  int isUUppercase;
  UChar32 v35;
  int v36;
  UChar32 v37;
  BOOL v38;
  int v39;
  int isBoundary;
  int32_t v41;
  int32_t pDestLength;
  UErrorCode pErrorCode;

  pErrorCode = U_ZERO_ERROR;
  if (a3 == -1)
    a3 = strlen(__s2);
  v9 = *(void **)(a5 + 176);
  v10 = a3;
  if (strncmp((const char *)v9, __s2, a3) || !*(_QWORD *)(a5 + 192))
  {
    pDestLength = 0;
    if ((int)v10 >= 1)
    {
      if ((int)v10 >= *(_DWORD *)(a5 + 184))
      {
        v11 = malloc_type_malloc((v10 + 1), 0x100004077774924uLL);
        if (!v11)
          return 0;
        v9 = v11;
        v12 = *(void **)(a5 + 176);
        if (v12 != (void *)(a5 + 48))
          free(v12);
        *(_QWORD *)(a5 + 176) = v9;
        *(_DWORD *)(a5 + 184) = v10 + 1;
      }
      memcpy(v9, __s2, v10);
      *(_BYTE *)(*(_QWORD *)(a5 + 176) + v10) = 0;
      u_strFromUTF8(*(UChar **)(a5 + 192), *(_DWORD *)(a5 + 200), &pDestLength, __s2, v10, &pErrorCode);
      if (pErrorCode == U_BUFFER_OVERFLOW_ERROR || !*(_QWORD *)(a5 + 192))
      {
        v13 = (UChar *)malloc_type_malloc(2 * pDestLength + 2, 0x1000040BDFB0063uLL);
        if (!v13)
          return 0;
        v14 = v13;
        v15 = *(void **)(a5 + 192);
        if (v15)
          free(v15);
        *(_QWORD *)(a5 + 192) = v14;
        v16 = pDestLength + 1;
        *(_DWORD *)(a5 + 200) = pDestLength + 1;
        pErrorCode = U_ZERO_ERROR;
        u_strFromUTF8(v14, v16, &pDestLength, __s2, v10, &pErrorCode);
      }
      usearch_setPattern();
      *(_BYTE *)(a5 + 188) = 1;
      v17 = pDestLength;
      if (pDestLength >= 1)
      {
        v18 = *(__int16 **)(a5 + 192);
        do
        {
          v20 = *v18++;
          v19 = v20;
          if ((unsigned __int16)(v20 + 160) < 0x50u
            || (v19 & 0xFF80) == 0xE00
            || (unsigned __int16)((unsigned __int16)(v19 - 11904) >> 7) <= 0x196u)
          {
            *(_BYTE *)(a5 + 188) = 0;
          }
          --v17;
        }
        while (v17);
      }
      if (pErrorCode <= U_ZERO_ERROR)
        goto LABEL_26;
      **(_BYTE **)(a5 + 176) = 0;
    }
    return 0;
  }
LABEL_26:
  v41 = 0;
  v21 = strlen(a1);
  if (v21 < 1)
    return 0;
  u_strFromUTF8(*(UChar **)(a5 + 208), *(_DWORD *)(a5 + 728), &v41, a1, v21, &pErrorCode);
  if (pErrorCode == U_BUFFER_OVERFLOW_ERROR)
  {
    result = (UChar *)malloc_type_malloc(2 * v41 + 2, 0x1000040BDFB0063uLL);
    if (!result)
      return result;
    v23 = result;
    v24 = *(void **)(a5 + 208);
    if (v24 != (void *)(a5 + 216))
      free(v24);
    *(_QWORD *)(a5 + 208) = v23;
    v25 = v41 + 1;
    *(_DWORD *)(a5 + 728) = v41 + 1;
    pErrorCode = U_ZERO_ERROR;
    u_strFromUTF8(v23, v25, &v41, a1, v21, &pErrorCode);
  }
  usearch_setText();
  if (a4 != 3)
  {
    v29 = usearch_first();
    v28 = 0;
    v30 = v29;
    switch(a4)
    {
      case 0:
        goto LABEL_63;
      case 1:
        v27 = v29 == -1;
        goto LABEL_35;
      case 2:
        v27 = v29 == 0;
        goto LABEL_35;
      case 4:
        if (v29)
          goto LABEL_67;
        v27 = usearch_getMatchedLength() == v41;
        goto LABEL_35;
      case 5:
      case 6:
        if (!*(_BYTE *)(a5 + 188))
        {
LABEL_63:
          v28 = v29 != -1;
          goto LABEL_68;
        }
        if (v29 == -1)
          goto LABEL_67;
        ubrk_setText();
        if (pErrorCode > U_ZERO_ERROR)
          goto LABEL_67;
        v31 = 0;
        break;
      default:
        goto LABEL_68;
    }
    while (1)
    {
      if (ubrk_isBoundary())
      {
        if (a4 == 5 || (usearch_getMatchedLength(), ubrk_isBoundary()))
        {
LABEL_72:
          v28 = 1;
          goto LABEL_68;
        }
      }
      else
      {
        v32 = *(UText **)(a5 + 40);
        if ((v31 & 1) == 0)
        {
          v32 = utext_openUChars(v32, *(const UChar **)(a5 + 208), v41, &pErrorCode);
          *(_QWORD *)(a5 + 40) = v32;
        }
        utext_setNativeIndex(v32, v30);
        utext_moveIndex32(*(UText **)(a5 + 40), -1);
        v33 = utext_next32(*(UText **)(a5 + 40));
        isUUppercase = u_isUUppercase(v33);
        v35 = utext_next32(*(UText **)(a5 + 40));
        v36 = u_isUUppercase(v35);
        v37 = utext_next32(*(UText **)(a5 + 40));
        if (u_isUUppercase(v37))
          v38 = isUUppercase == 0;
        else
          v38 = 1;
        v39 = v38;
        v31 = 1;
        if (v36 && v39)
        {
          if (a4 == 5)
            goto LABEL_72;
          usearch_getMatchedLength();
          isBoundary = ubrk_isBoundary();
          v28 = 1;
          if (isBoundary)
            goto LABEL_68;
        }
      }
      v30 = usearch_next();
      v28 = 0;
      if (v30 == -1)
        goto LABEL_68;
    }
  }
  v26 = usearch_last();
  if (v26 == -1)
  {
LABEL_67:
    v28 = 0;
  }
  else
  {
    v27 = usearch_getMatchedLength() + v26 == v41;
LABEL_35:
    v28 = v27;
  }
LABEL_68:
  if (pErrorCode < U_ILLEGAL_ARGUMENT_ERROR)
    return (UChar *)v28;
  else
    return 0;
}

void sub_18EB2A990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB2AB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPStartAnInhibitor()
{
  void *v0;
  uint64_t v1;

  +[_CPInhibitorManager sharedInstance](_CPInhibitorManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "startAnInhibitor");

  return v1;
}

void CPStopInhibitorWithIdentifier(uint64_t a1)
{
  id v2;

  +[_CPInhibitorManager sharedInstance](_CPInhibitorManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopInhibitorWithIdentifier:", a1);

}

Class __getRBSProcessHandleClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSProcessHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSProcessHandleClass_block_invoke_cold_1();
  getRBSProcessHandleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void RunningBoardServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E28819D8;
    v2 = 0;
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    RunningBoardServicesLibrary_cold_1(&v0);
}

Class __getRBSTargetClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSTarget");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSTargetClass_block_invoke_cold_1();
  getRBSTargetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSDomainAttributeClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSDomainAttribute");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSDomainAttributeClass_block_invoke_cold_1();
  getRBSDomainAttributeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSAcquisitionCompletionAttributeClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSAcquisitionCompletionAttribute");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1();
  getRBSAcquisitionCompletionAttributeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSAssertionClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSAssertionClass_block_invoke_cold_1();
  getRBSAssertionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

const __CFString *getConfigPListURL()
{
  const __CFString *v0;
  void *v1;

  v0 = (const __CFString *)getConfigPListURL_configDefaultsDomain;
  if (!getConfigPListURL_configDefaultsDomain)
  {
    v0 = CFSTR("/var/mobile/Library/Preferences/com.apple.ConfigServer");
    getConfigPListURL_configDefaultsDomain = (uint64_t)CFSTR("/var/mobile/Library/Preferences/com.apple.ConfigServer");
  }
  v1 = (void *)CFPreferencesCopyAppValue(CFSTR("ConfigurationPlistURL"), v0);
  if (objc_msgSend(v1, "length"))
    return (const __CFString *)v1;

  return CFSTR("https://configuration.apple.com/configurations/pep/config/pepconfig.plist");
}

uint64_t downloadDictionary()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", getConfigPListURL());
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithURL:cachePolicy:timeoutInterval:", v0, 1, 60.0);

  v5 = 0;
  v2 = objc_msgSend(MEMORY[0x1E0CB39A0], "sendSynchronousRequest:returningResponse:error:", v1, 0, &v5);

  if (v5)
    NSLog((NSString *)CFSTR("Could not download configuration data %@"), v5);
  if (!v2)
    return 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

void ALBasicDiacriticMatch(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  void *v5;
  const unsigned __int8 *v6;
  BOOL v7;
  int v8;
  sqlite3_context *v9;

  if (a2 == 1)
  {
    v5 = (void *)objc_msgSend(sqlite3_user_data(a1), "citySearchMatcher");
    v6 = sqlite3_value_text(*a3);
    if (v6)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
    {
      v9 = a1;
      v8 = 0;
    }
    else
    {
      v8 = objc_msgSend(v5, "matchesUTF8String:", v6);
      v9 = a1;
    }
    sqlite3_result_int(v9, v8);
  }
  else
  {
    sqlite3_result_error(a1, "ALBasicDiacriticMatch: wrong number of arguments", -1);
  }
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void RadioPreferencesCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  pthread_mutex_lock(&__sValidObjectsLock);
  if (__sValidObjects && CFSetContainsValue((CFSetRef)__sValidObjects, a3))
  {
    v5 = a3;
    pthread_mutex_unlock(&__sValidObjectsLock);
    if (v5)
      objc_msgSend(v5, "notifyTarget:", a2);
  }
  else
  {
    pthread_mutex_unlock(&__sValidObjectsLock);
  }

}

void sub_18EB2FBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EB2FF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a16, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E2881B20;
    v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    __getNPSDomainAccessorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NPSDomainAccessor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getNPSDomainAccessorClass_block_invoke_cold_2();
  getNPSDomainAccessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getNSSManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!NanoSystemSettingsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E2881B38;
    v5 = 0;
    NanoSystemSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoSystemSettingsLibraryCore_frameworkLibrary)
    __getNSSManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NSSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getNSSManagerClass_block_invoke_cold_2();
  getNSSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t CPICUReleaseSearchCollator()
{
  return ucol_close();
}

uint64_t CPICUCreateSearchCollator@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  const __CFString *v3;
  const __CFString *ValueAtIndex;
  const __CFString *CanonicalLanguageIdentifierFromString;
  const __CFString *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  _OWORD v10[16];
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  if (a1)
  {
    __strlcpy_chk();
  }
  else
  {
    v3 = (const __CFString *)*MEMORY[0x1E0C9B248];
    ValueAtIndex = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("AppleCollationOrder"), (CFStringRef)*MEMORY[0x1E0C9B248]);
    if (ValueAtIndex
      || (v7 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), v3)) != 0
      && (v8 = v7,
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v7, 0),
          CFRetain(ValueAtIndex),
          CFRelease(v8),
          ValueAtIndex))
    {
      CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], ValueAtIndex);
      if (CanonicalLanguageIdentifierFromString)
      {
        v6 = CanonicalLanguageIdentifierFromString;
        CFStringGetCString(CanonicalLanguageIdentifierFromString, (char *)v10, 257, 0x600u);
        CFRelease(v6);
      }
      CFRelease(ValueAtIndex);
    }
    else
    {
      LOBYTE(v10[0]) = 0;
    }
  }
  uloc_setKeywordValue();
  *a2 = ucol_open();
  return ucol_setStrength();
}

CFErrorRef *CPBitmapWriteImagesToPath(const __CFArray *a1, unsigned int a2, const __CFData *a3, const __CFString *a4, int a5, CFErrorRef *a6)
{
  CFIndex Count;
  const void *v13;
  const void *v14;
  CFIndex v15;
  const void *ValueAtIndex;

  if (!a1 || !CFArrayGetCount(a1))
  {
    if (!a6)
      return a6;
    __CPBitmapSetErrorIfNecessary(a6, CFSTR("CPBitmapErrorDomain"), 1, "No images provided");
    return 0;
  }
  Count = CFArrayGetCount(a1);
  CPBitmapWriterCreateWithPath(a4, a2, a5, Count, a3, a6);
  if (!v13)
    return 0;
  v14 = v13;
  if (Count < 1)
  {
LABEL_8:
    a6 = (CFErrorRef *)CPBitmapWriterFinalize((uint64_t)v14, (uint64_t)a6);
  }
  else
  {
    v15 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v15);
      if ((CPBitmapWriterAddImage((uint64_t)v14, (uint64_t)ValueAtIndex, (uint64_t)a6) & 1) == 0)
        break;
      if (Count == ++v15)
        goto LABEL_8;
    }
    a6 = 0;
  }
  CFRelease(v14);
  return a6;
}

void __CPBitmapSetErrorIfNecessary(CFErrorRef *a1, const __CFString *a2, CFIndex __errnum, char *cStr)
{
  const __CFAllocator *v8;
  __CFString *v9;
  char *v10;
  void *userInfoValues;

  if (a1)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if ((const __CFString *)*MEMORY[0x1E0C9AFD0] == a2)
    {
      v10 = strerror(__errnum);
      v9 = (__CFString *)CFStringCreateWithFormat(v8, 0, CFSTR("CPBitmap: %s (%s)"), cStr, v10);
    }
    else
    {
      v9 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0x8000100u);
    }
    userInfoValues = v9;
    *a1 = CFErrorCreateWithUserInfoKeysAndValues(v8, a2, __errnum, MEMORY[0x1E0C9AFB0], (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
  }
}

void CPBitmapWriterCreateWithPath(const __CFString *a1, unsigned int a2, int a3, unint64_t a4, const __CFData *a5, CFErrorRef *a6)
{
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  uint64_t v18;
  const __CFString *v19;
  char *v20;
  CFErrorRef *v21;
  CFIndex v22;
  const __CFString *v23;

  v12 = (char *)malloc_type_malloc(0x400uLL, 0xC639AAE6uLL);
  if (v12)
  {
    v13 = v12;
    *v12 = 0;
    v14 = (char *)malloc_type_malloc(0x400uLL, 0x4FA72E8CuLL);
    if (v14)
    {
      v15 = v14;
      *v14 = 0;
      if (a1 && CFStringGetCString(a1, v13, 1024, 0x8000100u))
      {
        v16 = CPOpenTemporaryFile((uint64_t)v13, v15, 0x400uLL);
        if (v16 != -1)
        {
          v17 = v16;
          CPBitmapWriterCreateWithFileDescriptor(v16, a2, a3, a4, a5, a6);
          if (v18)
          {
            *(_BYTE *)(v18 + 65) = 1;
            *(_QWORD *)(v18 + 72) = v15;
            *(_QWORD *)(v18 + 80) = v13;
            return;
          }
          goto LABEL_19;
        }
        if (a6)
        {
          v23 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
          v22 = *__error();
          v20 = "Could not open dest path";
          v21 = a6;
          v19 = v23;
          goto LABEL_17;
        }
      }
      else if (a6)
      {
        v19 = CFSTR("CPBitmapErrorDomain");
        v20 = "Invalid dest path";
        v21 = a6;
        v22 = 4;
LABEL_17:
        __CPBitmapSetErrorIfNecessary(v21, v19, v22, v20);
      }
      v17 = -1;
LABEL_19:
      free(v15);
      free(v13);
      if (v17 != -1)
        close(v17);
      return;
    }
    if (a6)
      __CPBitmapSetErrorIfNecessary(a6, (const __CFString *)*MEMORY[0x1E0C9AFD0], 12, "Could not allocate source path buffer");
    free(v13);
  }
  else if (a6)
  {
    __CPBitmapSetErrorIfNecessary(a6, (const __CFString *)*MEMORY[0x1E0C9AFD0], 12, "Could not allocate destination path buffer");
  }
}

uint64_t CPBitmapWriterAddImage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v3 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = __CPBitmapWriterAddImage_block_invoke;
  v6[3] = &unk_1E2881C28;
  v6[6] = a3;
  v6[7] = a1;
  v6[4] = &v7;
  v6[5] = a2;
  dispatch_sync(v3, v6);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t CPBitmapWriterFinalize(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __CPBitmapWriterFinalize_block_invoke;
  block[3] = &unk_1E2881C50;
  block[5] = a1;
  block[6] = a2;
  block[4] = &v6;
  dispatch_sync(v2, block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFErrorRef *CPBitmapCreateImagesFromPath(const __CFString *a1, CFPropertyListRef *a2, char a3, CFErrorRef *a4)
{
  CFErrorRef *result;
  CFErrorRef *v8;
  __CFArray *ImagesFromData;

  result = CPBitmapCreateMappedDataFromPath(a1, a4);
  if (result)
  {
    v8 = result;
    ImagesFromData = CPBitmapCreateImagesFromData((const __CFData *)result, a2, a3, a4);
    CFRelease(v8);
    return (CFErrorRef *)ImagesFromData;
  }
  return result;
}

CFErrorRef *CPBitmapCreateMappedDataFromPath(const __CFString *a1, CFErrorRef *a2)
{
  int v3;
  int v4;
  size_t v5;
  void *v6;
  const UInt8 *v7;
  const UInt8 *v8;
  const __CFAllocator *v9;
  const __CFString *v10;
  char *v11;
  CFErrorRef *v12;
  CFIndex v13;
  const __CFString *v14;
  const __CFString *v15;
  CFIndex v16;
  char *v17;
  CFAllocatorContext v19;
  char buffer[1024];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  buffer[0] = 0;
  if (a1 && CFStringGetCString(a1, buffer, 1024, 0x8000100u))
  {
    v3 = open(buffer, 0);
    if (v3 != -1)
    {
      v4 = v3;
      v5 = lseek(v3, 0, 2);
      if (v5 == -1)
      {
        if (!a2)
          goto LABEL_17;
        v15 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
        v16 = *__error();
        v17 = "Could not lseek file for length";
      }
      else
      {
        v6 = (void *)v5;
        v7 = (const UInt8 *)mmap(0, v5, 1, 1, v4, 0);
        if (v7 != (const UInt8 *)-1)
        {
          v8 = v7;
          v19.version = 0;
          memset(&v19.retain, 0, 40);
          v19.info = v6;
          v19.deallocate = (CFAllocatorDeallocateCallBack)MEMORY[0x1E0C84220];
          v19.preferredSize = 0;
          v9 = CFAllocatorCreate(0, &v19);
          a2 = (CFErrorRef *)CFDataCreateWithBytesNoCopy(0, v8, (CFIndex)v6, v9);
          CFRelease(v9);
LABEL_17:
          close(v4);
          return a2;
        }
        if (!a2)
          goto LABEL_17;
        v15 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
        v16 = *__error();
        v17 = "Could not mmap CPBitmap file";
      }
      __CPBitmapSetErrorIfNecessary(a2, v15, v16, v17);
      a2 = 0;
      goto LABEL_17;
    }
    if (a2)
    {
      v14 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v13 = *__error();
      v11 = "Could not open path for reading";
      v12 = a2;
      v10 = v14;
      goto LABEL_9;
    }
  }
  else if (a2)
  {
    v10 = CFSTR("CPBitmapErrorDomain");
    v11 = "Invalid read path";
    v12 = a2;
    v13 = 4;
LABEL_9:
    __CPBitmapSetErrorIfNecessary(v12, v10, v13, v11);
    return 0;
  }
  return a2;
}

__CFArray *CPBitmapCreateImagesFromData(const __CFData *a1, CFPropertyListRef *a2, char a3, CFErrorRef *a4)
{
  const UInt8 *BytePtr;
  UInt8 *v9;
  size_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  const __CFString *v14;
  char *v15;
  CFErrorRef *v16;
  CFIndex v17;
  __CFArray *Mutable;
  UInt8 *v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  const __CFAllocator *v28;
  CFDictionaryRef v29;
  const __CFDictionary *v30;
  CFTypeRef *v31;
  CFTypeRef *v32;
  CGDataProvider *Direct;
  CGDataProvider *v34;
  CGImageSource *v35;
  CGImageSource *v36;
  CGImageRef ImageAtIndex;
  CGImageRef v38;
  BOOL v39;
  unint64_t v40;
  const __CFData *v41;
  size_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  CFIndex v47;
  CFIndex v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  CGDataProvider *v52;
  CGImageRef v53;
  CGImageRef v54;
  uint64_t v55;
  CGFloat v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const __CFAllocator *v60;
  const __CFData *v61;
  const __CFData *v62;
  CGBitmapInfo bitmapInfo;
  CGColorSpace *space;
  __int128 v65;
  uint64_t v66;
  off_t size;
  const __CFData *cfa;
  CFTypeRef cf;
  const __CFAllocator *allocator;
  CFAllocatorRef allocatora;
  CGDataProvider *allocatorb;
  size_t width;
  size_t widtha;
  uint64_t v75;
  CFIndex length;
  uint64_t v77;
  _QWORD v78[2];
  _QWORD *(*v79)(_QWORD *, uint64_t, uint64_t, uint64_t);
  void *v80;
  CGFloat *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  const __CFString *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  CGFloat decode[2];
  uint64_t v102;
  char v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v100 = 0;
  v98 = 0u;
  v99 = 0u;
  v97 = 0u;
  if (!a1 || (BytePtr = CFDataGetBytePtr(a1)) == 0 || (v9 = (UInt8 *)BytePtr, (v10 = CFDataGetLength(a1)) == 0))
  {
    if (!a4)
    {
LABEL_15:
      Mutable = 0;
      goto LABEL_16;
    }
    v14 = CFSTR("CPBitmapErrorDomain");
    v15 = "No data provided to CPBitmapCreateImagesFromData";
    v16 = a4;
    v17 = 0;
    goto LABEL_14;
  }
  v11 = v10;
  if (v10 <= 0x17)
  {
LABEL_67:
    if (!a4)
      goto LABEL_15;
    v14 = CFSTR("CPBitmapErrorDomain");
    v15 = "Length of file does not match expected length";
    v16 = a4;
    v17 = 5;
    goto LABEL_14;
  }
  if ((a3 & 2) != 0)
    madvise(v9, v10, 3);
  if (v11 <= 0x1B)
    v12 = 24;
  else
    v12 = 28;
  if (v11 < 0x1C)
    v13 = 0;
  else
    v13 = *(_DWORD *)&v9[v11 - 28];
  v20 = &v9[v11];
  v22 = *(unsigned int *)&v9[v11 - 8];
  v21 = *(_DWORD *)&v9[v11 - 4];
  v23 = *(unsigned int *)&v9[v11 - 16];
  v24 = *((_DWORD *)v20 - 3);
  v25 = *((unsigned int *)v20 - 5);
  v26 = v11 > 0x1B && v21 == -592100446;
  v27 = v26;
  if (!v26)
  {
    if (v21 != -878431599)
    {
      if (!a4)
        goto LABEL_15;
      v14 = CFSTR("CPBitmapErrorDomain");
      v15 = "Invalid magic in trailer";
      v16 = a4;
      v17 = 6;
      goto LABEL_14;
    }
    v13 = 0;
    v12 = 24;
  }
  v77 = v22;
  if (!(_DWORD)v22)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    goto LABEL_99;
  }
  v75 = v12;
  length = *((unsigned int *)v20 - 6);
  if (v24 <= 7 && ((1 << v24) & 0xD0) != 0)
  {
    decode[0] = 0.0;
    *(_QWORD *)&decode[1] = decode;
    v102 = 0x2000000000;
    v103 = 0;
    v93 = 0;
    v94 = &v93;
    v95 = 0x2000000000;
    v96 = 0;
    v89 = 0;
    v90 = &v89;
    v91 = 0x2000000000;
    v92 = 0;
    v85 = 0;
    v86 = &v85;
    v87 = 0x2000000000;
    v88 = 0;
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 0x40000000;
    v79 = __CPBitmapCreateImagesFromData_block_invoke;
    v80 = &unk_1E2881B60;
    v81 = decode;
    v82 = &v93;
    v83 = &v89;
    v84 = &v85;
    if ((_DWORD)v22 != 1)
    {
      v39 = 0;
      Mutable = 0;
      v103 = 1;
      v96 = CFSTR("CPBitmapErrorDomain");
      v92 = 6;
      v88 = "KTX container can only have one image";
LABEL_91:
      if (a4 && !v39)
        __CPBitmapSetErrorIfNecessary(a4, (const __CFString *)v94[3], v90[3], (char *)v86[3]);
      _Block_object_dispose(&v85, 8);
      _Block_object_dispose(&v89, 8);
      _Block_object_dispose(&v93, 8);
      _Block_object_dispose(decode, 8);
      if (v39)
      {
LABEL_95:
        if (a2)
        {
          if ((_DWORD)length)
          {
            v60 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v61 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v20[-v75 - length], length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
            if (v61)
            {
              v62 = v61;
              *a2 = CFPropertyListCreateWithData(v60, v61, 0, 0, a4);
              CFRelease(v62);
            }
          }
        }
      }
      goto LABEL_99;
    }
    v28 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v29 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0CBD240], MEMORY[0x1E0C9AE40], 1, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    if (!v29)
    {
      Mutable = 0;
      v55 = *MEMORY[0x1E0C9AFD0];
      v56 = decode[1];
      *(_BYTE *)(*(_QWORD *)&decode[1] + 24) = 1;
      v94[3] = v55;
      v90[3] = 12;
      v86[3] = (uint64_t)"Could not allocate image source props";
LABEL_90:
      v39 = *(_BYTE *)(*(_QWORD *)&v56 + 24) == 0;
      goto LABEL_91;
    }
    v30 = v29;
    v31 = (CFTypeRef *)CPBitmapDataWithOffsetCreate(a1, 0);
    if (v31)
    {
      v32 = v31;
      Direct = CGDataProviderCreateDirect(v31, v11 - (v75 + length + v13), &__CPBitmapDataWithOffsetDirectProviderCallbacks);
      if (Direct)
      {
        v34 = Direct;
        v35 = CGImageSourceCreateWithDataProvider(Direct, v30);
        if (!v35)
        {
          Mutable = 0;
          v59 = *MEMORY[0x1E0C9AFD0];
          *(_BYTE *)(*(_QWORD *)&decode[1] + 24) = 1;
          v94[3] = v59;
          v90[3] = 12;
          v86[3] = (uint64_t)"Could not allocate image source";
LABEL_88:
          CFRelease(v34);
          goto LABEL_89;
        }
        v36 = v35;
        if (CGImageSourceGetCount(v35) == 1)
        {
          ImageAtIndex = CGImageSourceCreateImageAtIndex(v36, 0, v30);
          if (ImageAtIndex)
          {
            v38 = ImageAtIndex;
            Mutable = CFArrayCreateMutable(v28, 1, MEMORY[0x1E0C9B378]);
            CFArrayAppendValue(Mutable, v38);
            CFRelease(v38);
LABEL_87:
            CFRelease(v36);
            goto LABEL_88;
          }
          v79(v78, (uint64_t)CFSTR("CPBitmapErrorDomain"), 6, (uint64_t)"Could not create image from KTX source");
        }
        else
        {
          __CPBitmapCreateImagesFromData_block_invoke(v78, (uint64_t)CFSTR("CPBitmapErrorDomain"), 6, (uint64_t)"Unexpected image count for KTX format");
        }
        Mutable = 0;
        goto LABEL_87;
      }
      v58 = *MEMORY[0x1E0C9AFD0];
      *(_BYTE *)(*(_QWORD *)&decode[1] + 24) = 1;
      v94[3] = v58;
      v90[3] = 12;
      v86[3] = (uint64_t)"Could not allocate source data provider";
      CFRelease(*v32);
      free(v32);
      Mutable = 0;
    }
    else
    {
      Mutable = 0;
      v57 = *MEMORY[0x1E0C9AFD0];
      *(_BYTE *)(*(_QWORD *)&decode[1] + 24) = 1;
      v94[3] = v57;
      v90[3] = 12;
      v86[3] = (uint64_t)"Could not allocate offsetted source data";
    }
LABEL_89:
    CFRelease(v30);
    v56 = decode[1];
    goto LABEL_90;
  }
  if (v13)
  {
    if (v11 < v13 || (v40 = v12 + *((unsigned int *)v20 - 6) + v13, v40 > v11))
    {
      if (!a4)
        goto LABEL_15;
      v14 = CFSTR("CPBitmapErrorDomain");
      v15 = "Invalid colorSpace plist size";
    }
    else
    {
      width = *((unsigned int *)v20 - 5);
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v41 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v20[-v40], v13, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      if (!v41)
      {
        if (!a4)
          goto LABEL_15;
        v14 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
        v15 = "Could not allocate colorSpaceData";
        v16 = a4;
        v17 = 12;
        goto LABEL_14;
      }
      cfa = v41;
      allocatora = (CFAllocatorRef)CFPropertyListCreateWithData(allocator, v41, 0, 0, 0);
      CFRelease(cfa);
      if (allocatora)
      {
        *(_QWORD *)&v97 = CGColorSpaceCreateWithPropertyList(allocatora);
        CFRelease(allocatora);
        v25 = width;
        if ((_QWORD)v97)
          goto LABEL_52;
        if (!a4)
        {
          Mutable = 0;
          goto LABEL_18;
        }
        v14 = CFSTR("CPBitmapErrorDomain");
        v15 = "Invalid colorSpace plist";
      }
      else
      {
        if (!a4)
          goto LABEL_15;
        v14 = CFSTR("CPBitmapErrorDomain");
        v15 = "Invalid colorSpace plist data";
      }
    }
    v16 = a4;
    v17 = 8;
LABEL_14:
    __CPBitmapSetErrorIfNecessary(v16, v14, v17, v15);
    goto LABEL_15;
  }
LABEL_52:
  widtha = v25;
  if (!__CPBitmapGetImageInfoForFormat(v24, v25, v23, (uint64_t)&v97, v27, a3 & 1))
  {
    if (!a4)
      goto LABEL_15;
    v14 = CFSTR("CPBitmapErrorDomain");
    v15 = "Invalid bitmap format in file";
    v16 = a4;
    v17 = 3;
    goto LABEL_14;
  }
  v42 = v99;
  if (!is_mul_ok(v99, v23))
    goto LABEL_67;
  if (!is_mul_ok((v77 - 1), *((unint64_t *)&v99 + 1)))
    goto LABEL_67;
  v43 = (v77 - 1) * *((_QWORD *)&v99 + 1);
  v44 = __CFADD__(v43, v99 * v23);
  v45 = v43 + v99 * v23;
  if (v44)
    goto LABEL_67;
  v44 = __CFADD__(v45, v13);
  v46 = v45 + v13;
  if (v44)
    goto LABEL_67;
  v44 = __CFADD__(v46, length);
  v47 = v46 + length;
  if (v44)
    goto LABEL_67;
  v44 = __CFADD__(v47, v75);
  v48 = v47 + v75;
  if (v44)
    goto LABEL_67;
  v66 = *((_QWORD *)&v99 + 1);
  size = v99 * v23;
  if (v11 != v48)
    goto LABEL_67;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v49 = 0;
  v65 = v98;
  space = (CGColorSpace *)v97;
  bitmapInfo = v100;
  v50 = v77;
  while (1)
  {
    cf = (CFTypeRef)v49;
    v51 = CPBitmapDataWithOffsetCreate(a1, v49);
    v52 = CGDataProviderCreateDirect(v51, size, &__CPBitmapDataWithOffsetDirectProviderCallbacks);
    allocatorb = v52;
    if (v24 == 5)
    {
      *(_OWORD *)decode = xmmword_18EB490A0;
      v53 = CGImageMaskCreate(widtha, v23, v65, *((size_t *)&v65 + 1), v42, v52, decode, 0);
    }
    else
    {
      v53 = CGImageCreate(widtha, v23, v65, *((size_t *)&v65 + 1), v42, space, bitmapInfo, v52, 0, 1, kCGRenderingIntentDefault);
    }
    v54 = v53;
    CGDataProviderRelease(allocatorb);
    if (!v54)
      break;
    CFArrayAppendValue(Mutable, v54);
    CGImageRelease(v54);
    v49 = (uint64_t)cf + v66;
    if (!--v50)
      goto LABEL_95;
  }
  if (a4)
    __CPBitmapSetErrorIfNecessary(a4, CFSTR("CPBitmapErrorDomain"), 6, "Could not create image from data");
LABEL_99:
  if (Mutable && CFArrayGetCount(Mutable) != v77)
  {
    CFRelease(Mutable);
    goto LABEL_15;
  }
LABEL_16:
  if ((_QWORD)v97)
    CGColorSpaceRelease((CGColorSpaceRef)v97);
LABEL_18:
  if (*((_QWORD *)&v97 + 1))
    CGColorSpaceRelease(*((CGColorSpaceRef *)&v97 + 1));
  return Mutable;
}

const UInt8 *CPBitmapDataWithOffsetGetBytePtr(uint64_t a1)
{
  return &CFDataGetBytePtr(*(CFDataRef *)a1)[*(_QWORD *)(a1 + 8)];
}

void CPBitmapDataWithOffsetRelease(CFTypeRef *a1)
{
  CFRelease(*a1);
  free(a1);
}

_QWORD *CPBitmapDataWithOffsetCreate(const void *a1, uint64_t a2)
{
  _QWORD *v4;

  v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1060040C2E02434uLL);
  *v4 = CFRetain(a1);
  v4[1] = a2;
  return v4;
}

uint64_t __CPBitmapGetImageInfoForFormat(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGColorSpaceRef DeviceGray;
  uint64_t v19;
  size_t NumberOfComponents;

  result = 0;
  if (a5)
    v8 = 16;
  else
    v8 = 8;
  switch(a1)
  {
    case 0:
      if (a5)
        v12 = 0x3FFFFFFFFFFFFFF0;
      else
        v12 = 0x3FFFFFFFFFFFFFF8;
      *(_QWORD *)(a4 + 8) = CGColorSpaceCreateDeviceRGB();
      *(_QWORD *)(a4 + 32) = 4 * (v12 & (v8 + a2 - 1));
      *(_OWORD *)(a4 + 16) = xmmword_18EB49090;
      v13 = 8198;
      goto LABEL_26;
    case 1:
      if (a5)
        v15 = 0x3FFFFFFFFFFFFFF0;
      else
        v15 = 0x3FFFFFFFFFFFFFF8;
      *(_QWORD *)(a4 + 8) = CGColorSpaceCreateDeviceRGB();
      *(_QWORD *)(a4 + 32) = 4 * (v15 & (v8 + a2 - 1));
      *(_OWORD *)(a4 + 16) = xmmword_18EB49090;
      if (a6)
        v13 = 8198;
      else
        v13 = 8194;
      goto LABEL_26;
    case 2:
      if (a5)
        v16 = 0x7FFFFFFFFFFFFFF0;
      else
        v16 = 0x7FFFFFFFFFFFFFF8;
      *(_QWORD *)(a4 + 8) = CGColorSpaceCreateDeviceRGB();
      *(_QWORD *)(a4 + 32) = 2 * (v16 & (v8 + a2 - 1));
      *(_OWORD *)(a4 + 16) = xmmword_18EB49080;
      v13 = 4102;
      goto LABEL_26;
    case 3:
      if (a5)
        v17 = -16;
      else
        v17 = -8;
      DeviceGray = CGColorSpaceCreateDeviceGray();
      v13 = 0;
      *(_QWORD *)(a4 + 8) = DeviceGray;
      *(_QWORD *)(a4 + 32) = v17 & (v8 + a2 - 1);
      *(int64x2_t *)(a4 + 16) = vdupq_n_s64(8uLL);
      goto LABEL_26;
    case 5:
      v19 = -8;
      if (a5)
        v19 = -16;
      *(_QWORD *)(a4 + 32) = v19 & (v8 + a2 - 1);
      *(int64x2_t *)(a4 + 16) = vdupq_n_s64(8uLL);
      v13 = 7;
LABEL_26:
      *(_DWORD *)(a4 + 48) = v13;
      if (*(_QWORD *)a4)
      {
        NumberOfComponents = CGColorSpaceGetNumberOfComponents(*(CGColorSpaceRef *)a4);
        if (NumberOfComponents != CGColorSpaceGetNumberOfComponents(*(CGColorSpaceRef *)(a4 + 8)))
          return 0;
      }
      else
      {
        *(_QWORD *)a4 = CGColorSpaceRetain(*(CGColorSpaceRef *)(a4 + 8));
      }
      *(_QWORD *)(a4 + 40) = (*(_QWORD *)(a4 + 32) * a3 + 4095) & 0xFFFFFFFFFFFFF000;
      return 1;
    default:
      return result;
  }
}

uint64_t CPBitmapWriterGetTypeID()
{
  if (CPBitmapWriterGetTypeID_once != -1)
    dispatch_once(&CPBitmapWriterGetTypeID_once, &__block_literal_global_6);
  return CPBitmapWriterGetTypeID_typeID;
}

void CPBitmapWriterCreate(unsigned int a1, const __CFData *a2, const __CFString *a3, int a4, CFErrorRef *a5)
{
  char *v5;

  if (a1 == 6)
  {
    if (!a5)
      return;
    v5 = "Cannot serialize kCPBitmapFormatATX_4x4_PreTwiddled with this constructor - use CPBitmapWriterCreateWithPath instead";
    goto LABEL_7;
  }
  if (a1 != 4)
  {
    CPBitmapWriterCreateWithPath(a3, a1, a4, 1uLL, a2, a5);
    return;
  }
  if (a5)
  {
    v5 = "Cannot serialize kCPBitmapFormatKTX_4x4 with this constructor - use CPBitmapWriterCreateWithPath instead";
LABEL_7:
    __CPBitmapSetErrorIfNecessary(a5, CFSTR("CPBitmapErrorDomain"), 3, v5);
  }
}

double CPBitmapWriterCreateWithFileDescriptor(int a1, unsigned int a2, int a3, unint64_t a4, CFDataRef Data, CFErrorRef *a6)
{
  const __CFString *v9;
  char *v10;
  CFErrorRef *v11;
  CFIndex v12;
  double result;
  dispatch_queue_t v17;
  NSObject *v18;
  uint64_t Instance;
  const __CFString *v20;
  int *v21;

  if (a1 == -1)
  {
    if (!a6)
      return result;
    v9 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v10 = "Bad file descriptor";
    v11 = a6;
    v12 = 9;
    goto LABEL_11;
  }
  if (a2 >= 8)
  {
    if (!a6)
      return result;
    v9 = CFSTR("CPBitmapErrorDomain");
    v10 = "Requested bitmap format is unknown";
    goto LABEL_10;
  }
  if (HIDWORD(a4))
  {
    if (!a6)
      return result;
    v9 = CFSTR("CPBitmapErrorDomain");
    v10 = "Count of images is too high";
LABEL_10:
    v11 = a6;
    v12 = 3;
LABEL_11:
    __CPBitmapSetErrorIfNecessary(v11, v9, v12, v10);
    return result;
  }
  v17 = dispatch_queue_create(0, 0);
  if (v17)
  {
    v18 = v17;
    if (Data
      && (Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Data, kCFPropertyListBinaryFormat_v1_0, 0, a6)) == 0)
    {
      if (a6)
      {
        v20 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
        v21 = __error();
        __CPBitmapSetErrorIfNecessary(a6, v20, *v21, "Could not encode info dictionary");
      }
      dispatch_release(v18);
    }
    else
    {
      if (CPBitmapWriterGetTypeID_once != -1)
        dispatch_once(&CPBitmapWriterGetTypeID_once, &__block_literal_global_6);
      Instance = _CFRuntimeCreateInstance();
      if (Instance)
      {
        *(_QWORD *)(Instance + 16) = v18;
        *(_DWORD *)(Instance + 24) = a1;
        *(_DWORD *)(Instance + 28) = a2;
        *(_DWORD *)(Instance + 32) = a3;
        *(_QWORD *)(Instance + 40) = a4;
        *(_QWORD *)(Instance + 48) = Data;
        *(_QWORD *)(Instance + 56) = 0;
        *(_WORD *)(Instance + 64) = 0;
        result = 0.0;
        *(_OWORD *)(Instance + 72) = 0u;
        *(_OWORD *)(Instance + 88) = 0u;
        *(_OWORD *)(Instance + 104) = 0u;
        *(_QWORD *)(Instance + 120) = 0;
      }
      else
      {
        if (a6)
          __CPBitmapSetErrorIfNecessary(a6, (const __CFString *)*MEMORY[0x1E0C9AFD0], 12, "Could not allocate the writer");
        dispatch_release(v18);
        if (Data)
          CFRelease(Data);
      }
    }
  }
  else if (a6)
  {
    v9 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v10 = "Could not allocate the writer queue";
    v11 = a6;
    v12 = 12;
    goto LABEL_11;
  }
  return result;
}

void finalizeWriter(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;

  v2 = *(NSObject **)(a1 + 16);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 56);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 112);
  if (v5)
    _Block_release(v5);
  v6 = *(_QWORD *)(a1 + 120);
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);
    _Block_release(*(const void **)(a1 + 120));
  }
  if (*(_BYTE *)(a1 + 65))
  {
    v7 = *(_DWORD *)(a1 + 24);
    if (v7 != -1)
      close(v7);
  }
  v8 = *(void **)(a1 + 72);
  if (v8)
    free(v8);
  v9 = *(void **)(a1 + 80);
  if (v9)
    free(v9);
}

ssize_t __CPCGDestinationKTXDataConsumerPutBytes(uint64_t a1, const void *a2, size_t a3)
{
  ssize_t result;
  int *v5;
  int v6;

  if (*(_DWORD *)(a1 + 8))
    return 0;
  result = pwrite(*(_DWORD *)(*(_QWORD *)a1 + 24), a2, a3, *(_QWORD *)(a1 + 16));
  if (result < 0)
  {
    v5 = __error();
    result = 0;
    v6 = *v5;
    if (!v6)
      v6 = 5;
    *(_DWORD *)(a1 + 8) = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 16) += result;
  }
  return result;
}

CGImageRef create_image_with_memory(const void *a1, uint64_t a2, int a3)
{
  _DWORD *v6;
  CGDataProvider *v7;
  unsigned int v8;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v10;
  size_t v11;
  size_t v12;
  CGImageRef v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  CGColorSpace *v18;
  CGColor *v19;
  CGBitmapInfo v20;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v6 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  *v6 = a3;
  v7 = CGDataProviderCreateWithData(v6, a1, *(_QWORD *)(a2 + 8), (CGDataProviderReleaseDataCallback)release_munmap);
  v8 = *(unsigned __int8 *)(a2 + 40);
  if (v8 < 3)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    goto LABEL_5;
  }
  if (v8 - 3 < 2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceGray();
LABEL_5:
    v10 = DeviceRGB;
    v8 = *(unsigned __int8 *)(a2 + 40);
    goto LABEL_6;
  }
  if (v8 != 5)
  {
    v10 = 0;
LABEL_6:
    if (v8 > 5)
    {
      v11 = 0;
    }
    else
    {
      if (v8 == 2)
      {
        v11 = 5;
        goto LABEL_21;
      }
      v11 = 8;
    }
    if (v8 > 5)
    {
      v12 = 0;
      goto LABEL_23;
    }
    if (((1 << v8) & 3) != 0)
    {
      v12 = 32;
      goto LABEL_23;
    }
    if (((1 << v8) & 0xC) == 0)
    {
      v12 = 8;
LABEL_23:
      if (v8 > 5)
        v20 = 0;
      else
        v20 = dword_18EB490E0[(char)v8];
      v13 = CGImageCreate(*(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), v11, v12, *(_QWORD *)(a2 + 32), v10, v20, v7, 0, 0, kCGRenderingIntentDefault);
      CGColorSpaceRelease(v10);
      goto LABEL_27;
    }
LABEL_21:
    v12 = 16;
    goto LABEL_23;
  }
  v13 = CGImageMaskCreate(*(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), 8uLL, 8uLL, *(_QWORD *)(a2 + 32), v7, create_image_with_memory_decode, 0);
  if (v13 && *(_BYTE *)(a2 + 40) == 5)
  {
    LOBYTE(v14) = *(_BYTE *)(a2 + 41);
    v16 = (double)v14 / 255.0;
    LOBYTE(v15) = *(_BYTE *)(a2 + 42);
    v17 = (double)v15 / 255.0;
    components[0] = v16;
    components[1] = v17;
    LOBYTE(v16) = *(_BYTE *)(a2 + 43);
    LOBYTE(v17) = *(_BYTE *)(a2 + 44);
    components[2] = (double)*(unint64_t *)&v16 / 255.0;
    components[3] = (double)*(unint64_t *)&v17 / 255.0;
    v18 = CGColorSpaceCreateDeviceRGB();
    v19 = CGColorCreate(v18, components);
    CGImageSetProperty();
    CGColorSpaceRelease(v18);
    CGColorRelease(v19);
  }
LABEL_27:
  CGDataProviderRelease(v7);
  return v13;
}

void release_munmap(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  size_t v6;

  v4 = *a1;
  v5 = (void *)(a2 - v4);
  v6 = v4 + a3;
  munlock((const void *)(a2 - v4), v4 + a3);
  munmap(v5, v6);
  free(a1);
}

void *_CPLog(uint64_t a1, const void *a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  _CPLog_os_log_shim();
  if (os_log_shim_legacy_logging_enabled())
    _logV(a1, a2, 0, 0, 0, a3, a4, &a9);
  return _releaseObfuscatedStrings();
}

uint64_t _CPLog_os_log_shim()
{
  return os_log_shim_with_CFString();
}

void _logV(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const __CFString *a7, va_list a8)
{
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  unint64_t v20;
  unsigned int v21;
  int v22;
  unint64_t v23;
  CFAbsoluteTime Current;
  const __CFDate *v25;
  CFStringRef v26;
  __CFString *StandardConsoleLogLine;
  CFStringRef StandardFileLogLine;
  __CFString *v29;
  const __CFString *v30;
  __asl_object_s *v31;
  unsigned int i;
  unint64_t v33;
  _BOOL4 v34;
  unint64_t v35;
  unint64_t v36;
  int j;
  unint64_t v38;
  int v39;
  const char *CStringPtr;
  unsigned __int16 *UTF8StringFromString;
  int v42;
  __CFString *v43;
  asl_object_t v44;
  unint64_t *v45;
  unint64_t v46;
  const __CFString *v47;
  CFDataRef ExternalRepresentation;
  _QWORD *WorkSettingsFromSettings;
  NSObject *v50;
  __CFString *v51;
  __CFString *v52;
  unint64_t v53;
  uint64_t v54;
  const __CFString *v57;
  _BOOL4 v59;
  _QWORD block[6];

  v13 = _settingsForFacility(a2);
  v14 = v13;
  atomic_store(1u, (unsigned __int8 *)(v13 + 165));
  v15 = atomic_load((unint64_t *)(v13 + 64));
  v16 = atomic_load((unint64_t *)(v13 + 72));
  v17 = atomic_load((unint64_t *)(v13 + 16));
  v18 = atomic_load((unsigned int *)(v13 + 52));
  v19 = atomic_load((unsigned int *)(v13 + 52));
  if (v19 == -3)
  {
    v20 = v13;
    do
    {
      v18 = atomic_load((unsigned int *)(v20 + 44));
      if (v18 != -2)
        break;
      v20 = atomic_load(&_logFileSettings);
      v18 = atomic_load((unsigned int *)(v20 + 52));
      v21 = atomic_load((unsigned int *)(v20 + 52));
    }
    while (v21 == -3);
  }
  v22 = atomic_load((unsigned int *)(v13 + 56));
  if (v22 == -3)
  {
    v23 = v13;
    do
    {
      v22 = atomic_load((unsigned int *)(v23 + 48));
      if (v22 != -2)
        break;
      v23 = atomic_load(&_logFileSettings);
      v22 = atomic_load((unsigned int *)(v23 + 56));
    }
    while (v22 == -3);
  }
  if (v18 >= (int)a1 || v22 >= (int)a1)
  {
    v53 = v17;
    v54 = a6;
    Current = CFAbsoluteTimeGetCurrent();
    v25 = CFDateCreate(0, Current);
    v26 = CFStringCreateWithFormatAndArguments(0, 0, a7, a8);
    if (!v26)
      v26 = CFStringCreateWithFormat(0, 0, CFSTR("Log message cannot be formatted. Format string: %@"), a7);
    if (v18 >= (int)a1 && v22 >= (int)a1 && !v16 && !v15)
    {
      StandardConsoleLogLine = _createStandardConsoleLogLine(a1, (uint64_t)a2, a3, a4, a5, (uint64_t)v26);
      goto LABEL_18;
    }
    if (v18 < (int)a1)
    {
      v29 = 0;
    }
    else if (v16)
    {
      v29 = (__CFString *)(*(uint64_t (**)(unint64_t, uint64_t, const __CFDate *, unint64_t, const void *, uint64_t, uint64_t, uint64_t, uint64_t, CFStringRef))(v16 + 16))(v16, a1, v25, v53, a2, a3, a4, a5, v54, v26);
    }
    else
    {
      v29 = _createStandardConsoleLogLine(a1, (uint64_t)a2, a3, a4, a5, (uint64_t)v26);
    }
    if (v22 < (int)a1)
    {
      v30 = 0;
      StandardConsoleLogLine = v29;
    }
    else
    {
      StandardConsoleLogLine = v29;
      if (v15)
      {
        StandardFileLogLine = (CFStringRef)(*(uint64_t (**)(unint64_t, uint64_t, const __CFDate *, unint64_t, const void *, uint64_t, uint64_t, uint64_t, uint64_t, CFStringRef))(v15 + 16))(v15, a1, v25, v53, a2, a3, a4, a5, v54, v26);
        goto LABEL_27;
      }
      if (v29)
      {
LABEL_18:
        StandardFileLogLine = _createStandardFileLogLine(v25, (uint64_t)StandardConsoleLogLine);
LABEL_27:
        v30 = StandardFileLogLine;
        goto LABEL_29;
      }
      v51 = _createStandardConsoleLogLine(a1, (uint64_t)a2, a3, a4, a5, (uint64_t)v26);
      if (v51)
      {
        v52 = v51;
        v30 = _createStandardFileLogLine(v25, (uint64_t)v51);
        CFRelease(v52);
        StandardConsoleLogLine = 0;
      }
      else
      {
        StandardConsoleLogLine = 0;
        v30 = 0;
      }
    }
LABEL_29:
    if (v25)
      CFRelease(v25);
    if (v26)
      CFRelease(v26);
    if (StandardConsoleLogLine)
    {
      v31 = *(__asl_object_s **)(v14 + 104);
      for (i = atomic_load((unsigned int *)(v14 + 156)); !i; i = atomic_load((unsigned int *)(v33 + 156)))
        v33 = atomic_load(&_logFileSettings);
      v34 = i == 2;
      if (*(_QWORD *)(v14 + 88))
      {
        v36 = atomic_load((unint64_t *)(v14 + 88));
        if (!v30)
        {
          v59 = 0;
          v35 = 0;
          v39 = 1;
          goto LABEL_43;
        }
      }
      else
      {
        v35 = 0;
        if (!v30)
        {
          v59 = 0;
          v39 = 1;
          goto LABEL_48;
        }
        v36 = 0;
      }
    }
    else
    {
      if (!v30)
      {
        CFLog();
        return;
      }
      v31 = 0;
      v34 = 0;
      v36 = 0;
    }
    for (j = *(_DWORD *)(v14 + 160); !j; j = *(_DWORD *)(v38 + 160))
      v38 = atomic_load(&_logFileSettings);
    v59 = j == 2;
    v39 = 0;
    if (*(_QWORD *)(v14 + 96))
      v35 = atomic_load((unint64_t *)(v14 + 96));
    else
      v35 = 0;
LABEL_43:
    if (!StandardConsoleLogLine
      || v36
      && !(*(unsigned int (**)(unint64_t, uint64_t, __CFString *, uint64_t, _QWORD))(v36 + 16))(v36, a1, StandardConsoleLogLine, v54, 0))
    {
      goto LABEL_63;
    }
LABEL_48:
    CStringPtr = CFStringGetCStringPtr(StandardConsoleLogLine, 0x8000100u);
    UTF8StringFromString = (unsigned __int16 *)CStringPtr;
    if (!CStringPtr)
      UTF8StringFromString = _createUTF8StringFromString(StandardConsoleLogLine);
    if (v34)
      v42 = a1;
    else
      v42 = 5;
    if (v31)
      goto LABEL_60;
    v57 = v30;
    v43 = StandardConsoleLogLine;
    v44 = asl_new(0);
    v31 = v44;
    v45 = (unint64_t *)(v14 + 104);
    while (1)
    {
      v46 = __ldaxr(v45);
      if (v46)
        break;
      if (!__stlxr((unint64_t)v44, v45))
        goto LABEL_59;
    }
    __clrex();
    MEMORY[0x193FF7154](v44);
    v31 = (__asl_object_s *)v46;
LABEL_59:
    StandardConsoleLogLine = v43;
    v30 = v57;
    if (v31)
    {
LABEL_60:
      if (_aslClient_once != -1)
        dispatch_once(&_aslClient_once, &__block_literal_global_107);
      asl_log((asl_object_t)_aslClient_client, v31, v42, "%s", (const char *)UTF8StringFromString);
      if (CStringPtr)
      {
LABEL_63:
        if ((v39 & 1) != 0)
          goto LABEL_76;
LABEL_67:
        if (v35
          && !(*(unsigned int (**)(unint64_t, uint64_t, const __CFString *, uint64_t, _QWORD))(v35 + 16))(v35, a1, v30, v54, 0))
        {
          goto LABEL_76;
        }
        if (v59)
        {
          v47 = CFStringCreateWithFormat(0, 0, CFSTR("%@\n"), v30);
          ExternalRepresentation = CFStringCreateExternalRepresentation(0, v47, 0x8000100u, 0);
          CFRelease(v47);
          if (ExternalRepresentation)
          {
LABEL_71:
            WorkSettingsFromSettings = _createWorkSettingsFromSettings(v14);
            atomic_store(0, (unsigned __int8 *)(v14 + 164));
            if (_workGroup_once != -1)
              dispatch_once(&_workGroup_once, &__block_literal_global_112_0);
            v50 = _workGroup_group;
            if (_workQueue_once != -1)
              dispatch_once(&_workQueue_once, &__block_literal_global_113);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = ___performLog_block_invoke;
            block[3] = &__block_descriptor_48_e5_v8__0l;
            block[4] = WorkSettingsFromSettings;
            block[5] = ExternalRepresentation;
            dispatch_group_async(v50, (dispatch_queue_t)_workQueue_queue, block);
LABEL_76:
            if (!StandardConsoleLogLine)
              goto LABEL_78;
            goto LABEL_77;
          }
        }
        else
        {
          ExternalRepresentation = CFStringCreateExternalRepresentation(0, v30, 0x8000100u, 0);
          if (ExternalRepresentation)
            goto LABEL_71;
        }
        CFLog();
        if (!StandardConsoleLogLine)
        {
LABEL_78:
          if (v30)
            CFRelease(v30);
          return;
        }
LABEL_77:
        CFRelease(StandardConsoleLogLine);
        goto LABEL_78;
      }
    }
    else
    {
      CFLog();
      if (CStringPtr)
        goto LABEL_63;
    }
    free(UTF8StringFromString);
    if (v39)
      goto LABEL_77;
    goto LABEL_67;
  }
}

void *_releaseObfuscatedStrings()
{
  void *result;

  if (_obfuscatedStringKey_onceToken != -1)
    dispatch_once(&_obfuscatedStringKey_onceToken, &__block_literal_global_158);
  result = pthread_getspecific(_obfuscatedStringKey_key);
  if (result)
  {
    CFRelease(result);
    if (_obfuscatedStringKey_onceToken != -1)
      dispatch_once(&_obfuscatedStringKey_onceToken, &__block_literal_global_158);
    return (void *)pthread_setspecific(_obfuscatedStringKey_key, 0);
  }
  return result;
}

void *_CPLogLine(uint64_t a1, const void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  char *v16;
  uint64_t v17;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  _CPLog_os_log_shim();
  if (os_log_shim_legacy_logging_enabled())
  {
    v16 = strrchr(a3, 47);
    if (v16)
      v17 = (uint64_t)(v16 + 1);
    else
      v17 = (uint64_t)a3;
    _logV(a1, a2, v17, a4, a5, a6, a7, &a9);
  }
  return _releaseObfuscatedStrings();
}

void *CPLogV(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const __CFString *a7, va_list a8)
{
  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  _CPLog_os_log_shim();
  if (os_log_shim_legacy_logging_enabled())
    _logV(a1, a2, a3, a4, a5, a6, a7, a8);
  return _releaseObfuscatedStrings();
}

void CPLoggingAppendDataToLogFile(signed int a1, const void *a2, CFDataRef theData, void *a4)
{
  unint64_t v8;
  uint64_t v9;
  signed int v10;
  unint64_t v11;
  NSObject *v12;
  _QWORD *v13;
  CFDataRef Copy;
  _QWORD *WorkSettingsFromSettings;
  NSObject *v16;
  _QWORD block[7];
  _QWORD v18[5];
  _QWORD v19[5];

  if (_init_once == -1)
  {
    if (!theData)
    {
LABEL_21:
      if (!a4)
        return;
      if (_callbackQueue_onceToken != -1)
        dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_108);
      v12 = _callbackQueue_queue;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __CPLoggingAppendDataToLogFile_block_invoke;
      v19[3] = &unk_1E2881F10;
      v19[4] = a4;
      v13 = v19;
      goto LABEL_25;
    }
  }
  else
  {
    dispatch_once(&_init_once, &__block_literal_global_44);
    if (!theData)
      goto LABEL_21;
  }
  if (!CFDataGetLength(theData))
    goto LABEL_21;
  v8 = _settingsForFacility(a2);
  v9 = v8;
  v10 = atomic_load((unsigned int *)(v8 + 56));
  if (v10 == -3)
  {
    v11 = v8;
    do
    {
      v10 = atomic_load((unsigned int *)(v11 + 48));
      if (v10 != -2)
        break;
      v11 = atomic_load(&_logFileSettings);
      v10 = atomic_load((unsigned int *)(v11 + 56));
    }
    while (v10 == -3);
  }
  if (v10 < a1)
  {
    if (!a4)
      return;
    if (_callbackQueue_onceToken != -1)
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_108);
    v12 = _callbackQueue_queue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __CPLoggingAppendDataToLogFile_block_invoke_2;
    v18[3] = &unk_1E2881F10;
    v18[4] = a4;
    v13 = v18;
LABEL_25:
    dispatch_async(v12, v13);
    return;
  }
  Copy = CFDataCreateCopy(0, theData);
  if (a4)
    a4 = _Block_copy(a4);
  WorkSettingsFromSettings = _createWorkSettingsFromSettings(v9);
  atomic_store(0, (unsigned __int8 *)(v9 + 164));
  if (_workGroup_once != -1)
    dispatch_once(&_workGroup_once, &__block_literal_global_112_0);
  v16 = _workGroup_group;
  if (_workQueue_once != -1)
    dispatch_once(&_workQueue_once, &__block_literal_global_113);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CPLoggingAppendDataToLogFile_block_invoke_3;
  block[3] = &unk_1E2881F38;
  block[5] = WorkSettingsFromSettings;
  block[6] = Copy;
  block[4] = a4;
  dispatch_group_async(v16, (dispatch_queue_t)_workQueue_queue, block);
}

unint64_t _settingsForFacility(const void *a1)
{
  unint64_t v1;
  const __CFArray *v3;
  CFRange v5;

  v1 = atomic_load(&_logFileSettings);
  if (a1)
  {
    v1 = atomic_load((unint64_t *)v1);
    if (v1)
    {
      while (1)
      {
        v3 = *(const __CFArray **)(v1 + 8);
        if (v3)
        {
          v5.length = CFArrayGetCount(*(CFArrayRef *)(v1 + 8));
          v5.location = 0;
          if (CFArrayContainsValue(v3, v5, a1))
            break;
        }
        v1 = atomic_load((unint64_t *)v1);
        if (!v1)
          return atomic_load(&_logFileSettings);
      }
    }
    else
    {
      return atomic_load(&_logFileSettings);
    }
  }
  return v1;
}

_QWORD *_createWorkSettingsFromSettings(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t i;
  unint64_t v8;
  unsigned int j;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int k;
  unint64_t v16;
  int m;
  unint64_t v18;
  unsigned __int8 v19;

  v2 = malloc_type_calloc(0x50uLL, 1uLL, 0xD070C659uLL);
  v3 = v2;
  if (v2)
  {
    v4 = atomic_load((unint64_t *)(a1 + 8));
    *v2 = v4;
    v5 = atomic_load((unint64_t *)(a1 + 16));
    v2[1] = v5;
    v6 = atomic_load((unint64_t *)(a1 + 24));
    v2[2] = v6;
    for (i = atomic_load((unint64_t *)(a1 + 32)); i == -2; i = atomic_load((unint64_t *)(v8 + 32)))
      v8 = atomic_load(&_logFileSettings);
    v2[3] = i;
    for (j = atomic_load((unsigned int *)(a1 + 40)); j == -2; j = atomic_load((unsigned int *)(v10 + 40)))
      v10 = atomic_load(&_logFileSettings);
    *((_DWORD *)v2 + 8) = j;
    v11 = atomic_load((unint64_t *)(a1 + 64));
    v2[5] = v11;
    v12 = atomic_load((unint64_t *)(a1 + 80));
    v2[6] = v12;
    v13 = atomic_load((unint64_t *)(a1 + 96));
    v14 = *(_QWORD *)(a1 + 144);
    v2[7] = v13;
    v2[8] = v14;
    for (k = atomic_load((unsigned int *)(a1 + 152)); !k; k = atomic_load((unsigned int *)(v16 + 152)))
      v16 = atomic_load(&_logFileSettings);
    *((_BYTE *)v2 + 72) = k == 2;
    for (m = *(_DWORD *)(a1 + 160); !m; m = *(_DWORD *)(v18 + 160))
      v18 = atomic_load(&_logFileSettings);
    *((_BYTE *)v2 + 73) = m == 2;
    v19 = atomic_load((unsigned __int8 *)(a1 + 164));
    *((_BYTE *)v2 + 74) = v19;
  }
  else
  {
    CFLog();
  }
  return v3;
}

void _workQueueAppendDataToLogFile(uint64_t a1, const __CFData *a2)
{
  _QWORD *v3;
  double v4;
  const void *v5;
  CFAbsoluteTime Current;
  CFStringRef v7;
  unsigned int i;
  const __CFString *v9;
  int v10;
  int v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  unsigned __int16 *UTF8StringFromString;
  unint64_t Length;
  void *v17;
  void *v18;
  void *v19;
  const UInt8 *BytePtr;
  xpc_object_t v21;
  void *v22;
  const char *string;
  const UInt8 *v24;
  size_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  BOOL v31;
  int64_t value;
  _QWORD v34[5];
  _QWORD block[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;

  if (!a1 || (v3 = *(_QWORD **)(a1 + 64)) == 0)
  {
    CFLog();
    return;
  }
  if (*(uint64_t *)(a1 + 24) < 1)
    goto LABEL_10;
  if (*v3)
  {
    v4 = MEMORY[0x193FF67C4]();
    if (v4 < CFAbsoluteTimeGetCurrent())
    {
      v5 = **(const void ***)(a1 + 64);
      if (v5)
        CFRelease(v5);
      goto LABEL_8;
    }
LABEL_10:
    value = 0;
    goto LABEL_11;
  }
LABEL_8:
  Current = CFAbsoluteTimeGetCurrent();
  **(_QWORD **)(a1 + 64) = CFDateCreate(0, Current + 13.0);
  value = *(_QWORD *)(a1 + 24);
LABEL_11:
  v31 = 0;
  v7 = 0;
  for (i = 0; i < 3; ++i)
  {
    if (v7)
      CFRelease(v7);
    v9 = *(const __CFString **)(*(_QWORD *)(a1 + 64) + 8);
    if (!v9)
    {
      _workQueueRefreshUUIDForWorkSettings(a1);
      v9 = *(const __CFString **)(*(_QWORD *)(a1 + 64) + 8);
      if (!v9)
      {
        v27 = 0;
        v7 = 0;
        goto LABEL_48;
      }
    }
    v10 = *(unsigned __int8 *)(a1 + 74);
    v11 = *(unsigned __int8 *)(a1 + 72);
    v12 = *(int *)(a1 + 32);
    v13 = _workQueueCopyConnection();
    if (v13)
    {
      v14 = (void *)v13;
      UTF8StringFromString = _createUTF8StringFromString(v9);
      v36 = 0;
      v37 = &v36;
      v38 = 0x3052000000;
      v39 = __Block_byref_object_copy__1;
      v40 = __Block_byref_object_dispose__1;
      v41 = 0;
      Length = CFDataGetLength(a2);
      if (_workQueueCreateMemoryMapOfSize_currentSize >= Length && _workQueueCreateMemoryMapOfSize_currentXPCObject)
      {
        xpc_retain((xpc_object_t)_workQueueCreateMemoryMapOfSize_currentXPCObject);
      }
      else
      {
        if (_workQueueCreateMemoryMapOfSize_currentSize)
        {
          xpc_release((xpc_object_t)_workQueueCreateMemoryMapOfSize_currentXPCObject);
          _workQueueCreateMemoryMapOfSize_currentXPCObject = 0;
          munmap((void *)_workQueueCreateMemoryMapOfSize_currentRegion, _workQueueCreateMemoryMapOfSize_currentSize);
        }
        v17 = mmap(0, Length, 3, 4098, -1, 0);
        _workQueueCreateMemoryMapOfSize_currentRegion = (uint64_t)v17;
        if (v17 == (void *)-1)
        {
          v26 = __error();
          strerror(*v26);
          CFLog();
          v7 = 0;
          LODWORD(v18) = 0;
          _workQueueCreateMemoryMapOfSize_currentSize = 0;
          goto LABEL_40;
        }
        _workQueueCreateMemoryMapOfSize_currentSize = Length;
        _workQueueCreateMemoryMapOfSize_currentXPCObject = (uint64_t)xpc_shmem_create(v17, Length);
        xpc_retain((xpc_object_t)_workQueueCreateMemoryMapOfSize_currentXPCObject);
      }
      v18 = (void *)_workQueueCreateMemoryMapOfSize_currentRegion;
      if (_workQueueCreateMemoryMapOfSize_currentRegion)
      {
        v19 = (void *)_workQueueCreateMemoryMapOfSize_currentXPCObject;
        BytePtr = CFDataGetBytePtr(a2);
        memcpy(v18, BytePtr, Length);
        v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v21, "message", 2);
        xpc_dictionary_set_string(v21, "uuid", (const char *)UTF8StringFromString);
        xpc_dictionary_set_value(v21, "data", v19);
        xpc_dictionary_set_int64(v21, "length", Length);
        xpc_dictionary_set_BOOL(v21, "startnewfile", v10 != 0);
        xpc_dictionary_set_int64(v21, "sizecheck", value);
        xpc_dictionary_set_int64(v21, "maxfilecount", v12);
        xpc_dictionary_set_BOOL(v21, "wantscompressed", v11 != 0);
        xpc_release(v19);
        if (_waitForResponseQueue_once != -1)
          dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = ___workQueueLogToFileUUID_block_invoke;
        block[3] = &unk_1E2881868;
        block[4] = v14;
        block[5] = v21;
        dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, block);
        if (_waitForResponseSema_once != -1)
          dispatch_once(&_waitForResponseSema_once, &__block_literal_global_150);
        dispatch_semaphore_wait((dispatch_semaphore_t)_waitForResponseSema_sema, 0xFFFFFFFFFFFFFFFFLL);
        xpc_release(v21);
        if (_waitForResponseQueue_once != -1)
          dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = ___workQueueLogToFileUUID_block_invoke_2;
        v34[3] = &unk_1E28819F8;
        v34[4] = &v36;
        dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v34);
        v22 = (void *)v37[5];
        if (v22)
        {
          v31 = xpc_dictionary_get_BOOL(v22, "didcreate");
          string = xpc_dictionary_get_string((xpc_object_t)v37[5], "newfilepath");
          v24 = (const UInt8 *)string;
          if (string)
          {
            v25 = strlen(string);
            v7 = CFStringCreateWithBytes(0, v24, v25, 0x8000100u, 0);
          }
          else
          {
            v7 = 0;
          }
          LODWORD(v18) = xpc_dictionary_get_BOOL((xpc_object_t)v37[5], "retval");
          xpc_release((xpc_object_t)v37[5]);
        }
        else
        {
          CFLog();
          v7 = 0;
          LODWORD(v18) = 0;
        }
      }
      else
      {
        v7 = 0;
      }
LABEL_40:
      if (UTF8StringFromString)
        free(UTF8StringFromString);
      xpc_release(v14);
      _Block_object_dispose(&v36, 8);
      if ((_DWORD)v18)
      {
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        goto LABEL_48;
      }
      goto LABEL_45;
    }
    v7 = 0;
LABEL_45:
    v28 = *(_QWORD *)(a1 + 64);
    v29 = *(const void **)(v28 + 8);
    if (v29)
    {
      CFRelease(v29);
      v28 = *(_QWORD *)(a1 + 64);
    }
    v27 = 0;
    *(_QWORD *)(v28 + 8) = 0;
LABEL_48:
    if (v27)
      break;
  }
  if (i >= 3)
    CFLog();
  v30 = *(_QWORD *)(a1 + 48);
  if (v30 && v31)
    (*(void (**)(uint64_t, CFStringRef))(v30 + 16))(v30, v7);
  if (v7)
    CFRelease(v7);
}

void sub_18EB35DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CPLoggingSlurpFileIntoLogFile(signed int a1, const void *a2, const __CFString *a3, const __CFString *Copy, const __CFString *a5, void *a6)
{
  unint64_t v12;
  uint64_t v13;
  signed int v14;
  unint64_t v15;
  _QWORD *WorkSettingsFromSettings;
  NSObject *v17;
  _QWORD v18[9];
  _QWORD block[5];

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v12 = _settingsForFacility(a2);
  v13 = v12;
  v14 = atomic_load((unsigned int *)(v12 + 56));
  if (v14 == -3)
  {
    v15 = v12;
    do
    {
      v14 = atomic_load((unsigned int *)(v15 + 48));
      if (v14 != -2)
        break;
      v15 = atomic_load(&_logFileSettings);
      v14 = atomic_load((unsigned int *)(v15 + 56));
    }
    while (v14 == -3);
  }
  if (v14 >= a1)
  {
    if (Copy)
      Copy = CFStringCreateCopy(0, Copy);
    if (a3)
      a3 = CFStringCreateCopy(0, a3);
    if (a5)
      a5 = CFStringCreateCopy(0, a5);
    if (a6)
      a6 = _Block_copy(a6);
    WorkSettingsFromSettings = _createWorkSettingsFromSettings(v13);
    atomic_store(0, (unsigned __int8 *)(v13 + 164));
    if (_workGroup_once != -1)
      dispatch_once(&_workGroup_once, &__block_literal_global_112_0);
    v17 = _workGroup_group;
    if (_workQueue_once != -1)
      dispatch_once(&_workQueue_once, &__block_literal_global_113);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __CPLoggingSlurpFileIntoLogFile_block_invoke_2;
    v18[3] = &unk_1E2881F60;
    v18[6] = Copy;
    v18[7] = a3;
    v18[8] = a5;
    v18[4] = a6;
    v18[5] = WorkSettingsFromSettings;
    dispatch_group_async(v17, (dispatch_queue_t)_workQueue_queue, v18);
  }
  else if (a6)
  {
    if (_callbackQueue_onceToken != -1)
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_108);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __CPLoggingSlurpFileIntoLogFile_block_invoke;
    block[3] = &unk_1E2881F10;
    block[4] = a6;
    dispatch_async((dispatch_queue_t)_callbackQueue_queue, block);
  }
}

void sub_18EB365DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void *_CPLogObfusc(void *a1)
{
  if (atomic_load(_shouldObfuscate))
    return _obfuscatedRepresentation(a1);
  return a1;
}

void *_obfuscatedRepresentation(void *a1)
{
  void *v1;
  id v2;
  CFTypeID v3;
  const __CFString *StringWithNumber;
  const __CFString *v5;
  unsigned __int16 *UTF8StringFromString;
  char *v7;
  CC_LONG v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  void *Mutable;
  CC_SHA1_CTX v14;
  UInt8 bytes[2];
  _BYTE v16[5];
  unsigned __int8 md[20];
  uint64_t v18;

  v1 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v1 = (void *)CFRetain(objc_msgSend(v1, sel_CPSafeDescription));
      if (!v1)
        goto LABEL_27;
LABEL_20:
      if (_obfuscatedStringKey_onceToken != -1)
        dispatch_once(&_obfuscatedStringKey_onceToken, &__block_literal_global_158);
      Mutable = pthread_getspecific(_obfuscatedStringKey_key);
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        if (_obfuscatedStringKey_onceToken != -1)
          dispatch_once(&_obfuscatedStringKey_onceToken, &__block_literal_global_158);
        pthread_setspecific(_obfuscatedStringKey_key, Mutable);
      }
      CFArrayAppendValue((CFMutableArrayRef)Mutable, v1);
      CFRelease(v1);
      goto LABEL_27;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v1 = (void *)_obfuscatedRepresentation(objc_msgSend(v1, sel_CPObfuscatedDescriptionObject));
    }
    else
    {
      v3 = CFGetTypeID(v1);
      if (v3 == CFNumberGetTypeID())
      {
        if (_obfuscatedRepresentation_onceToken != -1)
          dispatch_once(&_obfuscatedRepresentation_onceToken, &__block_literal_global_161);
        StringWithNumber = CFNumberFormatterCreateStringWithNumber(0, (CFNumberFormatterRef)_obfuscatedRepresentation_numberFormatter, (CFNumberRef)v1);
      }
      else
      {
        StringWithNumber = (const __CFString *)CFRetain(objc_msgSend(v1, sel_description));
      }
      v5 = StringWithNumber;
      if (StringWithNumber)
      {
        UTF8StringFromString = _createUTF8StringFromString(StringWithNumber);
        if (UTF8StringFromString)
        {
          v7 = (char *)UTF8StringFromString;
          memset(&v14, 0, sizeof(v14));
          CC_SHA1_Init(&v14);
          CC_SHA1_Update(&v14, &_createHashRepresentationOfString_seed, 4u);
          v8 = strlen(v7);
          CC_SHA1_Update(&v14, v7, v8);
          CC_SHA1_Final(md, &v14);
          v9 = 0;
          bytes[0] = 91;
          v10 = v16;
          do
          {
            v11 = md[v9];
            *(v10 - 1) = _createHashRepresentationOfString_hexNibble[v11 >> 4];
            *v10 = _createHashRepresentationOfString_hexNibble[v11 & 0xF];
            v10 += 2;
            ++v9;
          }
          while (v9 != 4);
          *(_WORD *)(v10 - 1) = 93;
          v1 = (void *)CFStringCreateWithBytes(0, bytes, 10, 0x8000100u, 0);
          free(v7);
        }
        else
        {
          v1 = 0;
        }
        CFRelease(v5);
        if (!v1)
          goto LABEL_27;
        goto LABEL_20;
      }
      v1 = 0;
    }
LABEL_27:
    objc_msgSend(v2, "drain");
  }
  return v1;
}

void CPLoggingAddCustomLogConfiguration(const __CFArray *a1, CFDictionaryRef theDict)
{
  const __CFNumber *v3;
  const __CFNumber *v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  char *DefaultSettings;
  unint64_t v13;
  void *DefaultLogFileName;
  const __CFString *v15;
  CFTypeRef v16;
  uint64_t v17;
  int v18;
  CFTypeRef v19;
  CFTypeRef v20;
  CFTypeRef v21;
  CFTypeRef v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  unint64_t *v31;
  unint64_t *i;
  __int128 v33;
  CFTypeRef v34;
  CFTypeRef v35;
  const __CFBoolean *v36;
  const __CFString *Value;
  CFTypeRef cf;
  const __CFBoolean *v40;
  const __CFBoolean *BOOLean;
  _QWORD block[5];
  int v43;
  int v44;
  int v45;
  uint64_t valuePtr;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  if (CFDictionaryContainsKey(theDict, CFSTR("logName")))
    cf = CFDictionaryGetValue(theDict, CFSTR("logName"));
  else
    cf = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("logDirectory")))
    Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("logDirectory"));
  else
    Value = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("maxLogFileSize")))
    v3 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("maxLogFileSize"));
  else
    v3 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("maxLogFileCount")))
    v4 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("maxLogFileCount"));
  else
    v4 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("wantsCompressedFiles")))
    BOOLean = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("wantsCompressedFiles"));
  else
    BOOLean = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("consoleUsesRealLevels")))
    v40 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("consoleUsesRealLevels"));
  else
    v40 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("maxConsoleLevel")))
    v5 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("maxConsoleLevel"));
  else
    v5 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("maxLogFileLevel")))
    v6 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("maxLogFileLevel"));
  else
    v6 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("consoleLevelDefaultsDomain")))
    v35 = CFDictionaryGetValue(theDict, CFSTR("consoleLevelDefaultsDomain"));
  else
    v35 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("consoleLevelDefaultsKey")))
    *((_QWORD *)&v33 + 1) = CFDictionaryGetValue(theDict, CFSTR("consoleLevelDefaultsKey"));
  else
    *((_QWORD *)&v33 + 1) = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("logFileLevelDefaultsDomain")))
    v34 = CFDictionaryGetValue(theDict, CFSTR("logFileLevelDefaultsDomain"));
  else
    v34 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("logFileLevelDefaultsKey")))
    *(_QWORD *)&v33 = CFDictionaryGetValue(theDict, CFSTR("logFileLevelDefaultsKey"));
  else
    *(_QWORD *)&v33 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("enableNewlines")))
    v36 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("enableNewlines"));
  else
    v36 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("createFileLogFormatBlock")))
    v7 = CFDictionaryGetValue(theDict, CFSTR("createFileLogFormatBlock"));
  else
    v7 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("createConsoleLogFormatBlock")))
    v8 = CFDictionaryGetValue(theDict, CFSTR("createConsoleLogFormatBlock"));
  else
    v8 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("didCreateNewFileBlock")))
    v9 = CFDictionaryGetValue(theDict, CFSTR("didCreateNewFileBlock"));
  else
    v9 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("willLogToConsoleBlock")))
    v10 = CFDictionaryGetValue(theDict, CFSTR("willLogToConsoleBlock"));
  else
    v10 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("willLogToFileBlock")))
  {
    v11 = CFDictionaryGetValue(theDict, CFSTR("willLogToFileBlock"));
    if (v7)
      goto LABEL_60;
  }
  else
  {
    v11 = 0;
    if (v7)
      goto LABEL_60;
  }
  if (!CFDictionaryContainsKey(theDict, CFSTR("createLogFormatBlock")))
  {
    v7 = 0;
    if (v8)
      goto LABEL_66;
    goto LABEL_61;
  }
  v7 = CFDictionaryGetValue(theDict, CFSTR("createLogFormatBlock"));
LABEL_60:
  if (v8)
    goto LABEL_66;
LABEL_61:
  if (CFDictionaryContainsKey(theDict, CFSTR("createLogFormatBlock")))
    v8 = CFDictionaryGetValue(theDict, CFSTR("createLogFormatBlock"));
  else
    v8 = 0;
LABEL_66:
  valuePtr = 10485760;
  if (v3)
    CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
  v45 = -1;
  if (v4)
    CFNumberGetValue(v4, kCFNumberSInt32Type, &v45);
  v44 = 5;
  if (v5)
    CFNumberGetValue(v5, kCFNumberSInt32Type, &v44);
  v43 = -1;
  if (v6)
    CFNumberGetValue(v6, kCFNumberSInt32Type, &v43);
  DefaultSettings = _createDefaultSettings();
  if (DefaultSettings)
  {
    v13 = (unint64_t)DefaultSettings;
    *((_QWORD *)DefaultSettings + 19) = 0;
    *((_QWORD *)DefaultSettings + 1) = CFArrayCreateCopy(0, a1);
    if (cf)
      DefaultLogFileName = (void *)CFRetain(cf);
    else
      DefaultLogFileName = (void *)_createDefaultLogFileName();
    *(_QWORD *)(v13 + 16) = DefaultLogFileName;
    if (Value)
      v15 = Value;
    else
      v15 = CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs");
    v16 = CFRetain(v15);
    v17 = valuePtr;
    *(_QWORD *)(v13 + 24) = v16;
    *(_QWORD *)(v13 + 32) = v17;
    v18 = v44;
    *(_DWORD *)(v13 + 40) = v45;
    *(_DWORD *)(v13 + 44) = v18;
    *(_DWORD *)(v13 + 48) = v43;
    v19 = v35;
    if (v35)
      v19 = CFRetain(v35);
    *(_QWORD *)(v13 + 112) = v19;
    if (*((_QWORD *)&v33 + 1))
      v20 = CFRetain(*((CFTypeRef *)&v33 + 1));
    else
      v20 = 0;
    *(_QWORD *)(v13 + 120) = v20;
    v21 = v34;
    if (v34)
      v21 = CFRetain(v34);
    *(_QWORD *)(v13 + 128) = v21;
    if ((_QWORD)v33)
      v22 = CFRetain((CFTypeRef)v33);
    else
      v22 = 0;
    *(_QWORD *)(v13 + 136) = v22;
    if (v7)
      v23 = _Block_copy(v7);
    else
      v23 = 0;
    *(_QWORD *)(v13 + 64) = v23;
    if (v8)
      v24 = _Block_copy(v8);
    else
      v24 = 0;
    *(_QWORD *)(v13 + 72) = v24;
    if (v9)
      v25 = _Block_copy(v9);
    else
      v25 = 0;
    *(_QWORD *)(v13 + 80) = v25;
    if (v10)
      v26 = _Block_copy(v10);
    else
      v26 = 0;
    *(_QWORD *)(v13 + 88) = v26;
    if (v11)
      v27 = _Block_copy(v11);
    else
      v27 = 0;
    *(_QWORD *)(v13 + 96) = v27;
    if (BOOLean)
    {
      if (CFBooleanGetValue(BOOLean))
        v28 = 2;
      else
        v28 = 1;
    }
    else
    {
      v28 = 0;
    }
    *(_DWORD *)(v13 + 152) = v28;
    if (v40)
    {
      if (CFBooleanGetValue(v40))
        v29 = 2;
      else
        v29 = 1;
    }
    else
    {
      v29 = 0;
    }
    *(_DWORD *)(v13 + 156) = v29;
    if (v36)
    {
      if (CFBooleanGetValue(v36))
        v30 = 2;
      else
        v30 = 1;
    }
    else
    {
      v30 = 0;
    }
    *(_DWORD *)(v13 + 160) = v30;
    v31 = &_logFileSettings;
    for (i = (unint64_t *)atomic_load(&_logFileSettings); i; i = (unint64_t *)atomic_load(i))
      v31 = i;
    atomic_store(v13, v31);
    if (v33 != 0 && _startObservingDefaultChanges_once != -1)
      dispatch_once(&_startObservingDefaultChanges_once, &__block_literal_global_168);
    if (_recomputeQueue_onceToken != -1)
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_175);
    dispatch_sync((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_8);
    if (_configurationQueue_once != -1)
      dispatch_once(&_configurationQueue_once, &__block_literal_global_177);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __CPLoggingAddCustomLogConfiguration_block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v13;
    dispatch_sync((dispatch_queue_t)_configurationQueue_queue, block);
  }
  else
  {
    CFLog();
  }
}

char *_createDefaultSettings()
{
  char *v0;
  char *v1;

  v0 = (char *)malloc_type_calloc(0xA8uLL, 1uLL, 0x52AF0B50uLL);
  v1 = v0;
  if (v0)
  {
    *((_QWORD *)v0 + 4) = 10485760;
    *(_OWORD *)(v0 + 40) = xmmword_18EB49130;
    *((_DWORD *)v0 + 14) = -3;
    *((_QWORD *)v0 + 19) = 0x100000002;
    *((_DWORD *)v0 + 40) = 2;
    *((_QWORD *)v0 + 18) = malloc_type_calloc(0x10uLL, 1uLL, 0x7D2BF6FFuLL);
  }
  return v1;
}

CFStringRef _createDefaultLogFileName()
{
  const char *v0;
  const UInt8 *v1;
  size_t v2;
  uint64_t v4;

  v0 = getprogname();
  if (v0)
  {
    v1 = (const UInt8 *)v0;
    v2 = strlen(v0);
    return CFStringCreateWithBytes(0, v1, v2, 0x8000100u, 0);
  }
  else
  {
    v4 = getpid();
    return CFStringCreateWithFormat(0, 0, CFSTR("pid_%d"), v4);
  }
}

void _recomputeQueueRecomputeMaxAcceptedLevel()
{
  unint64_t v0;
  signed int v1;
  signed int v2;
  unint64_t v3;
  signed int v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;

  v0 = atomic_load(&_logFileSettings);
  if (v0)
  {
    v1 = -1;
    do
    {
      v2 = atomic_load((unsigned int *)(v0 + 56));
      if (v2 == -3)
      {
        v3 = v0;
        do
        {
          v2 = atomic_load((unsigned int *)(v3 + 48));
          if (v2 != -2)
            break;
          v3 = atomic_load(&_logFileSettings);
          v2 = atomic_load((unsigned int *)(v3 + 56));
        }
        while (v2 == -3);
      }
      if (v2 > v1)
        v1 = v2;
      v4 = atomic_load((unsigned int *)(v0 + 52));
      v5 = atomic_load((unsigned int *)(v0 + 52));
      if (v5 == -3)
      {
        v6 = v0;
        do
        {
          v4 = atomic_load((unsigned int *)(v6 + 44));
          if (v4 != -2)
            break;
          v6 = atomic_load(&_logFileSettings);
          v4 = atomic_load((unsigned int *)(v6 + 52));
          v7 = atomic_load((unsigned int *)(v6 + 52));
        }
        while (v7 == -3);
      }
      if (v4 > v1)
        v1 = v4;
      v0 = atomic_load((unint64_t *)v0);
    }
    while (v0);
  }
  else
  {
    v1 = -1;
  }
  atomic_store(v1, &_CPLoggingMaxAcceptedLevel);
}

void _configurationQueueRereadDefaultsForSetting(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int DefaultsValue;

  v2 = (const __CFString *)atomic_load((unint64_t *)(a1 + 112));
  v3 = (const __CFString *)atomic_load((unint64_t *)(a1 + 120));
  v4 = (const __CFString *)atomic_load((unint64_t *)(a1 + 128));
  v5 = (const __CFString *)atomic_load((unint64_t *)(a1 + 136));
  if (!v3)
  {
    if (!v5)
      goto LABEL_8;
    DefaultsValue = _configurationQueueReadDefaultsValue(v4, v5);
    goto LABEL_6;
  }
  v6 = _configurationQueueReadDefaultsValue(v2, v3);
  v7 = v6;
  if (v5)
  {
    DefaultsValue = _configurationQueueReadDefaultsValue(v4, v5);
    atomic_store(v7, (unsigned int *)(a1 + 52));
LABEL_6:
    atomic_store(DefaultsValue, (unsigned int *)(a1 + 56));
    goto LABEL_8;
  }
  atomic_store(v6, (unsigned int *)(a1 + 52));
LABEL_8:
  if (_recomputeQueue_onceToken != -1)
    dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_175);
  dispatch_async((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_179);
}

BOOL CPLoggingIsFacilityDefined(const void *a1)
{
  unint64_t v2;
  unint64_t v3;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v2 = _settingsForFacility(a1);
  v3 = atomic_load(&_logFileSettings);
  return v2 != v3;
}

BOOL CPLoggingFlush(dispatch_time_t timeout)
{
  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  if (_workGroup_once != -1)
    dispatch_once(&_workGroup_once, &__block_literal_global_112_0);
  return dispatch_group_wait((dispatch_group_t)_workGroup_group, timeout) == 0;
}

void CPLoggingFlushWithCompletion(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  _QWORD v5[6];

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CPLoggingFlushWithCompletion_block_invoke;
  v5[3] = &unk_1E2881FC8;
  v5[4] = a2;
  v5[5] = a1;
  dispatch_async(global_queue, v5);
}

void CPLoggingStartNewLogFile(const void *a1)
{
  unint64_t v2;
  _QWORD *WorkSettingsFromSettings;
  _QWORD *v4;
  NSObject *v5;
  _QWORD block[5];

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v2 = _settingsForFacility(a1);
  WorkSettingsFromSettings = _createWorkSettingsFromSettings(v2);
  atomic_store(0, (unsigned __int8 *)(v2 + 164));
  if (WorkSettingsFromSettings)
  {
    v4 = WorkSettingsFromSettings;
    if (_workGroup_once != -1)
      dispatch_once(&_workGroup_once, &__block_literal_global_112_0);
    v5 = _workGroup_group;
    if (_workQueue_once != -1)
      dispatch_once(&_workQueue_once, &__block_literal_global_113);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __CPLoggingStartNewLogFile_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v4;
    dispatch_group_async(v5, (dispatch_queue_t)_workQueue_queue, block);
  }
}

void sub_18EB378E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _workQueueRefreshUUIDForWorkSettings(uint64_t a1)
{
  const __CFString *v2;
  unsigned __int16 *UTF8StringFromString;
  unsigned __int16 *v4;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  const char *string;
  const UInt8 *v10;
  size_t v11;
  uint64_t v12;
  const void *v13;
  _QWORD v14[5];
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  v2 = *(const __CFString **)(a1 + 8);
  UTF8StringFromString = _createUTF8StringFromString(*(const __CFString **)(a1 + 16));
  v4 = _createUTF8StringFromString(v2);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v5 = (void *)_workQueueCopyConnection();
  if (v5)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "message", 1);
    xpc_dictionary_set_string(v6, "folder", (const char *)UTF8StringFromString);
    xpc_dictionary_set_string(v6, "basename", (const char *)v4);
    if (_waitForResponseQueue_once != -1)
      dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___workQueueCopyFileUUIDForLogPath_block_invoke;
    block[3] = &unk_1E2881868;
    block[4] = v5;
    block[5] = v6;
    dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, block);
    if (_waitForResponseSema_once != -1)
      dispatch_once(&_waitForResponseSema_once, &__block_literal_global_150);
    dispatch_semaphore_wait((dispatch_semaphore_t)_waitForResponseSema_sema, 0xFFFFFFFFFFFFFFFFLL);
    xpc_release(v6);
    if (_waitForResponseQueue_once != -1)
      dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = ___workQueueCopyFileUUIDForLogPath_block_invoke_2;
    v14[3] = &unk_1E28819F8;
    v14[4] = &v16;
    dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v14);
    v8 = (void *)v17[5];
    if (v8)
    {
      string = xpc_dictionary_get_string(v8, "uuid");
      v10 = (const UInt8 *)string;
      if (string)
      {
        v11 = strlen(string);
        v10 = (const UInt8 *)CFStringCreateWithBytes(0, v10, v11, 0x8000100u, 1u);
      }
      xpc_release((xpc_object_t)v17[5]);
      if (UTF8StringFromString)
        goto LABEL_12;
      goto LABEL_13;
    }
    CFLog();
  }
  v10 = 0;
  if (UTF8StringFromString)
LABEL_12:
    free(UTF8StringFromString);
LABEL_13:
  if (v4)
    free(v4);
  if (v5)
    xpc_release(v5);
  _Block_object_dispose(&v16, 8);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(const void **)(v12 + 8);
  if (v13)
  {
    CFRelease(v13);
    v12 = *(_QWORD *)(a1 + 64);
  }
  *(_QWORD *)(v12 + 8) = v10;
}

void sub_18EB37B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t CPLoggingStartNewLogFileNextLine(const void *a1)
{
  unint64_t result;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  result = _settingsForFacility(a1);
  atomic_store(1u, (unsigned __int8 *)(result + 164));
  return result;
}

void CPLoggingSetCustomLogName(const void *a1, const void *a2)
{
  unint64_t v4;
  unint64_t *v5;
  const void *v6;
  int v7;
  _QWORD block[5];

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v4 = _settingsForFacility(a1);
  if (a2)
    CFRetain(a2);
  v5 = (unint64_t *)(v4 + 16);
  do
    v6 = (const void *)__ldxr(v5);
  while (__stlxr((unint64_t)a2, v5));
  v7 = atomic_load((unsigned __int8 *)(v4 + 165));
  if (v6)
  {
    if (v7)
    {
      atomic_load((unint64_t *)(v4 + 8));
      CFLog();
    }
    else
    {
      CFRelease(v6);
    }
  }
  if (_workQueue_once != -1)
    dispatch_once(&_workQueue_once, &__block_literal_global_113);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___setLogName_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)_workQueue_queue, block);
}

const void *CPLoggingCopyCustomLogName(const void *a1)
{
  const void *v2;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v2 = (const void *)atomic_load((unint64_t *)(_settingsForFacility(a1) + 16));
  if (v2)
    CFRetain(v2);
  return v2;
}

void CPLoggingSetCustomLogDirectory(const void *a1, const void *a2)
{
  unint64_t v4;
  unint64_t *v5;
  const void *v6;
  int v7;
  _QWORD block[5];

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v4 = _settingsForFacility(a1);
  if (a2)
    CFRetain(a2);
  v5 = (unint64_t *)(v4 + 24);
  do
    v6 = (const void *)__ldxr(v5);
  while (__stlxr((unint64_t)a2, v5));
  v7 = atomic_load((unsigned __int8 *)(v4 + 165));
  if (v6)
  {
    if (v7)
    {
      atomic_load((unint64_t *)(v4 + 8));
      CFLog();
    }
    else
    {
      CFRelease(v6);
    }
  }
  if (_workQueue_once != -1)
    dispatch_once(&_workQueue_once, &__block_literal_global_113);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___setLogDirectory_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)_workQueue_queue, block);
}

const void *CPLoggingCopyCustomLogDirectory(const void *a1)
{
  const void *v2;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v2 = (const void *)atomic_load((unint64_t *)(_settingsForFacility(a1) + 24));
  if (v2)
    CFRetain(v2);
  return v2;
}

unint64_t CPLoggingSetCustomMaxLogFileSize(const void *a1, unint64_t a2)
{
  unint64_t result;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  result = _settingsForFacility(a1);
  atomic_store(a2, (unint64_t *)(result + 32));
  return result;
}

unint64_t CPLoggingCustomMaxLogFileSize(const void *a1)
{
  unint64_t result;
  unint64_t v3;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  for (result = atomic_load((unint64_t *)(_settingsForFacility(a1) + 32));
        result == -2;
        result = atomic_load((unint64_t *)(v3 + 32)))
  {
    v3 = atomic_load(&_logFileSettings);
  }
  return result;
}

unint64_t CPLoggingSetCustomMaxLogFileCount(const void *a1, unsigned int a2)
{
  unint64_t result;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  result = _settingsForFacility(a1);
  atomic_store(a2, (unsigned int *)(result + 40));
  return result;
}

uint64_t CPLoggingCustomMaxLogFileCount(const void *a1)
{
  uint64_t result;
  unint64_t v3;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  for (result = atomic_load((unsigned int *)(_settingsForFacility(a1) + 40));
        (_DWORD)result == -2;
        result = atomic_load((unsigned int *)(v3 + 40)))
  {
    v3 = atomic_load(&_logFileSettings);
  }
  return result;
}

unint64_t CPLoggingSetCustomWantsCompressedFiles(const void *a1, int a2)
{
  unint64_t result;
  unsigned int v5;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  result = _settingsForFacility(a1);
  if (a2)
    v5 = 2;
  else
    v5 = 1;
  atomic_store(v5, (unsigned int *)(result + 152));
  return result;
}

BOOL CPLoggingCustomWantsCompressedFiles(const void *a1)
{
  unsigned int i;
  unint64_t v3;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  for (i = atomic_load((unsigned int *)(_settingsForFacility(a1) + 152)); !i; i = atomic_load((unsigned int *)(v3 + 152)))
    v3 = atomic_load(&_logFileSettings);
  return i == 2;
}

unint64_t CPLoggingSetCustomConsoleUsesRealLevels(const void *a1, int a2)
{
  unint64_t result;
  unsigned int v5;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  result = _settingsForFacility(a1);
  if (a2)
    v5 = 2;
  else
    v5 = 1;
  atomic_store(v5, (unsigned int *)(result + 156));
  return result;
}

BOOL CPLoggingCustomConsoleUsesRealLevels(const void *a1)
{
  unsigned int i;
  unint64_t v3;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  for (i = atomic_load((unsigned int *)(_settingsForFacility(a1) + 156)); !i; i = atomic_load((unsigned int *)(v3 + 156)))
    v3 = atomic_load(&_logFileSettings);
  return i == 2;
}

void CPLoggingSetCustomMaxConsoleLevel(const void *a1, unsigned int a2)
{
  unsigned int *v4;
  unsigned int v5;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v4 = (unsigned int *)(_settingsForFacility(a1) + 44);
  do
    v5 = __ldxr(v4);
  while (__stlxr(a2, v4));
  if (v5 != a2)
  {
    if (_recomputeQueue_onceToken != -1)
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_175);
    dispatch_sync((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_196);
  }
}

uint64_t CPLoggingCustomMaxConsoleLevel(const void *a1)
{
  unint64_t v2;
  uint64_t result;
  unsigned int v4;
  unsigned int v5;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v2 = _settingsForFacility(a1);
  result = atomic_load((unsigned int *)(v2 + 52));
  v4 = atomic_load((unsigned int *)(v2 + 52));
  if (v4 == -3)
  {
    do
    {
      result = atomic_load((unsigned int *)(v2 + 44));
      if ((_DWORD)result != -2)
        break;
      v2 = atomic_load(&_logFileSettings);
      result = atomic_load((unsigned int *)(v2 + 52));
      v5 = atomic_load((unsigned int *)(v2 + 52));
    }
    while (v5 == -3);
  }
  return result;
}

void CPLoggingSetCustomMaxLogFileLevel(const void *a1, unsigned int a2)
{
  unsigned int *v4;
  unsigned int v5;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v4 = (unsigned int *)(_settingsForFacility(a1) + 48);
  do
    v5 = __ldxr(v4);
  while (__stlxr(a2, v4));
  if (v5 != a2)
  {
    if (_recomputeQueue_onceToken != -1)
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_175);
    dispatch_sync((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_197);
  }
}

uint64_t CPLoggingCustomMaxLogFileLevel(const void *a1)
{
  unint64_t v2;
  uint64_t result;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v2 = _settingsForFacility(a1);
  for (result = atomic_load((unsigned int *)(v2 + 56));
        (_DWORD)result == -3;
        result = atomic_load((unsigned int *)(v2 + 56)))
  {
    result = atomic_load((unsigned int *)(v2 + 48));
    if ((_DWORD)result != -2)
      break;
    v2 = atomic_load(&_logFileSettings);
  }
  return result;
}

void CPLoggingSetCustomCreateLogFormatBlock(const void *a1, const void *a2)
{
  _setCustomCreateLogFormatBlock(a1, a2, 1, 1);
}

void _setCustomCreateLogFormatBlock(const void *a1, const void *a2, int a3, int a4)
{
  unint64_t v8;
  void *v9;
  unint64_t *v10;
  const void *v11;
  int v12;
  void *v13;
  unint64_t *v14;
  const void *v15;
  int v16;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v8 = _settingsForFacility(a1);
  if (a3)
  {
    v9 = a2 ? _Block_copy(a2) : 0;
    v10 = (unint64_t *)(v8 + 64);
    do
      v11 = (const void *)__ldxr(v10);
    while (__stlxr((unint64_t)v9, v10));
    v12 = atomic_load((unsigned __int8 *)(v8 + 165));
    if (v11)
    {
      if (!v12)
      {
        CFRelease(v11);
        if (!a4)
          return;
        goto LABEL_13;
      }
      atomic_load((unint64_t *)(v8 + 8));
      CFLog();
    }
  }
  if (!a4)
    return;
LABEL_13:
  if (a2)
    v13 = _Block_copy(a2);
  else
    v13 = 0;
  v14 = (unint64_t *)(v8 + 72);
  do
    v15 = (const void *)__ldxr(v14);
  while (__stlxr((unint64_t)v13, v14));
  v16 = atomic_load((unsigned __int8 *)(v8 + 165));
  if (v15)
  {
    if (v16)
    {
      atomic_load((unint64_t *)(v8 + 8));
      CFLog();
    }
    else
    {
      CFRelease(v15);
    }
  }
}

void CPLoggingSetCustomCreateFileLogFormatBlock(const void *a1, const void *a2)
{
  _setCustomCreateLogFormatBlock(a1, a2, 1, 0);
}

void CPLoggingSetCustomCreateConsoleLogFormatBlock(const void *a1, const void *a2)
{
  _setCustomCreateLogFormatBlock(a1, a2, 0, 1);
}

void CPLoggingSetCustomDidCreateNewFileBlock(const void *a1, const void *a2)
{
  unint64_t v4;
  void *v5;
  unint64_t *v6;
  const void *v7;
  int v8;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v4 = _settingsForFacility(a1);
  if (a2)
    v5 = _Block_copy(a2);
  else
    v5 = 0;
  v6 = (unint64_t *)(v4 + 80);
  do
    v7 = (const void *)__ldxr(v6);
  while (__stlxr((unint64_t)v5, v6));
  v8 = atomic_load((unsigned __int8 *)(v4 + 165));
  if (v7)
  {
    if (v8)
    {
      atomic_load((unint64_t *)(v4 + 8));
      CFLog();
    }
    else
    {
      CFRelease(v7);
    }
  }
}

void CPLoggingSetCustomWillLogToConsoleBlock(const void *a1, const void *a2)
{
  unint64_t v4;
  void *v5;
  unint64_t *v6;
  const void *v7;
  int v8;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v4 = _settingsForFacility(a1);
  if (a2)
    v5 = _Block_copy(a2);
  else
    v5 = 0;
  v6 = (unint64_t *)(v4 + 88);
  do
    v7 = (const void *)__ldxr(v6);
  while (__stlxr((unint64_t)v5, v6));
  v8 = atomic_load((unsigned __int8 *)(v4 + 165));
  if (v7)
  {
    if (v8)
    {
      atomic_load((unint64_t *)(v4 + 8));
      CFLog();
    }
    else
    {
      _Block_release(v7);
    }
  }
}

void CPLoggingSetCustomWillLogToLogFileBlock(const void *a1, const void *a2)
{
  unint64_t v4;
  void *v5;
  unint64_t *v6;
  const void *v7;
  int v8;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v4 = _settingsForFacility(a1);
  if (a2)
    v5 = _Block_copy(a2);
  else
    v5 = 0;
  v6 = (unint64_t *)(v4 + 96);
  do
    v7 = (const void *)__ldxr(v6);
  while (__stlxr((unint64_t)v5, v6));
  v8 = atomic_load((unsigned __int8 *)(v4 + 165));
  if (v7)
  {
    if (v8)
    {
      atomic_load((unint64_t *)(v4 + 8));
      CFLog();
    }
    else
    {
      _Block_release(v7);
    }
  }
}

void CPLoggingSetCustomConsoleLevelDefaults(const void *a1, const void *a2, const void *a3)
{
  unint64_t v6;
  unint64_t *v7;
  const void *v8;
  int v9;
  unint64_t *v10;
  const void *v11;
  unint64_t *v12;
  _QWORD block[5];

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v6 = _settingsForFacility(a1);
  if (a2)
    CFRetain(a2);
  if (a3)
    CFRetain(a3);
  v7 = (unint64_t *)(v6 + 120);
  do
    v8 = (const void *)__ldxr(v7);
  while (__stlxr((unint64_t)a3, v7));
  v9 = atomic_load((unsigned __int8 *)(v6 + 165));
  if (v8)
  {
    if (!v9)
    {
      CFRelease(v8);
      v12 = (unint64_t *)(v6 + 112);
      do
        v11 = (const void *)__ldxr(v12);
      while (__stlxr((unint64_t)a2, v12));
      if (v11)
        goto LABEL_20;
      goto LABEL_21;
    }
    atomic_load((unint64_t *)(v6 + 8));
    CFLog();
  }
  v10 = (unint64_t *)(v6 + 112);
  do
    v11 = (const void *)__ldxr(v10);
  while (__stlxr((unint64_t)a2, v10));
  if (v11)
  {
    if (v9)
    {
      atomic_load((unint64_t *)(v6 + 8));
      CFLog();
      goto LABEL_21;
    }
LABEL_20:
    CFRelease(v11);
  }
LABEL_21:
  if (a3 && _startObservingDefaultChanges_once != -1)
    dispatch_once(&_startObservingDefaultChanges_once, &__block_literal_global_168);
  if (_configurationQueue_once != -1)
    dispatch_once(&_configurationQueue_once, &__block_literal_global_177);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CPLoggingSetCustomConsoleLevelDefaults_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v6;
  dispatch_async((dispatch_queue_t)_configurationQueue_queue, block);
}

void CPLoggingSetCustomLogFileLevelDefaults(const void *a1, const void *a2, const void *a3)
{
  unint64_t v6;
  unint64_t *v7;
  const void *v8;
  int v9;
  unint64_t *v10;
  const void *v11;
  unint64_t *v12;
  _QWORD block[5];

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_44);
  v6 = _settingsForFacility(a1);
  if (a2)
    CFRetain(a2);
  if (a3)
    CFRetain(a3);
  v7 = (unint64_t *)(v6 + 136);
  do
    v8 = (const void *)__ldxr(v7);
  while (__stlxr((unint64_t)a3, v7));
  v9 = atomic_load((unsigned __int8 *)(v6 + 165));
  if (v8)
  {
    if (!v9)
    {
      CFRelease(v8);
      v12 = (unint64_t *)(v6 + 128);
      do
        v11 = (const void *)__ldxr(v12);
      while (__stlxr((unint64_t)a2, v12));
      if (v11)
        goto LABEL_20;
      goto LABEL_21;
    }
    atomic_load((unint64_t *)(v6 + 8));
    CFLog();
  }
  v10 = (unint64_t *)(v6 + 128);
  do
    v11 = (const void *)__ldxr(v10);
  while (__stlxr((unint64_t)a2, v10));
  if (v11)
  {
    if (v9)
    {
      atomic_load((unint64_t *)(v6 + 8));
      CFLog();
      goto LABEL_21;
    }
LABEL_20:
    CFRelease(v11);
  }
LABEL_21:
  if (a3 && _startObservingDefaultChanges_once != -1)
    dispatch_once(&_startObservingDefaultChanges_once, &__block_literal_global_168);
  if (_configurationQueue_once != -1)
    dispatch_once(&_configurationQueue_once, &__block_literal_global_177);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CPLoggingSetCustomLogFileLevelDefaults_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v6;
  dispatch_async((dispatch_queue_t)_configurationQueue_queue, block);
}

uint64_t CPLoggingSetUsesOwnAslClient(uint64_t result)
{
  atomic_store(result, _usesOwnAslClient);
  return result;
}

void CPLoggingSetLogName(const void *a1)
{
  CPLoggingSetCustomLogName(0, a1);
}

const void *CPLoggingCopyLogName()
{
  return CPLoggingCopyCustomLogName(0);
}

void CPLoggingSetLogDirectory(const void *a1)
{
  CPLoggingSetCustomLogDirectory(0, a1);
}

const void *CPLoggingCopyLogDirectory()
{
  return CPLoggingCopyCustomLogDirectory(0);
}

unint64_t CPLoggingSetMaxLogFileSize(unint64_t a1)
{
  return CPLoggingSetCustomMaxLogFileSize(0, a1);
}

unint64_t CPLoggingMaxLogFileSize()
{
  return CPLoggingCustomMaxLogFileSize(0);
}

unint64_t CPLoggingSetMaxLogFileCount(unsigned int a1)
{
  return CPLoggingSetCustomMaxLogFileCount(0, a1);
}

uint64_t CPLoggingMaxLogFileCount()
{
  return CPLoggingCustomMaxLogFileCount(0);
}

unint64_t CPLoggingSetWantsCompressedFiles(int a1)
{
  return CPLoggingSetCustomWantsCompressedFiles(0, a1);
}

BOOL CPLoggingWantsCompressedFiles()
{
  return CPLoggingCustomWantsCompressedFiles(0);
}

unint64_t CPLoggingSetConsoleUsesRealLevels(int a1)
{
  return CPLoggingSetCustomConsoleUsesRealLevels(0, a1);
}

BOOL CPLoggingConsoleUsesRealLevels()
{
  return CPLoggingCustomConsoleUsesRealLevels(0);
}

void CPLoggingSetMaxConsoleLevel(unsigned int a1)
{
  CPLoggingSetCustomMaxConsoleLevel(0, a1);
}

uint64_t CPLoggingMaxConsoleLevel()
{
  return CPLoggingCustomMaxConsoleLevel(0);
}

void CPLoggingSetMaxLogFileLevel(unsigned int a1)
{
  CPLoggingSetCustomMaxLogFileLevel(0, a1);
}

uint64_t CPLoggingMaxLogFileLevel()
{
  return CPLoggingCustomMaxLogFileLevel(0);
}

void CPLoggingSetCreateLogFormatBlock(const void *a1)
{
  _setCustomCreateLogFormatBlock(0, a1, 1, 1);
}

void CPLoggingSetCreateFileLogFormatBlock(const void *a1)
{
  _setCustomCreateLogFormatBlock(0, a1, 1, 0);
}

void CPLoggingSetCreateConsoleLogFormatBlock(const void *a1)
{
  _setCustomCreateLogFormatBlock(0, a1, 0, 1);
}

void CPLoggingSetDidCreateNewFileBlock(const void *a1)
{
  CPLoggingSetCustomDidCreateNewFileBlock(0, a1);
}

void CPLoggingSetWillLogToConsoleBlock(const void *a1)
{
  CPLoggingSetCustomWillLogToConsoleBlock(0, a1);
}

void CPLoggingSetWillLogToLogFileBlock(const void *a1)
{
  CPLoggingSetCustomWillLogToLogFileBlock(0, a1);
}

void CPLoggingSetConsoleLevelDefaults(const void *a1, const void *a2)
{
  CPLoggingSetCustomConsoleLevelDefaults(0, a1, a2);
}

void CPLoggingSetLogFileLevelDefaults(const void *a1, const void *a2)
{
  CPLoggingSetCustomLogFileLevelDefaults(0, a1, a2);
}

uint64_t ___init_block_invoke()
{
  char *DefaultSettings;
  unint64_t v1;

  _processName = (uint64_t)_createDefaultLogFileName();
  _pid = getpid();
  DefaultSettings = _createDefaultSettings();
  if (DefaultSettings)
  {
    v1 = (unint64_t)DefaultSettings;
    *((_QWORD *)DefaultSettings + 2) = CFRetain((CFTypeRef)_processName);
    *(_QWORD *)(v1 + 24) = CFRetain(CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs"));
    atomic_store(v1, &_logFileSettings);
  }
  else
  {
    CFLog();
  }
  atexit((void (*)(void))_flushAtExit);
  if (_configurationQueue_once != -1)
    dispatch_once(&_configurationQueue_once, &__block_literal_global_177);
  dispatch_async((dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_47);
  return _rereadObfuscationPreferences();
}

BOOL _flushAtExit()
{
  dispatch_time_t v0;

  v0 = dispatch_time(0, 5000000000);
  return CPLoggingFlush(v0);
}

void ___init_block_invoke_2()
{
  uint64_t v0;

  v0 = atomic_load(&_logFileSettings);
  _configurationQueueRereadDefaultsForSetting(v0);
}

uint64_t _rereadObfuscationPreferences()
{
  int AppBooleanValue;
  uint64_t result;
  unsigned __int8 v2;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR(".GlobalPreferences"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CPLoggingUnobfuscate"), CFSTR(".GlobalPreferences"), &keyExistsAndHasValidFormat);
  result = CPIsInternalDevice();
  v2 = 0;
  if (!(_DWORD)result)
  {
    if (keyExistsAndHasValidFormat)
      v3 = AppBooleanValue == 0;
    else
      v3 = 1;
    v2 = v3;
  }
  atomic_store(v2, _shouldObfuscate);
  return result;
}

__CFString *_createStandardConsoleLogLine(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("("));
  if (a1 <= 7)
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("%@)"), _createStandardConsoleLogLine_levelLabels[a1]);
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  CFStringAppend(Mutable, CFSTR("(Unknown)"));
  if (a2)
LABEL_5:
    CFStringAppendFormat(Mutable, 0, CFSTR(" %@:"), a2);
LABEL_6:
  if (a3 && a4)
    CFStringAppendFormat(Mutable, 0, CFSTR(" <%s %s:%ld>"), a3, a4, a5);
  CFStringAppendFormat(Mutable, 0, CFSTR(" %@"), a6);
  return Mutable;
}

CFStringRef _createStandardFileLogLine(CFDateRef date, uint64_t a2)
{
  CFStringRef StringWithDate;
  CFStringRef v5;

  if (_logDateFormatter_once != -1)
    dispatch_once(&_logDateFormatter_once, &__block_literal_global_86);
  StringWithDate = CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)_logDateFormatter_dateFormatter, date);
  v5 = CFStringCreateWithFormat(0, 0, CFSTR("%@ %@[%d] %@"), StringWithDate, _processName, _pid, a2);
  CFRelease(StringWithDate);
  return v5;
}

void ___logDateFormatter_block_invoke()
{
  _logDateFormatter_dateFormatter = (uint64_t)CFDateFormatterCreate(0, 0, kCFDateFormatterShortStyle, kCFDateFormatterFullStyle);
  CFDateFormatterSetFormat((CFDateFormatterRef)_logDateFormatter_dateFormatter, CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS"));
}

unsigned __int16 *_createUTF8StringFromString(const __CFString *a1)
{
  unsigned __int16 *v2;
  uint64_t v3;
  CFIndex Length;
  CFIndex v5;
  __CFString *Mutable;
  __CFString *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  CFRange v11;

  v2 = (unsigned __int16 *)malloc_type_malloc(0xC8uLL, 0x32E04B71uLL);
  if (v2)
  {
    v3 = 200;
    while (!CFStringGetCString(a1, (char *)v2, v3, 0x8000100u))
    {
      free(v2);
      if (v3 < 0x100000)
      {
        v3 *= 2;
        v2 = (unsigned __int16 *)malloc_type_malloc(v3, 0xC640418DuLL);
        if (v2)
          continue;
      }
      CFLog();
      Length = CFStringGetLength(a1);
      if (Length)
      {
        v5 = Length;
        v2 = (unsigned __int16 *)malloc_type_malloc(2 * Length, 0x15A09C9CuLL);
        if (!v2)
          return v2;
        v11.location = 0;
        v11.length = v5;
        CFStringGetCharacters(a1, v11, v2);
        Mutable = CFStringCreateMutable(0, 0);
        if (Mutable)
        {
          v7 = Mutable;
          CFStringAppend(Mutable, CFSTR("UTF-16 Bytes: "));
          if (v5 >= 1)
          {
            v8 = v2;
            do
            {
              v9 = *v8++;
              CFStringAppendFormat(v7, 0, CFSTR("%04x "), v9);
              --v5;
            }
            while (v5);
          }
          CFLog();
          CFRelease(v7);
        }
        free(v2);
      }
      return 0;
    }
  }
  else
  {
    CFLog();
  }
  return v2;
}

void ___performLog_block_invoke(uint64_t a1)
{
  _workQueueAppendDataToLogFile(*(_QWORD *)(a1 + 32), *(const __CFData **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  free(*(void **)(a1 + 32));
}

void ___aslClient_block_invoke()
{
  if (atomic_load(_usesOwnAslClient))
    _aslClient_client = (uint64_t)asl_open(0, 0, 0);
}

dispatch_queue_t ___callbackQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.CPLogging.callbackQueue", 0);
  _callbackQueue_queue = (uint64_t)result;
  return result;
}

dispatch_group_t ___workGroup_block_invoke()
{
  dispatch_group_t result;

  result = dispatch_group_create();
  _workGroup_group = (uint64_t)result;
  return result;
}

void ___workQueue_block_invoke()
{
  NSObject *v0;
  NSObject *global_queue;

  v0 = dispatch_queue_create("com.apple.CPLogging.workQueue", 0);
  _workQueue_queue = (uint64_t)v0;
  global_queue = dispatch_get_global_queue(-2, 0);
  dispatch_set_target_queue(v0, global_queue);
}

uint64_t _workQueueCopyConnection()
{
  uint64_t v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  if (_workQueueCopyConnection_once != -1)
    dispatch_once(&_workQueueCopyConnection_once, &__block_literal_global_134);
  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__1;
  v7 = __Block_byref_object_dispose__1;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___workQueueCopyConnection_block_invoke_2;
  block[3] = &unk_1E28819F8;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)_workQueueCopyConnection_connQueue, block);
  v0 = v4[5];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void ___workQueueLogToFileUUID_block_invoke(uint64_t a1)
{
  _waitForResponseQueueIsWaiting = 1;
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
}

void ___workQueueLogToFileUUID_block_invoke_2(uint64_t a1)
{
  if (_waitForResponseQueueResponse)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = xpc_retain((xpc_object_t)_waitForResponseQueueResponse);
    xpc_release((xpc_object_t)_waitForResponseQueueResponse);
    _waitForResponseQueueResponse = 0;
  }
}

dispatch_queue_t ___workQueueCopyConnection_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.CPLogging.connQueue", 0);
  _workQueueCopyConnection_connQueue = (uint64_t)result;
  return result;
}

xpc_object_t ___workQueueCopyConnection_block_invoke_2(uint64_t a1)
{
  xpc_object_t result;
  NSObject *global_queue;

  result = (xpc_object_t)_workQueueCopyConnection_conn;
  if (_workQueueCopyConnection_conn
    || (global_queue = dispatch_get_global_queue(0, 0),
        _workQueueCopyConnection_conn = (uint64_t)xpc_connection_create_mach_service("com.apple.appsupport.cplogd", global_queue, 0), xpc_connection_set_event_handler((xpc_connection_t)_workQueueCopyConnection_conn, &__block_literal_global_138), xpc_connection_resume((xpc_connection_t)_workQueueCopyConnection_conn), (result = (xpc_object_t)_workQueueCopyConnection_conn) != 0))
  {
    result = xpc_retain(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

void ___workQueueCopyConnection_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  _QWORD v5[5];
  char v6;

  v3 = MEMORY[0x193FF7E98](a2);
  if (v3 != MEMORY[0x1E0C812F8])
  {
    if (v3 != MEMORY[0x1E0C81310])
      goto LABEL_3;
    if (a2 == MEMORY[0x1E0C81260])
    {
      CFLog();
      dispatch_sync((dispatch_queue_t)_workQueueCopyConnection_connQueue, &__block_literal_global_141);
      goto LABEL_4;
    }
    if (a2 != MEMORY[0x1E0C81258])
LABEL_3:
      CFLog();
LABEL_4:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = 1;
LABEL_6:
  if (_waitForResponseQueue_once != -1)
    dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___workQueueCopyConnection_block_invoke_5;
  v5[3] = &unk_1E28821B0;
  v6 = v4;
  v5[4] = a2;
  dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v5);
}

void ___workQueueCopyConnection_block_invoke_4()
{
  if (_workQueueCopyConnection_conn)
  {
    xpc_connection_cancel((xpc_connection_t)_workQueueCopyConnection_conn);
    xpc_release((xpc_object_t)_workQueueCopyConnection_conn);
    _workQueueCopyConnection_conn = 0;
  }
}

intptr_t ___workQueueCopyConnection_block_invoke_5(intptr_t result)
{
  if (_waitForResponseQueueIsWaiting == 1)
  {
    _waitForResponseQueueIsWaiting = 0;
    if (*(_BYTE *)(result + 40))
      _waitForResponseQueueResponse = (uint64_t)xpc_retain(*(xpc_object_t *)(result + 32));
    if (_waitForResponseSema_once != -1)
      dispatch_once(&_waitForResponseSema_once, &__block_literal_global_150);
    return dispatch_semaphore_signal((dispatch_semaphore_t)_waitForResponseSema_sema);
  }
  return result;
}

dispatch_queue_t ___waitForResponseQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.CPLogging.waitForResponseQueue", 0);
  _waitForResponseQueue_queue = (uint64_t)result;
  return result;
}

dispatch_semaphore_t ___waitForResponseSema_block_invoke()
{
  dispatch_semaphore_t result;

  result = dispatch_semaphore_create(0);
  _waitForResponseSema_sema = (uint64_t)result;
  return result;
}

void ___workQueueSlurpToFileUUID_block_invoke(uint64_t a1)
{
  _waitForResponseQueueIsWaiting = 1;
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
}

void ___workQueueSlurpToFileUUID_block_invoke_2(uint64_t a1)
{
  if (_waitForResponseQueueResponse)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = xpc_retain((xpc_object_t)_waitForResponseQueueResponse);
    xpc_release((xpc_object_t)_waitForResponseQueueResponse);
    _waitForResponseQueueResponse = 0;
  }
}

uint64_t ___obfuscatedStringKey_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_obfuscatedStringKey_key, (void (__cdecl *)(void *))_releaseObfuscatedStrings);
}

CFNumberFormatterRef ___obfuscatedRepresentation_block_invoke()
{
  const __CFLocale *System;
  CFNumberFormatterRef result;

  System = CFLocaleGetSystem();
  result = CFNumberFormatterCreate(0, System, kCFNumberFormatterNoStyle);
  _obfuscatedRepresentation_numberFormatter = (uint64_t)result;
  return result;
}

uint64_t ___startObservingDefaultChanges_block_invoke()
{
  if (_configurationQueue_once != -1)
    dispatch_once(&_configurationQueue_once, &__block_literal_global_177);
  notify_register_dispatch("com.apple.managedconfiguration.defaultsdidchange", (int *)&_startObservingDefaultChanges_token, (dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_171);
  if (_configurationQueue_once != -1)
    dispatch_once(&_configurationQueue_once, &__block_literal_global_177);
  return notify_register_dispatch("com.apple.AppSupport.loggingDefaultsChanged", (int *)&_startObservingDefaultChanges_token, (dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_173);
}

uint64_t _configurationQueueRereadAllDefaults()
{
  unint64_t *i;

  for (i = (unint64_t *)atomic_load(&_logFileSettings); i; i = (unint64_t *)atomic_load(i))
    _configurationQueueRereadDefaultsForSetting((uint64_t)i);
  if (_recomputeQueue_onceToken != -1)
    dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_175);
  dispatch_async((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_174);
  return _rereadObfuscationPreferences();
}

dispatch_queue_t ___recomputeQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.CPLogging.recomputeQueue", 0);
  _recomputeQueue_queue = (uint64_t)result;
  return result;
}

dispatch_queue_t ___configurationQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.CPLogging.configurationQueue", 0);
  _configurationQueue_queue = (uint64_t)result;
  return result;
}

uint64_t _configurationQueueReadDefaultsValue(const __CFString *a1, const __CFString *a2)
{
  uint64_t v3;
  const __CFString *v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeID v8;
  SInt32 IntValue;
  int valuePtr;

  v3 = 4294967293;
  valuePtr = -3;
  if (a1)
    v4 = a1;
  else
    v4 = CFSTR(".GlobalPreferences");
  CFPreferencesAppSynchronize(v4);
  v5 = (const __CFNumber *)CFPreferencesCopyAppValue(a2, v4);
  if (!v5)
    return v3;
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 == CFNumberGetTypeID())
  {
    if (CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr))
      goto LABEL_11;
    goto LABEL_10;
  }
  v8 = CFGetTypeID(v6);
  if (v8 != CFStringGetTypeID()
    || (IntValue = CFStringGetIntValue((CFStringRef)v6), (IntValue - 0x7FFFFFFF) <= 1))
  {
LABEL_10:
    CFLog();
    goto LABEL_11;
  }
  valuePtr = IntValue;
LABEL_11:
  CFRelease(v6);
  v3 = valuePtr;
  if (valuePtr <= -4)
  {
    CFLog();
    return 4294967293;
  }
  return v3;
}

void ___workQueueCopyFileUUIDForLogPath_block_invoke(uint64_t a1)
{
  _waitForResponseQueueIsWaiting = 1;
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
}

void ___workQueueCopyFileUUIDForLogPath_block_invoke_2(uint64_t a1)
{
  if (_waitForResponseQueueResponse)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = xpc_retain((xpc_object_t)_waitForResponseQueueResponse);
    xpc_release((xpc_object_t)_waitForResponseQueueResponse);
    _waitForResponseQueueResponse = 0;
  }
}

void ___workQueueStartNewLogFile_block_invoke(uint64_t a1)
{
  _waitForResponseQueueIsWaiting = 1;
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
}

void ___workQueueStartNewLogFile_block_invoke_2(uint64_t a1)
{
  if (_waitForResponseQueueResponse)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = xpc_retain((xpc_object_t)_waitForResponseQueueResponse);
    xpc_release((xpc_object_t)_waitForResponseQueueResponse);
    _waitForResponseQueueResponse = 0;
  }
}

void ___setLogName_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  if (v1)
  {
    v2 = *(const void **)(v1 + 8);
    if (v2)
      CFRelease(v2);
    *(_QWORD *)(v1 + 8) = 0;
  }
}

void ___setLogDirectory_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  if (v1)
  {
    v2 = *(const void **)(v1 + 8);
    if (v2)
      CFRelease(v2);
    *(_QWORD *)(v1 + 8) = 0;
  }
}

uint64_t CPFileCompressionZDeflate(uint64_t a1)
{
  uint64_t v1;
  FILE *v2;
  FILE *v3;
  FILE *v4;
  int v5;
  uint64_t v6;
  int v7;
  size_t v8;
  z_stream v10;
  _BYTE __ptr[8192];
  _QWORD v12[1025];

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v4 = (FILE *)v1;
  v12[1024] = *MEMORY[0x1E0C80C00];
  memset(&v10, 0, sizeof(v10));
  v6 = deflateInit2_(&v10, v5, 8, 31, 8, 0, "1.2.12", 112);
  if (!(_DWORD)v6)
  {
LABEL_2:
    v10.avail_in = fread(v12, 1uLL, 0x2000uLL, v4);
    if (!ferror(v4))
    {
      v7 = feof(v4);
      v10.next_in = (Bytef *)v12;
      while (1)
      {
        v10.avail_out = 0x2000;
        v10.next_out = __ptr;
        deflate(&v10, 4 * (v7 != 0));
        v8 = 0x2000 - v10.avail_out;
        if (fwrite(__ptr, 1uLL, v8, v3) != v8 || ferror(v3))
          break;
        if (v10.avail_out)
        {
          if (!v7)
            goto LABEL_2;
          v6 = 0;
          goto LABEL_10;
        }
      }
    }
    v6 = 0xFFFFFFFFLL;
LABEL_10:
    deflateEnd(&v10);
  }
  return v6;
}

uint64_t __deallocatorCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnSlot:", a1);
}

uint64_t CPDNCheckIn(int a1, int a2)
{
  _BYTE msg[28];
  int v4;
  int v5;
  int v6;

  v5 = 0;
  *(_OWORD *)&msg[4] = 0u;
  v4 = a2;
  v6 = 1310720;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_QWORD *)&msg[20] = 0x1000130B0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 1, 0x28u, 0, 0, 0, 0);
}

uint64_t (*CPDistributedNotificationCheckIn_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 78000)
    return _XCheckIn;
  else
    return 0;
}

uint64_t _XCheckIn(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
      {
        v4 = *(unsigned int *)(result + 12);
        v5 = *(unsigned int *)(result + 28);
        v6 = *(_OWORD *)(result + 76);
        v7[0] = *(_OWORD *)(result + 60);
        v7[1] = v6;
        result = _CPDNCheckIn(v4, v5, (uint64_t)v7);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      v3 = -309;
    }
    else
    {
      v3 = -300;
    }
  }
  else
  {
    v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t CPDistributedNotificationCheckIn_server(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[2];

  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a2 + 4) = 36;
  *(_DWORD *)(a2 + 8) = v3;
  v4 = *(_DWORD *)(a1 + 20) + 100;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v4;
  *(_DWORD *)(a2 + 12) = 0;
  if (*(_DWORD *)(a1 + 20) != 78000)
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 40)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(a1 + 40) && *(_DWORD *)(a1 + 44) > 0x1Fu)
      {
        v7 = *(unsigned int *)(a1 + 12);
        v8 = *(unsigned int *)(a1 + 28);
        v9 = *(_OWORD *)(a1 + 76);
        v10[0] = *(_OWORD *)(a1 + 60);
        v10[1] = v9;
        *(_DWORD *)(a2 + 32) = _CPDNCheckIn(v7, v8, (uint64_t)v10);
        return 1;
      }
      v5 = -309;
    }
    else
    {
      v5 = -300;
    }
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return 1;
}

uint64_t CPDNDeliverNotification(int a1, vm_address_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v7;
  uint64_t v9;
  int v10;
  __int128 v11;
  vm_address_t v12;
  int v13;
  _DWORD v14[4];
  _DWORD v15[6];

  v12 = a2;
  v13 = 16777472;
  v14[0] = a3;
  *(_QWORD *)&v14[1] = a4;
  v14[3] = 16777472;
  v15[0] = a5;
  *(_QWORD *)&v15[1] = *MEMORY[0x1E0C804E8];
  v15[3] = a3;
  v15[4] = a5;
  v9 = 2147483667;
  v10 = a1;
  v11 = xmmword_18EB49160;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
  v7 = mach_msg((mach_msg_header_t *)&v9, 17, 0x4Cu, 0, 0, 0, 0);
  if ((_DWORD)v7 == 268435460)
  {
    if (v12 != a2)
      mig_deallocate(v12, v14[0]);
    if (*(_QWORD *)&v14[1] != a4)
      mig_deallocate(*(vm_address_t *)&v14[1], v15[0]);
  }
  return v7;
}

void (*CPDistributedNotification_server_routine(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 77000)
    return _XDeliverNotification;
  else
    return 0;
}

void _XDeliverNotification(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 76)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && *(_BYTE *)(a1 + 55) == 1)
    {
      v3 = *(_DWORD *)(a1 + 40);
      if (v3 == *(_DWORD *)(a1 + 68))
      {
        v4 = *(_DWORD *)(a1 + 56);
        if (v4 == *(_DWORD *)(a1 + 72))
        {
          *(_DWORD *)(a2 + 32) = _CPDNDeliverNotification(*(unsigned int *)(a1 + 12), *(_QWORD *)(a1 + 28), v3, *(_QWORD *)(a1 + 44), v4);
          mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
          *(_QWORD *)(a1 + 44) = 0;
          *(_DWORD *)(a1 + 56) = 0;
          mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
          *(_QWORD *)(a1 + 28) = 0;
          *(_DWORD *)(a1 + 40) = 0;
          return;
        }
      }
    }
    v5 = -300;
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

uint64_t CPDistributedNotification_server(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v5;
  unsigned int v6;
  uint64_t result;
  int v8;

  v2 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = *(_DWORD *)(a1 + 20) + 100;
  *(_QWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (*(_DWORD *)(a1 + 20) != 77000)
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 76)
  {
    v8 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v8;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return 1;
  }
  if (*(_BYTE *)(a1 + 39) != 1
    || *(_BYTE *)(a1 + 55) != 1
    || (v5 = *(_DWORD *)(a1 + 40), v5 != *(_DWORD *)(a1 + 68))
    || (v6 = *(_DWORD *)(a1 + 56), v6 != *(_DWORD *)(a1 + 72)))
  {
    v8 = -300;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 32) = _CPDNDeliverNotification(*(unsigned int *)(a1 + 12), *(_QWORD *)(a1 + 28), v5, *(_QWORD *)(a1 + 44), v6);
  mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(_QWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  return 1;
}

uint64_t CPDMMessage(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  _BYTE msg[28];
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;

  v11 = a2;
  v12 = 16777472;
  v13 = a3;
  v14 = a4;
  v15 = 16777472;
  v16 = a5;
  v17 = a6;
  v18 = 16777472;
  v19 = a7;
  v20 = a8;
  v21 = 16777472;
  v22 = a9;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a3;
  v25 = a5;
  v26 = a7;
  v27 = a9;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18EB49190;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 1, 0x74u, 0, 0, 0, 0);
}

uint64_t CPDMTwoWayMessage(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7, uint64_t a8, int a9, uint64_t a10, int a11, _QWORD *a12, _DWORD *a13, _QWORD *a14, _DWORD *a15)
{
  mach_port_t reply_port;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  mach_msg_header_t msg;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  int v42;
  int v43;

  v26 = 4;
  v27 = a2;
  v28 = 16777472;
  v29 = a3;
  v30 = a4;
  v31 = 16777472;
  v32 = a5;
  v33 = a8;
  v34 = 16777472;
  v35 = a9;
  v36 = a10;
  v37 = 16777472;
  v38 = a11;
  v39 = *MEMORY[0x1E0C804E8];
  v40 = a3;
  v41 = a5;
  v42 = a9;
  v43 = a11;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1349900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v19 = mach_msg(&msg, 3, 0x74u, 0x68u, reply_port, 0, 0);
  v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        v20 = 4294966988;
      }
      else if (msg.msgh_id == 79101)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v20 = 4294966996;
          if (v26 == 3
            && msg.msgh_size == 96
            && !msg.msgh_remote_port
            && HIBYTE(v28) == 1
            && HIBYTE(v31) == 1
            && HIBYTE(v34) == 1)
          {
            v21 = v29;
            if (v29 == v37)
            {
              v22 = v32;
              if (v32 == v38)
              {
                v23 = v35;
                if (v35 == (_DWORD)v39)
                {
                  v20 = 0;
                  *a6 = v27;
                  *a7 = v21;
                  *a12 = v30;
                  *a13 = v22;
                  *a14 = v33;
                  *a15 = v23;
                  return v20;
                }
              }
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v20 = 4294966996;
          if (HIDWORD(v27))
          {
            if (msg.msgh_remote_port)
              v20 = 4294966996;
            else
              v20 = HIDWORD(v27);
          }
        }
        else
        {
          v20 = 4294966996;
        }
      }
      else
      {
        v20 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v20;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v20;
}

uint64_t CPDMTwoWayMessageWithPortPassing(int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, _QWORD *a7, _DWORD *a8, uint64_t a9, int a10, uint64_t a11, int a12, _QWORD *a13, _DWORD *a14, _QWORD *a15, _DWORD *a16)
{
  mach_port_t reply_port;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v26;
  _BYTE rcv_name[32];
  int v28;
  _BYTE v29[12];
  int v30;
  _BYTE v31[12];
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  int v42;
  int v43;

  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_DWORD *)&rcv_name[20] = 5;
  *(_DWORD *)&rcv_name[24] = a2;
  v28 = 1310720;
  *(_QWORD *)v29 = a3;
  *(_DWORD *)&v29[8] = 16777472;
  v30 = a4;
  *(_QWORD *)v31 = a5;
  *(_DWORD *)&v31[8] = 16777472;
  v32 = a6;
  v33 = a9;
  v34 = 16777472;
  v35 = a10;
  v36 = a11;
  v37 = 16777472;
  v38 = a12;
  v39 = *MEMORY[0x1E0C804E8];
  v40 = a4;
  v41 = a6;
  v42 = a10;
  v43 = a12;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v26 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x1349A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v26);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v20 = mach_msg((mach_msg_header_t *)&v26, 3, 0x80u, 0x68u, reply_port, 0, 0);
  v21 = v20;
  if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v20)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v21 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 79102)
      {
        if (v26 < 0)
        {
          v21 = 4294966996;
          if (*(_DWORD *)&rcv_name[20] == 3
            && *(_DWORD *)rcv_name == 96
            && !*(_DWORD *)&rcv_name[4]
            && HIBYTE(v28) == 1
            && HIBYTE(v30) == 1
            && HIBYTE(v32) == 1)
          {
            v22 = *(_DWORD *)v29;
            if (*(_DWORD *)v29 == v35)
            {
              v23 = *(_DWORD *)v31;
              if (*(_DWORD *)v31 == (_DWORD)v36)
              {
                v24 = v33;
                if ((_DWORD)v33 == HIDWORD(v36))
                {
                  v21 = 0;
                  *a7 = *(_QWORD *)&rcv_name[24];
                  *a8 = v22;
                  *a13 = *(_QWORD *)&v29[4];
                  *a14 = v23;
                  *a15 = *(_QWORD *)&v31[4];
                  *a16 = v24;
                  return v21;
                }
              }
            }
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          v21 = 4294966996;
          if (*(_DWORD *)&rcv_name[28])
          {
            if (*(_DWORD *)&rcv_name[4])
              v21 = 4294966996;
            else
              v21 = *(unsigned int *)&rcv_name[28];
          }
        }
        else
        {
          v21 = 4294966996;
        }
      }
      else
      {
        v21 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v26);
      return v21;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  return v21;
}

uint64_t CPDMNonBlockingMessage(int a1, vm_address_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, mach_msg_timeout_t a10)
{
  uint64_t v14;
  _BYTE msg[28];
  vm_address_t v17;
  int v18;
  _DWORD v19[4];
  _DWORD v20[4];
  _DWORD v21[4];
  _DWORD v22[8];

  v17 = a2;
  v18 = 16777472;
  v19[0] = a3;
  *(_QWORD *)&v19[1] = a4;
  v19[3] = 16777472;
  v20[0] = a5;
  *(_QWORD *)&v20[1] = a6;
  v20[3] = 16777472;
  v21[0] = a7;
  *(_QWORD *)&v21[1] = a8;
  v21[3] = 16777472;
  v22[0] = a9;
  *(_QWORD *)&v22[1] = *MEMORY[0x1E0C804E8];
  v22[3] = a3;
  v22[4] = a5;
  v22[5] = a7;
  v22[6] = a9;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18EB491A0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v14 = mach_msg((mach_msg_header_t *)msg, 17, 0x74u, 0, 0, a10, 0);
  if ((_DWORD)v14 == 268435460)
  {
    if (v17 != a2)
      mig_deallocate(v17, v19[0]);
    if (*(_QWORD *)&v19[1] != a4)
      mig_deallocate(*(vm_address_t *)&v19[1], v20[0]);
    if (*(_QWORD *)&v20[1] != a6)
      mig_deallocate(*(vm_address_t *)&v20[1], v21[0]);
    if (*(_QWORD *)&v21[1] != a8)
      mig_deallocate(*(vm_address_t *)&v21[1], v22[0]);
  }
  return v14;
}

uint64_t (*CPDistributedMessaging_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 79004) >= 0xFFFFFFFC)
    return _CPDMCPDistributedMessaging_subsystem[5 * (v1 - 79000) + 5];
  else
    return 0;
}

void _XMessage(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UInt8 *v11;
  __int128 v12;
  _OWORD v14[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 4 && *(_DWORD *)(a1 + 4) == 116)
  {
    if (*(_BYTE *)(a1 + 39) == 1
      && *(_BYTE *)(a1 + 55) == 1
      && *(_BYTE *)(a1 + 71) == 1
      && *(_BYTE *)(a1 + 87) == 1
      && (v2 = *(_DWORD *)(a1 + 40), v2 == *(_DWORD *)(a1 + 100))
      && (v3 = *(_DWORD *)(a1 + 56), v3 == *(_DWORD *)(a1 + 104))
      && (v4 = *(_DWORD *)(a1 + 72), v4 == *(_DWORD *)(a1 + 108))
      && (v5 = *(_DWORD *)(a1 + 88), v5 == *(_DWORD *)(a1 + 112)))
    {
      if (!*(_DWORD *)(a1 + 116) && *(_DWORD *)(a1 + 120) > 0x1Fu)
      {
        v7 = *(unsigned int *)(a1 + 12);
        v8 = *(_QWORD *)(a1 + 28);
        v9 = *(_QWORD *)(a1 + 44);
        v10 = *(_QWORD *)(a1 + 60);
        v11 = *(UInt8 **)(a1 + 76);
        v12 = *(_OWORD *)(a1 + 152);
        v14[0] = *(_OWORD *)(a1 + 136);
        v14[1] = v12;
        *(_DWORD *)(a2 + 32) = _CPDMMessage(v7, v8, v2, v9, v3, v10, v4, v11, v5, (uint64_t)v14);
        mig_deallocate(*(_QWORD *)(a1 + 60), *(unsigned int *)(a1 + 72));
        *(_QWORD *)(a1 + 60) = 0;
        *(_DWORD *)(a1 + 72) = 0;
        mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(_QWORD *)(a1 + 44) = 0;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      v6 = -309;
    }
    else
    {
      v6 = -300;
    }
  }
  else
  {
    v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XTwoWayMessage(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _DWORD *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  UInt8 *v16;
  unsigned int v17;
  __int128 v18;
  int v20;
  int v21;
  _OWORD v23[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 4 || *(_DWORD *)(a1 + 4) != 116)
  {
    v2 = -304;
    goto LABEL_16;
  }
  if (*(_BYTE *)(a1 + 39) != 1
    || *(_BYTE *)(a1 + 55) != 1
    || *(_BYTE *)(a1 + 71) != 1
    || *(_BYTE *)(a1 + 87) != 1
    || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 100)
    || *(_DWORD *)(a1 + 56) != *(_DWORD *)(a1 + 104)
    || *(_DWORD *)(a1 + 72) != *(_DWORD *)(a1 + 108)
    || *(_DWORD *)(a1 + 88) != *(_DWORD *)(a1 + 112))
  {
    v2 = -300;
    goto LABEL_16;
  }
  if (*(_DWORD *)(a1 + 116) || *(_DWORD *)(a1 + 120) <= 0x1Fu)
  {
    v2 = -309;
LABEL_16:
    *(_DWORD *)(a2 + 32) = v2;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return;
  }
  *(_DWORD *)(a2 + 84) = 0;
  v3 = a2 + 84;
  *(_DWORD *)(a2 + 36) = 16777472;
  v4 = a2 + 28;
  v5 = (_QWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 52) = 16777472;
  v6 = (_QWORD *)(a2 + 60);
  *(_DWORD *)(a2 + 68) = 16777472;
  *(_DWORD *)(a2 + 88) = 0;
  v7 = (_DWORD *)(a2 + 88);
  v8 = *(_DWORD *)(a1 + 8);
  v9 = *(unsigned int *)(a1 + 12);
  v10 = *(_QWORD *)(a1 + 28);
  v11 = *(_DWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 44);
  v13 = *(_DWORD *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 60);
  v15 = *(_DWORD *)(a1 + 72);
  v16 = *(UInt8 **)(a1 + 76);
  v17 = *(_DWORD *)(a1 + 88);
  v18 = *(_OWORD *)(a1 + 152);
  v23[0] = *(_OWORD *)(a1 + 136);
  v23[1] = v18;
  v20 = _CPDMTwoWayMessage(v9, v8, v10, v11, v12, v13, v4, v3, v14, v15, v16, v17, v5, v7, v6, (_DWORD *)(v3 + 8), (uint64_t)v23);
  mig_deallocate(*(_QWORD *)(a1 + 60), *(unsigned int *)(a1 + 72));
  *(_QWORD *)(a1 + 60) = 0;
  *(_DWORD *)(a1 + 72) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(_QWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  if (v20)
  {
    *(_DWORD *)(a2 + 32) = v20;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    v21 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 84);
    *(_DWORD *)(a2 + 56) = v21;
    *(_DWORD *)(a2 + 72) = *(_DWORD *)(a2 + 92);
    *(_QWORD *)(a2 + 76) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 96;
    *(_DWORD *)(a2 + 24) = 3;
  }
}

void _XTwoWayMessageWithPortPassing(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _DWORD *v8;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  UInt8 *v19;
  unsigned int v20;
  __int128 v21;
  int v22;
  int v23;
  _OWORD v25[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 5 || *(_DWORD *)(a1 + 4) != 128)
  {
    v3 = -304;
    goto LABEL_17;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(_BYTE *)(a1 + 51) != 1
    || *(_BYTE *)(a1 + 67) != 1
    || *(_BYTE *)(a1 + 83) != 1
    || *(_BYTE *)(a1 + 99) != 1
    || *(_DWORD *)(a1 + 52) != *(_DWORD *)(a1 + 112)
    || *(_DWORD *)(a1 + 68) != *(_DWORD *)(a1 + 116)
    || *(_DWORD *)(a1 + 84) != *(_DWORD *)(a1 + 120)
    || *(_DWORD *)(a1 + 100) != *(_DWORD *)(a1 + 124))
  {
    v3 = -300;
    goto LABEL_17;
  }
  v2 = a1 + 128;
  if (*(_DWORD *)(a1 + 128) || *(_DWORD *)(a1 + 132) <= 0x1Fu)
  {
    v3 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v3;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return;
  }
  *(_DWORD *)(a2 + 84) = 0;
  v4 = a2 + 84;
  *(_DWORD *)(a2 + 36) = 16777472;
  v5 = a2 + 28;
  v6 = (_QWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 52) = 16777472;
  v7 = (_QWORD *)(a2 + 60);
  *(_DWORD *)(a2 + 68) = 16777472;
  *(_DWORD *)(a2 + 88) = 0;
  v8 = (_DWORD *)(a2 + 88);
  v10 = *(unsigned int *)(a1 + 12);
  v11 = *(_DWORD *)(a1 + 8);
  v12 = *(_DWORD *)(a1 + 28);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(_DWORD *)(a1 + 52);
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_DWORD *)(a1 + 68);
  v17 = *(_QWORD *)(a1 + 72);
  v18 = *(_DWORD *)(a1 + 84);
  v19 = *(UInt8 **)(a1 + 88);
  v20 = *(_DWORD *)(a1 + 100);
  v21 = *(_OWORD *)(v2 + 36);
  v25[0] = *(_OWORD *)(v2 + 20);
  v25[1] = v21;
  v22 = _CPDMTwoWayMessageWithPortPassing(v10, v11, v12, v13, v14, v15, v16, v5, v4, v17, v18, v19, v20, v6, v8, v7, (_DWORD *)(v4 + 8), (uint64_t)v25);
  mig_deallocate(*(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 84));
  *(_QWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 84) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68));
  *(_QWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 68) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(_QWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  if (v22)
  {
    *(_DWORD *)(a2 + 32) = v22;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    v23 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 84);
    *(_DWORD *)(a2 + 56) = v23;
    *(_DWORD *)(a2 + 72) = *(_DWORD *)(a2 + 92);
    *(_QWORD *)(a2 + 76) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 96;
    *(_DWORD *)(a2 + 24) = 3;
  }
}

void _XNonBlockingMessage(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UInt8 *v11;
  __int128 v12;
  _OWORD v14[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 4 && *(_DWORD *)(a1 + 4) == 116)
  {
    if (*(_BYTE *)(a1 + 39) == 1
      && *(_BYTE *)(a1 + 55) == 1
      && *(_BYTE *)(a1 + 71) == 1
      && *(_BYTE *)(a1 + 87) == 1
      && (v2 = *(_DWORD *)(a1 + 40), v2 == *(_DWORD *)(a1 + 100))
      && (v3 = *(_DWORD *)(a1 + 56), v3 == *(_DWORD *)(a1 + 104))
      && (v4 = *(_DWORD *)(a1 + 72), v4 == *(_DWORD *)(a1 + 108))
      && (v5 = *(_DWORD *)(a1 + 88), v5 == *(_DWORD *)(a1 + 112)))
    {
      if (!*(_DWORD *)(a1 + 116) && *(_DWORD *)(a1 + 120) > 0x1Fu)
      {
        v7 = *(unsigned int *)(a1 + 12);
        v8 = *(_QWORD *)(a1 + 28);
        v9 = *(_QWORD *)(a1 + 44);
        v10 = *(_QWORD *)(a1 + 60);
        v11 = *(UInt8 **)(a1 + 76);
        v12 = *(_OWORD *)(a1 + 152);
        v14[0] = *(_OWORD *)(a1 + 136);
        v14[1] = v12;
        *(_DWORD *)(a2 + 32) = _CPDMNonBlockingMessage(v7, v8, v2, v9, v3, v10, v4, v11, v5, (uint64_t)v14);
        mig_deallocate(*(_QWORD *)(a1 + 60), *(unsigned int *)(a1 + 72));
        *(_QWORD *)(a1 + 60) = 0;
        *(_DWORD *)(a1 + 72) = 0;
        mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(_QWORD *)(a1 + 44) = 0;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      v6 = -309;
    }
    else
    {
      v6 = -300;
    }
  }
  else
  {
    v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

uint64_t CPDistributedMessaging_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 79004) >= 0xFFFFFFFC
    && (v5 = (void (*)(void))_CPDMCPDistributedMessaging_subsystem[5 * (v4 - 79000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t CPDMTwoWayMessageReply(unsigned int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  int v9;
  mach_msg_size_t v10;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[28];

  memset(v17, 0, sizeof(v17));
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  if (a2)
  {
    HIDWORD(v14) = a2;
    *(_QWORD *)((char *)&v14 + 4) = *MEMORY[0x1E0C804E8];
    v9 = 18;
  }
  else
  {
    DWORD1(v14) = 3;
    *((_QWORD *)&v14 + 1) = a3;
    LODWORD(v15) = 16777472;
    DWORD1(v15) = a4;
    *((_QWORD *)&v15 + 1) = a5;
    LODWORD(v16) = 16777472;
    DWORD1(v16) = a6;
    *((_QWORD *)&v16 + 1) = a7;
    *(_DWORD *)v17 = 16777472;
    *(_DWORD *)&v17[4] = a8;
    *(_QWORD *)&v17[8] = *MEMORY[0x1E0C804E8];
    *(_DWORD *)&v17[16] = a4;
    *(_DWORD *)&v17[20] = a6;
    *(_DWORD *)&v17[24] = a8;
    v9 = -2147483630;
  }
  v12 = v9;
  *(_QWORD *)((char *)&v13 + 4) = a1;
  HIDWORD(v13) = 0;
  LODWORD(v14) = 79101;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v12);
  if (a2)
    v10 = 36;
  else
    v10 = 96;
  return mach_msg((mach_msg_header_t *)&v12, 1, v10, 0, 0, 0, 0);
}

uint64_t CPDMTwoWayMessageReplyWithPortPassing(unsigned int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  int v9;
  mach_msg_size_t v10;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[28];

  memset(v17, 0, sizeof(v17));
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  if (a2)
  {
    HIDWORD(v14) = a2;
    *(_QWORD *)((char *)&v14 + 4) = *MEMORY[0x1E0C804E8];
    v9 = 18;
  }
  else
  {
    DWORD1(v14) = 3;
    *((_QWORD *)&v14 + 1) = a3;
    LODWORD(v15) = 16777472;
    DWORD1(v15) = a4;
    *((_QWORD *)&v15 + 1) = a5;
    LODWORD(v16) = 16777472;
    DWORD1(v16) = a6;
    *((_QWORD *)&v16 + 1) = a7;
    *(_DWORD *)v17 = 16777472;
    *(_DWORD *)&v17[4] = a8;
    *(_QWORD *)&v17[8] = *MEMORY[0x1E0C804E8];
    *(_DWORD *)&v17[16] = a4;
    *(_DWORD *)&v17[20] = a6;
    *(_DWORD *)&v17[24] = a8;
    v9 = -2147483630;
  }
  v12 = v9;
  *(_QWORD *)((char *)&v13 + 4) = a1;
  HIDWORD(v13) = 0;
  LODWORD(v14) = 79102;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v12);
  if (a2)
    v10 = 36;
  else
    v10 = 96;
  return mach_msg((mach_msg_header_t *)&v12, 1, v10, 0, 0, 0, 0);
}

void CPFreeSpaceRequestBytesAtPathWithCompletionBlock_cold_1(uint64_t a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a2;
  v3 = 2048;
  v4 = a1;
  _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "free space request: caller requested unsupported effort level %d for block %p", (uint8_t *)v2, 0x12u);
}

void CPFreeSpaceRequestBytesAtPathWithCompletionBlock_cold_2(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)objc_msgSend(a1, "domain"), "UTF8String");
  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0(&dword_18EB0F000, MEMORY[0x1E0C81028], v2, "free space request: failed to get total space and available space with error domain %s code %lld for block %p", v3, v4, v5, v6, 2u);
}

void GetTotalCapacityAndAvailableCapacityForMountPoint_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "free space request: failed to stat the mount point", v0, 2u);
}

void checkResultWithStatement_cold_1(uint64_t a1, int a2, int a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109634;
  v3[1] = a2;
  v4 = 1024;
  v5 = a3;
  v6 = 2082;
  v7 = a1;
  _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "SQLITE Error: %i, extended error: %i, error message: %{public}s", (uint8_t *)v3, 0x18u);
}

void CPDeleteTree_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18EB0F000, v1, v2, "fts_close failed: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void CPPathUtils_MakePath_cold_1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2080;
  v5 = a1;
  _os_log_error_impl(&dword_18EB0F000, log, OS_LOG_TYPE_ERROR, "_CStringPathUtils_FileAtPathExists: stat failed. errno = %d, path = %s", (uint8_t *)v3, 0x12u);
}

void __getRBSProcessHandleClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSProcessHandleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPInhibitor.m"), 15, CFSTR("Unable to find class %s"), "RBSProcessHandle");

  __break(1u);
}

void RunningBoardServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CPInhibitor.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getRBSTargetClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSTargetClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPInhibitor.m"), 16, CFSTR("Unable to find class %s"), "RBSTarget");

  __break(1u);
}

void __getRBSDomainAttributeClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSDomainAttributeClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPInhibitor.m"), 17, CFSTR("Unable to find class %s"), "RBSDomainAttribute");

  __break(1u);
}

void __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSAcquisitionCompletionAttributeClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPInhibitor.m"), 18, CFSTR("Unable to find class %s"), "RBSAcquisitionCompletionAttribute");

  __break(1u);
}

void __getRBSAssertionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSAssertionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPInhibitor.m"), 14, CFSTR("Unable to find class %s"), "RBSAssertion");

  __break(1u);
}

void __getNPSDomainAccessorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *NanoPreferencesSyncLibrary(void)"), CFSTR("SysConfigUtils.m"), 28, CFSTR("%s"), *a1);
  __break(1u);
}

void __getNPSDomainAccessorClass_block_invoke_cold_2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNPSDomainAccessorClass(void)_block_invoke"), CFSTR("SysConfigUtils.m"), 29, CFSTR("Unable to find class %s"), "NPSDomainAccessor");
  __break(1u);
}

void __getNSSManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *NanoSystemSettingsLibrary(void)"), CFSTR("SysConfigUtils.m"), 20, CFSTR("%s"), *a1);
  __break(1u);
}

void __getNSSManagerClass_block_invoke_cold_2()
{
  void *v0;
  unsigned __int8 *v1;
  CC_SHA1_CTX *v2;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (unsigned __int8 *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNSSManagerClass(void)_block_invoke"), CFSTR("SysConfigUtils.m"), 21, CFSTR("Unable to find class %s"), "NSSManager");
  __break(1u);
  CC_SHA1_Final(v1, v2);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1E0C97D08](theArray, range.location, range.length, value, comparator, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
  MEMORY[0x1E0C97DC8](theArray, range.location, range.length, newValues, newCount);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1E0C97F68](allocator, capacity);
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return MEMORY[0x1E0C97F88](bv);
}

CFIndex CFBitVectorGetFirstIndexOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1E0C97F98](bv, range.location, range.length, *(_QWORD *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
  MEMORY[0x1E0C97FB0](bv, idx, *(_QWORD *)&value);
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
  MEMORY[0x1E0C97FC0](bv, count);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98458](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

uint64_t CFDateFormatterCreateDateFormatsFromTemplates()
{
  return MEMORY[0x1E0C98470]();
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x1E0C984A8](formatter);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1E0C98658](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987A0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C987F0]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
}

uint64_t CFLog()
{
  return MEMORY[0x1E0C98808]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1E0C98938](allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithNumber(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberRef number)
{
  return (CFStringRef)MEMORY[0x1E0C98948](allocator, formatter, number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
  MEMORY[0x1E0C98CD0](source, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x1E0C98DD8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1E0C99128](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C991D0](theString, locale);
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99288](allocator, name, tryAbbrev);
}

CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  CFTimeInterval result;

  MEMORY[0x1E0C992A0](tz, at);
  return result;
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99390](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1E0C9C5A8](info, cbks);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x1E0C9C5D0](consumer);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5E0](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC340](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5A0](provider, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB708](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x1E0CBB750](time_to_wake, my_id, type);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBB7A8]();
}

IOReturn IOPMSchedulePowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x1E0CBB7F0](time_to_wake, my_id, type);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x1E0D17868]();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x1E0D17878]();
}

uint64_t PNDecomposeForCountry()
{
  return MEMORY[0x1E0D17880]();
}

uint64_t PNPhoneNumbersEqual()
{
  return MEMORY[0x1E0D17898]();
}

int SCError(void)
{
  return MEMORY[0x1E0CE87E0]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE88E8](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8900](target, runLoop, runLoopMode);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89B8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89C0](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89C8](allocator, name, prefsID);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89D0](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE89E0](prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1E0CE89E8](prefs, wait);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE89F8](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1E0CE8A00](prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE8A10](prefs, queue);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x1E0CE8A28](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x1E0CE8A30](prefs);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE8A38](prefs);
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8A40](prefs, runLoop, runLoopMode);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _PNCopyCountryCodeForInternationalCode()
{
  return MEMORY[0x1E0D178A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
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

uint64_t _sqlite3_system_busy_handler()
{
  return MEMORY[0x1E0DE8548]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void asl_free(asl_object_t obj)
{
  MEMORY[0x1E0C815C8](obj);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x1E0C815D0](client, msg, *(_QWORD *)&level, format);
}

asl_object_t asl_new(uint32_t type)
{
  return (asl_object_t)MEMORY[0x1E0C815D8](*(_QWORD *)&type);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x1E0C815E0](ident, facility, *(_QWORD *)&opts);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1E0C81648](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C816F8](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1E0C81700]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C81710]();
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1E0C81728]();
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1E0DDFE98]();
}

uint64_t decomposedPhoneNumbersEqual()
{
  return MEMORY[0x1E0D178D0]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

uint64_t dispatch_mig_server()
{
  return MEMORY[0x1E0C82DF8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F30](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x1E0C834C0](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1E0C835F8](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x1E0C840F8](a1, a2);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C841D0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C84218](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x1E0C84768]();
}

uint64_t os_log_shim_with_CFString()
{
  return MEMORY[0x1E0C84770]();
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

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x1E0DE8630](a1, a2, a3);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

void *__cdecl sqlite3_commit_hook(sqlite3 *a1, int (__cdecl *a2)(void *), void *a3)
{
  return (void *)MEMORY[0x1E0DE86D8](a1, a2, a3);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1E0DE8708](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

void sqlite3_free_table(char **result)
{
  MEMORY[0x1E0DE87D8](result);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x1E0DE87E0](a1);
}

int sqlite3_get_table(sqlite3 *db, const char *zSql, char ***pazResult, int *pnRow, int *pnColumn, char **pzErrmsg)
{
  return MEMORY[0x1E0DE87F0](db, zSql, pazResult, pnRow, pnColumn, pzErrmsg);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1E0DE8868](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

void *__cdecl sqlite3_profile(sqlite3 *a1, void (__cdecl *xProfile)(void *, const char *, sqlite3_uint64), void *a3)
{
  return (void *)MEMORY[0x1E0DE8890](a1, xProfile, a3);
}

void sqlite3_progress_handler(sqlite3 *a1, int a2, int (__cdecl *a3)(void *), void *a4)
{
  MEMORY[0x1E0DE8898](a1, *(_QWORD *)&a2, a3, a4);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x1E0DE88D0](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x1E0DE88F0](a1, *(_QWORD *)&a2);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

void *__cdecl sqlite3_update_hook(sqlite3 *a1, void (__cdecl *a2)(void *, int, const char *, const char *, sqlite3_int64), void *a3)
{
  return (void *)MEMORY[0x1E0DE89F8](a1, a2, a3);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1E0DE8A10](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1E0DE8A18](a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A48](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

void srandom(unsigned int a1)
{
  MEMORY[0x1E0C85488](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

float strtof(const char *a1, char **a2)
{
  float result;

  MEMORY[0x1E0C85628](a1, a2);
  return result;
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1E0DE5988](*(_QWORD *)&code);
}

UBool u_isUUppercase(UChar32 c)
{
  return MEMORY[0x1E0DE5A00](*(_QWORD *)&c);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x1E0DE5AA0](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

void u_versionToString(const UVersionInfo versionArray, char *versionString)
{
  MEMORY[0x1E0DE5B38](versionArray, versionString);
}

uint64_t ubrk_close()
{
  return MEMORY[0x1E0DE5C98]();
}

uint64_t ubrk_isBoundary()
{
  return MEMORY[0x1E0DE5CD0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1E0DE5CE8]();
}

uint64_t ubrk_setText()
{
  return MEMORY[0x1E0DE5D08]();
}

uint64_t ucol_close()
{
  return MEMORY[0x1E0DE5F70]();
}

uint64_t ucol_open()
{
  return MEMORY[0x1E0DE6008]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x1E0DE6030]();
}

uint64_t ucol_setStrength()
{
  return MEMORY[0x1E0DE6038]();
}

uint64_t uloc_setKeywordValue()
{
  return MEMORY[0x1E0DE6468]();
}

uint64_t ulocdata_getCLDRVersion()
{
  return MEMORY[0x1E0DE6490]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

uint64_t usearch_close()
{
  return MEMORY[0x1E0DE68C8]();
}

uint64_t usearch_first()
{
  return MEMORY[0x1E0DE68D0]();
}

uint64_t usearch_getMatchedLength()
{
  return MEMORY[0x1E0DE68E0]();
}

uint64_t usearch_last()
{
  return MEMORY[0x1E0DE68E8]();
}

uint64_t usearch_next()
{
  return MEMORY[0x1E0DE68F0]();
}

uint64_t usearch_openFromCollator()
{
  return MEMORY[0x1E0DE6900]();
}

uint64_t usearch_setPattern()
{
  return MEMORY[0x1E0DE6928]();
}

uint64_t usearch_setText()
{
  return MEMORY[0x1E0DE6930]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1E0DE6A50](ut);
}

UBool utext_moveIndex32(UText *ut, int32_t delta)
{
  return MEMORY[0x1E0DE6A78](ut, *(_QWORD *)&delta);
}

UChar32 utext_next32(UText *ut)
{
  return MEMORY[0x1E0DE6A88](ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x1E0DE6A90](ut, s, length, status);
}

void utext_setNativeIndex(UText *ut, int64_t nativeIndex)
{
  MEMORY[0x1E0DE6AA8](ut, nativeIndex);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C866F0](region, length);
}

