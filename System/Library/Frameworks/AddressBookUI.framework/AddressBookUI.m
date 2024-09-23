id PostalAddressByAddingCountry(void *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];

  v2 = objc_msgSend(a1, "ISOCountryCode");
  if ((*(unsigned int (**)(void))(*MEMORY[0x24BE191D0] + 16))())
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBAD10], "sharedDefaults"), "countryCode");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBAD98], "supportedCountries");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __PostalAddressByAddingCountry_block_invoke;
  v8[3] = &unk_24F2031D8;
  v8[4] = v2;
  v4 = objc_msgSend(v3, "_cn_firstObjectPassingTest:", v8);
  if (!v4)
    return a1;
  v5 = (void *)v4;
  v6 = (id)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v6, "setCountry:", objc_msgSend(v5, "name"));
  return (id)objc_msgSend(v6, "copy");
}

uint64_t StringByRemovingConsecutiveNewLines(void *a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet")), "_cn_filter:", &__block_literal_global), "componentsJoinedByString:", CFSTR("\n"));
}

NSString *__cdecl ABCreateStringWithAddressDictionary(NSDictionary *address, BOOL addCountryName)
{
  _BOOL4 v2;
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;

  if (!address)
    return (NSString *)&stru_24F203440;
  v2 = addCountryName;
  v4 = -[NSDictionary objectForKeyedSubscript:](address, "objectForKeyedSubscript:", CFSTR("ABFormattedAddress"));
  if (!v4)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDBAD90], "postalAddressWithAddressBookDictionaryRepresentation:", address);
    if ((*(unsigned int (**)(_QWORD, uint64_t))(*MEMORY[0x24BE191D0] + 16))(*MEMORY[0x24BE191D0], objc_msgSend(v5, "country")))
    {
      v6 = !v2;
    }
    else
    {
      v6 = 1;
    }
    if (!v6)
      v5 = PostalAddressByAddingCountry(v5);
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBAD98], "stringFromPostalAddress:style:", v5, 0);
    v8 = (void *)objc_msgSend(v7, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
    v4 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet")), "_cn_filter:", &__block_literal_global), "componentsJoinedByString:", CFSTR("\n"));
  }
  return (NSString *)v4;
}

uint64_t ABAddressBookUIBundle()
{
  if (ABAddressBookUIBundle_onceToken != -1)
    dispatch_once(&ABAddressBookUIBundle_onceToken, &__block_literal_global_2);
  return ABAddressBookUIBundle___bundle;
}

uint64_t ABAddressBookBundle()
{
  if (ABAddressBookBundle_onceToken != -1)
    dispatch_once(&ABAddressBookBundle_onceToken, &__block_literal_global_2);
  return ABAddressBookBundle___bundle;
}

uint64_t ABUIOldAppsUseModernUI()
{
  if (ABUIOldAppsUseModernUI_onceToken != -1)
    dispatch_once(&ABUIOldAppsUseModernUI_onceToken, &__block_literal_global_5);
  if (ABUIOldAppsUseModernUI_enabled)
    return 1;
  else
    return dyld_program_sdk_at_least();
}

uint64_t ABUIAppIsOldFMF()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary"), "valueForKey:", CFSTR("CFBundleNumericVersion"));
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.mobileme.fmf1"));
  if ((_DWORD)result)
    return objc_msgSend(v0, "integerValue") == 0;
  return result;
}

uint64_t ABUIShouldUseLegacyUI()
{
  if (ABUIOldAppsUseModernUI())
    return ABUIAppIsOldFMF();
  else
    return 1;
}

uint64_t ABAddressBookSetAutorotationEnabled(uint64_t result)
{
  _ABGloballyAllowAutorotation = result;
  return result;
}

uint64_t ABAddressBookShouldAllowAutorotation()
{
  uint64_t result;

  LODWORD(result) = dyld_program_sdk_at_least();
  if (_ABGloballyAllowAutorotation)
    return result;
  else
    return 0;
}

uint64_t ABAddressBookGetDefaultRotationContentSettings(uint64_t result)
{
  *(_WORD *)result = 257;
  *(_BYTE *)(result + 2) = 1;
  *(_QWORD *)(result + 8) = 0x4038000000000000;
  return result;
}

void ABUIRoundToViewScale(void *a1)
{
  double v1;

  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v1 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
}

