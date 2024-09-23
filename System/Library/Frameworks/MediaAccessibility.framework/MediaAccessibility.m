CTFontDescriptorRef MACaptionAppearanceCopyFontDescriptorForStyle(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior, MACaptionAppearanceFontStyle fontStyle)
{
  return MACaptionAppearanceCopyFontDescriptorWithStrokeForStyle(domain, behavior, fontStyle, 0, 0, 12.0);
}

void ___languagesUsingAlternateDefaults_block_invoke()
{
  __CFSet *Mutable;

  Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
  CFSetAddValue(Mutable, CFSTR("ja"));
  _languagesUsingAlternateDefaults__alternateDefaultLanguages = (uint64_t)Mutable;
}

void ___xpcConnection_block_invoke()
{
  _xpcConnection__XpcConnection = (uint64_t)xpc_connection_create_mach_service("com.apple.accessibility.mediaaccessibilityd", 0, 0);
  xpc_connection_set_event_handler((xpc_connection_t)_xpcConnection__XpcConnection, &__block_literal_global_37);
  xpc_connection_resume((xpc_connection_t)_xpcConnection__XpcConnection);
}

void MAPreferenceAddPublicWriteableKey(void *value)
{
  __CFSet *Mutable;

  Mutable = (__CFSet *)MAPublicWriteableKeys;
  if (!MAPublicWriteableKeys)
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
    MAPublicWriteableKeys = (uint64_t)Mutable;
  }
  CFSetAddValue(Mutable, value);
}

MACaptionAppearanceDisplayType MACaptionAppearanceGetDisplayType(MACaptionAppearanceDomain domain)
{
  const __CFNumber *v1;
  const __CFNumber *v2;
  MACaptionAppearanceDisplayType v3;
  int valuePtr;

  v1 = MACaptionAppearancePrefCopyDisplayType();
  if (!v1)
    return 0;
  v2 = v1;
  valuePtr = 0;
  if (CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr))
    v3 = valuePtr;
  else
    v3 = kMACaptionAppearanceDisplayTypeForcedOnly;
  CFRelease(v2);
  return v3;
}

CFNumberRef MACaptionAppearancePrefCopyDisplayType()
{
  const __CFNumber *v0;
  const __CFNumber *v1;
  int v2;
  CFNumberRef v3;
  int valuePtr;

  v0 = (const __CFNumber *)MAPreferencesCopyNumber(CFSTR("MACaptionDisplayType"));
  if (!v0)
    return 0;
  v1 = v0;
  valuePtr = 0;
  if (CFNumberGetValue(v0, kCFNumberSInt32Type, &valuePtr))
  {
    if (valuePtr == 2)
      v2 = 1;
    else
      v2 = 2 * (valuePtr == 3);
    valuePtr = v2;
    v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  }
  else
  {
    v3 = 0;
  }
  CFRelease(v1);
  return v3;
}

const void *MAPreferencesCopyNumber(__CFString *a1)
{
  CFTypeID TypeID;

  TypeID = CFNumberGetTypeID();
  return MAPreferencesCopyProfileValueWithExpectedType(0, a1, TypeID);
}

CGColorRef MACaptionAppearanceCopyForegroundColor(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  BOOL v4;
  const __CFString *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CGColor *v8;
  CGColorSpace *DeviceRGB;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MAPreferenceInitializeIfNeeded();
  v4 = behavior == 0;
  if (domain == kMACaptionAppearanceDomainUser)
  {
    v5 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!behavior)
    {
      v4 = 1;
      goto LABEL_14;
    }
    *behavior = kMACaptionAppearanceBehaviorUseValue;
  }
  else
  {
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!behavior || (*behavior = kMACaptionAppearanceBehaviorUseValue, domain == kMACaptionAppearanceDomainDefault))
    {
      v5 = CFSTR("MACaptionSystemDefaultProfile");
      v8 = MACaptionAppearancePrefCopyForegroundColor(CFSTR("MACaptionSystemDefaultProfile"));
LABEL_15:
      CFRelease(v5);
      goto LABEL_16;
    }
    v5 = CFSTR("MACaptionSystemDefaultProfile");
  }
  v6 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideForegroundColor(v5);
  if (v6)
  {
    v7 = v6;
    if (CFBooleanGetValue(v6))
      *behavior = kMACaptionAppearanceBehaviorUseContentIfAvailable;
    CFRelease(v7);
  }
  v4 = 0;
LABEL_14:
  v8 = MACaptionAppearancePrefCopyForegroundColor(v5);
  if (v5)
    goto LABEL_15;
LABEL_16:
  if (domain && !v8)
  {
    MAPreferenceInitializeIfNeeded();
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!v4)
      *behavior = kMACaptionAppearanceBehaviorUseValue;
    v8 = MACaptionAppearancePrefCopyForegroundColor(CFSTR("MACaptionSystemDefaultProfile"));
    CFRelease(CFSTR("MACaptionSystemDefaultProfile"));
  }
  if (!v8)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v11[0] = xmmword_1B5528758;
    v11[1] = unk_1B5528768;
    v8 = CGColorCreate(DeviceRGB, (const CGFloat *)v11);
    if (DeviceRGB)
      CFRelease(DeviceRGB);
  }
  return v8;
}

CGColorRef MACaptionAppearanceCopyWindowColor(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  BOOL v4;
  const __CFString *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CGColor *v8;
  CGColorSpace *DeviceRGB;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MAPreferenceInitializeIfNeeded();
  v4 = behavior == 0;
  if (domain == kMACaptionAppearanceDomainUser)
  {
    v5 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!behavior)
    {
      v4 = 1;
      goto LABEL_14;
    }
    *behavior = kMACaptionAppearanceBehaviorUseValue;
  }
  else
  {
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!behavior || (*behavior = kMACaptionAppearanceBehaviorUseValue, domain == kMACaptionAppearanceDomainDefault))
    {
      v5 = CFSTR("MACaptionSystemDefaultProfile");
      v8 = MACaptionAppearancePrefCopyWindowColor(CFSTR("MACaptionSystemDefaultProfile"));
LABEL_15:
      CFRelease(v5);
      goto LABEL_16;
    }
    v5 = CFSTR("MACaptionSystemDefaultProfile");
  }
  v6 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideWindowColor(v5);
  if (v6)
  {
    v7 = v6;
    if (CFBooleanGetValue(v6))
      *behavior = kMACaptionAppearanceBehaviorUseContentIfAvailable;
    CFRelease(v7);
  }
  v4 = 0;
LABEL_14:
  v8 = MACaptionAppearancePrefCopyWindowColor(v5);
  if (v5)
    goto LABEL_15;
LABEL_16:
  if (domain && !v8)
  {
    MAPreferenceInitializeIfNeeded();
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!v4)
      *behavior = kMACaptionAppearanceBehaviorUseValue;
    v8 = MACaptionAppearancePrefCopyWindowColor(CFSTR("MACaptionSystemDefaultProfile"));
    CFRelease(CFSTR("MACaptionSystemDefaultProfile"));
  }
  if (!v8)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    memset(v11, 0, sizeof(v11));
    v8 = CGColorCreate(DeviceRGB, (const CGFloat *)v11);
    if (DeviceRGB)
      CFRelease(DeviceRGB);
  }
  return v8;
}

CGColorRef MACaptionAppearanceCopyBackgroundColor(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  BOOL v4;
  const __CFString *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CGColor *v8;
  CGColorSpace *DeviceRGB;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MAPreferenceInitializeIfNeeded();
  v4 = behavior == 0;
  if (domain == kMACaptionAppearanceDomainUser)
  {
    v5 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!behavior)
    {
      v4 = 1;
      goto LABEL_14;
    }
    *behavior = kMACaptionAppearanceBehaviorUseValue;
  }
  else
  {
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!behavior || (*behavior = kMACaptionAppearanceBehaviorUseValue, domain == kMACaptionAppearanceDomainDefault))
    {
      v5 = CFSTR("MACaptionSystemDefaultProfile");
      v8 = MACaptionAppearancePrefCopyBackgroundColor(CFSTR("MACaptionSystemDefaultProfile"));
LABEL_15:
      CFRelease(v5);
      goto LABEL_16;
    }
    v5 = CFSTR("MACaptionSystemDefaultProfile");
  }
  v6 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideBackgroundColor(v5);
  if (v6)
  {
    v7 = v6;
    if (CFBooleanGetValue(v6))
      *behavior = kMACaptionAppearanceBehaviorUseContentIfAvailable;
    CFRelease(v7);
  }
  v4 = 0;
LABEL_14:
  v8 = MACaptionAppearancePrefCopyBackgroundColor(v5);
  if (v5)
    goto LABEL_15;
LABEL_16:
  if (domain && !v8)
  {
    MAPreferenceInitializeIfNeeded();
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!v4)
      *behavior = kMACaptionAppearanceBehaviorUseValue;
    v8 = MACaptionAppearancePrefCopyBackgroundColor(CFSTR("MACaptionSystemDefaultProfile"));
    CFRelease(CFSTR("MACaptionSystemDefaultProfile"));
  }
  if (!v8)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    memset(v11, 0, sizeof(v11));
    v8 = CGColorCreate(DeviceRGB, (const CGFloat *)v11);
    if (DeviceRGB)
      CFRelease(DeviceRGB);
  }
  return v8;
}

CGFloat MACaptionAppearanceGetBackgroundOpacity(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  const __CFString *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  double valuePtr;

  valuePtr = 1.0;
  MAPreferenceInitializeIfNeeded();
  if (domain == kMACaptionAppearanceDomainUser)
  {
    v4 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!behavior)
      goto LABEL_11;
    *behavior = kMACaptionAppearanceBehaviorUseValue;
  }
  else
  {
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!behavior || (*behavior = kMACaptionAppearanceBehaviorUseValue, domain == kMACaptionAppearanceDomainDefault))
    {
      v4 = CFSTR("MACaptionSystemDefaultProfile");
      v8 = (const __CFNumber *)MACaptionAppearancePrefCopyBackgroundOpacity(CFSTR("MACaptionSystemDefaultProfile"));
LABEL_15:
      CFRelease(v4);
      if (v8)
        goto LABEL_13;
      return 1.0;
    }
    v4 = CFSTR("MACaptionSystemDefaultProfile");
  }
  v5 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity(v4);
  if (v5)
  {
    v6 = v5;
    if (CFBooleanGetValue(v5))
      *behavior = kMACaptionAppearanceBehaviorUseContentIfAvailable;
    CFRelease(v6);
  }
LABEL_11:
  v7 = (const __CFNumber *)MACaptionAppearancePrefCopyBackgroundOpacity(v4);
  v8 = v7;
  if (v4)
    goto LABEL_15;
  if (v7)
  {
LABEL_13:
    CFNumberGetValue(v8, kCFNumberCGFloatType, &valuePtr);
    CFRelease(v8);
    return valuePtr;
  }
  return 1.0;
}

CGFloat MACaptionAppearanceGetWindowOpacity(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  const __CFString *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  double valuePtr;

  valuePtr = 1.0;
  MAPreferenceInitializeIfNeeded();
  if (domain == kMACaptionAppearanceDomainUser)
  {
    v4 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!behavior)
      goto LABEL_11;
    *behavior = kMACaptionAppearanceBehaviorUseValue;
  }
  else
  {
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!behavior || (*behavior = kMACaptionAppearanceBehaviorUseValue, domain == kMACaptionAppearanceDomainDefault))
    {
      v4 = CFSTR("MACaptionSystemDefaultProfile");
      v8 = (const __CFNumber *)MACaptionAppearancePrefCopyWindowOpacity(CFSTR("MACaptionSystemDefaultProfile"));
LABEL_15:
      CFRelease(v4);
      if (v8)
        goto LABEL_13;
      return 1.0;
    }
    v4 = CFSTR("MACaptionSystemDefaultProfile");
  }
  v5 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideWindowOpacity(v4);
  if (v5)
  {
    v6 = v5;
    if (CFBooleanGetValue(v5))
      *behavior = kMACaptionAppearanceBehaviorUseContentIfAvailable;
    CFRelease(v6);
  }
LABEL_11:
  v7 = (const __CFNumber *)MACaptionAppearancePrefCopyWindowOpacity(v4);
  v8 = v7;
  if (v4)
    goto LABEL_15;
  if (v7)
  {
LABEL_13:
    CFNumberGetValue(v8, kCFNumberCGFloatType, &valuePtr);
    CFRelease(v8);
    return valuePtr;
  }
  return 1.0;
}

CGFloat MACaptionAppearanceGetForegroundOpacity(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  const __CFString *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  double valuePtr;

  valuePtr = 1.0;
  MAPreferenceInitializeIfNeeded();
  if (domain == kMACaptionAppearanceDomainUser)
  {
    v4 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!behavior)
      goto LABEL_11;
    *behavior = kMACaptionAppearanceBehaviorUseValue;
  }
  else
  {
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!behavior || (*behavior = kMACaptionAppearanceBehaviorUseValue, domain == kMACaptionAppearanceDomainDefault))
    {
      v4 = CFSTR("MACaptionSystemDefaultProfile");
      v8 = (const __CFNumber *)MACaptionAppearancePrefCopyForegroundOpacity(CFSTR("MACaptionSystemDefaultProfile"));
LABEL_15:
      CFRelease(v4);
      if (v8)
        goto LABEL_13;
      return 1.0;
    }
    v4 = CFSTR("MACaptionSystemDefaultProfile");
  }
  v5 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity(v4);
  if (v5)
  {
    v6 = v5;
    if (CFBooleanGetValue(v5))
      *behavior = kMACaptionAppearanceBehaviorUseContentIfAvailable;
    CFRelease(v6);
  }
LABEL_11:
  v7 = (const __CFNumber *)MACaptionAppearancePrefCopyForegroundOpacity(v4);
  v8 = v7;
  if (v4)
    goto LABEL_15;
  if (v7)
  {
LABEL_13:
    CFNumberGetValue(v8, kCFNumberCGFloatType, &valuePtr);
    CFRelease(v8);
    return valuePtr;
  }
  return 1.0;
}

CGFloat MACaptionAppearanceGetWindowRoundedCornerRadius(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  const __CFString *v4;
  const __CFNumber *v5;
  double RelativeCharacterSizeForLanguage;
  CGFloat result;
  double valuePtr;

  valuePtr = 0.0;
  MAPreferenceInitializeIfNeeded();
  if (domain != kMACaptionAppearanceDomainUser)
  {
    v4 = CFSTR("MACaptionSystemDefaultProfile");
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!behavior)
      goto LABEL_6;
    goto LABEL_5;
  }
  v4 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  if (behavior)
LABEL_5:
    *behavior = kMACaptionAppearanceBehaviorUseValue;
LABEL_6:
  v5 = (const __CFNumber *)MACaptionAppearancePrefCopyWindowRoundedCornerRadius(v4);
  if (v4)
    CFRelease(v4);
  if (v5)
  {
    CFNumberGetValue(v5, kCFNumberCGFloatType, &valuePtr);
    CFRelease(v5);
  }
  RelativeCharacterSizeForLanguage = MACaptionAppearanceGetRelativeCharacterSizeForLanguage(domain, 0, 0);
  if (RelativeCharacterSizeForLanguage <= 0.0)
    RelativeCharacterSizeForLanguage = 1.0;
  result = valuePtr * RelativeCharacterSizeForLanguage;
  if (result > 10.0)
    return 10.0;
  return result;
}

CFArrayRef MACaptionAppearanceCopySelectedLanguages(MACaptionAppearanceDomain domain)
{
  const __CFArray *OrderedCanonicalLanguageIdentifiersFromString;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  BOOL v4;
  CFIndex Count;
  uint64_t v6;
  char v7;
  CFLocaleRef v8;
  CFLocaleRef v9;
  const __CFString *v10;
  const __CFString *CanonicalLanguageIdentifierFromString;
  const __CFString *v12;
  const __CFString *ValueAtIndex;
  const __CFString *LanguageFromLocaleIdentifier;
  const __CFString *v15;
  __CFArray *Mutable;
  CFIndex i;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;

  MAPreferenceInitializeIfNeeded();
  OrderedCanonicalLanguageIdentifiersFromString = MACaptionAppearancePrefCopyPreferredLanguages();
  v2 = (const __CFBoolean *)MACaptionAppearancePrefCopyPreferAccessibleCaptions();
  if (v2)
  {
    v3 = v2;
    v4 = CFBooleanGetValue(v2) != 0;
    CFRelease(v3);
    if (!OrderedCanonicalLanguageIdentifiersFromString)
      goto LABEL_11;
LABEL_5:
    Count = CFArrayGetCount(OrderedCanonicalLanguageIdentifiersFromString);
    v6 = Count;
    if (Count)
      v7 = v4;
    else
      v7 = 1;
    if ((v7 & 1) != 0)
    {
      if (!Count)
      {
        CFRelease(OrderedCanonicalLanguageIdentifiersFromString);
        goto LABEL_11;
      }
    }
    else
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(OrderedCanonicalLanguageIdentifiersFromString, 0);
      LanguageFromLocaleIdentifier = (const __CFString *)MAXUtilitiesCreateLanguageFromLocaleIdentifier(ValueAtIndex);
      if (LanguageFromLocaleIdentifier)
      {
        v15 = LanguageFromLocaleIdentifier;
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        CFArrayAppendValue(Mutable, ValueAtIndex);
        if (v6 >= 2)
        {
          for (i = 1; i != v6; ++i)
          {
            v18 = (const __CFString *)CFArrayGetValueAtIndex(OrderedCanonicalLanguageIdentifiersFromString, i);
            v19 = (const __CFString *)MAXUtilitiesCreateLanguageFromLocaleIdentifier(v18);
            if (v19)
            {
              v20 = v19;
              if (CFStringCompare(v19, v15, 1uLL) == kCFCompareEqualTo)
                CFArrayAppendValue(Mutable, v18);
              CFRelease(v20);
            }
          }
        }
        CFRelease(v15);
        if (!Mutable)
          goto LABEL_28;
        CFRelease(OrderedCanonicalLanguageIdentifiersFromString);
        return Mutable;
      }
    }
    return OrderedCanonicalLanguageIdentifiersFromString;
  }
  v4 = 0;
  if (OrderedCanonicalLanguageIdentifiersFromString)
    goto LABEL_5;
LABEL_11:
  v8 = CFLocaleCopyCurrent();
  if (!v8)
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  v9 = v8;
  v10 = (const __CFString *)MEMORY[0x1B5E4C2C8]();
  if (v10
    && (CanonicalLanguageIdentifierFromString = MAUtilitiesCreateCanonicalLanguageIdentifierFromString(v10)) != 0)
  {
    v12 = CanonicalLanguageIdentifierFromString;
    OrderedCanonicalLanguageIdentifiersFromString = MAUtilitiesCreateOrderedCanonicalLanguageIdentifiersFromString(CanonicalLanguageIdentifierFromString);
    CFRelease(v12);
  }
  else
  {
    OrderedCanonicalLanguageIdentifiersFromString = 0;
  }
  CFRelease(v9);
LABEL_28:
  Mutable = OrderedCanonicalLanguageIdentifiersFromString;
  if (OrderedCanonicalLanguageIdentifiersFromString)
    return Mutable;
  return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
}

const __CFString *MAUtilitiesCreateCanonicalLanguageIdentifierFromString(CFStringRef localeIdentifier)
{
  const __CFString *CanonicalLanguageIdentifierFromString;
  const __CFString *v2;
  CFIndex Length;
  CFIndex v4;
  char *v5;
  const __CFString *v6;

  CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, localeIdentifier);
  if (!CanonicalLanguageIdentifierFromString)
    return 0;
  v2 = CanonicalLanguageIdentifierFromString;
  Length = CFStringGetLength(CanonicalLanguageIdentifierFromString);
  v4 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v5 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
  if (CFStringGetCString(v2, v5, v4, 0x8000100u) && (int)uloc_toLanguageTag() >= 1)
  {
    CFRetain(v2);
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }
  free(v5);
  CFRelease(v2);
  return v6;
}

const void *MAPreferencesCopyBoolean(__CFString *a1)
{
  CFTypeID TypeID;

  TypeID = CFBooleanGetTypeID();
  return MAPreferencesCopyProfileValueWithExpectedType(0, a1, TypeID);
}

const void *MACaptionAppearancePrefCopyPreferAccessibleCaptions()
{
  return MAPreferencesCopyBoolean(CFSTR("MACaptionPreferAccessibleCaptions"));
}

__CFArray *MAUtilitiesCreateOrderedCanonicalLanguageIdentifiersFromString(const __CFString *a1)
{
  const __CFString *CanonicalLanguageIdentifierFromString;
  const __CFString *v2;
  __CFArray *Mutable;
  const void *LanguageFromLocaleIdentifier;
  const void *v5;

  CanonicalLanguageIdentifierFromString = MAUtilitiesCreateCanonicalLanguageIdentifierFromString(a1);
  if (!CanonicalLanguageIdentifierFromString)
    return 0;
  v2 = CanonicalLanguageIdentifierFromString;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  CFArrayAppendValue(Mutable, v2);
  LanguageFromLocaleIdentifier = MAXUtilitiesCreateLanguageFromLocaleIdentifier(v2);
  if (LanguageFromLocaleIdentifier)
  {
    v5 = LanguageFromLocaleIdentifier;
    if (!CFEqual(LanguageFromLocaleIdentifier, CFSTR("zh")))
      CFArrayAppendValue(Mutable, v5);
    CFRelease(v5);
  }
  CFRelease(v2);
  return Mutable;
}

const void *MAXUtilitiesCreateLanguageFromLocaleIdentifier(CFLocaleIdentifier localeID)
{
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  const __CFDictionary *v2;
  const void *Value;
  const void *v4;

  ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, localeID);
  if (!ComponentsFromLocaleIdentifier)
    return 0;
  v2 = ComponentsFromLocaleIdentifier;
  Value = CFDictionaryGetValue(ComponentsFromLocaleIdentifier, (const void *)*MEMORY[0x1E0C9B088]);
  v4 = Value;
  if (Value)
    CFRetain(Value);
  CFRelease(v2);
  return v4;
}

const __CFArray *MACaptionAppearancePrefCopyPreferredLanguages()
{
  CFTypeID TypeID;
  const __CFArray *v1;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  const void *ValueAtIndex;
  CFTypeID v7;

  TypeID = CFArrayGetTypeID();
  v1 = (const __CFArray *)MAPreferencesCopyProfileValueWithExpectedType(0, CFSTR("MACaptionPreferredLanguages"), TypeID);
  v2 = v1;
  if (v1)
  {
    Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      v4 = Count;
      v5 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v5);
        v7 = CFGetTypeID(ValueAtIndex);
        if (v7 != CFStringGetTypeID())
          break;
        if (v4 == ++v5)
          return v2;
      }
      CFRelease(v2);
      return 0;
    }
  }
  return v2;
}

void ___copyResultPreferenceXPCCall_block_invoke(uint64_t a1)
{
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  const void *v9;
  const char *v10;
  CFNumberRef v11;
  xpc_object_t v12;
  xpc_object_t v13;
  void *v14;
  xpc_object_t value;
  const void *v16;
  const void *v17;
  char buffer[1024];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(const __CFString **)(a1 + 48);
  v4 = *(const __CFString **)(a1 + 56);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_BYTE *)(v5 + 24) = 0;
  if (v3)
  {
    if (_xpcConnection_onceToken != -1)
      dispatch_once(&_xpcConnection_onceToken, &__block_literal_global_33);
    v6 = (_xpc_connection_s *)_xpcConnection__XpcConnection;
    buffer[0] = 0;
    CFStringGetCString(v3, buffer, 1024, 0x600u);
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "preferenceName", buffer);
    if (v2)
    {
      v8 = MAXCreateXPCObjectFromCF(v4);
      if (v8)
      {
        v9 = v8;
        xpc_dictionary_set_value(v7, "preferenceValue", v8);
        CFRelease(v9);
      }
      v10 = "set";
    }
    else
    {
      v10 = "get";
    }
    xpc_dictionary_set_string(v7, "getOrSet", v10);
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v12, "reqiestTypePreferences", v7);
    v13 = xpc_connection_send_message_with_reply_sync(v6, v12);
    v14 = v13;
    v11 = 0;
    if (v13 != (xpc_object_t)MEMORY[0x1E0C81260] && v13 != (xpc_object_t)MEMORY[0x1E0C81258])
    {
      if (MEMORY[0x1B5E4CA54](v13) == MEMORY[0x1E0C812F8]
        && (*(_BYTE *)(v5 + 24) = xpc_dictionary_get_BOOL(v14, "success"),
            (value = xpc_dictionary_get_value(v14, "result")) != 0))
      {
        v11 = MAXCreateCFObjectFromXPC(value);
      }
      else
      {
        v11 = 0;
      }
    }
    xpc_release(v14);
    xpc_release(v12);
    xpc_release(v7);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
  v16 = *(const void **)(a1 + 48);
  if (v16)
    CFRelease(v16);
  v17 = *(const void **)(a1 + 56);
  if (v17)
    CFRelease(v17);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
}

NSObject *_copyResultPreferenceXPCCall(const void *a1, char a2, const void *a3)
{
  NSObject *v6;
  NSObject *global_queue;
  NSObject *v8;
  uint64_t v9;
  dispatch_time_t v10;
  _QWORD v12[5];
  _QWORD block[9];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  char v20;

  v6 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = dispatch_group_create();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2000000000;
  v20 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  dispatch_retain(v6);
  CFRetain(a1);
  if (a3)
    CFRetain(a3);
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___copyResultPreferenceXPCCall_block_invoke;
  block[3] = &unk_1E6928768;
  v14 = a2;
  block[6] = a1;
  block[7] = a3;
  block[4] = &v15;
  block[5] = v19;
  block[8] = v6;
  dispatch_group_async(v8, global_queue, block);
  v10 = dispatch_time(0, 200000000);
  if (dispatch_semaphore_wait(v6, v10))
  {
    v12[0] = v9;
    v12[1] = 0x40000000;
    v12[2] = ___copyResultPreferenceXPCCall_block_invoke_2;
    v12[3] = &unk_1E6928790;
    v12[4] = &v15;
    dispatch_group_notify(v8, global_queue, v12);
    if (v8)
      dispatch_release(v8);
    if (v6)
    {
      dispatch_release(v6);
      v6 = 0;
    }
  }
  else
  {
    if (v8)
      dispatch_release(v8);
    if (v6)
      dispatch_release(v6);
    v6 = v16[3];
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
  return v6;
}

double MACaptionAppearanceGetRelativeCharacterSizeForLanguage(uint64_t a1, _QWORD *a2, const __CFString *a3)
{
  const __CFString *v6;
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  const __CFNumber *v9;
  double v10;
  const __CFString *v11;
  int IsProfileEditable;
  uint64_t valuePtr;

  MAPreferenceInitializeIfNeeded();
  if (a1 == 1)
  {
    v6 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!a2)
      goto LABEL_10;
    *a2 = 0;
  }
  else
  {
    v6 = CFSTR("MACaptionSystemDefaultProfile");
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!a2)
      goto LABEL_10;
    *a2 = 0;
    if (!a1)
      goto LABEL_10;
  }
  v7 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize(v6);
  if (v7)
  {
    v8 = v7;
    if (CFBooleanGetValue(v7))
      *a2 = 1;
    CFRelease(v8);
  }
LABEL_10:
  valuePtr = MACaptionAppearancePrefGetRelativeCharSize(v6);
  v9 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  if (v6)
    CFRelease(v6);
  if (v9)
  {
    valuePtr = 40;
    v10 = 1.0;
    if (CFNumberGetValue(v9, kCFNumberCFIndexType, &valuePtr))
    {
      if (valuePtr > 49)
      {
        switch(valuePtr)
        {
          case '2':
            v10 = 1.5;
            break;
          case '<':
            v10 = 2.0;
            break;
          case 'F':
            v10 = 2.5;
            break;
        }
      }
      else
      {
        switch(valuePtr)
        {
          case 10:
            v10 = 0.2;
            break;
          case 20:
            v10 = 0.35;
            break;
          case 30:
            v10 = 0.6;
            break;
        }
      }
    }
    CFRelease(v9);
  }
  else
  {
    v10 = 1.0;
  }
  if (a1 == 1)
  {
    v11 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!v11)
      return v10;
  }
  else
  {
    v11 = CFSTR("MACaptionSystemDefaultProfile");
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
  }
  IsProfileEditable = MACaptionAppearancePrefIsProfileEditable(v11);
  if (v10 < 1.5 && a3 && !IsProfileEditable && MAUtilitiesLanguageStringMatchesLanguage(a3, CFSTR("ko")))
    v10 = 1.5;
  CFRelease(v11);
  return v10;
}

