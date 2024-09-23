@implementation DAContactSearchResultElement(ABAdditions)

- (ABRecordRef)newAddressBookRecordWithSource:()ABAdditions
{
  ABRecordRef v5;
  ABMutableMultiValueRef Mutable;
  ABMutableMultiValueRef v7;
  ABMutableMultiValueRef v8;
  void *v9;
  __CFDictionary *v10;
  ABMutableMultiValueRef v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;
  const __CFString *v16;
  __CFDictionary *v17;

  v5 = ABPersonCreate();
  if (v5)
  {
    if (objc_msgSend(a1, "displayName"))
      ABRecordSetValue(v5, kABCPersonDisplayNameProperty, (CFTypeRef)objc_msgSend(a1, "displayName"), 0);
    if (objc_msgSend(a1, "firstName"))
      ABRecordSetValue(v5, kABPersonFirstNameProperty, (CFTypeRef)objc_msgSend(a1, "firstName"), 0);
    if (objc_msgSend(a1, "lastName"))
      ABRecordSetValue(v5, kABPersonLastNameProperty, (CFTypeRef)objc_msgSend(a1, "lastName"), 0);
    if (objc_msgSend(a1, "emailAddress"))
    {
      Mutable = ABMultiValueCreateMutable(1u);
      ABMultiValueAddValueAndLabel(Mutable, (CFTypeRef)objc_msgSend(a1, "emailAddress"), CFSTR("_$!<Work>!$_"), 0);
      ABRecordSetValue(v5, kABPersonEmailProperty, Mutable, 0);
      CFRelease(Mutable);
    }
    if (objc_msgSend(a1, "workPhone")
      || objc_msgSend(a1, "mobilePhone")
      || objc_msgSend(a1, "homePhone")
      || objc_msgSend(a1, "faxPhone")
      || objc_msgSend(a1, "pagerNumber")
      || objc_msgSend(a1, "iPhone")
      || objc_msgSend(a1, "mainPhone")
      || objc_msgSend(a1, "workFaxPhone"))
    {
      v7 = ABMultiValueCreateMutable(1u);
      if (objc_msgSend(a1, "workPhone"))
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)objc_msgSend(a1, "workPhone"), CFSTR("_$!<Work>!$_"), 0);
      if (objc_msgSend(a1, "mobilePhone"))
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)objc_msgSend(a1, "mobilePhone"), CFSTR("_$!<Mobile>!$_"), 0);
      if (objc_msgSend(a1, "homePhone"))
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)objc_msgSend(a1, "homePhone"), CFSTR("_$!<Home>!$_"), 0);
      if (objc_msgSend(a1, "faxPhone"))
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)objc_msgSend(a1, "faxPhone"), CFSTR("_$!<HomeFAX>!$_"), 0);
      if (objc_msgSend(a1, "pagerNumber"))
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)objc_msgSend(a1, "pagerNumber"), CFSTR("_$!<Pager>!$_"), 0);
      if (objc_msgSend(a1, "iPhone"))
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)objc_msgSend(a1, "iPhone"), CFSTR("iPhone"), 0);
      if (objc_msgSend(a1, "mainPhone"))
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)objc_msgSend(a1, "mainPhone"), CFSTR("_$!<Main>!$_"), 0);
      if (objc_msgSend(a1, "workFaxPhone"))
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)objc_msgSend(a1, "workFaxPhone"), CFSTR("_$!<WorkFAX>!$_"), 0);
      ABRecordSetValue(v5, kABPersonPhoneProperty, v7, 0);
      CFRelease(v7);
    }
    if (objc_msgSend(a1, "company"))
      ABRecordSetValue(v5, kABPersonOrganizationProperty, (CFTypeRef)objc_msgSend(a1, "company"), 0);
    if (objc_msgSend(a1, "title"))
      ABRecordSetValue(v5, kABPersonJobTitleProperty, (CFTypeRef)objc_msgSend(a1, "title"), 0);
    v8 = ABMultiValueCreateMutable(5u);
    if (objc_msgSend(a1, "city") || objc_msgSend(a1, "state") || objc_msgSend(a1, "zip") || objc_msgSend(a1, "country"))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
      if (objc_msgSend(a1, "street"))
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "street"), CFSTR("Street"));
      if (objc_msgSend(a1, "city"))
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "city"), CFSTR("City"));
      if (objc_msgSend(a1, "state"))
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "state"), CFSTR("State"));
      if (objc_msgSend(a1, "zip"))
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "zip"), CFSTR("ZIP"));
      if (objc_msgSend(a1, "country"))
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "country"), CFSTR("Country"));
      ABMultiValueAddValueAndLabel(v8, v9, CFSTR("_$!<Work>!$_"), 0);

    }
    else if (objc_msgSend(a1, "postalAddress") || objc_msgSend(a1, "street"))
    {
      v16 = (const __CFString *)objc_msgSend(a1, "street");
      if (!v16)
        v16 = (const __CFString *)objc_msgSend(a1, "postalAddress");
      v17 = ABCreateAddressDictionaryWithString(v16);
      if (!v17)
        v17 = (__CFDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v16, CFSTR("Street"), 0);
      ABMultiValueAddValueAndLabel(v8, v17, CFSTR("_$!<Work>!$_"), 0);
      CFRelease(v17);
    }
    if (objc_msgSend(a1, "homePostalAddress"))
    {
      v10 = ABCreateAddressDictionaryWithString((const __CFString *)objc_msgSend(a1, "homePostalAddress"));
      if (!v10)
        v10 = (__CFDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(a1, "homePostalAddress"), CFSTR("Street"), 0);
      ABMultiValueAddValueAndLabel(v8, v10, CFSTR("_$!<Home>!$_"), 0);
      CFRelease(v10);
    }
    if (ABMultiValueGetCount(v8) >= 1)
      ABRecordSetValue(v5, kABPersonAddressProperty, v8, 0);
    CFRelease(v8);
    if (objc_msgSend(a1, "jpegPhoto"))
      ABPersonSetImageData(v5, (CFDataRef)objc_msgSend(a1, "jpegPhoto"), 0);
    if (objc_msgSend(a1, "imUsername"))
    {
      v11 = ABMultiValueCreateMutable(1u);
      v12 = objc_msgSend(a1, "imService");
      if (v12)
        v13 = (const __CFString *)v12;
      else
        v13 = CFSTR("AIM");
      ABMultiValueAddValueAndLabel(v11, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(a1, "imUsername"), CFSTR("username"), v13, CFSTR("service"), 0), CFSTR("_$!<Work>!$_"), 0);
      ABRecordSetValue(v5, kABPersonInstantMessageProperty, v11, 0);
      CFRelease(v11);
    }
    if (objc_msgSend(a1, "buildingName") || objc_msgSend(a1, "appleFloor"))
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      if (objc_msgSend(a1, "buildingName"))
      {
        objc_msgSend(v14, "appendString:", objc_msgSend(a1, "localizedStringForKey:formatArg:", CFSTR("NOTES_BUILDING_NAME_FORMAT"), objc_msgSend(a1, "buildingName")));
        if (objc_msgSend(a1, "appleFloor"))
          objc_msgSend(v14, "appendString:", CFSTR("\n"));
      }
      if (objc_msgSend(a1, "appleFloor"))
        objc_msgSend(v14, "appendString:", objc_msgSend(a1, "localizedStringForKey:formatArg:", CFSTR("NOTES_APPLE_FLOOR_FORMAT"), objc_msgSend(a1, "appleFloor")));
      ABRecordSetValue(v5, kABPersonNoteProperty, v14, 0);

    }
    if (a3)
    {
      ABSourceSetShouldIgnoreCapabilitiesRestrictions((uint64_t)a3, 1);
      ABRecordSetValue(v5, kABPersonStoreReferenceProperty, a3, 0);
      if (objc_msgSend(a1, "identifierOnServer"))
        ABRecordSetValue(v5, kABPersonExternalIdentifierProperty, (CFTypeRef)objc_msgSend(a1, "identifierOnServer"), 0);
      ABSourceSetShouldIgnoreCapabilitiesRestrictions((uint64_t)a3, 0);
    }
  }
  return v5;
}

- (const)localizedStringForKey:()ABAdditions formatArg:
{
  __CFBundle *v6;
  CFStringRef v7;
  CFStringRef v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v12;
  uint8_t buf[4];
  CFStringRef v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (__CFBundle *)_ABBundle();
  v7 = CFBundleCopyLocalizedString(v6, a3, 0, CFSTR("Localized"));
  if (v7)
  {
    v8 = v7;
    v12 = 0;
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), &v12, a4);
    if (v12)
    {
      v10 = ABOSLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v14 = v8;
        v15 = 2114;
        v16 = a4;
        v17 = 2114;
        v18 = v12;
        _os_log_error_impl(&dword_19BC4B000, v10, OS_LOG_TYPE_ERROR, "Error creating localized string from format = %{public}@, value = %{public}@, error = %{public}@", buf, 0x20u);
      }
    }
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  if (v9)
    return (const __CFString *)v9;
  else
    return &stru_1E3CA4E68;
}

@end
