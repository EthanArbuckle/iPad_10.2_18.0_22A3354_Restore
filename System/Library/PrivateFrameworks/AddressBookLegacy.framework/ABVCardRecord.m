@implementation ABVCardRecord

- (ABVCardRecord)initWithRecord:(void *)a3
{
  ABVCardRecord *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABVCardRecord;
  v4 = -[ABVCardRecord init](&v6, sel_init);
  if (v4)
  {
    v4->_record = (void *)CFRetain(a3);
    v4->_properties = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  }
  return v4;
}

- (ABVCardRecord)init
{
  ABVCardRecord *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABVCardRecord;
  v2 = -[ABVCardRecord init](&v4, sel_init);
  if (v2)
  {
    v2->_record = (void *)ABPersonCreate();
    v2->_properties = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  }
  return v2;
}

- (ABVCardRecord)initWithVCardRepresentation:(id)a3
{
  ABVCardRecord *v4;
  ABVCardRecord *v5;
  void *v6;
  ABVCardParser *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ABVCardRecord;
  v4 = -[ABVCardRecord init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v6 = (void *)objc_opt_new();
      v7 = -[ABVCardParser initWithData:]([ABVCardParser alloc], "initWithData:", a3);
      v8 = -[ABVCardParser sortedPeopleAndProperties:](v7, "sortedPeopleAndProperties:", 0);
      if (objc_msgSend(v8, "count") == 1)
        v5->_record = (void *)CFRetain((CFTypeRef)objc_msgSend(v8, "lastObject"));

      v5->_properties = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  void *record;
  __CFArray *properties;
  objc_super v5;

  record = self->_record;
  if (record)
    CFRelease(record);
  properties = self->_properties;
  if (properties)
    CFRelease(properties);
  v5.receiver = self;
  v5.super_class = (Class)ABVCardRecord;
  -[ABVCardRecord dealloc](&v5, sel_dealloc);
}

- (id)vCardRepresentationForMode:(int)a3
{
  id v3;
  id v4;

  if (!a3)
    return -[ABVCardRecord _21vCardRepresentationAsData](self, "_21vCardRepresentationAsData");
  if (a3 != 1)
    return 0;
  v3 = -[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:](self, "_copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:", 0, 0, 0, 0, 0);
  v4 = (id)objc_msgSend(v3, "copyABVCardDataRepresentation");
  ABRegulatoryLogReadTransmitContactsData();

  return v4;
}

- (void)record
{
  return self->_record;
}

+ (__CFArray)supportedProperties
{
  if (supportedProperties_onceToken != -1)
    dispatch_once(&supportedProperties_onceToken, &__block_literal_global_58);
  return (__CFArray *)supportedProperties_retVal;
}

CFArrayRef __36__ABVCardRecord_supportedProperties__block_invoke()
{
  CFArrayRef result;
  void *values[37];

  values[36] = *(void **)MEMORY[0x1E0C80C00];
  values[0] = (void *)kABPersonKindProperty;
  values[1] = (void *)kABPersonFirstNameProperty;
  values[2] = (void *)kABPersonMiddleNameProperty;
  values[3] = (void *)kABPersonLastNameProperty;
  values[4] = (void *)kABPersonPreviousFamilyNameProperty;
  values[5] = (void *)kABPersonPrefixProperty;
  values[6] = (void *)kABPersonSuffixProperty;
  values[7] = (void *)kABPersonNicknameProperty;
  values[8] = (void *)kABPersonFirstNamePhoneticProperty;
  values[9] = (void *)kABPersonMiddleNamePhoneticProperty;
  values[10] = (void *)kABPersonLastNamePhoneticProperty;
  values[11] = (void *)kABPersonFirstNamePronunciationProperty;
  values[12] = (void *)kABPersonMiddleNamePronunciationProperty;
  values[13] = (void *)kABPersonLastNamePronunciationProperty;
  values[14] = (void *)kABPersonOrganizationProperty;
  values[15] = (void *)kABPersonOrganizationPhoneticProperty;
  values[16] = (void *)kABPersonOrganizationPronunciationProperty;
  values[17] = (void *)kABPersonJobTitleProperty;
  values[18] = (void *)kABPersonDepartmentProperty;
  values[19] = (void *)kABPersonPhoneProperty;
  values[20] = (void *)kABPersonEmailProperty;
  values[21] = (void *)kABPersonAddressProperty;
  values[22] = (void *)kABPersonURLProperty;
  values[23] = (void *)kABPersonDateProperty;
  values[24] = (void *)kABPersonBirthdayProperty;
  values[25] = (void *)kABPersonNoteProperty;
  values[26] = (void *)kABPersonSocialProfileProperty;
  values[27] = (void *)kABPersonInstantMessageProperty;
  values[28] = (void *)kABPersonRelatedNamesProperty;
  values[29] = (void *)kABPersonImageURIProperty;
  values[30] = (void *)kABPersonPhonemeDataProperty;
  values[31] = (void *)kABPersonAlternateBirthdayProperty;
  values[32] = (void *)kABPersonMapsDataProperty;
  values[33] = (void *)kABPersonSoundProperty;
  values[34] = (void *)kABPersonWallpaperProperty;
  values[35] = (void *)kABPersonWallpaperURIProperty;
  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 36, 0);
  supportedProperties_retVal = (uint64_t)result;
  return result;
}

- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4
{
  __CFArray *v7;
  const __CFArray *v8;
  _BOOL4 v9;
  CFRange v11;

  v7 = +[ABVCardRecord supportedProperties](ABVCardRecord, "supportedProperties");
  if (a4
    && (v8 = v7,
        v11.length = CFArrayGetCount(v7),
        v11.location = 0,
        CFArrayGetFirstIndexOfValue(v8, v11, (const void *)(int)a4) == -1))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = ABRecordSetValue(self->_record, a4, a3, 0);
    if (v9)
    {
      CFArrayAppendValue(self->_properties, (const void *)(int)a4);
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

+ (BOOL)privateVCardEnabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("ABPrivateVCardFieldsEnabled"), CFSTR("com.apple.AddressBook"), 0) != 0;
}

+ (void)setPrivateVCardEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("ABPrivateVCardFieldsEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.AddressBook"));
}

+ (void)setVCardField:(id)a3 isPrivate:(BOOL)a4
{
  void *v6;
  id v7;
  CFPropertyListRef valuea;
  void *value;

  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("ABPrivateVCardFields"), CFSTR("com.apple.AddressBook"));
  valuea = (CFPropertyListRef)objc_msgSend(v6, "mutableCopy");

  v7 = (id)valuea;
  if (!valuea)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  value = v7;
  if (a4)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), a3);
  else
    objc_msgSend(v7, "removeObjectForKey:", a3);
  CFPreferencesSetAppValue(CFSTR("ABPrivateVCardFields"), value, CFSTR("com.apple.AddressBook"));

}

+ (void)clearPrivateFields
{
  CFPreferencesSetAppValue(CFSTR("ABPrivateVCardFields"), 0, CFSTR("com.apple.AddressBook"));
}

+ (BOOL)vcardFieldisPrivate:(id)a3
{
  void *v4;

  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("ABPrivateVCardFields"), CFSTR("com.apple.AddressBook"));
  LOBYTE(a3) = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", a3), "BOOLValue");

  return (char)a3;
}

+ (void)setIncludeNotesInVCards:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("ABIncludeNotesInVCard"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.AddressBook"));
}

+ (BOOL)includeNotesInVCards
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ABIncludeNotesInVCard"), CFSTR("com.apple.AddressBook"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (void)setIncludeAddressingGrammarInVCards:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("ABIncludeAddressingGrammarInVCard"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.AddressBook"));
}

+ (BOOL)includeAddressingGrammarInVCards
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ABIncludeAddressingGrammarInVCard"), CFSTR("com.apple.AddressBook"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (void)setIncludeREVInVCards:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("ABIncludeREVInVCard"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.AddressBook"));
}

+ (BOOL)includeREVInVCards
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ABIncludeREVInVCard"), CFSTR("com.apple.AddressBook"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (BOOL)includeImageURIInVCards
{
  return 0;
}

+ (BOOL)includeABClipRectInVCardPhotos
{
  return 0;
}

+ (void)setIncludePhotosInVCards:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("ABIncludePhotosInVCard"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.AddressBook"));
}

+ (BOOL)includePhotosInVCards
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ABIncludePhotosInVCard"), CFSTR("com.apple.AddressBook"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (BOOL)includeWallpaperURIInVCards
{
  return 0;
}

- (BOOL)_showField:(unsigned int)a3
{
  return 1;
}

- (BOOL)_showField:(unsigned int)a3 identifier:(int)a4
{
  return 1;
}

- (id)_vCardKeyForAddressLabel:(id)a3 vCard3:(BOOL)a4
{
  _BOOL4 v4;
  const __CFString *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;

  v4 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Work>!$_")))
  {
    v6 = CFSTR("WORK");
    v7 = CFSTR(";type=WORK");
    goto LABEL_5;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Home>!$_")))
  {
    v6 = CFSTR("HOME");
    v7 = CFSTR(";type=HOME");
LABEL_5:
    if (v4)
      return (id)v7;
    else
      return (id)v6;
  }
  v9 = objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Other>!$_"));
  v10 = CFSTR("OTHER");
  if (v4)
    v10 = CFSTR(";type=OTHER");
  if (v9)
    return (id)v10;
  else
    return 0;
}

- (__CFString)_vCardKeyForGenericLabel:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Work>!$_")) & 1) != 0)
    return CFSTR("WORK");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Home>!$_")))
    return CFSTR("HOME");
  return 0;
}

- (id)_vCardKeysForPhoneLabel:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Work>!$_")))
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = CFSTR("VOICE");
    return (id)objc_msgSend(v4, "arrayWithObjects:", CFSTR("WORK"), v5, 0, v13);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Home>!$_")))
  {
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = CFSTR("VOICE");
    return (id)objc_msgSend(v7, "arrayWithObjects:", CFSTR("HOME"), v8, 0, v13);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Other>!$_")))
  {
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = CFSTR("VOICE");
    return (id)objc_msgSend(v9, "arrayWithObjects:", CFSTR("OTHER"), v10, 0, v13);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Mobile>!$_")))
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("CELL"), CFSTR("VOICE"), 0, v13);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("iPhone")))
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("IPHONE"), CFSTR("CELL"), CFSTR("VOICE"), 0);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Apple Watch")))
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("APPLEWATCH"), CFSTR("CELL"), CFSTR("VOICE"), 0);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Main>!$_")))
  {
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = CFSTR("MAIN");
    return (id)objc_msgSend(v11, "arrayWithObject:", v12);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<WorkFAX>!$_")))
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = CFSTR("FAX");
    return (id)objc_msgSend(v4, "arrayWithObjects:", CFSTR("WORK"), v5, 0, v13);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<HomeFAX>!$_")))
  {
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = CFSTR("FAX");
    return (id)objc_msgSend(v7, "arrayWithObjects:", CFSTR("HOME"), v8, 0, v13);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<OtherFAX>!$_")))
  {
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = CFSTR("FAX");
    return (id)objc_msgSend(v9, "arrayWithObjects:", CFSTR("OTHER"), v10, 0, v13);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Pager>!$_")))
  {
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = CFSTR("PAGER");
    return (id)objc_msgSend(v11, "arrayWithObject:", v12);
  }
  return 0;
}

- (__CFString)_vCardKeyForEmailLabel:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Work>!$_")) & 1) != 0)
    return CFSTR("WORK");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_$!<Home>!$_")))
    return CFSTR("HOME");
  return 0;
}

- (void)appendLabel:(id)a3 toVCardRep:(id)a4 inGroup:(id)a5
{
  if (a3)
  {
    objc_msgSend(a4, "appendString:", a5);
    objc_msgSend(a4, "appendString:", CFSTR("."));
    objc_msgSend(a4, "appendString:", CFSTR("X-ABLabel:"));
    objc_msgSend(a4, "appendString:", objc_msgSend(a3, "abVCardKoshify"));
    objc_msgSend(a4, "appendString:", CFSTR("\r\n"));
  }
}

- (id)newISO8061StringFromDate:(id)a3
{
  if (newISO8061StringFromDate__pred != -1)
    dispatch_once(&newISO8061StringFromDate__pred, &__block_literal_global_120);
  return (id)objc_msgSend((id)newISO8061StringFromDate__gmtDateFormatter, "stringFromDate:", a3);
}

uint64_t __42__ABVCardRecord_newISO8061StringFromDate___block_invoke()
{
  newISO8061StringFromDate__gmtDateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB36A8]);
  return objc_msgSend((id)newISO8061StringFromDate__gmtDateFormatter, "setFormatOptions:", 275);
}