uint64_t MACaptionAppearancePrefIsProfileEditable(const __CFString *a1)
{
  CFTypeID TypeID;
  const void *v3;
  const void *v4;
  _BOOL8 v5;

  TypeID = CFBooleanGetTypeID();
  v3 = MAPreferencesCopyProfileValueWithExpectedType(a1, CFSTR("MAIsEditable"), TypeID);
  if (!v3)
    return 1;
  v4 = v3;
  v5 = CFEqual((CFTypeRef)*MEMORY[0x1E0C9AE40], v3) == 0;
  CFRelease(v4);
  return v5;
}

uint64_t MACaptionAppearancePrefGetRelativeCharSize(const __CFString *a1)
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  uint64_t v4;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  double valuePtr;

  v2 = (const __CFNumber *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionCharScaleEnum"));
  if (v2)
  {
    v3 = v2;
    valuePtr = 0.0;
    if (CFNumberGetValue(v2, kCFNumberCFIndexType, &valuePtr))
    {
      v4 = *(_QWORD *)&valuePtr;
      if ((unint64_t)(*(_QWORD *)&valuePtr - 10) <= 0x3C
        && ((1 << (LOBYTE(valuePtr) - 10)) & 0x1004010040100401) != 0)
      {
        v6 = v3;
LABEL_19:
        CFRelease(v6);
        return v4;
      }
    }
    CFRelease(v3);
  }
  v7 = (const __CFNumber *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionCharScale"));
  if (v7)
  {
    v8 = v7;
    valuePtr = 0.0;
    if (CFNumberGetValue(v7, kCFNumberCGFloatType, &valuePtr))
    {
      if (valuePtr < 0.5)
      {
        v4 = 20;
LABEL_18:
        v6 = v8;
        goto LABEL_19;
      }
      if (valuePtr < 0.9)
      {
        v4 = 30;
        goto LABEL_18;
      }
      if (valuePtr >= 1.2)
      {
        if (valuePtr >= 1.9)
        {
          if (valuePtr >= 2.1)
            v4 = 40;
          else
            v4 = 60;
        }
        else
        {
          v4 = 50;
        }
        goto LABEL_18;
      }
    }
    v4 = 40;
    goto LABEL_18;
  }
  return 40;
}

CGColorRef MAPreferencesCopyProfileColor(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const void *Value;
  const void *v8;
  const void *v9;
  const void *v10;
  CFTypeID v11;
  CGColorRef v12;
  CFTypeID v13;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v15;
  float32x2_t v17;
  float32x2_t v18;
  CGFloat components[2];
  float64x2_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  TypeID = CFDictionaryGetTypeID();
  v5 = (const __CFDictionary *)MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
  if (!v5)
    return 0;
  v6 = v5;
  Value = CFDictionaryGetValue(v5, CFSTR("Red"));
  v8 = CFDictionaryGetValue(v6, CFSTR("Green"));
  v9 = CFDictionaryGetValue(v6, CFSTR("Blue"));
  v10 = CFDictionaryGetValue(v6, CFSTR("Alpha"));
  v11 = CFNumberGetTypeID();
  v12 = 0;
  if (Value && v8 && v9 && v10)
  {
    v13 = v11;
    if (CFGetTypeID(Value) == v11
      && CFGetTypeID(v8) == v13
      && CFGetTypeID(v9) == v13
      && CFGetTypeID(v10) == v13
      && CFNumberGetValue((CFNumberRef)Value, kCFNumberFloatType, &v17)
      && CFNumberGetValue((CFNumberRef)v8, kCFNumberFloatType, (char *)&v17 + 4)
      && CFNumberGetValue((CFNumberRef)v9, kCFNumberFloatType, &v18)
      && CFNumberGetValue((CFNumberRef)v10, kCFNumberFloatType, (char *)&v18 + 4)
      && (*(float64x2_t *)components = vcvtq_f64_f32(v17),
          v20 = vcvtq_f64_f32(v18),
          (DeviceRGB = CGColorSpaceCreateDeviceRGB()) != 0))
    {
      v15 = DeviceRGB;
      v12 = CGColorCreate(DeviceRGB, components);
      CFRelease(v15);
    }
    else
    {
      v12 = 0;
    }
  }
  CFRelease(v6);
  return v12;
}

void MAPreferenceInitializeIfNeeded()
{
  if (MAPreferenceInitializeIfNeeded_onceToken != -1)
    dispatch_once(&MAPreferenceInitializeIfNeeded_onceToken, &__block_literal_global_1);
}

CTFontDescriptorRef MACaptionAppearanceCopyFontDescriptorWithStrokeForStyle(MACaptionAppearanceDomain a1, _QWORD *a2, unint64_t a3, const __CFString *a4, double *a5, double a6)
{
  const __CFString *v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  const __CFString *v15;
  const __CTFontDescriptor *CTFontDescriptorWithName;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *PreferredPostScriptNameForLanguage;
  const __CFString *v20;
  const __CFDictionary *v21;
  CTFontDescriptorRef CopyWithAttributes;
  __CFDictionary *Mutable;
  MACaptionAppearanceTextEdgeStyle TextEdgeStyle;
  int v25;
  CFNumberRef v26;
  MACaptionAppearanceTextEdgeStyle v27;
  double v28;
  double v29;
  int valuePtr;

  MAPreferenceInitializeIfNeeded();
  if (a1 == kMACaptionAppearanceDomainUser)
  {
    v12 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!a2)
      goto LABEL_10;
    *a2 = 0;
  }
  else
  {
    v12 = CFSTR("MACaptionSystemDefaultProfile");
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!a2)
      goto LABEL_10;
    *a2 = 0;
    if (a1 == kMACaptionAppearanceDomainDefault)
      goto LABEL_10;
  }
  v13 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideFontForStyle(v12, a3);
  if (v13)
  {
    v14 = v13;
    if (CFBooleanGetValue(v13))
      *a2 = 1;
    CFRelease(v14);
  }
LABEL_10:
  v15 = MACaptionAppearancePrefCopyFontDescriptorForStyle(v12, a3);
  CTFontDescriptorWithName = (const __CTFontDescriptor *)v15;
  if (a1 && !v15)
  {
    if (v12)
      CFRelease(v12);
    v12 = CFSTR("MACaptionSystemDefaultProfile");
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    CTFontDescriptorWithName = (const __CTFontDescriptor *)MACaptionAppearancePrefCopyFontDescriptorForStyle(CFSTR("MACaptionSystemDefaultProfile"), a3);
  }
  if (a4 && CTFontDescriptorWithName)
  {
    v17 = (const __CFString *)MAUtilitiesCopyFontOverideLanguage(a4);
    if (!v17)
    {
      if (MAUtilitiesFontSupportsLanguage(CTFontDescriptorWithName, a4))
        goto LABEL_31;
      CFRelease(CTFontDescriptorWithName);
      CTFontDescriptorWithName = (const __CTFontDescriptor *)CTFontDescriptorCreateForCSSFamily();
      if (CTFontDescriptorWithName)
        goto LABEL_31;
      goto LABEL_23;
    }
    v18 = v17;
    if (!MAUtilitiesFontSupportsLanguage(CTFontDescriptorWithName, v17))
    {
      PreferredPostScriptNameForLanguage = (const __CFString *)MAUtilitiesCreatePreferredPostScriptNameForLanguage(v18);
      if (PreferredPostScriptNameForLanguage)
      {
        v20 = PreferredPostScriptNameForLanguage;
        CFRelease(CTFontDescriptorWithName);
        CTFontDescriptorWithName = MAUtilitiesCreateCTFontDescriptorWithName(v20);
        CFRelease(v20);
      }
    }
    CFRelease(v18);
  }
  if (CTFontDescriptorWithName)
    goto LABEL_31;
LABEL_23:
  CTFontDescriptorWithName = MAUtilitiesCreateCTFontDescriptorWithName(CFSTR(".AXAppleSystemFont"));
  if (!CTFontDescriptorWithName)
  {
    CTFontDescriptorWithName = MAUtilitiesCreateCTFontDescriptorWithName(CFSTR("Helvetica"));
    if (!CTFontDescriptorWithName)
    {
      v21 = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CopyWithAttributes = v21;
      if (!v21)
        goto LABEL_44;
      CTFontDescriptorWithName = CTFontDescriptorCreateWithAttributes(v21);
      CFRelease(CopyWithAttributes);
      if (!CTFontDescriptorWithName)
      {
        CopyWithAttributes = 0;
        if (!v12)
          goto LABEL_46;
LABEL_45:
        CFRelease(v12);
        goto LABEL_46;
      }
    }
  }
LABEL_31:
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  valuePtr = 1065353216;
  TextEdgeStyle = MACaptionAppearanceGetTextEdgeStyle(a1, 0);
  if ((unint64_t)TextEdgeStyle < kMACaptionAppearanceTextEdgeStyleUniform)
  {
    valuePtr = 0;
    goto LABEL_38;
  }
  if (TextEdgeStyle == kMACaptionAppearanceTextEdgeStyleUniform)
  {
    v25 = 1077936128;
  }
  else
  {
    if (TextEdgeStyle != kMACaptionAppearanceTextEdgeStyleDropShadow)
      goto LABEL_38;
    v25 = 1065353216;
  }
  valuePtr = v25;
LABEL_38:
  v26 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("MACaptionFontAttributeStrokeWidth"), v26);
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorWithName, Mutable);
  if (v26)
    CFRelease(v26);
  if (Mutable)
    CFRelease(Mutable);
  if (CopyWithAttributes)
  {
    CFRelease(CTFontDescriptorWithName);
LABEL_44:
    if (!v12)
      goto LABEL_46;
    goto LABEL_45;
  }
  CopyWithAttributes = CTFontDescriptorWithName;
  if (v12)
    goto LABEL_45;
LABEL_46:
  if (a5)
  {
    v27 = MACaptionAppearanceGetTextEdgeStyle(a1, 0);
    v28 = 0.0972222222;
    if (v27 != kMACaptionAppearanceTextEdgeStyleUniform)
      v28 = 0.0;
    if (v27 == kMACaptionAppearanceTextEdgeStyleDropShadow)
      v28 = 0.0277777778;
    if (a6 <= 60.0)
      v29 = v28 * a6;
    else
      v29 = v28 * 60.0 + (a6 + -60.0) * (v28 * 0.125);
    *a5 = v29;
  }
  return CopyWithAttributes;
}

CFTypeRef MACaptionAppearancePrefCopyActiveProfileID()
{
  const void *ValueAtIndex;
  int v2;
  const __CFArray *v3;
  const __CFArray *v4;
  const __CFString *LowercaseString;
  const __CFString *v6;
  int v7;
  __CFArray *v8;
  const __CFArray *v9;

  if (_MACaptionAppearanceTempProfileID)
    return CFRetain((CFTypeRef)_MACaptionAppearanceTempProfileID);
  ValueAtIndex = MAPreferencesCopyString(CFSTR("MACaptionActiveProfile"));
  v2 = _AllowNullProfile;
  if (ValueAtIndex || _AllowNullProfile)
    goto LABEL_16;
  v3 = MACaptionAppearancePrefCopySystemLanguage();
  if (!v3)
  {
LABEL_15:
    ValueAtIndex = MAPreferencesCopyString(CFSTR("MACaptionDefaultActiveProfile"));
    v2 = _AllowNullProfile;
LABEL_16:
    if (!ValueAtIndex && !v2)
    {
      v8 = MAPreferencesCopyProfileIDs(CFSTR("MACaptionProfile-"));
      if (v8)
      {
        v9 = v8;
        if (CFArrayGetCount(v8) < 1)
        {
          ValueAtIndex = 0;
        }
        else
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v9, 0);
          CFRetain(ValueAtIndex);
        }
        CFRelease(v9);
      }
      else
      {
        return 0;
      }
    }
    return ValueAtIndex;
  }
  v4 = v3;
  LowercaseString = MAUtilitiesCreateLowercaseString((CFStringRef)v3);
  if (!LowercaseString)
  {
LABEL_14:
    CFRelease(v4);
    goto LABEL_15;
  }
  v6 = LowercaseString;
  if (_languagesUsingAlternateDefaults_onceToken != -1)
    dispatch_once(&_languagesUsingAlternateDefaults_onceToken, &__block_literal_global_0);
  if (!_languagesUsingAlternateDefaults__alternateDefaultLanguages)
  {
    CFRelease(v6);
    goto LABEL_14;
  }
  v7 = CFSetContainsValue((CFSetRef)_languagesUsingAlternateDefaults__alternateDefaultLanguages, v6);
  CFRelease(v6);
  CFRelease(v4);
  if (!v7)
    goto LABEL_15;
  ValueAtIndex = MAPreferencesCopyString(CFSTR("MACaptionDefaultAlternateActiveProfile"));
  if (!ValueAtIndex)
    goto LABEL_15;
  return ValueAtIndex;
}

const void *MAPreferencesCopyString(__CFString *a1)
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  return MAPreferencesCopyProfileValueWithExpectedType(0, a1, TypeID);
}

const __CFArray *MACaptionAppearancePrefCopySystemLanguage()
{
  const __CFString *Copy;
  const __CFArray *LowercaseString;
  const void *v2;
  __CFBundle *Bundle;
  const __CFArray *v4;
  const __CFArray *v5;
  const __CFString *ValueAtIndex;
  CFTypeID v7;
  const __CFString *CanonicalLanguageIdentifierFromString;
  const __CFString *v9;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  const __CFDictionary *v11;
  const __CFString *Value;

  Copy = (const __CFString *)_SystemLanguageOverride;
  if (_SystemLanguageOverride)
    goto LABEL_2;
  Bundle = MAUtiltiesGetBundle();
  if (!Bundle)
    return 0;
  v4 = CFBundleCopyBundleLocalizations(Bundle);
  if (!v4)
    return 0;
  v2 = v4;
  v5 = CFBundleCopyPreferredLocalizationsFromArray(v4);
  LowercaseString = v5;
  if (!v5)
    goto LABEL_3;
  if (CFArrayGetCount(v5) < 1)
    goto LABEL_14;
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(LowercaseString, 0);
  Copy = ValueAtIndex;
  if (!ValueAtIndex)
    goto LABEL_15;
  v7 = CFGetTypeID(ValueAtIndex);
  if (v7 == CFStringGetTypeID()
    && (CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, Copy)) != 0)
  {
    v9 = CanonicalLanguageIdentifierFromString;
    ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, CanonicalLanguageIdentifierFromString);
    if (ComponentsFromLocaleIdentifier)
    {
      v11 = ComponentsFromLocaleIdentifier;
      Value = (const __CFString *)CFDictionaryGetValue(ComponentsFromLocaleIdentifier, (const void *)*MEMORY[0x1E0C9B088]);
      if (Value)
        Copy = CFStringCreateCopy(0, Value);
      else
        Copy = 0;
      CFRelease(v11);
    }
    else
    {
      Copy = 0;
    }
    CFRelease(v9);
  }
  else
  {
LABEL_14:
    Copy = 0;
  }
LABEL_15:
  CFRelease(LowercaseString);
  CFRelease(v2);
  if (!Copy)
    return 0;
LABEL_2:
  LowercaseString = (const __CFArray *)MAUtilitiesCreateLowercaseString(Copy);
  v2 = Copy;
LABEL_3:
  CFRelease(v2);
  return LowercaseString;
}

const void *MAPreferencesCopyProfileValueWithExpectedType(const __CFString *a1, __CFString *a2, uint64_t a3)
{
  void *v4;
  const void *v5;
  CFTypeID v6;
  CFTypeID v7;
  uint64_t v8;
  char valuePtr;

  v4 = MAPreferencesCopyProfileValue(a1, a2);
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != a3)
    {
      v7 = v6;
      valuePtr = 0;
      if (CFBooleanGetTypeID() == a3
        && v7 == CFNumberGetTypeID()
        && CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt8Type, &valuePtr))
      {
        CFRelease(v5);
        v8 = MEMORY[0x1E0C9AE50];
        if (!valuePtr)
          v8 = MEMORY[0x1E0C9AE40];
        return *(const void **)v8;
      }
      else
      {
        CFRelease(v5);
        return 0;
      }
    }
  }
  return v5;
}

void *MAPreferencesCopyProfileValue(CFStringRef theString, __CFString *value)
{
  CFTypeID TypeID;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFDictionary *v11;
  void *v12;

  if (!value)
    return 0;
  if (theString && CFStringGetLength(theString))
  {
    TypeID = CFDictionaryGetTypeID();
    v5 = (const __CFDictionary *)MAPreferencesCopyProfileValueWithExpectedType(0, theString, TypeID);
    if (v5)
    {
      v6 = v5;
      v7 = (void *)CFDictionaryGetValue(v5, value);
      v8 = v7;
      if (v7)
        CFRetain(v7);
      CFRelease(v6);
      return v8;
    }
    return 0;
  }
  if (_preferenceAccessRequiresXPC(value))
  {
    v9 = _copyResultPreferenceXPCCall(value, 0, 0);
  }
  else
  {
    if (_MADomainOverride)
      v10 = (const __CFString *)_MADomainOverride;
    else
      v10 = CFSTR("com.apple.mediaaccessibility");
    v9 = (void *)CFPreferencesCopyAppValue(value, v10);
  }
  v8 = v9;
  if (!v9)
  {
    v11 = (const __CFDictionary *)_preferencesDefaults();
    if (!v11)
      return 0;
    v12 = (void *)CFDictionaryGetValue(v11, value);
    v8 = v12;
    if (v12)
      CFRetain(v12);
  }
  return v8;
}

uint64_t _preferencesDefaults()
{
  const void *v0;

  if ((_preferencesDefaults__DidSet & 1) == 0)
  {
    v0 = MAUtilitiesCopyResourceDictionary(CFSTR("Defaults"));
    pthread_mutex_lock(&_preferencesDefaults__Lock);
    if ((_preferencesDefaults__DidSet & 1) != 0)
    {
      pthread_mutex_unlock(&_preferencesDefaults__Lock);
      if (v0)
        CFRelease(v0);
    }
    else
    {
      _preferencesDefaults__Defaults = (uint64_t)v0;
      _preferencesDefaults__DidSet = 1;
      pthread_mutex_unlock(&_preferencesDefaults__Lock);
    }
  }
  return _preferencesDefaults__Defaults;
}

BOOL _preferenceAccessRequiresXPC(void *value)
{
  const __CFSet *v2;

  v2 = (const __CFSet *)MAPublicWriteableKeys;
  if (!MAPublicWriteableKeys)
  {
    if (MAPreferenceInitializeIfNeeded_onceToken != -1)
      dispatch_once(&MAPreferenceInitializeIfNeeded_onceToken, &__block_literal_global_1);
    v2 = (const __CFSet *)MAPublicWriteableKeys;
    if (!MAPublicWriteableKeys)
      return 0;
  }
  return CFSetContainsValue(v2, value) != 0;
}

const __CFString *MAUtilitiesCreateLowercaseString(CFStringRef theString)
{
  const __CFString *v1;
  CFIndex Length;
  __CFString *MutableCopy;

  v1 = theString;
  if (theString)
  {
    Length = CFStringGetLength(theString);
    MutableCopy = CFStringCreateMutableCopy(0, Length, v1);
    v1 = MutableCopy;
    if (MutableCopy)
      CFStringLowercase(MutableCopy, 0);
  }
  return v1;
}

CFBundleRef MAUtiltiesGetBundle()
{
  return CFBundleGetBundleWithIdentifier(CFSTR("com.apple.MediaAccessibility"));
}

MACaptionAppearanceTextEdgeStyle MACaptionAppearanceGetTextEdgeStyle(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  const __CFString *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  MACaptionAppearanceTextEdgeStyle v9;
  int valuePtr;

  MAPreferenceInitializeIfNeeded();
  if (domain == kMACaptionAppearanceDomainUser)
  {
    v4 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!behavior)
      goto LABEL_10;
    *behavior = kMACaptionAppearanceBehaviorUseValue;
  }
  else
  {
    v4 = CFSTR("MACaptionSystemDefaultProfile");
    CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
    if (!behavior)
      goto LABEL_10;
    *behavior = kMACaptionAppearanceBehaviorUseValue;
    if (domain == kMACaptionAppearanceDomainDefault)
      goto LABEL_10;
  }
  v5 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle(v4);
  if (v5)
  {
    v6 = v5;
    if (CFBooleanGetValue(v5))
      *behavior = kMACaptionAppearanceBehaviorUseContentIfAvailable;
    CFRelease(v6);
  }
LABEL_10:
  v7 = MACaptionAppearancePrefCopyTextEdgeStyle(v4);
  if (!v7)
  {
    v9 = kMACaptionAppearanceTextEdgeStyleUndefined;
    if (!v4)
      return v9;
    goto LABEL_15;
  }
  v8 = v7;
  valuePtr = 0;
  if (CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr))
    v9 = valuePtr;
  else
    v9 = kMACaptionAppearanceTextEdgeStyleUndefined;
  CFRelease(v8);
  if (v4)
LABEL_15:
    CFRelease(v4);
  return v9;
}

CFNumberRef MACaptionAppearancePrefCopyTextEdgeStyle(const __CFString *a1)
{
  const __CFNumber *v1;
  const __CFNumber *v2;
  int v3;
  CFNumberRef v4;
  int valuePtr;

  v1 = (const __CFNumber *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionTextEdgeStyle"));
  if (!v1)
    return 0;
  v2 = v1;
  valuePtr = 0;
  if (CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr))
  {
    v3 = valuePtr;
    if ((valuePtr - 1) >= 5)
      v3 = 0;
    valuePtr = v3;
    v4 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  }
  else
  {
    v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

const void *MAPreferencesCopyProfileNumber(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID;

  TypeID = CFNumberGetTypeID();
  return MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
}

const __CFString *MAPreferencesCopyProfileFontDescriptor(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID;
  const __CFString *result;
  const __CFString *v6;
  const __CTFontDescriptor *CTFontDescriptorWithName;

  TypeID = CFStringGetTypeID();
  result = (const __CFString *)MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
  if (result)
  {
    v6 = result;
    CTFontDescriptorWithName = MAUtilitiesCreateCTFontDescriptorWithName(result);
    CFRelease(v6);
    return (const __CFString *)CTFontDescriptorWithName;
  }
  return result;
}

const __CTFontDescriptor *MAUtilitiesCreateCTFontDescriptorWithName(const __CFString *a1)
{
  __CFDictionary *Mutable;
  const __CFDictionary *v3;
  const __CFString *v4;
  uint64_t SystemFontType;
  int v6;
  CTFontDescriptorRef CTFontDescriptorForSystemFontType;
  const __CTFontDescriptor *v8;
  uint64_t v9;
  __CFSet *v10;
  const __CFSet *v11;
  const __CTFontDescriptor *MatchingFontDescriptor;
  const __CFDictionary *v13;
  const __CTFontDescriptor *v14;
  UniChar buffer;
  CFRange v17;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 0;
  v3 = Mutable;
  v4 = (const __CFString *)*MEMORY[0x1E0CA8380];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA8380], a1);
  SystemFontType = MACaptionAppearancePrefGetSystemFontType(a1);
  if (a1 && CFStringGetLength(a1) > 1)
  {
    buffer = 0;
    v17.location = 0;
    v17.length = 1;
    CFStringGetCharacters(a1, v17, &buffer);
    v6 = buffer;
    CTFontDescriptorForSystemFontType = _MAUtilitiesCreateCTFontDescriptorForSystemFontType(SystemFontType);
    v8 = CTFontDescriptorForSystemFontType;
    if (v6 != 46 || CTFontDescriptorForSystemFontType)
      goto LABEL_9;
    v9 = CTFontDescriptorCreateWithAttributesAndOptions();
  }
  else
  {
    v9 = (uint64_t)_MAUtilitiesCreateCTFontDescriptorForSystemFontType(SystemFontType);
  }
  v8 = (const __CTFontDescriptor *)v9;
LABEL_9:
  if (!v8)
  {
    v8 = CTFontDescriptorCreateWithAttributes(v3);
    if (!v8)
    {
      v14 = 0;
LABEL_23:
      CFRelease(v3);
      return v14;
    }
  }
  v10 = CFSetCreateMutable(0, 1, MEMORY[0x1E0C9B3B0]);
  if (v10)
  {
    v11 = v10;
    CFSetAddValue(v10, v4);
    MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v8, v11);
    CFRelease(v11);
  }
  else
  {
    MatchingFontDescriptor = 0;
  }
  CFRelease(v8);
  CFRelease(v3);
  if (MatchingFontDescriptor)
  {
    v13 = (const __CFDictionary *)CTFontDescriptorCopyAttribute(MatchingFontDescriptor, v4);
    if (v13)
      v3 = v13;
    else
      v3 = MatchingFontDescriptor;
    if (v13)
      v14 = MatchingFontDescriptor;
    else
      v14 = 0;
    goto LABEL_23;
  }
  return 0;
}

const void *MACaptionAppearancePrefCopyVideoOverrideFontForStyle(const __CFString *a1, unint64_t a2)
{
  const __CFString *v3;
  const __CFAllocator *v4;
  CFIndex Length;
  __CFString *MutableCopy;
  const void *v7;

  if (a2 >= 8)
    return (const void *)*MEMORY[0x1E0C9AE40];
  v3 = off_1E69286C0[a2];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Length = CFStringGetLength(CFSTR("MACaptionVideOverrideFont"));
  MutableCopy = CFStringCreateMutableCopy(v4, Length, CFSTR("MACaptionVideOverrideFont"));
  CFStringAppend(MutableCopy, v3);
  v7 = MAPreferencesCopyProfileBoolean(a1, MutableCopy);
  if (MutableCopy)
    CFRelease(MutableCopy);
  return v7;
}

const void *MAPreferencesCopyProfileBoolean(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID;

  TypeID = CFBooleanGetTypeID();
  return MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
}

const __CFString *MACaptionAppearancePrefCopyFontDescriptorForStyle(const __CFString *a1, unint64_t a2)
{
  __CFString *v2;

  if (a2 > 7)
    v2 = 0;
  else
    v2 = off_1E69286C0[a2];
  return MAPreferencesCopyProfileFontDescriptor(a1, v2);
}

const void *MACaptionAppearancePrefCopyWindowRoundedCornerRadius(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionWindowRoundedCorners"));
}

const void *MACaptionAppearancePrefCopyWindowOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionWindowOpacity"));
}

CGColorRef MACaptionAppearancePrefCopyWindowColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionWindowColor"));
}

const void *MACaptionAppearancePrefCopyVideoOverrideWindowOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideWindowOpacity"));
}

const void *MACaptionAppearancePrefCopyVideoOverrideWindowColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideWindowColor"));
}

const void *MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideCharScale"));
}

const void *MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideForegroundOpacity"));
}

const void *MACaptionAppearancePrefCopyVideoOverrideForegroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideForegroundColor"));
}

const void *MACaptionAppearancePrefCopyVideoOverrideBackgroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideBackgroundColor"));
}

const void *MACaptionAppearancePrefCopyForegroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionForegroundOpacity"));
}

CGColorRef MACaptionAppearancePrefCopyForegroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionForegroundColor"));
}

CGColorRef MACaptionAppearancePrefCopyBackgroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionBackgroundColor"));
}

const void *MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideTextEdgeStyle"));
}

const void *MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideBackgroundOpacity"));
}

const void *MACaptionAppearancePrefCopyBackgroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionBackgroundOpacity"));
}

