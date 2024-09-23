@implementation CBPreferencesHandler

+ (void)consistencyCheckForUser:(id)a3
{
  NSObject *v3;
  os_log_type_t v4;
  NSObject *v5;
  CFStringRef *v6;
  CFStringRef *v7;
  NSObject *inited;
  CFStringRef *v9;
  CFStringRef *v10;
  uint8_t v11[15];
  char v12;
  NSObject *v13;
  id v14;
  os_log_type_t v15;
  os_log_t v16;
  id v17;
  CFStringRef v18;
  SEL v19;
  id v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = a1;
  v19 = a2;
  v18 = (CFStringRef)a3;
  v9 = (CFStringRef *)MEMORY[0x1E0C9B260];
  v10 = (CFStringRef *)MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v17 = 0;
  v17 = (id)CFPreferencesCopyValue(v18, CFSTR("com.apple.CoreBrightness"), *v9, *v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v17, "objectForKey:", CFSTR("DisplayServicesExternalAmbientLightCompensation")))
  {
    v16 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v16 = inited;
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_66((uint64_t)v21, (uint64_t)CFSTR("DisplayServicesExternalAmbientLightCompensation"), (uint64_t)v18);
      _os_log_impl(&dword_1B5291000, v16, v15, "detected deprecated key %@ for %{public}@ - removing", v21, 0x16u);
    }
    v14 = (id)objc_msgSend(v17, "mutableCopy");
    if (v14)
    {
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("DisplayServicesExternalAmbientLightCompensation"));
      v6 = (CFStringRef *)MEMORY[0x1E0C9B260];
      v7 = (CFStringRef *)MEMORY[0x1E0C9B230];
      CFPreferencesSetValue(v18, v14, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      if (!CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), *v6, *v7))
      {
        v13 = 0;
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v5 = init_default_corebrightness_log();
        v13 = v5;
        v12 = 16;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v3 = v13;
          v4 = v12;
          __os_log_helper_16_0_0(v11);
          _os_log_error_impl(&dword_1B5291000, v3, v4, "ERROR: failed to update the preferences after sanity check", v11, 2u);
        }
      }
    }

  }
}

+ (BOOL)storePreferenceForUser:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  CFStringRef *v6;
  CFStringRef *v7;
  CFTypeRef cf1;
  __CFDictionary *theDict;
  BOOL v10;

  v10 = 1;
  theDict = +[CBPreferencesHandler copyPreferenceDictionaryForUser:](CBPreferencesHandler, "copyPreferenceDictionaryForUser:", a3);
  if (!theDict)
  {
    theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
LABEL_5:
    if (theDict)
    {
      CFDictionarySetValue(theDict, a4, a5);
      v6 = (CFStringRef *)MEMORY[0x1E0C9B260];
      v7 = (CFStringRef *)MEMORY[0x1E0C9B230];
      CFPreferencesSetValue((CFStringRef)a3, theDict, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), *v6, *v7);
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_8;
  }
  cf1 = CFDictionaryGetValue(theDict, a4);
  if (!cf1 || !CFEqual(cf1, a5))
    goto LABEL_5;
LABEL_8:
  if (theDict)
    CFRelease(theDict);
  return v10;
}

+ (BOOL)storeNestedPreferenceForAllUsersWithKey1:(id)a3 key2:(id)a4 key3:(id)a5 andValue:(id)a6
{
  CFIndex Count;
  CFIndex v7;
  CFStringRef *v9;
  CFStringRef *v10;
  const __CFAllocator *v11;
  CFTypeID v12;
  const __CFAllocator *allocator;
  CFTypeID TypeID;
  CFTypeRef cf1;
  const __CFDictionary *Value;
  CFTypeRef cf;
  const __CFDictionary *Mutable;
  const __CFDictionary *MutableCopy;
  BOOL v20;

  v20 = 1;
  Mutable = 0;
  cf = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", a3);
  if (cf && (TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(cf)))
  {
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Count = CFDictionaryGetCount((CFDictionaryRef)cf);
    MutableCopy = CFDictionaryCreateMutableCopy(allocator, Count, (CFDictionaryRef)cf);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  }
  if (MutableCopy)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, a4);
    if (Value && (v12 = CFDictionaryGetTypeID(), v12 == CFGetTypeID(Value)))
    {
      v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v7 = CFDictionaryGetCount(Value);
      Mutable = CFDictionaryCreateMutableCopy(v11, v7, Value);
    }
    else
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    }
    if (Mutable)
    {
      cf1 = CFDictionaryGetValue(Mutable, a5);
      if (cf1 && a6 && CFEqual(cf1, a6))
      {
        v20 = 0;
      }
      else
      {
        if (a6)
        {
          CFDictionarySetValue(Mutable, a5, a6);
        }
        else if (cf1)
        {
          CFDictionaryRemoveValue(Mutable, a5);
        }
        CFDictionarySetValue(MutableCopy, a4, Mutable);
        v9 = (CFStringRef *)MEMORY[0x1E0C9B260];
        v10 = (CFStringRef *)MEMORY[0x1E0C9B230];
        CFPreferencesSetValue((CFStringRef)a3, MutableCopy, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
        CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), *v9, *v10);
      }
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  if (MutableCopy)
    CFRelease(MutableCopy);
  if (Mutable)
    CFRelease(Mutable);
  if (cf)
    CFRelease(cf);
  return v20;
}