double ABUIPixelAlignedPoint(void *a1, double a2)
{
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v4 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
    v4 = *(double *)&RoundToScale___s;
  }
  v5 = v4 == 1.0;
  v6 = round(a2 * v4) / v4;
  v7 = round(a2);
  if (v5)
    v8 = v7;
  else
    v8 = v6;
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v9 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
  return v8;
}

double ABUIPixelAlignedSize(void *a1, double a2)
{
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v4 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
    v4 = *(double *)&RoundToScale___s;
  }
  v5 = v4 == 1.0;
  v6 = round(a2 * v4) / v4;
  v7 = round(a2);
  if (v5)
    v8 = v7;
  else
    v8 = v6;
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v9 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
  return v8;
}

double ABUIPixelAlignedRect(void *a1, double a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v4 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
    v4 = *(double *)&RoundToScale___s;
  }
  if (v4 == 1.0)
    v5 = round(a2);
  else
    v5 = round(a2 * v4) / v4;
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v6 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v7 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v8 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_28);
  return v5;
}

uint64_t ABUISetUseSiriLocalization(uint64_t result)
{
  _useSiriLocalization = result;
  return result;
}

BOOL ABUIShouldUseSiriLocalization()
{
  if (_useSiriLocalization)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return _useSiriLocalization != 0;
    NSLog(CFSTR("You tried to use Siri localization but SiriUI is not loaded."));
  }
  return 0;
}

BOOL ABUIIsContacts()
{
  int v0;

  v0 = ABUIIsContacts_isContacts;
  if (ABUIIsContacts_isContacts == -1)
  {
    v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.MobileAddressBook"));
    ABUIIsContacts_isContacts = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsMobilePhone()
{
  int v0;

  v0 = ABUIIsMobilePhone_isMobilePhone;
  if (ABUIIsMobilePhone_isMobilePhone == -1)
  {
    v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.mobilephone"));
    ABUIIsMobilePhone_isMobilePhone = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsFaceTime()
{
  int v0;

  v0 = ABUIIsFaceTime_isFaceTime;
  if (ABUIIsFaceTime_isFaceTime == -1)
  {
    v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.facetime"));
    ABUIIsFaceTime_isFaceTime = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsGameCenterFriendRequestExtension()
{
  int v0;

  v0 = ABUIIsGameCenterFriendRequestExtension_isGameCenter;
  if (ABUIIsGameCenterFriendRequestExtension_isGameCenter == -1)
  {
    v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.GameCenterUI.GameCenterFriendRequestExtension"));
    ABUIIsGameCenterFriendRequestExtension_isGameCenter = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsFirstParty()
{
  int v0;

  v0 = ABUIIsFirstParty_isFirstParty;
  if (ABUIIsFirstParty_isFirstParty == -1)
  {
    v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "hasPrefix:", CFSTR("com.apple."));
    ABUIIsFirstParty_isFirstParty = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsDDActionsService()
{
  int v0;

  v0 = ABUIIsDDActionsService_isDDActionsService;
  if (ABUIIsDDActionsService_isDDActionsService == -1)
  {
    v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.datadetectors.DDActionsService"));
    ABUIIsDDActionsService_isDDActionsService = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsBlurSupported()
{
  if (ABUIIsBlurSupported_onceToken != -1)
    dispatch_once(&ABUIIsBlurSupported_onceToken, &__block_literal_global_26);
  return ABUIIsBlurSupported_blurSupported
      && !UIAccessibilityIsReduceMotionEnabled()
      && !UIAccessibilityIsReduceTransparencyEnabled();
}

uint64_t ABAddressBookCreateWithOptionsAndPolicy()
{
  return MEMORY[0x24BDB4A68]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x24BDB4A70](addressBook, *(_QWORD *)&recordID);
}

ABRecordRef ABGroupCopySource(ABRecordRef group)
{
  return (ABRecordRef)MEMORY[0x24BDB4A78](group);
}

ABRecordRef ABPersonCreate(void)
{
  return (ABRecordRef)MEMORY[0x24BDB4A90]();
}

ABRecordRef ABPersonCreateInSource(ABRecordRef source)
{
  return (ABRecordRef)MEMORY[0x24BDB4A98](source);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x24BDB4AA8](record, *(_QWORD *)&property);
}

uint64_t ABRecordGetAddressBook()
{
  return MEMORY[0x24BDB4AB0]();
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x24BDB4AB8](record);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

uint64_t _CNUILog()
{
  return MEMORY[0x24BDBAEE8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