const void *MAUtilitiesCopyResourceDictionary(const __CFString *a1)
{
  __CFBundle *BundleWithIdentifier;
  const __CFURL *v3;
  const __CFURL *v4;
  const void *v5;
  BOOL v6;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  __CFReadStream *v9;
  __CFReadStream *v10;
  UInt8 *v11;
  CFIndex v12;
  CFPropertyListRef v13;
  CFTypeID v14;
  CFErrorRef error;
  CFIndex valuePtr;
  CFNumberRef propertyValueTypeRefPtr;

  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.MediaAccessibility"));
  if (!BundleWithIdentifier)
    return 0;
  v3 = CFBundleCopyResourceURL(BundleWithIdentifier, a1, CFSTR("plist"), 0);
  if (!v3)
    return 0;
  v4 = v3;
  propertyValueTypeRefPtr = 0;
  v5 = 0;
  if (CFURLCopyResourcePropertyForKey(v3, (CFStringRef)*MEMORY[0x1E0C9B4A8], &propertyValueTypeRefPtr, 0))
    v6 = propertyValueTypeRefPtr == 0;
  else
    v6 = 1;
  if (!v6)
  {
    valuePtr = 0;
    if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberCFIndexType, &valuePtr))
    {
      Mutable = CFDataCreateMutable(0, valuePtr);
      CFDataSetLength(Mutable, valuePtr);
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      v9 = CFReadStreamCreateWithFile(0, v4);
      if (v9)
      {
        v10 = v9;
        if (CFReadStreamOpen(v9) && valuePtr >= 1)
        {
          v11 = &MutableBytePtr[valuePtr];
          while (1)
          {
            v12 = CFReadStreamRead(v10, MutableBytePtr, ((_DWORD)v11 - (_DWORD)MutableBytePtr));
            if ((unint64_t)(v12 + 1) < 2)
              break;
            MutableBytePtr += v12;
            if (MutableBytePtr >= v11)
            {
              error = 0;
              v13 = CFPropertyListCreateWithData(0, Mutable, 0, 0, &error);
              v5 = v13;
              if (v13)
              {
                v14 = CFGetTypeID(v13);
                if (v14 != CFDictionaryGetTypeID())
                {
                  CFRelease(v5);
                  break;
                }
              }
              goto LABEL_18;
            }
          }
        }
        v5 = 0;
LABEL_18:
        CFReadStreamClose(v10);
        CFRelease(v10);
      }
      else
      {
        v5 = 0;
      }
      CFRelease(Mutable);
    }
    else
    {
      v5 = 0;
    }
    CFRelease(propertyValueTypeRefPtr);
  }
  CFRelease(v4);
  return v5;
}

CGFloat MACaptionAppearanceGetRelativeCharacterSize(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  return MACaptionAppearanceGetRelativeCharacterSizeForLanguage(domain, behavior, 0);
}

BOOL MADimFlashingLightsEnabled(void)
{
  unsigned int (*v0)(void);
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (unsigned int (*)(void))get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr;
  v6 = get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr;
  if (!get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke;
    v2[3] = &unk_1E69283D0;
    v2[4] = &v3;
    __get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (unsigned int (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    MADimFlashingLightsEnabled_cold_1();
  return v0() != 0;
}

void sub_1B551C4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B551C604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFStringRef _createPrefCategoryKey(uint64_t a1, CFTypeRef cf)
{
  uint64_t v2;
  uint64_t v3;

  if ((unint64_t)(a1 - 1) > 4)
    return (CFStringRef)CFRetain(cf);
  else
    return CFStringCreateWithFormat(0, 0, CFSTR("%@.%@"), off_1E6928640[a1 - 1], cf, v2, v3);
}

__CFString *_copyPrefFilterType(uint64_t a1)
{
  __CFString *result;
  __CFString *v2;
  const void *v3;

  result = (__CFString *)_createPrefCategoryKey(a1, CFSTR("MADisplayFilterType"));
  if (result)
  {
    v2 = result;
    v3 = MAPreferencesCopyNumber(result);
    CFRelease(v2);
    return (__CFString *)v3;
  }
  return result;
}

uint64_t MADisplayFilterPrefGetType(uint64_t a1)
{
  __CFString *v2;
  const __CFNumber *v3;
  CFTypeID v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t valuePtr;

  valuePtr = 0;
  v2 = _copyPrefFilterType(a1);
  if (v2)
  {
    v3 = (const __CFNumber *)v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CFNumberGetTypeID())
      CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
    CFRelease(v3);
    v5 = valuePtr;
  }
  else
  {
    v5 = 0;
  }
  v6 = a1 - 1;
  if ((unint64_t)(a1 - 1) > 4)
    v7 = 0;
  else
    v7 = qword_1B5528840[v6];
  v8 = 0;
  result = v7 & v5;
  do
  {
    if (((1 << v8) & (unint64_t)~result) == 0)
      return 1 << v8;
    ++v8;
  }
  while (v8 != 64);
  if (!result)
  {
    if (v6 > 4)
      return 0;
    else
      return qword_1B5528868[v6];
  }
  return result;
}

const void *MAAudibleMediaPrefCopyPreferDescriptiveVideo()
{
  return MAPreferencesCopyBoolean(CFSTR("MAAudibleMediaPrefPreferDescriptiveVideo"));
}

CFNumberRef MAXCreateCFObjectFromXPC(void *a1)
{
  uint64_t v2;
  __CFArray *Mutable;
  const char *string_ptr;
  size_t count;
  size_t v7;
  size_t i;
  xpc_object_t value;
  const void *v10;
  const void *v11;
  _BOOL4 v12;
  CFTypeRef *v13;
  _QWORD valuePtr[5];

  if (!a1)
    return 0;
  v2 = MEMORY[0x1B5E4CA54]();
  if (v2 == MEMORY[0x1E0C81328])
  {
    valuePtr[0] = xpc_int64_get_value(a1);
    return CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
  }
  if (v2 == MEMORY[0x1E0C81390])
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    return (CFNumberRef)CFStringCreateWithCString(0, string_ptr, 0x8000100u);
  }
  else
  {
    if (v2 == MEMORY[0x1E0C812C8])
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      count = xpc_array_get_count(a1);
      if (count)
      {
        v7 = count;
        for (i = 0; i != v7; ++i)
        {
          value = xpc_array_get_value(a1, i);
          v10 = (const void *)MAXCreateCFObjectFromXPC(value);
          if (v10)
          {
            v11 = v10;
            CFArrayAppendValue(Mutable, v10);
            CFRelease(v11);
          }
        }
      }
      return Mutable;
    }
    if (v2 == MEMORY[0x1E0C812F8])
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      valuePtr[0] = MEMORY[0x1E0C809B0];
      valuePtr[1] = 0x40000000;
      valuePtr[2] = ___createCFDictionaryFromXPCDictionary_block_invoke;
      valuePtr[3] = &__block_descriptor_tmp;
      valuePtr[4] = Mutable;
      xpc_dictionary_apply(a1, valuePtr);
      return Mutable;
    }
    if (v2 != MEMORY[0x1E0C812D0])
      return 0;
    v12 = xpc_BOOL_get_value(a1);
    v13 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
    if (!v12)
      v13 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
    return (CFNumberRef)CFRetain(*v13);
  }
}

xpc_object_t MAXCreateXPCObjectFromCF(const __CFString *a1)
{
  CFTypeID v2;
  xpc_object_t v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const void *ValueAtIndex;
  void *v9;
  const void *v10;
  int64_t valuePtr[257];

  valuePtr[256] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID())
  {
    if (v2 == CFStringGetTypeID())
    {
      LOBYTE(valuePtr[0]) = 0;
      CFStringGetCString(a1, (char *)valuePtr, 2048, 0x8000100u);
      return xpc_string_create((const char *)valuePtr);
    }
    if (v2 == CFArrayGetTypeID())
    {
      v4 = xpc_array_create(0, 0);
      Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        v6 = Count;
        for (i = 0; i != v6; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
          v9 = (void *)MAXCreateXPCObjectFromCF(ValueAtIndex);
          if (v9)
          {
            v10 = v9;
            xpc_array_append_value(v4, v9);
            CFRelease(v10);
          }
        }
      }
      return v4;
    }
    if (v2 == CFDictionaryGetTypeID())
      return _createXPCObjectFromCFDictionary((const __CFDictionary *)a1);
    return 0;
  }
  valuePtr[0] = 0;
  CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt64Type, valuePtr);
  return xpc_int64_create(valuePtr[0]);
}

xpc_object_t _createXPCObjectFromCFDictionary(const __CFDictionary *a1)
{
  xpc_object_t v2;
  int64_t Count;
  const void **v4;
  const void **v5;
  const __CFString *v6;
  CFTypeID v7;
  void *v8;
  const void *v9;
  char buffer[2048];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  Count = CFDictionaryGetCount(a1);
  v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(a1, v4, v5);
  if (Count >= 1)
  {
    do
    {
      v6 = (const __CFString *)*v4;
      if (*v4)
      {
        v7 = CFGetTypeID(*v4);
        if (v7 == CFStringGetTypeID())
        {
          buffer[0] = 0;
          if (CFStringGetCString(v6, buffer, 2048, 0x8000100u))
          {
            v8 = (void *)MAXCreateXPCObjectFromCF(*v5);
            if (v8)
            {
              v9 = v8;
              xpc_dictionary_set_value(v2, buffer, v8);
              CFRelease(v9);
            }
          }
        }
      }
      --Count;
    }
    while (Count);
  }
  free(v4);
  free(v5);
  return v2;
}

uint64_t ___createCFDictionaryFromXPCDictionary_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  CFStringRef v5;
  CFStringRef v6;
  const void *v7;
  const void *v8;

  if (a2)
  {
    if (a3)
    {
      v5 = CFStringCreateWithCString(0, a2, 0x8000100u);
      if (v5)
      {
        v6 = v5;
        v7 = (const void *)MAXCreateCFObjectFromXPC(a3);
        if (v7)
        {
          v8 = v7;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v6, v7);
          CFRelease(v8);
        }
        CFRelease(v6);
      }
    }
  }
  return 1;
}

uint64_t MAImageCaptioningSetCaptionIntoMetadata(void *a1, const __CFString *a2, CFErrorRef *a3)
{
  CFTypeID v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  CGImageMetadataTagRef v10;
  const __CFAllocator *v11;
  CFStringRef v12;
  uint64_t result;
  CFErrorRef v14;
  void *userInfoValues;
  void *userInfoKeys;

  userInfoKeys = (void *)*MEMORY[0x1E0C9AFB0];
  if (!a1 || (v6 = CFGetTypeID(a1), v6 != CGImageMetadataGetTypeID()))
  {
    if (a3)
    {
      userInfoValues = CFSTR("Invalid metadata");
      v14 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.media.accessibility"), 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
      result = 0;
      *a3 = v14;
      return result;
    }
    return 0;
  }
  if (!a2)
    a2 = &stru_1E69289D8;
  v7 = (const __CFString *)*MEMORY[0x1E0CBC7D8];
  v8 = (const __CFString *)*MEMORY[0x1E0CBC7E8];
  CGImageMetadataRegisterNamespaceForPrefix((CGMutableImageMetadataRef)a1, (CFStringRef)*MEMORY[0x1E0CBC7D8], (CFStringRef)*MEMORY[0x1E0CBC7E8], 0);
  v9 = *MEMORY[0x1E0CBCEF0];
  v10 = CGImageMetadataTagCreate(v7, v8, (CFStringRef)*MEMORY[0x1E0CBCEF0], kCGImageMetadataTypeString, a2);
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@:%@"), v8, v9);
  if (!CGImageMetadataSetTagWithPath((CGMutableImageMetadataRef)a1, 0, v12, v10))
  {
    if (a3)
    {
      userInfoValues = CFSTR("Error setting metadata");
      *a3 = CFErrorCreateWithUserInfoKeysAndValues(v11, CFSTR("com.apple.media.accessibility"), 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    }
    if (v10)
      CFRelease(v10);
    if (v12)
      CFRelease(v12);
    return 0;
  }
  if (v12)
    CFRelease(v12);
  if (v10)
    CFRelease(v10);
  return 1;
}

CFStringRef MAImageCaptioningCopyMetadataTagPath(void)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@:%@"), *MEMORY[0x1E0CBC7E8], *MEMORY[0x1E0CBCEF0]);
}

const CGImageMetadata *MAImageCaptioningCopyCaptionWithSource(CGImageSource *a1, CFErrorRef *a2)
{
  const CGImageMetadata *v2;
  CFStringRef v3;
  CGImageMetadataTag *v4;
  const __CFString *v5;
  const __CFAllocator *v7;
  CFErrorRef v8;
  _QWORD block[6];
  void *userInfoValues;
  void **p_userInfoValues;
  uint64_t v13;
  uint64_t v14;
  void *userInfoKeys;

  userInfoKeys = (void *)*MEMORY[0x1E0C9AFB0];
  if (a1)
  {
    v2 = CGImageSourceCopyMetadataAtIndex(a1, 0, 0);
    if (v2)
    {
      userInfoValues = 0;
      p_userInfoValues = &userInfoValues;
      v13 = 0x2000000000;
      v14 = 0;
      v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@:%@"), *MEMORY[0x1E0CBC7E8], *MEMORY[0x1E0CBCEF0]);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = __MAImageCaptioningCopyCaptionWithSource_block_invoke;
      block[3] = &unk_1E69283A0;
      block[4] = &userInfoValues;
      block[5] = v3;
      CGImageMetadataEnumerateTagsUsingBlock(v2, 0, 0, block);
      CFRelease(v2);
      if (v3)
        CFRelease(v3);
      v4 = (CGImageMetadataTag *)p_userInfoValues[3];
      if (!v4)
      {
        v2 = 0;
        goto LABEL_15;
      }
      if (CGImageMetadataTagGetType(v4) == kCGImageMetadataTypeString)
      {
        v5 = (const __CFString *)CGImageMetadataTagCopyValue((CGImageMetadataTagRef)p_userInfoValues[3]);
        v2 = (const CGImageMetadata *)v5;
        if (!v5 || CFStringGetLength(v5))
          goto LABEL_11;
        CFRelease(v2);
      }
      v2 = 0;
LABEL_11:
      CFRelease(p_userInfoValues[3]);
LABEL_15:
      _Block_object_dispose(&userInfoValues, 8);
    }
  }
  else if (a2)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    userInfoValues = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Invalid image source"));
    v8 = CFErrorCreateWithUserInfoKeysAndValues(v7, CFSTR("com.apple.media.accessibility"), 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    v2 = 0;
    *a2 = v8;
  }
  else
  {
    return 0;
  }
  return v2;
}

CFStringRef MAImageCaptioningCopyCaption(CFURLRef url, CFErrorRef *error)
{
  CGImageSource *v4;
  CGImageSource *v5;
  const CGImageMetadata *v6;
  const __CFAllocator *v8;
  const __CFAllocator *v9;
  void *userInfoValues;
  void *userInfoKeys;

  userInfoKeys = (void *)*MEMORY[0x1E0C9AFB0];
  if (url)
  {
    v4 = CGImageSourceCreateWithURL(url, 0);
    if (v4)
    {
      v5 = v4;
      v6 = MAImageCaptioningCopyCaptionWithSource(v4, error);
      CFRelease(v5);
      return (CFStringRef)v6;
    }
    if (error)
    {
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      userInfoValues = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Invalid url: %@"), url);
      v8 = v9;
      goto LABEL_8;
    }
  }
  else if (error)
  {
    userInfoValues = CFSTR("Missing url");
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
LABEL_8:
    *error = CFErrorCreateWithUserInfoKeysAndValues(v8, CFSTR("com.apple.media.accessibility"), 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
  }
  return 0;
}

BOOL MAImageCaptioningSetCaption(CFURLRef url, CFStringRef string, CFErrorRef *error)
{
  CGMutableImageMetadataRef Mutable;
  CGImageSource *v7;
  CGImageSource *v8;
  const __CFString *Type;
  size_t Count;
  CGImageDestinationRef v11;
  CGImageDestination *v12;
  __CFDictionary *v13;
  CGMutableImageMetadataRef v14;
  const __CFString *v16;
  void *userInfoKeys;

  userInfoKeys = (void *)*MEMORY[0x1E0C9AFB0];
  if (!url)
  {
    if (error)
    {
      v16 = CFSTR("Missing url");
      LOBYTE(Mutable) = 0;
      *error = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.media.accessibility"), 0, (const void *const *)&userInfoKeys, (const void *const *)&v16, 1);
      return (char)Mutable;
    }
LABEL_22:
    LOBYTE(Mutable) = 0;
    return (char)Mutable;
  }
  Mutable = CGImageMetadataCreateMutable();
  if ((MAImageCaptioningSetCaptionIntoMetadata(Mutable, string, error) & 1) == 0)
    goto LABEL_14;
  v7 = CGImageSourceCreateWithURL(url, 0);
  if (!v7)
  {
    if (error)
    {
      v16 = CFSTR("Could not create image source");
      *error = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.media.accessibility"), 0, (const void *const *)&userInfoKeys, (const void *const *)&v16, 1);
    }
LABEL_14:
    if (!Mutable)
      return (char)Mutable;
    v14 = Mutable;
    goto LABEL_21;
  }
  v8 = v7;
  Type = CGImageSourceGetType(v7);
  Count = CGImageSourceGetCount(v8);
  v11 = CGImageDestinationCreateWithURL(url, Type, Count, 0);
  if (!v11)
  {
    if (error)
    {
      v16 = CFSTR("Could not create image destination");
      *error = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.media.accessibility"), 0, (const void *const *)&userInfoKeys, (const void *const *)&v16, 1);
    }
    if (Mutable)
      CFRelease(Mutable);
    v14 = v8;
LABEL_21:
    CFRelease(v14);
    goto LABEL_22;
  }
  v12 = v11;
  v13 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v13, (const void *)*MEMORY[0x1E0CBC790], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionaryAddValue(v13, (const void *)*MEMORY[0x1E0CBC798], Mutable);
  if (Mutable)
    CFRelease(Mutable);
  LOBYTE(Mutable) = CGImageDestinationCopyImageSource(v12, v8, v13, error);
  if (v13)
    CFRelease(v13);
  CFRelease(v12);
  CFRelease(v8);
  return (char)Mutable;
}

BOOL MACaptionAppearanceAddSelectedLanguage(MACaptionAppearanceDomain domain, CFStringRef language)
{
  __CFArray *OrderedCanonicalLanguageIdentifiersFromString;
  const __CFArray *v4;
  const __CFArray *v5;
  uint64_t Count;
  CFRange v8;

  MAPreferenceInitializeIfNeeded();
  OrderedCanonicalLanguageIdentifiersFromString = MAUtilitiesCreateOrderedCanonicalLanguageIdentifiersFromString(language);
  if (OrderedCanonicalLanguageIdentifiersFromString)
  {
    v4 = MACaptionAppearancePrefCopyPreferredLanguages();
    if (v4)
    {
      v5 = v4;
      Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        v8.length = Count;
        v8.location = 0;
        CFArrayAppendArray(OrderedCanonicalLanguageIdentifiersFromString, v5, v8);
      }
      if (CFArrayGetCount(OrderedCanonicalLanguageIdentifiersFromString) >= 1)
        MACaptionAppearancePrefSetPreferredLanguages(OrderedCanonicalLanguageIdentifiersFromString);
      CFRelease(v5);
    }
    else if (CFArrayGetCount(OrderedCanonicalLanguageIdentifiersFromString) >= 1)
    {
      MACaptionAppearancePrefSetPreferredLanguages(OrderedCanonicalLanguageIdentifiersFromString);
    }
    CFRelease(OrderedCanonicalLanguageIdentifiersFromString);
  }
  return OrderedCanonicalLanguageIdentifiersFromString != 0;
}

void MACaptionAppearanceSetDisplayType(MACaptionAppearanceDomain domain, MACaptionAppearanceDisplayType displayType)
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  int valuePtr;

  valuePtr = displayType;
  v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v2)
  {
    v3 = v2;
    MACaptionAppearancePrefSetDisplayType(v2);
    CFRelease(v3);
  }
}

CFArrayRef MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(MACaptionAppearanceDomain domain)
{
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  const __CFArray *v3;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MAPreferenceInitializeIfNeeded();
  v1 = (const __CFBoolean *)MACaptionAppearancePrefCopyPreferAccessibleCaptions();
  if (!v1)
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  v2 = v1;
  if (!CFBooleanGetValue(v1))
  {
    CFRelease(v2);
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  }
  v5 = xmmword_1E6928428;
  v3 = CFArrayCreate(0, (const void **)&v5, 2, MEMORY[0x1E0C9B378]);
  CFRelease(v2);
  if (!v3)
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  return v3;
}

BOOL MACaptionAppearanceIsCustomized(uint64_t a1)
{
  const __CFString *v1;
  _BOOL8 v2;

  if (a1 != 1)
    return 0;
  v1 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v2 = MACaptionAppearancePrefIsProfileEditable(v1) != 0;
  if (v1)
    CFRelease(v1);
  return v2;
}

CGColorRef MACaptionAppearanceCopyStrokeColor()
{
  CGColorSpace *DeviceRGB;
  CGColorRef v1;
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v3[0] = xmmword_1B5528778;
  v3[1] = unk_1B5528788;
  v1 = CGColorCreate(DeviceRGB, (const CGFloat *)v3);
  if (DeviceRGB)
    CFRelease(DeviceRGB);
  return v1;
}

CTFontDescriptorRef MACaptionAppearanceCopyFontDescriptorForLanguage(MACaptionAppearanceDomain a1, _QWORD *a2, unint64_t a3, const __CFString *a4)
{
  return MACaptionAppearanceCopyFontDescriptorWithStrokeForStyle(a1, a2, a3, a4, 0, 12.0);
}

MACaptionAppearanceTextEdgeStyle MACaptionAppearanceGetStrokeWidth(MACaptionAppearanceDomain a1)
{
  return MACaptionAppearanceGetTextEdgeStyle(a1, 0);
}

void *MACaptionAppearanceSetDidDisplayCaptionsCallback(void *result)
{
  _DidDisplayCaptionsCallback = result;
  return result;
}

void MACaptionAppearanceDidDisplayCaptions(CFArrayRef strings)
{
  CFTypeID v2;
  uint64_t Count;
  CFMutableArrayRef Mutable;
  __CFArray *v5;
  CFTypeID TypeID;
  CFTypeID v7;
  CFTypeID v8;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFTypeID v11;
  CFAttributedStringRef v12;
  CFAttributedStringRef v13;

  if (strings)
  {
    v2 = CFGetTypeID(strings);
    if (v2 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount(strings);
      Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
      if (Mutable)
      {
        v5 = Mutable;
        TypeID = CFAttributedStringGetTypeID();
        v7 = CFStringGetTypeID();
        if (Count >= 1)
        {
          v8 = v7;
          for (i = 0; i != Count; ++i)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(strings, i);
            v11 = CFGetTypeID(ValueAtIndex);
            if (v11 == TypeID)
            {
              CFArrayAppendValue(v5, ValueAtIndex);
            }
            else if (v11 == v8)
            {
              v12 = CFAttributedStringCreate(0, ValueAtIndex, 0);
              if (v12)
              {
                v13 = v12;
                CFArrayAppendValue(v5, v12);
                CFRelease(v13);
              }
            }
          }
        }
        if (CFArrayGetCount(v5) >= 1)
        {
          if (_DidDisplayCaptionsCallback)
            _DidDisplayCaptionsCallback(strings);
        }
        CFRelease(v5);
      }
    }
  }
}

void MAAudibleMediaPrefSetPreferDescriptiveVideo(const void *a1)
{
  const void *v2;

  v2 = MAPreferencesCopyBoolean(CFSTR("MAAudibleMediaPrefPreferDescriptiveVideo"));
  MAPreferencesSetValue(CFSTR("MAAudibleMediaPrefPreferDescriptiveVideo"), a1);
  MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v2, (unint64_t)a1, CFSTR("com.apple.mediaaccessibility.audibleMediaSettingsChanged"));
  if (v2)
    CFRelease(v2);
}

void MAAudibleMediaPrefResetAll()
{
  MAAudibleMediaPrefSetPreferDescriptiveVideo(0);
}

CFArrayRef MAAudibleMediaCopyPreferredCharacteristics(void)
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  const __CFArray *v2;
  const void *v4[2];

  v4[1] = *(const void **)MEMORY[0x1E0C80C00];
  MAPreferenceInitializeIfNeeded();
  v0 = (const __CFBoolean *)MAAudibleMediaPrefCopyPreferDescriptiveVideo();
  if (!v0)
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  v1 = v0;
  if (!CFBooleanGetValue(v0))
  {
    CFRelease(v1);
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  }
  v4[0] = CFSTR("public.accessibility.describes-video");
  v2 = CFArrayCreate(0, v4, 1, MEMORY[0x1E0C9B378]);
  CFRelease(v1);
  if (!v2)
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  return v2;
}

id getAXSettingsClass()
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
  v0 = (void *)getAXSettingsClass_softClass;
  v7 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAXSettingsClass_block_invoke;
    v3[3] = &unk_1E69283D0;
    v3[4] = &v4;
    __getAXSettingsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B551DC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXSHapticMusicEnabled()
{
  uint64_t (*v0)(void);
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (uint64_t (*)(void))get_AXSHapticMusicEnabledSymbolLoc_ptr;
  v6 = get_AXSHapticMusicEnabledSymbolLoc_ptr;
  if (!get_AXSHapticMusicEnabledSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __get_AXSHapticMusicEnabledSymbolLoc_block_invoke;
    v2[3] = &unk_1E69283D0;
    v2[4] = &v3;
    __get_AXSHapticMusicEnabledSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    soft_AXSHapticMusicEnabled_cold_1();
  return v0();
}

void sub_1B551DDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B551E034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HMLog()
{
  if (HMLog_onceToken != -1)
    dispatch_once(&HMLog_onceToken, &__block_literal_global_371);
  return (id)HMLog__HMLog;
}

id getAXAccessQueueClass()
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
  v0 = (void *)getAXAccessQueueClass_softClass;
  v7 = getAXAccessQueueClass_softClass;
  if (!getAXAccessQueueClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAXAccessQueueClass_block_invoke;
    v3[3] = &unk_1E69283D0;
    v3[4] = &v4;
    __getAXAccessQueueClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B551E38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E69285B8;
    v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    __getAXSettingsClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AXSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXSettingsClass_block_invoke_cold_2();
  getAXSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B551F780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXUIClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AccessibilityUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E69285E8;
    v5 = 0;
    AccessibilityUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityUILibraryCore_frameworkLibrary)
    __getAXUIClientClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AXUIClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXUIClientClass_block_invoke_cold_2();
  getAXUIClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXAccessQueueClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AXCoreUtilitiesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6928620;
    v5 = 0;
    AXCoreUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AXCoreUtilitiesLibraryCore_frameworkLibrary)
    __getAXAccessQueueClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AXAccessQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXAccessQueueClass_block_invoke_cold_2();
  getAXAccessQueueClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void MALegibleOutputDidOutputAttributedStrings(CFArrayRef theArray, uint64_t a2, CFDictionaryRef a3)
{
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  const void *ValueAtIndex;
  CFTypeID v9;
  CFIndex v10;
  const void *v11;
  CFTypeID v12;
  CFArrayRef v13;
  CFDictionaryRef v14;

  if (!_Callback)
    return;
  v5 = theArray;
  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count < 1)
      goto LABEL_11;
    v7 = Count;
    ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
    v9 = CFGetTypeID(ValueAtIndex);
    if (v9 == CFAttributedStringGetTypeID())
    {
      v10 = 1;
      while (v7 != v10)
      {
        v11 = CFArrayGetValueAtIndex(v5, v10);
        v12 = CFGetTypeID(v11);
        ++v10;
        if (v12 != CFAttributedStringGetTypeID())
        {
          if (v10 - 1 >= v7)
            break;
          goto LABEL_9;
        }
      }
LABEL_11:
      v13 = 0;
      if (!a3)
        goto LABEL_12;
      goto LABEL_10;
    }
  }
LABEL_9:
  v13 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  v5 = v13;
  if (!a3)
  {
LABEL_12:
    a3 = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v14 = a3;
    goto LABEL_13;
  }
LABEL_10:
  v14 = 0;
LABEL_13:
  _Callback(v5, a2, a3);
  if (v13)
    CFRelease(v13);
  if (v14)
    CFRelease(v14);
}

void *MALegibleOutputDidOutputAttributedStringsRegisterCallback(void *result)
{
  _Callback = result;
  return result;
}