- (id)ISO8061StringFromDate:(id)a3
{
  return -[ABVCardRecord newISO8061StringFromDate:](self, "newISO8061StringFromDate:", a3);
}

- (id)ISO8061StringFromDateTime:(id)a3
{
  if (ISO8061StringFromDateTime__pred != -1)
    dispatch_once(&ISO8061StringFromDateTime__pred, &__block_literal_global_122);
  return (id)objc_msgSend((id)ISO8061StringFromDateTime__gmtDateFormatter, "stringFromDate:", a3);
}

uint64_t __43__ABVCardRecord_ISO8061StringFromDateTime___block_invoke()
{
  ISO8061StringFromDateTime__gmtDateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB36A8]);
  return objc_msgSend((id)ISO8061StringFromDateTime__gmtDateFormatter, "setFormatOptions:", 1907);
}

- (id)stringForAlternateBirthdayComponent:(id)a3 key:(id)a4 formatWidth:(int)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)&a5;
  if (objc_msgSend(a3, "objectForKeyedSubscript:", a4))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*li"), v5, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", a4), "integerValue"));
  else
    return CFSTR("-");
}

- (id)stringFromAlternateBirthday:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v5, "appendFormat:", CFSTR("CALSCALE=%@:"), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("calendarIdentifier")));
  objc_msgSend(v5, "appendString:", -[ABVCardRecord stringForAlternateBirthdayComponent:key:formatWidth:](self, "stringForAlternateBirthdayComponent:key:formatWidth:", a3, CFSTR("era"), 4));
  objc_msgSend(v5, "appendString:", -[ABVCardRecord stringForAlternateBirthdayComponent:key:formatWidth:](self, "stringForAlternateBirthdayComponent:key:formatWidth:", a3, CFSTR("year"), 4));
  objc_msgSend(v5, "appendString:", -[ABVCardRecord stringForAlternateBirthdayComponent:key:formatWidth:](self, "stringForAlternateBirthdayComponent:key:formatWidth:", a3, CFSTR("month"), 2));
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isLeapMonth")), "BOOLValue"))
    objc_msgSend(v5, "appendString:", CFSTR("L"));
  objc_msgSend(v5, "appendString:", -[ABVCardRecord stringForAlternateBirthdayComponent:key:formatWidth:](self, "stringForAlternateBirthdayComponent:key:formatWidth:", a3, CFSTR("day"), 2));
  return v5;
}

- (void)copyValueForProperty:(unsigned int)a3
{
  return (void *)ABRecordCopyValue(self->_record, a3);
}

- (void)valueForProperty:(unsigned int)a3
{
  return -[ABVCardRecord copyValueForProperty:](self, "copyValueForProperty:", *(_QWORD *)&a3);
}

- (id)propertyLineForGenericABProperty:(unsigned int)a3 vCardProperty:(id)a4 is21:(BOOL)a5 groupCount:(int64_t *)a6
{
  uint64_t v8;
  void *v10;
  void *v11;
  const void *v12;
  CFIndex Count;
  CFIndex v14;
  CFIndex v15;
  uint64_t IdentifierAtIndex;
  CFTypeRef v17;
  const void *v18;
  CFTypeRef v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  CFIndex v25;
  const void *v26;
  ABVCardRecord *v27;
  int PrimaryIdentifier;
  ABPropertyType PropertyType;
  void *v30;

  v8 = *(_QWORD *)&a3;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", v8);
  if (v11)
  {
    v12 = v11;
    PropertyType = ABMultiValueGetPropertyType(v11);
    PrimaryIdentifier = ABCMultiValueGetPrimaryIdentifier((uint64_t)v12);
    Count = ABMultiValueGetCount(v12);
    if (Count)
    {
      v14 = Count;
      v15 = 0;
      v26 = v12;
      v27 = self;
      v25 = Count;
      do
      {
        IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v12, v15);
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", v8, IdentifierAtIndex))
        {
          v17 = ABMultiValueCopyValueAtIndex(v12, v15);
          v18 = v17;
          if (PropertyType == 4)
            v19 = -[ABVCardRecord newISO8061StringFromDate:](self, "newISO8061StringFromDate:", v17);
          else
            v19 = CFRetain(v17);
          v30 = (void *)v19;
          v20 = (__CFString *)ABMultiValueCopyLabelAtIndex(v12, v15);
          v21 = -[ABVCardRecord _vCardKeyForGenericLabel:](self, "_vCardKeyForGenericLabel:", v20);
          v22 = (uint64_t)v21;
          if (a5 || v21)
          {
            objc_msgSend(v10, "appendString:", a4);
            if (v22)
            {
              objc_msgSend(v10, "appendString:", CFSTR(";type="));
              objc_msgSend(v10, "appendString:", v22);
              v22 = 0;
            }
          }
          else
          {
            v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item%ld"), (*a6)++);
            objc_msgSend(v10, "appendString:", v22);
            objc_msgSend(v10, "appendString:", CFSTR("."));
            objc_msgSend(v10, "appendString:", a4);
          }
          if ((_DWORD)IdentifierAtIndex == PrimaryIdentifier)
            objc_msgSend(v10, "appendString:", CFSTR(";type=pref"));
          objc_msgSend(v10, "appendString:", CFSTR(":"));
          objc_msgSend(v10, "appendString:", objc_msgSend(v30, "abVCardKoshify"));
          objc_msgSend(v10, "appendString:", CFSTR("\r\n"));
          self = v27;
          if (v22)
            -[ABVCardRecord appendLabel:toVCardRep:inGroup:](v27, "appendLabel:toVCardRep:inGroup:", v20, v10, v22);

          v14 = v25;
          v12 = v26;
          if (v18)
            CFRelease(v18);
        }
        ++v15;
      }
      while (v14 != v15);
    }
  }
  return v10;
}

- (id)propertyLineForInstantMessageHandles:(BOOL)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  uint64_t IdentifierAtIndex;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  __CFString *v18;
  ABVCardRecord *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  unint64_t v25;
  const void *v28;
  int PrimaryIdentifier;
  _BOOL4 v31;
  CFIndex v32;
  uint64_t v33;
  void *v34;
  void *v35;

  v31 = a5;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = kABPersonInstantMessageProperty;
  v8 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonInstantMessageProperty);
  if (v8)
  {
    v9 = v8;
    PrimaryIdentifier = ABCMultiValueGetPrimaryIdentifier((uint64_t)v8);
    Count = ABMultiValueGetCount(v9);
    if (Count)
    {
      v11 = Count;
      v12 = 0;
      v28 = v9;
      v32 = Count;
      while (1)
      {
        IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v9, v12);
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", v7, IdentifierAtIndex))
          break;
LABEL_36:
        if (++v12 == v11)
          return v6;
      }
      v14 = (void *)ABMultiValueCopyValueAtIndex(v9, v12);
      v15 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("service"));
      v35 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("username"));
      v33 = objc_msgSend(v14, "objectForKey:", CFSTR("teamIdentifier"));
      v16 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("bundleIdentifiers"));
      v34 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("identifier"));
      v17 = CFSTR("X-AIM");
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AIM")) & 1) == 0)
      {
        v17 = CFSTR("X-JABBER");
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Jabber")) & 1) == 0)
        {
          v17 = CFSTR("X-MSN");
          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MSN")) & 1) == 0)
          {
            v17 = CFSTR("X-YAHOO");
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Yahoo")) & 1) == 0)
            {
              v17 = CFSTR("X-ICQ");
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ICQ")) & 1) == 0)
              {
                if (objc_msgSend(v15, "length"))
                  goto LABEL_35;
                v17 = CFSTR("X-MS-IMADDRESS");
              }
            }
          }
        }
      }
      if (objc_msgSend(v35, "length"))
      {
        v18 = (__CFString *)ABMultiValueCopyLabelAtIndex(v9, v12);
        v19 = self;
        v20 = -[ABVCardRecord _vCardKeyForGenericLabel:](self, "_vCardKeyForGenericLabel:", v18);
        v21 = v20;
        if (!v18 || a3 || v20)
        {
          objc_msgSend(v6, "appendString:", v17);
          v22 = 0;
          v24 = 0;
          v23 = CFSTR(";type=");
          if (!v21)
          {
LABEL_19:
            self = v19;
            v9 = v28;
            if (v31)
            {
              if (v33)
              {
                objc_msgSend(v6, "appendString:", CFSTR(";x-teamidentifier="));
                objc_msgSend(v6, "appendString:", v33);
              }
              if (v16)
              {
                objc_msgSend(v6, "appendString:", CFSTR(";x-bundleidentifiers="));
                if (objc_msgSend(v16, "count"))
                {
                  v25 = 0;
                  do
                  {
                    if (v25)
                      objc_msgSend(v6, "appendString:", CFSTR(","));
                    objc_msgSend(v6, "appendString:", objc_msgSend(v16, "objectAtIndexedSubscript:", v25++));
                  }
                  while (v25 < objc_msgSend(v16, "count"));
                }
              }
              if (v34)
              {
                objc_msgSend(v6, "appendString:", CFSTR(";x-userid="));
                objc_msgSend(v6, "appendString:", objc_msgSend(v34, "abVCardKoshify"));
              }
            }
            if ((_DWORD)IdentifierAtIndex == PrimaryIdentifier)
              objc_msgSend(v6, "appendString:", CFSTR(";type=pref"));
            objc_msgSend(v6, "appendString:", CFSTR(":"));
            objc_msgSend(v6, "appendString:", objc_msgSend(v35, "abVCardKoshify"));
            objc_msgSend(v6, "appendString:", CFSTR("\r\n"));
            if (v24)
              -[ABVCardRecord appendLabel:toVCardRep:inGroup:](self, "appendLabel:toVCardRep:inGroup:", v18, v6, v24);

            v7 = kABPersonInstantMessageProperty;
            goto LABEL_35;
          }
        }
        else
        {
          v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item%ld"), (*a4)++);
          objc_msgSend(v6, "appendString:", v22);
          v23 = CFSTR(".");
          v21 = (__CFString *)v17;
        }
        objc_msgSend(v6, "appendString:", v23);
        objc_msgSend(v6, "appendString:", v21);
        v24 = v22;
        goto LABEL_19;
      }
LABEL_35:

      v11 = v32;
      goto LABEL_36;
    }
  }
  return v6;
}