+ (BOOL)migrateNestedPreferenceForAllUsersWithKey1:(id)a3 key2:(id)a4 toKey:(id)a5
{
  CFIndex Count;
  CFIndex v6;
  CFStringRef *v8;
  CFStringRef *v9;
  const __CFAllocator *v10;
  CFTypeID v11;
  const __CFAllocator *allocator;
  CFTypeID TypeID;
  const __CFDictionary *Value;
  CFTypeRef cf;
  CFMutableDictionaryRef v16;
  const __CFDictionary *MutableCopy;
  BOOL v18;

  v18 = 1;
  MutableCopy = 0;
  v16 = 0;
  cf = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", a3);
  if (cf)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Count = CFDictionaryGetCount((CFDictionaryRef)cf);
      MutableCopy = CFDictionaryCreateMutableCopy(allocator, Count, (CFDictionaryRef)cf);
    }
  }
  if (MutableCopy)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, a4);
    if (Value)
    {
      v11 = CFDictionaryGetTypeID();
      if (v11 == CFGetTypeID(Value))
      {
        v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v6 = CFDictionaryGetCount(Value);
        v16 = CFDictionaryCreateMutableCopy(v10, v6, Value);
      }
    }
    if (v16)
    {
      CFDictionaryRemoveValue(MutableCopy, a4);
      CFDictionarySetValue(MutableCopy, a5, v16);
      v8 = (CFStringRef *)MEMORY[0x1E0C9B260];
      v9 = (CFStringRef *)MEMORY[0x1E0C9B230];
      CFPreferencesSetValue((CFStringRef)a3, MutableCopy, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), *v8, *v9);
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  if (MutableCopy)
    CFRelease(MutableCopy);
  if (v16)
    CFRelease(v16);
  if (cf)
    CFRelease(cf);
  return v18;
}

+ (BOOL)storePreferenceForAllUsersForKey:(id)a3 andValue:(id)a4
{
  CFStringRef *v5;
  CFStringRef *v6;

  if (!a3 || !a4)
    return 0;
  v5 = (CFStringRef *)MEMORY[0x1E0C9B260];
  v6 = (CFStringRef *)MEMORY[0x1E0C9B230];
  CFPreferencesSetValue((CFStringRef)a3, a4, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  return CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), *v5, *v6) != 0;
}

+ (id)copyPreferenceForUser:(id)a3 forKey:(id)a4
{
  CFTypeRef cf;
  __CFDictionary *theDict;

  theDict = +[CBPreferencesHandler copyPreferenceDictionaryForUser:](CBPreferencesHandler, "copyPreferenceDictionaryForUser:", a3);
  if (!theDict)
    return 0;
  cf = CFDictionaryGetValue(theDict, a4);
  if (cf)
    CFRetain(cf);
  CFRelease(theDict);
  return (id)cf;
}

+ (id)copyNestedPreferenceForKey1:(id)a3 key2:(id)a4
{
  CFTypeID TypeID;
  CFTypeRef cf;
  CFTypeRef Value;

  Value = 0;
  cf = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", a3);
  if (cf)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      Value = CFDictionaryGetValue((CFDictionaryRef)cf, a4);
      if (Value)
        CFRetain(Value);
    }
  }
  if (cf)
    CFRelease(cf);
  return (id)Value;
}

+ (id)copyNestedPreferenceForKey1:(id)a3 key2:(id)a4 key3:(id)a5
{
  CFTypeID v6;
  CFTypeID TypeID;
  const __CFDictionary *Value;
  CFTypeRef cf;
  CFTypeRef v10;

  v10 = 0;
  cf = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:](CBPreferencesHandler, "copyPreferenceForAllUsersForKey:", a3);
  if (cf)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf, a4);
      if (Value)
      {
        v6 = CFDictionaryGetTypeID();
        if (v6 == CFGetTypeID(Value))
        {
          v10 = CFDictionaryGetValue(Value, a5);
          if (v10)
            CFRetain(v10);
        }
      }
    }
  }
  if (cf)
    CFRelease(cf);
  return (id)v10;
}

+ (id)copyPreferenceForAllUsersForKey:(id)a3
{
  NSObject *inited;
  void *v5;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  if (CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]))
  {
    return (id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  }
  if (_COREBRIGHTNESS_LOG_DEFAULT)
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
  else
    inited = init_default_corebrightness_log();
  if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v7, (uint64_t)a3);
    _os_log_error_impl(&dword_1B5291000, inited, OS_LOG_TYPE_ERROR, "failed to synchronise the preferences (%{public}@)", v7, 0xCu);
  }
  return v5;
}

+ (id)copyPreferenceForAllUsersMultiple:(id)a3
{
  NSObject *log;
  os_log_type_t v5;
  NSObject *inited;
  uint8_t v7[7];
  os_log_type_t type;
  os_log_t oslog;
  CFArrayRef v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = (CFArrayRef)a3;
  if (CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]))
  {
    return CFPreferencesCopyMultiple(v10, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  }
  oslog = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT)
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
  else
    inited = init_default_corebrightness_log();
  oslog = inited;
  type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    v5 = type;
    __os_log_helper_16_0_0(v7);
    _os_log_error_impl(&dword_1B5291000, log, v5, "failed to synchronise the preferences", v7, 2u);
  }
  return 0;
}

+ (BOOL)storePreferenceForAllUsersMultiple:(id)a3
{
  if (!a3)
    return 0;
  CFPreferencesSetMultiple((CFDictionaryRef)a3, 0, CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  return 1;
}

+ (__CFDictionary)copyPreferenceDictionaryForUser:(id)a3
{
  CFTypeID TypeID;
  CFStringRef *v5;
  CFStringRef *v6;
  const __CFDictionary *cf;
  __CFDictionary *MutableCopy;

  MutableCopy = 0;
  v5 = (CFStringRef *)MEMORY[0x1E0C9B260];
  v6 = (CFStringRef *)MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  cf = (const __CFDictionary *)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.CoreBrightness"), *v5, *v6);
  if (cf)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(cf))
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, cf);
    CFRelease(cf);
  }
  return MutableCopy;
}

@end