__CFArray *MADisplayFilterPrefCopyCategoriesForCurrentPlatform()
{
  __CFArray *Mutable;
  CFNumberRef v1;
  CFNumberRef v2;
  CFNumberRef v3;
  CFNumberRef v4;
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  uint64_t valuePtr;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  valuePtr = 1;
  v1 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v1)
  {
    v2 = v1;
    CFArrayAppendValue(Mutable, v1);
    CFRelease(v2);
  }
  valuePtr = 2;
  v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v3)
  {
    v4 = v3;
    CFArrayAppendValue(Mutable, v3);
    CFRelease(v4);
  }
  valuePtr = 3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFArrayAppendValue(Mutable, v5);
    CFRelease(v6);
  }
  valuePtr = 4;
  v7 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v7)
  {
    v8 = v7;
    CFArrayAppendValue(Mutable, v7);
    CFRelease(v8);
  }
  valuePtr = 5;
  v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v9)
  {
    v10 = v9;
    CFArrayAppendValue(Mutable, v9);
    CFRelease(v10);
  }
  return Mutable;
}

uint64_t MADisplayFilterPrefPossibleTypesForCategory(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return 0;
  else
    return qword_1B5528840[a1 - 1];
}

uint64_t MADisplayFilterPrefSuspendNotifications(uint64_t result)
{
  _NotificationsSuspended = result;
  return result;
}

void MADisplayFilterPrefSetType(uint64_t a1, uint64_t a2)
{
  CFStringRef PrefCategoryKey;
  CFStringRef v4;
  CFNumberRef v5;
  CFNumberRef v6;
  __CFString *v7;
  uint64_t valuePtr;

  valuePtr = a2;
  PrefCategoryKey = _createPrefCategoryKey(a1, CFSTR("MADisplayFilterType"));
  if (PrefCategoryKey)
  {
    v4 = PrefCategoryKey;
    v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
    if (v5)
    {
      v6 = v5;
      v7 = _copyPrefFilterType(a1);
      _setPreferenceValueWithOldValue(v4, v6, (unint64_t)v7, 1);
      if (v7)
        CFRelease(v7);
      CFRelease(v6);
    }
    CFRelease(v4);
  }
}

void _setPreferenceValueWithOldValue(const void *a1, void *a2, unint64_t a3, int a4)
{
  __CFString *v7;
  __CFString *v8;
  CFTypeID v9;

  v7 = (__CFString *)CFRetain(a1);
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(a2);
    if (v9 == CGColorGetTypeID())
    {
      MAPreferencesSetColor(v8, (CGColor *)a2);
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      MAPreferencesSetValue(v8, a2);
      if (!a4)
      {
LABEL_9:
        CFRelease(v8);
        return;
      }
    }
    if (!_NotificationsSuspended)
      MAPreferencesPostChangeNotificationIfNeeded(a3, (unint64_t)a2, CFSTR("com.apple.mediaaccessibility.displayFilterSettingsChanged"));
    goto LABEL_9;
  }
}

void MADisplayFilterPrefSetCategoryEnabled(uint64_t a1, int a2)
{
  CFStringRef PrefCategoryKey;
  CFStringRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  __CFString *v8;
  _BOOL8 valuePtr;

  PrefCategoryKey = _createPrefCategoryKey(a1, CFSTR("MADisplayFilterCategoryEnabled"));
  if (PrefCategoryKey)
  {
    v5 = PrefCategoryKey;
    valuePtr = a2 != 0;
    v6 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
    if (v6)
    {
      v7 = v6;
      v8 = _copyPrefCategoryEnabled(a1);
      _setPreferenceValueWithOldValue(v5, v7, (unint64_t)v8, 1);
      if (v8)
        CFRelease(v8);
      CFRelease(v7);
    }
    CFRelease(v5);
  }
}

__CFString *_copyPrefCategoryEnabled(uint64_t a1)
{
  __CFString *result;
  __CFString *v2;
  const void *v3;

  result = (__CFString *)_createPrefCategoryKey(a1, CFSTR("MADisplayFilterCategoryEnabled"));
  if (result)
  {
    v2 = result;
    v3 = MAPreferencesCopyNumber(result);
    CFRelease(v2);
    return (__CFString *)v3;
  }
  return result;
}

BOOL MADisplayFilterPrefGetCategoryEnabled(uint64_t a1)
{
  __CFString *v1;
  const __CFNumber *v2;
  CFTypeID v3;
  _BOOL8 v4;
  uint64_t valuePtr;

  v1 = _copyPrefCategoryEnabled(a1);
  if (!v1)
    return 0;
  v2 = (const __CFNumber *)v1;
  v3 = CFGetTypeID(v1);
  if (v3 == CFNumberGetTypeID())
  {
    valuePtr = 0;
    CFNumberGetValue(v2, kCFNumberSInt64Type, &valuePtr);
    v4 = valuePtr != 0;
  }
  else
  {
    v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

void MADisplayFilterPrefGetRedColorCorrectionIntensity()
{
  _getIntensity((uint64_t (*)(void))_copyPrefRedColorCorrectionIntensity, 0.25, 0.5);
}

void _getIntensity(uint64_t (*a1)(void), double a2, double a3)
{
  double v3;
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  double v8;
  double v9;
  double valuePtr;

  v3 = a3;
  valuePtr = a3;
  v5 = (const __CFNumber *)a1();
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberCGFloatType, &valuePtr);
      v3 = valuePtr;
    }
  }
  if (v3 <= 1.0)
    v8 = v3;
  else
    v8 = 1.0;
  if (v8 >= a2)
    v9 = v8;
  else
    v9 = a2;
  if (v3 > 1.0 || v8 < a2)
    valuePtr = v9;
  if (v6)
    CFRelease(v6);
}