- (id)propertyLineForIMPPProperty:(BOOL)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5
{
  void *v6;
  void *v7;
  const void *v8;
  CFIndex i;
  uint64_t IdentifierAtIndex;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v28;
  __CFString *v29;
  void *v30;
  void *v31;
  CFIndex Count;
  void *v33;

  v28 = a5;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string", a3);
  v7 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonInstantMessageProperty);
  if (v7)
  {
    v8 = v7;
    Count = ABMultiValueGetCount(v7);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v8, i);
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", kABPersonInstantMessageProperty, IdentifierAtIndex))
        {
          v11 = (void *)ABMultiValueCopyValueAtIndex(v8, i);
          v12 = objc_msgSend(v11, "objectForKey:", CFSTR("username"));
          v33 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("service"));
          v13 = objc_msgSend(v11, "objectForKey:", CFSTR("teamIdentifier"));
          v14 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("bundleIdentifiers"));
          v30 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("identifier"));

          v31 = (void *)v12;
          if (v12)
          {
            v15 = (__CFString *)ABMultiValueCopyLabelAtIndex(v8, i);
            v16 = -[ABVCardRecord _vCardKeyForGenericLabel:](self, "_vCardKeyForGenericLabel:", v15);
            v17 = 0;
            v29 = v16;
            if (v15 && !v16)
            {
              v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item%ld"), (*a4)++);
              v17 = v18;
              objc_msgSend(v6, "appendString:", v18);
              objc_msgSend(v6, "appendString:", CFSTR("."));
            }
            objc_msgSend(v6, "appendString:", CFSTR("IMPP"));
            if (v33)
              objc_msgSend(v6, "appendFormat:", CFSTR(";X-SERVICE-TYPE=%@"), v33);
            if (v28)
            {
              if (v13)
              {
                objc_msgSend(v6, "appendString:", CFSTR(";x-teamidentifier="));
                objc_msgSend(v6, "appendString:", v13);
              }
              if (v14)
              {
                objc_msgSend(v6, "appendString:", CFSTR(";x-bundleidentifiers="));
                if (objc_msgSend(v14, "count"))
                {
                  v19 = 0;
                  do
                  {
                    if (v19)
                      objc_msgSend(v6, "appendString:", CFSTR(","));
                    objc_msgSend(v6, "appendString:", objc_msgSend(v14, "objectAtIndexedSubscript:", v19++));
                  }
                  while (v19 < objc_msgSend(v14, "count"));
                }
              }
              if (v30)
              {
                objc_msgSend(v6, "appendString:", CFSTR(";x-userid="));
                objc_msgSend(v6, "appendString:", objc_msgSend(v30, "abVCardKoshify"));
              }
            }
            if (v29)
            {
              objc_msgSend(v6, "appendString:", CFSTR(";type="));
              objc_msgSend(v6, "appendString:", v29);
            }
            if ((_DWORD)IdentifierAtIndex == ABCMultiValueGetPrimaryIdentifier((uint64_t)v8))
              objc_msgSend(v6, "appendString:", CFSTR(";type=pref"));
            if (v33
              && (v20 = (void *)MEMORY[0x1E0C99D80],
                  v21 = v17,
                  v22 = (void *)MEMORY[0x1E0CB34D0],
                  v23 = objc_opt_class(),
                  v24 = v22,
                  v17 = v21,
                  (v25 = objc_msgSend((id)objc_msgSend(v20, "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend(v24, "bundleForClass:", v23), "pathForResource:ofType:", CFSTR("InstantMessageURLSchemes"), CFSTR("plist"))), "valueForKey:", objc_msgSend(v33, "lowercaseString"))) != 0))
            {
              objc_msgSend(v6, "appendFormat:", CFSTR(":%@"), v25);
            }
            else
            {
              objc_msgSend(v6, "appendString:", CFSTR(":x-apple"));
            }
            objc_msgSend(v6, "appendFormat:", CFSTR(":%@\r\n"), objc_msgSend((id)objc_msgSend(v31, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet")), "abVCardKoshify"));
            if (v17)
              -[ABVCardRecord appendLabel:toVCardRep:inGroup:](self, "appendLabel:toVCardRep:inGroup:", v15, v6, v17);

          }
        }
      }
    }
  }
  return v6;
}

- (id)propertyLineForGenericABProperty21:(unsigned int)a3 vCardProperty:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  const void *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  uint64_t IdentifierAtIndex;
  CFTypeRef v13;
  const void *v14;
  CFTypeRef v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  id v20;
  id v21;
  unsigned int v23;
  int PrimaryIdentifier;
  ABPropertyType PropertyType;
  uint64_t v27;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v27 = 0;
  v7 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", v4);
  if (v7)
  {
    v8 = v7;
    PropertyType = ABMultiValueGetPropertyType(v7);
    PrimaryIdentifier = ABCMultiValueGetPrimaryIdentifier((uint64_t)v8);
    Count = ABMultiValueGetCount(v8);
    if (Count)
    {
      v10 = Count;
      v11 = 0;
      v23 = v4;
      do
      {
        IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v8, v11);
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", v4, IdentifierAtIndex))
        {
          v13 = ABMultiValueCopyValueAtIndex(v8, v11);
          v14 = v13;
          if (PropertyType == 260)
            v15 = -[ABVCardRecord newISO8061StringFromDate:](self, "newISO8061StringFromDate:", v13);
          else
            v15 = CFRetain(v13);
          v16 = (void *)v15;
          v17 = (__CFString *)ABMultiValueCopyLabelAtIndex(v8, v11);
          v18 = -[ABVCardRecord _vCardKeyForGenericLabel:](self, "_vCardKeyForGenericLabel:", v17);
          objc_msgSend(v6, "abAppendString:", a4);
          if (v18)
          {
            objc_msgSend(v6, "abAppendString:", CFSTR(";type="));
            objc_msgSend(v6, "abAppendString:", v18);
          }
          if ((_DWORD)IdentifierAtIndex == PrimaryIdentifier)
            objc_msgSend(v6, "abAppendString:", CFSTR(";type=pref"));
          v19 = objc_msgSend(v16, "abVCardKoshify");
          v20 = -[ABVCardRecord encodedDataForValue:charsetName:](self, "encodedDataForValue:charsetName:", v19, &v27);
          if (v27)
          {
            v21 = v20;
            objc_msgSend(v6, "abAppendString:", CFSTR(";CHARSET="));
            objc_msgSend(v6, "abAppendString:", v27);
            objc_msgSend(v6, "abAppendString:", CFSTR(":"));
            objc_msgSend(v6, "appendData:", v21);
          }
          else
          {
            objc_msgSend(v6, "abAppendString:", CFSTR(":"));
            objc_msgSend(v6, "abAppendString:", v19);
          }
          v4 = v23;
          objc_msgSend(v6, "abAppendString:", CFSTR("\r\n"));

          if (v14)
            CFRelease(v14);
        }
        ++v11;
      }
      while (v10 != v11);
    }
  }
  return v6;
}

- (id)dataForSocialProfileProperty:(void *)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5
{
  void *v6;
  CFIndex i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v29;
  void *v30;
  CFIndex Count;
  void *v32;

  v29 = a5;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data", a3, a4);
  v32 = a3;
  if (a3)
  {
    Count = ABMultiValueGetCount(a3);
    if (Count)
    {
      for (i = 0; i != Count; ++i)
      {
        v8 = (void *)ABMultiValueCopyValueAtIndex(v32, i);
        v9 = objc_msgSend(v8, "objectForKey:", CFSTR("url"));
        v10 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("service"));
        v11 = objc_msgSend(v8, "objectForKey:", CFSTR("username"));
        v12 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("identifier"));
        v13 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("displayname"));
        v14 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("bundleIdentifiers"));
        v15 = objc_msgSend(v8, "objectForKey:", CFSTR("teamIdentifier"));
        if (v9 | v11)
        {
          v30 = (void *)v15;
          objc_msgSend(v6, "abAppendString:", CFSTR("X-SOCIALPROFILE"));
          v16 = v10;
          if (v10)
          {
            v17 = (void *)MEMORY[0x1E0CB3940];
            v25 = objc_msgSend(v16, "abVCardKoshify");
            v18 = v17;
            v10 = v16;
            objc_msgSend(v6, "abAppendString:", objc_msgSend(v18, "stringWithFormat:", CFSTR(";type=%@"), v25));
          }
          if (v11)
          {
            v19 = (void *)MEMORY[0x1E0CB3940];
            v26 = objc_msgSend((id)v11, "abVCardKoshify");
            v20 = v19;
            v10 = v16;
            objc_msgSend(v6, "abAppendString:", objc_msgSend(v20, "stringWithFormat:", CFSTR(";x-user=%@"), v26));
          }
          if (v12)
          {
            v21 = (void *)MEMORY[0x1E0CB3940];
            v27 = objc_msgSend(v12, "abVCardKoshify");
            v22 = v21;
            v10 = v16;
            objc_msgSend(v6, "abAppendString:", objc_msgSend(v22, "stringWithFormat:", CFSTR(";x-userid=%@"), v27));
          }
          if (v13)
            objc_msgSend(v6, "abAppendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(";x-displayname=%@"),
                objc_msgSend(v13, "abVCardKoshify")));
          if (v29)
          {
            if (v30)
              objc_msgSend(v6, "abAppendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(";x-teamidentifier=%@"),
                  objc_msgSend(v30, "abVCardKoshify")));
            if (v14)
            {
              objc_msgSend(v6, "abAppendString:", CFSTR(";x-bundleidentifiers="));
              if (objc_msgSend(v14, "count"))
              {
                v23 = 0;
                do
                {
                  if (v23)
                    objc_msgSend(v6, "abAppendString:", CFSTR(","));
                  objc_msgSend(v6, "abAppendString:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", v23++), "abVCardKoshify"));
                }
                while (v23 < objc_msgSend(v14, "count"));
              }
            }
          }
          if (!objc_msgSend((id)v9, "length"))
            v9 = socialProfileURLForServiceAndUsername(v10, (void *)v11);
          objc_msgSend(v6, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend((id)v9, "abVCardKoshify")));
        }

      }
    }
  }
  return v6;
}

- (id)propertyLineForIMHandles:(id)a3 labels:(id)a4 vCardProperty:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v19;

  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v19 = 0;
  v10 = objc_msgSend(a3, "count");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
    {
      v13 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      v14 = -[ABVCardRecord _vCardKeyForGenericLabel:](self, "_vCardKeyForGenericLabel:", objc_msgSend(a4, "objectAtIndex:", i));
      objc_msgSend(v9, "abAppendString:", a5);
      if (v14)
      {
        objc_msgSend(v9, "abAppendString:", CFSTR(";type="));
        objc_msgSend(v9, "abAppendString:", v14);
      }
      v15 = objc_msgSend(v13, "abVCardKoshify");
      v16 = -[ABVCardRecord encodedDataForValue:charsetName:](self, "encodedDataForValue:charsetName:", v15, &v19);
      if (v19)
      {
        v17 = v16;
        objc_msgSend(v9, "abAppendString:", CFSTR(";CHARSET="));
        objc_msgSend(v9, "abAppendString:", v19);
        objc_msgSend(v9, "abAppendString:", CFSTR(":"));
        objc_msgSend(v9, "appendData:", v17);
      }
      else
      {
        objc_msgSend(v9, "abAppendString:", CFSTR(":"));
        objc_msgSend(v9, "abAppendString:", v15);
      }
      objc_msgSend(v9, "abAppendString:", CFSTR("\r\n"));
    }
  }
  return v9;
}

- (id)dataForInstantMessageProperties
{
  void *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  const __CFString *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v2 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonInstantMessageProperty);
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v2)
  {
    Count = ABMultiValueGetCount(v2);
    if (Count >= 1)
    {
      v4 = Count;
      v5 = 0;
      v26 = CFSTR("ICQ");
      do
      {
        v6 = (void *)ABMultiValueCopyValueAtIndex(v2, v5);
        v7 = (__CFString *)ABMultiValueCopyLabelAtIndex(v2, v5);
        v8 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("service"));
        v10 = v36;
        v9 = v37;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AIM")) & 1) == 0)
        {
          v10 = v34;
          v9 = v35;
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Jabber")) & 1) == 0)
          {
            v10 = v32;
            v9 = v33;
            if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSN")) & 1) == 0)
            {
              v10 = v30;
              v9 = v31;
              if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Yahoo")) & 1) == 0)
              {
                v11 = objc_msgSend(v8, "isEqualToString:", v26);
                if (v11)
                  v9 = v29;
                else
                  v9 = 0;
                if (v11)
                  v10 = v28;
                else
                  v10 = 0;
              }
            }
          }
        }
        v12 = objc_msgSend(v6, "objectForKey:", CFSTR("username"), v26);
        if (v12)
        {
          objc_msgSend(v9, "addObject:", v12);
          if (v7)
            v13 = v7;
          else
            v13 = &stru_1E3CA4E68;
          objc_msgSend(v10, "addObject:", v13);
        }

        ++v5;
      }
      while (v4 != v5);
    }
  }
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v15 = -[ABVCardRecord propertyLineForIMHandles:labels:vCardProperty:](self, "propertyLineForIMHandles:labels:vCardProperty:", v37, v36, CFSTR("X-AIM"));
  if (v15)
  {
    v16 = v15;
    if (objc_msgSend(v15, "length"))
      objc_msgSend(v14, "appendData:", v16);
  }
  v17 = -[ABVCardRecord propertyLineForIMHandles:labels:vCardProperty:](self, "propertyLineForIMHandles:labels:vCardProperty:", v35, v34, CFSTR("X-JABBER"));
  if (v17)
  {
    v18 = v17;
    if (objc_msgSend(v17, "length"))
      objc_msgSend(v14, "appendData:", v18);
  }
  v19 = -[ABVCardRecord propertyLineForIMHandles:labels:vCardProperty:](self, "propertyLineForIMHandles:labels:vCardProperty:", v33, v32, CFSTR("X-MSN"));
  if (v19)
  {
    v20 = v19;
    if (objc_msgSend(v19, "length"))
      objc_msgSend(v14, "appendData:", v20);
  }
  v21 = -[ABVCardRecord propertyLineForIMHandles:labels:vCardProperty:](self, "propertyLineForIMHandles:labels:vCardProperty:", v31, v30, CFSTR("X-YAHOO"));
  if (v21)
  {
    v22 = v21;
    if (objc_msgSend(v21, "length"))
      objc_msgSend(v14, "appendData:", v22);
  }
  v23 = -[ABVCardRecord propertyLineForIMHandles:labels:vCardProperty:](self, "propertyLineForIMHandles:labels:vCardProperty:", v29, v28, CFSTR("X-ICQ"));
  if (v23)
  {
    v24 = v23;
    if (objc_msgSend(v23, "length"))
      objc_msgSend(v14, "appendData:", v24);
  }

  return v14;
}