__CFString *_copyPrefRedColorCorrectionIntensity()
{
  __CFString *result;
  __CFString *v1;
  const void *v2;

  result = (__CFString *)CFRetain(CFSTR("MADisplayFilterRedColorCorrectionIntensity"));
  if (result)
  {
    v1 = result;
    v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetRedColorCorrectionIntensity(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterRedColorCorrectionIntensity"), (uint64_t (*)(void))_copyPrefRedColorCorrectionIntensity, a1);
}

void _setIntensity(const void *a1, uint64_t (*a2)(void), double a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  const void *v7;
  double valuePtr;

  if (a3 > 1.0)
    a3 = 1.0;
  if (a3 < 0.0)
    a3 = 0.0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    if (a2)
    {
      v7 = (const void *)a2();
      _setPreferenceValueWithOldValue(a1, v6, (unint64_t)v7, 1);
      if (v7)
        CFRelease(v7);
    }
    else
    {
      _setPreferenceValueWithOldValue(a1, v5, 0, 0);
    }
    CFRelease(v6);
  }
}

void MADisplayFilterPrefGetGreenColorCorrectionIntensity()
{
  _getIntensity((uint64_t (*)(void))_copyPrefGreenColorCorrectionIntensity, 0.25, 0.5);
}

__CFString *_copyPrefGreenColorCorrectionIntensity()
{
  __CFString *result;
  __CFString *v1;
  const void *v2;

  result = (__CFString *)CFRetain(CFSTR("MADisplayFilterGreenColorCorrectionIntensity"));
  if (result)
  {
    v1 = result;
    v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetGreenColorCorrectionIntensity(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterGreenColorCorrectionIntensity"), (uint64_t (*)(void))_copyPrefGreenColorCorrectionIntensity, a1);
}

void MADisplayFilterPrefGetBlueColorCorrectionIntensity()
{
  _getIntensity((uint64_t (*)(void))_copyPrefBlueColorCorrectionIntensity, 0.25, 0.5);
}

__CFString *_copyPrefBlueColorCorrectionIntensity()
{
  __CFString *result;
  __CFString *v1;
  const void *v2;

  result = (__CFString *)CFRetain(CFSTR("MADisplayFilterBlueColorCorrectionIntensity"));
  if (result)
  {
    v1 = result;
    v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetBlueColorCorrectionIntensity(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterBlueColorCorrectionIntensity"), (uint64_t (*)(void))_copyPrefBlueColorCorrectionIntensity, a1);
}

void MADisplayFilterPrefGetGrayscaleCorrectionIntensity()
{
  _getIntensity((uint64_t (*)(void))_copyPrefGrayscaleCorrectionIntensity, 0.25, 1.0);
}

__CFString *_copyPrefGrayscaleCorrectionIntensity()
{
  __CFString *result;
  __CFString *v1;
  const void *v2;

  result = (__CFString *)CFRetain(CFSTR("MADisplayFilterGrayscaleCorrectionIntensity"));
  if (result)
  {
    v1 = result;
    v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetGrayscaleCorrectionIntensity(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterGrayscaleCorrectionIntensity"), (uint64_t (*)(void))_copyPrefGrayscaleCorrectionIntensity, a1);
}

void MADisplayFilterPrefGetBrightnessIntensity()
{
  _getIntensity((uint64_t (*)(void))_copyPrefBrightnessIntensity, 0.25, 1.0);
}

void *_copyPrefBrightnessIntensity()
{
  __CFString *v0;
  __CFString *v1;
  void *v2;
  uint64_t valuePtr;

  v0 = (__CFString *)CFRetain(CFSTR("MADisplayFilterBrightnessIntensity"));
  if (!v0)
    return 0;
  v1 = v0;
  v2 = (void *)MAPreferencesCopyNumber(v0);
  if (!v2)
  {
    valuePtr = 0x3F9EB851EB851EB8;
    v2 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  }
  CFRelease(v1);
  return v2;
}

void MADisplayFilterPrefSetBrightnessIntensity(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterBrightnessIntensity"), (uint64_t (*)(void))_copyPrefBrightnessIntensity, a1);
}

void MADisplayFilterPrefGetWarmthIntensity()
{
  _getIntensity((uint64_t (*)(void))_copyPrefWarmthIntensity, 0.25, 1.0);
}

void *_copyPrefWarmthIntensity()
{
  __CFString *v0;
  __CFString *v1;
  void *v2;
  uint64_t valuePtr;

  v0 = (__CFString *)CFRetain(CFSTR("MADisplayFilterWarmthIntensity"));
  if (!v0)
    return 0;
  v1 = v0;
  v2 = (void *)MAPreferencesCopyNumber(v0);
  if (!v2)
  {
    valuePtr = 0x3FF0000000000000;
    v2 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  }
  CFRelease(v1);
  return v2;
}

void MADisplayFilterPrefSetWarmthIntensity(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterWarmthIntensity"), (uint64_t (*)(void))_copyPrefWarmthIntensity, a1);
}

void MADisplayFilterPrefGetReduceWhitePointIntensity()
{
  _getIntensity((uint64_t (*)(void))_copyPrefReduceWhitePointIntensity, 0.25, 0.25);
}

void *_copyPrefReduceWhitePointIntensity()
{
  __CFString *v0;
  __CFString *v1;
  void *v2;
  uint64_t valuePtr;

  v0 = (__CFString *)CFRetain(CFSTR("MADisplayFilterReduceWhitePointIntensity"));
  if (!v0)
    return 0;
  v1 = v0;
  v2 = (void *)MAPreferencesCopyNumber(v0);
  if (!v2)
  {
    valuePtr = 0x3FE999999999999ALL;
    v2 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  }
  CFRelease(v1);
  return v2;
}

void MADisplayFilterPrefSetReduceWhitePointIntensity(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterReduceWhitePointIntensity"), (uint64_t (*)(void))_copyPrefReduceWhitePointIntensity, a1);
}

void MADisplayFilterPrefGetSingleColorIntensity()
{
  _getIntensity((uint64_t (*)(void))_copyPrefSingleColorIntensity, 0.25, 0.4);
}

CFNumberRef _copyPrefSingleColorIntensity()
{
  __CFString *v0;
  __CFString *v1;
  const void *v2;
  int valuePtr;

  v0 = (__CFString *)CFRetain(CFSTR("MADisplayFilterSingleColorIntensity"));
  if (v0)
  {
    v1 = v0;
    v2 = MAPreferencesCopyNumber(v0);
    CFRelease(v1);
    return (CFNumberRef)v2;
  }
  else
  {
    valuePtr = 0;
    return CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  }
}

void MADisplayFilterPrefSetSingleColorIntensity(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterSingleColorIntensity"), (uint64_t (*)(void))_copyPrefSingleColorIntensity, a1);
}

void MADisplayFilterPrefGetSingleColorHue()
{
  _getIntensity((uint64_t (*)(void))_copyPrefSingleColorHue, 0.0, 1.0);
}

__CFString *_copyPrefSingleColorHue()
{
  __CFString *result;
  __CFString *v1;
  const void *v2;

  result = (__CFString *)CFRetain(CFSTR("MADisplayFilterSingleColorHue"));
  if (result)
  {
    v1 = result;
    v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetSingleColorHue(double a1)
{
  _setIntensity(CFSTR("MADisplayFilterSingleColorHue"), (uint64_t (*)(void))_copyPrefSingleColorHue, a1);
}

void MADisplayFilterPrefResetAll()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  __CFString *PrefCategoryKey;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t valuePtr;

  v0 = (__CFString *)CFRetain(CFSTR("MADisplayFilterType"));
  if (v0)
  {
    v1 = v0;
    MAPreferencesSetValue(v0, 0);
    CFRelease(v1);
  }
  v2 = (__CFString *)CFRetain(CFSTR("MADisplayFilterRedColorCorrectionIntensity"));
  if (v2)
  {
    v3 = v2;
    MAPreferencesSetValue(v2, 0);
    CFRelease(v3);
  }
  v4 = (__CFString *)CFRetain(CFSTR("MADisplayFilterGreenColorCorrectionIntensity"));
  if (v4)
  {
    v5 = v4;
    MAPreferencesSetValue(v4, 0);
    CFRelease(v5);
  }
  v6 = (__CFString *)CFRetain(CFSTR("MADisplayFilterBlueColorCorrectionIntensity"));
  if (v6)
  {
    v7 = v6;
    MAPreferencesSetValue(v6, 0);
    CFRelease(v7);
  }
  v8 = (__CFString *)CFRetain(CFSTR("MADisplayFilterSingleColorHue"));
  if (v8)
  {
    v9 = v8;
    MAPreferencesSetValue(v8, 0);
    CFRelease(v9);
  }
  v10 = MADisplayFilterPrefCopyCategoriesForCurrentPlatform();
  if (v10)
  {
    v11 = v10;
    Count = CFArrayGetCount(v10);
    if (Count >= 1)
    {
      v13 = Count;
      for (i = 0; i != v13; ++i)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v11, i);
        valuePtr = 0;
        CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr);
        PrefCategoryKey = (__CFString *)_createPrefCategoryKey(valuePtr, CFSTR("MADisplayFilterCategoryEnabled"));
        if (PrefCategoryKey)
        {
          v17 = PrefCategoryKey;
          MAPreferencesSetValue(PrefCategoryKey, 0);
          CFRelease(v17);
        }
        v18 = (__CFString *)_createPrefCategoryKey(valuePtr, CFSTR("MADisplayFilterType"));
        if (v18)
        {
          v19 = v18;
          MAPreferencesSetValue(v18, 0);
          CFRelease(v19);
        }
      }
    }
    CFRelease(v11);
  }
  MAPreferencesPostChangeNotification(CFSTR("com.apple.mediaaccessibility.displayFilterSettingsChanged"));
}

uint64_t MACaptionAppearancePrefSetAllowNullProfile(uint64_t result)
{
  _AllowNullProfile = result;
  return result;
}

void MACaptionAppearancePrefSaveState()
{
  __CFArray *Mutable;
  __CFArray *v1;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const __CFString *ValueAtIndex;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  if (_SavedState)
  {
    CFRelease((CFTypeRef)_SavedState);
    _SavedState = 0;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v1 = MAPreferencesCopyProfileIDs(CFSTR("MACaptionProfile-"));
  if (v1)
  {
    v2 = v1;
    Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, i);
        if (MACaptionAppearancePrefIsProfileEditable(ValueAtIndex))
          CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
    if (CFArrayGetCount(Mutable) >= 1)
      _SavedState = (uint64_t)MAPreferencesCopyMultipleProfiles(Mutable);
    CFRelease(v2);
  }
  CFRelease(Mutable);
}

__CFArray *MACaptionAppearancePrefCopyProfileIDs()
{
  return MAPreferencesCopyProfileIDs(CFSTR("MACaptionProfile-"));
}

void MACaptionAppearancePrefRestoreState()
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  if (_SavedState)
  {
    MAPreferencesSetMultipleProfiles((const __CFDictionary *)_SavedState);
    MAPreferencesPostChangeNotification(CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
    CFRelease((CFTypeRef)_SavedState);
    _SavedState = 0;
  }
}

void MACaptionAppearancePrefSetActiveProfileID(CFStringRef theString)
{
  __CFArray *v2;
  __CFArray *v3;
  CFTypeRef v4;
  const void *v5;
  CFRange v6;

  if (!theString || !CFStringGetLength(theString))
  {
    MAPreferencesSetValue(CFSTR("MACaptionActiveProfile"), theString);
LABEL_11:
    MAPreferencesPostChangeNotification(CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
    return;
  }
  if (CFStringHasPrefix(theString, CFSTR("MACaptionProfile-")))
  {
    v2 = MAPreferencesCopyProfileIDs(CFSTR("MACaptionProfile-"));
    if (v2)
    {
      v3 = v2;
      v6.length = CFArrayGetCount(v2);
      v6.location = 0;
      if (CFArrayContainsValue(v3, v6, theString))
      {
        v4 = MACaptionAppearancePrefCopyActiveProfileID();
        if (v4)
        {
          v5 = v4;
          if (!CFEqual(v4, theString))
            MAPreferencesSetValue(CFSTR("MACaptionActiveProfile"), theString);
          CFRelease(v5);
        }
        else
        {
          MAPreferencesSetValue(CFSTR("MACaptionActiveProfile"), theString);
        }
        CFRelease(v3);
        goto LABEL_11;
      }
      CFRelease(v3);
    }
  }
}

void MACaptionAppearancePrefSetSystemLanguageOverride(CFTypeRef cf)
{
  if (cf)
    CFRetain(cf);
  if (_SystemLanguageOverride)
    CFRelease((CFTypeRef)_SystemLanguageOverride);
  _SystemLanguageOverride = (uint64_t)cf;
}

void MACaptionAppearancePrefSetTempProfileID(CFTypeRef cf)
{
  if (cf)
    CFRetain(cf);
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = (uint64_t)cf;
}

const __CFString *MACaptionAppearancePrefCopyProfileName(const __CFString *a1)
{
  CFTypeID TypeID;
  const __CFString *v3;
  __CFBundle *Bundle;
  CFStringRef v6;
  CFStringRef v7;

  TypeID = CFStringGetTypeID();
  v3 = (const __CFString *)MAPreferencesCopyProfileValueWithExpectedType(a1, CFSTR("MACaptionProfileName"), TypeID);
  if (v3)
  {
    if (!MACaptionAppearancePrefIsProfileEditable(a1))
    {
      if (CFStringHasPrefix(v3, CFSTR("MALocalize-")))
      {
        Bundle = MAUtiltiesGetBundle();
        if (Bundle)
        {
          v6 = CFBundleCopyLocalizedString(Bundle, v3, 0, CFSTR("ProfileNames"));
          if (v6)
          {
            v7 = v6;
            CFRelease(v3);
            return v7;
          }
        }
      }
    }
  }
  return v3;
}

const void *MACaptionAppearancePrefCopyProfileOrder(const __CFString *a1)
{
  CFTypeID TypeID;

  TypeID = CFNumberGetTypeID();
  return MAPreferencesCopyProfileValueWithExpectedType(a1, CFSTR("MACaptionProfileOrder"), TypeID);
}

void MACaptionAppearancePrefSetProfileOrder(__CFString *a1, const void *a2)
{
  if (MACaptionAppearancePrefIsProfileEditable(a1))
    MAPreferencesSetProfileValue(a1, CFSTR("MACaptionProfileOrder"), a2);
}

void MACaptionAppearancePrefSetProfileName(__CFString *a1, const void *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  if (MACaptionAppearancePrefIsProfileEditable(a1))
    MAPreferencesSetProfileValue(a1, CFSTR("MACaptionProfileName"), a2);
}

CFStringRef MACaptionAppearancePrefCreateNewProfileID()
{
  const __CFUUID *v0;
  const __CFUUID *v1;
  CFStringRef v2;
  CFStringRef v3;
  CFStringRef v4;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  v0 = CFUUIDCreate(0);
  if (!v0)
    return 0;
  v1 = v0;
  v2 = CFUUIDCreateString(0, v0);
  if (v2)
  {
    v3 = v2;
    v4 = CFStringCreateWithFormat(0, 0, CFSTR("%@-%@"), CFSTR("MACaptionProfile"), v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  CFRelease(v1);
  return v4;
}

__CFString *MACaptionAppearancePrefCreateNewProfileFromProfile(const __CFString *a1)
{
  __CFString *NewProfileID;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  NewProfileID = (__CFString *)MACaptionAppearancePrefCreateNewProfileID();
  _copyProfileToProfile(a1, NewProfileID, 0);
  return NewProfileID;
}

void _copyProfileToProfile(const __CFString *a1, __CFString *a2, char a3)
{
  CGColor *v6;
  CGColor *v7;
  CGColor *v8;
  CGColor *v9;
  CGColor *v10;
  CGColor *v11;
  CGColor *v12;
  CGColor *v13;
  CGColor *v14;
  CGColor *v15;
  CGColor *v16;
  CGColor *v17;
  CGColor *v18;
  CGColor *v19;
  CGColor *v20;
  CGColor *v21;
  unint64_t i;
  const void *v23;
  CGColor *v24;
  unint64_t j;
  unint64_t v26;

  _NotificationsSuspended_0 = 1;
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyTextEdgeStyle, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetTextEdgeStyle, a3);
  if (a1)
  {
    v6 = (CGColor *)MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideTextEdgeStyle"));
    if ((a3 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_7;
  }
  if (!v6)
    v6 = (CGColor *)MAPreferencesCopyProfileBoolean(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionVideoOverrideTextEdgeStyle"));
LABEL_7:
  _setPreferenceValue(a2, CFSTR("MACaptionVideoOverrideTextEdgeStyle"), v6, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle);
  if (v6)
    CFRelease(v6);
  if (a1)
  {
    v7 = MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionForegroundColor"));
    if ((a3 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
    v7 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_15;
  }
  if (!v7)
    v7 = MAPreferencesCopyProfileColor(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionForegroundColor"));
LABEL_15:
  MACaptionAppearancePrefSetForegroundColor(a2, v7);
  if (v7)
    CFRelease(v7);
  if (a1)
  {
    v8 = (CGColor *)MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideForegroundColor"));
    if ((a3 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
    v8 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_23;
  }
  if (!v8)
    v8 = (CGColor *)MAPreferencesCopyProfileBoolean(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionVideoOverrideForegroundColor"));
LABEL_23:
  _setPreferenceValue(a2, CFSTR("MACaptionVideoOverrideForegroundColor"), v8, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundColor);
  if (v8)
    CFRelease(v8);
  if (a1)
  {
    v9 = MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionBackgroundColor"));
    if ((a3 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
    v9 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_31;
  }
  if (!v9)
    v9 = MAPreferencesCopyProfileColor(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionBackgroundColor"));
LABEL_31:
  MACaptionAppearancePrefSetBackgroundColor(a2, v9);
  if (v9)
    CFRelease(v9);
  if (a1)
  {
    v10 = (CGColor *)MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideBackgroundColor"));
    if ((a3 & 1) != 0)
      goto LABEL_39;
  }
  else
  {
    v10 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_39;
  }
  if (!v10)
    v10 = (CGColor *)MAPreferencesCopyProfileBoolean(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionVideoOverrideBackgroundColor"));
LABEL_39:
  _setPreferenceValue(a2, CFSTR("MACaptionVideoOverrideBackgroundColor"), v10, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundColor);
  if (v10)
    CFRelease(v10);
  if (a1)
  {
    v11 = MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionWindowColor"));
    if ((a3 & 1) != 0)
      goto LABEL_47;
  }
  else
  {
    v11 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_47;
  }
  if (!v11)
    v11 = MAPreferencesCopyProfileColor(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionWindowColor"));
LABEL_47:
  MACaptionAppearancePrefSetWindowColor(a2, v11);
  if (v11)
    CFRelease(v11);
  if (a1)
  {
    v12 = (CGColor *)MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideWindowColor"));
    if ((a3 & 1) != 0)
      goto LABEL_55;
  }
  else
  {
    v12 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_55;
  }
  if (!v12)
    v12 = (CGColor *)MAPreferencesCopyProfileBoolean(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionVideoOverrideWindowColor"));
LABEL_55:
  _setPreferenceValue(a2, CFSTR("MACaptionVideoOverrideWindowColor"), v12, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowColor);
  if (v12)
    CFRelease(v12);
  if (a1)
  {
    v13 = (CGColor *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionForegroundOpacity"));
    if ((a3 & 1) != 0)
      goto LABEL_63;
  }
  else
  {
    v13 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_63;
  }
  if (!v13)
    v13 = (CGColor *)MAPreferencesCopyProfileNumber(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionForegroundOpacity"));
LABEL_63:
  MACaptionAppearancePrefSetForegroundOpacity(a2, v13);
  if (v13)
    CFRelease(v13);
  if (a1)
  {
    v14 = (CGColor *)MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideForegroundOpacity"));
    if ((a3 & 1) != 0)
      goto LABEL_71;
  }
  else
  {
    v14 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_71;
  }
  if (!v14)
    v14 = (CGColor *)MAPreferencesCopyProfileBoolean(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionVideoOverrideForegroundOpacity"));
LABEL_71:
  _setPreferenceValue(a2, CFSTR("MACaptionVideoOverrideForegroundOpacity"), v14, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity);
  if (v14)
    CFRelease(v14);
  if (a1)
  {
    v15 = (CGColor *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionBackgroundOpacity"));
    if ((a3 & 1) != 0)
      goto LABEL_79;
  }
  else
  {
    v15 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_79;
  }
  if (!v15)
    v15 = (CGColor *)MAPreferencesCopyProfileNumber(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionBackgroundOpacity"));
LABEL_79:
  MACaptionAppearancePrefSetBackgroundOpacity(a2, v15);
  if (v15)
    CFRelease(v15);
  if (a1)
  {
    v16 = (CGColor *)MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideBackgroundOpacity"));
    if ((a3 & 1) != 0)
      goto LABEL_87;
  }
  else
  {
    v16 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_87;
  }
  if (!v16)
    v16 = (CGColor *)MAPreferencesCopyProfileBoolean(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionVideoOverrideBackgroundOpacity"));
LABEL_87:
  _setPreferenceValue(a2, CFSTR("MACaptionVideoOverrideBackgroundOpacity"), v16, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity);
  if (v16)
    CFRelease(v16);
  if (a1)
  {
    v17 = (CGColor *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionWindowOpacity"));
    if ((a3 & 1) != 0)
      goto LABEL_95;
  }
  else
  {
    v17 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_95;
  }
  if (!v17)
    v17 = (CGColor *)MAPreferencesCopyProfileNumber(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionWindowOpacity"));
LABEL_95:
  MACaptionAppearancePrefSetWindowOpacity(a2, v17);
  if (v17)
    CFRelease(v17);
  if (a1)
  {
    v18 = (CGColor *)MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideWindowOpacity"));
    if ((a3 & 1) != 0)
      goto LABEL_103;
  }
  else
  {
    v18 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_103;
  }
  if (!v18)
    v18 = (CGColor *)MAPreferencesCopyProfileBoolean(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionVideoOverrideWindowOpacity"));
LABEL_103:
  _setPreferenceValue(a2, CFSTR("MACaptionVideoOverrideWindowOpacity"), v18, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowOpacity);
  if (v18)
    CFRelease(v18);
  if (a1)
  {
    v19 = (CGColor *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionCharScaleEnum"));
    if ((a3 & 1) != 0)
      goto LABEL_111;
  }
  else
  {
    v19 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_111;
  }
  if (!v19)
    v19 = (CGColor *)MAPreferencesCopyProfileNumber(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionCharScaleEnum"));
LABEL_111:
  _MACaptionAppearancePrefSetRelativeCharSize(a2, v19);
  if (v19)
    CFRelease(v19);
  if (a1)
  {
    v20 = (CGColor *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionCharScale"));
    if ((a3 & 1) != 0)
      goto LABEL_119;
  }
  else
  {
    v20 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_119;
  }
  if (!v20)
    v20 = (CGColor *)MAPreferencesCopyProfileNumber(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionCharScale"));
LABEL_119:
  MACaptionAppearancePrefSetRelativeCharacterSize(a2, v20);
  if (v20)
    CFRelease(v20);
  if (a1)
  {
    v21 = (CGColor *)MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideCharScale"));
    if ((a3 & 1) != 0)
      goto LABEL_127;
LABEL_125:
    if (!v21)
      v21 = (CGColor *)MAPreferencesCopyProfileBoolean(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionVideoOverrideCharScale"));
    goto LABEL_127;
  }
  v21 = 0;
  if ((a3 & 1) == 0)
    goto LABEL_125;
LABEL_127:
  _setPreferenceValue(a2, CFSTR("MACaptionVideoOverrideCharScale"), v21, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize);
  if (v21)
    CFRelease(v21);
  _copyFontSetting(a1, (uint64_t (*)(const __CFString *, uint64_t))MACaptionAppearancePrefCopyFontDescriptorForStyle, (uint64_t)a2, (void (*)(uint64_t, const void *, uint64_t))MACaptionAppearancePrefSetFontDescriptorForStyle, a3);
  _copyFontSetting(a1, (uint64_t (*)(const __CFString *, uint64_t))MACaptionAppearancePrefCopyFontSpecifiedByUserForStyle, (uint64_t)a2, (void (*)(uint64_t, const void *, uint64_t))MACaptionAppearancePrefSetFontSpecifiedByUserForStyle, a3);
  for (i = 0; i != 8; ++i)
  {
    if (a1)
    {
      v23 = MACaptionAppearancePrefCopyVideoOverrideFontForStyle(a1, i);
      if ((a3 & 1) != 0)
        goto LABEL_136;
    }
    else
    {
      v23 = 0;
      if ((a3 & 1) != 0)
        goto LABEL_136;
    }
    if (!v23)
      v23 = MACaptionAppearancePrefCopyVideoOverrideFontForStyle(CFSTR("MACaptionSystemDefaultProfile"), i);
LABEL_136:
    MACaptionAppearancePrefSetVideoOverrideFontForStyle(a2, i, v23);
    if (v23)
      CFRelease(v23);
  }
  if (a1)
  {
    v24 = (CGColor *)MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionWindowRoundedCorners"));
    if ((a3 & 1) != 0)
      goto LABEL_145;
  }
  else
  {
    v24 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_145;
  }
  if (!v24)
    v24 = (CGColor *)MAPreferencesCopyProfileNumber(CFSTR("MACaptionSystemDefaultProfile"), CFSTR("MACaptionWindowRoundedCorners"));
LABEL_145:
  MACaptionAppearancePrefSetWindowRoundedCornerRadius(a2, v24);
  if (v24)
    CFRelease(v24);
  for (j = 0; j != 8; ++j)
  {
    v26 = -1;
    if (a1 && MACaptionAppearancePrefIsSystemFont(a1, j, (uint64_t *)&v26))
      MACaptionAppearancePrefSetIsSystemFont(a2, 1, j, v26);
  }
  _NotificationsSuspended_0 = 0;
  MAPreferencesPostChangeNotification(CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
}

void MACaptionAppearancePrefRemoveProfile(__CFString *a1)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  if (MACaptionAppearancePrefIsProfileEditable(a1))
    MAPreferencesRemoveProfile(a1);
}

void MACaptionAppearancePrefResetProfile(__CFString *a1)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _copyProfileToProfile(0, a1, 1);
}

void MACaptionAppearancePrefResetAll()
{
  __CFArray *v0;
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  CFIndex i;
  __CFString *ValueAtIndex;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  MACaptionAppearancePrefResetProfile(0);
  v0 = MAPreferencesCopyProfileIDs(CFSTR("MACaptionProfile-"));
  if (v0)
  {
    v1 = v0;
    Count = CFArrayGetCount(v0);
    if (Count >= 1)
    {
      v3 = Count;
      for (i = 0; i != v3; ++i)
      {
        ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(v1, i);
        if (MACaptionAppearancePrefIsProfileEditable(ValueAtIndex))
          MAPreferencesRemoveProfile(ValueAtIndex);
      }
    }
    CFRelease(v1);
  }
  MAPreferencesSetValue(CFSTR("MACaptionShowCaptions"), 0);
  MACaptionAppearancePrefSetDisplayType(0);
  MACaptionAppearancePrefSetPreferAccessibleCaptions(0);
  MACaptionAppearancePrefSetPreferredLanguages(0);
}

void MACaptionAppearancePrefSetDisplayType(const __CFNumber *a1)
{
  const void *v2;
  unsigned int valuePtr;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  v2 = MAPreferencesCopyNumber(CFSTR("MACaptionDisplayType"));
  if (a1)
  {
    valuePtr = 0;
    if (CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr) && valuePtr <= 2)
    {
      ++valuePtr;
      a1 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    }
    else
    {
      a1 = 0;
    }
  }
  MAPreferencesSetValue(CFSTR("MACaptionDisplayType"), a1);
  if ((_NotificationsSuspended_0 & 1) == 0)
    MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v2, (unint64_t)a1, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
  if (v2)
    CFRelease(v2);
  if (a1)
    CFRelease(a1);
}

void MACaptionAppearancePrefSetPreferAccessibleCaptions(const void *a1)
{
  const void *v2;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  v2 = MAPreferencesCopyBoolean(CFSTR("MACaptionPreferAccessibleCaptions"));
  MAPreferencesSetValue(CFSTR("MACaptionPreferAccessibleCaptions"), a1);
  if ((_NotificationsSuspended_0 & 1) == 0)
    MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v2, (unint64_t)a1, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
  if (v2)
    CFRelease(v2);
}

void MACaptionAppearancePrefSetPreferredLanguages(CFArrayRef theArray)
{
  const __CFArray *MutableCopy;
  const __CFArray *Copy;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFString *CanonicalLanguageIdentifierFromString;
  const __CFString *v8;
  const __CFArray *v9;
  CFIndex v10;
  CFIndex j;
  const void *v12;
  CFIndex v13;
  unint64_t v14;
  CFTypeID TypeID;
  const void *v16;
  CFRange v17;

  if (theArray)
  {
    MutableCopy = CFArrayCreateMutableCopy(0, 0, theArray);
    if (MutableCopy)
    {
      Copy = CFArrayCreateCopy(0, MutableCopy);
      CFArrayRemoveAllValues(MutableCopy);
      Count = CFArrayGetCount(Copy);
      if (Count >= 1)
      {
        v4 = Count;
        for (i = 0; i != v4; ++i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Copy, i);
          if (ValueAtIndex)
          {
            CanonicalLanguageIdentifierFromString = MAUtilitiesCreateCanonicalLanguageIdentifierFromString(ValueAtIndex);
            if (CanonicalLanguageIdentifierFromString)
            {
              v8 = CanonicalLanguageIdentifierFromString;
              if (CFStringGetLength(CanonicalLanguageIdentifierFromString) >= 1)
                CFArrayAppendValue(MutableCopy, v8);
              CFRelease(v8);
            }
          }
        }
      }
      CFRelease(Copy);
      v9 = CFArrayCreateCopy(0, MutableCopy);
      v10 = CFArrayGetCount(v9);
      CFArrayRemoveAllValues(MutableCopy);
      if (v10 >= 1)
      {
        for (j = 0; j != v10; ++j)
        {
          v12 = CFArrayGetValueAtIndex(v9, j);
          v17.length = CFArrayGetCount(MutableCopy);
          v17.location = 0;
          if (!CFArrayContainsValue(MutableCopy, v17, v12))
            CFArrayAppendValue(MutableCopy, v12);
        }
      }
      CFRelease(v9);
      v13 = CFArrayGetCount(MutableCopy);
      if (v13 >= 21)
      {
        v14 = v13 + 1;
        do
        {
          CFArrayRemoveValueAtIndex(MutableCopy, v14 - 2);
          --v14;
        }
        while (v14 > 0x15);
      }
    }
  }
  else
  {
    MutableCopy = 0;
  }
  TypeID = CFArrayGetTypeID();
  v16 = MAPreferencesCopyProfileValueWithExpectedType(0, CFSTR("MACaptionPreferredLanguages"), TypeID);
  MAPreferencesSetProfileValue(0, CFSTR("MACaptionPreferredLanguages"), MutableCopy);
  if ((_NotificationsSuspended_0 & 1) == 0)
    MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v16, (unint64_t)MutableCopy, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
  if (MutableCopy)
    CFRelease(MutableCopy);
  if (v16)
    CFRelease(v16);
}

uint64_t MACaptionAppearancePrefCopyShowCaptionsWhenAvailable()
{
  uint64_t v0;
  const __CFNumber *v1;
  const __CFNumber *v2;
  int Value;
  int valuePtr;

  v0 = *MEMORY[0x1E0C9AE40];
  v1 = (const __CFNumber *)MAPreferencesCopyNumber(CFSTR("MACaptionDisplayType"));
  if (v1)
  {
    v2 = v1;
    valuePtr = 0;
    Value = CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr == 3 && Value != 0)
      v0 = *MEMORY[0x1E0C9AE50];
    CFRelease(v2);
  }
  return v0;
}

void MACaptionAppearancePrefSetShowCaptionsWhenAvailable(const __CFBoolean *a1)
{
  const __CFNumber *v1;
  const __CFNumber *v2;
  int valuePtr;

  if (a1)
  {
    valuePtr = 0;
    if (CFBooleanGetValue(a1))
      valuePtr = 2;
    v1 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    if (v1)
    {
      v2 = v1;
      MACaptionAppearancePrefSetDisplayType(v1);
      CFRelease(v2);
    }
  }
  else
  {
    MACaptionAppearancePrefSetDisplayType(0);
  }
}

void MACaptionAppearancePrefSetForegroundColor(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionForegroundColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyForegroundColor);
}

void _setPreferenceValue(__CFString *a1, __CFString *a2, CGColor *a3, uint64_t (*a4)(__CFString *))
{
  const void *v8;
  CFTypeID v9;

  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    v8 = (const void *)a4(a1);
    if (a3 && (v9 = CFGetTypeID(a3), v9 == CGColorGetTypeID()))
      MAPreferencesSetProfileColor(a1, a2, a3);
    else
      MAPreferencesSetProfileValue(a1, a2, a3);
    if ((_NotificationsSuspended_0 & 1) == 0)
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v8, (unint64_t)a3, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
    if (v8)
      CFRelease(v8);
  }
}

void MACaptionAppearancePrefSetBackgroundColor(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionBackgroundColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyBackgroundColor);
}

void MACaptionAppearancePrefSetWindowColor(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionWindowColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowColor);
}

void MACaptionAppearancePrefSetForegroundOpacity(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionForegroundOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyForegroundOpacity);
}

void MACaptionAppearancePrefSetBackgroundOpacity(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionBackgroundOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyBackgroundOpacity);
}

void MACaptionAppearancePrefSetWindowOpacity(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionWindowOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowOpacity);
}

BOOL MACaptionAppearancePrefIsSystemFont(const __CFString *a1, unint64_t a2, uint64_t *a3)
{
  __CFString *v5;
  CFTypeID TypeID;
  const void *v7;
  const void *v8;
  uint64_t SystemFontType;
  _BOOL8 v10;

  if (a3)
    *a3 = -1;
  if (a2 > 7)
    v5 = 0;
  else
    v5 = off_1E69286C0[a2];
  TypeID = CFStringGetTypeID();
  v7 = MAPreferencesCopyProfileValueWithExpectedType(a1, v5, TypeID);
  if (!v7)
    return 0;
  v8 = v7;
  SystemFontType = MACaptionAppearancePrefGetSystemFontType(v7);
  v10 = SystemFontType != -1;
  if (a3)
    *a3 = SystemFontType;
  CFRelease(v8);
  return v10;
}

uint64_t MACaptionAppearancePrefGetSystemFontType(const void *a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v2 = CFEqual(a1, CFSTR(".AXAppleSystemFontMono"));
  v3 = CFEqual(a1, CFSTR(".AXAppleSystemFontBold"));
  v4 = CFEqual(a1, CFSTR(".AXAppleSystemFont"));
  v5 = 2;
  v6 = -1;
  if (v3)
    v6 = 1;
  if (!v2)
    v5 = v6;
  if (v4)
    return 0;
  else
    return v5;
}

void MACaptionAppearancePrefSetIsSystemFont(__CFString *a1, int a2, unint64_t a3, unint64_t a4)
{
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *FallbackPSFontNameForSystemFontType;
  CFTypeID TypeID;
  const __CFString *v11;

  if (a3 > 7)
  {
    v6 = 0;
    if (a2)
      goto LABEL_3;
LABEL_9:
    FallbackPSFontNameForSystemFontType = MAUtilitiesGetFallbackPSFontNameForSystemFontType(a4);
    if (FallbackPSFontNameForSystemFontType)
      v8 = FallbackPSFontNameForSystemFontType;
    else
      v8 = CFSTR("Helvetica");
    goto LABEL_12;
  }
  v6 = off_1E69286C0[a3];
  if (!a2)
    goto LABEL_9;
LABEL_3:
  v7 = CFSTR(".AXAppleSystemFont");
  if (a4 == 2)
    v7 = CFSTR(".AXAppleSystemFontMono");
  if (a4 == 1)
    v8 = CFSTR(".AXAppleSystemFontBold");
  else
    v8 = v7;
LABEL_12:
  TypeID = CFStringGetTypeID();
  v11 = (const __CFString *)MAPreferencesCopyProfileValueWithExpectedType(a1, v6, TypeID);
  MAPreferencesSetProfileValue(a1, v6, v8);
  if (v8 != v11 && (!v11 || !CFEqual(v8, v11)))
    MACaptionAppearancePrefSetFontSpecifiedByUserForStyle(a1, (const void *)*MEMORY[0x1E0C9AE50], a3);
  if ((_NotificationsSuspended_0 & 1) == 0)
    MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v11, (unint64_t)v8, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
  if (v11)
    CFRelease(v11);
}

void MACaptionAppearancePrefSetFontSpecifiedByUserForStyle(__CFString *a1, const void *a2, unint64_t a3)
{
  const __CFString *v6;
  const __CFAllocator *v7;
  CFIndex Length;
  __CFString *MutableCopy;
  const void *v10;

  if (MACaptionAppearancePrefIsProfileEditable(a1) && a3 <= 7)
  {
    v6 = off_1E69286C0[a3];
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Length = CFStringGetLength(CFSTR("MACaptionFontSpecifiedByUser"));
    MutableCopy = CFStringCreateMutableCopy(v7, Length, CFSTR("MACaptionFontSpecifiedByUser"));
    CFStringAppend(MutableCopy, v6);
    v10 = MACaptionAppearancePrefCopyFontSpecifiedByUserForStyle(a1, a3);
    MAPreferencesSetProfileValue(a1, MutableCopy, a2);
    if (v10)
      CFRelease(v10);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
}

BOOL MACaptionAppearancePrefIsFontSystemForStyle(const __CFString *a1, unint64_t a2, BOOL *a3)
{
  _BOOL8 result;
  uint64_t v5;

  v5 = 0;
  result = MACaptionAppearancePrefIsSystemFont(a1, a2, &v5);
  if (a3)
    *a3 = v5 == 2;
  return result;
}

void MACaptionAppearancePrefSetIsFontSystemForStyle(__CFString *a1, int a2, unint64_t a3, int a4)
{
  MACaptionAppearancePrefSetIsSystemFont(a1, a2, a3, 2 * (a4 != 0));
}

const __CFString *MACaptionAppearancePrefCopyFontForStyle(const __CFString *a1, unint64_t a2)
{
  __CFString *v2;

  if (a2 > 7)
    v2 = 0;
  else
    v2 = off_1E69286C0[a2];
  return MAPreferencesCopyProfileFont(a1, v2);
}

void MACaptionAppearancePrefSetFontForStyle(__CFString *a1, CGFont *a2, unint64_t a3)
{
  __CFString *v6;
  const __CFString *v7;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    if (a3 > 7)
      v6 = 0;
    else
      v6 = off_1E69286C0[a3];
    v7 = MAPreferencesCopyProfileFont(a1, v6);
    MAPreferencesSetProfileFont(a1, v6, a2);
    if (v7 != (const __CFString *)a2 && (!a2 || !v7 || !CFEqual(a2, v7)))
      MACaptionAppearancePrefSetFontSpecifiedByUserForStyle(a1, (const void *)*MEMORY[0x1E0C9AE50], a3);
    if ((_NotificationsSuspended_0 & 1) == 0)
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v7, (unint64_t)a2, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
    if (v7)
      CFRelease(v7);
  }
}

void MACaptionAppearancePrefSetFontDescriptorForStyle(__CFString *a1, const __CTFontDescriptor *a2, unint64_t a3)
{
  __CFString *v6;
  const __CFString *v7;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    if (a3 > 7)
      v6 = 0;
    else
      v6 = off_1E69286C0[a3];
    v7 = MAPreferencesCopyProfileFontDescriptor(a1, v6);
    MAPreferencesSetProfileFontDescriptor(a1, v6, a2);
    if (v7 != (const __CFString *)a2
      && !MAUtilitiesFontsUseSamePostScriptName(a2, (const __CTFontDescriptor *)v7))
    {
      MACaptionAppearancePrefSetFontSpecifiedByUserForStyle(a1, (const void *)*MEMORY[0x1E0C9AE50], a3);
    }
    if ((_NotificationsSuspended_0 & 1) == 0)
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v7, (unint64_t)a2, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
    if (v7)
      CFRelease(v7);
  }
}

const void *_MACaptionAppearancePrefCopyRelativeCharSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionCharScaleEnum"));
}

void MACaptionAppearancePrefSetRelativeCharSize(__CFString *a1, uint64_t a2)
{
  CGColor *v4;
  uint64_t valuePtr;

  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  valuePtr = a2;
  v4 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  _MACaptionAppearancePrefSetRelativeCharSize(a1, v4);
}

void _MACaptionAppearancePrefSetRelativeCharSize(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionCharScaleEnum"), a2, (uint64_t (*)(__CFString *))_MACaptionAppearancePrefCopyRelativeCharSize);
}

const void *MACaptionAppearancePrefCopyRelativeCharacterSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionCharScale"));
}

void MACaptionAppearancePrefSetRelativeCharacterSize(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionCharScale"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyRelativeCharacterSize);
}

void MACaptionAppearancePrefSetWindowRoundedCornerRadius(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionWindowRoundedCorners"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowRoundedCornerRadius);
}

const void *MACaptionAppearancePrefCopyUsesAppleLookAndFeel(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionAppleLookAndFeel"));
}

void MACaptionAppearancePrefSetUsesAppleLookAndFeel(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID)
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  _MACaptionAppearanceTempProfileID = 0;
  _setPreferenceValue(a1, CFSTR("MACaptionAppleLookAndFeel"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyUsesAppleLookAndFeel);
}

void MACaptionAppearancePrefSetTextEdgeStyle(__CFString *a1, const __CFNumber *a2)
{
  CFNumberRef v4;
  int valuePtr;

  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    v4 = MACaptionAppearancePrefCopyTextEdgeStyle(a1);
    if (a2)
    {
      valuePtr = 0;
      if (CFNumberGetValue(a2, kCFNumberSInt32Type, &valuePtr) && (unint64_t)(valuePtr - 1) <= 4)
        a2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      else
        a2 = 0;
    }
    MAPreferencesSetProfileValue(a1, CFSTR("MACaptionTextEdgeStyle"), a2);
    if ((_NotificationsSuspended_0 & 1) == 0)
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v4, (unint64_t)a2, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
    if (v4)
      CFRelease(v4);
    if (a2)
      CFRelease(a2);
  }
}

void MACaptionAppearancePrefSetVideoOverrideForegroundColor(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideForegroundColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundColor);
}

void MACaptionAppearancePrefSetVideoOverrideBackgroundColor(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideBackgroundColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundColor);
}

void MACaptionAppearancePrefSetVideoOverrideWindowColor(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideWindowColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowColor);
}

void MACaptionAppearancePrefSetVideoOverrideForegroundOpacity(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideForegroundOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity);
}

void MACaptionAppearancePrefSetVideoOverrideBackgroundOpacity(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideBackgroundOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity);
}

void MACaptionAppearancePrefSetVideoOverrideWindowOpacity(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideWindowOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowOpacity);
}

const void *MACaptionAppearancePrefCopyFontSpecifiedByUserForStyle(const __CFString *a1, unint64_t a2)
{
  const __CFString *v3;
  const __CFAllocator *v4;
  CFIndex Length;
  __CFString *MutableCopy;
  const void *v7;

  if (a2 >= 8)
    return (const void *)*MEMORY[0x1E0C9AE40];
  v3 = off_1E69286C0[a2];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Length = CFStringGetLength(CFSTR("MACaptionFontSpecifiedByUser"));
  MutableCopy = CFStringCreateMutableCopy(v4, Length, CFSTR("MACaptionFontSpecifiedByUser"));
  CFStringAppend(MutableCopy, v3);
  v7 = MAPreferencesCopyProfileBoolean(a1, MutableCopy);
  if (MutableCopy)
    CFRelease(MutableCopy);
  return v7;
}

void MACaptionAppearancePrefSetVideoOverrideFontForStyle(__CFString *a1, unint64_t a2, const void *a3)
{
  const __CFString *v6;
  const __CFAllocator *v7;
  CFIndex Length;
  __CFString *MutableCopy;
  const void *v10;

  if (MACaptionAppearancePrefIsProfileEditable(a1) && a2 <= 7)
  {
    v6 = off_1E69286C0[a2];
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Length = CFStringGetLength(CFSTR("MACaptionVideOverrideFont"));
    MutableCopy = CFStringCreateMutableCopy(v7, Length, CFSTR("MACaptionVideOverrideFont"));
    CFStringAppend(MutableCopy, v6);
    v10 = MACaptionAppearancePrefCopyVideoOverrideFontForStyle(a1, a2);
    MAPreferencesSetProfileValue(a1, MutableCopy, a3);
    if ((_NotificationsSuspended_0 & 1) == 0)
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v10, (unint64_t)a3, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"));
    if (v10)
      CFRelease(v10);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
}

void MACaptionAppearancePrefSetVideoOverrideRelativeCharSize(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideCharScale"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize);
}

const void *MACaptionAppearancePrefCopyVideoOverrideRelativeCharacterSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideCharScale"));
}

void MACaptionAppearancePrefSetVideoOverrideRelativeCharacterSize(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideCharScale"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideRelativeCharacterSize);
}

void MACaptionAppearancePrefSetVideoOverrideTextEdgeStyle(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideTextEdgeStyle"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle);
}

__CFArray *MAXCaptionAppearancePrefCopyProfileIDs()
{
  return MAPreferencesCopyProfileIDs(CFSTR("MACaptionProfile-"));
}

const void *MAXCaptionAppearancePrefCopyProfileOrder(const __CFString *a1)
{
  CFTypeID TypeID;

  TypeID = CFNumberGetTypeID();
  return MAPreferencesCopyProfileValueWithExpectedType(a1, CFSTR("MACaptionProfileOrder"), TypeID);
}

CGColorRef MAXCaptionAppearancePrefCopyForegroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionForegroundColor"));
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideForegroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideForegroundColor"));
}

void MAXCaptionAppearancePrefSetVideoOverrideForegroundColor(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideForegroundColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundColor);
}

CGColorRef MAXCaptionAppearancePrefCopyBackgroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionBackgroundColor"));
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideBackgroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideBackgroundColor"));
}

void MAXCaptionAppearancePrefSetVideoOverrideBackgroundColor(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideBackgroundColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundColor);
}

CGColorRef MAXCaptionAppearancePrefCopyWindowColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, CFSTR("MACaptionWindowColor"));
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideWindowColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideWindowColor"));
}

void MAXCaptionAppearancePrefSetVideoOverrideWindowColor(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideWindowColor"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowColor);
}

const void *MAXCaptionAppearancePrefCopyForegroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionForegroundOpacity"));
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideForegroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideForegroundOpacity"));
}

void MAXCaptionAppearancePrefSetVideoOverrideForegroundOpacity(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideForegroundOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity);
}

const void *MAXCaptionAppearancePrefCopyBackgroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionBackgroundOpacity"));
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideBackgroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideBackgroundOpacity"));
}

void MAXCaptionAppearancePrefSetVideoOverrideBackgroundOpacity(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideBackgroundOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity);
}

const void *MAXCaptionAppearancePrefCopyWindowOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionWindowOpacity"));
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideWindowOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideWindowOpacity"));
}

void MAXCaptionAppearancePrefSetVideoOverrideWindowOpacity(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideWindowOpacity"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowOpacity);
}

const void *MAXCaptionAppearancePrefCopyRelativeCharacterSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionCharScale"));
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideRelativeCharacterSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideCharScale"));
}

void MAXCaptionAppearancePrefSetVideoOverrideRelativeCharacterSize(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideCharScale"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideRelativeCharacterSize);
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideTextEdgeStyle(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionVideoOverrideTextEdgeStyle"));
}

void MAXCaptionAppearancePrefSetVideoOverrideTextEdgeStyle(__CFString *a1, CGColor *a2)
{
  _setPreferenceValue(a1, CFSTR("MACaptionVideoOverrideTextEdgeStyle"), a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle);
}

const void *MAXCaptionAppearancePrefCopyWindowRoundedCornerRadius(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, CFSTR("MACaptionWindowRoundedCorners"));
}

const void *MAXCaptionAppearancePrefCopyUsesAppleLookAndFeel(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, CFSTR("MACaptionAppleLookAndFeel"));
}

void MACaptionAppearanceMacBuddySettingsToTransfer(__CFDictionary *a1)
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFNumberRef v4;
  CFNumberRef v5;
  int valuePtr;

  v2 = (const __CFBoolean *)MAPreferencesCopyBoolean(CFSTR("MACaptionPreferAccessibleCaptions"));
  if (v2)
  {
    v3 = v2;
    if (CFBooleanGetValue(v2))
    {
      CFDictionarySetValue(a1, CFSTR("MACaptionPreferAccessibleCaptions"), (const void *)*MEMORY[0x1E0C9AE50]);
      valuePtr = 3;
      v4 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      if (v4)
      {
        v5 = v4;
        CFDictionarySetValue(a1, CFSTR("MACaptionDisplayType"), v4);
        CFRelease(v5);
      }
    }
    CFRelease(v3);
  }
}

void _copySetting(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void (*a4)(uint64_t, const void *), char a5)
{
  const void *v9;

  if (a1)
  {
    v9 = (const void *)a2();
    if ((a5 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v9 = 0;
    if ((a5 & 1) != 0)
      goto LABEL_7;
  }
  if (!v9)
    v9 = (const void *)((uint64_t (*)(const __CFString *))a2)(CFSTR("MACaptionSystemDefaultProfile"));
LABEL_7:
  a4(a3, v9);
  if (v9)
    CFRelease(v9);
}

void _copyFontSetting(const __CFString *a1, uint64_t (*a2)(const __CFString *, uint64_t), uint64_t a3, void (*a4)(uint64_t, const void *, uint64_t), char a5)
{
  uint64_t i;
  const void *v11;

  for (i = 0; i != 8; ++i)
  {
    if (a1)
    {
      v11 = (const void *)a2(a1, i);
      if ((a5 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      v11 = 0;
      if ((a5 & 1) != 0)
        goto LABEL_8;
    }
    if (!v11)
      v11 = (const void *)a2(CFSTR("MACaptionSystemDefaultProfile"), i);
LABEL_8:
    a4(a3, v11, i);
    if (v11)
      CFRelease(v11);
  }
}

void sub_1B5522C7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B5522EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

Class __getPSEVideoProcessorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PhotosensitivityProcessingLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6928728;
    v5 = 0;
    PhotosensitivityProcessingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosensitivityProcessingLibraryCore_frameworkLibrary)
    __getPSEVideoProcessorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PSEVideoProcessor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPSEVideoProcessorClass_block_invoke_cold_2();
  getPSEVideoProcessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MADisplayFilterGetTypeID()
{
  if ((__MADisplayFilterInitialized & 1) == 0)
    __MADisplayFilterInitialize();
  return __kMADisplayFilterTypeID;
}

uint64_t __MADisplayFilterInitialize(void)
{
  pthread_mutex_lock(&sInitLock);
  if ((__MADisplayFilterInitialized & 1) == 0)
  {
    __kMADisplayFilterTypeID = _CFRuntimeRegisterClass();
    __MADisplayFilterInitialized = 1;
  }
  return pthread_mutex_unlock(&sInitLock);
}

double MADisplayFilterGetPostOffsets(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

double *MADisplayFilterSetPostOffsets(double *result, double a2, double a3, double a4)
{
  if (result)
  {
    result[5] = a2;
    result[9] = a3;
    result[13] = a4;
  }
  return result;
}

double MADisplayFilterGetGain(uint64_t a1)
{
  return *(double *)(a1 + 144);
}

uint64_t MADisplayFilterSetGain(uint64_t result, double a2)
{
  if (result)
    *(double *)(result + 144) = a2;
  return result;
}

double MADisplayFilterGetReduceWhitePoint(uint64_t a1)
{
  return *(double *)(a1 + 152);
}

uint64_t MADisplayFilterSetReduceWhitePoint(uint64_t result, double a2)
{
  if (result)
    *(double *)(result + 152) = a2;
  return result;
}

__n128 MADisplayFilterGetMatrix@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 96);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 48);
  *(_QWORD *)(a2 + 40) = v3;
  result = *(__n128 *)(a1 + 80);
  *(__n128 *)(a2 + 48) = result;
  *(_QWORD *)(a2 + 64) = v4;
  return result;
}

double MADisplayFilterSetMatrix(uint64_t a1, uint64_t a2)
{
  double result;

  if (a1)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 48);
    result = *(double *)(a2 + 64);
    *(double *)(a1 + 96) = result;
  }
  return result;
}