- (id)_valueForPersonSounds:(void *)a3 identifier:(int)a4
{
  CFIndex IndexForIdentifier;
  void *v6;

  IndexForIdentifier = ABMultiValueGetIndexForIdentifier(a3, a4);
  if (IndexForIdentifier == -1)
    v6 = 0;
  else
    v6 = (void *)ABMultiValueCopyValueAtIndex(a3, IndexForIdentifier);
  return v6;
}

- (void)_addPersonSounds:(void *)a3 identifier:(int)a4 toActivityAlerts:(id *)a5 activity:(id)a6 alert:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = -[ABVCardRecord _valueForPersonSounds:identifier:](self, "_valueForPersonSounds:identifier:", a3, *(_QWORD *)&a4);
  if (v10)
  {
    v11 = v10;
    v12 = *a5;
    if (!*a5)
    {
      v12 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      *a5 = v12;
    }
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v12, "objectForKeyedSubscript:", a6));
    v17 = a7;
    v18[0] = v11;
    objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1));
    v14 = *a5;
    v15 = a6;
    v16 = v13;
    objc_msgSend(v14, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  }
}

- (id)_dictionaryForActivityAlerts
{
  id result;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v7 = 0;
  result = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonSoundProperty);
  if (result)
  {
    v4 = result;
    v5 = -[ABVCardRecord _valueForPersonSounds:identifier:](self, "_valueForPersonSounds:identifier:", result, 4294967293);
    if (v5)
    {
      v6 = objc_msgSend(v5, "dataUsingEncoding:", 4);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 1, 0);
    }
    -[ABVCardRecord _addPersonSounds:identifier:toActivityAlerts:activity:alert:](self, "_addPersonSounds:identifier:toActivityAlerts:activity:alert:", v4, 0xFFFFFFFFLL, &v7, CFSTR("com.apple.activityalert.call"), CFSTR("sound"));
    -[ABVCardRecord _addPersonSounds:identifier:toActivityAlerts:activity:alert:](self, "_addPersonSounds:identifier:toActivityAlerts:activity:alert:", v4, 4294967195, &v7, CFSTR("com.apple.activityalert.call"), CFSTR("vibration"));
    -[ABVCardRecord _addPersonSounds:identifier:toActivityAlerts:activity:alert:](self, "_addPersonSounds:identifier:toActivityAlerts:activity:alert:", v4, 4294967292, &v7, CFSTR("com.apple.activityalert.call"), CFSTR("ignoreMute"));
    -[ABVCardRecord _addPersonSounds:identifier:toActivityAlerts:activity:alert:](self, "_addPersonSounds:identifier:toActivityAlerts:activity:alert:", v4, 4294967294, &v7, CFSTR("com.apple.activityalert.text"), CFSTR("sound"));
    -[ABVCardRecord _addPersonSounds:identifier:toActivityAlerts:activity:alert:](self, "_addPersonSounds:identifier:toActivityAlerts:activity:alert:", v4, 4294967194, &v7, CFSTR("com.apple.activityalert.text"), CFSTR("vibration"));
    -[ABVCardRecord _addPersonSounds:identifier:toActivityAlerts:activity:alert:](self, "_addPersonSounds:identifier:toActivityAlerts:activity:alert:", v4, 4294967291, &v7, CFSTR("com.apple.activityalert.text"), CFSTR("ignoreMute"));
    return v7;
  }
  return result;
}

- (id)_typeParameterForToneType:(id)a3
{
  if (!objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("com.apple.activityalert.call")))
    return CFSTR("call");
  if (objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("com.apple.activityalert.text")))
    return a3;
  return CFSTR("text");
}

- (id)dataForSoundProperty:(void *)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data", a3);
  v5 = -[ABVCardRecord _dictionaryForActivityAlerts](self, "_dictionaryForActivityAlerts");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ABVCardRecord_dataForSoundProperty___block_invoke;
  v7[3] = &unk_1E3CA3EA8;
  v7[4] = v4;
  v7[5] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);
  return v4;
}

uint64_t __38__ABVCardRecord_dataForSoundProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "abAppendString:", CFSTR("X-ACTIVITY-ALERT:"));
    objc_msgSend(*(id *)(a1 + 32), "abAppendString:", +[ABVCardActivityAlertSerialization stringWithType:info:](ABVCardActivityAlertSerialization, "stringWithType:info:", objc_msgSend(*(id *)(a1 + 40), "_typeParameterForToneType:", a2), a3));
    return objc_msgSend(*(id *)(a1 + 32), "abAppendString:", CFSTR("\r\n"));
  }
  return result;
}

- (id)encodedLineForValue:(id)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  CFStringEncoding v8;
  CFDataRef ExternalRepresentation;
  CFTypeRef v10;
  void *v11;
  uint64_t v12;
  int v14;
  id v15;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  if ((objc_msgSend(a3, "canBeConvertedToEncoding:", 1) & 1) != 0)
  {
    v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(":"));
    -[__CFString appendString:](v5, "appendString:", a3);
    -[__CFString appendString:](v5, "appendString:", CFSTR("\r\n"));
    v6 = v5;
LABEL_6:
    v12 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v4, "appendData:", objc_msgSend(CFSTR(";CHARSET="), "dataUsingEncoding:", 1));
  v7 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("AB21vCardEncoding"), CFSTR("com.apple.AddressBook"));
  if (v7)
  {
    v5 = (__CFString *)v7;
    v8 = CFStringConvertIANACharSetNameToEncoding(v7);
    ExternalRepresentation = CFStringCreateExternalRepresentation(0, (CFStringRef)a3, v8, 0);
    v10 = CFMakeCollectable(ExternalRepresentation);
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v4, "appendData:", -[__CFString dataUsingEncoding:](v5, "dataUsingEncoding:", 1));
      objc_msgSend(v4, "appendData:", objc_msgSend(CFSTR(":"), "dataUsingEncoding:", 1));
      objc_msgSend(v4, "appendData:", v11);

      v6 = CFSTR("\r\n");
      goto LABEL_6;
    }

  }
  if (objc_msgSend(a3, "canBeConvertedToEncoding:", 5))
  {
    v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("LATIN1:"));
    -[__CFString appendString:](v5, "appendString:", a3);
    -[__CFString appendString:](v5, "appendString:", CFSTR("\r\n"));
    v6 = v5;
    v12 = 5;
  }
  else
  {
    v14 = objc_msgSend(a3, "canBeConvertedToEncoding:", 30);
    v15 = objc_alloc(MEMORY[0x1E0CB37A0]);
    if (v14)
    {
      v5 = (__CFString *)objc_msgSend(v15, "initWithString:", CFSTR("MACINTOSH:"));
      -[__CFString appendString:](v5, "appendString:", a3);
      -[__CFString appendString:](v5, "appendString:", CFSTR("\r\n"));
      v6 = v5;
      v12 = 30;
    }
    else
    {
      v5 = (__CFString *)objc_msgSend(v15, "initWithString:", CFSTR("UTF-8:"));
      -[__CFString appendString:](v5, "appendString:", a3);
      -[__CFString appendString:](v5, "appendString:", CFSTR("\r\n"));
      v6 = v5;
      v12 = 4;
    }
  }
LABEL_7:
  objc_msgSend(v4, "appendData:", -[__CFString dataUsingEncoding:](v6, "dataUsingEncoding:", v12));

  return v4;
}

- (id)encodedDataForValue:(id)a3 charsetName:(id *)a4
{
  id v6;
  uint64_t v7;
  __CFString *v8;
  CFStringEncoding v9;
  CFDataRef ExternalRepresentation;
  void *v11;

  if ((objc_msgSend(a3, "canBeConvertedToEncoding:", 1) & 1) != 0)
  {
    *a4 = 0;
    v6 = a3;
    v7 = 1;
  }
  else
  {
    v8 = (id)CFPreferencesCopyAppValue(CFSTR("AB21vCardEncoding"), CFSTR("com.apple.AddressBook"));
    if (objc_msgSend(a3, "canBeConvertedToEncoding:", 5))
    {
      *a4 = CFSTR("LATIN1");
      v6 = a3;
      v7 = 5;
    }
    else
    {
      if (v8)
      {
        v9 = CFStringConvertIANACharSetNameToEncoding(v8);
        ExternalRepresentation = CFStringCreateExternalRepresentation(0, (CFStringRef)a3, v9, 0);
        v11 = (void *)CFMakeCollectable(ExternalRepresentation);
        if (v11)
        {
          *a4 = v8;
          return v11;
        }
      }
      if (objc_msgSend(a3, "canBeConvertedToEncoding:", 30))
      {
        *a4 = CFSTR("MACINTOSH");
        v6 = a3;
        v7 = 30;
      }
      else
      {
        *a4 = CFSTR("UTF-8");
        v6 = a3;
        v7 = 4;
      }
    }
  }
  return (id)objc_msgSend(v6, "dataUsingEncoding:", v7);
}

- (id)_fullNameIncludingAuxiliaryElements:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int CompositeNameFormatAndDelimiterForRecord;
  const __CFString *v22;
  uint64_t v24;
  CFStringRef v25;

  v3 = a3;
  v5 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonFirstNameProperty);
  v6 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonLastNameProperty);
  v7 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMiddleNameProperty);
  if (v3)
    v8 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonPrefixProperty);
  else
    v8 = 0;
  v9 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonSuffixProperty);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (v5)
    v11 = v5;
  else
    v11 = &stru_1E3CA4E68;
  if (v6)
    v12 = v6;
  else
    v12 = &stru_1E3CA4E68;
  if (v7)
    v13 = v7;
  else
    v13 = &stru_1E3CA4E68;
  if (v8)
    v14 = v8;
  else
    v14 = &stru_1E3CA4E68;
  if (v9)
    v15 = v9;
  else
    v15 = &stru_1E3CA4E68;
  v16 = -[__CFString length](v11, "length");
  v17 = -[__CFString length](v12, "length");
  v24 = -[__CFString length](v13, "length");
  v18 = -[__CFString length](v14, "length");
  v19 = -[__CFString length](v15, "length");
  if (v16)
  {
    if (!v17)
      return v11;
    v20 = v19;
    v25 = 0;
    CompositeNameFormatAndDelimiterForRecord = ABPersonGetCompositeNameFormatAndDelimiterForRecord(self->_record, &v25);
    if (v25)
      v22 = v25;
    else
      v22 = CFSTR(" ");
    if (CompositeNameFormatAndDelimiterForRecord == 1)
    {
      if (v18)
      {
        objc_msgSend(v10, "appendString:", v14);
        objc_msgSend(v10, "appendString:", v22);
      }
      objc_msgSend(v10, "appendString:", v12);
      objc_msgSend(v10, "appendString:", v22);
      objc_msgSend(v10, "appendString:", v11);
      if (v20)
      {
        objc_msgSend(v10, "appendString:", v22);
        objc_msgSend(v10, "appendString:", v15);
      }
      if (!v24)
        return v10;
LABEL_40:
      objc_msgSend(v10, "appendString:", v22);
      objc_msgSend(v10, "appendString:", v13);
      return v10;
    }
    if (v18)
    {
      objc_msgSend(v10, "appendString:", v14);
      objc_msgSend(v10, "appendString:", v22);
    }
    objc_msgSend(v10, "appendString:", v11);
    objc_msgSend(v10, "appendString:", v22);
    if (v24)
    {
      objc_msgSend(v10, "appendString:", v13);
      objc_msgSend(v10, "appendString:", v22);
    }
    objc_msgSend(v10, "appendString:", v12);
    v13 = v15;
    if (v20)
      goto LABEL_40;
  }
  else if (v17)
  {
    return v12;
  }
  return v10;
}

- (BOOL)_isCompany
{
  void *v2;

  v2 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonKindProperty);
  if (v2)
    LOBYTE(v2) = CFEqual(v2, kABPersonKindOrganization) != 0;
  return (char)v2;
}

- (id)_fullName
{
  return -[ABVCardRecord _fullNameIncludingAuxiliaryElements:](self, "_fullNameIncludingAuxiliaryElements:", 1);
}

- (id)alternateName
{
  id result;
  void *v4;
  const void *v5;

  result = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonNicknameProperty);
  if (!result)
  {
    result = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonOrganizationProperty);
    if (!result)
    {
      v4 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonEmailProperty);
      if (v4 && (v5 = v4, ABMultiValueGetCount(v4)))
        return (id)(id)ABMultiValueCopyValueAtIndex(v5, 0);
      else
        return &stru_1E3CA4E68;
    }
  }
  return result;
}