uint64_t MADisplayFilterCopySystemFilter(int a1, int a2, int a3)
{
  uint64_t Type;
  __int16 v7;
  const void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *SingleColor;
  double v16;
  double *RedColorCorrection;
  double v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double *v23;
  double *v24;
  double v25;
  double *v26;
  double *v27;
  int64x2_t v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  Type = _MADisplayFilterGetType();
  if (!Type)
  {
    v30 = 0;
    *(_QWORD *)&v31 = 0;
    *(_QWORD *)&v33 = 0;
    v29 = (int64x2_t)0x3FF0000000000000uLL;
    *((_QWORD *)&v31 + 1) = 0x3FF0000000000000;
    v32 = 0uLL;
    *((_QWORD *)&v33 + 1) = 0x3FF0000000000000;
    return _MADisplayFilterCreateWithPostOffset((uint64_t)&v29, 0.0, 0.0, 0.0);
  }
  v7 = Type;
  v30 = 0;
  *(_QWORD *)&v31 = 0;
  *(_QWORD *)&v33 = 0;
  v29 = (int64x2_t)0x3FF0000000000000uLL;
  *((_QWORD *)&v31 + 1) = 0x3FF0000000000000;
  v32 = 0uLL;
  *((_QWORD *)&v33 + 1) = 0x3FF0000000000000;
  v8 = (const void *)_MADisplayFilterCreateWithPostOffset((uint64_t)&v29, 0.0, 0.0, 0.0);
  v9 = (uint64_t)v8;
  if (a1 && (v7 & 0x20) != 0)
  {
    if (v8)
      CFRelease(v8);
    v29 = vdupq_n_s64(0xBFD51EB851EB851FLL);
    v30 = 0xBFD51EB851EB851FLL;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v29, 0.0, 0.0, 0.0);
    *(_QWORD *)(v9 + 40) = 0x3FF0000000000000;
  }
  if ((v7 & 0x10) != 0)
  {
    MADisplayFilterPrefGetSingleColorHue();
    v11 = v10;
    MADisplayFilterPrefGetSingleColorIntensity();
    SingleColor = (double *)MADisplayFilterCreateSingleColor(v11, v13, v14, v12);
    MADisplayFilterCombine((double *)v9, SingleColor);
    if (SingleColor)
      CFRelease(SingleColor);
  }
  if ((v7 & 2) != 0)
  {
    MADisplayFilterPrefGetRedColorCorrectionIntensity();
    RedColorCorrection = (double *)MADisplayFilterCreateRedColorCorrection(v18);
    goto LABEL_20;
  }
  if ((v7 & 4) != 0)
  {
    MADisplayFilterPrefGetGreenColorCorrectionIntensity();
    RedColorCorrection = (double *)MADisplayFilterCreateGreenColorCorrection(v19);
    goto LABEL_20;
  }
  if ((v7 & 8) != 0)
  {
    MADisplayFilterPrefGetBlueColorCorrectionIntensity();
    RedColorCorrection = (double *)MADisplayFilterCreateBlueColorCorrection(v20);
LABEL_20:
    v21 = RedColorCorrection;
    MADisplayFilterCombine((double *)v9, RedColorCorrection);
    if (v21)
      CFRelease(v21);
    goto LABEL_22;
  }
  if (a2 && (v7 & 1) != 0)
  {
    MADisplayFilterPrefGetGrayscaleCorrectionIntensity();
    RedColorCorrection = (double *)MADisplayFilterCreateGrayscale(v16);
    goto LABEL_20;
  }
LABEL_22:
  if ((v7 & 0x100) != 0)
  {
    MADisplayFilterPrefGetWarmthIntensity();
    MADisplayFilterCreateBrightnessAdjust(a3, v22);
    v24 = v23;
    MADisplayFilterCombine((double *)v9, v23);
    if (v24)
      CFRelease(v24);
  }
  if ((v7 & 0x40) != 0)
  {
    MADisplayFilterPrefGetBrightnessIntensity();
    MADisplayFilterCreateBrightnessAdjust(a3, v25);
    v27 = v26;
    MADisplayFilterCombine((double *)v9, v26);
    if (v27)
      CFRelease(v27);
  }
  return v9;
}

uint64_t _MADisplayFilterGetType(void)
{
  __CFArray *v0;
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  uint64_t v4;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  uint64_t valuePtr;

  v0 = MADisplayFilterPrefCopyCategoriesForCurrentPlatform();
  if (!v0)
    return 0;
  v1 = v0;
  Count = CFArrayGetCount(v0);
  if (Count < 1)
  {
    v4 = 0;
  }
  else
  {
    v3 = Count;
    v4 = 0;
    for (i = 0; i != v3; ++i)
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v1, i);
      valuePtr = 0;
      CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr);
      if (MADisplayFilterPrefGetCategoryEnabled(valuePtr))
        v4 |= MADisplayFilterPrefGetType(valuePtr);
    }
  }
  CFRelease(v1);
  return v4;
}

uint64_t MADisplayFilterCreateIdentity()
{
  _QWORD v1[9];

  v1[0] = 0x3FF0000000000000;
  memset(&v1[1], 0, 24);
  v1[4] = 0x3FF0000000000000;
  memset(&v1[5], 0, 24);
  v1[8] = 0x3FF0000000000000;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)v1, 0.0, 0.0, 0.0);
}

uint64_t MADisplayFilterCreateRedNightMode()
{
  uint64_t result;
  int64x2_t v1;
  unint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v1 = vdupq_n_s64(0xBFD51EB851EB851FLL);
  v2 = 0xBFD51EB851EB851FLL;
  v3 = 0u;
  v4 = 0u;
  v5 = 0u;
  result = _MADisplayFilterCreateWithPostOffset((uint64_t)&v1, 0.0, 0.0, 0.0);
  *(_QWORD *)(result + 40) = 0x3FF0000000000000;
  return result;
}

uint64_t MADisplayFilterCreateSingleColor(double a1, double a2, double a3, double a4)
{
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v6 = MAUtilitiesDoubleAlmostEqual(1.0, 0.0);
  v7 = 1.0;
  v8 = 1.0;
  v9 = 1.0;
  if (!v6)
  {
    v12 = a1 * 359.9 / 60.0;
    v13 = vcvtmd_s64_f64(v12);
    v14 = v12 - (double)v13;
    v9 = 1.0;
    v15 = 1.0 - v14;
    v16 = 1.0 - (1.0 - v14);
    v7 = 0.0;
    v8 = v16;
    switch(v13)
    {
      case 0:
        break;
      case 1:
        v8 = 1.0;
        v9 = v15;
        break;
      case 2:
        v9 = 0.0;
        v8 = 1.0;
        v7 = v16;
        break;
      case 3:
        v9 = 0.0;
        v7 = 1.0;
        v8 = v15;
        break;
      case 4:
        v8 = 0.0;
        v7 = 1.0;
        v9 = v16;
        break;
      default:
        v8 = 0.0;
        v7 = v15;
        break;
    }
  }
  v17 = 1.0 - a4 + v9 * a4;
  v18 = a4 * 0.0 + (1.0 - a4) * 0.0;
  v19 = v18;
  v20 = v18;
  v21 = 1.0 - a4 + v8 * a4;
  v22 = v18;
  v23 = v18;
  v24 = v18;
  v25 = 1.0 - a4 + v7 * a4;
  v10 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v17, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v10);
  return v10;
}

double *MADisplayFilterCombine(double *result, double *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v62;
  double v63;
  double v64;
  double v65;

  if (result && a2)
  {
    v2 = result[2];
    v3 = result[3];
    v5 = result[4];
    v4 = result[5];
    v6 = result[6];
    v7 = result[7];
    v9 = result[8];
    v8 = result[9];
    v10 = result[10];
    v11 = result[11];
    v12 = result[14];
    v13 = result[15];
    v14 = a2[2];
    v15 = a2[3];
    v16 = a2[4];
    v17 = a2[5];
    v18 = a2[6];
    v19 = a2[7];
    v21 = a2[8];
    v20 = a2[9];
    v23 = a2[10];
    v22 = a2[11];
    v24 = a2[12];
    v25 = a2[13];
    v27 = a2[14];
    v26 = a2[15];
    v28 = a2[16];
    v29 = a2[17];
    v65 = v6 * v15 + v2 * v14 + v10 * v16 + v12 * v17;
    v30 = v6 * v19 + v2 * v18 + v10 * v21 + v12 * v20;
    v31 = v6 * v22 + v2 * v23 + v10 * v24 + v12 * v25;
    v32 = v6 * v26 + v2 * v27 + v10 * v28 + v12 * v29;
    v33 = v7 * v15 + v3 * v14 + v11 * v16 + v13 * v17;
    v34 = v7 * v19 + v3 * v18 + v11 * v21 + v13 * v20;
    v35 = v7 * v22 + v3 * v23 + v11 * v24 + v13 * v25;
    v36 = v7 * v26 + v3 * v27 + v11 * v28 + v13 * v29;
    v37 = v9 * v15 + v5 * v14;
    v38 = v9 * v19 + v5 * v18;
    v39 = v9 * v22 + v5 * v23;
    v40 = v9 * v26 + v5 * v27;
    v41 = result[12];
    v42 = result[13];
    v43 = v37 + v41 * v16;
    v44 = v38 + v41 * v21;
    v45 = v39 + v41 * v24;
    v46 = v40 + v41 * v28;
    v48 = result[16];
    v47 = result[17];
    v49 = v43 + v48 * v17;
    v50 = v44 + v48 * v20;
    v51 = v45 + v48 * v25;
    v52 = v46 + v48 * v29;
    v53 = v8 * v15 + v4 * v14 + v42 * v16 + v47 * v17;
    v54 = v8 * v19 + v4 * v18 + v42 * v21 + v47 * v20;
    v55 = v8 * v22 + v4 * v23 + v42 * v24 + v47 * v25;
    v56 = v8 * v26 + v4 * v27 + v42 * v28 + v47 * v29;
    v57 = result[18];
    v58 = a2[18];
    if (v57 >= v58)
      v59 = result[18];
    else
      v59 = a2[18];
    if (v57 >= v58)
      v60 = a2[18];
    else
      v60 = result[18];
    if (v58 <= 1.0 && v57 <= 1.0)
      v62 = v60;
    else
      v62 = v59;
    v63 = result[19] + a2[19];
    result[2] = v65;
    result[3] = v33;
    result[4] = v49;
    result[5] = v53;
    if (v62 < 0.0)
      v62 = 1.0;
    if (v63 < 0.0)
      v63 = 0.0;
    result[6] = v30;
    result[7] = v34;
    result[8] = v50;
    result[9] = v54;
    result[10] = v31;
    result[11] = v35;
    result[12] = v51;
    result[13] = v55;
    result[14] = v32;
    result[15] = v36;
    result[16] = v52;
    result[17] = v56;
    if (v63 <= 1.0)
      v64 = v63;
    else
      v64 = 1.0;
    result[18] = v62;
    result[19] = v64;
  }
  return result;
}

uint64_t MADisplayFilterCreateRedColorCorrection(double a1)
{
  uint64_t v1;
  double v3;
  float64x2_t v4;
  double v5;
  double v6;
  float64x2_t v7;
  double v8;
  double v9;

  if (a1 < 0.0)
    a1 = 0.0;
  if (a1 > 1.0)
    a1 = 1.0;
  v3 = a1 * 0.123284686 + 1.0;
  v4 = vmulq_n_f64((float64x2_t)xmmword_1B552BA10, a1);
  v5 = a1 * -0.120003647;
  v6 = a1 * 0.120002868 + 1.0;
  v7 = vmulq_n_f64((float64x2_t)xmmword_1B552BA20, a1);
  v8 = a1 * -0.732505139;
  v9 = a1 * 0.000000990726569 + 1.0;
  v1 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v3, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v1);
  return v1;
}

uint64_t MADisplayFilterCreateGreenColorCorrection(double a1)
{
  uint64_t v1;
  double v3;
  float64x2_t v4;
  double v5;
  double v6;
  float64x2_t v7;
  double v8;
  double v9;

  if (a1 < 0.0)
    a1 = 0.0;
  if (a1 > 1.0)
    a1 = 1.0;
  v3 = a1 * -0.235688939 + 1.0;
  v4 = vmulq_n_f64((float64x2_t)xmmword_1B552BA30, a1);
  v5 = a1 * -0.0719766168;
  v6 = a1 * 0.130708203 + 1.0;
  v7 = vmulq_n_f64((float64x2_t)xmmword_1B552BA40, a1);
  v8 = a1 * -0.8926484;
  v9 = a1 * 0.0625030946 + 1.0;
  v1 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v3, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v1);
  return v1;
}

uint64_t MADisplayFilterCreateBlueColorCorrection(double a1)
{
  uint64_t v1;
  double v3[9];

  if (a1 < 0.0)
    a1 = 0.0;
  if (a1 > 1.0)
    a1 = 1.0;
  v3[0] = a1 * 0.1332794 + 1.0;
  v3[1] = 0.0;
  v3[2] = a1 * -0.1332794;
  v3[3] = 0.0;
  v3[4] = a1 * 0.52448918 + 1.0;
  v3[5] = a1 * -0.52448918;
  v3[6] = 0.0;
  v3[7] = 0.0;
  v3[8] = 1.0;
  v1 = _MADisplayFilterCreateWithPostOffset((uint64_t)v3, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v1);
  return v1;
}

uint64_t MADisplayFilterCreateGrayscale(double a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD v9[2];
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (a1 < 0.0)
    a1 = 0.0;
  if (a1 > 1.0)
    a1 = 1.0;
  v1 = 1.0 - a1;
  v2 = a1 * 0.3;
  v3 = 1.0 - a1 + a1 * 0.3;
  v4 = a1 * 0.59;
  v5 = a1 * 0.59 + (1.0 - a1) * 0.0;
  v6 = a1 * 0.11;
  *(double *)v9 = v3;
  *(double *)&v9[1] = v5;
  v10 = v6 + v1 * 0.0;
  v11 = v2 + v1 * 0.0;
  v12 = v1 + v4;
  v13 = v10;
  v14 = v11;
  v15 = v5;
  v16 = v1 + v6;
  v7 = _MADisplayFilterCreateWithPostOffset((uint64_t)v9, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v7);
  return v7;
}

void MADisplayFilterCreateBrightnessAdjust(int a1, double a2)
{
  double v2;
  double v3;
  float64x2_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8[9];
  _OWORD v9[4];
  uint64_t v10;
  _OWORD v11[4];
  uint64_t v12;
  double v13[4];
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[4];
  uint64_t v18;
  double v19[9];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  double v25;
  float64x2_t v26;
  double v27;
  double v28;
  float64x2_t v29;
  double v30;
  double v31;

  v2 = 1.0 - a2;
  v3 = (1.0 - a2) * 0.75;
  if (a1)
  {
    MADisplayFilterCreateSaturation(v3 + 0.13);
  }
  else
  {
    v24 = 0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19[0] = 0.41350211;
    memset(&v19[1], 0, 24);
    v19[4] = 0.275342466;
    memset(&v19[5], 0, 24);
    v19[8] = 0.0470198675;
    v17[0] = xmmword_1B552BA50;
    v17[1] = xmmword_1B552BA60;
    v17[2] = xmmword_1B552BA70;
    v17[3] = xmmword_1B552BA80;
    v18 = 0x3FF779335D249E45;
    MAFilterMatrix3Multiply(v19, (double *)v17, (double *)&v20);
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
    memset(v13, 0, sizeof(v13));
    v11[0] = xmmword_1B552BA90;
    v11[1] = xmmword_1B552BAA0;
    v11[2] = xmmword_1B552BAB0;
    v11[3] = xmmword_1B552BAC0;
    v12 = 0x3FE631422CCB3A26;
    v9[2] = v22;
    v9[3] = v23;
    v10 = v24;
    v9[0] = v20;
    v9[1] = v21;
    MAFilterMatrix3Multiply((double *)v11, (double *)v9, v13);
    *(double *)v8 = v13[0];
    memset(&v8[1], 0, 24);
    v8[4] = v14;
    memset(&v8[5], 0, 24);
    v8[8] = v16;
    MAFilterMatrix3IOMFBNormalize(v8, &v25);
    v4 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v3 * 0.0), 0);
    v26 = vmlaq_n_f64(v4, v26, 1.0 - v3);
    v25 = v3 + v25 * (1.0 - v3);
    v27 = v3 * 0.0 + v27 * (1.0 - v3);
    v28 = v3 + v28 * (1.0 - v3);
    v29 = vmlaq_n_f64(v4, v29, 1.0 - v3);
    v30 = v3 * 0.0 + v30 * (1.0 - v3);
    v31 = v3 + v31 * (1.0 - v3);
    v5 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v25, 0.0, 0.0, 0.0);
    if (v5)
    {
      v6 = 0.3;
      v7 = v2 * 0.7 + 0.3;
      if (v7 < 0.3)
        v7 = 0.3;
      if (v7 <= 1.0)
        v6 = v7;
      *(double *)(v5 + 144) = v6;
    }
    MADisplayFilterNormalize(v5);
  }
}

double MADisplayFilterNormalize(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  double v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 96);
  v10 = *(_OWORD *)(a1 + 16);
  v11 = v2;
  v12 = *(_OWORD *)(a1 + 48);
  v13 = v3;
  v14 = *(_OWORD *)(a1 + 80);
  v15 = v4;
  MAFilterMatrix3IOMFBNormalize((uint64_t *)&v10, &v16);
  result = v17;
  v6 = v19;
  v7 = v21;
  v8 = v18;
  v9 = v20;
  *(_OWORD *)(a1 + 16) = v16;
  *(double *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 80) = v9;
  *(_QWORD *)(a1 + 96) = v7;
  return result;
}

double MAFilterMatrix3Multiply@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double result;

  v3 = *a2;
  v4 = a2[1];
  v6 = a1[2];
  v5 = a1[3];
  v7 = a1[1];
  v8 = a2[2];
  v9 = a2[3];
  v10 = a1[6];
  v11 = a1[7];
  v12 = v5 * v4 + *a1 * *a2 + v10 * v8;
  v13 = a2[4];
  v14 = a2[5];
  v15 = v5 * v13 + *a1 * v9 + v10 * v14;
  v16 = a2[6];
  v17 = a2[7];
  v18 = a2[8];
  v19 = v5 * v17 + *a1 * v16 + v10 * v18;
  v20 = a1[4];
  v21 = a1[5];
  v22 = v4 * v20 + v7 * *a2 + v11 * v8;
  *a3 = v12;
  a3[1] = v22;
  a3[6] = v19;
  a3[7] = v17 * v20 + v7 * v16 + v11 * v18;
  v23 = v4 * v21 + v6 * v3;
  v24 = a1[8];
  a3[2] = v23 + v24 * v8;
  a3[3] = v15;
  a3[4] = v13 * v20 + v7 * v9 + v11 * v14;
  a3[5] = v13 * v21 + v6 * v9 + v24 * v14;
  result = v17 * v21 + v6 * v16 + v24 * v18;
  a3[8] = result;
  return result;
}

uint64_t *MAFilterMatrix3IOMFBNormalize@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = 0;
  v28 = *MEMORY[0x1E0C80C00];
  v3 = *result;
  v4 = result[1];
  v19 = *result;
  v20 = v4;
  v5 = result[2];
  v6 = result[3];
  v21 = v5;
  v22 = v6;
  v7 = result[4];
  v8 = result[5];
  v23 = v7;
  v24 = v8;
  v9 = result[6];
  v10 = result[7];
  v25 = v9;
  v26 = v10;
  v11 = result[8];
  v27 = v11;
  v12 = 0.0;
  v13 = &v19;
  do
  {
    v14 = 0;
    v15 = 0.0;
    do
      v15 = v15 + *(double *)&v13[v14++];
    while (v14 != 3);
    if (v15 > v12)
      v12 = v15;
    ++v2;
    v13 += 3;
  }
  while (v2 != 3);
  if (v12 < 1.0)
  {
    v16 = 0;
    v17 = &v19;
    do
    {
      for (i = 0; i != 3; ++i)
        *(double *)&v17[i] = 1.0 / v12 * *(double *)&v17[i];
      ++v16;
      v17 += 3;
    }
    while (v16 != 3);
    v3 = v19;
    v4 = v20;
    v5 = v21;
    v6 = v22;
    v7 = v23;
    v8 = v24;
    v9 = v25;
    v10 = v26;
    v11 = v27;
  }
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = v10;
  a2[8] = v11;
  return result;
}

float64x2_t MADisplayFilterCreateSaturation(double a1)
{
  uint64_t Grayscale;
  double v3;
  double v4;
  double v5;
  double v6;
  float64x2_t result;

  Grayscale = MADisplayFilterCreateGrayscale(1.0);
  v3 = (1.0 - a1) * *(double *)(Grayscale + 48);
  v4 = a1 + (1.0 - a1) * *(double *)(Grayscale + 56);
  v5 = (1.0 - a1) * *(double *)(Grayscale + 64);
  v6 = a1 + (1.0 - a1) * *(double *)(Grayscale + 96);
  *(double *)(Grayscale + 16) = a1 + (1.0 - a1) * *(double *)(Grayscale + 16);
  *(float64x2_t *)(Grayscale + 24) = vmulq_n_f64(*(float64x2_t *)(Grayscale + 24), 1.0 - a1);
  *(double *)(Grayscale + 48) = v3;
  *(double *)(Grayscale + 56) = v4;
  *(double *)(Grayscale + 64) = v5;
  result = vmulq_n_f64(*(float64x2_t *)(Grayscale + 80), 1.0 - a1);
  *(float64x2_t *)(Grayscale + 80) = result;
  *(double *)(Grayscale + 96) = v6;
  return result;
}

_QWORD *MADisplayFilterInversionCompensationForNightShift()
{
  _QWORD *result;
  _QWORD v1[9];

  v1[0] = 0x3FF0000000000000;
  memset(&v1[1], 0, 24);
  v1[4] = 0x3FF0000000000000;
  memset(&v1[5], 0, 24);
  v1[8] = 0x3FF0000000000000;
  result = (_QWORD *)_MADisplayFilterCreateWithPostOffset((uint64_t)v1, 0.0, 0.0, 0.0);
  result[2] = 0x3FE6666666666666;
  result[7] = 0x3FF0000000000000;
  result[12] = 0x4000000000000000;
  return result;
}

uint64_t MADisplayFilterCreateTwoColor(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v7[3];
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v7[0] = (a4 - a1) * 0.33333333;
  v7[1] = v7[0];
  v7[2] = v7[0];
  v8 = (a5 - a2) * 0.33333333;
  v9 = v8;
  v10 = v8;
  v11 = (a6 - a3) * 0.33333333;
  v12 = v11;
  v13 = v11;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)v7, a1, a2, a3);
}

uint64_t _MADisplayFilterCreateWithPostOffset(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  if ((__MADisplayFilterInitialized & 1) == 0)
    __MADisplayFilterInitialize();
  result = _CFRuntimeCreateInstance();
  if (result)
  {
    *(_OWORD *)(result + 112) = 0u;
    *(_OWORD *)(result + 128) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    v9 = *(_QWORD *)(a1 + 16);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = *(_OWORD *)(a1 + 24);
    v13 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(result + 16) = *(_OWORD *)a1;
    *(_OWORD *)(result + 48) = v12;
    *(_OWORD *)(result + 80) = v13;
    *(_QWORD *)(result + 32) = v9;
    *(double *)(result + 40) = a2;
    *(_QWORD *)(result + 64) = v10;
    *(double *)(result + 72) = a3;
    *(_QWORD *)(result + 96) = v11;
    *(double *)(result + 104) = a4;
    *(_QWORD *)(result + 152) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(result + 136) = _Q0;
  }
  return result;
}

uint64_t MADisplayFilterCreateYellowBlue()
{
  _OWORD v1[4];
  uint64_t v2;

  v1[0] = vdupq_n_s64(0xBFD5555551C112DALL);
  v1[1] = v1[0];
  v1[2] = v1[0];
  v1[3] = vdupq_n_s64(0x3FD5555551C112DAuLL);
  v2 = 0x3FD5555551C112DALL;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)v1, 1.0, 1.0, 0.0);
}

uint64_t MADisplayFilterCreateYellowBlack()
{
  _OWORD v1[3];
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[0] = vdupq_n_s64(0xBFD5555551C112DALL);
  v1[1] = v1[0];
  v1[2] = v1[0];
  v3 = 0;
  v4 = 0;
  v2 = 0;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)v1, 1.0, 1.0, 0.0);
}

uint64_t MADisplayFilterCreateRedBlack()
{
  int64x2_t v1;
  unint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v1 = vdupq_n_s64(0xBFD5555551C112DALL);
  v2 = 0xBFD5555551C112DALL;
  v3 = 0u;
  v4 = 0u;
  v5 = 0u;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)&v1, 1.0, 0.0, 0.0);
}

double MADisplayFilterCreateInterpolated(float64x2_t *a1, float64x2_t *a2, double a3)
{
  uint64_t v5;
  double result;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  _QWORD v16[9];

  v16[0] = 0x3FF0000000000000;
  memset(&v16[1], 0, 24);
  v16[4] = 0x3FF0000000000000;
  memset(&v16[5], 0, 24);
  v16[8] = 0x3FF0000000000000;
  v5 = _MADisplayFilterCreateWithPostOffset((uint64_t)v16, 0.0, 0.0, 0.0);
  if (a1)
  {
    if (a2)
    {
      result = 1.0 - a3;
      v7 = vmlaq_n_f64(vmulq_n_f64(a2[2], a3), a1[2], 1.0 - a3);
      v8 = vmlaq_n_f64(vmulq_n_f64(a2[3], a3), a1[3], 1.0 - a3);
      v9 = vmlaq_n_f64(vmulq_n_f64(a2[4], a3), a1[4], 1.0 - a3);
      v10 = vmlaq_n_f64(vmulq_n_f64(a2[5], a3), a1[5], 1.0 - a3);
      v11 = vmlaq_n_f64(vmulq_n_f64(a2[6], a3), a1[6], 1.0 - a3);
      v12 = vmlaq_n_f64(vmulq_n_f64(a2[7], a3), a1[7], 1.0 - a3);
      v13 = vmlaq_n_f64(vmulq_n_f64(a2[8], a3), a1[8], 1.0 - a3);
      v14 = vmlaq_n_f64(vmulq_n_f64(a2[9], a3), a1[9], 1.0 - a3);
      *(float64x2_t *)(v5 + 16) = vmlaq_n_f64(vmulq_n_f64(a2[1], a3), a1[1], 1.0 - a3);
      *(float64x2_t *)(v5 + 32) = v7;
      *(float64x2_t *)(v5 + 48) = v8;
      *(float64x2_t *)(v5 + 64) = v9;
      *(float64x2_t *)(v5 + 80) = v10;
      *(float64x2_t *)(v5 + 96) = v11;
      *(float64x2_t *)(v5 + 112) = v12;
      *(float64x2_t *)(v5 + 128) = v13;
      *(float64x2_t *)(v5 + 144) = v14;
    }
  }
  return result;
}

uint64_t MADisplayFilterCanUseGamutRemap()
{
  unsigned int Type;

  Type = _MADisplayFilterGetType();
  if ((Type & 2) != 0)
    return 1;
  else
    return (Type >> 2) & 1;
}

uint64_t MADisplayFilterGetGamutRemapLeafNodeCount()
{
  return 79;
}

uint64_t MADisplayFilterGetGamutRemapNonLeafNodeCount()
{
  return 78;
}

CFDataRef MADisplayFilterCopyGamutRemapXYZtoYuvCoeffs()
{
  return CFDataCreateWithBytesNoCopy(0, XYZtoYuvCoeffs, 48, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

CFDataRef MADisplayFilterCopyGamutRemapYuvtoXYZCoeffs()
{
  return CFDataCreateWithBytesNoCopy(0, YuvtoXYZCoeffs, 48, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

CFDataRef MADisplayFilterCopyGamutRemapNonLeafNodeConfigForFilter(uint64_t a1)
{
  return CFDataCreateWithBytesNoCopy(0, &LorikeetNonleafNodes[624 * a1], 624, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

CFDataRef MADisplayFilterCopyGamutRemapNonLeafNodeConfig()
{
  unint64_t Type;

  Type = _MADisplayFilterGetType();
  return CFDataCreateWithBytesNoCopy(0, &LorikeetNonleafNodes[624 * ((Type >> 2) & 1)], 624, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

CFDataRef MADisplayFilterCopyGamutRemapNonLeafNodesForFilter(uint64_t a1)
{
  return CFDataCreateWithBytesNoCopy(0, &LorikeetNonleafHyperplanes[1248 * a1], 1248, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

CFDataRef MADisplayFilterCopyGamutRemapNonLeafNodes()
{
  unint64_t Type;

  Type = _MADisplayFilterGetType();
  return CFDataCreateWithBytesNoCopy(0, &LorikeetNonleafHyperplanes[1248 * ((Type >> 2) & 1)], 1248, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

CFMutableDataRef MADisplayFilterCopyGamutRemapLeafNodesForFilter(uint64_t a1, __n128 a2)
{
  __CFData *Mutable;
  uint64_t v4;
  char *v5;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  float64x2_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  double *v21;
  unsigned __int16 *v22;
  unint64_t v23;
  unsigned int v24;
  float32x2_t *v25;
  float64x2_t v26;
  double v27;
  float32x2_t *v28;
  uint64_t v29;
  const double *v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const double *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  const double *v41;
  unint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  double *v46;
  uint64_t v47;
  const double *__B;
  double *v49;
  double *v50;
  uint64_t i;
  float64x2_t v52;
  float64x2_t v53;
  _OWORD v55[2];
  uint64_t v56;
  CFMutableDataRef v57;
  __n128 v58;
  _OWORD *v59;
  UInt8 bytes[48];
  double __C[18];
  float64x2x3_t v62;
  float64x2x3_t v63;

  v58 = a2;
  __C[16] = *(double *)MEMORY[0x1E0C80C00];
  Mutable = CFDataCreateMutable(0, 3792);
  v57 = Mutable;
  v4 = 0;
  v5 = (char *)&LorikeetLeafNodes[560 * a1 + 1];
  v56 = a1;
  __asm { FMOV            V5.2D, #1.0 }
  v55[1] = vdupq_lane_s64(v58.n128_i64[0], 0);
  v55[0] = _Q5;
  do
  {
    v59 = v55;
    if (LorikeetLeafNodes[560 * v56 + 7 * v4] == 2)
      v11 = 6;
    else
      v11 = 4;
    v12 = MEMORY[0x1E0C80A78](Mutable, 24);
    v14 = MEMORY[0x1E0C80A78](v12, v13);
    v19 = (double *)&v55[1] - v18;
    v21 = (double *)(v20 + 16);
    v22 = (unsigned __int16 *)v5;
    v23 = v11;
    do
    {
      v24 = *v22++;
      v25 = (float32x2_t *)((char *)&LorikeetLeafNodePoints + 564 * a1 + 12 * v24);
      v26 = vcvtq_f64_f32(*v25);
      *((float64x2_t *)v21 - 1) = v26;
      v27 = v25[1].f32[0];
      *v21 = v27;
      v21 += 3;
      v28 = (float32x2_t *)((char *)&LorikeetLeafNodeTargets + 564 * a1 + 12 * v24);
      *((float64x2_t *)v19 - 1) = vmlaq_f64(v26, v17, vsubq_f64(vcvtq_f64_f32(*v28), v26));
      *v19 = v27 + (v28[1].f32[0] - v27) * v16;
      v19 += 3;
      --v23;
    }
    while (v23);
    MEMORY[0x1E0C80A78](v14, v15);
    v33 = (char *)v55 - 8 * v32;
    v34 = 0;
    do
    {
      v62 = vld3q_f64(v30);
      v30 += 6;
      *(float64x2_t *)&v33[v34] = v62.val[0];
      *(float64x2_t *)&v33[8 * v11 + v34] = v62.val[1];
      *(float64x2_t *)&v33[16 * v11 + v34] = v62.val[2];
      *(_OWORD *)&v33[v11 * (unint64_t)v29 + v34] = v31;
      v34 += 16;
    }
    while (8 * v11 != v34);
    v35 = MEMORY[0x1E0C80A78](v33, v29);
    v41 = (const double *)((char *)v55 - v40);
    v42 = 0;
    v43 = (char *)&v55[v11 / 2] - v40;
    v44 = (char *)v55 + v11 * (unint64_t)v36 - v40;
    v45 = (char *)&v55[v11] - v40;
    do
    {
      v63 = vld3q_f64(v37);
      v37 += 6;
      *(float64x2_t *)&v41[v42 / 8] = v63.val[0];
      *(float64x2_t *)&v43[v42] = v63.val[1];
      *(float64x2_t *)&v45[v42] = v63.val[2];
      *(_OWORD *)&v44[v42] = v39;
      v42 += 16;
    }
    while (v38 != v42);
    v46 = (double *)MEMORY[0x1E0C80A78](v35, v36);
    __B = (const double *)((char *)v55 - v47);
    pinv(v46, v11, (double *)((char *)v55 - v47), v49);
    v50 = __C;
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, 4, 4, v11, 1.0, v41, v11, __B, 4, 0.0, __C, 4);
    for (i = 0; i != 48; i += 16)
    {
      v53 = *(float64x2_t *)v50;
      v52 = *(float64x2_t *)(v50 + 2);
      v50 += 4;
      *(float32x4_t *)&bytes[i] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v53), v52);
    }
    CFDataAppendBytes(v57, bytes, 48);
    ++v4;
    v5 += 14;
  }
  while (v4 != 79);
  return v57;
}

void pinv(double *a1, int a2, double *a3, double *a4)
{
  uint64_t v6;
  __CLPK_doublereal *v7;
  __CLPK_integer v8;
  __CLPK_doublereal *__work;
  __CLPK_integer *__iwork;
  int v11;
  __CLPK_doublereal *v12;
  double **v13;
  uint64_t v14;
  __CLPK_doublereal *v15;
  uint64_t v16;
  char *v17;
  double *v18;
  __CLPK_integer v19;
  __CLPK_integer v20;
  __CLPK_integer __ldu;
  __CLPK_integer __n;
  __CLPK_integer __lda;
  char __jobz;
  __CLPK_doublereal __vt[16];
  __CLPK_doublereal __s[6];

  v18 = a3;
  __s[4] = *(__CLPK_doublereal *)MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78]();
  v7 = (__CLPK_doublereal *)((char *)&v18 - v6);
  __jobz = 65;
  __lda = v8;
  __n = 4;
  __ldu = v8;
  __work = (__CLPK_doublereal *)malloc_type_malloc(0x10uLL, 0x100004000313F17uLL);
  v20 = -1;
  __iwork = (__CLPK_integer *)malloc_type_malloc(0x80uLL, 0xCF8FD928uLL);
  v19 = 0;
  dgesdd_(&__jobz, &__ldu, &__n, a1, &__lda, __s, v7, &__ldu, __vt, &__n, __work, &v20, __iwork, &v19);
  v11 = (int)*__work;
  v20 = v11;
  free(__work);
  v12 = (__CLPK_doublereal *)malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
  dgesdd_(&__jobz, &__ldu, &__n, a1, &__lda, __s, v7, &__ldu, __vt, &__n, v12, &v20, __iwork, &v19);
  free(v12);
  free(__iwork);
  MEMORY[0x1E0C80A78]();
  v13 = &(&v18)[-(4 * a2)];
  bzero(v13, 8 * (4 * a2));
  if (a2 >= 1)
  {
    v14 = 0;
    v15 = __s;
    do
    {
      if (fabs(*v15) > 1.0e-14)
        *(double *)&v13[v14] = 1.0 / *v15;
      v14 += 5;
      ++v15;
    }
    while (5 * a2 != v14);
  }
  MEMORY[0x1E0C80A78]();
  v17 = (char *)&v18 - ((v16 + 15) & 0xFFFFFFFF0);
  bzero(v17, 8 * (4 * a2));
  cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasTrans, a2, 4, 4, 1.0, (const double *)v13, 4, __vt, 4, 0.0, (double *)v17, 4);
  cblas_dgemm(CblasRowMajor, CblasTrans, CblasNoTrans, a2, 4, a2, 1.0, v7, a2, (const double *)v17, 4, 0.0, v18, 4);
}

CFMutableDataRef MADisplayFilterCopyGamutRemapLeafNodes()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t Type;
  __n128 v3;

  if ((_MADisplayFilterGetType() & 4) != 0)
    MADisplayFilterPrefGetGreenColorCorrectionIntensity();
  else
    MADisplayFilterPrefGetRedColorCorrectionIntensity();
  v1 = v0;
  Type = _MADisplayFilterGetType();
  v3.n128_u64[0] = v1;
  return MADisplayFilterCopyGamutRemapLeafNodesForFilter((Type >> 2) & 1, v3);
}

BOOL __MADisplayFilterEqual(double *cf, double *a2)
{
  uint64_t v4;

  if ((__MADisplayFilterInitialized & 1) == 0)
    __MADisplayFilterInitialize();
  v4 = __kMADisplayFilterTypeID;
  return (!cf || a2)
      && (cf || !a2)
      && (cf == a2
       || v4 == CFGetTypeID(cf)
       && v4 == CFGetTypeID(a2)
       && MAUtilitiesDoubleAlmostEqual(cf[2], a2[2])
       && MAUtilitiesDoubleAlmostEqual(cf[3], a2[3])
       && MAUtilitiesDoubleAlmostEqual(cf[4], a2[4])
       && MAUtilitiesDoubleAlmostEqual(cf[5], a2[5])
       && MAUtilitiesDoubleAlmostEqual(cf[6], a2[6])
       && MAUtilitiesDoubleAlmostEqual(cf[7], a2[7])
       && MAUtilitiesDoubleAlmostEqual(cf[8], a2[8])
       && MAUtilitiesDoubleAlmostEqual(cf[9], a2[9])
       && MAUtilitiesDoubleAlmostEqual(cf[10], a2[10])
       && MAUtilitiesDoubleAlmostEqual(cf[11], a2[11])
       && MAUtilitiesDoubleAlmostEqual(cf[12], a2[12])
       && MAUtilitiesDoubleAlmostEqual(cf[13], a2[13])
       && MAUtilitiesDoubleAlmostEqual(cf[14], a2[14])
       && MAUtilitiesDoubleAlmostEqual(cf[15], a2[15])
       && MAUtilitiesDoubleAlmostEqual(cf[16], a2[16])
       && MAUtilitiesDoubleAlmostEqual(cf[17], a2[17])
       && MAUtilitiesDoubleAlmostEqual(cf[18], a2[18])
       && MAUtilitiesDoubleAlmostEqual(cf[19], a2[19]));
}

unint64_t __MADisplayFilterHash(double *a1)
{
  return (unint64_t)(a1[2]
                          + a1[3]
                          + a1[4]
                          + a1[5]
                          + a1[6]
                          + a1[7]
                          + a1[8]
                          + a1[9]
                          + a1[10]
                          + a1[11]
                          + a1[12]
                          + a1[13]
                          + a1[14]
                          + a1[15]
                          + a1[16]
                          + a1[17]
                          + a1[18]
                          + a1[19]);
}

CFStringRef __MADisplayFilterCopyDescription(const void *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<MADisplayFilter %p>\n[ [%0.2f, %0.2f, %0.2f, %0.2f]\n  [%0.2f, %0.2f, %0.2f, %0.2f]\n  [%0.2f, %0.2f, %0.2f, %0.2f]\n  [%0.2f, %0.2f, %0.2f, %0.2f] ]"), a1, *((_QWORD *)a1 + 2), *((_QWORD *)a1 + 3), *((_QWORD *)a1 + 4), *((_QWORD *)a1 + 5), *((_QWORD *)a1 + 6), *((_QWORD *)a1 + 7), *((_QWORD *)a1 + 8), *((_QWORD *)a1 + 9), *((_QWORD *)a1 + 10), *((_QWORD *)a1 + 11), *((_QWORD *)a1 + 12), *((_QWORD *)a1 + 13), *((_QWORD *)a1 + 14), *((_QWORD *)a1 + 15), *((_QWORD *)a1 + 16),
           *((_QWORD *)a1 + 17));
}

void MAPreferencesPostChangeNotification(const __CFString *a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
    CFNotificationCenterPostNotification(DarwinNotifyCenter, a1, 0, 0, 1u);
}

void MAPreferencesPostChangeNotificationIfNeeded(unint64_t a1, unint64_t a2, const __CFString *a3)
{
  if (a1 && a2)
  {
    if (CFEqual((CFTypeRef)a1, (CFTypeRef)a2))
      return;
LABEL_6:
    MAPreferencesPostChangeNotification(a3);
    return;
  }
  if (a1 | a2)
    goto LABEL_6;
}

void _settingsChangedNotificationHandler(uint64_t a1, uint64_t a2, const void *a3)
{
  const __CFString *v4;
  __CFNotificationCenter *LocalCenter;
  CFNotificationName *v6;

  if (_MADomainOverride)
    v4 = (const __CFString *)_MADomainOverride;
  else
    v4 = CFSTR("com.apple.mediaaccessibility");
  CFPreferencesAppSynchronize(v4);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  if (CFEqual(a3, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged")))
  {
    v6 = (CFNotificationName *)&kMACaptionAppearanceSettingsChangedNotification;
  }
  else
  {
    if (!CFEqual(a3, CFSTR("com.apple.mediaaccessibility.audibleMediaSettingsChanged")))
      return;
    v6 = (CFNotificationName *)&kMAAudibleMediaSettingsChangedNotification;
  }
  CFNotificationCenterPostNotification(LocalCenter, *v6, 0, 0, 1u);
}

__CFDictionary *MAPreferencesCopyMultipleProfiles(const __CFArray *a1)
{
  __CFDictionary *Mutable;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFString *v7;
  const __CFString *v8;
  CFPropertyListRef v9;
  const void *v10;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v4 = Count;
    for (i = 0; i != v4; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, i);
      v7 = ValueAtIndex;
      if (_MADomainOverride)
        v8 = (const __CFString *)_MADomainOverride;
      else
        v8 = CFSTR("com.apple.mediaaccessibility");
      v9 = CFPreferencesCopyAppValue(ValueAtIndex, v8);
      if (v9)
      {
        v10 = v9;
        CFDictionarySetValue(Mutable, v7, v9);
        CFRelease(v10);
      }
    }
  }
  return Mutable;
}

void MAPreferencesSetMultipleProfiles(const __CFDictionary *a1)
{
  int64_t Count;
  size_t v3;
  const void **v4;
  const void **v5;
  uint64_t i;
  const void *v7;
  const __CFString *v8;
  BOOL v9;
  const __CFString *v10;

  Count = CFDictionaryGetCount(a1);
  if (Count >= 1)
  {
    v3 = Count;
    v4 = (const void **)malloc_type_calloc(8uLL, Count, 0xB9A00BFCuLL);
    v5 = (const void **)malloc_type_calloc(8uLL, v3, 0x4C02D5AFuLL);
    CFDictionaryGetKeysAndValues(a1, v4, v5);
    for (i = 0; i != v3; ++i)
    {
      v7 = v5[i];
      v8 = (const __CFString *)v4[i];
      if (v7)
        v9 = v8 == 0;
      else
        v9 = 1;
      if (!v9)
      {
        if (_MADomainOverride)
          v10 = (const __CFString *)_MADomainOverride;
        else
          v10 = CFSTR("com.apple.mediaaccessibility");
        CFPreferencesSetAppValue(v8, v7, v10);
      }
    }
    free(v4);
    free(v5);
  }
}

void MAPreferencesRemoveProfile(__CFString *a1)
{
  if (a1)
    _preferencesSetValue(a1, 0);
}

__CFArray *MAPreferencesCopyProfileIDs(const __CFString *a1)
{
  const __CFArray *Mutable;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFIndex Count;
  CFIndex v6;
  const void **v7;
  uint64_t i;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  int64_t v11;
  int64_t v12;
  const void **v13;
  uint64_t j;
  const void *v15;
  __CFArray *v16;
  CFIndex v17;
  CFIndex v18;
  CFIndex k;
  const __CFString *ValueAtIndex;
  CFTypeID v21;
  CFRange v23;
  CFRange v24;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v3 = (const __CFDictionary *)_preferencesDefaults();
  if (v3)
  {
    v4 = v3;
    Count = CFDictionaryGetCount(v3);
    if (Count >= 1)
    {
      v6 = Count;
      v7 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(v4, v7, 0);
      for (i = 0; i != v6; ++i)
      {
        v23.length = CFArrayGetCount(Mutable);
        v23.location = 0;
        if (!CFArrayContainsValue(Mutable, v23, v7[i]))
          CFArrayAppendValue(Mutable, v7[i]);
      }
      free(v7);
    }
  }
  v9 = (const __CFDictionary *)_CFPrefsCopyAppDictionaryWithContainer();
  if (v9)
  {
    v10 = v9;
    v11 = CFDictionaryGetCount(v9);
    if (v11 >= 1)
    {
      v12 = v11;
      v13 = (const void **)malloc_type_calloc(8uLL, v11, 0x4ABDB0B2uLL);
      CFDictionaryGetKeysAndValues(v10, v13, 0);
      for (j = 0; j != v12; ++j)
      {
        v15 = v13[j];
        if (v15)
        {
          v24.length = CFArrayGetCount(Mutable);
          v24.location = 0;
          if (!CFArrayContainsValue(Mutable, v24, v15))
            CFArrayAppendValue(Mutable, v15);
        }
      }
      free(v13);
    }
    CFRelease(v10);
  }
  if (!Mutable)
    return 0;
  if (a1)
  {
    v16 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v17 = CFArrayGetCount(Mutable);
    if (v17 >= 1)
    {
      v18 = v17;
      for (k = 0; k != v18; ++k)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Mutable, k);
        v21 = CFGetTypeID(ValueAtIndex);
        if (v21 == CFStringGetTypeID() && CFStringHasPrefix(ValueAtIndex, a1))
          CFArrayAppendValue(v16, ValueAtIndex);
      }
    }
  }
  else
  {
    v16 = (__CFArray *)CFRetain(Mutable);
  }
  CFRelease(Mutable);
  return v16;
}

void MAPreferencesSetProfileValue(__CFString *theString, __CFString *a2, const void *a3)
{
  CFTypeID TypeID;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  __CFDictionary *MutableCopy;

  if (a2)
  {
    if (!theString || !CFStringGetLength(theString))
    {
      _preferencesSetValue(a2, a3);
      return;
    }
    TypeID = CFDictionaryGetTypeID();
    v7 = (const __CFDictionary *)MAPreferencesCopyProfileValueWithExpectedType(0, theString, TypeID);
    if (v7)
    {
      v8 = v7;
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v7);
      CFRelease(v8);
      if (!MutableCopy)
        return;
    }
    else
    {
      MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (!MutableCopy)
        return;
    }
    if (a3)
      CFDictionarySetValue(MutableCopy, a2, a3);
    else
      CFDictionaryRemoveValue(MutableCopy, a2);
    _preferencesSetValue(theString, MutableCopy);
    CFRelease(MutableCopy);
  }
}

void _preferencesSetValue(__CFString *a1, const void *a2)
{
  NSObject *v4;
  const __CFString *v5;

  if (_preferenceAccessRequiresXPC(a1))
  {
    v4 = _copyResultPreferenceXPCCall(a1, 1, a2);
    if (v4)
      CFRelease(v4);
  }
  else
  {
    if (_MADomainOverride)
      v5 = (const __CFString *)_MADomainOverride;
    else
      v5 = CFSTR("com.apple.mediaaccessibility");
    CFPreferencesSetAppValue(a1, a2, v5);
    if (_MADomainOverride)
      CFPreferencesAppSynchronize((CFStringRef)_MADomainOverride);
    else
      CFPreferencesAppSynchronize(CFSTR("com.apple.mediaaccessibility"));
  }
}

void MAPreferencesSetProfileColor(__CFString *theString, __CFString *a2, CGColor *a3)
{
  __CFDictionary *Mutable;
  float v6;
  float v7;
  float v8;
  float v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  float v15;
  float v16;
  float v17;
  float valuePtr;
  double v19;
  double v20;
  double v21;
  double v22;

  if (!a3)
  {
    MAPreferencesSetProfileValue(theString, a2, 0);
    return;
  }
  v21 = 0.0;
  v22 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  if (!MAUtilitiesRGBValuesForColor(a3, &v22, &v21, &v20, &v19))
    return;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v6 = v22;
  v7 = v20;
  v17 = v7;
  valuePtr = v6;
  v8 = v21;
  v9 = v19;
  v15 = v9;
  v16 = v8;
  v10 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  v11 = CFNumberCreate(0, kCFNumberFloatType, &v17);
  v12 = CFNumberCreate(0, kCFNumberFloatType, &v16);
  v13 = CFNumberCreate(0, kCFNumberFloatType, &v15);
  v14 = v13;
  if (v10 && v12 && v11 && v13)
  {
    CFDictionarySetValue(Mutable, CFSTR("Red"), v10);
    CFDictionarySetValue(Mutable, CFSTR("Blue"), v11);
    CFDictionarySetValue(Mutable, CFSTR("Green"), v12);
    CFDictionarySetValue(Mutable, CFSTR("Alpha"), v14);
    MAPreferencesSetProfileValue(theString, a2, Mutable);
LABEL_10:
    CFRelease(v10);
    goto LABEL_11;
  }
  if (v10)
    goto LABEL_10;
LABEL_11:
  if (v12)
    CFRelease(v12);
  if (v11)
    CFRelease(v11);
  if (v14)
    CFRelease(v14);
  if (Mutable)
    CFRelease(Mutable);
}

const __CFString *MAPreferencesCopyProfileFont(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID;
  const __CFString *result;
  const __CFString *v6;
  CGFontRef CGFontWithName;

  TypeID = CFStringGetTypeID();
  result = (const __CFString *)MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
  if (result)
  {
    v6 = result;
    CGFontWithName = MAUtilitiesCreateCGFontWithName(result);
    CFRelease(v6);
    return (const __CFString *)CGFontWithName;
  }
  return result;
}

void MAPreferencesSetProfileFont(__CFString *theString, __CFString *a2, CGFontRef font)
{
  CFStringRef v5;
  CFStringRef v6;

  if (font)
  {
    v5 = CGFontCopyPostScriptName(font);
    if (v5)
    {
      v6 = v5;
      MAPreferencesSetProfileValue(theString, a2, v5);
      CFRelease(v6);
    }
  }
  else
  {
    MAPreferencesSetProfileValue(theString, a2, 0);
  }
}

void MAPreferencesSetProfileFontDescriptor(__CFString *theString, __CFString *a2, const __CTFontDescriptor *a3)
{
  const void *PostScriptNameFromFontDescriptor;
  const void *v6;

  if (a3)
  {
    PostScriptNameFromFontDescriptor = MAUtilitiesCreatePostScriptNameFromFontDescriptor(a3);
    if (PostScriptNameFromFontDescriptor)
    {
      v6 = PostScriptNameFromFontDescriptor;
      MAPreferencesSetProfileValue(theString, a2, PostScriptNameFromFontDescriptor);
      CFRelease(v6);
    }
  }
  else
  {
    MAPreferencesSetProfileValue(theString, a2, 0);
  }
}

void MAPreferencesSetValue(__CFString *a1, const void *a2)
{
  if (a1)
    _preferencesSetValue(a1, a2);
}

void MAPreferencesSetColor(__CFString *a1, CGColor *a2)
{
  MAPreferencesSetProfileColor(0, a1, a2);
}

void MASetCaptionCallStatus(int a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  xpc_object_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (_xpcConnection_onceToken != -1)
    dispatch_once(&_xpcConnection_onceToken, &__block_literal_global_33);
  v2 = (_xpc_connection_s *)_xpcConnection__XpcConnection;
  if (_xpcConnection__XpcConnection)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "getOrSet", "set");
    xpc_dictionary_set_BOOL(v3, "preferenceValue", a1 != 0);
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v4, "callStatus", v3);
    xpc_connection_send_message(v2, v4);
    if (v3)
      CFRelease(v3);
    if (v4)
      CFRelease(v4);
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v5)
      MASetCaptionCallStatus_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

BOOL MAGetCaptionCallStatus()
{
  _xpc_connection_s *v0;
  xpc_object_t v1;
  xpc_object_t v2;
  xpc_object_t v3;
  void *v4;
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (_xpcConnection_onceToken != -1)
    dispatch_once(&_xpcConnection_onceToken, &__block_literal_global_33);
  v0 = (_xpc_connection_s *)_xpcConnection__XpcConnection;
  if (_xpcConnection__XpcConnection)
  {
    v1 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v1, "getOrSet", "get");
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v2, "callStatus", v1);
    v3 = xpc_connection_send_message_with_reply_sync(v0, v2);
    v4 = v3;
    if (v3 == (xpc_object_t)MEMORY[0x1E0C81260])
    {
      v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v14)
        MAGetCaptionCallStatus_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      if (v3 != (xpc_object_t)MEMORY[0x1E0C81258])
      {
        if (MEMORY[0x1B5E4CA54](v3) == MEMORY[0x1E0C812F8])
        {
          v5 = xpc_dictionary_get_BOOL(v4, "result");
          if (!v4)
            goto LABEL_18;
        }
        else
        {
          v5 = 0;
          if (!v4)
            goto LABEL_18;
        }
LABEL_17:
        CFRelease(v4);
LABEL_18:
        if (v1)
          CFRelease(v1);
        if (v2)
          CFRelease(v2);
        return v5;
      }
      v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v22)
        MAGetCaptionCallStatus_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    v5 = 0;
    goto LABEL_17;
  }
  v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v6)
    MAGetCaptionCallStatus_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  return 0;
}