- (id)_realCompositeName
{
  void *v3;
  id v4;
  id v5;

  if (-[ABVCardRecord _isCompany](self, "_isCompany"))
  {
    v3 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonOrganizationProperty);
    if (v3)
    {
      v4 = v3;
      if (objc_msgSend(v3, "length"))
        goto LABEL_8;
    }
    v5 = -[ABVCardRecord _fullName](self, "_fullName");
LABEL_6:
    v4 = v5;
    if (objc_msgSend(v5, "length"))
      goto LABEL_8;
    goto LABEL_7;
  }
  v5 = -[ABVCardRecord _fullNameIncludingAuxiliaryElements:](self, "_fullNameIncludingAuxiliaryElements:", 1);
  if (v5)
    goto LABEL_6;
LABEL_7:
  v4 = -[ABVCardRecord alternateName](self, "alternateName");
LABEL_8:
  if (v4)
    return v4;
  else
    return &stru_1E3CA4E68;
}

- (id)sharedPhotoDisplayPreferenceStringValue
{
  return (id)qword_1E3CA3EE8[objc_msgSend(-[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonDisplayFlagsProperty), "integerValue") >> 6];
}

- (id)_21vCardRepresentationAsData
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const void *v37;
  CFIndex Count;
  CFIndex i;
  void *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  const void *v44;
  CFIndex j;
  void *v46;
  __CFString *v47;
  id v48;
  uint64_t v49;
  uint64_t k;
  uint64_t v51;
  void *v52;
  const void *v53;
  CFIndex v54;
  CFIndex m;
  void *v56;
  __CFString *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  CFIndex v83;
  void *v84;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v84 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v2, "abAppendString:", CFSTR("BEGIN:VCARD"));
  objc_msgSend(v2, "abAppendString:", CFSTR("\r\n"));
  objc_msgSend(v2, "abAppendString:", CFSTR("VERSION:2.1"));
  objc_msgSend(v2, "abAppendString:", CFSTR("\r\n"));
  v3 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonLastNameProperty);
  if (!v3)
    v3 = &stru_1E3CA4E68;
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v3, "abVCardKoshify"));
  v4 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonFirstNameProperty);
  if (!v4)
    v4 = &stru_1E3CA4E68;
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v4, "abVCardKoshify"));
  v5 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMiddleNameProperty);
  if (!v5)
    v5 = &stru_1E3CA4E68;
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v5, "abVCardKoshify"));
  v6 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABCPrefixProperty);
  if (!v6)
    v6 = &stru_1E3CA4E68;
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v6, "abVCardKoshify"));
  v7 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABCSuffixProperty);
  if (!v7)
    v7 = &stru_1E3CA4E68;
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v7, "abVCardKoshify"));
  objc_msgSend(v2, "abAppendString:", CFSTR("N"));
  objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v84, "componentsJoinedByString:", CFSTR(";"))));
  objc_msgSend(v84, "removeAllObjects");
  v8 = -[ABVCardRecord _realCompositeName](self, "_realCompositeName");
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("FN"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v8, "abVCardKoshify")));
  }
  v9 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonNicknameProperty);
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("NICKNAME"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v10, "abVCardKoshify")));
  }
  v11 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonPreviousFamilyNameProperty);
  v12 = v11;
  if (v11 && (objc_msgSend(v11, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-MAIDENNAME"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v12, "abVCardKoshify")));
  }
  v13 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonFirstNamePhoneticProperty);
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-PHONETIC-FIRST-NAME"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v14, "abVCardKoshify")));
  }
  v15 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonFirstNamePronunciationProperty);
  v16 = v15;
  if (v15 && (objc_msgSend(v15, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-PRONUNCIATION-FIRST-NAME"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v16, "abVCardKoshify")));
  }
  v17 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMiddleNamePhoneticProperty);
  v18 = v17;
  if (v17 && (objc_msgSend(v17, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-PHONETIC-MIDDLE-NAME"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v18, "abVCardKoshify")));
  }
  v19 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMiddleNamePronunciationProperty);
  v20 = v19;
  if (v19 && (objc_msgSend(v19, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-PRONUNCIATION-MIDDLE-NAME"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v20, "abVCardKoshify")));
  }
  v21 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonLastNamePhoneticProperty);
  v22 = v21;
  if (v21 && (objc_msgSend(v21, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-PHONETIC-LAST-NAME"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v22, "abVCardKoshify")));
  }
  v23 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonLastNamePronunciationProperty);
  v24 = v23;
  if (v23 && (objc_msgSend(v23, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-PRONUNCIATION-LAST-NAME"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v24, "abVCardKoshify")));
  }
  v25 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonOrganizationProperty);
  v26 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonDepartmentProperty);
  if (v25 | v26
    && (!objc_msgSend((id)v25, "isEqualToString:", &stru_1E3CA4E68)
     || (objc_msgSend((id)v26, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0))
  {
    v27 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (objc_msgSend((id)v25, "length"))
      v28 = (const __CFString *)objc_msgSend((id)v25, "abVCardKoshify");
    else
      v28 = &stru_1E3CA4E68;
    objc_msgSend(v27, "appendString:", v28);
    objc_msgSend(v27, "appendString:", CFSTR(";"));
    if (objc_msgSend((id)v26, "length"))
      v29 = (const __CFString *)objc_msgSend((id)v26, "abVCardKoshify");
    else
      v29 = &stru_1E3CA4E68;
    objc_msgSend(v27, "appendString:", v29);
    objc_msgSend(v2, "abAppendString:", CFSTR("ORG"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", v27));

  }
  v30 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonOrganizationPhoneticProperty);
  v31 = v30;
  if (v30 && (objc_msgSend(v30, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-PHONETIC-ORG"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v31, "abVCardKoshify")));
  }
  v32 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonOrganizationPronunciationProperty);
  v33 = v32;
  if (v32 && (objc_msgSend(v32, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-PRONUNCIATION-ORG"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v33, "abVCardKoshify")));
  }
  v34 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonJobTitleProperty);
  v35 = v34;
  if (v34 && (objc_msgSend(v34, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("TITLE"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v35, "abVCardKoshify")));
  }
  v36 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonEmailProperty);
  v37 = v36;
  if (v36)
  {
    Count = ABMultiValueGetCount(v36);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", kABPersonEmailProperty, ABMultiValueGetIdentifierAtIndex(v37, i)))
        {
          v40 = (void *)ABMultiValueCopyValueAtIndex(v37, i);
          v41 = (__CFString *)ABMultiValueCopyLabelAtIndex(v37, i);
          objc_msgSend(v2, "abAppendString:", CFSTR("EMAIL;INTERNET"));
          v42 = -[ABVCardRecord _vCardKeyForEmailLabel:](self, "_vCardKeyForEmailLabel:", v41);
          if (v42)
          {
            objc_msgSend(v2, "abAppendString:", CFSTR(";"));
            objc_msgSend(v2, "abAppendString:", v42);
          }
          objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v40, "abVCardKoshify")));

        }
      }
    }
  }
  v43 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:");
  v44 = v43;
  if (v43)
  {
    v83 = ABMultiValueGetCount(v43);
    if (v83 >= 1)
    {
      for (j = 0; j != v83; ++j)
      {
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", kABPersonPhoneProperty, ABMultiValueGetIdentifierAtIndex(v44, j)))
        {
          v46 = (void *)ABMultiValueCopyValueAtIndex(v44, j);
          v47 = (__CFString *)ABMultiValueCopyLabelAtIndex(v44, j);
          objc_msgSend(v2, "abAppendString:", CFSTR("TEL"));
          v48 = -[ABVCardRecord _vCardKeysForPhoneLabel:](self, "_vCardKeysForPhoneLabel:", v47);
          v49 = objc_msgSend(v48, "count");
          if (v49 >= 1)
          {
            for (k = 0; k != v49; ++k)
            {
              v51 = objc_msgSend(v48, "objectAtIndex:", k);
              objc_msgSend(v2, "abAppendString:", CFSTR(";"));
              objc_msgSend(v2, "abAppendString:", v51);
            }
          }
          objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v46, "abVCardKoshify")));

        }
      }
    }
  }
  v52 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonAddressProperty);
  v53 = v52;
  if (v52)
  {
    v54 = ABMultiValueGetCount(v52);
    if (v54 >= 1)
    {
      for (m = 0; m != v54; ++m)
      {
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", kABPersonAddressProperty, ABMultiValueGetIdentifierAtIndex(v53, m)))
        {
          v56 = (void *)ABMultiValueCopyValueAtIndex(v53, m);
          v57 = (__CFString *)ABMultiValueCopyLabelAtIndex(v53, m);
          objc_msgSend(v2, "abAppendString:", CFSTR("ADR"));
          v58 = -[ABVCardRecord _vCardKeyForAddressLabel:vCard3:](self, "_vCardKeyForAddressLabel:vCard3:", v57, 0);
          if (v58)
          {
            objc_msgSend(v2, "abAppendString:", CFSTR(";"));
            objc_msgSend(v2, "abAppendString:", v58);
          }
          objc_msgSend(v84, "addObject:", &stru_1E3CA4E68);
          v59 = (void *)objc_msgSend(v56, "objectForKey:", CFSTR("Street"));
          v60 = v59;
          if (v59)
          {
            v61 = objc_msgSend(v59, "rangeOfString:", CFSTR("\r"));
            if (v62)
            {
              v63 = v61;
              objc_msgSend(v84, "addObject:", objc_msgSend((id)objc_msgSend(v60, "substringToIndex:", v61), "abVCardKoshify"));
              v64 = objc_msgSend((id)objc_msgSend(v60, "substringFromIndex:", v63 + 1), "abVCardKoshify");
            }
            else
            {
              objc_msgSend(v84, "addObject:", &stru_1E3CA4E68);
              v64 = objc_msgSend(v60, "abVCardKoshify");
            }
            objc_msgSend(v84, "addObject:", v64);
          }
          else
          {
            objc_msgSend(v84, "addObject:", &stru_1E3CA4E68);
            objc_msgSend(v84, "addObject:", &stru_1E3CA4E68);
          }
          v65 = (__CFString *)objc_msgSend(v56, "objectForKey:", CFSTR("City"));
          if (!v65)
            v65 = &stru_1E3CA4E68;
          objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v65, "abVCardKoshify"));
          v66 = (__CFString *)objc_msgSend(v56, "objectForKey:", CFSTR("State"));
          if (!v66)
            v66 = &stru_1E3CA4E68;
          objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v66, "abVCardKoshify"));
          v67 = (__CFString *)objc_msgSend(v56, "objectForKey:", CFSTR("ZIP"));
          if (!v67)
            v67 = &stru_1E3CA4E68;
          objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v67, "abVCardKoshify"));
          v68 = (__CFString *)objc_msgSend(v56, "objectForKey:", CFSTR("Country"));
          if (!v68)
            v68 = &stru_1E3CA4E68;
          objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v68, "abVCardKoshify"));
          objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v84, "componentsJoinedByString:", CFSTR(";"))));
          objc_msgSend(v84, "removeAllObjects");

        }
      }
    }
  }
  v69 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonNoteProperty);
  v70 = v69;
  if (v69
    && (objc_msgSend(v69, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0
    && objc_msgSend((id)objc_opt_class(), "includeNotesInVCards"))
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("NOTE"));
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v70, "abVCardKoshify")));
  }
  v71 = -[ABVCardRecord propertyLineForGenericABProperty21:vCardProperty:](self, "propertyLineForGenericABProperty21:vCardProperty:", kABPersonURLProperty, CFSTR("URL"));
  v72 = v71;
  if (v71 && objc_msgSend(v71, "length"))
    objc_msgSend(v2, "appendData:", v72);
  v73 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonBirthdayProperty);
  if (v73 && -[ABVCardRecord _showField:](self, "_showField:", kABPersonBirthdayProperty))
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("BDAY;"));
    objc_msgSend(v2, "abAppendString:", CFSTR("value=date:"));
    objc_msgSend(v2, "abAppendString:", -[ABVCardRecord ISO8061StringFromDate:](self, "ISO8061StringFromDate:", v73));
    objc_msgSend(v2, "abAppendString:", CFSTR("\r\n"));
  }
  v74 = -[ABVCardRecord dataForInstantMessageProperties](self, "dataForInstantMessageProperties");
  v75 = v74;
  if (v74 && objc_msgSend(v74, "length"))
    objc_msgSend(v2, "appendData:", v75);
  v76 = -[ABVCardRecord dataForSocialProfileProperty:groupCount:includePrivateData:](self, "dataForSocialProfileProperty:groupCount:includePrivateData:", -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonSocialProfileProperty), 0, 0);
  v77 = v76;
  if (v76 && objc_msgSend(v76, "length"))
    objc_msgSend(v2, "appendData:", v77);
  v78 = -[ABVCardRecord propertyLineForGenericABProperty21:vCardProperty:](self, "propertyLineForGenericABProperty21:vCardProperty:", kABPersonRelatedNamesProperty, CFSTR("X-ABRELATEDNAMES"));
  v79 = v78;
  if (v78 && objc_msgSend(v78, "length"))
    objc_msgSend(v2, "appendData:", v79);
  v80 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonModificationDateProperty);
  if (v80 && objc_msgSend((id)objc_opt_class(), "includeREVInVCards"))
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("REV:"));
    objc_msgSend(v2, "abAppendString:", -[ABVCardRecord ISO8061StringFromDateTime:](self, "ISO8061StringFromDateTime:", v80));
    objc_msgSend(v2, "abAppendString:", CFSTR("\r\n"));
  }
  v81 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonAlternateBirthdayProperty);
  if (objc_msgSend(v81, "count")
    && -[ABVCardRecord _showField:](self, "_showField:", kABPersonAlternateBirthdayProperty))
  {
    objc_msgSend(v2, "abAppendString:", CFSTR("X-ALTBDAY;"));
    objc_msgSend(v2, "abAppendString:", -[ABVCardRecord stringFromAlternateBirthday:](self, "stringFromAlternateBirthday:", v81));
    objc_msgSend(v2, "abAppendString:", CFSTR("\r\n"));
  }
  objc_msgSend(v2, "abAppendString:", CFSTR("END:VCARD"));
  objc_msgSend(v2, "abAppendString:", CFSTR("\r\n"));
  return v2;
}

- (BOOL)useThumbnailImageFormatIfAvailable
{
  return 1;
}

- (id)imageData
{
  CFDataRef v3;

  if (ABPersonHasImageData(self->_record))
  {
    if (!-[ABVCardRecord useThumbnailImageFormatIfAvailable](self, "useThumbnailImageFormatIfAvailable")
      || (v3 = ABPersonCopyImageDataWithFormat(self->_record, kABPersonImageFormatThumbnail)) == 0)
    {
      v3 = ABPersonCopyImageDataWithFormat(self->_record, kABPersonImageFormatOriginalSize);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_prodID
{
  if (_prodID_onceToken != -1)
    dispatch_once(&_prodID_onceToken, &__block_literal_global_289);
  return (id)_prodID__sProdID;
}

void __24__ABVCardRecord__prodID__block_invoke()
{
  uint64_t v0;
  id v1;
  id v2;

  v0 = _CFCopyServerVersionDictionary();
  if (!v0)
    v0 = _CFCopySystemVersionDictionary();
  v2 = (id)v0;
  v1 = objc_alloc(MEMORY[0x1E0CB3940]);
  _prodID__sProdID = objc_msgSend(v1, "initWithFormat:", CFSTR("-//Apple Inc.//iOS %@//EN"), objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C9ABB0]));

}

- (BOOL)_usesArrayForExternalPropKey:(id)a3
{
  return objc_msgSend(a3, "compare:options:", CFSTR("CATEGORIES"), 1) == 0;
}

- (void)_appendPropValue:(id)a3 forPropKey:(id)a4 toOutString:(id)a5 usingDelimiter:(id)a6 inGroup:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a7)
  {
    objc_msgSend(a5, "appendString:", a7);
    objc_msgSend(a5, "appendString:", CFSTR("."));
  }
  objc_msgSend(a5, "appendString:", a4);
  objc_msgSend(a5, "appendString:", CFSTR(":"));
  if (-[ABVCardRecord _usesArrayForExternalPropKey:](self, "_usesArrayForExternalPropKey:", a4))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      v15 = 1;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(a3);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((v15 & 1) == 0)
            objc_msgSend(a5, "appendString:", CFSTR(","));
          objc_msgSend(a5, "appendString:", objc_msgSend(v17, "abVCardKoshify"));
          v15 = 0;
        }
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v15 = 0;
      }
      while (v13);
    }
  }
  else
  {
    objc_msgSend(a5, "appendString:", objc_msgSend(a3, "abVCardKoshify"));
  }
  objc_msgSend(a5, "appendString:", a6);
}