void MAMacBuddySettingsToTransfer(const __CFDictionary *a1)
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  const __CFString *v4;
  __CFDictionary *Value;
  CFMutableDictionaryRef Mutable;
  const __CFString *v7;

  if (a1)
  {
    v2 = (const __CFBoolean *)MACaptionAppearancePrefCopyPreferAccessibleCaptions();
    if (v2)
    {
      v3 = v2;
      if (CFBooleanGetValue(v2))
      {
        if (_MADomainOverride)
          v4 = (const __CFString *)_MADomainOverride;
        else
          v4 = CFSTR("com.apple.mediaaccessibility");
        Value = (__CFDictionary *)CFDictionaryGetValue(a1, v4);
        if (Value)
        {
          Mutable = Value;
          CFRetain(Value);
        }
        else
        {
          Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          if (_MADomainOverride)
            v7 = (const __CFString *)_MADomainOverride;
          else
            v7 = CFSTR("com.apple.mediaaccessibility");
          CFDictionarySetValue(a1, v7, Mutable);
        }
        MACaptionAppearanceMacBuddySettingsToTransfer(Mutable);
        CFRelease(Mutable);
      }
      CFRelease(v3);
    }
  }
}

void MAPreferencesSetDomainOverride(const __CFString *a1)
{
  const void *v1;
  __CFString *MutableCopy;

  v1 = (const void *)_MADomainOverride;
  if (a1)
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, CFSTR("com.apple.mediaaccessibility"));
    CFStringAppend(MutableCopy, CFSTR("-"));
    CFStringAppend(MutableCopy, a1);
  }
  else
  {
    MutableCopy = 0;
  }
  _MADomainOverride = (uint64_t)MutableCopy;
  if (v1)
    CFRelease(v1);
}

void ___copyResultPreferenceXPCCall_block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v1)
    CFRelease(v1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t MAUtilitiesFontsUseSamePostScriptName(const __CTFontDescriptor *a1, const __CTFontDescriptor *a2)
{
  unint64_t PostScriptNameFromFontDescriptor;
  unint64_t v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;

  PostScriptNameFromFontDescriptor = (unint64_t)MAUtilitiesCreatePostScriptNameFromFontDescriptor(a1);
  v4 = (unint64_t)MAUtilitiesCreatePostScriptNameFromFontDescriptor(a2);
  if (!(PostScriptNameFromFontDescriptor | v4))
    return 1;
  v6 = (const void *)v4;
  if (PostScriptNameFromFontDescriptor && v4)
  {
    v7 = CFEqual((CFTypeRef)PostScriptNameFromFontDescriptor, (CFTypeRef)v4);
  }
  else
  {
    v7 = 0;
    v5 = 0;
    if (!PostScriptNameFromFontDescriptor)
      goto LABEL_8;
  }
  CFRelease((CFTypeRef)PostScriptNameFromFontDescriptor);
  v5 = v7;
LABEL_8:
  if (v6)
    CFRelease(v6);
  return v5;
}

const void *MAUtilitiesCreatePostScriptNameFromFontDescriptor(const __CTFontDescriptor *a1)
{
  CFTypeRef v1;
  const void *v2;
  CFTypeID v3;

  if (!a1)
    return 0;
  v1 = CTFontDescriptorCopyAttribute(a1, (CFStringRef)*MEMORY[0x1E0CA8380]);
  v2 = v1;
  if (v1)
  {
    v3 = CFGetTypeID(v1);
    if (v3 != CFStringGetTypeID())
    {
      CFRelease(v2);
      return 0;
    }
  }
  return v2;
}

uint64_t MAUtilitiesFontSupportsLanguage(const __CTFontDescriptor *a1, const __CFString *a2)
{
  __CFArray *OrderedCanonicalLanguageIdentifiersFromString;
  __CFArray *v4;
  CFIndex Count;
  uint64_t v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFTypeID v9;
  CFTypeID TypeID;
  BOOL v11;
  uint64_t v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex v15;
  char v16;
  const __CFString *ValueAtIndex;
  const __CFString *v18;
  CFTypeID v19;
  CFLocaleRef v20;
  uint64_t v21;
  const __CFString *v22;
  CFLocaleRef v23;

  if (!a2)
    return 1;
  if (!a1)
    return 0;
  OrderedCanonicalLanguageIdentifiersFromString = MAUtilitiesCreateOrderedCanonicalLanguageIdentifiersFromString(a2);
  if (!OrderedCanonicalLanguageIdentifiersFromString)
    return 0;
  v4 = OrderedCanonicalLanguageIdentifiersFromString;
  Count = CFArrayGetCount(OrderedCanonicalLanguageIdentifiersFromString);
  if (!Count)
  {
    CFRelease(v4);
    return 0;
  }
  v6 = Count;
  v7 = (const __CFArray *)CTFontDescriptorCopyAttribute(a1, (CFStringRef)*MEMORY[0x1E0CA8360]);
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(v7);
    TypeID = CFArrayGetTypeID();
    v11 = v9 == TypeID;
    v12 = v9 != TypeID;
    if (v11)
    {
      v13 = CFArrayGetCount(v8);
      if (v13 < 1)
      {
        v12 = 0;
      }
      else
      {
        v14 = v13;
        v15 = 0;
        v16 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v8, v15);
          if (ValueAtIndex)
          {
            v18 = ValueAtIndex;
            v19 = CFGetTypeID(ValueAtIndex);
            if (v19 == CFStringGetTypeID())
            {
              v20 = CFLocaleCreate(0, v18);
              if (v6 >= 1)
              {
                v21 = 1;
                do
                {
                  v22 = (const __CFString *)CFArrayGetValueAtIndex(v4, v21 - 1);
                  v23 = CFLocaleCreate(0, v22);
                  if (CFEqual(v20, v23))
                    v16 = 1;
                  if (v23)
                    CFRelease(v23);
                  if ((v16 & 1) != 0)
                    break;
                }
                while (v21++ < v6);
              }
              if (v20)
                CFRelease(v20);
              if ((v16 & 1) != 0)
                break;
            }
          }
          if (++v15 == v14)
          {
            v12 = v16 & 1;
            goto LABEL_31;
          }
        }
        v12 = 1;
      }
    }
LABEL_31:
    CFRelease(v4);
  }
  else
  {
    v12 = 1;
    v8 = v4;
  }
  CFRelease(v8);
  return v12;
}

CTFontDescriptorRef _MAUtilitiesCreateCTFontDescriptorForSystemFontType(uint64_t a1)
{
  CFNumberRef v2;
  __CFDictionary *Mutable;
  const void *v4;
  CFNumberRef v5;
  CTFontDescriptorRef v6;
  __CFDictionary *v7;
  uint64_t valuePtr;

  if (a1 == -1)
    return 0;
  valuePtr = *MEMORY[0x1E0CA84C8];
  v2 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v4 = (const void *)*MEMORY[0x1E0CA8450];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA8450], (const void *)*MEMORY[0x1E0CA8430]);
  if (a1 == 2)
  {
    v5 = (CFNumberRef)*MEMORY[0x1E0CA8438];
    goto LABEL_7;
  }
  if (a1 == 1)
  {
    v4 = (const void *)*MEMORY[0x1E0CA84E8];
    v5 = v2;
LABEL_7:
    CFDictionarySetValue(Mutable, v4, v5);
  }
  v7 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(v7, (const void *)*MEMORY[0x1E0CA8418], Mutable);
  v6 = CTFontDescriptorCreateWithAttributes(v7);
  if (v2)
    CFRelease(v2);
  if (v7)
    CFRelease(v7);
  if (Mutable)
    CFRelease(Mutable);
  return v6;
}

__CFString *MAUtilitiesGetFallbackPSFontNameForSystemFontType(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E6928850[a1];
}

CGFontRef MAUtilitiesCreateCGFontWithName(const __CFString *a1)
{
  uint64_t SystemFontType;
  const __CTFontDescriptor *CTFontDescriptorForSystemFontType;
  const __CTFontDescriptor *v4;
  const __CTFont *v5;
  const __CTFont *v6;
  CGFontRef v7;

  SystemFontType = MACaptionAppearancePrefGetSystemFontType(a1);
  CTFontDescriptorForSystemFontType = _MAUtilitiesCreateCTFontDescriptorForSystemFontType(SystemFontType);
  if (CTFontDescriptorForSystemFontType)
  {
    v4 = CTFontDescriptorForSystemFontType;
    v5 = CTFontCreateWithFontDescriptor(CTFontDescriptorForSystemFontType, 0.0, 0);
    if (v5)
    {
      v6 = v5;
      v7 = CTFontCopyGraphicsFont(v5, 0);
      CFRelease(v6);
      CFRelease(v4);
      if (v7)
        return v7;
    }
    else
    {
      CFRelease(v4);
    }
  }
  return CGFontCreateWithFontName(a1);
}

CGColor *MAUtilitiesRGBValuesForColor(CGColor *result, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  CGColor *v9;
  const CGFloat *Components;

  if (result)
  {
    v9 = result;
    result = CGColorGetColorSpace(result);
    if (result)
    {
      if (CGColorSpaceGetModel(result) == kCGColorSpaceModelRGB)
      {
        Components = CGColorGetComponents(v9);
        if (a2)
          *a2 = *(_QWORD *)Components;
        if (a3)
          *a3 = *((_QWORD *)Components + 1);
        if (a4)
          *a4 = *((_QWORD *)Components + 2);
        if (a5)
          *a5 = *((_QWORD *)Components + 3);
        return (CGColor *)1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

BOOL MAUtilitiesLanguageStringMatchesLanguage(const __CFString *a1, const __CFString *a2)
{
  const __CFString *CanonicalLanguageIdentifierFromString;
  const __CFString *v4;
  const __CFString *LanguageFromLocaleIdentifier;
  const __CFString *v6;
  _BOOL8 v7;

  CanonicalLanguageIdentifierFromString = MAUtilitiesCreateCanonicalLanguageIdentifierFromString(a1);
  if (!CanonicalLanguageIdentifierFromString)
    return 0;
  v4 = CanonicalLanguageIdentifierFromString;
  LanguageFromLocaleIdentifier = (const __CFString *)MAXUtilitiesCreateLanguageFromLocaleIdentifier(CanonicalLanguageIdentifierFromString);
  if (LanguageFromLocaleIdentifier)
  {
    v6 = LanguageFromLocaleIdentifier;
    v7 = CFStringCompare(LanguageFromLocaleIdentifier, a2, 1uLL) == kCFCompareEqualTo;
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

CFTypeRef MAUtilitiesCopyFontOverideLanguage(const __CFString *a1)
{
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  const __CFString *ValueAtIndex;

  if (MAUtilitiesCustomizedFontLanguages_onceToken != -1)
    dispatch_once(&MAUtilitiesCustomizedFontLanguages_onceToken, &__block_literal_global_2);
  v2 = (const __CFArray *)MAUtilitiesCustomizedFontLanguages_customizedLanguages;
  if (!MAUtilitiesCustomizedFontLanguages_customizedLanguages)
    return 0;
  Count = CFArrayGetCount((CFArrayRef)MAUtilitiesCustomizedFontLanguages_customizedLanguages);
  if (Count < 1)
    return 0;
  v4 = Count;
  v5 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, v5);
    if (MAUtilitiesLanguageStringMatchesLanguage(a1, ValueAtIndex))
      break;
    if (v4 == ++v5)
      return 0;
  }
  return CFRetain(ValueAtIndex);
}

CFTypeRef MAUtilitiesCreatePreferredPostScriptNameForLanguage(const __CFString *a1)
{
  if (a1 && MAUtilitiesLanguageStringMatchesLanguage(a1, CFSTR("ja")))
    return CFRetain(CFSTR("HiraMaruProN-W4"));
  else
    return 0;
}

BOOL MAUtilitiesDoubleAlmostEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 0.0000001;
}

BOOL MACaptionAppearanceAddPreferredLanguage(CFStringRef language)
{
  return MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, language);
}

CFArrayRef MACaptionAppearanceCopyPreferredLanguages()
{
  return MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
}

BOOL MAXCaptionAppearanceSetPreferredLanguage(CFStringRef language)
{
  return MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, language);
}

CFArrayRef MAXCaptionAppearanceCopyPreferredLanguages()
{
  return MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
}

BOOL MACaptionAppearanceGetShowCaptions()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  _BOOL8 v2;

  v0 = (const __CFBoolean *)MACaptionAppearancePrefCopyShowCaptionsWhenAvailable();
  if (!v0)
    return 0;
  v1 = v0;
  v2 = CFBooleanGetValue(v0) != 0;
  CFRelease(v1);
  return v2;
}

void MACaptionAppearanceSetShowCaptions(uint64_t a1, int a2)
{
  const __CFBoolean **v2;

  v2 = (const __CFBoolean **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v2 = (const __CFBoolean **)MEMORY[0x1E0C9AE40];
  MACaptionAppearancePrefSetShowCaptionsWhenAvailable(*v2);
}

uint64_t MAXCaptionAppearanceHasUserDefinedValues()
{
  return 1;
}

uint64_t MAXCaptionAppearanceBehaviorCopyForegroundColor(MACaptionAppearanceDomain domain, CGColorRef *a2)
{
  CGColorRef v3;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  v3 = MACaptionAppearanceCopyForegroundColor((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
  {
    *a2 = v3;
  }
  else if (v3)
  {
    CFRelease(v3);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyBackgroundColor(MACaptionAppearanceDomain domain, CGColorRef *a2)
{
  CGColorRef v3;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  v3 = MACaptionAppearanceCopyBackgroundColor((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
  {
    *a2 = v3;
  }
  else if (v3)
  {
    CFRelease(v3);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyWindowColor(MACaptionAppearanceDomain domain, CGColorRef *a2)
{
  CGColorRef v3;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  v3 = MACaptionAppearanceCopyWindowColor((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
  {
    *a2 = v3;
  }
  else if (v3)
  {
    CFRelease(v3);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyForegroundOpacity(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  CGFloat ForegroundOpacity;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  ForegroundOpacity = MACaptionAppearanceGetForegroundOpacity((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &ForegroundOpacity);
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyBackgroundOpacity(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  CGFloat BackgroundOpacity;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  BackgroundOpacity = MACaptionAppearanceGetBackgroundOpacity((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &BackgroundOpacity);
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyWindowOpacity(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  CGFloat WindowOpacity;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  WindowOpacity = MACaptionAppearanceGetWindowOpacity((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &WindowOpacity);
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyWindowRoundedCornerRadius(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  CGFloat WindowRoundedCornerRadius;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  WindowRoundedCornerRadius = MACaptionAppearanceGetWindowRoundedCornerRadius((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &WindowRoundedCornerRadius);
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyFontForStyle(unsigned int a1, unsigned int a2, const __CFString **a3)
{
  const __CFString *v4;
  uint64_t v6;

  v6 = 0;
  v4 = MACaptionAppearanceCopyFontForStyle(a1, &v6, a2);
  if (a3)
  {
    *a3 = v4;
  }
  else if (v4)
  {
    CFRelease(v4);
  }
  return v6;
}

const __CFString *MACaptionAppearanceCopyFontForStyle(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  const __CFString *v5;
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  const __CFString *v9;

  if (a1 == 1)
  {
    v5 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!a2)
      goto LABEL_11;
    *a2 = 0;
LABEL_7:
    v7 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideFontForStyle(v5, a3);
    if (v7)
    {
      v8 = v7;
      if (CFBooleanGetValue(v7))
        *a2 = 1;
      CFRelease(v8);
    }
LABEL_11:
    v9 = MACaptionAppearancePrefCopyFontForStyle(v5, a3);
    if (!v5)
      return v9;
    goto LABEL_14;
  }
  CFRetain(CFSTR("MACaptionSystemDefaultProfile"));
  if (a2)
  {
    *a2 = 0;
    if (a1)
    {
      v5 = CFSTR("MACaptionSystemDefaultProfile");
      goto LABEL_7;
    }
  }
  v5 = CFSTR("MACaptionSystemDefaultProfile");
  v9 = MACaptionAppearancePrefCopyFontForStyle(CFSTR("MACaptionSystemDefaultProfile"), a3);
LABEL_14:
  CFRelease(v5);
  return v9;
}

uint64_t MAXCaptionAppearanceBehaviorCopyRelativeCharacterSize(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  CGFloat RelativeCharacterSize;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  RelativeCharacterSize = MACaptionAppearanceGetRelativeCharacterSize((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &RelativeCharacterSize);
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorGetTextEdgeStyle(MACaptionAppearanceDomain domain, _DWORD *a2)
{
  int TextEdgeStyle;
  MACaptionAppearanceBehavior behavior;

  behavior = kMACaptionAppearanceBehaviorUseValue;
  TextEdgeStyle = MACaptionAppearanceGetTextEdgeStyle((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
    *a2 = TextEdgeStyle;
  return behavior;
}

CGColorRef MAXCaptionAppearanceCopyForegroundColor()
{
  const __CFString *v0;
  CGColorRef v1;

  v0 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v1 = MACaptionAppearancePrefCopyForegroundColor(v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

CGColorRef MAXCaptionAppearanceCopyBackgroundColor()
{
  const __CFString *v0;
  CGColorRef v1;

  v0 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v1 = MACaptionAppearancePrefCopyBackgroundColor(v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

CGColorRef MAXCaptionAppearanceCopyWindowColor()
{
  const __CFString *v0;
  CGColorRef v1;

  v0 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v1 = MACaptionAppearancePrefCopyWindowColor(v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

BOOL MAXCaptionAppearanceGetForegroundOpacity(void *a1)
{
  const __CFString *v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  _BOOL8 v5;

  v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v3 = (const __CFNumber *)MACaptionAppearancePrefCopyForegroundOpacity(v2);
  if (!v3)
  {
    v5 = 0;
    if (!v2)
      return v5;
    goto LABEL_8;
  }
  v4 = v3;
  if (a1)
    v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  else
    v5 = 1;
  CFRelease(v4);
  if (v2)
LABEL_8:
    CFRelease(v2);
  return v5;
}

BOOL MAXCaptionAppearanceGetBackgroundOpacity(void *a1)
{
  const __CFString *v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  _BOOL8 v5;

  v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v3 = (const __CFNumber *)MACaptionAppearancePrefCopyBackgroundOpacity(v2);
  if (!v3)
  {
    v5 = 0;
    if (!v2)
      return v5;
    goto LABEL_8;
  }
  v4 = v3;
  if (a1)
    v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  else
    v5 = 1;
  CFRelease(v4);
  if (v2)
LABEL_8:
    CFRelease(v2);
  return v5;
}

BOOL MAXCaptionAppearanceGetWindowOpacity(void *a1)
{
  const __CFString *v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  _BOOL8 v5;

  v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v3 = (const __CFNumber *)MACaptionAppearancePrefCopyWindowOpacity(v2);
  if (!v3)
  {
    v5 = 0;
    if (!v2)
      return v5;
    goto LABEL_8;
  }
  v4 = v3;
  if (a1)
    v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  else
    v5 = 1;
  CFRelease(v4);
  if (v2)
LABEL_8:
    CFRelease(v2);
  return v5;
}

BOOL MAXCaptionAppearanceGetWindowRoundedCornerRadius(void *a1)
{
  const __CFString *v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  _BOOL8 v5;

  v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v3 = (const __CFNumber *)MACaptionAppearancePrefCopyWindowRoundedCornerRadius(v2);
  if (!v3)
  {
    v5 = 0;
    if (!v2)
      return v5;
    goto LABEL_8;
  }
  v4 = v3;
  if (a1)
    v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  else
    v5 = 1;
  CFRelease(v4);
  if (v2)
LABEL_8:
    CFRelease(v2);
  return v5;
}

const __CFString *MAXCaptionAppearanceCopyFontForStyle(unsigned int a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v3 = MACaptionAppearancePrefCopyFontForStyle(v2, a1);
  if (v2)
    CFRelease(v2);
  return v3;
}

BOOL MAXCaptionAppearanceGetRelativeCharacterSize(void *a1)
{
  const __CFString *v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  _BOOL8 v5;

  v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v3 = (const __CFNumber *)MACaptionAppearancePrefCopyRelativeCharacterSize(v2);
  if (!v3)
  {
    v5 = 0;
    if (!v2)
      return v5;
    goto LABEL_8;
  }
  v4 = v3;
  if (a1)
    v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  else
    v5 = 1;
  CFRelease(v4);
  if (v2)
LABEL_8:
    CFRelease(v2);
  return v5;
}

uint64_t MAXCaptionAppearanceGetTextEdgeStyle()
{
  const __CFString *v0;
  const __CFNumber *v1;
  const __CFNumber *v2;
  uint64_t v3;
  unsigned int valuePtr;

  v0 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  v1 = MACaptionAppearancePrefCopyTextEdgeStyle(v0);
  if (!v1)
  {
    v3 = 0;
    if (!v0)
      return v3;
    goto LABEL_6;
  }
  v2 = v1;
  valuePtr = 0;
  if (CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr))
    v3 = valuePtr;
  else
    v3 = 0;
  CFRelease(v2);
  if (v0)
LABEL_6:
    CFRelease(v0);
  return v3;
}

uint64_t static MAMusicHaptics.enabledStatusDidChangeNotification.getter()
{
  return sub_1B55279C0();
}

void type metadata accessor for OptionKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF12ADD0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF12ADD0);
  }
}

uint64_t sub_1B5526BB8(uint64_t a1, uint64_t a2)
{
  return sub_1B5526C80(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1B5526BC4()
{
  sub_1B55279E4();
  sub_1B55279F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5526C04()
{
  uint64_t v0;

  sub_1B55279E4();
  sub_1B5527A14();
  sub_1B55279F0();
  v0 = sub_1B5527A20();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B5526C74(uint64_t a1, uint64_t a2)
{
  return sub_1B5526C80(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1B5526C80(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1B55279E4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1B5526CBC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1B55279CC();
  *a2 = 0;
  return result;
}

uint64_t sub_1B5526D30(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1B55279D8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B5526DAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1B55279E4();
  v2 = sub_1B55279C0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B5526DEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1B55279E4();
  v2 = v1;
  if (v0 == sub_1B55279E4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1B5527A08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B5526E74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1B55279C0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B5526EB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1B55279E4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1B5526EE0()
{
  sub_1B5526FB8((unint64_t *)&qword_1EF12ADF0, (uint64_t)&unk_1B552BC58);
  sub_1B5526FB8(&qword_1EF12ADF8, (uint64_t)&unk_1B552BBAC);
  return sub_1B55279FC();
}

uint64_t sub_1B5526F4C()
{
  return sub_1B5526FB8(&qword_1EF12ADD8, (uint64_t)&unk_1B552BB70);
}

uint64_t sub_1B5526F70()
{
  return sub_1B5526FB8(&qword_1EF12ADE0, (uint64_t)&unk_1B552BB44);
}

uint64_t sub_1B5526F94()
{
  return sub_1B5526FB8(&qword_1EF12ADE8, (uint64_t)&unk_1B552BBE0);
}

uint64_t sub_1B5526FB8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for OptionKey();
    result = MEMORY[0x1B5E4C970](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t MAFlashingLightsProcessor.Result.surfaceProcessed.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

float MAFlashingLightsProcessor.Result.mitigationLevel.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 4);
}

float MAFlashingLightsProcessor.Result.intensityLevel.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 8);
}

void MAFlashingLightsProcessor.processSurface(_:outSurface:timestamp:options:)(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  void *v5;
  void *v6;
  uint64_t v10;
  id v11;
  unsigned __int8 v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v6 = a3;
  v10 = *a2;
  if (a3)
  {
    type metadata accessor for OptionKey();
    sub_1B5527100();
    v6 = (void *)sub_1B55279B4();
  }
  v11 = objc_msgSend(v5, sel_processSurface_outSurface_timestamp_options_, a1, v10, v6, a5);

  v12 = objc_msgSend(v11, sel_surfaceProcessed);
  objc_msgSend(v11, sel_mitigationLevel);
  v14 = v13;
  objc_msgSend(v11, sel_intensityLevel);
  v16 = v15;

  *(_BYTE *)a4 = v12;
  *(_DWORD *)(a4 + 4) = v14;
  *(_DWORD *)(a4 + 8) = v16;
}

unint64_t sub_1B5527100()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF12ADF0;
  if (!qword_1EF12ADF0)
  {
    type metadata accessor for OptionKey();
    result = MEMORY[0x1B5E4C970](&unk_1B552BC58, v1);
    atomic_store(result, (unint64_t *)&qword_1EF12ADF0);
  }
  return result;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s6ResultVwet(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[12])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s6ResultVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 12) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 12) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for MAFlashingLightsProcessor.Result()
{
  return &type metadata for MAFlashingLightsProcessor.Result;
}

void MADimFlashingLightsEnabled_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean soft_AXSPhotosensitiveMitigationEnabled(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MAVideoAccommodations.m"), 13, CFSTR("%s"), dlerror());

  __break(1u);
}

void soft_AXSHapticMusicEnabled_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean soft_AXSHapticMusicEnabled(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MAMusicHaptics.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccessibilityUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MAMusicHaptics.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXSettingsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MAMusicHaptics.m"), 21, CFSTR("Unable to find class %s"), "AXSettings");

  __break(1u);
}

void __getAXUIClientClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccessibilityUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MAMusicHaptics.m"), 26, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXUIClientClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXUIClientClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MAMusicHaptics.m"), 27, CFSTR("Unable to find class %s"), "AXUIClient");

  __break(1u);
}

void __getAXAccessQueueClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AXCoreUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MAMusicHaptics.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXAccessQueueClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXAccessQueueClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MAMusicHaptics.m"), 32, CFSTR("Unable to find class %s"), "AXAccessQueue");

  __break(1u);
}

void __getPSEVideoProcessorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotosensitivityProcessingLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MAFlashingLightsProcessing.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPSEVideoProcessorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPSEVideoProcessorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MAFlashingLightsProcessing.m"), 14, CFSTR("Unable to find class %s"), "PSEVideoProcessor");

  __break(1u);
}

void MASetCaptionCallStatus_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B5518000, MEMORY[0x1E0C81028], a3, "setInCallStatus bad connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void MAGetCaptionCallStatus_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B5518000, MEMORY[0x1E0C81028], a3, "getInCallStatus bad connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void MAGetCaptionCallStatus_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B5518000, MEMORY[0x1E0C81028], a3, "getInCallStatus invalid connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void MAGetCaptionCallStatus_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B5518000, MEMORY[0x1E0C81028], a3, "getInCallStatus interrupted connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1B55279B4()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B55279C0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B55279CC()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1B55279D8()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1B55279E4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B55279F0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B55279FC()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1B5527A08()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B5527A14()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B5527A20()
{
  return MEMORY[0x1E0DEDF40]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
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

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97DF0](alloc, str, attributes);
}

CFTypeID CFAttributedStringGetTypeID(void)
{
  return MEMORY[0x1E0C97E58]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFArrayRef CFBundleCopyPreferredLocalizationsFromArray(CFArrayRef locArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98070](locArray);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
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

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1E0C98658](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987A0](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1E0C987B8](allocator, localeID);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C98B88](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C991D0](theString, locale);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x1E0C9C700](font);
}

CGFontRef CGFontCreateWithFontName(CFStringRef name)
{
  return (CGFontRef)MEMORY[0x1E0C9C750](name);
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC320](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C0]();
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
  MEMORY[0x1E0CBC3E0](metadata, rootPath, options, block);
}

CFTypeID CGImageMetadataGetTypeID(void)
{
  return MEMORY[0x1E0CBC3E8]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC408](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1E0CBC418](metadata, parent, path, tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1E0CBC448](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1E0CBC450](xmlns, prefix, name, *(_QWORD *)&type, value);
}

CGImageMetadataType CGImageMetadataTagGetType(CGImageMetadataTagRef tag)
{
  return MEMORY[0x1E0CBC458](tag);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x1E0CBC510](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x1E0CA79C8](font, attributes);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7AA0](descriptor, attribute);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7AB8](original, attributes);
}

uint64_t CTFontDescriptorCreateForCSSFamily()
{
  return MEMORY[0x1E0CA7AD0]();
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7AE8](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x1E0CA7B08]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPrefsCopyAppDictionaryWithContainer()
{
  return MEMORY[0x1E0C9A3B8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
  MEMORY[0x1E0C8BB48](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__TransB, *(_QWORD *)&__M, *(_QWORD *)&__N, *(_QWORD *)&__K, __A, *(_QWORD *)&__lda, __alpha, __beta);
}

int dgesdd_(char *__jobz, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__iwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BCF0](__jobz, __m, __n, __a, __lda, __s, __u, __ldu);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
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

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t uloc_toLanguageTag()
{
  return MEMORY[0x1E0DE6470]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
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

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
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

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