- (id)_copyVCardRepresentationAsStringIncludeExternalProperties:(BOOL)a3 withPhoto:(id)a4 extraPhotoParameters:(id)a5 includePrivateData:(BOOL)a6 includeWallpaper:(BOOL)a7
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CFIndex Count;
  CFIndex i;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  const __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const void *v47;
  CFIndex v48;
  CFIndex j;
  uint64_t IdentifierAtIndex;
  void *v51;
  __CFString *v52;
  __CFString *v53;
  uint64_t v54;
  void *v55;
  const void *v56;
  CFIndex k;
  const void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t m;
  uint64_t v63;
  void *v64;
  const void *v65;
  CFIndex n;
  uint64_t v67;
  void *v68;
  __CFString *v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __CFString *v79;
  __CFString *v80;
  __CFString *v81;
  __CFString *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  int v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  const __CFData *v97;
  const __CFData *v98;
  CGImageSource *v99;
  CGImageSource *v100;
  const __CFString *Type;
  const __CFString *v102;
  BOOL v103;
  const __CFString *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  CGImageRef ImageAtIndex;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  int v119;
  int v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  void *v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t ii;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t jj;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  const __CFString *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  uint64_t v171;
  _BOOL4 v174;
  _BOOL4 v175;
  _BOOL4 v176;
  int PrimaryIdentifier;
  CFIndex v178;
  void *v179;
  int v180;
  int obj;
  id obja;
  id objb;
  id objc;
  __CFString *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  uint64_t v197;
  uint64_t v198;
  _BYTE v199[128];
  _BYTE v200[128];
  uint64_t v201;

  v175 = a7;
  v176 = a6;
  v174 = a3;
  v201 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v198 = 1;
  v187 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v8, "appendString:", CFSTR("BEGIN:VCARD"));
  objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  objc_msgSend(v8, "appendString:", CFSTR("VERSION:3.0"));
  objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  objc_msgSend(v8, "appendString:", CFSTR("PRODID:"));
  objc_msgSend(v8, "appendString:", -[ABVCardRecord _prodID](self, "_prodID"));
  objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  v9 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonLastNameProperty);
  if (!v9)
    v9 = &stru_1E3CA4E68;
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v9, "abVCardKoshify"));
  v10 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonFirstNameProperty);
  if (!v10)
    v10 = &stru_1E3CA4E68;
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v10, "abVCardKoshify"));
  v11 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMiddleNameProperty);
  if (!v11)
    v11 = &stru_1E3CA4E68;
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v11, "abVCardKoshify"));
  v12 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonPrefixProperty);
  if (!v12)
    v12 = &stru_1E3CA4E68;
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v12, "abVCardKoshify"));
  v13 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonSuffixProperty);
  if (!v13)
    v13 = &stru_1E3CA4E68;
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v13, "abVCardKoshify"));
  objc_msgSend(v8, "appendString:", CFSTR("N:"));
  objc_msgSend(v8, "appendString:", objc_msgSend(v187, "componentsJoinedByString:", CFSTR(";")));
  objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  objc_msgSend(v187, "removeAllObjects");
  v14 = -[ABVCardRecord _realCompositeName](self, "_realCompositeName");
  objc_msgSend(v8, "appendString:", CFSTR("FN:"));
  if (v14)
    v15 = v14;
  else
    v15 = &stru_1E3CA4E68;
  objc_msgSend(v8, "appendString:", -[__CFString abVCardKoshify](v15, "abVCardKoshify"));
  objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  v16 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonNicknameProperty);
  v17 = v16;
  if (v16 && (objc_msgSend(v16, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("NICKNAME:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v17, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v18 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonPreviousFamilyNameProperty);
  v19 = v18;
  if (v18 && (objc_msgSend(v18, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-MAIDENNAME:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v19, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v20 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonFirstNamePhoneticProperty);
  v21 = v20;
  if (v20 && (objc_msgSend(v20, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-PHONETIC-FIRST-NAME:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v21, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v22 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonFirstNamePronunciationProperty);
  v23 = v22;
  if (v22 && (objc_msgSend(v22, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-PRONUNCIATION-FIRST-NAME:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v23, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v24 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMiddleNamePhoneticProperty);
  v25 = v24;
  if (v24 && (objc_msgSend(v24, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-PHONETIC-MIDDLE-NAME:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v25, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v26 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMiddleNamePronunciationProperty);
  v27 = v26;
  if (v26 && (objc_msgSend(v26, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-PRONUNCIATION-MIDDLE-NAME:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v27, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v28 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonLastNamePhoneticProperty);
  v29 = v28;
  if (v28 && (objc_msgSend(v28, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-PHONETIC-LAST-NAME:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v29, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v30 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonLastNamePronunciationProperty);
  v31 = v30;
  if (v30 && (objc_msgSend(v30, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-PRONUNCIATION-LAST-NAME:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v31, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v32 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonAddressingGrammarProperty);
  if (v32)
  {
    if (objc_msgSend((id)objc_opt_class(), "includeAddressingGrammarInVCards"))
    {
      Count = ABMultiValueGetCount(v32);
      if (Count)
      {
        for (i = 0; i != Count; ++i)
        {
          v35 = (void *)ABMultiValueCopyValueAtIndex(v32, i);
          v171 = v198++;
          objc_msgSend(v8, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item%ld")));
          objc_msgSend(v8, "appendString:", CFSTR(".X-ADDRESSING-GRAMMAR:"));
          objc_msgSend(v8, "appendString:", objc_msgSend(v35, "abVCardKoshify"));
          objc_msgSend(v8, "appendString:", CFSTR("\r\n"));

        }
      }
    }
  }
  v36 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonOrganizationProperty);
  v37 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonDepartmentProperty);
  if (v36 | v37
    && (!objc_msgSend((id)v36, "isEqualToString:", &stru_1E3CA4E68)
     || (objc_msgSend((id)v37, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0))
  {
    objc_msgSend(v8, "appendString:", CFSTR("ORG:"));
    if (objc_msgSend((id)v36, "length"))
      v38 = (const __CFString *)objc_msgSend((id)v36, "abVCardKoshify");
    else
      v38 = &stru_1E3CA4E68;
    objc_msgSend(v8, "appendString:", v38);
    objc_msgSend(v8, "appendString:", CFSTR(";"));
    if (objc_msgSend((id)v37, "length"))
      v39 = (const __CFString *)objc_msgSend((id)v37, "abVCardKoshify");
    else
      v39 = &stru_1E3CA4E68;
    objc_msgSend(v8, "appendString:", v39);
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v40 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonOrganizationPhoneticProperty);
  v41 = v40;
  if (v40 && (objc_msgSend(v40, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-PHONETIC-ORG:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v41, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v42 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonOrganizationPronunciationProperty);
  v43 = v42;
  if (v42 && (objc_msgSend(v42, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-PRONUNCIATION-ORG:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v43, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v44 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonJobTitleProperty);
  v45 = v44;
  if (v44 && (objc_msgSend(v44, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
  {
    objc_msgSend(v8, "appendString:", CFSTR("TITLE:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v45, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v46 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:");
  v47 = v46;
  if (v46)
  {
    obj = ABCMultiValueGetPrimaryIdentifier((uint64_t)v46);
    v48 = ABMultiValueGetCount(v47);
    if (v48)
    {
      for (j = 0; j != v48; ++j)
      {
        IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v47, j);
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", kABPersonEmailProperty, IdentifierAtIndex))
        {
          v51 = (void *)ABMultiValueCopyValueAtIndex(v47, j);
          v52 = (__CFString *)ABMultiValueCopyLabelAtIndex(v47, j);
          v53 = -[ABVCardRecord _vCardKeyForEmailLabel:](self, "_vCardKeyForEmailLabel:", v52);
          if (v53)
          {
            v54 = 0;
          }
          else
          {
            v171 = v198;
            v54 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item%ld"));
            ++v198;
            objc_msgSend(v8, "appendString:", v54);
            objc_msgSend(v8, "appendString:", CFSTR("."));
          }
          objc_msgSend(v8, "appendString:", CFSTR("EMAIL;type=INTERNET"));
          if (v53)
          {
            objc_msgSend(v8, "appendString:", CFSTR(";type="));
            objc_msgSend(v8, "appendString:", v53);
          }
          if ((_DWORD)IdentifierAtIndex == obj)
            objc_msgSend(v8, "appendString:", CFSTR(";type=pref"));
          objc_msgSend(v8, "appendString:", CFSTR(":"));
          objc_msgSend(v8, "appendString:", objc_msgSend(v51, "abVCardKoshify"));
          objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
          if (v54)
            -[ABVCardRecord appendLabel:toVCardRep:inGroup:](self, "appendLabel:toVCardRep:inGroup:", v52, v8, v54);

        }
      }
    }
  }
  v55 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:");
  v56 = v55;
  if (v55)
  {
    PrimaryIdentifier = ABCMultiValueGetPrimaryIdentifier((uint64_t)v55);
    v178 = ABMultiValueGetCount(v56);
    if (v178)
    {
      for (k = 0; k != v178; ++k)
      {
        v58 = v56;
        v59 = ABMultiValueGetIdentifierAtIndex(v56, k);
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", kABPersonPhoneProperty, v59))
        {
          v179 = (void *)ABMultiValueCopyValueAtIndex(v56, k);
          v185 = (__CFString *)ABMultiValueCopyLabelAtIndex(v56, k);
          v60 = -[ABVCardRecord _vCardKeysForPhoneLabel:](self, "_vCardKeysForPhoneLabel:", v185);
          v61 = objc_msgSend(v60, "count");
          if (v61)
          {
            obja = 0;
          }
          else
          {
            v171 = v198;
            obja = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item%ld"));
            ++v198;
            objc_msgSend(v8, "appendString:", obja);
            objc_msgSend(v8, "appendString:", CFSTR("."));
          }
          objc_msgSend(v8, "appendString:", CFSTR("TEL"));
          if (v61 >= 1)
          {
            for (m = 0; m != v61; ++m)
            {
              v63 = objc_msgSend(v60, "objectAtIndex:", m);
              objc_msgSend(v8, "appendString:", CFSTR(";type="));
              objc_msgSend(v8, "appendString:", v63);
            }
          }
          if ((_DWORD)v59 == PrimaryIdentifier)
            objc_msgSend(v8, "appendString:", CFSTR(";type=pref"));
          objc_msgSend(v8, "appendString:", CFSTR(":"));
          objc_msgSend(v8, "appendString:", objc_msgSend(v179, "abVCardKoshify"));
          objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
          if (obja)
            -[ABVCardRecord appendLabel:toVCardRep:inGroup:](self, "appendLabel:toVCardRep:inGroup:", v185, v8, obja);

        }
        v56 = v58;
      }
    }
  }
  v64 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:");
  v65 = v64;
  if (v64)
  {
    v180 = ABCMultiValueGetPrimaryIdentifier((uint64_t)v64);
    objb = (id)ABMultiValueGetCount(v65);
    if (objb)
    {
      for (n = 0; (id)n != objb; ++n)
      {
        v67 = ABMultiValueGetIdentifierAtIndex(v65, n);
        if (-[ABVCardRecord _showField:identifier:](self, "_showField:identifier:", kABPersonAddressProperty, v67))
        {
          v68 = (void *)ABMultiValueCopyValueAtIndex(v65, n);
          v69 = (__CFString *)ABMultiValueCopyLabelAtIndex(v65, n);
          v70 = -[ABVCardRecord _vCardKeyForAddressLabel:vCard3:](self, "_vCardKeyForAddressLabel:vCard3:", v69, 1);
          v171 = v198;
          v71 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item%ld"));
          ++v198;
          objc_msgSend(v8, "appendString:", v71);
          objc_msgSend(v8, "appendString:", CFSTR("."));
          objc_msgSend(v8, "appendString:", CFSTR("ADR"));
          if (v70)
            v72 = v70;
          else
            v72 = CFSTR(";type=HOME");
          objc_msgSend(v8, "appendString:", v72);
          if ((_DWORD)v67 == v180)
            objc_msgSend(v8, "appendString:", CFSTR(";type=pref"));
          objc_msgSend(v8, "appendString:", CFSTR(":"));
          objc_msgSend(v187, "addObject:", &stru_1E3CA4E68);
          v73 = (void *)objc_msgSend(v68, "objectForKey:", CFSTR("Street"));
          v74 = v73;
          if (v73)
          {
            v75 = objc_msgSend(v73, "rangeOfString:", CFSTR("\r"));
            if (v76)
            {
              v77 = v75;
              objc_msgSend(v187, "addObject:", objc_msgSend((id)objc_msgSend(v74, "substringToIndex:", v75), "abVCardKoshify"));
              v78 = objc_msgSend((id)objc_msgSend(v74, "substringFromIndex:", v77 + 1), "abVCardKoshify");
            }
            else
            {
              objc_msgSend(v187, "addObject:", &stru_1E3CA4E68);
              v78 = objc_msgSend(v74, "abVCardKoshify");
            }
            objc_msgSend(v187, "addObject:", v78);
          }
          else
          {
            objc_msgSend(v187, "addObject:", &stru_1E3CA4E68);
            objc_msgSend(v187, "addObject:", &stru_1E3CA4E68);
          }
          v79 = (__CFString *)objc_msgSend(v68, "objectForKey:", CFSTR("City"));
          if (!v79)
            v79 = &stru_1E3CA4E68;
          objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v79, "abVCardKoshify"));
          v80 = (__CFString *)objc_msgSend(v68, "objectForKey:", CFSTR("State"));
          if (!v80)
            v80 = &stru_1E3CA4E68;
          objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v80, "abVCardKoshify"));
          v81 = (__CFString *)objc_msgSend(v68, "objectForKey:", CFSTR("ZIP"));
          if (!v81)
            v81 = &stru_1E3CA4E68;
          objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v81, "abVCardKoshify"));
          v82 = (__CFString *)objc_msgSend(v68, "objectForKey:", CFSTR("Country"));
          if (!v82)
            v82 = &stru_1E3CA4E68;
          objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v82, "abVCardKoshify"));
          objc_msgSend(v8, "appendString:", objc_msgSend(v187, "componentsJoinedByString:", CFSTR(";")));
          objc_msgSend(v187, "removeAllObjects");
          objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
          if (!v70)
            -[ABVCardRecord appendLabel:toVCardRep:inGroup:](self, "appendLabel:toVCardRep:inGroup:", v69, v8, v71);
          v83 = objc_msgSend(v68, "objectForKey:", CFSTR("CountryCode"));
          if (v83)
            -[ABVCardRecord _appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:](self, "_appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:", v83, CFSTR("X-ABADR"), v8, CFSTR("\r\n"), v71);
          v84 = objc_msgSend(v68, "objectForKey:", CFSTR("SubLocality"));
          if (v84)
            -[ABVCardRecord _appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:](self, "_appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:", v84, CFSTR("X-APPLE-SUBLOCALITY"), v8, CFSTR("\r\n"), v71);
          v85 = objc_msgSend(v68, "objectForKey:", CFSTR("SubAdministrativeArea"));
          if (v85)
            -[ABVCardRecord _appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:](self, "_appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:", v85, CFSTR("X-APPLE-SUBADMINISTRATIVEAREA"), v8, CFSTR("\r\n"), v71);

        }
      }
    }
  }
  v86 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonNoteProperty);
  v87 = v86;
  if (v86
    && (objc_msgSend(v86, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0
    && objc_msgSend((id)objc_opt_class(), "includeNotesInVCards"))
  {
    objc_msgSend(v8, "appendString:", CFSTR("NOTE:"));
    objc_msgSend(v8, "appendString:", objc_msgSend(v87, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v88 = -[ABVCardRecord propertyLineForGenericABProperty:vCardProperty:is21:groupCount:](self, "propertyLineForGenericABProperty:vCardProperty:is21:groupCount:", kABPersonURLProperty, CFSTR("URL"), 0, &v198);
  v89 = v88;
  if (v88 && (objc_msgSend(v88, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
    objc_msgSend(v8, "appendString:", v89);
  v90 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonBirthdayProperty);
  if (v90 && -[ABVCardRecord _showField:](self, "_showField:", kABPersonBirthdayProperty))
  {
    objc_msgSend(v8, "appendString:", CFSTR("BDAY;"));
    objc_msgSend(v8, "appendString:", CFSTR("value=date:"));
    objc_msgSend(v8, "appendString:", -[ABVCardRecord ISO8061StringFromDate:](self, "ISO8061StringFromDate:", v90));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v91 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonImageURIProperty);
  v92 = objc_msgSend((id)objc_opt_class(), "includeImageURIInVCards");
  if (v91)
    v93 = v92;
  else
    v93 = 0;
  if (v93 == 1 && objc_msgSend(v91, "length"))
  {
    v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("PHOTO"));
    v95 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMemojiMetadataProperty);
    v96 = v95;
    if (v95 && objc_msgSend(v95, "length"))
      objc_msgSend(v94, "appendFormat:", CFSTR(";VND-63-MEMOJI-DETAILS=%@"),
        objc_msgSend(v96, "base64EncodedStringWithOptions:", 0));
    if (a5)
      objc_msgSend(v94, "appendFormat:", CFSTR(";%@;VALUE=uri:"), a5);
    else
      objc_msgSend(v94, "appendString:", CFSTR(";VALUE=uri:"));
    objc_msgSend(v8, "appendString:", v94);
    objc_msgSend(v8, "appendString:", objc_msgSend(v91, "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));

  }
  else
  {
    v97 = (const __CFData *)a4;
    if (!a4)
      v97 = -[ABVCardRecord imageData](self, "imageData");
    v98 = v97;
    if (-[__CFData length](v97, "length"))
    {
      v99 = CGImageSourceCreateWithData(v98, 0);
      v100 = v99;
      if (v99)
      {
        Type = CGImageSourceGetType(v99);
        v102 = Type;
        if (Type)
        {
          if (UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x1E0CA5BA8]))
          {
            v103 = 0;
            v104 = CFSTR("JPEG");
          }
          else if (UTTypeConformsTo(v102, (CFStringRef)*MEMORY[0x1E0CA5C80]))
          {
            v103 = 0;
            v104 = CFSTR("TIFF");
          }
          else
          {
            v108 = UTTypeConformsTo(v102, (CFStringRef)*MEMORY[0x1E0CA5C10]);
            v103 = v108 == 0;
            if (v108)
              v104 = CFSTR("PNG");
            else
              v104 = 0;
          }
        }
        else
        {
          v104 = 0;
          v103 = 1;
        }
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v100, 0, 0);
        if (ImageAtIndex)
        {
          v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("PHOTO"));
          v111 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMemojiMetadataProperty);
          v112 = v111;
          if (v111 && objc_msgSend(v111, "length"))
            objc_msgSend(v110, "appendFormat:", CFSTR(";VND-63-MEMOJI-DETAILS=%@"),
              objc_msgSend(v112, "base64EncodedStringWithOptions:", 0));
          objc_msgSend(v110, "appendString:", CFSTR(";ENCODING=b"));
          if (!v103)
            objc_msgSend(v110, "appendFormat:", CFSTR(";TYPE=%@"), v104);
          if (a5)
            objc_msgSend(v110, "appendFormat:", CFSTR(";%@"), a5);
          objc_msgSend(v110, "appendString:", CFSTR(":"));
          v113 = -[__CFData abEncodeVCardBase64DataWithInitialLength:](v98, "abEncodeVCardBase64DataWithInitialLength:", objc_msgSend(v110, "length"));
          v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v113, 1);
          objc_msgSend(v110, "appendString:", v114);
          objc_msgSend(v8, "appendString:", v110);
          objc_msgSend(v8, "appendString:", CFSTR("\r\n"));

          CFRelease(ImageAtIndex);
        }
        else
        {
          ABDiagnosticsEnabled();
          _ABLog2(4, (uint64_t)"-[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:]", 2617, 0, (uint64_t)CFSTR("Discarding corrupted image data"), v115, v116, v117, v171);
        }
        CFRelease(v100);
      }
      else
      {
        ABDiagnosticsEnabled();
        _ABLog2(4, (uint64_t)"-[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:]", 2621, 0, (uint64_t)CFSTR("Discarding corrupted image data"), v105, v106, v107, v171);
      }
    }
  }
  if (v175)
  {
    v118 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonWallpaperURIProperty);
    v119 = objc_msgSend((id)objc_opt_class(), "includeWallpaperURIInVCards");
    if (v118)
      v120 = v119;
    else
      v120 = 0;
    if (v120 == 1 && objc_msgSend(v118, "length"))
    {
      objc_msgSend(v8, "appendString:", CFSTR("VND-63-WALLPAPER;VALUE=uri:"));
      objc_msgSend(v8, "appendString:", objc_msgSend(v118, "abVCardKoshify"));
      objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
    }
    else
    {
      v121 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonWallpaperProperty);
      v122 = v121;
      if (v121 && objc_msgSend(v121, "length"))
      {
        objc_msgSend(v8, "appendString:", CFSTR("VND-63-WALLPAPER;ENCODING=b:"));
        objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v122, "base64EncodedStringWithOptions:", 0), "abVCardKoshify"));
        objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
      }
    }
  }
  v123 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonSensitiveContentConfigurationProperty);
  if (v123)
  {
    objc_msgSend(v8, "appendString:", CFSTR("VND-63-SENSITIVE-CONTENT-CONFIG:"));
    objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v123, "base64EncodedStringWithOptions:", 0), "abVCardKoshify"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v124 = -[ABVCardRecord propertyLineForInstantMessageHandles:groupCount:includePrivateData:](self, "propertyLineForInstantMessageHandles:groupCount:includePrivateData:", 0, &v198, v176);
  v125 = v124;
  if (v124 && (objc_msgSend(v124, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
    objc_msgSend(v8, "appendString:", v125);
  v126 = -[ABVCardRecord propertyLineForIMPPProperty:groupCount:includePrivateData:](self, "propertyLineForIMPPProperty:groupCount:includePrivateData:", 0, &v198, v176);
  v127 = v126;
  if (v126 && (objc_msgSend(v126, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
    objc_msgSend(v8, "appendString:", v127);
  v128 = -[ABVCardRecord dataForSocialProfileProperty:groupCount:includePrivateData:](self, "dataForSocialProfileProperty:groupCount:includePrivateData:", -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonSocialProfileProperty), &v198, v176);
  v129 = v128;
  if (v128 && objc_msgSend(v128, "length"))
  {
    v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v129, 1);
    objc_msgSend(v8, "appendString:", v130);

  }
  v131 = -[ABVCardRecord propertyLineForGenericABProperty:vCardProperty:is21:groupCount:](self, "propertyLineForGenericABProperty:vCardProperty:is21:groupCount:", kABPersonDateProperty, CFSTR("X-ABDATE"), 0, &v198);
  v132 = v131;
  if (v131 && (objc_msgSend(v131, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
    objc_msgSend(v8, "appendString:", v132);
  v133 = -[ABVCardRecord propertyLineForGenericABProperty:vCardProperty:is21:groupCount:](self, "propertyLineForGenericABProperty:vCardProperty:is21:groupCount:", kABPersonRelatedNamesProperty, CFSTR("X-ABRELATEDNAMES"), 0, &v198);
  v134 = v133;
  if (v133 && (objc_msgSend(v133, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
    objc_msgSend(v8, "appendString:", v134);
  if (-[ABVCardRecord _isCompany](self, "_isCompany"))
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-ABShowAs:COMPANY"));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v135 = -[ABVCardRecord sharedPhotoDisplayPreferenceStringValue](self, "sharedPhotoDisplayPreferenceStringValue");
  if (v135)
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-SHARED-PHOTO-DISPLAY-PREF:"));
    objc_msgSend(v8, "appendString:", v135);
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  v136 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonModificationDateProperty);
  if (v136 && objc_msgSend((id)objc_opt_class(), "includeREVInVCards"))
  {
    objc_msgSend(v8, "appendString:", CFSTR("REV:"));
    objc_msgSend(v8, "appendString:", -[ABVCardRecord ISO8061StringFromDateTime:](self, "ISO8061StringFromDateTime:", v136));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  if (v174)
  {
    v137 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonExternalUUIDProperty);
    if (objc_msgSend(v137, "length"))
    {
      objc_msgSend(v8, "appendString:", CFSTR("UID:"));
      objc_msgSend(v8, "appendString:", objc_msgSend(v137, "abVCardKoshify"));
      objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
    }
    v138 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonExternalRepresentationProperty);
    if (v138)
    {
      v197 = 0;
      v139 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v138, &v197);
      if (v139)
      {
        v140 = (void *)MEMORY[0x1E0C99E60];
        v141 = objc_opt_class();
        v142 = objc_opt_class();
        v188 = (void *)objc_msgSend(v139, "decodeObjectOfClasses:forKey:", objc_msgSend(v140, "setWithObjects:", v141, v142, objc_opt_class(), 0), *MEMORY[0x1E0CB2CD0]);
        objc_msgSend(v139, "finishDecoding");
      }
      else
      {
        ABDiagnosticsEnabled();
        _ABLog2(4, (uint64_t)"-[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:]", 2757, 0, (uint64_t)CFSTR("Error trying to decode external representation: %@"), v143, v144, v145, v197);
        v188 = 0;
      }

      v195 = 0u;
      v196 = 0u;
      v193 = 0u;
      v194 = 0u;
      v146 = (void *)objc_msgSend(v188, "allKeys");
      v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v193, v200, 16);
      if (v147)
      {
        objc = v146;
        v186 = *(_QWORD *)v194;
        do
        {
          for (ii = 0; ii != v147; ++ii)
          {
            if (*(_QWORD *)v194 != v186)
              objc_enumerationMutation(objc);
            v149 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * ii);
            v150 = (void *)objc_msgSend(v188, "objectForKey:", v149);
            v191 = 0u;
            v192 = 0u;
            v189 = 0u;
            v190 = 0u;
            v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v189, v199, 16);
            if (v151)
            {
              v152 = *(_QWORD *)v190;
              do
              {
                for (jj = 0; jj != v151; ++jj)
                {
                  if (*(_QWORD *)v190 != v152)
                    objc_enumerationMutation(v150);
                  -[ABVCardRecord _appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:](self, "_appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:", *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * jj), v149, v8, CFSTR("\r\n"), 0);
                }
                v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v189, v199, 16);
              }
              while (v151);
            }
          }
          v147 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v193, v200, 16);
        }
        while (v147);
      }
    }
  }
  if (v176)
  {
    v154 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonPhonemeDataProperty);
    v155 = v154;
    if (v154)
    {
      if ((objc_msgSend(v154, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
      {
        objc_msgSend(v8, "appendString:", CFSTR("X-ADDRESSBOOKSERVER-PHONEME-DATA:"));
        objc_msgSend(v8, "appendString:", objc_msgSend(v155, "abVCardKoshify"));
        objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
      }
    }
  }
  v156 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonAlternateBirthdayProperty);
  if (objc_msgSend(v156, "count")
    && -[ABVCardRecord _showField:](self, "_showField:", kABPersonAlternateBirthdayProperty))
  {
    objc_msgSend(v8, "appendString:", CFSTR("X-ALTBDAY;"));
    objc_msgSend(v8, "appendString:", -[ABVCardRecord stringFromAlternateBirthday:](self, "stringFromAlternateBirthday:", v156));
    objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  }
  if (v176)
  {
    v157 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonMapsDataProperty);
    v158 = v157;
    if (v157 && (objc_msgSend(v157, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
    {
      objc_msgSend(v8, "appendString:", CFSTR("X-APPLE-MAPS-DATA:"));
      objc_msgSend(v8, "appendString:", objc_msgSend(v158, "abVCardKoshify"));
      objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
    }
    v159 = -[ABVCardRecord dataForSoundProperty:](self, "dataForSoundProperty:", -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonSoundProperty));
    v160 = v159;
    if (v159 && objc_msgSend(v159, "length"))
    {
      v161 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v160, 1);
      objc_msgSend(v8, "appendString:", v161);

    }
    v162 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonDowntimeWhitelistProperty);
    v163 = v162;
    if (v162 && objc_msgSend(v162, "length"))
    {
      if (objc_msgSend(v163, "isEqualToString:", CFSTR("true")))
        v164 = CFSTR("X-APPLE-GUARDIAN-WHITELISTED:true");
      else
        v164 = CFSTR("X-APPLE-GUARDIAN-WHITELISTED:false");
      objc_msgSend(v8, "appendString:", v164);
      objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
    }
    v165 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonImageTypeProperty);
    v166 = v165;
    if (v165 && (objc_msgSend(v165, "isEqualToString:", &stru_1E3CA4E68) & 1) == 0)
    {
      objc_msgSend(v8, "appendString:", CFSTR("X-IMAGETYPE:"));
      objc_msgSend(v8, "appendString:", objc_msgSend(v166, "abVCardKoshify"));
      objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
    }
    v167 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonImageHashProperty);
    v168 = v167;
    if (v167 && objc_msgSend(v167, "length"))
    {
      objc_msgSend(v8, "appendString:", CFSTR("X-IMAGEHASH:"));
      objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v168, "base64EncodedStringWithOptions:", 0), "abVCardKoshify"));
      objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
    }
  }
  objc_msgSend(v8, "appendString:", CFSTR("END:VCARD"));
  objc_msgSend(v8, "appendString:", CFSTR("\r\n"));
  v169 = (id)objc_msgSend(v8, "abStringByStrippingControlCharacters");

  return v169;
}

- (id)_copyGroupVCardRepresentationAsStringIncludeExternalProperties:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  const __CFArray *v25;
  const __CFArray *v26;
  CFIndex Count;
  CFIndex v28;
  ABPropertyID v29;
  const void *ValueAtIndex;
  void *v31;
  id v32;
  void *v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v3 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("BEGIN:VCARD"));
  objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
  objc_msgSend(v5, "appendString:", CFSTR("VERSION:3.0"));
  objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
  objc_msgSend(v5, "appendString:", CFSTR("X-ADDRESSBOOKSERVER-KIND:group"));
  objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
  objc_msgSend(v5, "appendString:", CFSTR("PRODID:"));
  objc_msgSend(v5, "appendString:", -[ABVCardRecord _prodID](self, "_prodID"));
  objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
  v6 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABGroupNameProperty);
  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E3CA4E68;
  objc_msgSend(v5, "appendString:", CFSTR("N:"));
  objc_msgSend(v5, "appendString:", v7);
  objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
  objc_msgSend(v5, "appendString:", CFSTR("FN:"));
  objc_msgSend(v5, "appendString:", v7);
  objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
  if (v3)
  {
    v8 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABGroupExternalUUIDProperty);
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v5, "appendString:", CFSTR("UID:"));
      objc_msgSend(v5, "appendString:", objc_msgSend(v8, "abVCardKoshify"));
      objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
    }
    v9 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABGroupExternalRepresentationProperty);
    if (v9)
    {
      v45 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, &v45);
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0C99E60];
        v12 = objc_opt_class();
        v13 = objc_opt_class();
        v34 = (void *)objc_msgSend(v10, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0), *MEMORY[0x1E0CB2CD0]);
        objc_msgSend(v10, "finishDecoding");
      }
      else
      {
        ABDiagnosticsEnabled();
        _ABLog2(4, (uint64_t)"-[ABVCardRecord _copyGroupVCardRepresentationAsStringIncludeExternalProperties:]", 2912, 0, (uint64_t)CFSTR("Error trying to decode external representation: %@"), v14, v15, v16, v45);
        v34 = 0;
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v17 = (void *)objc_msgSend(v34, "allKeys");
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v18)
      {
        obj = v17;
        v36 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v42 != v36)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if (objc_msgSend(v20, "compare:options:", CFSTR("X-ADDRESSBOOKSERVER-KIND"), 1))
            {
              if (objc_msgSend(v20, "compare:options:", CFSTR("X-ADDRESSBOOKSERVER-MEMBER"), 1))
              {
                v21 = (void *)objc_msgSend(v34, "objectForKey:", v20);
                v39 = 0u;
                v40 = 0u;
                v37 = 0u;
                v38 = 0u;
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
                if (v22)
                {
                  v23 = *(_QWORD *)v38;
                  do
                  {
                    for (j = 0; j != v22; ++j)
                    {
                      if (*(_QWORD *)v38 != v23)
                        objc_enumerationMutation(v21);
                      -[ABVCardRecord _appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:](self, "_appendPropValue:forPropKey:toOutString:usingDelimiter:inGroup:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j), v20, v5, CFSTR("\r\n"), 0);
                    }
                    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
                  }
                  while (v22);
                }
              }
            }
          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v18);
      }
    }
    v25 = ABGroupCopyArrayOfAllMembers(self->_record);
    v26 = v25;
    if (v25)
    {
      Count = CFArrayGetCount(v25);
      if (Count >= 1)
      {
        v28 = 0;
        v29 = kABPersonExternalUUIDProperty;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v26, v28);
          v31 = (void *)ABRecordCopyValue(ValueAtIndex, v29);
          if (v31)
          {
            objc_msgSend(v5, "appendString:", CFSTR("X-ADDRESSBOOKSERVER-MEMBER:urn:uuid:"));
            objc_msgSend(v5, "appendString:", objc_msgSend(v31, "abVCardKoshify"));
            objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
          }

          ++v28;
        }
        while (Count != v28);
      }
      CFRelease(v26);
    }
  }
  objc_msgSend(v5, "appendString:", CFSTR("END:VCARD"));
  objc_msgSend(v5, "appendString:", CFSTR("\r\n"));
  v32 = (id)objc_msgSend(v5, "abStringByStrippingControlCharacters");

  return v32;
}

@end
