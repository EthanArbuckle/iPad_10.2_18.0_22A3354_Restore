objc_class *getCHManagerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCHManagerClass_softClass;
  v6 = getCHManagerClass_softClass;
  if (!getCHManagerClass_softClass)
  {
    CallHistoryLibraryCore();
    Class = objc_getClass("CHManager");
    v4[3] = (uint64_t)Class;
    getCHManagerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC0710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getCHRecentCallClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCHRecentCallClass_softClass;
  v6 = getCHRecentCallClass_softClass;
  if (!getCHRecentCallClass_softClass)
  {
    CallHistoryLibraryCore();
    Class = objc_getClass("CHRecentCall");
    v4[3] = (uint64_t)Class;
    getCHRecentCallClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC07A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getCNContactBirthdayKey()
{
  id *CNContactBirthdayKeySymbolLoc;

  CNContactBirthdayKeySymbolLoc = (id *)getCNContactBirthdayKeySymbolLoc();
  if (CNContactBirthdayKeySymbolLoc)
    return (objc_class *)*CNContactBirthdayKeySymbolLoc;
  getCNContactBirthdayKey_cold_1();
  return getCNContactClass();
}

objc_class *getCNContactClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCNContactClass_softClass;
  v6 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    ContactsLibraryCore();
    Class = objc_getClass("CNContact");
    v4[3] = (uint64_t)Class;
    getCNContactClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC0858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCNContactFamilyNameKey()
{
  id *CNContactFamilyNameKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactFamilyNameKeySymbolLoc = (id *)getCNContactFamilyNameKeySymbolLoc();
  if (CNContactFamilyNameKeySymbolLoc)
    return *CNContactFamilyNameKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactFetchRequestClass(CNContactBirthdayKey_cold_1);
}

objc_class *getCNContactFetchRequestClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCNContactFetchRequestClass_softClass;
  v6 = getCNContactFetchRequestClass_softClass;
  if (!getCNContactFetchRequestClass_softClass)
  {
    ContactsLibraryCore();
    Class = objc_getClass("CNContactFetchRequest");
    v4[3] = (uint64_t)Class;
    getCNContactFetchRequestClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC090C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getCNContactFormatterClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCNContactFormatterClass_softClass;
  v6 = getCNContactFormatterClass_softClass;
  if (!getCNContactFormatterClass_softClass)
  {
    ContactsLibraryCore();
    Class = objc_getClass("CNContactFormatter");
    v4[3] = (uint64_t)Class;
    getCNContactFormatterClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC09A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCNContactGivenNameKey()
{
  id *CNContactGivenNameKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactGivenNameKeySymbolLoc = (id *)getCNContactGivenNameKeySymbolLoc();
  if (CNContactGivenNameKeySymbolLoc)
    return *CNContactGivenNameKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactIdentifierKey(CNContactBirthdayKey_cold_1);
}

id getCNContactIdentifierKey()
{
  id *CNContactIdentifierKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactIdentifierKeySymbolLoc = (id *)getCNContactIdentifierKeySymbolLoc();
  if (CNContactIdentifierKeySymbolLoc)
    return *CNContactIdentifierKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactImageDataAvailableKey(CNContactBirthdayKey_cold_1);
}

id getCNContactImageDataAvailableKey()
{
  id *CNContactImageDataAvailableKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactImageDataAvailableKeySymbolLoc = (id *)getCNContactImageDataAvailableKeySymbolLoc();
  if (CNContactImageDataAvailableKeySymbolLoc)
    return *CNContactImageDataAvailableKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactInstantMessageAddressesKey(CNContactBirthdayKey_cold_1);
}

id getCNContactInstantMessageAddressesKey()
{
  id *CNContactInstantMessageAddressesKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactInstantMessageAddressesKeySymbolLoc = (id *)getCNContactInstantMessageAddressesKeySymbolLoc();
  if (CNContactInstantMessageAddressesKeySymbolLoc)
    return *CNContactInstantMessageAddressesKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactMiddleNameKey(CNContactBirthdayKey_cold_1);
}

id getCNContactMiddleNameKey()
{
  id *CNContactMiddleNameKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactMiddleNameKeySymbolLoc = (id *)getCNContactMiddleNameKeySymbolLoc();
  if (CNContactMiddleNameKeySymbolLoc)
    return *CNContactMiddleNameKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactNamePrefixKey(CNContactBirthdayKey_cold_1);
}

id getCNContactNamePrefixKey()
{
  id *CNContactNamePrefixKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactNamePrefixKeySymbolLoc = (id *)getCNContactNamePrefixKeySymbolLoc();
  if (CNContactNamePrefixKeySymbolLoc)
    return *CNContactNamePrefixKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactNameSuffixKey(CNContactBirthdayKey_cold_1);
}

id getCNContactNameSuffixKey()
{
  id *CNContactNameSuffixKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactNameSuffixKeySymbolLoc = (id *)getCNContactNameSuffixKeySymbolLoc();
  if (CNContactNameSuffixKeySymbolLoc)
    return *CNContactNameSuffixKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactNicknameKey(CNContactBirthdayKey_cold_1);
}

id getCNContactNicknameKey()
{
  id *CNContactNicknameKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactNicknameKeySymbolLoc = (id *)getCNContactNicknameKeySymbolLoc();
  if (CNContactNicknameKeySymbolLoc)
    return *CNContactNicknameKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactOrganizationNameKey(CNContactBirthdayKey_cold_1);
}

id getCNContactOrganizationNameKey()
{
  id *CNContactOrganizationNameKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactOrganizationNameKeySymbolLoc = (id *)getCNContactOrganizationNameKeySymbolLoc();
  if (CNContactOrganizationNameKeySymbolLoc)
    return *CNContactOrganizationNameKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactPhoneNumbersKey(CNContactBirthdayKey_cold_1);
}

id getCNContactPhoneNumbersKey()
{
  id *CNContactPhoneNumbersKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactPhoneNumbersKeySymbolLoc = (id *)getCNContactPhoneNumbersKeySymbolLoc();
  if (CNContactPhoneNumbersKeySymbolLoc)
    return *CNContactPhoneNumbersKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactPostalAddressesKey(CNContactBirthdayKey_cold_1);
}

id getCNContactPostalAddressesKey()
{
  id *CNContactPostalAddressesKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactPostalAddressesKeySymbolLoc = (id *)getCNContactPostalAddressesKeySymbolLoc();
  if (CNContactPostalAddressesKeySymbolLoc)
    return *CNContactPostalAddressesKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactPreviousFamilyNameKey(CNContactBirthdayKey_cold_1);
}

id getCNContactPreviousFamilyNameKey()
{
  id *CNContactPreviousFamilyNameKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactPreviousFamilyNameKeySymbolLoc = (id *)getCNContactPreviousFamilyNameKeySymbolLoc();
  if (CNContactPreviousFamilyNameKeySymbolLoc)
    return *CNContactPreviousFamilyNameKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactRelationsKey(CNContactBirthdayKey_cold_1);
}

objc_class *getCNContactRelationsKey()
{
  id *CNContactRelationsKeySymbolLoc;

  CNContactRelationsKeySymbolLoc = (id *)getCNContactRelationsKeySymbolLoc();
  if (CNContactRelationsKeySymbolLoc)
    return (objc_class *)*CNContactRelationsKeySymbolLoc;
  getCNContactBirthdayKey_cold_1();
  return getCNContactSocialProfilesKey();
}

objc_class *getCNContactSocialProfilesKey()
{
  id *CNContactSocialProfilesKeySymbolLoc;

  CNContactSocialProfilesKeySymbolLoc = (id *)getCNContactSocialProfilesKeySymbolLoc();
  if (CNContactSocialProfilesKeySymbolLoc)
    return (objc_class *)*CNContactSocialProfilesKeySymbolLoc;
  getCNContactBirthdayKey_cold_1();
  return getCNContactStoreClass();
}

objc_class *getCNContactStoreClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCNContactStoreClass_softClass;
  v6 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    ContactsLibraryCore();
    Class = objc_getClass("CNContactStore");
    v4[3] = (uint64_t)Class;
    getCNContactStoreClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC0BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCNContactTypeKey()
{
  id *CNContactTypeKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactTypeKeySymbolLoc = (id *)getCNContactTypeKeySymbolLoc();
  if (CNContactTypeKeySymbolLoc)
    return *CNContactTypeKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNContactUrlAddressesKey(CNContactBirthdayKey_cold_1);
}

id getCNContactUrlAddressesKey()
{
  id *CNContactUrlAddressesKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNContactUrlAddressesKeySymbolLoc = (id *)getCNContactUrlAddressesKeySymbolLoc();
  if (CNContactUrlAddressesKeySymbolLoc)
    return *CNContactUrlAddressesKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNFavoritesClass(CNContactBirthdayKey_cold_1);
}

objc_class *getCNFavoritesClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCNFavoritesClass_softClass;
  v6 = getCNFavoritesClass_softClass;
  if (!getCNFavoritesClass_softClass)
  {
    ContactsLibraryCore();
    Class = objc_getClass("CNFavorites");
    v4[3] = (uint64_t)Class;
    getCNFavoritesClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC0CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCNLabelContactRelationAssistant()
{
  id *CNLabelContactRelationAssistantSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNLabelContactRelationAssistantSymbolLoc = (id *)getCNLabelContactRelationAssistantSymbolLoc();
  if (CNLabelContactRelationAssistantSymbolLoc)
    return *CNLabelContactRelationAssistantSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNLabelContactRelationColleague(CNContactBirthdayKey_cold_1);
}

id getCNLabelContactRelationColleague()
{
  id *CNLabelContactRelationColleagueSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNLabelContactRelationColleagueSymbolLoc = (id *)getCNLabelContactRelationColleagueSymbolLoc();
  if (CNLabelContactRelationColleagueSymbolLoc)
    return *CNLabelContactRelationColleagueSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNLabelContactRelationFemaleFriend(CNContactBirthdayKey_cold_1);
}

id getCNLabelContactRelationFemaleFriend()
{
  id *CNLabelContactRelationFemaleFriendSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNLabelContactRelationFemaleFriendSymbolLoc = (id *)getCNLabelContactRelationFemaleFriendSymbolLoc();
  if (CNLabelContactRelationFemaleFriendSymbolLoc)
    return *CNLabelContactRelationFemaleFriendSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNLabelContactRelationFriend(CNContactBirthdayKey_cold_1);
}

id getCNLabelContactRelationFriend()
{
  id *CNLabelContactRelationFriendSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNLabelContactRelationFriendSymbolLoc = (id *)getCNLabelContactRelationFriendSymbolLoc();
  if (CNLabelContactRelationFriendSymbolLoc)
    return *CNLabelContactRelationFriendSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNLabelContactRelationMaleFriend(CNContactBirthdayKey_cold_1);
}

id getCNLabelContactRelationMaleFriend()
{
  id *CNLabelContactRelationMaleFriendSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNLabelContactRelationMaleFriendSymbolLoc = (id *)getCNLabelContactRelationMaleFriendSymbolLoc();
  if (CNLabelContactRelationMaleFriendSymbolLoc)
    return *CNLabelContactRelationMaleFriendSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNLabelContactRelationManager(CNContactBirthdayKey_cold_1);
}

id getCNLabelContactRelationManager()
{
  id *CNLabelContactRelationManagerSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CNLabelContactRelationManagerSymbolLoc = (id *)getCNLabelContactRelationManagerSymbolLoc();
  if (CNLabelContactRelationManagerSymbolLoc)
    return *CNLabelContactRelationManagerSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNLabelContactRelationTeacher(CNContactBirthdayKey_cold_1);
}

objc_class *getCNLabelContactRelationTeacher()
{
  id *CNLabelContactRelationTeacherSymbolLoc;

  CNLabelContactRelationTeacherSymbolLoc = (id *)getCNLabelContactRelationTeacherSymbolLoc();
  if (CNLabelContactRelationTeacherSymbolLoc)
    return (objc_class *)*CNLabelContactRelationTeacherSymbolLoc;
  getCNContactBirthdayKey_cold_1();
  return getCNPhoneNumberClass();
}

objc_class *getCNPhoneNumberClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCNPhoneNumberClass_softClass;
  v6 = getCNPhoneNumberClass_softClass;
  if (!getCNPhoneNumberClass_softClass)
  {
    ContactsLibraryCore();
    Class = objc_getClass("CNPhoneNumber");
    v4[3] = (uint64_t)Class;
    getCNPhoneNumberClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC0E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCSMailboxArchive()
{
  id *CSMailboxArchiveSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CSMailboxArchiveSymbolLoc = (id *)getCSMailboxArchiveSymbolLoc();
  if (CSMailboxArchiveSymbolLoc)
    return *CSMailboxArchiveSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCSMailboxInbox(CNContactBirthdayKey_cold_1);
}

id getCSMailboxInbox()
{
  id *CSMailboxInboxSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CSMailboxInboxSymbolLoc = (id *)getCSMailboxInboxSymbolLoc();
  if (CSMailboxInboxSymbolLoc)
    return *CSMailboxInboxSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCSMailboxSent(CNContactBirthdayKey_cold_1);
}

id getCSMailboxSent()
{
  id *CSMailboxSentSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  CSMailboxSentSymbolLoc = (id *)getCSMailboxSentSymbolLoc();
  if (CSMailboxSentSymbolLoc)
    return *CSMailboxSentSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getFMFSessionClass(CNContactBirthdayKey_cold_1);
}

objc_class *getFMFSessionClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getFMFSessionClass_softClass;
  v6 = getFMFSessionClass_softClass;
  if (!getFMFSessionClass_softClass)
  {
    FMFLibraryCore();
    Class = objc_getClass("FMFSession");
    v4[3] = (uint64_t)Class;
    getFMFSessionClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC0F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getHKHealthStoreClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getHKHealthStoreClass_softClass;
  v6 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    HealthKitLibraryCore();
    Class = objc_getClass("HKHealthStore");
    v4[3] = (uint64_t)Class;
    getHKHealthStoreClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC0FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getHMHomeManagerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getHMHomeManagerClass_softClass;
  v6 = getHMHomeManagerClass_softClass;
  if (!getHMHomeManagerClass_softClass)
  {
    HomeKitLibraryCore();
    Class = objc_getClass("HMHomeManager");
    v4[3] = (uint64_t)Class;
    getHMHomeManagerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getHMHomeManagerConfigurationClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getHMHomeManagerConfigurationClass_softClass;
  v6 = getHMHomeManagerConfigurationClass_softClass;
  if (!getHMHomeManagerConfigurationClass_softClass)
  {
    HomeKitLibraryCore();
    Class = objc_getClass("HMHomeManagerConfiguration");
    v4[3] = (uint64_t)Class;
    getHMHomeManagerConfigurationClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC10EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getPHFetchOptionsClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getPHFetchOptionsClass_softClass;
  v6 = getPHFetchOptionsClass_softClass;
  if (!getPHFetchOptionsClass_softClass)
  {
    PhotosLibraryCore();
    Class = objc_getClass("PHFetchOptions");
    v4[3] = (uint64_t)Class;
    getPHFetchOptionsClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getPHPersonClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getPHPersonClass_softClass;
  v6 = getPHPersonClass_softClass;
  if (!getPHPersonClass_softClass)
  {
    PhotosLibraryCore();
    Class = objc_getClass("PHPerson");
    v4[3] = (uint64_t)Class;
    getPHPersonClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getRTRoutineManagerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getRTRoutineManagerClass_softClass;
  v6 = getRTRoutineManagerClass_softClass;
  if (!getRTRoutineManagerClass_softClass)
  {
    CoreRoutineLibraryCore();
    Class = objc_getClass("RTRoutineManager");
    v4[3] = (uint64_t)Class;
    getRTRoutineManagerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC12A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getkCHCallStatusConnectedOutgoing()
{
  unsigned int *v0;

  v0 = (unsigned int *)getkCHCallStatusConnectedOutgoingSymbolLoc();
  if (v0)
    return (objc_class *)*v0;
  getCNContactBirthdayKey_cold_1();
  return get_CDContextualKeyPathClass();
}

objc_class *get_CDContextualKeyPathClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_CDContextualKeyPathClass_softClass;
  v6 = get_CDContextualKeyPathClass_softClass;
  if (!get_CDContextualKeyPathClass_softClass)
  {
    CoreDuetContextLibraryCore();
    Class = objc_getClass("_CDContextualKeyPath");
    v4[3] = (uint64_t)Class;
    get_CDContextualKeyPathClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC135C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getFAFetchFamilyCircleRequestClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getFAFetchFamilyCircleRequestClass_softClass;
  v6 = getFAFetchFamilyCircleRequestClass_softClass;
  if (!getFAFetchFamilyCircleRequestClass_softClass)
  {
    FamilyCircleLibraryCore();
    Class = objc_getClass("FAFetchFamilyCircleRequest");
    v4[3] = (uint64_t)Class;
    getFAFetchFamilyCircleRequestClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC13F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getPETEventTracker2Class()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getPETEventTracker2Class_softClass;
  v6 = getPETEventTracker2Class_softClass;
  if (!getPETEventTracker2Class_softClass)
  {
    ProactiveEventTrackerLibraryCore();
    Class = objc_getClass("PETEventTracker2");
    v4[3] = (uint64_t)Class;
    getPETEventTracker2Class_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getSTManagementStateClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getSTManagementStateClass_softClass;
  v6 = getSTManagementStateClass_softClass;
  if (!getSTManagementStateClass_softClass)
  {
    ScreenTimeCoreLibraryCore();
    Class = objc_getClass("STManagementState");
    v4[3] = (uint64_t)Class;
    getSTManagementStateClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getSpotlightReceiverConnectionUIDKey()
{
  void *SpotlightReceiverConnectionUIDKeySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  SpotlightReceiverConnectionUIDKeySymbolLoc = getSpotlightReceiverConnectionUIDKeySymbolLoc();
  if (SpotlightReceiverConnectionUIDKeySymbolLoc)
    return *(_QWORD *)SpotlightReceiverConnectionUIDKeySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getCNContactEmailAddressesKey(CNContactBirthdayKey_cold_1);
}

objc_class *getCNContactEmailAddressesKey()
{
  id *CNContactEmailAddressesKeySymbolLoc;

  CNContactEmailAddressesKeySymbolLoc = (id *)getCNContactEmailAddressesKeySymbolLoc();
  if (CNContactEmailAddressesKeySymbolLoc)
    return (objc_class *)*CNContactEmailAddressesKeySymbolLoc;
  getCNContactBirthdayKey_cold_1();
  return getBMDKEventClass();
}

objc_class *getBMDKEventClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMDKEventClass_softClass;
  v6 = getBMDKEventClass_softClass;
  if (!getBMDKEventClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMDKEvent");
    v4[3] = (uint64_t)Class;
    getBMDKEventClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC15EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getRESiriActionsDonationsWhitelistClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getRESiriActionsDonationsWhitelistClass_softClass;
  v6 = getRESiriActionsDonationsWhitelistClass_softClass;
  if (!getRESiriActionsDonationsWhitelistClass_softClass)
  {
    RelevanceEngineLibraryCore();
    Class = objc_getClass("RESiriActionsDonationsWhitelist");
    v4[3] = (uint64_t)Class;
    getRESiriActionsDonationsWhitelistClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_CDClientContextClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_CDClientContextClass_softClass;
  v6 = get_CDClientContextClass_softClass;
  if (!get_CDClientContextClass_softClass)
  {
    CoreDuetContextLibraryCore();
    Class = objc_getClass("_CDClientContext");
    v4[3] = (uint64_t)Class;
    get_CDClientContextClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_CDContextQueriesClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_CDContextQueriesClass_softClass;
  v6 = get_CDContextQueriesClass_softClass;
  if (!get_CDContextQueriesClass_softClass)
  {
    CoreDuetContextLibraryCore();
    Class = objc_getClass("_CDContextQueries");
    v4[3] = (uint64_t)Class;
    get_CDContextQueriesClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC17A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMDKEventStreamClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMDKEventStreamClass_softClass;
  v6 = getBMDKEventStreamClass_softClass;
  if (!getBMDKEventStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMDKEventStream");
    v4[3] = (uint64_t)Class;
    getBMDKEventStreamClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC183C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getAFPreferencesClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getAFPreferencesClass_softClass;
  v6 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    AssistantServicesLibraryCore();
    Class = objc_getClass("AFPreferences");
    v4[3] = (uint64_t)Class;
    getAFPreferencesClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC18D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getCSSearchableIndexClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCSSearchableIndexClass_softClass;
  v6 = getCSSearchableIndexClass_softClass;
  if (!getCSSearchableIndexClass_softClass)
  {
    CoreSpotlightLibraryCore();
    Class = objc_getClass("CSSearchableIndex");
    v4[3] = (uint64_t)Class;
    getCSSearchableIndexClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getkAFCloudStorageDeletedByUserDarwinNotification()
{
  void *v0;
  uint64_t CNContactBirthdayKey_cold_1;

  v0 = getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc();
  if (v0)
    return *(_QWORD *)v0;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getkAFCloudSyncPreferenceDidChangeDarwinNotification(CNContactBirthdayKey_cold_1);
}

uint64_t getkAFCloudSyncPreferenceDidChangeDarwinNotification()
{
  void *v0;
  uint64_t CNContactBirthdayKey_cold_1;

  v0 = getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc();
  if (v0)
    return *(_QWORD *)v0;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getkUTTypeCalendarEvent(CNContactBirthdayKey_cold_1);
}

uint64_t getkUTTypeCalendarEvent()
{
  void *v0;
  uint64_t CNContactBirthdayKey_cold_1;

  v0 = getkUTTypeCalendarEventSymbolLoc();
  if (v0)
    return *(_QWORD *)v0;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getkUTTypeEmailMessage(CNContactBirthdayKey_cold_1);
}

uint64_t getkUTTypeEmailMessage()
{
  void *v0;
  uint64_t CNContactBirthdayKey_cold_1;

  v0 = getkUTTypeEmailMessageSymbolLoc();
  if (v0)
    return *(_QWORD *)v0;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getkUTTypeMessage(CNContactBirthdayKey_cold_1);
}

objc_class *getkUTTypeMessage()
{
  void *v0;

  v0 = getkUTTypeMessageSymbolLoc();
  if (v0)
    return *(objc_class **)v0;
  getCNContactBirthdayKey_cold_1();
  return getPETDistributionEventTrackerClass();
}

objc_class *getPETDistributionEventTrackerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getPETDistributionEventTrackerClass_softClass;
  v6 = getPETDistributionEventTrackerClass_softClass;
  if (!getPETDistributionEventTrackerClass_softClass)
  {
    ProactiveEventTrackerLibraryCore();
    Class = objc_getClass("PETDistributionEventTracker");
    v4[3] = (uint64_t)Class;
    getPETDistributionEventTrackerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getPETEventPropertyClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getPETEventPropertyClass_softClass;
  v6 = getPETEventPropertyClass_softClass;
  if (!getPETEventPropertyClass_softClass)
  {
    ProactiveEventTrackerLibraryCore();
    Class = objc_getClass("PETEventProperty");
    v4[3] = (uint64_t)Class;
    getPETEventPropertyClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getPETScalarEventTrackerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getPETScalarEventTrackerClass_softClass;
  v6 = getPETScalarEventTrackerClass_softClass;
  if (!getPETScalarEventTrackerClass_softClass)
  {
    ProactiveEventTrackerLibraryCore();
    Class = objc_getClass("PETScalarEventTracker");
    v4[3] = (uint64_t)Class;
    getPETScalarEventTrackerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSCNAutocompleteFeedbackClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSCNAutocompleteFeedbackClass_softClass;
  v6 = get_PSCNAutocompleteFeedbackClass_softClass;
  if (!get_PSCNAutocompleteFeedbackClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSCNAutocompleteFeedback");
    v4[3] = (uint64_t)Class;
    get_PSCNAutocompleteFeedbackClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSAttachmentClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSAttachmentClass_softClass;
  v6 = get_PSAttachmentClass_softClass;
  if (!get_PSAttachmentClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSAttachment");
    v4[3] = (uint64_t)Class;
    get_PSAttachmentClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSAutocompleteSuggestionClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSAutocompleteSuggestionClass_softClass;
  v6 = get_PSAutocompleteSuggestionClass_softClass;
  if (!get_PSAutocompleteSuggestionClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSAutocompleteSuggestion");
    v4[3] = (uint64_t)Class;
    get_PSAutocompleteSuggestionClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSContactSuggesterClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSContactSuggesterClass_softClass;
  v6 = get_PSContactSuggesterClass_softClass;
  if (!get_PSContactSuggesterClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSContactSuggester");
    v4[3] = (uint64_t)Class;
    get_PSContactSuggesterClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSContactSuggestionClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSContactSuggestionClass_softClass;
  v6 = get_PSContactSuggestionClass_softClass;
  if (!get_PSContactSuggestionClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSContactSuggestion");
    v4[3] = (uint64_t)Class;
    get_PSContactSuggestionClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSContactSuggestionHandleAndAppClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSContactSuggestionHandleAndAppClass_softClass;
  v6 = get_PSContactSuggestionHandleAndAppClass_softClass;
  if (!get_PSContactSuggestionHandleAndAppClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSContactSuggestionHandleAndApp");
    v4[3] = (uint64_t)Class;
    get_PSContactSuggestionHandleAndAppClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSFeedbackClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSFeedbackClass_softClass;
  v6 = get_PSFeedbackClass_softClass;
  if (!get_PSFeedbackClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSFeedback");
    v4[3] = (uint64_t)Class;
    get_PSFeedbackClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC1FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSMapsPredictionContextClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSMapsPredictionContextClass_softClass;
  v6 = get_PSMapsPredictionContextClass_softClass;
  if (!get_PSMapsPredictionContextClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSMapsPredictionContext");
    v4[3] = (uint64_t)Class;
    get_PSMapsPredictionContextClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC2060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSMessagesPinningFeedbackClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSMessagesPinningFeedbackClass_softClass;
  v6 = get_PSMessagesPinningFeedbackClass_softClass;
  if (!get_PSMessagesPinningFeedbackClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSMessagesPinningFeedback");
    v4[3] = (uint64_t)Class;
    get_PSMessagesPinningFeedbackClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC20F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSPredictionContextClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSPredictionContextClass_softClass;
  v6 = get_PSPredictionContextClass_softClass;
  if (!get_PSPredictionContextClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSPredictionContext");
    v4[3] = (uint64_t)Class;
    get_PSPredictionContextClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC2188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSRecipientClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSRecipientClass_softClass;
  v6 = get_PSRecipientClass_softClass;
  if (!get_PSRecipientClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSRecipient");
    v4[3] = (uint64_t)Class;
    get_PSRecipientClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC221C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSSiriHandleRankerPredictionContextClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSSiriHandleRankerPredictionContextClass_softClass;
  v6 = get_PSSiriHandleRankerPredictionContextClass_softClass;
  if (!get_PSSiriHandleRankerPredictionContextClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSSiriHandleRankerPredictionContext");
    v4[3] = (uint64_t)Class;
    get_PSSiriHandleRankerPredictionContextClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC22B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSSuggesterClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSSuggesterClass_softClass;
  v6 = get_PSSuggesterClass_softClass;
  if (!get_PSSuggesterClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSSuggester");
    v4[3] = (uint64_t)Class;
    get_PSSuggesterClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC2344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSSuggesterConfigurationClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSSuggesterConfigurationClass_softClass;
  v6 = get_PSSuggesterConfigurationClass_softClass;
  if (!get_PSSuggesterConfigurationClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSSuggesterConfiguration");
    v4[3] = (uint64_t)Class;
    get_PSSuggesterConfigurationClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC23D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSSuggestionClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSSuggestionClass_softClass;
  v6 = get_PSSuggestionClass_softClass;
  if (!get_PSSuggestionClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSSuggestion");
    v4[3] = (uint64_t)Class;
    get_PSSuggestionClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDC246C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void _cdcontextstore_signpost_set_object_begin(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      _CDCurrentOrXPCProcessName();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138543618;
      v5 = v3;
      v6 = 2114;
      v7 = v1;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetKeyPath", " Process=%{signpost.telemetry:string1,public}@  KeyPath=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v4, 0x16u);

    }
  }

}

void _cdcontextstore_signpost_evaluateCallback_begin(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v6 = 138543618;
      v7 = v3;
      v8 = 2114;
      v9 = v4;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EvaluateCallback", " RegistrationID=%{signpost.telemetry:string1,public}@  KeyPath=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);
    }

  }
}

void sub_18DDC37A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDC3CA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDC49F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  objc_sync_exit(obj);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_18DDC4D54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
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

void __Block_byref_object_dispose__10(uint64_t a1)
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

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void __Block_byref_object_dispose__29(uint64_t a1)
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

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
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

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
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

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void _cdcontextstore_signpost_evaluateCallback_end()
{
  NSObject *v0;
  uint8_t v1[16];

  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EvaluateCallback", (const char *)&unk_18DF6D5CF, v1, 2u);
    }

  }
}

void _cdcontextstore_signpost_set_object_end()
{
  NSObject *v0;
  uint8_t v1[16];

  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetKeyPath", (const char *)&unk_18DF6D5CF, v1, 2u);
    }

  }
}

void sub_18DDC7894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18DDC87F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void _cdknowledge_signpost_query_end(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    v5 = 134349312;
    v6 = a1;
    v7 = 2050;
    v8 = a2;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExecuteQuery", " ResultCount=%{signpost.telemetry:number1,public}lu  ErrorCode=%{signpost.telemetry:number2,public}ld  enableTelemetry=YES ", (uint8_t *)&v5, 0x16u);
  }

}

__CFString *_streamNameFromStreams(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v1 = a1;
  v2 = v1;
  if (v1
    && objc_msgSend(v1, "count")
    && (objc_msgSend(v2, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "name"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    if (objc_msgSend(v2, "count") == 1)
    {
      objc_msgSend(v2, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = CFSTR("multiple");
    }
  }
  else
  {
    v6 = CFSTR("unknown");
  }

  return v6;
}

void _cdknowledge_signpost_query_begin(void *a1)
{
  id v1;
  int has_internal_diagnostics;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_enabled(v3);
  if (has_internal_diagnostics)
  {
    if (v4)
    {
      _CDCurrentOrXPCProcessName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v1;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExecuteQuery", " Process=%{signpost.telemetry:string1,public}@  Stream=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);

    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExecuteQuery", (const char *)&unk_18DF6D5CF, (uint8_t *)&v6, 2u);
  }

}

void sub_18DDC97E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  os_unfair_lock_s *v18;

  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v18);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_18DDC9C6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(lock);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t get_memory_usage(_QWORD *a1, _QWORD *a2, _QWORD *a3, char a4)
{
  uint64_t result;
  uint64_t v9;
  _OWORD v10[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  memset(v10, 0, sizeof(v10));
  result = getpid();
  if (a1 || a2 || a3)
  {
    result = proc_pid_rusage(result, 4, (rusage_info_t *)v10);
    if (a1)
      *a1 = *((_QWORD *)&v11 + 1);
    if (a2)
    {
      v9 = *((_QWORD *)&v24 + 1);
      if (!*((_QWORD *)&v24 + 1))
        v9 = *((_QWORD *)&v11 + 1);
      *a2 = v9;
    }
    if (a3)
      *a3 = v22;
  }
  if ((a4 & 1) != 0)
    return proc_reset_footprint_interval();
  return result;
}

void sub_18DDC9FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18DDCA3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

void _cdknowledge_signpost_delete_end(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    v5 = 134349312;
    v6 = a1;
    v7 = 2050;
    v8 = a2;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeleteObjects", " DeleteCount=%{signpost.telemetry:number1,public}lu  ErrorCode=%{signpost.telemetry:number2,public}ld ", (uint8_t *)&v5, 0x16u);
  }

}

void _cdknowledge_signpost_delete_begin(void *a1)
{
  id v1;
  int has_internal_diagnostics;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_enabled(v3);
  if (has_internal_diagnostics)
  {
    if (v4)
    {
      _CDCurrentOrXPCProcessName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v1;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeleteObjects", " Process=%{signpost.telemetry:string1,public}@  Entity=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);

    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeleteObjects", (const char *)&unk_18DF6D5CF, (uint8_t *)&v6, 2u);
  }

}

void sub_18DDCA96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t _DKQueryLoggingEnabled()
{
  unsigned int has_internal_diagnostics;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (has_internal_diagnostics && _DKQueryLoggingEnabled_onceToken != -1)
    dispatch_once(&_DKQueryLoggingEnabled_onceToken, &__block_literal_global_70);
  if (_DKQueryLoggingEnabled_disableQueryLogging)
    return 0;
  else
    return has_internal_diagnostics;
}

void sub_18DDCACAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _cdknowledge_signpost_save_begin(void *a1, void *a2)
{
  id v3;
  int has_internal_diagnostics;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_enabled(v5);
  if (has_internal_diagnostics)
  {
    if (v6)
    {
      _CDCurrentOrXPCProcessName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      v12 = 2050;
      v13 = a1;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SaveObjects", " Process=%{signpost.telemetry:string1,public}@  Stream=%{signpost.telemetry:string2,public}@  SaveCount=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", (uint8_t *)&v8, 0x20u);

    }
  }
  else if (v6)
  {
    v8 = 134349056;
    v9 = a1;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SaveObjects", " SaveCount=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", (uint8_t *)&v8, 0xCu);
  }

}

void sub_18DDCBABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DDCBEA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDCC108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDCC300(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void legacy_log_signpost(void *a1, int a2)
{
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = 96;
    if (a2)
      v5 = 16;
    v6 = 24;
    if (a2)
      v6 = 8;
    v7 = (double)*(unint64_t *)&v3[v6] * 0.0009765625 * 0.0009765625;
    v8 = (double)*(unint64_t *)&v3[v5] * 0.0009765625 * 0.0009765625;
  }
  else
  {
    v8 = 0.0;
    v7 = 0.0;
  }
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
      v12 = CFSTR("Begin");
    else
      v12 = CFSTR("End");
    objc_msgSend(v10, "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v13;
    v16 = 2050;
    v17 = v7;
    v18 = 2050;
    v19 = v8;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Footprint", "Name=%{signpost.telemetry:string1,public}@ Footprint=%{signpost.telemetry:number1,public}.2fMB MaxFootprint=%{signpost.telemetry:number2,public}.2fMB  enableTelemetry=YES ", (uint8_t *)&v14, 0x20u);

  }
}

void _cdknowledge_signpost_save_end(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    v3 = 134349056;
    v4 = a1;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SaveObjects", " ErrorCode=%{signpost.telemetry:number2,public}ld ", (uint8_t *)&v3, 0xCu);
  }

}

void sub_18DDCDCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Unwind_Resume(a1);
}

void sub_18DDCE120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18DDCF280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DDCFA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18DDCFF34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDD018C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDD0A7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDD0C28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDD0CB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDD10C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DDD1B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18DDD3544(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  _BOOL4 v7;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    objc_msgSend(*(id *)(v2 + 40), "persistentStoreCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentStores");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") == 0;

    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v6)
    {
      if (v7)
        __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_1();

      objc_end_catch();
      JUMPOUT(0x18DDD3504);
    }
    if (v7)
      __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_2();
    objc_exception_throw(objc_retainAutorelease(v3));
  }
  _Unwind_Resume(exception_object);
}

void setClassesForCDInteractionXPCInterface(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;

  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = a1;
  v3 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)MEMORY[0x1E0C99E60];
  v48 = (void *)v4;
  v44 = objc_opt_class();
  v42 = objc_opt_class();
  v40 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v44, v42, v40, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0C99E60];
  v45 = objc_opt_class();
  v43 = objc_opt_class();
  v41 = objc_opt_class();
  v39 = objc_opt_class();
  v38 = objc_opt_class();
  v37 = objc_opt_class();
  v36 = objc_opt_class();
  v35 = objc_opt_class();
  v34 = objc_opt_class();
  v33 = objc_opt_class();
  get_PSSuggestionClass();
  v32 = objc_opt_class();
  get_PSPredictionContextClass();
  v31 = objc_opt_class();
  get_PSAttachmentClass();
  v30 = objc_opt_class();
  get_PSSuggesterClass();
  v29 = objc_opt_class();
  get_PSFeedbackClass();
  v28 = objc_opt_class();
  get_PSRecipientClass();
  v27 = objc_opt_class();
  get_PSSuggesterConfigurationClass();
  v26 = objc_opt_class();
  get_PSMapsPredictionContextClass();
  v15 = objc_opt_class();
  get_PSAutocompleteSuggestionClass();
  v16 = objc_opt_class();
  get_PSSiriHandleRankerPredictionContextClass();
  v17 = objc_opt_class();
  get_PSMessagesPinningFeedbackClass();
  v18 = objc_opt_class();
  get_PSContactSuggestionHandleAndAppClass();
  v19 = objc_opt_class();
  get_PSContactSuggestionClass();
  v20 = objc_opt_class();
  get_PSContactSuggesterClass();
  v21 = objc_opt_class();
  get_PSCNAutocompleteFeedbackClass();
  v22 = objc_opt_class();
  get_PSCandidateClass();
  objc_msgSend(v47, "setWithObjects:", v45, v43, v41, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    objc_opt_class(),
    0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_recordInteractions_enforceDataLimits_enforcePrivacy_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_updateInteractions_enforceDataLimits_enforcePrivacy_reply_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_queryInteractionsUsingPredicate_sortDescriptors_limit_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_queryInteractionsUsingPredicate_sortDescriptors_limit_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_queryInteractionsUsingPredicate_sortDescriptors_limit_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_queryContactsUsingPredicate_sortDescriptors_limit_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_queryContactsUsingPredicate_sortDescriptors_limit_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_queryContactsUsingPredicate_sortDescriptors_limit_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_deleteInteractionsMatchingPredicate_sortDescriptors_limit_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_deleteInteractionsMatchingPredicate_sortDescriptors_limit_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_rankCandidateContacts_usingSettings_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_rankCandidateContacts_usingSettings_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_rankCandidateContacts_usingSettings_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseInteractionsUsingSettings_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseInteractionsForDate_usingSettings_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseInteractionsForKeywordsInString_usingSettings_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_, 3, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseInteractionsUsingSettings_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseInteractionsForDate_usingSettings_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseInteractionsForKeywordsInString_usingSettings_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_suggestInteractionsFromContext_maxSuggestions_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_suggestInteractionsFromContext_maxSuggestions_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_suggestInteractionsFromContext_maxSuggestions_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_shareExtensionSuggestionsFromContext_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_shareExtensionSuggestionsFromContext_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_mapsSuggestionsFromContext_maxSuggestions_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_mapsSuggestionsFromContext_maxSuggestions_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_mapsSuggestionsFromContext_maxSuggestions_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_zkwSuggestionsFromContext_maxSuggestions_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_zkwSuggestionsFromContext_maxSuggestions_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_zkwSuggestionsFromContext_maxSuggestions_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_computeShareSheetEphemeralFeaturesWithPredictionContext_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_computeShareSheetEphemeralFeaturesWithPredictionContext_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_validateCoreMLScoringModelWithRawInput_predictionContext_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_validateCoreMLScoringModelWithRawInput_predictionContext_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_validateCoreMLScoringModelWithRawInput_predictionContext_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_provideFeedbackForContactsAutocompleteSuggestions_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_reply_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_reply_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedNameSuggestionsFromContext_name_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedNameSuggestionsFromContext_name_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedNameSuggestionsFromContext_name_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedAutocompleteSuggestionsFromContext_candidates_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedAutocompleteSuggestionsFromContext_candidates_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedAutocompleteSuggestionsFromContext_candidates_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedMessagesPinsWithMaxSuggestions_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedMessagesPinsWithMaxSuggestions_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_provideMessagesPinningFeedback_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedFamilySuggestionsWithReply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_familyRecommendedSuggestionsWithPredictionContext_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_photosContactInferencesSuggestionsWithPredictionContext_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_photosRelationshipSuggestionsWithPredictionContext_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedSiriMLCRHandlesFromContext_handles_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedSiriMLCRHandlesFromContext_handles_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedSiriMLCRHandlesFromContext_handles_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedHandlesFromCandidateHandles_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_rankedHandlesFromCandidateHandles_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_contactSuggestionsWithMaxSuggestions_excludedContactIds_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_contactSuggestionsWithMaxSuggestions_excludedContactIds_reply_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_contactSuggestionsWithMaxSuggestions_excludedContactIds_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_autocompleteSearchResultsWithPredictionContext_reply_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_autocompleteSearchResultsWithPredictionContext_reply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_tuneSocialAdvisorUsingSettings_heartBeatHandler_reply_, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE109B08);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v25, sel_tuneSocialAdvisorUsingSettings_heartBeatHandler_reply_, 1, 0);

}

uint64_t PeopleSuggesterLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PeopleSuggesterLibraryCore_frameworkLibrary;
  v6 = PeopleSuggesterLibraryCore_frameworkLibrary;
  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E56D8;
    v8 = *(_OWORD *)&off_1E26E56E8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PeopleSuggesterLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DDD481C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *get_PSCandidateClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)get_PSCandidateClass_softClass;
  v6 = get_PSCandidateClass_softClass;
  if (!get_PSCandidateClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    Class = objc_getClass("_PSCandidate");
    v4[3] = (uint64_t)Class;
    get_PSCandidateClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DDD48B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_18DDD4B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *slADClientAddValueForScalarKey(uint64_t a1, uint64_t a2)
{
  uint64_t (*ADClientAddValueForScalarKeySymbolLoc)(uint64_t, uint64_t);

  ADClientAddValueForScalarKeySymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getADClientAddValueForScalarKeySymbolLoc();
  if (ADClientAddValueForScalarKeySymbolLoc)
    return (void *)ADClientAddValueForScalarKeySymbolLoc(a1, a2);
  getCNContactBirthdayKey_cold_1();
  return getADClientAddValueForScalarKeySymbolLoc();
}

void *getADClientAddValueForScalarKeySymbolLoc()
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
  v0 = (void *)getADClientAddValueForScalarKeySymbolLoc_ptr;
  v6 = getADClientAddValueForScalarKeySymbolLoc_ptr;
  if (!getADClientAddValueForScalarKeySymbolLoc_ptr)
  {
    v1 = (void *)AggregateDictionaryLibrary();
    v0 = dlsym(v1, "ADClientAddValueForScalarKey");
    v4[3] = (uint64_t)v0;
    getADClientAddValueForScalarKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DDD5E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_18DDD6240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18DDD6414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DDD6860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DDD6AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DDD748C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_18DDD897C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id _CDInteractionNSXPCInterface()
{
  if (_CDInteractionNSXPCInterface_onceToken != -1)
    dispatch_once(&_CDInteractionNSXPCInterface_onceToken, &__block_literal_global_35);
  return (id)_CDInteractionNSXPCInterface_interface;
}

id _DKDaemonInterface()
{
  if (_DKDaemonInterface_onceToken != -1)
    dispatch_once(&_DKDaemonInterface_onceToken, &__block_literal_global_60);
  return (id)_DKDaemonInterface_interface;
}

id _CDCurrentOrXPCProcessName()
{
  void *v0;
  void *v1;
  int v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char buffer[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v2 = objc_msgSend(v0, "processIdentifier");
    bzero(buffer, 0x400uLL);
    v3 = proc_pidpath(v2, buffer, 0x400u);
    if ((v3 & 0x80000000) == 0)
      buffer[v3] = 0;
    v4 = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], buffer, 0x8000100u);
    if (!objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_9:

  return v6;
}

void sub_18DDDE718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _cdcontextstore_signpost_deregister_end()
{
  NSObject *v0;
  uint8_t v1[16];

  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeRegisterKeyPath", (const char *)&unk_18DF6D5CF, v1, 2u);
    }

  }
}

void _cdcontextstore_signpost_deregister_begin(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      _CDCurrentOrXPCProcessName();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138543618;
      v5 = v3;
      v6 = 2114;
      v7 = v1;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeRegisterKeyPath", " Process=%{signpost.telemetry:string1,public}@  RegistrationID=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v4, 0x16u);

    }
  }

}

void CDPerfMetricStartTiming(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    *a1 = v2;

  }
}

void CDPerfMetricEndTimingAndSetResultCountMaybeIncrementErrorCount(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  if (a1)
  {
    if (a2)
    {
      v7 = (void *)MEMORY[0x1E0C99D68];
      v8 = a1;
      objc_msgSend(v7, "date");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      *(_QWORD *)(a2 + 8) = v9;
      objc_msgSend(v8, "endTimingWithEvent:resultCount:incrementErrorCount:", a2, a3, a4);

    }
  }
}

void CDPerfMetricEndTimingAndSetResultCount(void *a1, uint64_t a2, uint64_t a3)
{
  CDPerfMetricEndTimingAndSetResultCountMaybeIncrementErrorCount(a1, a2, a3, 0);
}

void _CDCollectDonationMetricsForEventsInDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __objc2_class *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.coreduet.spotlightreceiver"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.donations"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", v6, v7);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("relevantShortcuts")))
        {
          objc_msgSend(v12, "metadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = _DKRelevantShortcutMetadataKey;
LABEL_10:
          -[__objc2_class serializedKeyImage](v14, "serializedKeyImage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("intents")))
        {
          objc_msgSend(v12, "metadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = _DKIntentMetadataKey;
          goto LABEL_10;
        }
        v16 = 0;
LABEL_12:
        if (v16)
          v17 = 1.0;
        else
          v17 = 0.0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.donationHasImage"), v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDDiagnosticDataReporter pushValue:forDistributionKey:](_CDDiagnosticDataReporter, "pushValue:forDistributionKey:", v18, v17);

        if (v16)
        {
          v19 = (double)(unint64_t)objc_msgSend(v16, "length");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.averageImageBytes"), v5);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[_CDDiagnosticDataReporter pushValue:forDistributionKey:](_CDDiagnosticDataReporter, "pushValue:forDistributionKey:", v20, v19);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

}

void *slADClientPushValueForDistributionKey(uint64_t a1, double a2)
{
  uint64_t (*ADClientPushValueForDistributionKeySymbolLoc)(uint64_t, double);

  ADClientPushValueForDistributionKeySymbolLoc = (uint64_t (*)(uint64_t, double))getADClientPushValueForDistributionKeySymbolLoc();
  if (ADClientPushValueForDistributionKeySymbolLoc)
    return (void *)ADClientPushValueForDistributionKeySymbolLoc(a1, a2);
  getCNContactBirthdayKey_cold_1();
  return getADClientPushValueForDistributionKeySymbolLoc();
}

void *getADClientPushValueForDistributionKeySymbolLoc()
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
  v0 = (void *)getADClientPushValueForDistributionKeySymbolLoc_ptr;
  v6 = getADClientPushValueForDistributionKeySymbolLoc_ptr;
  if (!getADClientPushValueForDistributionKeySymbolLoc_ptr)
  {
    v1 = (void *)AggregateDictionaryLibrary();
    v0 = dlsym(v1, "ADClientPushValueForDistributionKey");
    v4[3] = (uint64_t)v0;
    getADClientPushValueForDistributionKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DDE1170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getSpotlightReceiverConnectionUIDKeySymbolLoc()
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
  v0 = (void *)getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr;
  v6 = getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr;
  if (!getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr)
  {
    v1 = (void *)SpotlightReceiverLibrary();
    v0 = dlsym(v1, "SpotlightReceiverConnectionUIDKey");
    v4[3] = (uint64_t)v0;
    getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DDE1200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 304), "transportType");
}

void OUTLINED_FUNCTION_4_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x3Eu);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  return *(_QWORD *)a1;
}

id OUTLINED_FUNCTION_3_4(void *a1, const char *a2)
{
  return objc_getProperty(a1, a2, 24, 1);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 304), "transportType");
}

uint64_t OUTLINED_FUNCTION_3_8(void *a1, const char *a2)
{
  return objc_msgSend(a1, "objectClass");
}

uint64_t OUTLINED_FUNCTION_14()
{
  void *v0;

  return objc_msgSend(v0, "me");
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void sub_18DDE1FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_18DDE22D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDE3C04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDE3FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_18DDE44F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDE47D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDE4948(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDE49C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDE4A38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDE4AA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDE5958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_18DDE5AA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CloudFamilyAnalysisPETCloudFamilyAnalysisEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  CloudFamilyAnalysisPETContactEvents *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_23;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_23:
        v20 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_38;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 8) = v23;
        goto LABEL_38;
      case 4u:
        v27 = objc_alloc_init(CloudFamilyAnalysisPETContactEvents);
        objc_storeStrong((id *)(a1 + 24), v27);
        if (PBReaderPlaceMark() && (CloudFamilyAnalysisPETContactEventsReadFrom(v27, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_38;
    }
  }
}

uint64_t _CDStartDateCompare(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);
  if (!v7)
  {
    objc_msgSend(v3, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);
    if (!v7)
    {
      objc_msgSend(v3, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "compare:", v11);

    }
  }

  return v7;
}

uint64_t kCDStartDateReverseComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _CDStartDateCompare(a3, a2);
}

void sub_18DDE938C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DDE994C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CDNormalizedStringFromQueryString(void *a1)
{
  void *v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  id v13;
  int v14;
  id v15;
  int v16;
  unint64_t v17;
  id v18;
  int v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  unint64_t v28;
  int v29;
  unsigned int v30;
  id v31;
  id v32;
  int v33;
  id v34;
  id v35;
  id v36;
  int v37;
  BOOL v38;
  id v39;
  int v40;
  id v41;
  int v42;
  id v43;
  int v44;
  id v45;
  int v46;
  unsigned int v47;
  int v48;
  id v49;
  int v50;
  id v51;
  int v52;
  unsigned int v53;
  id v54;
  int v55;
  id v56;
  int v57;
  id v58;
  int v59;
  id v60;
  int v61;
  unsigned int v62;
  int v63;
  unint64_t v64;
  id v65;
  int v66;
  id v67;
  int v68;
  id v69;
  int v70;
  unsigned int v71;
  int v72;
  id v73;
  void *v74;
  unint64_t v75;
  int v76;
  id v77;
  id v78;
  id v79;
  int v80;
  id v81;
  int v82;
  __CFString *v83;
  void *v84;
  id v85;
  int v86;
  id v87;
  unsigned __int8 v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  __CFString *v93;
  void *v94;
  void *v95;
  void *v97;
  unsigned __int8 v98;
  unsigned __int8 v99;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length");
  v3 = objc_opt_new();
  v4 = (void *)v3;
  if (!v2)
    goto LABEL_186;
  v5 = 0;
  v6 = 0;
  v7 = 1;
  v97 = (void *)v3;
  while (2)
  {
    switch(v7)
    {
      case 1:
        v8 = v1;
        v9 = v8;
        v99 = 0;
        if ((v6 & 0x80000000) != 0)
        {

          v34 = v9;
          goto LABEL_116;
        }
        if (objc_msgSend(v8, "length") <= (unint64_t)v6)
        {

        }
        else
        {
          objc_msgSend(v9, "getBytes:range:", &v99, v6, 1);
          v10 = v99;

          if (v10 != 67)
            goto LABEL_65;
          v11 = v9;
          v99 = 0;
          if (objc_msgSend(v11, "length") <= (unint64_t)(v6 + 1))
            goto LABEL_64;
          objc_msgSend(v11, "getBytes:range:", &v99, v6 + 1, 1);
          v12 = v99;

          if (v12 != 65)
            goto LABEL_65;
          v13 = v11;
          v99 = 0;
          if (objc_msgSend(v13, "length") <= (unint64_t)(v6 + 2))
            goto LABEL_64;
          objc_msgSend(v13, "getBytes:range:", &v99, v6 + 2, 1);
          v14 = v99;

          if (v14 != 83)
            goto LABEL_65;
          v15 = v13;
          v99 = 0;
          if (objc_msgSend(v15, "length") <= (unint64_t)(v6 + 3))
            goto LABEL_64;
          objc_msgSend(v15, "getBytes:range:", &v99);
          v16 = v99;

          if (v16 != 84)
            goto LABEL_65;
          v17 = v6 + 4;
          v18 = v15;
          v99 = 0;
          if (objc_msgSend(v18, "length") <= v17)
          {
LABEL_64:

          }
          else
          {
            objc_msgSend(v18, "getBytes:range:", &v99, v6 + 4, 1);
            v19 = v99;

            if (v19 == 40)
            {
              v4 = v97;
              if (!v5)
              {
                v99 = 63;
                objc_msgSend(v97, "appendBytes:length:", &v99, 1);
              }
              ++v5;
              if (v2 <= v17)
                v6 = v2;
              else
                v6 += 4;
              v7 = 2;
              goto LABEL_156;
            }
          }
        }
LABEL_65:
        v39 = v9;
        v99 = 0;
        if (objc_msgSend(v9, "length") <= (unint64_t)v6)
        {

LABEL_71:
          v41 = v9;
          v4 = v97;
          v99 = 0;
          if (objc_msgSend(v9, "length") <= (unint64_t)v6)
          {

            goto LABEL_79;
          }
          objc_msgSend(v9, "getBytes:range:", &v99, v6, 1);
          v42 = v99;

          if (v42 != 32)
            goto LABEL_79;
          v43 = v9;
          v99 = 0;
          if (objc_msgSend(v43, "length") <= (unint64_t)(v6 + 1))
          {

            goto LABEL_79;
          }
          objc_msgSend(v43, "getBytes:range:", &v99, v6 + 1, 1);
          v44 = v99;

          if (v44 != 45)
            goto LABEL_79;
          v45 = v43;
          v99 = 0;
          if (objc_msgSend(v45, "length") <= (unint64_t)(v6 + 2))
          {

            v47 = 0;
          }
          else
          {
            objc_msgSend(v45, "getBytes:range:", &v99, v6 + 2, 1);
            v46 = (char)v99;

            v47 = v46;
            if (v46 < 0)
            {
              v48 = __maskrune(v46, 0x400uLL);
LABEL_105:
              if (v48)
                goto LABEL_161;
LABEL_79:
              v49 = v9;
              v99 = 0;
              if (objc_msgSend(v9, "length") <= (unint64_t)v6)
              {

                goto LABEL_86;
              }
              objc_msgSend(v9, "getBytes:range:", &v99, v6, 1);
              v50 = v99;

              if (v50 != 32)
                goto LABEL_86;
              v51 = v9;
              v99 = 0;
              if (objc_msgSend(v51, "length") <= (unint64_t)(v6 + 1))
              {

                v53 = 0;
              }
              else
              {
                objc_msgSend(v51, "getBytes:range:", &v99, v6 + 1, 1);
                v52 = (char)v99;

                v53 = v52;
                if (v52 < 0)
                {
                  if (__maskrune(v52, 0x400uLL))
                    goto LABEL_100;
                  goto LABEL_86;
                }
              }
              if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v53 + 60) & 0x400) != 0)
              {
LABEL_100:
                v99 = 32;
                objc_msgSend(v97, "appendBytes:length:", &v99, 1);
                if (!v5)
                {
                  v99 = 63;
                  objc_msgSend(v97, "appendBytes:length:", &v99, 1);
                }
                ++v5;
                v64 = v6 + 2;
LABEL_164:
                if (v2 <= v64)
                  v6 = v2;
                else
                  v6 = v64;
LABEL_47:
                v7 = 4;
                goto LABEL_156;
              }
LABEL_86:
              v54 = v9;
              v99 = 0;
              if (objc_msgSend(v9, "length") <= (unint64_t)v6)
              {

                goto LABEL_109;
              }
              objc_msgSend(v9, "getBytes:range:", &v99, v6, 1);
              v55 = v99;

              if (v55 == 32)
              {
                v56 = v9;
                v99 = 0;
                if (objc_msgSend(v56, "length") > (unint64_t)(v6 + 1))
                {
                  objc_msgSend(v56, "getBytes:range:", &v99, v6 + 1, 1);
                  v57 = v99;

                  if (v57 != 45)
                    goto LABEL_109;
                  v58 = v56;
                  v99 = 0;
                  if (objc_msgSend(v58, "length") > (unint64_t)(v6 + 2))
                  {
                    objc_msgSend(v58, "getBytes:range:", &v99, v6 + 2, 1);
                    v59 = v99;

                    v4 = v97;
                    if (v59 != 46)
                      goto LABEL_109;
                    v60 = v58;
                    v99 = 0;
                    if (objc_msgSend(v60, "length") <= (unint64_t)(v6 + 3))
                    {

                      v62 = 0;
                    }
                    else
                    {
                      objc_msgSend(v60, "getBytes:range:", &v99, v6 + 3, 1);
                      v61 = (char)v99;

                      v62 = v61;
                      if (v61 < 0)
                      {
                        v63 = __maskrune(v61, 0x400uLL);
                        v4 = v97;
LABEL_169:
                        if (v63)
                        {
                          v99 = 32;
                          objc_msgSend(v4, "appendBytes:length:", &v99, 1);
                          if (!v5)
                          {
                            v99 = 63;
                            objc_msgSend(v4, "appendBytes:length:", &v99, 1);
                          }
                          ++v5;
                          v64 = v6 + 4;
                          goto LABEL_164;
                        }
                        goto LABEL_109;
                      }
                    }
                    v4 = v97;
                    v63 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v62 + 60) & 0x400;
                    goto LABEL_169;
                  }
                  v4 = v97;
                }

              }
LABEL_109:
              v65 = v9;
              v99 = 0;
              if (objc_msgSend(v9, "length") > (unint64_t)v6)
              {
                objc_msgSend(v9, "getBytes:range:", &v99, v6, 1);
                v66 = v99;

                if (v66 != 32)
                  goto LABEL_117;
                v67 = v9;
                v99 = 0;
                if (objc_msgSend(v67, "length") > (unint64_t)(v6 + 1))
                {
                  objc_msgSend(v67, "getBytes:range:", &v99, v6 + 1, 1);
                  v68 = v99;

                  if (v68 != 46)
                    goto LABEL_117;
                  v69 = v67;
                  v99 = 0;
                  if (objc_msgSend(v69, "length") <= (unint64_t)(v6 + 2))
                  {

                    v71 = 0;
                  }
                  else
                  {
                    objc_msgSend(v69, "getBytes:range:", &v99, v6 + 2, 1);
                    v70 = (char)v99;

                    v71 = v70;
                    if (v70 < 0)
                    {
                      v72 = __maskrune(v70, 0x400uLL);
                      goto LABEL_160;
                    }
                  }
                  v72 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v71 + 60) & 0x400;
LABEL_160:
                  if (v72)
                  {
LABEL_161:
                    v99 = 32;
                    objc_msgSend(v4, "appendBytes:length:", &v99, 1);
                    if (!v5)
                    {
                      v99 = 63;
                      objc_msgSend(v4, "appendBytes:length:", &v99, 1);
                    }
                    ++v5;
                    v64 = v6 + 3;
                    goto LABEL_164;
                  }
LABEL_117:
                  if ((int)v5 < 1)
                  {
                    v98 = 0;
                    v77 = v9;
                    v99 = 0;
                    if ((v6 & 0x80000000) != 0)
                      goto LABEL_151;
                    v75 = v6;
LABEL_149:
                    if (objc_msgSend(v9, "length") > v75)
                    {
                      objc_msgSend(v9, "getBytes:range:", &v99, v75, 1);
                      v88 = v99;
LABEL_152:

                      v98 = v88;
                      v7 = 1;
                      objc_msgSend(v4, "appendBytes:length:", &v98, 1);
                      goto LABEL_153;
                    }
LABEL_151:
                    v88 = 0;
                    goto LABEL_152;
                  }
                  v73 = v9;
                  v74 = v73;
                  v99 = 0;
                  if ((v6 & 0x80000000) != 0)
                  {

                    v78 = v74;
                  }
                  else
                  {
                    v75 = v6;
                    if (objc_msgSend(v73, "length") <= (unint64_t)v6)
                    {

                    }
                    else
                    {
                      objc_msgSend(v74, "getBytes:range:", &v99, v6, 1);
                      v76 = v99;

                      if (v76 == 32)
                        goto LABEL_128;
                    }
                    v79 = v74;
                    v99 = 0;
                    if (objc_msgSend(v74, "length") > (unint64_t)v6)
                    {
                      objc_msgSend(v74, "getBytes:range:", &v99, v6, 1);
                      v80 = v99;

                      if (v80 == 44)
                      {
LABEL_128:
                        v81 = v74;
                        v99 = 0;
                        if (objc_msgSend(v81, "length") <= (unint64_t)v6)
                        {

                        }
                        else
                        {
                          objc_msgSend(v81, "getBytes:range:", &v99, v6, 1);
                          v82 = v99;

                          if (v82 == 32)
                            goto LABEL_29;
                        }
                        v85 = v81;
                        v99 = 0;
                        if (objc_msgSend(v85, "length") <= (unint64_t)v6)
                        {

                        }
                        else
                        {
                          objc_msgSend(v85, "getBytes:range:", &v99, v6, 1);
                          v86 = v99;

                          if (v86 == 44)
                            goto LABEL_29;
                        }
                        v98 = 0;
                        v87 = v85;
                        v99 = 0;
                        goto LABEL_149;
                      }
LABEL_132:
                      if (v5 >= 2)
                      {
                        v83 = CFSTR("N");
                        if (v5 >= 0xA)
                        {
                          v83 = CFSTR("NN");
                          if (v5 >= 0x64)
                          {
                            v83 = CFSTR("NNN");
                            if (v5 >= 0x3E8)
                            {
                              v83 = CFSTR("NNNN");
                              if (v5 >> 4 >= 0x271)
                              {
                                if (v5 >> 5 >= 0xC35)
                                  v83 = CFSTR("NNNNNN+");
                                else
                                  v83 = CFSTR("NNNNN");
                              }
                            }
                          }
                        }
                        -[__CFString dataUsingEncoding:](v83, "dataUsingEncoding:", 4);
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "appendData:", v84);

                      }
                      v5 = 0;
LABEL_142:
                      v7 = 1;
                      goto LABEL_156;
                    }
                  }

                  goto LABEL_132;
                }
              }
LABEL_116:

              goto LABEL_117;
            }
          }
          v48 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v47 + 60) & 0x400;
          goto LABEL_105;
        }
        objc_msgSend(v9, "getBytes:range:", &v99, v6, 1);
        v40 = v99;

        if (v40 != 34)
          goto LABEL_71;
        v4 = v97;
        if (!v5)
        {
          v99 = 63;
          objc_msgSend(v97, "appendBytes:length:", &v99, 1);
        }
        ++v5;
        v38 = v2 > v6 + 1;
LABEL_60:
        if (v38)
          ++v6;
        else
          v6 = v2;
LABEL_63:
        v7 = 3;
LABEL_156:
        if (v2 > (int)v6)
          continue;
        if ((int)v5 >= 2)
        {
          v89 = CFSTR("NN");
          v90 = CFSTR("NNN");
          v91 = CFSTR("NNNN");
          v92 = CFSTR("NNNNNN+");
          if (v5 >> 5 < 0xC35)
            v92 = CFSTR("NNNNN");
          if (v5 >> 4 >= 0x271)
            v91 = v92;
          if (v5 >= 0x3E8)
            v90 = v91;
          if (v5 >= 0x64)
            v89 = v90;
          if (v5 >= 0xA)
            v93 = (__CFString *)v89;
          else
            v93 = CFSTR("N");
          -[__CFString dataUsingEncoding:](v93, "dataUsingEncoding:", 4);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendData:", v94);

        }
LABEL_186:
        v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);

        return v95;
      case 2:
        v20 = v1;
        v21 = v20;
        v99 = 0;
        if ((v6 & 0x80000000) != 0 || objc_msgSend(v20, "length") <= (unint64_t)v6)
        {

          v7 = 2;
        }
        else
        {
          objc_msgSend(v21, "getBytes:range:", &v99, v6, 1);
          v22 = v99;

          if (v22 == 41)
            v7 = 1;
          else
            v7 = 2;
        }
LABEL_153:
        if (v2 > (int)(v6 + 1))
          ++v6;
        else
          v6 = v2;
        goto LABEL_156;
      case 3:
        v23 = v1;
        v24 = v23;
        v99 = 0;
        if ((v6 & 0x80000000) != 0)
        {

          v35 = v24;
LABEL_58:

LABEL_59:
          v38 = v2 > (int)(v6 + 1);
          goto LABEL_60;
        }
        if (objc_msgSend(v23, "length") <= (unint64_t)v6)
        {

        }
        else
        {
          objc_msgSend(v24, "getBytes:range:", &v99, v6, 1);
          v25 = v99;

          if (v25 == 34)
          {
LABEL_29:
            if (v2 > v6 + 1)
              ++v6;
            else
              v6 = v2;
            goto LABEL_142;
          }
        }
        v36 = v24;
        v99 = 0;
        if (objc_msgSend(v24, "length") <= (unint64_t)v6)
          goto LABEL_58;
        objc_msgSend(v24, "getBytes:range:", &v99, v6, 1);
        v37 = v99;

        if (v37 != 92)
          goto LABEL_59;
        if (v2 <= v6 + 2)
          v6 = v2;
        else
          v6 += 2;
        goto LABEL_63;
      case 4:
        v26 = v1;
        v27 = v26;
        v99 = 0;
        if ((v6 & 0x80000000) != 0 || objc_msgSend(v26, "length") <= (unint64_t)v6)
        {

          v30 = 0;
        }
        else
        {
          v28 = v6;
          objc_msgSend(v27, "getBytes:range:", &v99, v6, 1);
          v29 = (char)v99;

          v30 = v29;
          if (v29 < 0)
          {
            if (__maskrune(v29, 0x400uLL))
              goto LABEL_44;
            v31 = v27;
            v99 = 0;
            goto LABEL_42;
          }
        }
        if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v30 + 60) & 0x400) != 0)
          goto LABEL_44;
        v32 = v27;
        v99 = 0;
        if ((v6 & 0x80000000) != 0)
          goto LABEL_50;
        v28 = v6;
LABEL_42:
        if (objc_msgSend(v27, "length") <= v28)
        {
LABEL_50:

          goto LABEL_142;
        }
        objc_msgSend(v27, "getBytes:range:", &v99, v28, 1);
        v33 = v99;

        if (v33 != 46)
        {
          v7 = 1;
          goto LABEL_156;
        }
LABEL_44:
        if (v2 > (int)(v6 + 1))
          ++v6;
        else
          v6 = v2;
        goto LABEL_47;
      default:
        goto LABEL_156;
    }
  }
}

void *_isTimeRestrictionOverwritten()
{
  void *v0;
  void *v1;
  void *v2;

  if (!+[_CDDeviceInfo isRunningOnInternalBuild](_CDDeviceInfo, "isRunningOnInternalBuild"))
    return 0;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "objectForKey:", CFSTR("AutoSUTimeRestrictionOverwrite"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      v2 = (void *)objc_msgSend(v1, "BOOLForKey:", CFSTR("AutoSUTimeRestrictionOverwrite"));
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_18DDF11A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18DDF1248(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DDF1374(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t findAutoSuPlanByProbability(uint64_t a1, int *a2, int *a3, int *a4, int *a5, int *a6, void *a7)
{
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  BOOL v17;
  uint64_t v18;
  double v19;
  NSObject *v20;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  double *v30;
  double v31;
  double v32;
  int v33;
  NSObject *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  NSObject *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  NSObject *v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = 0;
  v15 = 1.0;
  do
  {
    v16 = *(double *)(a1 + v14);
    v17 = v16 >= 0.0 && v16 <= 1.0;
    if (!v17)
    {
      +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel", 1.0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        findAutoSuPlanByProbability_cold_1();
LABEL_31:

      goto LABEL_32;
    }
    v14 += 8;
  }
  while (v14 != 768);
  v18 = 0;
  *a3 = -1;
  *a4 = -1;
  *a6 = -1;
  while (1)
  {
    v19 = *(double *)(a1 + 8 * v18);
    objc_msgSend(v13, "startThreshold", v15);
    if (v19 > v15)
      break;
    if (++v18 == 96)
      goto LABEL_15;
  }
  *a3 = v18;
LABEL_15:
  v22 = 95;
  while (1)
  {
    v23 = *(double *)(a1 + 8 * v22);
    if (*a6 == -1 && v23 > 0.0)
      *a6 = v22;
    objc_msgSend(v13, "endThreshold");
    if (v23 > v24)
      break;
    if (--v22 == -1)
      goto LABEL_23;
  }
  *a4 = v22;
LABEL_23:
  v25 = *a3;
  if ((_DWORD)v25 == -1 || *a4 == -1)
  {
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      findAutoSuPlanByProbability_cold_2();
    goto LABEL_31;
  }
  v26 = v25 + 1;
  *a3 = v25 + 1;
  if (*a4 - ((int)v25 + 1) < 4)
  {
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      findAutoSuPlanByProbability_cold_3(a3, a4, v27);

    goto LABEL_32;
  }
  if ((int)v25 < -1)
  {
LABEL_39:
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_18DDBE000, v20, OS_LOG_TYPE_INFO, "Unable to propose last unlock time. Returning default times.", (uint8_t *)&v55, 2u);
    }
    goto LABEL_31;
  }
  v30 = (double *)(a1 + 8 * v26);
  while (1)
  {
    v31 = 1.0 - *v30;
    objc_msgSend(v13, "unlockThreshold");
    if (v31 >= v32)
      break;
    --v30;
    v17 = (int)v26 <= 0;
    LODWORD(v26) = v26 - 1;
    if (v17)
      goto LABEL_39;
  }
  v33 = objc_msgSend(v13, "unlockMarginInSlot");
  *a2 = (v26 - v33) & ~(((int)v26 - v33) >> 31);
  *a5 = *a4;
  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = *a2;
    v36 = *a3;
    v37 = *a4;
    v38 = *a5;
    v39 = *a6;
    v55 = 67110144;
    v56 = v35;
    v57 = 1024;
    v58 = v36;
    v59 = 1024;
    v60 = v37;
    v61 = 1024;
    v62 = v38;
    v63 = 1024;
    v64 = v39;
    _os_log_impl(&dword_18DDBE000, v34, OS_LOG_TYPE_INFO, "(Before intersection): bestLastUnlock:%d, bestSuStart:%d, bestSuEnd:%d, expiration:%d, unrestrictedSleepEnd:%d\n", (uint8_t *)&v55, 0x20u);
  }

  if (!_isTimeRestrictionOverwritten())
  {
    v45 = *a3;
    v46 = objc_msgSend(v13, "restrictionStartInSlot");
    if (v45 <= v46)
      v45 = v46;
    v47 = *a4;
    v48 = objc_msgSend(v13, "restrictionEndInSlot");
    if (v47 >= v48)
      v47 = v48;
    if (v47 - v45 > 3)
    {
      if (*a3 != v45)
        +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.sleepSPIforAutoSU.suStartTruncated"));
      if (*a4 != v47)
        +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.sleepSPIforAutoSU.suEndTruncated"));
      *a3 = v45;
      *a4 = v47;
      *a5 = v47;
      +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = *a2;
        v51 = *a3;
        v52 = *a4;
        v53 = *a5;
        v54 = *a6;
        v55 = 67110144;
        v56 = v50;
        v57 = 1024;
        v58 = v51;
        v59 = 1024;
        v60 = v52;
        v61 = 1024;
        v62 = v53;
        v63 = 1024;
        v64 = v54;
        _os_log_impl(&dword_18DDBE000, v49, OS_LOG_TYPE_INFO, "(After intersection): bestLastUnlock:%d, bestSuStart:%d, bestSuEnd:%d, expiration:%d unrestrictedSleepEnd:%d\n", (uint8_t *)&v55, 0x20u);
      }

      goto LABEL_61;
    }
    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.sleepSPIforAutoSU.insufficientInterval"));
LABEL_32:
    v28 = 0xFFFFFFFFLL;
    goto LABEL_33;
  }
  if (*a4 - *a3 < 4)
    goto LABEL_32;
  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = *a2;
    v42 = *a3;
    v43 = *a4;
    v44 = *a5;
    v55 = 67109888;
    v56 = v41;
    v57 = 1024;
    v58 = v42;
    v59 = 1024;
    v60 = v43;
    v61 = 1024;
    v62 = v44;
    _os_log_impl(&dword_18DDBE000, v40, OS_LOG_TYPE_INFO, "Internal testing build - AutoSU Time Restriction check disabled\n(Without restriction) bestLastUnlock:%d, bestSuStart:%d, bestSuEnd:%d, expiration:%d\n", (uint8_t *)&v55, 0x1Au);
  }

LABEL_61:
  v28 = 0;
LABEL_33:

  return v28;
}

uint64_t active_memory_limit()
{
  if (active_memory_limit_onceToken != -1)
    dispatch_once(&active_memory_limit_onceToken, &__block_literal_global_1);
  return active_memory_limit_limit;
}

void __active_memory_limit_block_invoke()
{
  NSObject *v0;
  _QWORD v1[2];

  v1[0] = 0;
  v1[1] = 0;
  getpid();
  if (memorystatus_control())
  {
    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __active_memory_limit_block_invoke_cold_2(v0);
  }
  else
  {
    active_memory_limit_limit = LODWORD(v1[0]) << 20;
    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
      __active_memory_limit_block_invoke_cold_1((int *)v1, v0);
  }

}

void sub_18DDF33AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

void _CDPerfMetricInitialize()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)_CDPerfMetricFamilies;
  _CDPerfMetricFamilies = v0;

  v2 = dispatch_queue_create("com.apple.coreduet.perfmetric", 0);
  v3 = (void *)_CDPerfMetricQueue;
  _CDPerfMetricQueue = (uint64_t)v2;

}

void CDPerfMetricEndTiming(void *a1, uint64_t a2)
{
  CDPerfMetricEndTimingAndSetResultCountMaybeIncrementErrorCount(a1, a2, 0, 0);
}

void CDPerfMetricEndTimingAndIncrementErrorCount(void *a1, uint64_t a2)
{
  CDPerfMetricEndTimingAndSetResultCountMaybeIncrementErrorCount(a1, a2, 0, 1);
}

void sub_18DDF8F40(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_18DDFA374(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DDFA94C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DDFABEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DDFD5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DDFE614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id location)
{
  id *v43;
  id *v44;
  uint64_t v45;

  objc_destroyWeak(v43);
  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v45 - 144));
  _Unwind_Resume(a1);
}

void sub_18DDFF71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _siriSyncEnabledDidChangeCallback(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___siriSyncEnabledDidChangeCallback_block_invoke;
  v4[3] = &unk_1E26E2F20;
  v5 = v2;
  v3 = v2;
  +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v4);

}

void sub_18DE00A68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DE00CE8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ___siriSyncEnabledDidChangeCallback_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    -[_DKSync2Coordinator _deleteSiriEventsIfSiriCloudSyncHasBeenDisabled](v1);
}

void OUTLINED_FUNCTION_8_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_23(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_24(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_25(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

BOOL OUTLINED_FUNCTION_27@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return -[_DKSyncToggle isEnabled](*(_QWORD *)(v1 + a1));
}

uint64_t OUTLINED_FUNCTION_28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 40) = a1;
  return objc_opt_class();
}

void OUTLINED_FUNCTION_29(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_31()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

uint64_t sleepPredictionWithParams2(double *a1, uint64_t a2, unsigned int a3, double a4, double a5, double a6)
{
  signed int v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char *v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  double *v48;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  double v60;
  double v61;
  double v62;
  _QWORD v63[2];
  uint8_t buf[4];
  int v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v11 = validatePastDetection(a2, a3);
  if (v11 == -1)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      sleepPredictionWithParams2_cold_1(v50);

    return 0xFFFFFFFFLL;
  }
  else
  {
    v12 = v11;
    v13 = (v11 / 96);
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sleepPredictionWithParams2_cold_3(v13, v14, v15, v16, v17, v18, v19, v20);

    v63[1] = v63;
    v21 = (384 * v13 + 15) & 0xFFFFFFFFFFFFFFF0;
    ((void (*)(void))MEMORY[0x1E0C80A78])();
    v22 = v12 / 0x60;
    if ((int)v22 >= 1)
    {
      v23 = 0;
      v24 = -1;
      v25 = (char *)v63 - v21;
      do
      {
        v26 = v25;
        v27 = 96;
        do
          *v26++ = *(_DWORD *)(a2 + 4 * (v24 + (int)v27--));
        while (v27);
        ++v23;
        v25 += 384;
        v24 += 96;
      }
      while (v23 != v22);
    }
    v28 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
    v30 = (int *)((char *)v63 - ((v29 + 15) & 0x7FFFFFFF0));
    v31 = MEMORY[0x1E0C80A78](v28);
    v33 = (char *)v63 - v32;
    earlyAggregate(v31, (uint64_t)v30, (uint64_t)v63 - v32, v13);
    v35 = MEMORY[0x1E0C80A78](v34);
    MEMORY[0x1E0C80A78](v35);
    v36 = cumulateSleepWakeProbability(v30, (uint64_t)v33, (uint64_t)v63 - v21, (uint64_t)v63 - v21, v13);
    v37 = 96 * v13;
    v38 = MEMORY[0x1E0C80A78](v36);
    v40 = (char *)v63 - ((v39 + 15) & 0x7FFFFFFF0);
    MEMORY[0x1E0C80A78](v38);
    v42 = (char *)v63 - v41;
    convert2dArrayTo1dReversedBitPattern((uint64_t)v63 - v21, v12, (uint64_t)v40);
    v43 = convert2dArrayTo1dReversedBitPattern((uint64_t)v63 - v21, v12, (uint64_t)v42);
    v44 = MEMORY[0x1E0C80A78](v43);
    v46 = (double *)((char *)v63 - ((v45 + 15) & 0xFFFFFFFF0));
    MEMORY[0x1E0C80A78](v44);
    v48 = (double *)((char *)v63 - v47);
    if (sleepPredictionWithParams1((uint64_t)v46, (uint64_t)v40, v37, a4, a5, a6)
      || sleepPredictionWithParams1((uint64_t)v48, (uint64_t)v42, v37, a4, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        sleepPredictionWithParams2_cold_2(96, v51, v52, v53, v54, v55, v56, v57);

      v58 = 0;
      do
      {
        *a1 = 1.0 - fmin(*v46, *v48);
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          v60 = *a1;
          v61 = *v46;
          v62 = *v48;
          *(_DWORD *)buf = 67109888;
          v65 = v58;
          v66 = 2048;
          v67 = v60;
          v68 = 2048;
          v69 = v61;
          v70 = 2048;
          v71 = v62;
          _os_log_debug_impl(&dword_18DDBE000, v59, OS_LOG_TYPE_DEBUG, "Sleep Prediction: prediction[%d] = %f, agg_sleep = %f, agg_wake = %f", buf, 0x26u);
        }

        ++v58;
        ++a1;
        ++v48;
        ++v46;
      }
      while (v58 != 96);
      return 0;
    }
  }
}

uint64_t convert1dReversedBitPatternTo2dArray(uint64_t result, unsigned int a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  _DWORD *v6;
  uint64_t v7;

  v3 = a2 / 0x60;
  if ((int)v3 >= 1)
  {
    v4 = 0;
    v5 = -1;
    do
    {
      v6 = a3;
      v7 = 96;
      do
        *v6++ = *(_DWORD *)(result + 4 * (v5 + (int)v7--));
      while (v7);
      ++v4;
      v5 += 96;
      a3 += 96;
    }
    while (v4 != v3);
  }
  return result;
}

void earlyAggregate(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  int MaxInterval;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a4 >= 1)
  {
    v7 = 0;
    v8 = a4;
    while (1)
    {
      MaxInterval = getMaxInterval();
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (MaxInterval != -1)
        break;
      if (v11)
      {
        *(_DWORD *)buf = 67109120;
        v15 = v7;
        v12 = v10;
        v13 = "Sleep Prediction: Day %d: could not find desired inactive period of any length\n";
LABEL_13:
        _os_log_debug_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 8u);
      }
LABEL_10:

      *(_DWORD *)(a2 + 4 * v7) = -1;
      *(_DWORD *)(a3 + 4 * v7++) = -1;
      a1 += 384;
      if (v8 == v7)
        return;
    }
    if (v11)
    {
      *(_DWORD *)buf = 67109632;
      v15 = v7;
      v16 = 1024;
      v17 = 0;
      v18 = 1024;
      v19 = 0;
      _os_log_debug_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEBUG, "Sleep Prediction: Day %d: longest interval (start, duration) = (%d, %d)\n", buf, 0x14u);
    }

    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    *(_DWORD *)buf = 67109120;
    v15 = v7;
    v12 = v10;
    v13 = "Sleep Prediction: Day %d: could not find long enough inactive period to be considered as valid sleep period\n";
    goto LABEL_13;
  }
}

int *cumulateSleepWakeProbability(int *result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int *v14;
  uint64_t j;

  if (a5 >= 1)
  {
    v7 = result;
    v8 = 0;
    v9 = a5;
    v10 = a4;
    v11 = a3;
    do
    {
      v12 = 384 * v8;
      if (v7[v8] == -1)
      {
        result = (int *)memset((void *)(a3 + v12), 255, 0x180uLL);
        v14 = (int *)(a2 + 4 * v8);
        if (*v14 != -1)
          goto LABEL_10;
      }
      else
      {
        for (i = 0; i != 96; ++i)
          *(_DWORD *)(v11 + 4 * i) = i >= v7[v8];
        v14 = (int *)(a2 + 4 * v8);
        if (*v14 != -1)
        {
LABEL_10:
          for (j = 0; j != 96; ++j)
            *(_DWORD *)(v10 + 4 * j) = j <= *v14;
          goto LABEL_14;
        }
      }
      result = (int *)memset((void *)(a4 + v12), 255, 0x180uLL);
LABEL_14:
      ++v8;
      v11 += 384;
      v10 += 384;
    }
    while (v8 != v9);
  }
  return result;
}

uint64_t convert2dArrayTo1dReversedBitPattern(uint64_t result, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;
  uint64_t v7;
  int v8;

  v3 = a2 / 0x60;
  if ((int)v3 >= 1)
  {
    v4 = 0;
    do
    {
      v5 = (int *)(result + 384 * v4++);
      v6 = 96 * v4 - 1;
      v7 = 96;
      do
      {
        v8 = *v5++;
        *(_DWORD *)(a3 + 4 * v6--) = v8;
        --v7;
      }
      while (v7);
    }
    while (v4 != v3);
  }
  return result;
}

uint64_t getMaxInterval()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  int *i;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char *v14;
  int *v15;
  int v16;
  int v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v0 = MEMORY[0x1E0C80A78]();
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFF0);
  if ((int)v2 < 1)
    return 0xFFFFFFFFLL;
  v5 = 0;
  for (i = (int *)(v0 + 4); *(i - 1) != 1; ++i)
  {
    if (v2 == ++v5)
      return 0xFFFFFFFFLL;
  }
  v7 = v5 + 1;
  if ((int)v5 + 1 >= (int)v2)
    return 0xFFFFFFFFLL;
  while (*i)
  {
    ++v7;
    ++i;
    if (v2 == v7)
      return 0xFFFFFFFFLL;
  }
  if ((int)v2 <= (int)v7)
    return 0xFFFFFFFFLL;
  do
  {
    v8 = *i++;
    if (v8 == 1)
      break;
    LODWORD(v7) = v7 + 1;
    v9 = 0xFFFFFFFFLL;
  }
  while ((int)v2 > (int)v7);
  v10 = 0;
  LODWORD(v11) = 0;
  v12 = v2 - 1;
  do
  {
    v13 = *(_DWORD *)(v0 + 4 * v5);
    if (v13 == 1 && !*(_DWORD *)(v0 + 4 * v5 + 4))
      v10 = v5;
    if (!v13 && *(_DWORD *)(v0 + 4 * v5 + 4) == 1)
    {
      v14 = &v4[8 * (int)v11];
      LODWORD(v11) = v11 + 1;
      *(_DWORD *)v14 = v10 + 1;
      *((_DWORD *)v14 + 1) = v5 - v10;
    }
    ++v5;
  }
  while (v12 != v5);
  if ((int)v11 < 1)
    return 0xFFFFFFFFLL;
  v15 = (int *)(v4 + 4);
  v16 = -1;
  v17 = -1;
  v11 = v11;
  do
  {
    if (*v15 > v16)
    {
      v17 = *(v15 - 1);
      v16 = *v15;
    }
    v15 += 2;
    --v11;
  }
  while (v11);
  v9 = 0xFFFFFFFFLL;
  if (v16 != -1 && v17 != -1)
  {
    v9 = 0;
    *v1 = v17;
    v1[1] = v16;
  }
  return v9;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_18DE02DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE0303C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE0325C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE03468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id reasonToString(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[11];
  _QWORD v9[12];

  v9[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)reasonToString_map;
  if (!reasonToString_map)
  {
    v8[0] = &unk_1E272A600;
    v8[1] = &unk_1E272A618;
    v9[0] = CFSTR("Frequent");
    v9[1] = CFSTR("Recent");
    v8[2] = &unk_1E272A630;
    v8[3] = &unk_1E272A648;
    v9[2] = CFSTR("TimeOfDay");
    v9[3] = CFSTR("Location");
    v8[4] = &unk_1E272A660;
    v8[5] = &unk_1E272A678;
    v9[4] = CFSTR("Calendar");
    v9[5] = CFSTR("RelatedContacts");
    v8[6] = &unk_1E272A690;
    v8[7] = &unk_1E272A6A8;
    v9[6] = CFSTR("ObservedInterest");
    v9[7] = CFSTR("WaitingForResponse");
    v8[8] = &unk_1E272A6C0;
    v8[9] = &unk_1E272A6D8;
    v9[8] = CFSTR("Keywords");
    v9[9] = CFSTR("Active");
    v8[10] = &unk_1E272A6F0;
    v9[10] = CFSTR("Nearby");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 11);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)reasonToString_map;
    reasonToString_map = v3;

    v2 = (void *)reasonToString_map;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_18DE03E94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE03F94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_4(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return objc_opt_class();
}

void sub_18DE06708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FTCPPETParticipantReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            v25 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 2)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_39:
        *(_BYTE *)(a1 + 16) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DE08DAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE08E98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id resolve(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v16;

  v3 = a1;
  v4 = a2;
  if (resolve_onceToken != -1)
    dispatch_once(&resolve_onceToken, &__block_literal_global_8);
  v16 = 0;
  objc_msgSend(v4, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, resolve_contactKeysToFetch, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (v6)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      resolve_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

void __resolve_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[18];

  v18[16] = *MEMORY[0x1E0C80C00];
  -[objc_class descriptorForRequiredKeysForStyle:](getCNContactFormatterClass(), "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  getCNContactIdentifierKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  getCNContactNamePrefixKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  getCNContactGivenNameKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v15;
  getCNContactMiddleNameKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  getCNContactFamilyNameKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v13;
  getCNContactPreviousFamilyNameKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v12;
  getCNContactNameSuffixKey();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v1;
  getCNContactNicknameKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v2;
  getCNContactOrganizationNameKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v3;
  getCNContactImageDataAvailableKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v4;
  getCNContactTypeKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v5;
  getCNContactPhoneNumbersKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v6;
  getCNContactEmailAddressesKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[12] = v7;
  getCNContactPostalAddressesKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[13] = v8;
  getCNContactInstantMessageAddressesKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[14] = v9;
  v18[15] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 16);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)resolve_contactKeysToFetch;
  resolve_contactKeysToFetch = v10;

}

double ceilDateWithOffset(double a1, long double a2, double a3, double a4)
{
  long double v6;
  double v7;
  BOOL v8;
  double v9;

  v6 = fmod(a1 + a4 - a3, a2);
  v7 = a2 - v6;
  v8 = v6 == 0.0;
  v9 = -0.0;
  if (!v8)
    v9 = v7;
  return v9 + a1;
}

long double floorDateWithOffset(double a1, long double a2, double a3, double a4)
{
  return a1 - fmod(a1 + a4 - a3, a2);
}

void sub_18DE0A878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, const __CFString *a17, const __CFString *a18, uint64_t a19)
{
  uint64_t v19;
  id *v20;
  uint64_t v21;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  if (a2 != 1)
    _Unwind_Resume(a1);
  v24 = objc_begin_catch(a1);
  objc_msgSend(*(id *)(v21 + 1976), "syncChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    -[_DKCloudUtilities _fetchAccountInfoWithCompletionHandler:].cold.1((uint64_t)v24, v25);

  if (!v19)
  {
LABEL_14:

    objc_end_catch();
    JUMPOUT(0x18DE0A838);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v24;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      +[_DKSyncErrors domain](_DKSyncErrors, "domain");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      a16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v24, "reason");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      v31 = CFSTR("Exception Caught");
      if (v29)
        v31 = (const __CFString *)v29;
      a17 = CFSTR("NSUnderlyingException");
      a18 = v31;
      a19 = (uint64_t)v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a18, &a16, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 1, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = v26;
LABEL_13:
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v33);

  goto LABEL_14;
}

void OUTLINED_FUNCTION_5_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

void sub_18DE0C60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE0C9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

#error "18DE0CADC: call analysis failed (funcsize=61)"

void sub_18DE0E9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DE0ED10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DE0F03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_18DE0F1C8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DE10034(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DE10350(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DE109B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 200));
  objc_destroyWeak((id *)(v13 - 192));
  _Unwind_Resume(a1);
}

void sub_18DE10ADC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DE1140C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DE11B50(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DE13A00(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 248));
  objc_destroyWeak((id *)(v3 - 240));
  _Unwind_Resume(a1);
}

void sub_18DE13D10(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DE14934(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 152));
  _Unwind_Resume(a1);
}

void sub_18DE14FA4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DE15158(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

#error "18DE15418: call analysis failed (funcsize=175)"

#error "18DE15754: call analysis failed (funcsize=86)"

#error "18DE15A78: call analysis failed (funcsize=86)"

void sub_18DE163F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_18DE16590(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_21_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

void OUTLINED_FUNCTION_29_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x34u);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_37()
{
  id *v0;

  return objc_msgSend(*v0, "code");
}

uint64_t OUTLINED_FUNCTION_40()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

void OUTLINED_FUNCTION_42(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x2Au);
}

void OUTLINED_FUNCTION_44(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_46(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 40), "me");
}

uint64_t OUTLINED_FUNCTION_52(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

int *OUTLINED_FUNCTION_6_4()
{
  return __error();
}

void OUTLINED_FUNCTION_9_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

char *OUTLINED_FUNCTION_10_1(int *a1)
{
  return strerror(*a1);
}

void sub_18DE19CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *mechanismToString(unint64_t a1)
{
  if (a1 > 0x14)
    return CFSTR("Unknown");
  else
    return off_1E26E3DD0[a1];
}

const __CFString *directionToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Incoming");
  else
    return off_1E26E3E78[a1 - 1];
}

void sub_18DE1FDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;

  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void __initPercentEscapes_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "addCharactersInRange:", 37, 1);
  v2 = objc_msgSend(v1, "copy");

  v3 = (void *)percentEscapes;
  percentEscapes = v2;

  objc_msgSend((id)percentEscapes, "invertedSet");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)inversePercentEscapes;
  inversePercentEscapes = v4;

}

id stringifyRecipientList_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteraction generateConversationIdFromInteractionRecipientRecords:](_CDInteraction, "generateConversationIdFromInteractionRecipientRecords:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL _DKPRStreamReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  _DKPRValueType *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_DKPRValueType **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(_DKPRValueType);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || (_DKPRValueTypeReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _DKPRValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  _DKPRValueType *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = objc_alloc_init(_DKPRValueType);
          objc_storeStrong((id *)(a1 + 48), v18);
          if (PBReaderPlaceMark() && (_DKPRValueTypeReadFrom((uint64_t)v18, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_36;
        case 4u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 56) |= 4u;
          break;
        case 5u:
          *(_BYTE *)(a1 + 56) |= 2u;
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v31 = 0;
          }
          v35 = 16;
          goto LABEL_48;
        case 6u:
          PBReaderReadData();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
LABEL_36:
          v32 = *(void **)(a1 + v21);
          *(_QWORD *)(a1 + v21) = v20;

          continue;
        case 7u:
          *(_BYTE *)(a1 + 56) |= 1u;
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v31 = 0;
          }
          v35 = 8;
LABEL_48:
          *(_QWORD *)(a1 + v35) = v31;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        v27 = v26 + 1;
        if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
          break;
        v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
        *(_QWORD *)(a2 + v25) = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0)
          goto LABEL_41;
        v22 += 7;
        v15 = v23++ >= 9;
        if (v15)
        {
          v24 = 0;
          goto LABEL_43;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
      if (*(_BYTE *)(a2 + *v5))
        v24 = 0;
LABEL_43:
      *(_QWORD *)(a1 + 24) = v24;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id _CDDomainAvailabilityDescription(char a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("system"));
  if ((a1 & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("user"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __dataCollectionIsEnabled_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  BOOL v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint8_t v34[8];
  id v35;
  id v36;
  id v37;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
  v37 = 0;
  objc_msgSend(v0, "getUserDefaultVoiceSubscriptionContext:", &v37);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v37;
  if (v1)
    v3 = v2 == 0;
  else
    v3 = 0;
  if (v3)
  {
    v36 = 0;
    v12 = (void *)objc_msgSend(v0, "copyMobileSubscriberCountryCode:error:", v1, &v36);
    v13 = v36;
    if (v12)
      v14 = v13 == 0;
    else
      v14 = 0;
    if (v14)
    {
      v35 = 0;
      v22 = objc_msgSend(v0, "copyMobileSubscriberIsoCountryCode:error:", v12, &v35);
      v4 = v35;
      v23 = (void *)dataCollectionIsEnabled_countryCode;
      dataCollectionIsEnabled_countryCode = v22;

      if (!dataCollectionIsEnabled_countryCode || v4)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          __dataCollectionIsEnabled_block_invoke_cold_3((uint64_t)v4, v26, v27, v28, v29, v30, v31, v32);
        v33 = (void *)dataCollectionIsEnabled_countryCode;
        dataCollectionIsEnabled_countryCode = 0;

      }
      else
      {
        if (objc_msgSend((id)dataCollectionIsEnabled_countryCode, "length"))
        {
          objc_msgSend((id)dataCollectionIsEnabled_countryCode, "lowercaseString");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)dataCollectionIsEnabled_countryCode;
          dataCollectionIsEnabled_countryCode = v24;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v34 = 0;
            _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Country code not set", v34, 2u);
          }
          v25 = (void *)dataCollectionIsEnabled_countryCode;
          dataCollectionIsEnabled_countryCode = 0;
        }

        v4 = 0;
      }
    }
    else
    {
      v4 = v13;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        __dataCollectionIsEnabled_block_invoke_cold_2((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
    }

  }
  else
  {
    v4 = v2;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      __dataCollectionIsEnabled_block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 1176));
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 1176));
}

uint64_t PersonLinkingPersonPairReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  PersonLinkingPerson *v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  uint64_t v31;
  void *v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(PersonLinkingPerson);
        v19 = 24;
        goto LABEL_23;
      case 2u:
        v18 = objc_alloc_init(PersonLinkingPerson);
        v19 = 32;
LABEL_23:
        objc_storeStrong((id *)(a1 + v19), v18);
        if (PBReaderPlaceMark() && PersonLinkingPersonReadFrom(v18, a2))
        {
          PBReaderRecallMark();

LABEL_43:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 44) |= 2u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_40:
        *(_BYTE *)(a1 + 40) = v23 != 0;
        goto LABEL_43;
      case 4u:
        *(_BYTE *)(a1 + 44) |= 1u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        *(_DWORD *)(a1 + 8) = v30;
        goto LABEL_43;
      case 5u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v31;

        goto LABEL_43;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_43;
    }
  }
}

void sub_18DE2706C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE281B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE29868(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 + 688), 8);
  _Block_object_dispose((const void *)(v1 + 736), 8);
  _Unwind_Resume(a1);
}

void sub_18DE29F0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE2A3F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __DKOBSERVER_IS_CALLING_ASYNC_INVOCATION__(void *a1)
{
  void *v1;
  id v2;

  v2 = a1;
  v1 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v2, "invoke");
  objc_autoreleasePoolPop(v1);

}

void __DKOBSERVER_IS_CALLING_ASYNC_OUT_TO_A_BLOCK__(void *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id, id);
  void *v7;
  id v8;

  v8 = a1;
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x193FEE914]();
  v6[2](v6, v8, v5);
  objc_autoreleasePoolPop(v7);

}

void sub_18DE2A76C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE2A958(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE2ACE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE2B108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE2B31C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _DKPrivacySensitiveMetadataKeys()
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  +[_DKDigitalHealthMetadataKey webpageURL](_DKDigitalHealthMetadataKey, "webpageURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t _DKStringContainsPrivacySensitiveMetadataKey(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (_DKStringContainsPrivacySensitiveMetadataKey_onceToken != -1)
    dispatch_once(&_DKStringContainsPrivacySensitiveMetadataKey_onceToken, &__block_literal_global_22);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = (id)_DKStringContainsPrivacySensitiveMetadataKey_sensitiveKeyPathStrings;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(v1, "containsString:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i), (_QWORD)v7) & 1) != 0)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

uint64_t InteractionAnalysisPETInteractionEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  void *v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
          {
            v10 = 0;
            v16 = *v5;
            v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(_BYTE *)(a2 + v16))
          v10 = 0;
LABEL_14:
        if (v17)
          v18 = 1;
        else
          v18 = (v10 & 7) == 4;
        if (!v18)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v19 = *v3;
              v20 = *(_QWORD *)(a2 + v19);
              if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
                *(_QWORD *)(a2 + v19) = v20 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + v16) = 1;
                v21 = 0;
              }
              *(_QWORD *)(a1 + 8) = v21;
              goto LABEL_30;
            case 2u:
              PBReaderReadString();
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = 40;
              goto LABEL_29;
            case 3u:
              PBReaderReadString();
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = 24;
              goto LABEL_29;
            case 4u:
              PBReaderReadString();
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = 32;
              goto LABEL_29;
            case 5u:
              PBReaderReadString();
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = 48;
              goto LABEL_29;
            case 6u:
              PBReaderReadString();
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = 16;
LABEL_29:
              v25 = *(void **)(a1 + v23);
              *(_QWORD *)(a1 + v23) = v22;

              goto LABEL_30;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_30:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MAPIntervalToCDPeriod(uint64_t a1)
{
  uint64_t v1;

  v1 = *MEMORY[0x1E0C807C0];
  if (3 * *MEMORY[0x1E0C807C0] >= a1)
    return 1;
  if (5 * v1 >= a1)
    return 2;
  if (11 * v1 >= a1)
    return 3;
  if (17 * v1 >= a1)
    return 4;
  if (23 * v1 >= a1)
    return 5;
  if (*MEMORY[0x1E0C807B8] >= a1)
    return 6;
  return 7;
}

void sub_18DE2EEF0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18DE30944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DE30FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t FTCPPETInteractionLogEventReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  FTCPPETInteraction *v29;
  uint64_t result;
  uint64_t v31;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 1)
        break;
      if ((_DWORD)v17 != 3)
      {
        if ((_DWORD)v17 != 2)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_49;
        }
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_41;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_43:
        v31 = 16;
        goto LABEL_48;
      }
      v29 = objc_alloc_init(FTCPPETInteraction);
      objc_msgSend(a1, "addInteractions:", v29);
      if (!PBReaderPlaceMark() || (FTCPPETInteractionReadFrom((uint64_t)v29, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

LABEL_49:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v24 = 0;
    v25 = 0;
    v20 = 0;
    while (1)
    {
      v26 = *v3;
      v27 = *(_QWORD *)(a2 + v26);
      if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
        break;
      v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
      *(_QWORD *)(a2 + v26) = v27 + 1;
      v20 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0)
        goto LABEL_45;
      v24 += 7;
      v14 = v25++ >= 9;
      if (v14)
      {
        v20 = 0;
        goto LABEL_47;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
    if (*(_BYTE *)(a2 + *v5))
      v20 = 0;
LABEL_47:
    v31 = 8;
LABEL_48:
    *(_QWORD *)&a1[v31] = v20;
    goto LABEL_49;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id OUTLINED_FUNCTION_7_4@<X0>(void *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 8) = a3;
  return objc_getProperty(a1, a2, 32, 1);
}

uint64_t significantFigureRound(uint64_t result, unint64_t a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  if (result)
  {
    v2 = (double)a2;
    v3 = (double)result;
    v4 = log10((double)result);
    v5 = __exp10(v2 - ceil(v4));
    return (unint64_t)(round(v5 * v3) / v5);
  }
  return result;
}

void sub_18DE36D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE39018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_18DE394BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_18DE3B8C4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _DKPRCompressedChangeSetReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadData();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *meetingStatusToString(unint64_t a1)
{
  if (a1 > 7)
    return CFSTR("Pending");
  else
    return off_1E26E46E8[a1];
}

const __CFString *contactIdTypeToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Person");
  if (a1 == 1)
    v1 = CFSTR("Organization");
  if (a1 == 2)
    return CFSTR("None");
  else
    return v1;
}

void sub_18DE41374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE45EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18DE464D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18DE46C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18DE476F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DE47D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DE48268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DE48894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DE492AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18DE4B7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&STACK[0x320], 8);
  _Unwind_Resume(a1);
}

void sub_18DE4DA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18DE4E1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE4E890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE5040C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_18DE50CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_7_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void __DKSYNCBLOCKOPERATION_IS_CALLING_EXECUTION_BLOCKS__(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        __DKSYNCBLOCKOPERATION_IS_CALLING_OUT_TO_A_BLOCK__(*(void **)(*((_QWORD *)&v6 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __DKSYNCBLOCKOPERATION_IS_CALLING_OUT_TO_A_BLOCK__(void *a1)
{
  void *v1;
  void (**v2)(void);

  v2 = a1;
  v1 = (void *)MEMORY[0x193FEE914]();
  v2[2]();
  objc_autoreleasePoolPop(v1);

}

void _DKSync3PolicyDuplicateNSStringPropertyValue(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  NSObject *v10;
  NSObject *v11;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v5);
LABEL_6:

    goto LABEL_7;
  }

  if (v11)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      _DKSync3PolicyDuplicateNSStringPropertyValue_cold_1();
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t _DKSync3PolicyDoesContainRequiredProperties(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            _DKSync3PolicyDoesContainRequiredProperties_cold_1((uint64_t)v5, v12, v15);

          v14 = 0;
          goto LABEL_13;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_13:

  return v14;
}

void _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", v5, 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue_cold_1();

            goto LABEL_17;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v5);
    goto LABEL_17;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue_cold_2();
LABEL_17:

  }
}

void _DKSync3PolicyDuplicateNSNumberPropertyValue(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  NSObject *v10;
  NSObject *v11;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v5);
LABEL_6:

    goto LABEL_7;
  }

  if (v11)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      _DKSync3PolicyDuplicateNSNumberPropertyValue_cold_1();
    goto LABEL_6;
  }
LABEL_7:

}

void OUTLINED_FUNCTION_10_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_23_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void sub_18DE5D178(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE5DA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE5EDA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE5EE14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE61C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_7_6(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

void sub_18DE652A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE659B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MailIntelligencePETMailIntelligenceAnalysisEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  MailIntelligencePETContactEvents *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_23;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
LABEL_23:
        v20 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_49;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_44;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_44:
        *(_DWORD *)(a1 + 16) = v23;
        goto LABEL_49;
      case 4u:
        v27 = objc_alloc_init(MailIntelligencePETContactEvents);
        objc_storeStrong((id *)(a1 + 32), v27);
        if (PBReaderPlaceMark() && (MailIntelligencePETContactEventsReadFrom(v27, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_49:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v14 = v29++ >= 9;
              if (v14)
              {
                v30 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_48:
        *(_QWORD *)(a1 + 8) = v30;
        goto LABEL_49;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_49;
    }
  }
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 2468));
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 2468));
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 2468));
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 2464));
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

void OUTLINED_FUNCTION_17_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x48u);
}

uint64_t CloudFamilyAnalysisPETContactEventsReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CloudFamilyAnalysisPETContactEvent *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CloudFamilyAnalysisPETContactEvent);
        objc_msgSend(a1, "addContactEvent:", v17);
        if (!PBReaderPlaceMark() || (CloudFamilyAnalysisPETContactEventReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _DKPREventDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_43;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            v26 = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_45:
        *(_QWORD *)(a1 + 8) = v26;
      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadData();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v30;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_41:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DE6BE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DE6BFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18DE6CFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18DE6F708(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DE7272C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE73638(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&fromPBCodable_skipMetadata___cacheLock);
  _Unwind_Resume(a1);
}

void sub_18DE75F40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE77F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE78B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE78F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_18DE79198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE7946C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE7A910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DE7B904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_18DE7CDFC(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke_2_cold_1();

    -[_DKKnowledgeStorage errorForException:](*(_QWORD *)(v2 + 48), v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_end_catch();
    JUMPOUT(0x18DE7CDC4);
  }
  _Unwind_Resume(exception_object);
}

void sub_18DE7D164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DE7D5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE7DDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE7E608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DE7ED5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18DE7EFB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE7F244(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_13_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_15_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  uint64_t v0;

  return -[_DKKnowledgeStorage finalMigrationVersion](v0);
}

uint64_t OUTLINED_FUNCTION_18_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t ContactsLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ContactsLibraryCore_frameworkLibrary;
  v6 = ContactsLibraryCore_frameworkLibrary;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E54E0;
    v8 = *(_OWORD *)&off_1E26E54F0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ContactsLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7F86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ContactsLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = ContactsLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getCNContactBirthdayKeySymbolLoc()
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
  v0 = (void *)getCNContactBirthdayKeySymbolLoc_ptr;
  v6 = getCNContactBirthdayKeySymbolLoc_ptr;
  if (!getCNContactBirthdayKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactBirthdayKey");
    v4[3] = (uint64_t)v0;
    getCNContactBirthdayKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7F954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactEmailAddressesKeySymbolLoc()
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
  v0 = (void *)getCNContactEmailAddressesKeySymbolLoc_ptr;
  v6 = getCNContactEmailAddressesKeySymbolLoc_ptr;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactEmailAddressesKey");
    v4[3] = (uint64_t)v0;
    getCNContactEmailAddressesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7F9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactFamilyNameKeySymbolLoc()
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
  v0 = (void *)getCNContactFamilyNameKeySymbolLoc_ptr;
  v6 = getCNContactFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactFamilyNameKey");
    v4[3] = (uint64_t)v0;
    getCNContactFamilyNameKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactGivenNameKeySymbolLoc()
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
  v0 = (void *)getCNContactGivenNameKeySymbolLoc_ptr;
  v6 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactGivenNameKey");
    v4[3] = (uint64_t)v0;
    getCNContactGivenNameKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactIdentifierKeySymbolLoc()
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
  v0 = (void *)getCNContactIdentifierKeySymbolLoc_ptr;
  v6 = getCNContactIdentifierKeySymbolLoc_ptr;
  if (!getCNContactIdentifierKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactIdentifierKey");
    v4[3] = (uint64_t)v0;
    getCNContactIdentifierKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactImageDataAvailableKeySymbolLoc()
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
  v0 = (void *)getCNContactImageDataAvailableKeySymbolLoc_ptr;
  v6 = getCNContactImageDataAvailableKeySymbolLoc_ptr;
  if (!getCNContactImageDataAvailableKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactImageDataAvailableKey");
    v4[3] = (uint64_t)v0;
    getCNContactImageDataAvailableKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactInstantMessageAddressesKeySymbolLoc()
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
  v0 = (void *)getCNContactInstantMessageAddressesKeySymbolLoc_ptr;
  v6 = getCNContactInstantMessageAddressesKeySymbolLoc_ptr;
  if (!getCNContactInstantMessageAddressesKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactInstantMessageAddressesKey");
    v4[3] = (uint64_t)v0;
    getCNContactInstantMessageAddressesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FCB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactMiddleNameKeySymbolLoc()
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
  v0 = (void *)getCNContactMiddleNameKeySymbolLoc_ptr;
  v6 = getCNContactMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactMiddleNameKey");
    v4[3] = (uint64_t)v0;
    getCNContactMiddleNameKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactNamePrefixKeySymbolLoc()
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
  v0 = (void *)getCNContactNamePrefixKeySymbolLoc_ptr;
  v6 = getCNContactNamePrefixKeySymbolLoc_ptr;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactNamePrefixKey");
    v4[3] = (uint64_t)v0;
    getCNContactNamePrefixKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactNameSuffixKeySymbolLoc()
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
  v0 = (void *)getCNContactNameSuffixKeySymbolLoc_ptr;
  v6 = getCNContactNameSuffixKeySymbolLoc_ptr;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactNameSuffixKey");
    v4[3] = (uint64_t)v0;
    getCNContactNameSuffixKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactNicknameKeySymbolLoc()
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
  v0 = (void *)getCNContactNicknameKeySymbolLoc_ptr;
  v6 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactNicknameKey");
    v4[3] = (uint64_t)v0;
    getCNContactNicknameKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactOrganizationNameKeySymbolLoc()
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
  v0 = (void *)getCNContactOrganizationNameKeySymbolLoc_ptr;
  v6 = getCNContactOrganizationNameKeySymbolLoc_ptr;
  if (!getCNContactOrganizationNameKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactOrganizationNameKey");
    v4[3] = (uint64_t)v0;
    getCNContactOrganizationNameKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE7FF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactPhoneNumbersKeySymbolLoc()
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
  v0 = (void *)getCNContactPhoneNumbersKeySymbolLoc_ptr;
  v6 = getCNContactPhoneNumbersKeySymbolLoc_ptr;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactPhoneNumbersKey");
    v4[3] = (uint64_t)v0;
    getCNContactPhoneNumbersKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactPostalAddressesKeySymbolLoc()
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
  v0 = (void *)getCNContactPostalAddressesKeySymbolLoc_ptr;
  v6 = getCNContactPostalAddressesKeySymbolLoc_ptr;
  if (!getCNContactPostalAddressesKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactPostalAddressesKey");
    v4[3] = (uint64_t)v0;
    getCNContactPostalAddressesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE800A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactPreviousFamilyNameKeySymbolLoc()
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
  v0 = (void *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
  v6 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactPreviousFamilyNameKey");
    v4[3] = (uint64_t)v0;
    getCNContactPreviousFamilyNameKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactRelationsKeySymbolLoc()
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
  v0 = (void *)getCNContactRelationsKeySymbolLoc_ptr;
  v6 = getCNContactRelationsKeySymbolLoc_ptr;
  if (!getCNContactRelationsKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactRelationsKey");
    v4[3] = (uint64_t)v0;
    getCNContactRelationsKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE801C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactSocialProfilesKeySymbolLoc()
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
  v0 = (void *)getCNContactSocialProfilesKeySymbolLoc_ptr;
  v6 = getCNContactSocialProfilesKeySymbolLoc_ptr;
  if (!getCNContactSocialProfilesKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactSocialProfilesKey");
    v4[3] = (uint64_t)v0;
    getCNContactSocialProfilesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactTypeKeySymbolLoc()
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
  v0 = (void *)getCNContactTypeKeySymbolLoc_ptr;
  v6 = getCNContactTypeKeySymbolLoc_ptr;
  if (!getCNContactTypeKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactTypeKey");
    v4[3] = (uint64_t)v0;
    getCNContactTypeKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE802E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactUrlAddressesKeySymbolLoc()
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
  v0 = (void *)getCNContactUrlAddressesKeySymbolLoc_ptr;
  v6 = getCNContactUrlAddressesKeySymbolLoc_ptr;
  if (!getCNContactUrlAddressesKeySymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactUrlAddressesKey");
    v4[3] = (uint64_t)v0;
    getCNContactUrlAddressesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNLabelContactRelationAssistantSymbolLoc()
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
  v0 = (void *)getCNLabelContactRelationAssistantSymbolLoc_ptr;
  v6 = getCNLabelContactRelationAssistantSymbolLoc_ptr;
  if (!getCNLabelContactRelationAssistantSymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNLabelContactRelationAssistant");
    v4[3] = (uint64_t)v0;
    getCNLabelContactRelationAssistantSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNLabelContactRelationColleagueSymbolLoc()
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
  v0 = (void *)getCNLabelContactRelationColleagueSymbolLoc_ptr;
  v6 = getCNLabelContactRelationColleagueSymbolLoc_ptr;
  if (!getCNLabelContactRelationColleagueSymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNLabelContactRelationColleague");
    v4[3] = (uint64_t)v0;
    getCNLabelContactRelationColleagueSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNLabelContactRelationFemaleFriendSymbolLoc()
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
  v0 = (void *)getCNLabelContactRelationFemaleFriendSymbolLoc_ptr;
  v6 = getCNLabelContactRelationFemaleFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationFemaleFriendSymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNLabelContactRelationFemaleFriend");
    v4[3] = (uint64_t)v0;
    getCNLabelContactRelationFemaleFriendSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNLabelContactRelationFriendSymbolLoc()
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
  v0 = (void *)getCNLabelContactRelationFriendSymbolLoc_ptr;
  v6 = getCNLabelContactRelationFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationFriendSymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNLabelContactRelationFriend");
    v4[3] = (uint64_t)v0;
    getCNLabelContactRelationFriendSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE805B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNLabelContactRelationMaleFriendSymbolLoc()
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
  v0 = (void *)getCNLabelContactRelationMaleFriendSymbolLoc_ptr;
  v6 = getCNLabelContactRelationMaleFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationMaleFriendSymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNLabelContactRelationMaleFriend");
    v4[3] = (uint64_t)v0;
    getCNLabelContactRelationMaleFriendSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNLabelContactRelationManagerSymbolLoc()
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
  v0 = (void *)getCNLabelContactRelationManagerSymbolLoc_ptr;
  v6 = getCNLabelContactRelationManagerSymbolLoc_ptr;
  if (!getCNLabelContactRelationManagerSymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNLabelContactRelationManager");
    v4[3] = (uint64_t)v0;
    getCNLabelContactRelationManagerSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE806D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNLabelContactRelationTeacherSymbolLoc()
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
  v0 = (void *)getCNLabelContactRelationTeacherSymbolLoc_ptr;
  v6 = getCNLabelContactRelationTeacherSymbolLoc_ptr;
  if (!getCNLabelContactRelationTeacherSymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNLabelContactRelationTeacher");
    v4[3] = (uint64_t)v0;
    getCNLabelContactRelationTeacherSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCNContactStoreDidChangeNotificationSymbolLoc()
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
  v0 = (void *)getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  v6 = getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  if (!getCNContactStoreDidChangeNotificationSymbolLoc_ptr)
  {
    v1 = (void *)ContactsLibrary();
    v0 = dlsym(v1, "CNContactStoreDidChangeNotification");
    v4[3] = (uint64_t)v0;
    getCNContactStoreDidChangeNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE807F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCNContactStoreDidChangeNotification()
{
  id *v0;
  uint64_t CNContactBirthdayKey_cold_1;

  v0 = (id *)getCNContactStoreDidChangeNotificationSymbolLoc();
  if (v0)
    return *v0;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getCNChangeHistoryFetchRequestClass(CNContactBirthdayKey_cold_1);
}

objc_class *getCNChangeHistoryFetchRequestClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCNChangeHistoryFetchRequestClass_softClass;
  v6 = getCNChangeHistoryFetchRequestClass_softClass;
  if (!getCNChangeHistoryFetchRequestClass_softClass)
  {
    ContactsLibraryCore();
    Class = objc_getClass("CNChangeHistoryFetchRequest");
    v4[3] = (uint64_t)Class;
    getCNChangeHistoryFetchRequestClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DE808A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t HomeKitLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = HomeKitLibraryCore_frameworkLibrary;
  v6 = HomeKitLibraryCore_frameworkLibrary;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5500;
    v8 = *(_OWORD *)&off_1E26E5510;
    v1 = _sl_dlopen();
    v4[3] = v1;
    HomeKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ProactiveEventTrackerLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ProactiveEventTrackerLibraryCore_frameworkLibrary;
  v6 = ProactiveEventTrackerLibraryCore_frameworkLibrary;
  if (!ProactiveEventTrackerLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5520;
    v8 = *(_OWORD *)&off_1E26E5530;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ProactiveEventTrackerLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PhotosLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PhotosLibraryCore_frameworkLibrary;
  v6 = PhotosLibraryCore_frameworkLibrary;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5540;
    v8 = *(_OWORD *)&off_1E26E5550;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PhotosLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t FMFLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = FMFLibraryCore_frameworkLibrary;
  v6 = FMFLibraryCore_frameworkLibrary;
  if (!FMFLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5560;
    v8 = *(_OWORD *)&off_1E26E5570;
    v1 = _sl_dlopen();
    v4[3] = v1;
    FMFLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreRoutineLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreRoutineLibraryCore_frameworkLibrary;
  v6 = CoreRoutineLibraryCore_frameworkLibrary;
  if (!CoreRoutineLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5580;
    v8 = *(_OWORD *)&off_1E26E5590;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreRoutineLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t HealthKitLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = HealthKitLibraryCore_frameworkLibrary;
  v6 = HealthKitLibraryCore_frameworkLibrary;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E55A0;
    v8 = *(_OWORD *)&off_1E26E55B0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    HealthKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getHKMedicalIDStoreClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getHKMedicalIDStoreClass_softClass;
  v6 = getHKMedicalIDStoreClass_softClass;
  if (!getHKMedicalIDStoreClass_softClass)
  {
    HealthKitLibraryCore();
    Class = objc_getClass("HKMedicalIDStore");
    v4[3] = (uint64_t)Class;
    getHKMedicalIDStoreClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DE80DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t FamilyCircleLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = FamilyCircleLibraryCore_frameworkLibrary;
  v6 = FamilyCircleLibraryCore_frameworkLibrary;
  if (!FamilyCircleLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E55C0;
    v8 = *(_OWORD *)&off_1E26E55D0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    FamilyCircleLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CallHistoryLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CallHistoryLibraryCore_frameworkLibrary;
  v6 = CallHistoryLibraryCore_frameworkLibrary;
  if (!CallHistoryLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E55E0;
    v8 = *(_OWORD *)&off_1E26E55F0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CallHistoryLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE80F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CallHistoryLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = CallHistoryLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getkCHCallStatusConnectedOutgoingSymbolLoc()
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
  v0 = (void *)getkCHCallStatusConnectedOutgoingSymbolLoc_ptr;
  v6 = getkCHCallStatusConnectedOutgoingSymbolLoc_ptr;
  if (!getkCHCallStatusConnectedOutgoingSymbolLoc_ptr)
  {
    v1 = (void *)CallHistoryLibrary();
    v0 = dlsym(v1, "kCHCallStatusConnectedOutgoing");
    v4[3] = (uint64_t)v0;
    getkCHCallStatusConnectedOutgoingSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t BiomeStreamsLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = BiomeStreamsLibraryCore_frameworkLibrary;
  v6 = BiomeStreamsLibraryCore_frameworkLibrary;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5600;
    v8 = *(_OWORD *)&off_1E26E5610;
    v1 = _sl_dlopen();
    v4[3] = v1;
    BiomeStreamsLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE8112C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMLibraryStreamsPrunerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMLibraryStreamsPrunerClass_softClass;
  v6 = getBMLibraryStreamsPrunerClass_softClass;
  if (!getBMLibraryStreamsPrunerClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMLibraryStreamsPruner");
    v4[3] = (uint64_t)Class;
    getBMLibraryStreamsPrunerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DE811C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t BiomeStorageLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = BiomeStorageLibraryCore_frameworkLibrary;
  v6 = BiomeStorageLibraryCore_frameworkLibrary;
  if (!BiomeStorageLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5620;
    v8 = *(_OWORD *)&off_1E26E5630;
    v1 = _sl_dlopen();
    v4[3] = v1;
    BiomeStorageLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMStoreConfigClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMStoreConfigClass_softClass;
  v6 = getBMStoreConfigClass_softClass;
  if (!getBMStoreConfigClass_softClass)
  {
    BiomeStorageLibraryCore();
    Class = objc_getClass("BMStoreConfig");
    v4[3] = (uint64_t)Class;
    getBMStoreConfigClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DE8131C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMStoreStreamClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMStoreStreamClass_softClass;
  v6 = getBMStoreStreamClass_softClass;
  if (!getBMStoreStreamClass_softClass)
  {
    BiomeStorageLibraryCore();
    Class = objc_getClass("BMStoreStream");
    v4[3] = (uint64_t)Class;
    getBMStoreStreamClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DE813B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t RelevanceEngineLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = RelevanceEngineLibraryCore_frameworkLibrary;
  v6 = RelevanceEngineLibraryCore_frameworkLibrary;
  if (!RelevanceEngineLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5640;
    v8 = *(_OWORD *)&off_1E26E5650;
    v1 = _sl_dlopen();
    v4[3] = v1;
    RelevanceEngineLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t RelevanceEngineLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = RelevanceEngineLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getREIsSupergreenUsedInLastOneDaySymbolLoc()
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
  v0 = (void *)getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr;
  v6 = getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr;
  if (!getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr)
  {
    v1 = (void *)RelevanceEngineLibrary();
    v0 = dlsym(v1, "REIsSupergreenUsedInLastOneDay");
    v4[3] = (uint64_t)v0;
    getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t slREIsSupergreenUsedInLastOneDay()
{
  uint64_t (*REIsSupergreenUsedInLastOneDaySymbolLoc)(void);
  uint64_t CNContactBirthdayKey_cold_1;

  REIsSupergreenUsedInLastOneDaySymbolLoc = (uint64_t (*)(void))getREIsSupergreenUsedInLastOneDaySymbolLoc();
  if (REIsSupergreenUsedInLastOneDaySymbolLoc)
    return REIsSupergreenUsedInLastOneDaySymbolLoc();
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getREIsSupergreenUsedInLastSevenDaysSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getREIsSupergreenUsedInLastSevenDaysSymbolLoc()
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
  v0 = (void *)getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr;
  v6 = getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr;
  if (!getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr)
  {
    v1 = (void *)RelevanceEngineLibrary();
    v0 = dlsym(v1, "REIsSupergreenUsedInLastSevenDays");
    v4[3] = (uint64_t)v0;
    getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE8160C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t slREIsSupergreenUsedInLastSevenDays()
{
  uint64_t (*REIsSupergreenUsedInLastSevenDaysSymbolLoc)(void);
  uint64_t CNContactBirthdayKey_cold_1;

  REIsSupergreenUsedInLastSevenDaysSymbolLoc = (uint64_t (*)(void))getREIsSupergreenUsedInLastSevenDaysSymbolLoc();
  if (REIsSupergreenUsedInLastSevenDaysSymbolLoc)
    return REIsSupergreenUsedInLastSevenDaysSymbolLoc();
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getRESupergreenSuggestedImageDonationWidthSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getRESupergreenSuggestedImageDonationWidthSymbolLoc()
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
  v0 = (void *)getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr;
  v6 = getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr;
  if (!getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr)
  {
    v1 = (void *)RelevanceEngineLibrary();
    v0 = dlsym(v1, "RESupergreenSuggestedImageDonationWidth");
    v4[3] = (uint64_t)v0;
    getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE816B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t slRESupergreenSuggestedImageDonationWidth()
{
  uint64_t (*RESupergreenSuggestedImageDonationWidthSymbolLoc)(void);

  RESupergreenSuggestedImageDonationWidthSymbolLoc = (uint64_t (*)(void))getRESupergreenSuggestedImageDonationWidthSymbolLoc();
  if (RESupergreenSuggestedImageDonationWidthSymbolLoc)
    return RESupergreenSuggestedImageDonationWidthSymbolLoc();
  getCNContactBirthdayKey_cold_1();
  return ScreenTimeCoreLibraryCore();
}

uint64_t ScreenTimeCoreLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ScreenTimeCoreLibraryCore_frameworkLibrary;
  v6 = ScreenTimeCoreLibraryCore_frameworkLibrary;
  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5660;
    v8 = *(_OWORD *)&off_1E26E5670;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ScreenTimeCoreLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE8179C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AssistantServicesLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AssistantServicesLibraryCore_frameworkLibrary;
  v6 = AssistantServicesLibraryCore_frameworkLibrary;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5680;
    v8 = *(_OWORD *)&off_1E26E5690;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AssistantServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = AssistantServicesLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc()
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
  v0 = (void *)getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr;
  v6 = getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr;
  if (!getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "kAFCloudStorageDeletedByUserDarwinNotification");
    v4[3] = (uint64_t)v0;
    getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE8194C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc()
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
  v0 = (void *)getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr;
  v6 = getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr;
  if (!getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "kAFCloudSyncPreferenceDidChangeDarwinNotification");
    v4[3] = (uint64_t)v0;
    getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE819DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t libMobileGestaltLibraryCore()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = libMobileGestaltLibraryCore_frameworkLibrary;
  v5 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v6 = xmmword_1E26E56A0;
    v7 = 0;
    v0 = _sl_dlopen();
    v3[3] = v0;
    libMobileGestaltLibraryCore_frameworkLibrary = v0;
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18DE81AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t libMobileGestaltLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = libMobileGestaltLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getMGCopyAnswerSymbolLoc()
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
  v0 = (void *)getMGCopyAnswerSymbolLoc_ptr;
  v6 = getMGCopyAnswerSymbolLoc_ptr;
  if (!getMGCopyAnswerSymbolLoc_ptr)
  {
    v1 = (void *)libMobileGestaltLibrary();
    v0 = dlsym(v1, "MGCopyAnswer");
    v4[3] = (uint64_t)v0;
    getMGCopyAnswerSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t slMGCopyAnswer(uint64_t a1, uint64_t a2)
{
  uint64_t (*MGCopyAnswerSymbolLoc)(uint64_t, uint64_t);

  MGCopyAnswerSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getMGCopyAnswerSymbolLoc();
  if (MGCopyAnswerSymbolLoc)
    return MGCopyAnswerSymbolLoc(a1, a2);
  getCNContactBirthdayKey_cold_1();
  return MobileKeyBagLibraryCore();
}

uint64_t MobileKeyBagLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = MobileKeyBagLibraryCore_frameworkLibrary;
  v6 = MobileKeyBagLibraryCore_frameworkLibrary;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E56B8;
    v8 = *(_OWORD *)&off_1E26E56C8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    MobileKeyBagLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileKeyBagLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = MobileKeyBagLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getMKBDeviceFormattedForContentProtectionSymbolLoc()
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
  v0 = (void *)getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr;
  v6 = getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr;
  if (!getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr)
  {
    v1 = (void *)MobileKeyBagLibrary();
    v0 = dlsym(v1, "MKBDeviceFormattedForContentProtection");
    v4[3] = (uint64_t)v0;
    getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t slMKBDeviceFormattedForContentProtection()
{
  uint64_t (*MKBDeviceFormattedForContentProtectionSymbolLoc)(void);
  uint64_t CNContactBirthdayKey_cold_1;

  MKBDeviceFormattedForContentProtectionSymbolLoc = (uint64_t (*)(void))getMKBDeviceFormattedForContentProtectionSymbolLoc();
  if (MKBDeviceFormattedForContentProtectionSymbolLoc)
    return MKBDeviceFormattedForContentProtectionSymbolLoc();
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getMKBDeviceUnlockedSinceBootSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMKBDeviceUnlockedSinceBootSymbolLoc()
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
  v0 = (void *)getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v6 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v1 = (void *)MobileKeyBagLibrary();
    v0 = dlsym(v1, "MKBDeviceUnlockedSinceBoot");
    v4[3] = (uint64_t)v0;
    getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t slMKBDeviceUnlockedSinceBoot()
{
  uint64_t (*MKBDeviceUnlockedSinceBootSymbolLoc)(void);

  MKBDeviceUnlockedSinceBootSymbolLoc = (uint64_t (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc();
  if (MKBDeviceUnlockedSinceBootSymbolLoc)
    return MKBDeviceUnlockedSinceBootSymbolLoc();
  getCNContactBirthdayKey_cold_1();
  return CoreMotionLibraryCore();
}

uint64_t CoreMotionLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreMotionLibraryCore_frameworkLibrary;
  v6 = CoreMotionLibraryCore_frameworkLibrary;
  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E56F8;
    v8 = *(_OWORD *)&off_1E26E5708;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreMotionLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE81F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getCMMotionActivityManagerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getCMMotionActivityManagerClass_softClass;
  v6 = getCMMotionActivityManagerClass_softClass;
  if (!getCMMotionActivityManagerClass_softClass)
  {
    CoreMotionLibraryCore();
    Class = objc_getClass("CMMotionActivityManager");
    v4[3] = (uint64_t)Class;
    getCMMotionActivityManagerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DE81FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AggregateDictionaryLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AggregateDictionaryLibraryCore_frameworkLibrary;
  v6 = AggregateDictionaryLibraryCore_frameworkLibrary;
  if (!AggregateDictionaryLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5718;
    v8 = *(_OWORD *)&off_1E26E5728;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AggregateDictionaryLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AggregateDictionaryLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = AggregateDictionaryLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getADClientClearDistributionKeySymbolLoc()
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
  v0 = (void *)getADClientClearDistributionKeySymbolLoc_ptr;
  v6 = getADClientClearDistributionKeySymbolLoc_ptr;
  if (!getADClientClearDistributionKeySymbolLoc_ptr)
  {
    v1 = (void *)AggregateDictionaryLibrary();
    v0 = dlsym(v1, "ADClientClearDistributionKey");
    v4[3] = (uint64_t)v0;
    getADClientClearDistributionKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *slADClientClearDistributionKey(uint64_t a1)
{
  uint64_t (*ADClientClearDistributionKeySymbolLoc)(uint64_t);

  ADClientClearDistributionKeySymbolLoc = (uint64_t (*)(uint64_t))getADClientClearDistributionKeySymbolLoc();
  if (ADClientClearDistributionKeySymbolLoc)
    return (void *)ADClientClearDistributionKeySymbolLoc(a1);
  getCNContactBirthdayKey_cold_1();
  return getADClientClearScalarKeySymbolLoc();
}

void *getADClientClearScalarKeySymbolLoc()
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
  v0 = (void *)getADClientClearScalarKeySymbolLoc_ptr;
  v6 = getADClientClearScalarKeySymbolLoc_ptr;
  if (!getADClientClearScalarKeySymbolLoc_ptr)
  {
    v1 = (void *)AggregateDictionaryLibrary();
    v0 = dlsym(v1, "ADClientClearScalarKey");
    v4[3] = (uint64_t)v0;
    getADClientClearScalarKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t slADClientClearScalarKey(uint64_t a1)
{
  uint64_t (*ADClientClearScalarKeySymbolLoc)(uint64_t);
  uint64_t CNContactBirthdayKey_cold_1;

  ADClientClearScalarKeySymbolLoc = (uint64_t (*)(uint64_t))getADClientClearScalarKeySymbolLoc();
  if (ADClientClearScalarKeySymbolLoc)
    return ADClientClearScalarKeySymbolLoc(a1);
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getADClientSetValueForDistributionKeySymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getADClientSetValueForDistributionKeySymbolLoc()
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
  v0 = (void *)getADClientSetValueForDistributionKeySymbolLoc_ptr;
  v6 = getADClientSetValueForDistributionKeySymbolLoc_ptr;
  if (!getADClientSetValueForDistributionKeySymbolLoc_ptr)
  {
    v1 = (void *)AggregateDictionaryLibrary();
    v0 = dlsym(v1, "ADClientSetValueForDistributionKey");
    v4[3] = (uint64_t)v0;
    getADClientSetValueForDistributionKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE822D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *slADClientSetValueForDistributionKey(uint64_t a1, double a2)
{
  uint64_t (*ADClientSetValueForDistributionKeySymbolLoc)(uint64_t, double);

  ADClientSetValueForDistributionKeySymbolLoc = (uint64_t (*)(uint64_t, double))getADClientSetValueForDistributionKeySymbolLoc();
  if (ADClientSetValueForDistributionKeySymbolLoc)
    return (void *)ADClientSetValueForDistributionKeySymbolLoc(a1, a2);
  getCNContactBirthdayKey_cold_1();
  return getADClientSetValueForScalarKeySymbolLoc();
}

void *getADClientSetValueForScalarKeySymbolLoc()
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
  v0 = (void *)getADClientSetValueForScalarKeySymbolLoc_ptr;
  v6 = getADClientSetValueForScalarKeySymbolLoc_ptr;
  if (!getADClientSetValueForScalarKeySymbolLoc_ptr)
  {
    v1 = (void *)AggregateDictionaryLibrary();
    v0 = dlsym(v1, "ADClientSetValueForScalarKey");
    v4[3] = (uint64_t)v0;
    getADClientSetValueForScalarKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE823A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t slADClientSetValueForScalarKey(uint64_t a1, uint64_t a2)
{
  uint64_t (*ADClientSetValueForScalarKeySymbolLoc)(uint64_t, uint64_t);
  uint64_t CNContactBirthdayKey_cold_1;

  ADClientSetValueForScalarKeySymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getADClientSetValueForScalarKeySymbolLoc();
  if (ADClientSetValueForScalarKeySymbolLoc)
    return ADClientSetValueForScalarKeySymbolLoc(a1, a2);
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return CoreSpotlightLibraryCore(CNContactBirthdayKey_cold_1);
}

uint64_t CoreSpotlightLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreSpotlightLibraryCore_frameworkLibrary;
  v6 = CoreSpotlightLibraryCore_frameworkLibrary;
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5738;
    v8 = *(_OWORD *)&off_1E26E5748;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreSpotlightLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE824A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreSpotlightLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = CoreSpotlightLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getCSMailboxArchiveSymbolLoc()
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
  v0 = (void *)getCSMailboxArchiveSymbolLoc_ptr;
  v6 = getCSMailboxArchiveSymbolLoc_ptr;
  if (!getCSMailboxArchiveSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "CSMailboxArchive");
    v4[3] = (uint64_t)v0;
    getCSMailboxArchiveSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCSMailboxInboxSymbolLoc()
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
  v0 = (void *)getCSMailboxInboxSymbolLoc_ptr;
  v6 = getCSMailboxInboxSymbolLoc_ptr;
  if (!getCSMailboxInboxSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "CSMailboxInbox");
    v4[3] = (uint64_t)v0;
    getCSMailboxInboxSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getCSMailboxSentSymbolLoc()
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
  v0 = (void *)getCSMailboxSentSymbolLoc_ptr;
  v6 = getCSMailboxSentSymbolLoc_ptr;
  if (!getCSMailboxSentSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "CSMailboxSent");
    v4[3] = (uint64_t)v0;
    getCSMailboxSentSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE826A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getMDItemAccountHandlesSymbolLoc()
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
  v0 = (void *)getMDItemAccountHandlesSymbolLoc_ptr;
  v6 = getMDItemAccountHandlesSymbolLoc_ptr;
  if (!getMDItemAccountHandlesSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemAccountHandles");
    v4[3] = (uint64_t)v0;
    getMDItemAccountHandlesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemAccountHandles()
{
  id *MDItemAccountHandlesSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemAccountHandlesSymbolLoc = (id *)getMDItemAccountHandlesSymbolLoc();
  if (MDItemAccountHandlesSymbolLoc)
    return *MDItemAccountHandlesSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemAccountIdentifierSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemAccountIdentifierSymbolLoc()
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
  v0 = (void *)getMDItemAccountIdentifierSymbolLoc_ptr;
  v6 = getMDItemAccountIdentifierSymbolLoc_ptr;
  if (!getMDItemAccountIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemAccountIdentifier");
    v4[3] = (uint64_t)v0;
    getMDItemAccountIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE827E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemAccountIdentifier()
{
  id *MDItemAccountIdentifierSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemAccountIdentifierSymbolLoc = (id *)getMDItemAccountIdentifierSymbolLoc();
  if (MDItemAccountIdentifierSymbolLoc)
    return *MDItemAccountIdentifierSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemAdditionalRecipientPersonsSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemAdditionalRecipientPersonsSymbolLoc()
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
  v0 = (void *)getMDItemAdditionalRecipientPersonsSymbolLoc_ptr;
  v6 = getMDItemAdditionalRecipientPersonsSymbolLoc_ptr;
  if (!getMDItemAdditionalRecipientPersonsSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemAdditionalRecipientPersons");
    v4[3] = (uint64_t)v0;
    getMDItemAdditionalRecipientPersonsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemAdditionalRecipientPersons()
{
  id *MDItemAdditionalRecipientPersonsSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemAdditionalRecipientPersonsSymbolLoc = (id *)getMDItemAdditionalRecipientPersonsSymbolLoc();
  if (MDItemAdditionalRecipientPersonsSymbolLoc)
    return *MDItemAdditionalRecipientPersonsSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemAuthorPersonsSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemAuthorPersonsSymbolLoc()
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
  v0 = (void *)getMDItemAuthorPersonsSymbolLoc_ptr;
  v6 = getMDItemAuthorPersonsSymbolLoc_ptr;
  if (!getMDItemAuthorPersonsSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemAuthorPersons");
    v4[3] = (uint64_t)v0;
    getMDItemAuthorPersonsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemAuthorPersons()
{
  id *MDItemAuthorPersonsSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemAuthorPersonsSymbolLoc = (id *)getMDItemAuthorPersonsSymbolLoc();
  if (MDItemAuthorPersonsSymbolLoc)
    return *MDItemAuthorPersonsSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemContentCreationDateSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemContentCreationDateSymbolLoc()
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
  v0 = (void *)getMDItemContentCreationDateSymbolLoc_ptr;
  v6 = getMDItemContentCreationDateSymbolLoc_ptr;
  if (!getMDItemContentCreationDateSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemContentCreationDate");
    v4[3] = (uint64_t)v0;
    getMDItemContentCreationDateSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE829F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemContentCreationDate()
{
  id *MDItemContentCreationDateSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemContentCreationDateSymbolLoc = (id *)getMDItemContentCreationDateSymbolLoc();
  if (MDItemContentCreationDateSymbolLoc)
    return *MDItemContentCreationDateSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemContentTypeSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemContentTypeSymbolLoc()
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
  v0 = (void *)getMDItemContentTypeSymbolLoc_ptr;
  v6 = getMDItemContentTypeSymbolLoc_ptr;
  if (!getMDItemContentTypeSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemContentType");
    v4[3] = (uint64_t)v0;
    getMDItemContentTypeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemContentType()
{
  id *MDItemContentTypeSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemContentTypeSymbolLoc = (id *)getMDItemContentTypeSymbolLoc();
  if (MDItemContentTypeSymbolLoc)
    return *MDItemContentTypeSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemDisplayNameSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemDisplayNameSymbolLoc()
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
  v0 = (void *)getMDItemDisplayNameSymbolLoc_ptr;
  v6 = getMDItemDisplayNameSymbolLoc_ptr;
  if (!getMDItemDisplayNameSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemDisplayName");
    v4[3] = (uint64_t)v0;
    getMDItemDisplayNameSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemDisplayName()
{
  id *MDItemDisplayNameSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemDisplayNameSymbolLoc = (id *)getMDItemDisplayNameSymbolLoc();
  if (MDItemDisplayNameSymbolLoc)
    return *MDItemDisplayNameSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemEmailHeadersDictionarySymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemEmailHeadersDictionarySymbolLoc()
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
  v0 = (void *)getMDItemEmailHeadersDictionarySymbolLoc_ptr;
  v6 = getMDItemEmailHeadersDictionarySymbolLoc_ptr;
  if (!getMDItemEmailHeadersDictionarySymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemEmailHeadersDictionary");
    v4[3] = (uint64_t)v0;
    getMDItemEmailHeadersDictionarySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemEmailHeadersDictionary()
{
  id *MDItemEmailHeadersDictionarySymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemEmailHeadersDictionarySymbolLoc = (id *)getMDItemEmailHeadersDictionarySymbolLoc();
  if (MDItemEmailHeadersDictionarySymbolLoc)
    return *MDItemEmailHeadersDictionarySymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemHiddenAdditionalRecipientPersonsSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemHiddenAdditionalRecipientPersonsSymbolLoc()
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
  v0 = (void *)getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr;
  v6 = getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr;
  if (!getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemHiddenAdditionalRecipientPersons");
    v4[3] = (uint64_t)v0;
    getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemHiddenAdditionalRecipientPersons()
{
  id *MDItemHiddenAdditionalRecipientPersonsSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemHiddenAdditionalRecipientPersonsSymbolLoc = (id *)getMDItemHiddenAdditionalRecipientPersonsSymbolLoc();
  if (MDItemHiddenAdditionalRecipientPersonsSymbolLoc)
    return *MDItemHiddenAdditionalRecipientPersonsSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemMailboxesSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemMailboxesSymbolLoc()
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
  v0 = (void *)getMDItemMailboxesSymbolLoc_ptr;
  v6 = getMDItemMailboxesSymbolLoc_ptr;
  if (!getMDItemMailboxesSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemMailboxes");
    v4[3] = (uint64_t)v0;
    getMDItemMailboxesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemMailboxes()
{
  id *MDItemMailboxesSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemMailboxesSymbolLoc = (id *)getMDItemMailboxesSymbolLoc();
  if (MDItemMailboxesSymbolLoc)
    return *MDItemMailboxesSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemPrimaryRecipientPersonsSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemPrimaryRecipientPersonsSymbolLoc()
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
  v0 = (void *)getMDItemPrimaryRecipientPersonsSymbolLoc_ptr;
  v6 = getMDItemPrimaryRecipientPersonsSymbolLoc_ptr;
  if (!getMDItemPrimaryRecipientPersonsSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemPrimaryRecipientPersons");
    v4[3] = (uint64_t)v0;
    getMDItemPrimaryRecipientPersonsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemPrimaryRecipientPersons()
{
  id *MDItemPrimaryRecipientPersonsSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemPrimaryRecipientPersonsSymbolLoc = (id *)getMDItemPrimaryRecipientPersonsSymbolLoc();
  if (MDItemPrimaryRecipientPersonsSymbolLoc)
    return *MDItemPrimaryRecipientPersonsSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemRecipientEmailAddressesSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemRecipientEmailAddressesSymbolLoc()
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
  v0 = (void *)getMDItemRecipientEmailAddressesSymbolLoc_ptr;
  v6 = getMDItemRecipientEmailAddressesSymbolLoc_ptr;
  if (!getMDItemRecipientEmailAddressesSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemRecipientEmailAddresses");
    v4[3] = (uint64_t)v0;
    getMDItemRecipientEmailAddressesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemRecipientEmailAddresses()
{
  id *MDItemRecipientEmailAddressesSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemRecipientEmailAddressesSymbolLoc = (id *)getMDItemRecipientEmailAddressesSymbolLoc();
  if (MDItemRecipientEmailAddressesSymbolLoc)
    return *MDItemRecipientEmailAddressesSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemRecipientsSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemRecipientsSymbolLoc()
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
  v0 = (void *)getMDItemRecipientsSymbolLoc_ptr;
  v6 = getMDItemRecipientsSymbolLoc_ptr;
  if (!getMDItemRecipientsSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemRecipients");
    v4[3] = (uint64_t)v0;
    getMDItemRecipientsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE82F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemRecipients()
{
  id *MDItemRecipientsSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  MDItemRecipientsSymbolLoc = (id *)getMDItemRecipientsSymbolLoc();
  if (MDItemRecipientsSymbolLoc)
    return *MDItemRecipientsSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDItemSubjectSymbolLoc(CNContactBirthdayKey_cold_1);
}

void *getMDItemSubjectSymbolLoc()
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
  v0 = (void *)getMDItemSubjectSymbolLoc_ptr;
  v6 = getMDItemSubjectSymbolLoc_ptr;
  if (!getMDItemSubjectSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDItemSubject");
    v4[3] = (uint64_t)v0;
    getMDItemSubjectSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE83028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemSubject()
{
  id *MDItemSubjectSymbolLoc;

  MDItemSubjectSymbolLoc = (id *)getMDItemSubjectSymbolLoc();
  if (MDItemSubjectSymbolLoc)
    return *MDItemSubjectSymbolLoc;
  getCNContactBirthdayKey_cold_1();
  return getMDSearchQueryOptionFetchAttributesSymbolLoc();
}

void *getMDSearchQueryOptionFetchAttributesSymbolLoc()
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
  v0 = (void *)getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr;
  v6 = getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr;
  if (!getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = dlsym(v1, "MDSearchQueryOptionFetchAttributes");
    v4[3] = (uint64_t)v0;
    getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE830D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDSearchQueryOptionFetchAttributes()
{
  id *AttributesSymbolLoc;
  uint64_t CNContactBirthdayKey_cold_1;

  AttributesSymbolLoc = (id *)getMDSearchQueryOptionFetchAttributesSymbolLoc();
  if (AttributesSymbolLoc)
    return *AttributesSymbolLoc;
  CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return (id)getMDSearchQueryClass(CNContactBirthdayKey_cold_1);
}

objc_class *getMDSearchQueryClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getMDSearchQueryClass_softClass;
  v6 = getMDSearchQueryClass_softClass;
  if (!getMDSearchQueryClass_softClass)
  {
    CoreSpotlightLibraryCore();
    Class = objc_getClass("MDSearchQuery");
    v4[3] = (uint64_t)Class;
    getMDSearchQueryClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18DE8318C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SpotlightReceiverLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = SpotlightReceiverLibraryCore_frameworkLibrary;
  v6 = SpotlightReceiverLibraryCore_frameworkLibrary;
  if (!SpotlightReceiverLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5758;
    v8 = *(_OWORD *)&off_1E26E5768;
    v1 = _sl_dlopen();
    v4[3] = v1;
    SpotlightReceiverLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE83254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SpotlightReceiverLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = SpotlightReceiverLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getSpotlightReceiverRegisterSymbolLoc()
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
  v0 = (void *)getSpotlightReceiverRegisterSymbolLoc_ptr;
  v6 = getSpotlightReceiverRegisterSymbolLoc_ptr;
  if (!getSpotlightReceiverRegisterSymbolLoc_ptr)
  {
    v1 = (void *)SpotlightReceiverLibrary();
    v0 = dlsym(v1, "SpotlightReceiverRegister");
    v4[3] = (uint64_t)v0;
    getSpotlightReceiverRegisterSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE8333C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void cd_SpotlightReceiverRegister(void *a1, void *a2)
{
  id v3;
  void (*SpotlightReceiverRegisterSymbolLoc)(id, id);
  id v5;

  v5 = a1;
  v3 = a2;
  SpotlightReceiverRegisterSymbolLoc = (void (*)(id, id))getSpotlightReceiverRegisterSymbolLoc();
  if (SpotlightReceiverRegisterSymbolLoc)
  {
    SpotlightReceiverRegisterSymbolLoc(v5, v3);

  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    CoreServicesLibraryCore();
  }
}

uint64_t CoreServicesLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreServicesLibraryCore_frameworkLibrary;
  v6 = CoreServicesLibraryCore_frameworkLibrary;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5778;
    v8 = *(_OWORD *)&off_1E26E5788;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE8345C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreServicesLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = CoreServicesLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getkUTTypeMessageSymbolLoc()
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
  v0 = (void *)getkUTTypeMessageSymbolLoc_ptr;
  v6 = getkUTTypeMessageSymbolLoc_ptr;
  if (!getkUTTypeMessageSymbolLoc_ptr)
  {
    v1 = (void *)CoreServicesLibrary();
    v0 = dlsym(v1, "kUTTypeMessage");
    v4[3] = (uint64_t)v0;
    getkUTTypeMessageSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE83544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getkUTTypeEmailMessageSymbolLoc()
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
  v0 = (void *)getkUTTypeEmailMessageSymbolLoc_ptr;
  v6 = getkUTTypeEmailMessageSymbolLoc_ptr;
  if (!getkUTTypeEmailMessageSymbolLoc_ptr)
  {
    v1 = (void *)CoreServicesLibrary();
    v0 = dlsym(v1, "kUTTypeEmailMessage");
    v4[3] = (uint64_t)v0;
    getkUTTypeEmailMessageSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE835D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getkUTTypeCalendarEventSymbolLoc()
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
  v0 = (void *)getkUTTypeCalendarEventSymbolLoc_ptr;
  v6 = getkUTTypeCalendarEventSymbolLoc_ptr;
  if (!getkUTTypeCalendarEventSymbolLoc_ptr)
  {
    v1 = (void *)CoreServicesLibrary();
    v0 = dlsym(v1, "kUTTypeCalendarEvent");
    v4[3] = (uint64_t)v0;
    getkUTTypeCalendarEventSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE83664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getUTTypeConformsToSymbolLoc()
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
  v0 = (void *)getUTTypeConformsToSymbolLoc_ptr;
  v6 = getUTTypeConformsToSymbolLoc_ptr;
  if (!getUTTypeConformsToSymbolLoc_ptr)
  {
    v1 = (void *)CoreServicesLibrary();
    v0 = dlsym(v1, "UTTypeConformsTo");
    v4[3] = (uint64_t)v0;
    getUTTypeConformsToSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE836F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t cd_UTTypeConformsTo(uint64_t a1, uint64_t a2)
{
  uint64_t (*UTTypeConformsToSymbolLoc)(uint64_t, uint64_t);

  UTTypeConformsToSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getUTTypeConformsToSymbolLoc();
  if (UTTypeConformsToSymbolLoc)
    return UTTypeConformsToSymbolLoc(a1, a2);
  getCNContactBirthdayKey_cold_1();
  return CoreDuetContextLibraryCore();
}

uint64_t CoreDuetContextLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreDuetContextLibraryCore_frameworkLibrary;
  v6 = CoreDuetContextLibraryCore_frameworkLibrary;
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E5798;
    v8 = *(_OWORD *)&off_1E26E57A8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreDuetContextLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE837F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t IMCoreLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = IMCoreLibraryCore_frameworkLibrary;
  v6 = IMCoreLibraryCore_frameworkLibrary;
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E26E57B8;
    v8 = *(_OWORD *)&off_1E26E57C8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    IMCoreLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE838BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t IMCoreLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = IMCoreLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc()
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
  v0 = (void *)getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr;
  v6 = getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr;
  if (!getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr)
  {
    v1 = (void *)IMCoreLibrary();
    v0 = dlsym(v1, "IMSPIGetDisplayNameAndParticipantsForChatWithGUID");
    v4[3] = (uint64_t)v0;
    getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18DE839A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sIMSPIGetDisplayNameAndParticipantsForChatWithGUID(void *a1)
{
  id v1;
  void (*IMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc)(id);
  void *v3;
  void *CNContactBirthdayKey_cold_1;
  SEL v6;

  v1 = a1;
  IMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc = (void (*)(id))getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc();
  if (IMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc)
  {
    IMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else
  {
    CNContactBirthdayKey_cold_1 = (void *)getCNContactBirthdayKey_cold_1();
    return (id)+[_DKFetchRecordZoneChangesOperation _removesDependenciesAfterFinish](CNContactBirthdayKey_cold_1, v6);
  }
}

void sub_18DE85080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DE85940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18DE86090(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DE86218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _logChannel()
{
  if (_logChannel_onceToken != -1)
    dispatch_once(&_logChannel_onceToken, &__block_literal_global_379);
  return (id)_logChannel_logChannel;
}

void ___logChannel_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.receiver.notifier", "");
  v1 = (void *)_logChannel_logChannel;
  _logChannel_logChannel = (uint64_t)v0;

  if (!_logChannel_logChannel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    ___logChannel_block_invoke_cold_1();
}

void OUTLINED_FUNCTION_2_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t _DKPRValueTypeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            LODWORD(v25) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 16) = v25;
      }
      else if ((v10 >> 3) == 2)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_39:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DE87E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DE88F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_18DE89114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE89778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE8990C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE8A160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_18DE8B5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DE8DB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CloudFamilyAnalysisPETContactEventReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char v108;
  unsigned int v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char v113;
  char v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char v120;
  char v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  char v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  unint64_t v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  unint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  unint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  unint64_t v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  unint64_t v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  unint64_t v212;
  uint64_t v213;
  unint64_t v214;
  uint64_t v215;
  unint64_t v216;
  uint64_t v217;
  unint64_t v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  unint64_t v222;
  uint64_t v223;
  unint64_t v224;
  uint64_t v225;
  unint64_t v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  unint64_t v232;
  uint64_t v233;
  unint64_t v234;
  uint64_t v235;
  unint64_t v236;
  uint64_t v237;
  unint64_t v238;
  uint64_t v239;
  unint64_t v240;
  char v241;
  unsigned int v242;
  uint64_t v243;
  unint64_t v244;
  char v245;
  uint64_t v246;
  void *v247;
  char v248;
  unsigned int v249;
  uint64_t v250;
  unint64_t v251;
  char v252;
  char v253;
  unsigned int v254;
  uint64_t v255;
  unint64_t v256;
  char v257;
  char v258;
  unsigned int v259;
  uint64_t v260;
  unint64_t v261;
  char v262;
  char v263;
  unsigned int v264;
  uint64_t v265;
  unint64_t v266;
  char v267;
  char v268;
  unsigned int v269;
  uint64_t v270;
  unint64_t v271;
  char v272;
  char v273;
  unsigned int v274;
  uint64_t v275;
  unint64_t v276;
  char v277;
  char v278;
  unsigned int v279;
  uint64_t v280;
  unint64_t v281;
  char v282;
  char v283;
  unsigned int v284;
  uint64_t v285;
  unint64_t v286;
  char v287;
  char v288;
  unsigned int v289;
  uint64_t v290;
  unint64_t v291;
  char v292;
  char v293;
  unsigned int v294;
  uint64_t v295;
  unint64_t v296;
  char v297;
  char v298;
  unsigned int v299;
  uint64_t v300;
  unint64_t v301;
  char v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          a1[108] |= 0x2000uLL;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            v22 = v21 + 1;
            if (v21 == -1 || v22 > *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v22;
            v19 |= (unint64_t)(v23 & 0x7F) << v17;
            if ((v23 & 0x80) == 0)
              goto LABEL_427;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_429;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_427:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_429:
          v303 = 78;
          goto LABEL_438;
        case 2u:
          a1[107] |= 0x400000000000000uLL;
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 59;
          goto LABEL_686;
        case 3u:
          a1[108] |= 0x800uLL;
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 76;
          goto LABEL_686;
        case 4u:
          a1[108] |= 4uLL;
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 67;
          goto LABEL_686;
        case 5u:
          a1[107] |= 0x8000000000000000;
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 64;
          goto LABEL_686;
        case 6u:
          a1[108] |= 1uLL;
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 65;
          goto LABEL_686;
        case 7u:
          a1[108] |= 2uLL;
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 66;
          goto LABEL_686;
        case 8u:
          a1[108] |= 0x400uLL;
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 75;
          goto LABEL_686;
        case 9u:
          a1[108] |= 0x80uLL;
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 72;
          goto LABEL_686;
        case 0xAu:
          a1[108] |= 0x100uLL;
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 73;
          goto LABEL_686;
        case 0xBu:
          a1[108] |= 0x200uLL;
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 74;
          goto LABEL_686;
        case 0xCu:
          a1[107] |= 0x4000000000000000uLL;
          v46 = *v3;
          v47 = *(_QWORD *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v47);
            *(_QWORD *)(a2 + v46) = v47 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 63;
          goto LABEL_686;
        case 0xDu:
          a1[107] |= 0x800000000000000uLL;
          v48 = *v3;
          v49 = *(_QWORD *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v49);
            *(_QWORD *)(a2 + v48) = v49 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 60;
          goto LABEL_686;
        case 0xEu:
          a1[107] |= 0x1000000000000000uLL;
          v50 = *v3;
          v51 = *(_QWORD *)(a2 + v50);
          if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v51);
            *(_QWORD *)(a2 + v50) = v51 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 61;
          goto LABEL_686;
        case 0xFu:
          a1[107] |= 0x2000000000000000uLL;
          v52 = *v3;
          v53 = *(_QWORD *)(a2 + v52);
          if (v53 <= 0xFFFFFFFFFFFFFFF7 && v53 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v53);
            *(_QWORD *)(a2 + v52) = v53 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 62;
          goto LABEL_686;
        case 0x10u:
          a1[108] |= 0x40uLL;
          v54 = *v3;
          v55 = *(_QWORD *)(a2 + v54);
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v55);
            *(_QWORD *)(a2 + v54) = v55 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 71;
          goto LABEL_686;
        case 0x11u:
          a1[108] |= 8uLL;
          v56 = *v3;
          v57 = *(_QWORD *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v57);
            *(_QWORD *)(a2 + v56) = v57 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 68;
          goto LABEL_686;
        case 0x12u:
          a1[108] |= 0x10uLL;
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v59);
            *(_QWORD *)(a2 + v58) = v59 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 69;
          goto LABEL_686;
        case 0x13u:
          a1[108] |= 0x20uLL;
          v60 = *v3;
          v61 = *(_QWORD *)(a2 + v60);
          if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v61);
            *(_QWORD *)(a2 + v60) = v61 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 70;
          goto LABEL_686;
        case 0x14u:
          a1[108] |= 0x4000uLL;
          v62 = *v3;
          v63 = *(_QWORD *)(a2 + v62);
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v63);
            *(_QWORD *)(a2 + v62) = v63 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 79;
          goto LABEL_686;
        case 0x15u:
          a1[108] |= 0x1000uLL;
          v64 = *v3;
          v65 = *(_QWORD *)(a2 + v64);
          if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v65);
            *(_QWORD *)(a2 + v64) = v65 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 77;
          goto LABEL_686;
        case 0x16u:
          v66 = 0;
          v67 = 0;
          v19 = 0;
          a1[108] |= 0x100000000uLL;
          while (2)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            v70 = v69 + 1;
            if (v69 == -1 || v70 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
              *(_QWORD *)(a2 + v68) = v70;
              v19 |= (unint64_t)(v71 & 0x7F) << v66;
              if (v71 < 0)
              {
                v66 += 7;
                v14 = v67++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_433;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_433:
          v303 = 97;
          goto LABEL_438;
        case 0x17u:
          a1[108] |= 0x8000uLL;
          v72 = *v3;
          v73 = *(_QWORD *)(a2 + v72);
          if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v73);
            *(_QWORD *)(a2 + v72) = v73 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 80;
          goto LABEL_686;
        case 0x18u:
          a1[108] |= 0x800000uLL;
          v74 = *v3;
          v75 = *(_QWORD *)(a2 + v74);
          if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v75);
            *(_QWORD *)(a2 + v74) = v75 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 88;
          goto LABEL_686;
        case 0x19u:
          a1[108] |= 0x100000uLL;
          v76 = *v3;
          v77 = *(_QWORD *)(a2 + v76);
          if (v77 <= 0xFFFFFFFFFFFFFFF7 && v77 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v77);
            *(_QWORD *)(a2 + v76) = v77 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 85;
          goto LABEL_686;
        case 0x1Au:
          a1[108] |= 0x200000uLL;
          v78 = *v3;
          v79 = *(_QWORD *)(a2 + v78);
          if (v79 <= 0xFFFFFFFFFFFFFFF7 && v79 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v79);
            *(_QWORD *)(a2 + v78) = v79 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 86;
          goto LABEL_686;
        case 0x1Bu:
          a1[108] |= 0x400000uLL;
          v80 = *v3;
          v81 = *(_QWORD *)(a2 + v80);
          if (v81 <= 0xFFFFFFFFFFFFFFF7 && v81 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v81);
            *(_QWORD *)(a2 + v80) = v81 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 87;
          goto LABEL_686;
        case 0x1Cu:
          a1[108] |= 0x80000000uLL;
          v82 = *v3;
          v83 = *(_QWORD *)(a2 + v82);
          if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v83);
            *(_QWORD *)(a2 + v82) = v83 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 96;
          goto LABEL_686;
        case 0x1Du:
          a1[108] |= 0x10000000uLL;
          v84 = *v3;
          v85 = *(_QWORD *)(a2 + v84);
          if (v85 <= 0xFFFFFFFFFFFFFFF7 && v85 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v85);
            *(_QWORD *)(a2 + v84) = v85 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 93;
          goto LABEL_686;
        case 0x1Eu:
          a1[108] |= 0x20000000uLL;
          v86 = *v3;
          v87 = *(_QWORD *)(a2 + v86);
          if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v87);
            *(_QWORD *)(a2 + v86) = v87 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 94;
          goto LABEL_686;
        case 0x1Fu:
          a1[108] |= 0x40000000uLL;
          v88 = *v3;
          v89 = *(_QWORD *)(a2 + v88);
          if (v89 <= 0xFFFFFFFFFFFFFFF7 && v89 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v89);
            *(_QWORD *)(a2 + v88) = v89 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 95;
          goto LABEL_686;
        case 0x20u:
          a1[108] |= 0x80000uLL;
          v90 = *v3;
          v91 = *(_QWORD *)(a2 + v90);
          if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v91);
            *(_QWORD *)(a2 + v90) = v91 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 84;
          goto LABEL_686;
        case 0x21u:
          a1[108] |= 0x10000uLL;
          v92 = *v3;
          v93 = *(_QWORD *)(a2 + v92);
          if (v93 <= 0xFFFFFFFFFFFFFFF7 && v93 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v93);
            *(_QWORD *)(a2 + v92) = v93 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 81;
          goto LABEL_686;
        case 0x22u:
          a1[108] |= 0x20000uLL;
          v94 = *v3;
          v95 = *(_QWORD *)(a2 + v94);
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v95);
            *(_QWORD *)(a2 + v94) = v95 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 82;
          goto LABEL_686;
        case 0x23u:
          a1[108] |= 0x40000uLL;
          v96 = *v3;
          v97 = *(_QWORD *)(a2 + v96);
          if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v97);
            *(_QWORD *)(a2 + v96) = v97 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 83;
          goto LABEL_686;
        case 0x24u:
          a1[108] |= 0x8000000uLL;
          v98 = *v3;
          v99 = *(_QWORD *)(a2 + v98);
          if (v99 <= 0xFFFFFFFFFFFFFFF7 && v99 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v99);
            *(_QWORD *)(a2 + v98) = v99 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 92;
          goto LABEL_686;
        case 0x25u:
          a1[108] |= 0x1000000uLL;
          v100 = *v3;
          v101 = *(_QWORD *)(a2 + v100);
          if (v101 <= 0xFFFFFFFFFFFFFFF7 && v101 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v101);
            *(_QWORD *)(a2 + v100) = v101 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 89;
          goto LABEL_686;
        case 0x26u:
          a1[108] |= 0x2000000uLL;
          v102 = *v3;
          v103 = *(_QWORD *)(a2 + v102);
          if (v103 <= 0xFFFFFFFFFFFFFFF7 && v103 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v103);
            *(_QWORD *)(a2 + v102) = v103 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 90;
          goto LABEL_686;
        case 0x27u:
          a1[108] |= 0x4000000uLL;
          v104 = *v3;
          v105 = *(_QWORD *)(a2 + v104);
          if (v105 <= 0xFFFFFFFFFFFFFFF7 && v105 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v105);
            *(_QWORD *)(a2 + v104) = v105 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 91;
          goto LABEL_686;
        case 0x28u:
          a1[108] |= 0x200000000uLL;
          v106 = *v3;
          v107 = *(_QWORD *)(a2 + v106);
          if (v107 <= 0xFFFFFFFFFFFFFFF7 && v107 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v107);
            *(_QWORD *)(a2 + v106) = v107 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 98;
          goto LABEL_686;
        case 0x29u:
          v108 = 0;
          v109 = 0;
          v19 = 0;
          a1[107] |= 0x40000000000000uLL;
          while (2)
          {
            v110 = *v3;
            v111 = *(_QWORD *)(a2 + v110);
            v112 = v111 + 1;
            if (v111 == -1 || v112 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v113 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v111);
              *(_QWORD *)(a2 + v110) = v112;
              v19 |= (unint64_t)(v113 & 0x7F) << v108;
              if (v113 < 0)
              {
                v108 += 7;
                v14 = v109++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_437;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_437:
          v303 = 55;
LABEL_438:
          a1[v303] = v19;
          continue;
        case 0x2Au:
          v114 = 0;
          v115 = 0;
          v116 = 0;
          a1[108] |= 0x400000000uLL;
          while (2)
          {
            v117 = *v3;
            v118 = *(_QWORD *)(a2 + v117);
            v119 = v118 + 1;
            if (v118 == -1 || v119 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v120 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v118);
              *(_QWORD *)(a2 + v117) = v119;
              v116 |= (unint64_t)(v120 & 0x7F) << v114;
              if (v120 < 0)
              {
                v114 += 7;
                v14 = v115++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_442:
          v304 = 792;
          goto LABEL_495;
        case 0x2Bu:
          v121 = 0;
          v122 = 0;
          v116 = 0;
          a1[108] |= 0x8000000000uLL;
          while (2)
          {
            v123 = *v3;
            v124 = *(_QWORD *)(a2 + v123);
            v125 = v124 + 1;
            if (v124 == -1 || v125 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v126 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v124);
              *(_QWORD *)(a2 + v123) = v125;
              v116 |= (unint64_t)(v126 & 0x7F) << v121;
              if (v126 < 0)
              {
                v121 += 7;
                v14 = v122++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_446:
          v304 = 812;
          goto LABEL_495;
        case 0x2Cu:
          a1[107] |= 0x80000000000000uLL;
          v127 = *v3;
          v128 = *(_QWORD *)(a2 + v127);
          if (v128 <= 0xFFFFFFFFFFFFFFF7 && v128 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v128);
            *(_QWORD *)(a2 + v127) = v128 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 56;
          goto LABEL_686;
        case 0x2Du:
          a1[107] |= 2uLL;
          v129 = *v3;
          v130 = *(_QWORD *)(a2 + v129);
          if (v130 <= 0xFFFFFFFFFFFFFFF7 && v130 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v130);
            *(_QWORD *)(a2 + v129) = v130 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 2;
          goto LABEL_686;
        case 0x2Eu:
          a1[107] |= 0x4000000000uLL;
          v131 = *v3;
          v132 = *(_QWORD *)(a2 + v131);
          if (v132 <= 0xFFFFFFFFFFFFFFF7 && v132 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v132);
            *(_QWORD *)(a2 + v131) = v132 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 39;
          goto LABEL_686;
        case 0x2Fu:
          a1[107] |= 0x10000000000000uLL;
          v133 = *v3;
          v134 = *(_QWORD *)(a2 + v133);
          if (v134 <= 0xFFFFFFFFFFFFFFF7 && v134 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v134);
            *(_QWORD *)(a2 + v133) = v134 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 53;
          goto LABEL_686;
        case 0x30u:
          a1[107] |= 1uLL;
          v135 = *v3;
          v136 = *(_QWORD *)(a2 + v135);
          if (v136 <= 0xFFFFFFFFFFFFFFF7 && v136 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v136);
            *(_QWORD *)(a2 + v135) = v136 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 1;
          goto LABEL_686;
        case 0x31u:
          a1[107] |= 0x8000000000uLL;
          v137 = *v3;
          v138 = *(_QWORD *)(a2 + v137);
          if (v138 <= 0xFFFFFFFFFFFFFFF7 && v138 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v138);
            *(_QWORD *)(a2 + v137) = v138 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 40;
          goto LABEL_686;
        case 0x32u:
          a1[107] |= 0x80000000000uLL;
          v139 = *v3;
          v140 = *(_QWORD *)(a2 + v139);
          if (v140 <= 0xFFFFFFFFFFFFFFF7 && v140 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v140);
            *(_QWORD *)(a2 + v139) = v140 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 44;
          goto LABEL_686;
        case 0x33u:
          a1[107] |= 0x10000000000uLL;
          v141 = *v3;
          v142 = *(_QWORD *)(a2 + v141);
          if (v142 <= 0xFFFFFFFFFFFFFFF7 && v142 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v142);
            *(_QWORD *)(a2 + v141) = v142 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 41;
          goto LABEL_686;
        case 0x34u:
          a1[107] |= 0x20000000000uLL;
          v143 = *v3;
          v144 = *(_QWORD *)(a2 + v143);
          if (v144 <= 0xFFFFFFFFFFFFFFF7 && v144 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v144);
            *(_QWORD *)(a2 + v143) = v144 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 42;
          goto LABEL_686;
        case 0x35u:
          a1[107] |= 0x40000000000uLL;
          v145 = *v3;
          v146 = *(_QWORD *)(a2 + v145);
          if (v146 <= 0xFFFFFFFFFFFFFFF7 && v146 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v146);
            *(_QWORD *)(a2 + v145) = v146 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 43;
          goto LABEL_686;
        case 0x36u:
          a1[107] |= 0x8000000000000uLL;
          v147 = *v3;
          v148 = *(_QWORD *)(a2 + v147);
          if (v148 <= 0xFFFFFFFFFFFFFFF7 && v148 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v148);
            *(_QWORD *)(a2 + v147) = v148 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 52;
          goto LABEL_686;
        case 0x37u:
          a1[107] |= 0x1000000000000uLL;
          v149 = *v3;
          v150 = *(_QWORD *)(a2 + v149);
          if (v150 <= 0xFFFFFFFFFFFFFFF7 && v150 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v150);
            *(_QWORD *)(a2 + v149) = v150 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 49;
          goto LABEL_686;
        case 0x38u:
          a1[107] |= 0x2000000000000uLL;
          v151 = *v3;
          v152 = *(_QWORD *)(a2 + v151);
          if (v152 <= 0xFFFFFFFFFFFFFFF7 && v152 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v152);
            *(_QWORD *)(a2 + v151) = v152 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 50;
          goto LABEL_686;
        case 0x39u:
          a1[107] |= 0x4000000000000uLL;
          v153 = *v3;
          v154 = *(_QWORD *)(a2 + v153);
          if (v154 <= 0xFFFFFFFFFFFFFFF7 && v154 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v154);
            *(_QWORD *)(a2 + v153) = v154 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 51;
          goto LABEL_686;
        case 0x3Au:
          a1[107] |= 0x200000uLL;
          v155 = *v3;
          v156 = *(_QWORD *)(a2 + v155);
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v156);
            *(_QWORD *)(a2 + v155) = v156 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 22;
          goto LABEL_686;
        case 0x3Bu:
          a1[107] |= 0x40000uLL;
          v157 = *v3;
          v158 = *(_QWORD *)(a2 + v157);
          if (v158 <= 0xFFFFFFFFFFFFFFF7 && v158 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v158);
            *(_QWORD *)(a2 + v157) = v158 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 19;
          goto LABEL_686;
        case 0x3Cu:
          a1[107] |= 0x80000uLL;
          v159 = *v3;
          v160 = *(_QWORD *)(a2 + v159);
          if (v160 <= 0xFFFFFFFFFFFFFFF7 && v160 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v160);
            *(_QWORD *)(a2 + v159) = v160 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 20;
          goto LABEL_686;
        case 0x3Du:
          a1[107] |= 0x100000uLL;
          v161 = *v3;
          v162 = *(_QWORD *)(a2 + v161);
          if (v162 <= 0xFFFFFFFFFFFFFFF7 && v162 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v162);
            *(_QWORD *)(a2 + v161) = v162 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 21;
          goto LABEL_686;
        case 0x3Eu:
          a1[107] |= 0x800000000000uLL;
          v163 = *v3;
          v164 = *(_QWORD *)(a2 + v163);
          if (v164 <= 0xFFFFFFFFFFFFFFF7 && v164 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v164);
            *(_QWORD *)(a2 + v163) = v164 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 48;
          goto LABEL_686;
        case 0x3Fu:
          a1[107] |= 0x100000000000uLL;
          v165 = *v3;
          v166 = *(_QWORD *)(a2 + v165);
          if (v166 <= 0xFFFFFFFFFFFFFFF7 && v166 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v166);
            *(_QWORD *)(a2 + v165) = v166 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 45;
          goto LABEL_686;
        case 0x40u:
          a1[107] |= 0x200000000000uLL;
          v167 = *v3;
          v168 = *(_QWORD *)(a2 + v167);
          if (v168 <= 0xFFFFFFFFFFFFFFF7 && v168 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v168);
            *(_QWORD *)(a2 + v167) = v168 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 46;
          goto LABEL_686;
        case 0x41u:
          a1[107] |= 0x400000000000uLL;
          v169 = *v3;
          v170 = *(_QWORD *)(a2 + v169);
          if (v170 <= 0xFFFFFFFFFFFFFFF7 && v170 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v170);
            *(_QWORD *)(a2 + v169) = v170 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 47;
          goto LABEL_686;
        case 0x42u:
          a1[107] |= 0x200uLL;
          v171 = *v3;
          v172 = *(_QWORD *)(a2 + v171);
          if (v172 <= 0xFFFFFFFFFFFFFFF7 && v172 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v172);
            *(_QWORD *)(a2 + v171) = v172 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 10;
          goto LABEL_686;
        case 0x43u:
          a1[107] |= 0x40uLL;
          v173 = *v3;
          v174 = *(_QWORD *)(a2 + v173);
          if (v174 <= 0xFFFFFFFFFFFFFFF7 && v174 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v174);
            *(_QWORD *)(a2 + v173) = v174 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 7;
          goto LABEL_686;
        case 0x44u:
          a1[107] |= 0x80uLL;
          v175 = *v3;
          v176 = *(_QWORD *)(a2 + v175);
          if (v176 <= 0xFFFFFFFFFFFFFFF7 && v176 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v176);
            *(_QWORD *)(a2 + v175) = v176 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 8;
          goto LABEL_686;
        case 0x45u:
          a1[107] |= 0x100uLL;
          v177 = *v3;
          v178 = *(_QWORD *)(a2 + v177);
          if (v178 <= 0xFFFFFFFFFFFFFFF7 && v178 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v178);
            *(_QWORD *)(a2 + v177) = v178 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 9;
          goto LABEL_686;
        case 0x46u:
          a1[107] |= 0x20000uLL;
          v179 = *v3;
          v180 = *(_QWORD *)(a2 + v179);
          if (v180 <= 0xFFFFFFFFFFFFFFF7 && v180 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v180);
            *(_QWORD *)(a2 + v179) = v180 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 18;
          goto LABEL_686;
        case 0x47u:
          a1[107] |= 0x4000uLL;
          v181 = *v3;
          v182 = *(_QWORD *)(a2 + v181);
          if (v182 <= 0xFFFFFFFFFFFFFFF7 && v182 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v182);
            *(_QWORD *)(a2 + v181) = v182 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 15;
          goto LABEL_686;
        case 0x48u:
          a1[107] |= 0x8000uLL;
          v183 = *v3;
          v184 = *(_QWORD *)(a2 + v183);
          if (v184 <= 0xFFFFFFFFFFFFFFF7 && v184 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v184);
            *(_QWORD *)(a2 + v183) = v184 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 16;
          goto LABEL_686;
        case 0x49u:
          a1[107] |= 0x10000uLL;
          v185 = *v3;
          v186 = *(_QWORD *)(a2 + v185);
          if (v186 <= 0xFFFFFFFFFFFFFFF7 && v186 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v186);
            *(_QWORD *)(a2 + v185) = v186 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 17;
          goto LABEL_686;
        case 0x4Au:
          a1[107] |= 0x20uLL;
          v187 = *v3;
          v188 = *(_QWORD *)(a2 + v187);
          if (v188 <= 0xFFFFFFFFFFFFFFF7 && v188 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v188);
            *(_QWORD *)(a2 + v187) = v188 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 6;
          goto LABEL_686;
        case 0x4Bu:
          a1[107] |= 4uLL;
          v189 = *v3;
          v190 = *(_QWORD *)(a2 + v189);
          if (v190 <= 0xFFFFFFFFFFFFFFF7 && v190 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v190);
            *(_QWORD *)(a2 + v189) = v190 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 3;
          goto LABEL_686;
        case 0x4Cu:
          a1[107] |= 8uLL;
          v191 = *v3;
          v192 = *(_QWORD *)(a2 + v191);
          if (v192 <= 0xFFFFFFFFFFFFFFF7 && v192 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v192);
            *(_QWORD *)(a2 + v191) = v192 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 4;
          goto LABEL_686;
        case 0x4Du:
          a1[107] |= 0x10uLL;
          v193 = *v3;
          v194 = *(_QWORD *)(a2 + v193);
          if (v194 <= 0xFFFFFFFFFFFFFFF7 && v194 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v194);
            *(_QWORD *)(a2 + v193) = v194 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 5;
          goto LABEL_686;
        case 0x4Eu:
          a1[107] |= 0x2000uLL;
          v195 = *v3;
          v196 = *(_QWORD *)(a2 + v195);
          if (v196 <= 0xFFFFFFFFFFFFFFF7 && v196 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v196);
            *(_QWORD *)(a2 + v195) = v196 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 14;
          goto LABEL_686;
        case 0x4Fu:
          a1[107] |= 0x400uLL;
          v197 = *v3;
          v198 = *(_QWORD *)(a2 + v197);
          if (v198 <= 0xFFFFFFFFFFFFFFF7 && v198 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v198);
            *(_QWORD *)(a2 + v197) = v198 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 11;
          goto LABEL_686;
        case 0x50u:
          a1[107] |= 0x800uLL;
          v199 = *v3;
          v200 = *(_QWORD *)(a2 + v199);
          if (v200 <= 0xFFFFFFFFFFFFFFF7 && v200 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v200);
            *(_QWORD *)(a2 + v199) = v200 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 12;
          goto LABEL_686;
        case 0x51u:
          a1[107] |= 0x1000uLL;
          v201 = *v3;
          v202 = *(_QWORD *)(a2 + v201);
          if (v202 <= 0xFFFFFFFFFFFFFFF7 && v202 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v202);
            *(_QWORD *)(a2 + v201) = v202 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 13;
          goto LABEL_686;
        case 0x52u:
          a1[107] |= 0x20000000uLL;
          v203 = *v3;
          v204 = *(_QWORD *)(a2 + v203);
          if (v204 <= 0xFFFFFFFFFFFFFFF7 && v204 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v204);
            *(_QWORD *)(a2 + v203) = v204 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 30;
          goto LABEL_686;
        case 0x53u:
          a1[107] |= 0x4000000uLL;
          v205 = *v3;
          v206 = *(_QWORD *)(a2 + v205);
          if (v206 <= 0xFFFFFFFFFFFFFFF7 && v206 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v206);
            *(_QWORD *)(a2 + v205) = v206 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 27;
          goto LABEL_686;
        case 0x54u:
          a1[107] |= 0x8000000uLL;
          v207 = *v3;
          v208 = *(_QWORD *)(a2 + v207);
          if (v208 <= 0xFFFFFFFFFFFFFFF7 && v208 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v208);
            *(_QWORD *)(a2 + v207) = v208 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 28;
          goto LABEL_686;
        case 0x55u:
          a1[107] |= 0x10000000uLL;
          v209 = *v3;
          v210 = *(_QWORD *)(a2 + v209);
          if (v210 <= 0xFFFFFFFFFFFFFFF7 && v210 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v210);
            *(_QWORD *)(a2 + v209) = v210 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 29;
          goto LABEL_686;
        case 0x56u:
          a1[107] |= 0x2000000000uLL;
          v211 = *v3;
          v212 = *(_QWORD *)(a2 + v211);
          if (v212 <= 0xFFFFFFFFFFFFFFF7 && v212 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v212);
            *(_QWORD *)(a2 + v211) = v212 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 38;
          goto LABEL_686;
        case 0x57u:
          a1[107] |= 0x400000000uLL;
          v213 = *v3;
          v214 = *(_QWORD *)(a2 + v213);
          if (v214 <= 0xFFFFFFFFFFFFFFF7 && v214 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v214);
            *(_QWORD *)(a2 + v213) = v214 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 35;
          goto LABEL_686;
        case 0x58u:
          a1[107] |= 0x800000000uLL;
          v215 = *v3;
          v216 = *(_QWORD *)(a2 + v215);
          if (v216 <= 0xFFFFFFFFFFFFFFF7 && v216 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v216);
            *(_QWORD *)(a2 + v215) = v216 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 36;
          goto LABEL_686;
        case 0x59u:
          a1[107] |= 0x1000000000uLL;
          v217 = *v3;
          v218 = *(_QWORD *)(a2 + v217);
          if (v218 <= 0xFFFFFFFFFFFFFFF7 && v218 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v218);
            *(_QWORD *)(a2 + v217) = v218 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 37;
          goto LABEL_686;
        case 0x5Au:
          a1[107] |= 0x2000000uLL;
          v219 = *v3;
          v220 = *(_QWORD *)(a2 + v219);
          if (v220 <= 0xFFFFFFFFFFFFFFF7 && v220 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v220);
            *(_QWORD *)(a2 + v219) = v220 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 26;
          goto LABEL_686;
        case 0x5Bu:
          a1[107] |= 0x400000uLL;
          v221 = *v3;
          v222 = *(_QWORD *)(a2 + v221);
          if (v222 <= 0xFFFFFFFFFFFFFFF7 && v222 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v222);
            *(_QWORD *)(a2 + v221) = v222 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 23;
          goto LABEL_686;
        case 0x5Cu:
          a1[107] |= 0x800000uLL;
          v223 = *v3;
          v224 = *(_QWORD *)(a2 + v223);
          if (v224 <= 0xFFFFFFFFFFFFFFF7 && v224 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v224);
            *(_QWORD *)(a2 + v223) = v224 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 24;
          goto LABEL_686;
        case 0x5Du:
          a1[107] |= 0x1000000uLL;
          v225 = *v3;
          v226 = *(_QWORD *)(a2 + v225);
          if (v226 <= 0xFFFFFFFFFFFFFFF7 && v226 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v226);
            *(_QWORD *)(a2 + v225) = v226 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 25;
          goto LABEL_686;
        case 0x5Eu:
          a1[107] |= 0x200000000uLL;
          v227 = *v3;
          v228 = *(_QWORD *)(a2 + v227);
          if (v228 <= 0xFFFFFFFFFFFFFFF7 && v228 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v228);
            *(_QWORD *)(a2 + v227) = v228 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 34;
          goto LABEL_686;
        case 0x5Fu:
          a1[107] |= 0x40000000uLL;
          v229 = *v3;
          v230 = *(_QWORD *)(a2 + v229);
          if (v230 <= 0xFFFFFFFFFFFFFFF7 && v230 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v230);
            *(_QWORD *)(a2 + v229) = v230 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 31;
          goto LABEL_686;
        case 0x60u:
          a1[107] |= 0x80000000uLL;
          v231 = *v3;
          v232 = *(_QWORD *)(a2 + v231);
          if (v232 <= 0xFFFFFFFFFFFFFFF7 && v232 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v232);
            *(_QWORD *)(a2 + v231) = v232 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 32;
          goto LABEL_686;
        case 0x61u:
          a1[107] |= 0x100000000uLL;
          v233 = *v3;
          v234 = *(_QWORD *)(a2 + v233);
          if (v234 <= 0xFFFFFFFFFFFFFFF7 && v234 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v234);
            *(_QWORD *)(a2 + v233) = v234 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 33;
          goto LABEL_686;
        case 0x62u:
          a1[107] |= 0x200000000000000uLL;
          v235 = *v3;
          v236 = *(_QWORD *)(a2 + v235);
          if (v236 <= 0xFFFFFFFFFFFFFFF7 && v236 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v236);
            *(_QWORD *)(a2 + v235) = v236 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 58;
          goto LABEL_686;
        case 0x63u:
          a1[107] |= 0x20000000000000uLL;
          v237 = *v3;
          v238 = *(_QWORD *)(a2 + v237);
          if (v238 <= 0xFFFFFFFFFFFFFFF7 && v238 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v238);
            *(_QWORD *)(a2 + v237) = v238 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 54;
          goto LABEL_686;
        case 0x64u:
          a1[107] |= 0x100000000000000uLL;
          v239 = *v3;
          v240 = *(_QWORD *)(a2 + v239);
          if (v240 <= 0xFFFFFFFFFFFFFFF7 && v240 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v240);
            *(_QWORD *)(a2 + v239) = v240 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v305 = 57;
LABEL_686:
          a1[v305] = v27;
          continue;
        case 0x65u:
          v241 = 0;
          v242 = 0;
          v116 = 0;
          a1[108] |= 0x4000000000uLL;
          while (2)
          {
            v243 = *v3;
            v244 = *(_QWORD *)(a2 + v243);
            if (v244 == -1 || v244 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v245 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v244);
              *(_QWORD *)(a2 + v243) = v244 + 1;
              v116 |= (unint64_t)(v245 & 0x7F) << v241;
              if (v245 < 0)
              {
                v241 += 7;
                v14 = v242++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_450;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_450:
          v304 = 808;
          goto LABEL_495;
        case 0x66u:
          PBReaderReadString();
          v246 = objc_claimAutoreleasedReturnValue();
          v247 = (void *)a1[106];
          a1[106] = v246;

          continue;
        case 0x67u:
          v248 = 0;
          v249 = 0;
          v116 = 0;
          a1[108] |= 0x2000000000uLL;
          while (2)
          {
            v250 = *v3;
            v251 = *(_QWORD *)(a2 + v250);
            if (v251 == -1 || v251 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v252 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v251);
              *(_QWORD *)(a2 + v250) = v251 + 1;
              v116 |= (unint64_t)(v252 & 0x7F) << v248;
              if (v252 < 0)
              {
                v248 += 7;
                v14 = v249++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_454;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_454:
          v304 = 804;
          goto LABEL_495;
        case 0x68u:
          v253 = 0;
          v254 = 0;
          v116 = 0;
          a1[108] |= 0x800000000000uLL;
          while (2)
          {
            v255 = *v3;
            v256 = *(_QWORD *)(a2 + v255);
            if (v256 == -1 || v256 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v257 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v256);
              *(_QWORD *)(a2 + v255) = v256 + 1;
              v116 |= (unint64_t)(v257 & 0x7F) << v253;
              if (v257 < 0)
              {
                v253 += 7;
                v14 = v254++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_458;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_458:
          v304 = 844;
          goto LABEL_495;
        case 0x69u:
          v258 = 0;
          v259 = 0;
          v116 = 0;
          a1[108] |= 0x800000000uLL;
          while (2)
          {
            v260 = *v3;
            v261 = *(_QWORD *)(a2 + v260);
            if (v261 == -1 || v261 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v262 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v261);
              *(_QWORD *)(a2 + v260) = v261 + 1;
              v116 |= (unint64_t)(v262 & 0x7F) << v258;
              if (v262 < 0)
              {
                v258 += 7;
                v14 = v259++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_462;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_462:
          v304 = 796;
          goto LABEL_495;
        case 0x6Au:
          v263 = 0;
          v264 = 0;
          v116 = 0;
          a1[108] |= 0x1000000000uLL;
          while (2)
          {
            v265 = *v3;
            v266 = *(_QWORD *)(a2 + v265);
            if (v266 == -1 || v266 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v267 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v266);
              *(_QWORD *)(a2 + v265) = v266 + 1;
              v116 |= (unint64_t)(v267 & 0x7F) << v263;
              if (v267 < 0)
              {
                v263 += 7;
                v14 = v264++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_466;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_466:
          v304 = 800;
          goto LABEL_495;
        case 0x6Bu:
          v268 = 0;
          v269 = 0;
          v116 = 0;
          a1[108] |= 0x200000000000uLL;
          while (2)
          {
            v270 = *v3;
            v271 = *(_QWORD *)(a2 + v270);
            if (v271 == -1 || v271 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v272 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v271);
              *(_QWORD *)(a2 + v270) = v271 + 1;
              v116 |= (unint64_t)(v272 & 0x7F) << v268;
              if (v272 < 0)
              {
                v268 += 7;
                v14 = v269++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_470;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_470:
          v304 = 836;
          goto LABEL_495;
        case 0x6Cu:
          v273 = 0;
          v274 = 0;
          v116 = 0;
          a1[108] |= 0x400000000000uLL;
          while (2)
          {
            v275 = *v3;
            v276 = *(_QWORD *)(a2 + v275);
            if (v276 == -1 || v276 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v277 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v276);
              *(_QWORD *)(a2 + v275) = v276 + 1;
              v116 |= (unint64_t)(v277 & 0x7F) << v273;
              if (v277 < 0)
              {
                v273 += 7;
                v14 = v274++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_474:
          v304 = 840;
          goto LABEL_495;
        case 0x6Du:
          v278 = 0;
          v279 = 0;
          v116 = 0;
          a1[108] |= 0x10000000000uLL;
          while (2)
          {
            v280 = *v3;
            v281 = *(_QWORD *)(a2 + v280);
            if (v281 == -1 || v281 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v282 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v281);
              *(_QWORD *)(a2 + v280) = v281 + 1;
              v116 |= (unint64_t)(v282 & 0x7F) << v278;
              if (v282 < 0)
              {
                v278 += 7;
                v14 = v279++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_478;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_478:
          v304 = 816;
          goto LABEL_495;
        case 0x6Eu:
          v283 = 0;
          v284 = 0;
          v116 = 0;
          a1[108] |= 0x20000000000uLL;
          while (2)
          {
            v285 = *v3;
            v286 = *(_QWORD *)(a2 + v285);
            if (v286 == -1 || v286 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v287 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v286);
              *(_QWORD *)(a2 + v285) = v286 + 1;
              v116 |= (unint64_t)(v287 & 0x7F) << v283;
              if (v287 < 0)
              {
                v283 += 7;
                v14 = v284++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_482;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_482:
          v304 = 820;
          goto LABEL_495;
        case 0x6Fu:
          v288 = 0;
          v289 = 0;
          v116 = 0;
          a1[108] |= 0x80000000000uLL;
          while (2)
          {
            v290 = *v3;
            v291 = *(_QWORD *)(a2 + v290);
            if (v291 == -1 || v291 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v292 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v291);
              *(_QWORD *)(a2 + v290) = v291 + 1;
              v116 |= (unint64_t)(v292 & 0x7F) << v288;
              if (v292 < 0)
              {
                v288 += 7;
                v14 = v289++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_486:
          v304 = 828;
          goto LABEL_495;
        case 0x70u:
          v293 = 0;
          v294 = 0;
          v116 = 0;
          a1[108] |= 0x100000000000uLL;
          while (2)
          {
            v295 = *v3;
            v296 = *(_QWORD *)(a2 + v295);
            if (v296 == -1 || v296 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v297 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v296);
              *(_QWORD *)(a2 + v295) = v296 + 1;
              v116 |= (unint64_t)(v297 & 0x7F) << v293;
              if (v297 < 0)
              {
                v293 += 7;
                v14 = v294++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_490:
          v304 = 832;
          goto LABEL_495;
        case 0x71u:
          v298 = 0;
          v299 = 0;
          v116 = 0;
          a1[108] |= 0x40000000000uLL;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v300 = *v3;
        v301 = *(_QWORD *)(a2 + v300);
        if (v301 == -1 || v301 >= *(_QWORD *)(a2 + *v4))
          break;
        v302 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v301);
        *(_QWORD *)(a2 + v300) = v301 + 1;
        v116 |= (unint64_t)(v302 & 0x7F) << v298;
        if ((v302 & 0x80) == 0)
          goto LABEL_492;
        v298 += 7;
        v14 = v299++ >= 9;
        if (v14)
        {
          LODWORD(v116) = 0;
          goto LABEL_494;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_492:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v116) = 0;
LABEL_494:
      v304 = 824;
LABEL_495:
      *(_DWORD *)((char *)a1 + v304) = v116;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DEA62F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18DEA682C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PersonLinkingPersonReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)a1[2];
        a1[2] = v17;
LABEL_23:

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_25:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(a1, "addEmails:", v18);
    goto LABEL_23;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DEA8438(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_18DEA8A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DEA8DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 304), "transportType");
}

void OUTLINED_FUNCTION_7_7(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log, uint8_t buf)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, &buf, 0x48u);
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 3804));
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 3804));
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 304), "transportType");
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 3804));
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 3804));
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(v0 + 3804));
}

id _DKSyncLoggingWindowsDescription(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  if (objc_msgSend(v1, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      v7 = 1;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
          if ((v7 & 1) == 0)
            objc_msgSend(v2, "appendString:", CFSTR(", "), (_QWORD)v12);
          objc_msgSend(v9, "debugDescription", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendString:", v10);

          v7 = 0;
          ++v8;
        }
        while (v5 != v8);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v7 = 0;
      }
      while (v5);
    }

  }
  else
  {
    objc_msgSend(v2, "appendString:", CFSTR("no windows"));
  }

  return v2;
}

void sub_18DEACD74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEACFCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

char *bucket_name_for_timing(double a1)
{
  unsigned int v1;
  unint64_t v2;
  BOOL v3;

  v1 = 0;
  v2 = (unint64_t)a1;
  if ((unint64_t)a1)
  {
    do
    {
      ++v1;
      v3 = v2 > 1;
      v2 >>= 1;
    }
    while (v3);
  }
  if (v1 >= 0x14)
    v1 = 20;
  return _bucket_names[v1];
}

uint64_t _DKPREventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  _DKPRStream *v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *v5;
    v17 = *(unsigned __int8 *)(a2 + v16);
    if (*(_BYTE *)(a2 + v16))
      v10 = 0;
LABEL_14:
    if (v17 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v19 = objc_alloc_init(_DKPRStream);
        objc_storeStrong((id *)(a1 + 80), v19);
        if (PBReaderPlaceMark() && _DKPRStreamReadFrom((uint64_t)v19, a2))
          goto LABEL_39;
        goto LABEL_80;
      case 2u:
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v23 = 0;
        }
        v46 = 40;
        goto LABEL_77;
      case 3u:
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v23 = 0;
        }
        v46 = 32;
        goto LABEL_77;
      case 4u:
        v19 = objc_alloc_init(_DKPRValue);
        objc_storeStrong((id *)(a1 + 88), v19);
        if (!PBReaderPlaceMark() || (_DKPRValueReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_80;
        goto LABEL_39;
      case 5u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = *(void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = v26;

        goto LABEL_78;
      case 6u:
        v19 = objc_alloc_init(_DKPRSource);
        objc_storeStrong((id *)(a1 + 72), v19);
        if (!PBReaderPlaceMark() || (_DKPRSourceReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_80;
        goto LABEL_39;
      case 7u:
        v19 = objc_alloc_init(_DKPRMetadataEntry);
        -[_DKPREvent addMetadata:](a1, v19);
        if (PBReaderPlaceMark() && (_DKPRMetadataEntryReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_78:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_80:

        return 0;
      case 8u:
        *(_BYTE *)(a1 + 96) |= 4u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v46 = 24;
        goto LABEL_77;
      case 9u:
        *(_BYTE *)(a1 + 96) |= 2u;
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v46 = 16;
LABEL_77:
        *(_QWORD *)(a1 + v46) = v23;
        goto LABEL_78;
      case 0xAu:
        v32 = 0;
        v33 = 0;
        v34 = 0;
        *(_BYTE *)(a1 + 96) |= 8u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          v37 = v36 + 1;
          if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if (v38 < 0)
            {
              v32 += 7;
              v15 = v33++ >= 9;
              if (v15)
              {
                v34 = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v34 = 0;
LABEL_63:
        v45 = 48;
        goto LABEL_68;
      case 0xBu:
        v39 = 0;
        v40 = 0;
        v34 = 0;
        *(_BYTE *)(a1 + 96) |= 1u;
        while (2)
        {
          v41 = *v3;
          v42 = *(_QWORD *)(a2 + v41);
          v43 = v42 + 1;
          if (v42 == -1 || v43 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
            *(_QWORD *)(a2 + v41) = v43;
            v34 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              v15 = v40++ >= 9;
              if (v15)
              {
                v34 = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v34 = 0;
LABEL_67:
        v45 = 8;
LABEL_68:
        *(_QWORD *)(a1 + v45) = v34;
        goto LABEL_78;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_78;
    }
  }
}

#error "18DEAFE18: call analysis failed (funcsize=55)"

uint64_t OUTLINED_FUNCTION_4_5()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 320), "me");
}

void OUTLINED_FUNCTION_5_6(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x34u);
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 3980));
}

void OUTLINED_FUNCTION_9_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x3Eu);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(*(_QWORD *)(v0 + 32) + *(int *)(v1 + 3980));
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

uint64_t OUTLINED_FUNCTION_20()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 3980));
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 3980));
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 3980));
}

void sub_18DEB2C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DEB3C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DEB3D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _clientNeedsHelpCallback(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_activity_scope_state_s v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_18DDBE000, "Duet: clientNeedsHelpCallback", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v5, &v13);
  os_activity_scope_leave(&v13);

  v6 = a2;
  v7 = a3;
  if (v6
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduet.client-needs-help.")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "containsString:", v8),
        v8,
        (v9 & 1) != 0))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      _clientNeedsHelpCallback_cold_3();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        _clientNeedsHelpCallback_cold_2();

    }
    -[_DKCoreDataStorage handleClientCallForHelp](v6);
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v13.opaque[0]) = 138412290;
      *(uint64_t *)((char *)v13.opaque + 4) = (uint64_t)v7;
      _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_DEFAULT, "Done handling client help call: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      _clientNeedsHelpCallback_cold_1();
  }

}

void sub_18DEB4370(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DEB4750(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEB48E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEB496C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEB4C00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEB53D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  void *v24;
  uint64_t v25;

  objc_sync_exit(v24);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose((const void *)(v25 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_18DEB5BA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEB5CF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEB6540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18DEB68A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18DEB6FCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEB726C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DEB75E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DEB7970(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  _BOOL4 v15;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(exception_object);
    objc_msgSend(*(id *)(v10 + 32), "persistentStoreCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistentStores");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") == 0;

    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v14)
    {
      if (v15)
        __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_1();

      objc_end_catch();
      JUMPOUT(0x18DEB788CLL);
    }
    if (v15)
      __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_2();
    objc_exception_throw(objc_retainAutorelease(v11));
  }
  _Unwind_Resume(exception_object);
}

uint64_t _cdknowledge_isInternal()
{
  return os_variant_has_internal_diagnostics();
}

void _cdknowledge_signpost_count_begin(void *a1)
{
  id v1;
  int has_internal_diagnostics;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_enabled(v3);
  if (has_internal_diagnostics)
  {
    if (v4)
    {
      _CDCurrentOrXPCProcessName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v1;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CountObjects", " Process=%{signpost.telemetry:string1,public}@  Entity=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);

    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CountObjects", (const char *)&unk_18DF6D5CF, (uint8_t *)&v6, 2u);
  }

}

void _cdknowledge_signpost_count_end(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    v5 = 134349312;
    v6 = a1;
    v7 = 2050;
    v8 = a2;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CountObjects", " Count=%{signpost.telemetry:number1,public}lu  ErrorCode=%{signpost.telemetry:number2,public}ld ", (uint8_t *)&v5, 0x16u);
  }

}

void _cdknowledge_signpost_event_count(uint64_t a1, void *a2)
{
  id v3;
  int has_internal_diagnostics;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_enabled(v5);
  if (has_internal_diagnostics)
  {
    if (v6)
    {
      v10 = 134349314;
      v11 = a1;
      v12 = 2114;
      v13 = v3;
      v7 = " EventCount=%{signpost.telemetry:number1,public}lu  Stream=%{signpost.telemetry:string2,public}@ ";
      v8 = v5;
      v9 = 22;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CountEvents", v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    v10 = 134349056;
    v11 = a1;
    v7 = " EventCount=%{signpost.telemetry:number1,public}lu ";
    v8 = v5;
    v9 = 12;
    goto LABEL_6;
  }

}

void _cdcontextstore_signpost_register_begin(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v6 = 138543618;
      v7 = v3;
      v8 = 2114;
      v9 = v4;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RegisterKeyPath", " RegistrationID=%{signpost.telemetry:string1,public}@  KeyPath=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);
    }

  }
}

void _cdcontextstore_signpost_register_end()
{
  NSObject *v0;
  uint8_t v1[16];

  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RegisterKeyPath", (const char *)&unk_18DF6D5CF, v1, 2u);
    }

  }
}

void _cdcontextstore_signpost_get_object_begin(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      _CDCurrentOrXPCProcessName();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138543618;
      v5 = v3;
      v6 = 2114;
      v7 = v1;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetKeyPath", " Process=%{signpost.telemetry:string1,public}@  KeyPath=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v4, 0x16u);

    }
  }

}

void _cdcontextstore_signpost_get_object_end()
{
  NSObject *v0;
  uint8_t v1[16];

  if (os_variant_has_internal_diagnostics())
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetKeyPath", (const char *)&unk_18DF6D5CF, v1, 2u);
    }

  }
}

void sub_18DEB8E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CDPrettyPrintCollection(void *a1, unsigned int a2, unint64_t a3, unsigned int a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  const __CFString *v26;
  char v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[4];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = v6;
  if (v6)
  {
    memset(v33, 0, sizeof(v33));
    if (objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v33, v35, 16))
      v8 = a2;
    else
      v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((_DWORD)v8 == 1)
      objc_msgSend(v9, "appendString:", CFSTR("\n"));
    v27 = objc_opt_respondsToSelector();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v25 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = CFSTR(", ");
      v15 = *(_QWORD *)v30;
      if ((_DWORD)v8)
        v14 = CFSTR(",\n");
      v26 = v14;
      v16 = 1;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((v16 & 1) == 0)
            objc_msgSend(v10, "appendString:", v26);
          if ((_DWORD)v8)
          {
            v19 = 0;
            do
            {
              objc_msgSend(v10, "appendString:", CFSTR("    "));
              ++v19;
            }
            while (v19 <= a3);
          }
          if ((v27 & 1) != 0)
          {
            objc_msgSend(v11, "objectForKey:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "appendFormat:", CFSTR("%@="), v18);
            if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EE109BC0))
            {
              _CDPrettyPrintCollection(v20, v8, a3 + 1, a4);
              v21 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            }
            if (a4)
            {
              objc_msgSend(v10, "appendString:", objc_msgSend(v20, "performSelector:", sel_debugDescription));
            }
            else
            {
              objc_msgSend(v20, "description");
              v21 = objc_claimAutoreleasedReturnValue();
LABEL_28:
              v23 = (void *)v21;
              objc_msgSend(v10, "appendString:", v21);

            }
            goto LABEL_30;
          }
          if (a4)
          {
            objc_msgSend(v10, "appendString:", objc_msgSend(v18, "performSelector:", sel_debugDescription));
          }
          else
          {
            objc_msgSend(v18, "description");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "appendString:", v22);

          }
LABEL_30:
          v16 = 0;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        v16 = 0;
      }
      while (v13);
    }

    if ((_DWORD)v8)
    {
      objc_msgSend(v10, "appendString:", CFSTR("\n"));
      for (; a3; --a3)
        objc_msgSend(v10, "appendString:", CFSTR("    "));
    }
    objc_msgSend(v10, "appendString:", CFSTR(")"));
    v7 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void *_CDLoggingUUIDAsInteger(void *result)
{
  unint64_t v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1[0] = 0;
    v1[1] = 0;
    objc_msgSend(result, "getUUIDBytes:", v1);
    return (void *)bswap64(v1[0]);
  }
  return result;
}

id _CDFormattedDate(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _CDFormattedDate_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_CDFormattedDate_onceToken, &__block_literal_global_74);
  objc_msgSend((id)_CDFormattedDate_formatter, "stringFromDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _CDRandomDataWithLength()
{
  void *v0;
  const __SecRandom *v1;
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v2 = objc_retainAutorelease(v0);
  if (SecRandomCopyBytes(v1, 0x20uLL, (void *)objc_msgSend(v2, "mutableBytes")))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t _CDTruncatedSHA256(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  CC_SHA256_CTX c;
  unsigned __int8 md[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_retainAutorelease(v4);
    CC_SHA256_Update(&c, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  }
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA256_Update(&c, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  CC_SHA256_Final(md, &c);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
  v10 = 0;
  objc_msgSend(v7, "getBytes:length:", &v10, 8);
  v8 = v10;

  return v8;
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 136));
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 304), "transportType");
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 136));
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 304), "transportType");
}

uint64_t OUTLINED_FUNCTION_17_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(a1 + *(int *)(v1 + 136));
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 136));
}

void OUTLINED_FUNCTION_19_2(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x48u);
}

void OUTLINED_FUNCTION_20_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x48u);
}

uint64_t OUTLINED_FUNCTION_21_2@<X0>(uint64_t a1@<X8>)
{
  return objc_msgSend(*(id *)(a1 + 304), "transportType");
}

uint64_t OUTLINED_FUNCTION_22_2@<X0>(uint64_t a1@<X8>)
{
  return objc_msgSend(*(id *)(a1 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 312), "me");
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 136));
}

uint64_t _DKPRSourceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_26;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_26;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_26:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 6u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 52) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_37;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_39;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_39:
      *(_DWORD *)(a1 + 48) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DEC1EBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18DEC22C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEC26AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;

  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_18DEC2BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  void *v25;

  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_18DEC3DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DEC4908(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEC4B58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEC5098(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEC54B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEC5748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DEC5A1C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18DEC6794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x270]);
  _Unwind_Resume(a1);
}

uint64_t _handleShutdownNotification(uint64_t a1, void *a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = a3;
    _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Got shutdown notification %@", (uint8_t *)&v6, 0xCu);
  }
  return objc_msgSend(a2, "handleShutdownNotification");
}

void sub_18DEC6A94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEC7D98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEC7E74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DEC7F68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DECB764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DECDD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t VisionSignalGradingEntryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t MailIntelligencePETContactEventsReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  MailIntelligencePETContactEvent *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MailIntelligencePETContactEvent);
        objc_msgSend(a1, "addContactEvent:", v17);
        if (!PBReaderPlaceMark() || (MailIntelligencePETContactEventReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PersonLinkingLinkedPairEventReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  PersonLinkingPersonPair *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (PersonLinkingPersonPair *)a1[2];
        a1[2] = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(PersonLinkingPersonPair);
    objc_msgSend(a1, "addPairs:", v18);
    if (!PBReaderPlaceMark() || (PersonLinkingPersonPairReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _DKPRMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _DKPRMetadataEntry *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_DKPRMetadataEntry);
        -[_DKPRMetadata addEntry:](a1, v17);
        if (!PBReaderPlaceMark() || (_DKPRMetadataEntryReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DED1250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DED3384(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __DKSYNCDISPATCHER_IS_CALLING_ASYNC_OUT_TO_A_BLOCK__(void *a1)
{
  void *v1;
  void (**v2)(void);

  v2 = a1;
  v1 = (void *)MEMORY[0x193FEE914]();
  v2[2]();
  objc_autoreleasePoolPop(v1);

}

void sub_18DED35E0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  id v11;
  NSObject *v12;
  id v13;
  char v14;
  void *v15;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(a1);
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v14 = objc_opt_respondsToSelector();
      if ((v14 & 1) != 0)
      {
        objc_msgSend(v11, "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      LODWORD(buf) = 138543618;
      *(_QWORD *)((char *)&buf + 4) = v11;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v15;
      _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Uncaught exception %{public}@ thrown at %{public}@", (uint8_t *)&buf, 0x16u);
      if ((v14 & 1) != 0)

    }
    objc_exception_throw(objc_retainAutorelease(v11));
  }
  _Unwind_Resume(a1);
}

void __DKSYNCDISPATCHER_IS_CALLING_SYNC_OUT_TO_A_BLOCK__(void *a1)
{
  void *v1;
  void (**v2)(void);

  v2 = a1;
  v1 = (void *)MEMORY[0x193FEE914]();
  v2[2]();
  objc_autoreleasePoolPop(v1);

}

void sub_18DED3758(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  id v11;
  NSObject *v12;
  id v13;
  char v14;
  void *v15;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(a1);
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v14 = objc_opt_respondsToSelector();
      if ((v14 & 1) != 0)
      {
        objc_msgSend(v11, "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      LODWORD(buf) = 138543618;
      *(_QWORD *)((char *)&buf + 4) = v11;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v15;
      _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Uncaught exception %{public}@ thrown at %{public}@", (uint8_t *)&buf, 0x16u);
      if ((v14 & 1) != 0)

    }
    objc_exception_throw(objc_retainAutorelease(v11));
  }
  _Unwind_Resume(a1);
}

void __DKSYNCDISPATCHER_IS_CALLING_AFTER_OUT_TO_A_BLOCK__(void *a1)
{
  void *v1;
  void (**v2)(void);

  v2 = a1;
  v1 = (void *)MEMORY[0x193FEE914]();
  v2[2]();
  objc_autoreleasePoolPop(v1);

}

void sub_18DED38D0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  id v11;
  NSObject *v12;
  id v13;
  char v14;
  void *v15;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(a1);
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v14 = objc_opt_respondsToSelector();
      if ((v14 & 1) != 0)
      {
        objc_msgSend(v11, "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      LODWORD(buf) = 138543618;
      *(_QWORD *)((char *)&buf + 4) = v11;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v15;
      _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Uncaught exception %{public}@ thrown at %{public}@", (uint8_t *)&buf, 0x16u);
      if ((v14 & 1) != 0)

    }
    objc_exception_throw(objc_retainAutorelease(v11));
  }
  _Unwind_Resume(a1);
}

BOOL _DKPRChangeSetReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _DKPREvent *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_DKPREvent);
        -[_DKPRChangeSet addEvents:](a1, v17);
        if (!PBReaderPlaceMark() || (_DKPREventReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = (_DKPREvent *)objc_claimAutoreleasedReturnValue();
    if (v17)
      -[_DKPRChangeSet addDeleteEventID:](a1, v17);
LABEL_25:

    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DED597C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DED5BA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _CDClientStateFromEventIndexerBookmark(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  id v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5;
  if (v2)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _CDClientStateFromEventIndexerBookmark_cold_1();

  }
  return v1;
}

void recordInteractionsAsync(void *a1, void *a2, NSUInteger a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  NSRange v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  NSUInteger v21;
  NSRange v22;
  char v23;
  char v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;
  NSRange v28;
  NSRange v29;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(a6, "copy");
  v28.length = objc_msgSend(v12, "count");
  v28.location = 0;
  v29.location = a3;
  v29.length = 128;
  v14 = NSIntersectionRange(v28, v29);
  if (v14.length)
  {
    objc_msgSend(v12, "subarrayWithRange:", v14.location, v14.length);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __recordInteractionsAsync_block_invoke;
    v17[3] = &unk_1E26E6720;
    v18 = v11;
    v19 = v12;
    v21 = v14.location + v14.length;
    v23 = a4;
    v24 = a5;
    v20 = v13;
    v22 = v14;
    objc_msgSend(v18, "recordInteractions:enforceDataLimits:enforcePrivacy:reply:", v15, a4, a5, v17);

  }
  else
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v26 = objc_msgSend(v12, "count");
      _os_log_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEFAULT, "[async path] successfully sent all %tu interactions to coreduet daemon", buf, 0xCu);
    }

    v13[2](v13, 1, 0);
  }

}

uint64_t __recordInteractionsAsync_block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "[async path] batch sent successfully", v7, 2u);
    }

    return recordInteractionsAsync(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __recordInteractionsAsync_block_invoke_cold_1(a1, v5);

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void sub_18DED9244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_18DED9C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_18DEDA080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18DEDA448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_18DEDA838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18DEDAD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_18DEDB080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18DEDB438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18DEDB7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18DEDBBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18DEDD3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DEE0804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t sleepPrediction(double *a1, uint64_t a2, unsigned int a3)
{
  return sleepPredictionWithParams2(a1, a2, a3, 0.8, 0.7, 0.5);
}

uint64_t sleepPredictionWithParams(uint64_t a1, uint64_t a2, unsigned int a3, double a4, double a5, double a6, int a7)
{
  if (a7 == 1)
    return sleepPredictionWithParams1(a1, a2, a3, a4, a5, a6);
  else
    return sleepPredictionWithParams2((double *)a1, a2, a3, a4, a5, a6);
}

uint64_t validatePastDetection(uint64_t a1, unsigned int a2)
{
  int v3;
  int v5;

  if ((a2 & 0x80000000) != 0 || (int)a2 % 96)
    return 0xFFFFFFFFLL;
  v3 = a2 - 2;
  if (a2 >= 2)
  {
    while (*(_DWORD *)(a1 + 4 * v3) == *(_DWORD *)(a1 + 4 * (int)(a2 - 1)))
    {
      if (v3-- <= 0)
      {
        v3 = -1;
        break;
      }
    }
  }
  v5 = (int)(~v3 + a2) % 96 + v3 + 1;
  if (v5 / 96 < 3)
    return 0xFFFFFFFFLL;
  else
    return v5;
}

uint64_t sleepPredictionWithParams1(uint64_t a1, uint64_t a2, unsigned int a3, double a4, double a5, double a6)
{
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  double v19;
  double v20;
  uint64_t v21;
  int64_t v22;
  double v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  int v32;
  double v33;
  double v34;
  NSObject *v35;
  uint8_t v36[16];

  result = validatePastDetection(a2, a3);
  if ((_DWORD)result != -1)
  {
    LODWORD(v12) = (int)result / 96;
    if ((int)result / 96 >= 3)
    {
      v13 = 0;
      LODWORD(v14) = (int)v12 / 7;
      if ((int)v12 / 7 >= 4)
        v14 = 4;
      else
        v14 = v14;
      if ((int)v12 >= 6)
        v12 = 6;
      else
        v12 = v12;
      v15 = a6 + 1.0;
      v16 = (int)result;
      v17 = 576;
      v18 = 1;
LABEL_11:
      if ((int)v12 < 1)
      {
LABEL_38:
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel", v15);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_18DDBE000, v35, OS_LOG_TYPE_INFO, "Sleep Prediction: some data available, but no valid data in the past few days", v36, 2u);
        }

      }
      else
      {
        v19 = 0.0;
        v20 = 1.0;
        v21 = v12;
        v22 = v13;
        v23 = 0.0;
        while (v22 < v16)
        {
          v24 = *(_DWORD *)(a2 + 4 * v22);
          v25 = -0.0;
          if (v24 != -1)
            v25 = v20;
          v23 = v23 + v25;
          if (v24 != -1)
            v19 = v19 + (double)v24 * v20;
          v20 = v20 * a4;
          v22 += 96;
          if (!--v21)
          {
            if (v23 == 0.0)
              goto LABEL_38;
            v26 = v19 / v23;
            if ((_DWORD)v14)
            {
              if ((int)v14 >= 1)
              {
                v27 = 1.0;
                v28 = 0.0;
                v29 = v17;
                v30 = v14;
                v31 = 0.0;
                while (v29 >= 1 && v29 <= v16)
                {
                  v32 = *(_DWORD *)(a2 + 4 * v29);
                  v33 = -0.0;
                  if (v32 != -1)
                    v33 = v27;
                  v31 = v31 + v33;
                  if (v32 != -1)
                    v28 = v28 + (double)v32 * v27;
                  v27 = v27 * a5;
                  v29 += 672;
                  if (!--v30)
                    goto LABEL_32;
                }
                return (v18 << 31 >> 31);
              }
              v31 = 0.0;
              v28 = 0.0;
LABEL_32:
              v34 = v28 / v31;
              if (v31 == 0.0)
                v34 = v26;
              v26 = (v26 + a6 * v34) / v15;
            }
            *(double *)(a1 + 8 * v13++) = v26;
            ++v17;
            v18 = v13 < 0x60;
            if (v13 != 96)
              goto LABEL_11;
            return (v18 << 31 >> 31);
          }
        }
      }
      return (v18 << 31 >> 31);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t MailIntelligencePETContactEventReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  char v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  unint64_t v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  unint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  unint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  unint64_t v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  unint64_t v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  unint64_t v212;
  uint64_t v213;
  unint64_t v214;
  uint64_t v215;
  unint64_t v216;
  uint64_t v217;
  unint64_t v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  unint64_t v222;
  char v223;
  unsigned int v224;
  uint64_t v225;
  unint64_t v226;
  char v227;
  uint64_t v228;
  void *v229;
  char v230;
  unsigned int v231;
  uint64_t v232;
  unint64_t v233;
  char v234;
  char v235;
  unsigned int v236;
  uint64_t v237;
  unint64_t v238;
  char v239;
  char v240;
  unsigned int v241;
  uint64_t v242;
  unint64_t v243;
  char v244;
  char v245;
  unsigned int v246;
  uint64_t v247;
  unint64_t v248;
  char v249;
  char v250;
  unsigned int v251;
  uint64_t v252;
  unint64_t v253;
  char v254;
  char v255;
  unsigned int v256;
  uint64_t v257;
  unint64_t v258;
  char v259;
  char v260;
  unsigned int v261;
  uint64_t v262;
  unint64_t v263;
  char v264;
  char v265;
  unsigned int v266;
  uint64_t v267;
  unint64_t v268;
  char v269;
  char v270;
  unsigned int v271;
  uint64_t v272;
  unint64_t v273;
  char v274;
  char v275;
  unsigned int v276;
  uint64_t v277;
  unint64_t v278;
  char v279;
  char v280;
  unsigned int v281;
  uint64_t v282;
  unint64_t v283;
  char v284;
  char v285;
  unsigned int v286;
  uint64_t v287;
  unint64_t v288;
  char v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          a1[100] |= 0x80uLL;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            v22 = v21 + 1;
            if (v21 == -1 || v22 > *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v22;
            v19 |= (unint64_t)(v23 & 0x7F) << v17;
            if ((v23 & 0x80) == 0)
              goto LABEL_407;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_409;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_407:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_409:
          v290 = 72;
          goto LABEL_479;
        case 2u:
          a1[100] |= 0x40uLL;
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 71;
          goto LABEL_652;
        case 3u:
          a1[99] |= 0x2000000000000000uLL;
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 62;
          goto LABEL_652;
        case 4u:
          a1[99] |= 0x400000000000000uLL;
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 59;
          goto LABEL_652;
        case 5u:
          a1[99] |= 0x800000000000000uLL;
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 60;
          goto LABEL_652;
        case 6u:
          a1[99] |= 0x1000000000000000uLL;
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 61;
          goto LABEL_652;
        case 7u:
          a1[100] |= 0x20uLL;
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 70;
          goto LABEL_652;
        case 8u:
          a1[100] |= 4uLL;
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 67;
          goto LABEL_652;
        case 9u:
          a1[100] |= 8uLL;
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 68;
          goto LABEL_652;
        case 0xAu:
          a1[100] |= 0x10uLL;
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 69;
          goto LABEL_652;
        case 0xBu:
          a1[99] |= 0x200000000000000uLL;
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 58;
          goto LABEL_652;
        case 0xCu:
          a1[99] |= 0x40000000000000uLL;
          v46 = *v3;
          v47 = *(_QWORD *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v47);
            *(_QWORD *)(a2 + v46) = v47 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 55;
          goto LABEL_652;
        case 0xDu:
          a1[99] |= 0x80000000000000uLL;
          v48 = *v3;
          v49 = *(_QWORD *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v49);
            *(_QWORD *)(a2 + v48) = v49 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 56;
          goto LABEL_652;
        case 0xEu:
          a1[99] |= 0x100000000000000uLL;
          v50 = *v3;
          v51 = *(_QWORD *)(a2 + v50);
          if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v51);
            *(_QWORD *)(a2 + v50) = v51 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 57;
          goto LABEL_652;
        case 0xFu:
          a1[100] |= 2uLL;
          v52 = *v3;
          v53 = *(_QWORD *)(a2 + v52);
          if (v53 <= 0xFFFFFFFFFFFFFFF7 && v53 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v53);
            *(_QWORD *)(a2 + v52) = v53 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 66;
          goto LABEL_652;
        case 0x10u:
          a1[99] |= 0x4000000000000000uLL;
          v54 = *v3;
          v55 = *(_QWORD *)(a2 + v54);
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v55);
            *(_QWORD *)(a2 + v54) = v55 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 63;
          goto LABEL_652;
        case 0x11u:
          a1[99] |= 0x8000000000000000;
          v56 = *v3;
          v57 = *(_QWORD *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v57);
            *(_QWORD *)(a2 + v56) = v57 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 64;
          goto LABEL_652;
        case 0x12u:
          a1[100] |= 1uLL;
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v59);
            *(_QWORD *)(a2 + v58) = v59 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 65;
          goto LABEL_652;
        case 0x13u:
          v60 = 0;
          v61 = 0;
          v19 = 0;
          a1[100] |= 0x1000000uLL;
          while (2)
          {
            v62 = *v3;
            v63 = *(_QWORD *)(a2 + v62);
            v64 = v63 + 1;
            if (v63 == -1 || v64 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
              *(_QWORD *)(a2 + v62) = v64;
              v19 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                v14 = v61++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_413;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_413:
          v290 = 90;
          goto LABEL_479;
        case 0x14u:
          a1[100] |= 0x8000uLL;
          v66 = *v3;
          v67 = *(_QWORD *)(a2 + v66);
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v67);
            *(_QWORD *)(a2 + v66) = v67 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 81;
          goto LABEL_652;
        case 0x15u:
          a1[100] |= 0x1000uLL;
          v68 = *v3;
          v69 = *(_QWORD *)(a2 + v68);
          if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v69);
            *(_QWORD *)(a2 + v68) = v69 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 78;
          goto LABEL_652;
        case 0x16u:
          a1[100] |= 0x2000uLL;
          v70 = *v3;
          v71 = *(_QWORD *)(a2 + v70);
          if (v71 <= 0xFFFFFFFFFFFFFFF7 && v71 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v71);
            *(_QWORD *)(a2 + v70) = v71 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 79;
          goto LABEL_652;
        case 0x17u:
          a1[100] |= 0x4000uLL;
          v72 = *v3;
          v73 = *(_QWORD *)(a2 + v72);
          if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v73);
            *(_QWORD *)(a2 + v72) = v73 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 80;
          goto LABEL_652;
        case 0x18u:
          a1[100] |= 0x800000uLL;
          v74 = *v3;
          v75 = *(_QWORD *)(a2 + v74);
          if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v75);
            *(_QWORD *)(a2 + v74) = v75 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 89;
          goto LABEL_652;
        case 0x19u:
          a1[100] |= 0x100000uLL;
          v76 = *v3;
          v77 = *(_QWORD *)(a2 + v76);
          if (v77 <= 0xFFFFFFFFFFFFFFF7 && v77 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v77);
            *(_QWORD *)(a2 + v76) = v77 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 86;
          goto LABEL_652;
        case 0x1Au:
          a1[100] |= 0x200000uLL;
          v78 = *v3;
          v79 = *(_QWORD *)(a2 + v78);
          if (v79 <= 0xFFFFFFFFFFFFFFF7 && v79 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v79);
            *(_QWORD *)(a2 + v78) = v79 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 87;
          goto LABEL_652;
        case 0x1Bu:
          a1[100] |= 0x400000uLL;
          v80 = *v3;
          v81 = *(_QWORD *)(a2 + v80);
          if (v81 <= 0xFFFFFFFFFFFFFFF7 && v81 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v81);
            *(_QWORD *)(a2 + v80) = v81 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 88;
          goto LABEL_652;
        case 0x1Cu:
          a1[100] |= 0x800uLL;
          v82 = *v3;
          v83 = *(_QWORD *)(a2 + v82);
          if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v83);
            *(_QWORD *)(a2 + v82) = v83 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 77;
          goto LABEL_652;
        case 0x1Du:
          a1[100] |= 0x100uLL;
          v84 = *v3;
          v85 = *(_QWORD *)(a2 + v84);
          if (v85 <= 0xFFFFFFFFFFFFFFF7 && v85 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v85);
            *(_QWORD *)(a2 + v84) = v85 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 74;
          goto LABEL_652;
        case 0x1Eu:
          a1[100] |= 0x200uLL;
          v86 = *v3;
          v87 = *(_QWORD *)(a2 + v86);
          if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v87);
            *(_QWORD *)(a2 + v86) = v87 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 75;
          goto LABEL_652;
        case 0x1Fu:
          a1[100] |= 0x400uLL;
          v88 = *v3;
          v89 = *(_QWORD *)(a2 + v88);
          if (v89 <= 0xFFFFFFFFFFFFFFF7 && v89 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v89);
            *(_QWORD *)(a2 + v88) = v89 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 76;
          goto LABEL_652;
        case 0x20u:
          a1[100] |= 0x80000uLL;
          v90 = *v3;
          v91 = *(_QWORD *)(a2 + v90);
          if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v91);
            *(_QWORD *)(a2 + v90) = v91 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 85;
          goto LABEL_652;
        case 0x21u:
          a1[100] |= 0x10000uLL;
          v92 = *v3;
          v93 = *(_QWORD *)(a2 + v92);
          if (v93 <= 0xFFFFFFFFFFFFFFF7 && v93 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v93);
            *(_QWORD *)(a2 + v92) = v93 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 82;
          goto LABEL_652;
        case 0x22u:
          a1[100] |= 0x20000uLL;
          v94 = *v3;
          v95 = *(_QWORD *)(a2 + v94);
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v95);
            *(_QWORD *)(a2 + v94) = v95 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 83;
          goto LABEL_652;
        case 0x23u:
          a1[100] |= 0x40000uLL;
          v96 = *v3;
          v97 = *(_QWORD *)(a2 + v96);
          if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v97);
            *(_QWORD *)(a2 + v96) = v97 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 84;
          goto LABEL_652;
        case 0x24u:
          v98 = 0;
          v99 = 0;
          v19 = 0;
          a1[99] |= 0x10000000000000uLL;
          while (2)
          {
            v100 = *v3;
            v101 = *(_QWORD *)(a2 + v100);
            v102 = v101 + 1;
            if (v101 == -1 || v102 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v101);
              *(_QWORD *)(a2 + v100) = v102;
              v19 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                v14 = v99++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_417;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_417:
          v290 = 53;
          goto LABEL_479;
        case 0x25u:
          v104 = 0;
          v105 = 0;
          v106 = 0;
          a1[100] |= 0x2000000uLL;
          while (2)
          {
            v107 = *v3;
            v108 = *(_QWORD *)(a2 + v107);
            v109 = v108 + 1;
            if (v108 == -1 || v109 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v110 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v108);
              *(_QWORD *)(a2 + v107) = v109;
              v106 |= (unint64_t)(v110 & 0x7F) << v104;
              if (v110 < 0)
              {
                v104 += 7;
                v14 = v105++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_421;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_421:
          v291 = 728;
          goto LABEL_474;
        case 0x26u:
          v111 = 0;
          v112 = 0;
          v106 = 0;
          a1[100] |= 0x40000000uLL;
          while (2)
          {
            v113 = *v3;
            v114 = *(_QWORD *)(a2 + v113);
            v115 = v114 + 1;
            if (v114 == -1 || v115 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v116 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v114);
              *(_QWORD *)(a2 + v113) = v115;
              v106 |= (unint64_t)(v116 & 0x7F) << v111;
              if (v116 < 0)
              {
                v111 += 7;
                v14 = v112++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_425;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_425:
          v291 = 748;
          goto LABEL_474;
        case 0x27u:
          a1[99] |= 0x20000000000000uLL;
          v117 = *v3;
          v118 = *(_QWORD *)(a2 + v117);
          if (v118 <= 0xFFFFFFFFFFFFFFF7 && v118 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v118);
            *(_QWORD *)(a2 + v117) = v118 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 54;
          goto LABEL_652;
        case 0x28u:
          a1[99] |= 0x2000000000uLL;
          v119 = *v3;
          v120 = *(_QWORD *)(a2 + v119);
          if (v120 <= 0xFFFFFFFFFFFFFFF7 && v120 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v120);
            *(_QWORD *)(a2 + v119) = v120 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 38;
          goto LABEL_652;
        case 0x29u:
          a1[99] |= 0x8000000000000uLL;
          v121 = *v3;
          v122 = *(_QWORD *)(a2 + v121);
          if (v122 <= 0xFFFFFFFFFFFFFFF7 && v122 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v122);
            *(_QWORD *)(a2 + v121) = v122 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 52;
          goto LABEL_652;
        case 0x2Au:
          a1[99] |= 1uLL;
          v123 = *v3;
          v124 = *(_QWORD *)(a2 + v123);
          if (v124 <= 0xFFFFFFFFFFFFFFF7 && v124 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v124);
            *(_QWORD *)(a2 + v123) = v124 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 1;
          goto LABEL_652;
        case 0x2Bu:
          a1[99] |= 0x4000000000uLL;
          v125 = *v3;
          v126 = *(_QWORD *)(a2 + v125);
          if (v126 <= 0xFFFFFFFFFFFFFFF7 && v126 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v126);
            *(_QWORD *)(a2 + v125) = v126 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 39;
          goto LABEL_652;
        case 0x2Cu:
          a1[99] |= 0x40000000000uLL;
          v127 = *v3;
          v128 = *(_QWORD *)(a2 + v127);
          if (v128 <= 0xFFFFFFFFFFFFFFF7 && v128 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v128);
            *(_QWORD *)(a2 + v127) = v128 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 43;
          goto LABEL_652;
        case 0x2Du:
          a1[99] |= 0x8000000000uLL;
          v129 = *v3;
          v130 = *(_QWORD *)(a2 + v129);
          if (v130 <= 0xFFFFFFFFFFFFFFF7 && v130 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v130);
            *(_QWORD *)(a2 + v129) = v130 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 40;
          goto LABEL_652;
        case 0x2Eu:
          a1[99] |= 0x10000000000uLL;
          v131 = *v3;
          v132 = *(_QWORD *)(a2 + v131);
          if (v132 <= 0xFFFFFFFFFFFFFFF7 && v132 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v132);
            *(_QWORD *)(a2 + v131) = v132 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 41;
          goto LABEL_652;
        case 0x2Fu:
          a1[99] |= 0x20000000000uLL;
          v133 = *v3;
          v134 = *(_QWORD *)(a2 + v133);
          if (v134 <= 0xFFFFFFFFFFFFFFF7 && v134 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v134);
            *(_QWORD *)(a2 + v133) = v134 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 42;
          goto LABEL_652;
        case 0x30u:
          a1[99] |= 0x4000000000000uLL;
          v135 = *v3;
          v136 = *(_QWORD *)(a2 + v135);
          if (v136 <= 0xFFFFFFFFFFFFFFF7 && v136 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v136);
            *(_QWORD *)(a2 + v135) = v136 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 51;
          goto LABEL_652;
        case 0x31u:
          a1[99] |= 0x800000000000uLL;
          v137 = *v3;
          v138 = *(_QWORD *)(a2 + v137);
          if (v138 <= 0xFFFFFFFFFFFFFFF7 && v138 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v138);
            *(_QWORD *)(a2 + v137) = v138 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 48;
          goto LABEL_652;
        case 0x32u:
          a1[99] |= 0x1000000000000uLL;
          v139 = *v3;
          v140 = *(_QWORD *)(a2 + v139);
          if (v140 <= 0xFFFFFFFFFFFFFFF7 && v140 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v140);
            *(_QWORD *)(a2 + v139) = v140 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 49;
          goto LABEL_652;
        case 0x33u:
          a1[99] |= 0x2000000000000uLL;
          v141 = *v3;
          v142 = *(_QWORD *)(a2 + v141);
          if (v142 <= 0xFFFFFFFFFFFFFFF7 && v142 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v142);
            *(_QWORD *)(a2 + v141) = v142 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 50;
          goto LABEL_652;
        case 0x34u:
          a1[99] |= 0x100000uLL;
          v143 = *v3;
          v144 = *(_QWORD *)(a2 + v143);
          if (v144 <= 0xFFFFFFFFFFFFFFF7 && v144 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v144);
            *(_QWORD *)(a2 + v143) = v144 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 21;
          goto LABEL_652;
        case 0x35u:
          a1[99] |= 0x20000uLL;
          v145 = *v3;
          v146 = *(_QWORD *)(a2 + v145);
          if (v146 <= 0xFFFFFFFFFFFFFFF7 && v146 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v146);
            *(_QWORD *)(a2 + v145) = v146 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 18;
          goto LABEL_652;
        case 0x36u:
          a1[99] |= 0x40000uLL;
          v147 = *v3;
          v148 = *(_QWORD *)(a2 + v147);
          if (v148 <= 0xFFFFFFFFFFFFFFF7 && v148 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v148);
            *(_QWORD *)(a2 + v147) = v148 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 19;
          goto LABEL_652;
        case 0x37u:
          a1[99] |= 0x80000uLL;
          v149 = *v3;
          v150 = *(_QWORD *)(a2 + v149);
          if (v150 <= 0xFFFFFFFFFFFFFFF7 && v150 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v150);
            *(_QWORD *)(a2 + v149) = v150 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 20;
          goto LABEL_652;
        case 0x38u:
          a1[99] |= 0x400000000000uLL;
          v151 = *v3;
          v152 = *(_QWORD *)(a2 + v151);
          if (v152 <= 0xFFFFFFFFFFFFFFF7 && v152 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v152);
            *(_QWORD *)(a2 + v151) = v152 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 47;
          goto LABEL_652;
        case 0x39u:
          a1[99] |= 0x80000000000uLL;
          v153 = *v3;
          v154 = *(_QWORD *)(a2 + v153);
          if (v154 <= 0xFFFFFFFFFFFFFFF7 && v154 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v154);
            *(_QWORD *)(a2 + v153) = v154 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 44;
          goto LABEL_652;
        case 0x3Au:
          a1[99] |= 0x100000000000uLL;
          v155 = *v3;
          v156 = *(_QWORD *)(a2 + v155);
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v156);
            *(_QWORD *)(a2 + v155) = v156 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 45;
          goto LABEL_652;
        case 0x3Bu:
          a1[99] |= 0x200000000000uLL;
          v157 = *v3;
          v158 = *(_QWORD *)(a2 + v157);
          if (v158 <= 0xFFFFFFFFFFFFFFF7 && v158 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v158);
            *(_QWORD *)(a2 + v157) = v158 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 46;
          goto LABEL_652;
        case 0x3Cu:
          a1[99] |= 0x100uLL;
          v159 = *v3;
          v160 = *(_QWORD *)(a2 + v159);
          if (v160 <= 0xFFFFFFFFFFFFFFF7 && v160 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v160);
            *(_QWORD *)(a2 + v159) = v160 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 9;
          goto LABEL_652;
        case 0x3Du:
          a1[99] |= 0x20uLL;
          v161 = *v3;
          v162 = *(_QWORD *)(a2 + v161);
          if (v162 <= 0xFFFFFFFFFFFFFFF7 && v162 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v162);
            *(_QWORD *)(a2 + v161) = v162 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 6;
          goto LABEL_652;
        case 0x3Eu:
          a1[99] |= 0x40uLL;
          v163 = *v3;
          v164 = *(_QWORD *)(a2 + v163);
          if (v164 <= 0xFFFFFFFFFFFFFFF7 && v164 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v164);
            *(_QWORD *)(a2 + v163) = v164 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 7;
          goto LABEL_652;
        case 0x3Fu:
          a1[99] |= 0x80uLL;
          v165 = *v3;
          v166 = *(_QWORD *)(a2 + v165);
          if (v166 <= 0xFFFFFFFFFFFFFFF7 && v166 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v166);
            *(_QWORD *)(a2 + v165) = v166 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 8;
          goto LABEL_652;
        case 0x40u:
          a1[99] |= 0x10000uLL;
          v167 = *v3;
          v168 = *(_QWORD *)(a2 + v167);
          if (v168 <= 0xFFFFFFFFFFFFFFF7 && v168 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v168);
            *(_QWORD *)(a2 + v167) = v168 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 17;
          goto LABEL_652;
        case 0x41u:
          a1[99] |= 0x2000uLL;
          v169 = *v3;
          v170 = *(_QWORD *)(a2 + v169);
          if (v170 <= 0xFFFFFFFFFFFFFFF7 && v170 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v170);
            *(_QWORD *)(a2 + v169) = v170 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 14;
          goto LABEL_652;
        case 0x42u:
          a1[99] |= 0x4000uLL;
          v171 = *v3;
          v172 = *(_QWORD *)(a2 + v171);
          if (v172 <= 0xFFFFFFFFFFFFFFF7 && v172 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v172);
            *(_QWORD *)(a2 + v171) = v172 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 15;
          goto LABEL_652;
        case 0x43u:
          a1[99] |= 0x8000uLL;
          v173 = *v3;
          v174 = *(_QWORD *)(a2 + v173);
          if (v174 <= 0xFFFFFFFFFFFFFFF7 && v174 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v174);
            *(_QWORD *)(a2 + v173) = v174 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 16;
          goto LABEL_652;
        case 0x44u:
          a1[99] |= 0x10uLL;
          v175 = *v3;
          v176 = *(_QWORD *)(a2 + v175);
          if (v176 <= 0xFFFFFFFFFFFFFFF7 && v176 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v176);
            *(_QWORD *)(a2 + v175) = v176 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 5;
          goto LABEL_652;
        case 0x45u:
          a1[99] |= 2uLL;
          v177 = *v3;
          v178 = *(_QWORD *)(a2 + v177);
          if (v178 <= 0xFFFFFFFFFFFFFFF7 && v178 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v178);
            *(_QWORD *)(a2 + v177) = v178 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 2;
          goto LABEL_652;
        case 0x46u:
          a1[99] |= 4uLL;
          v179 = *v3;
          v180 = *(_QWORD *)(a2 + v179);
          if (v180 <= 0xFFFFFFFFFFFFFFF7 && v180 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v180);
            *(_QWORD *)(a2 + v179) = v180 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 3;
          goto LABEL_652;
        case 0x47u:
          a1[99] |= 8uLL;
          v181 = *v3;
          v182 = *(_QWORD *)(a2 + v181);
          if (v182 <= 0xFFFFFFFFFFFFFFF7 && v182 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v182);
            *(_QWORD *)(a2 + v181) = v182 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 4;
          goto LABEL_652;
        case 0x48u:
          a1[99] |= 0x1000uLL;
          v183 = *v3;
          v184 = *(_QWORD *)(a2 + v183);
          if (v184 <= 0xFFFFFFFFFFFFFFF7 && v184 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v184);
            *(_QWORD *)(a2 + v183) = v184 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 13;
          goto LABEL_652;
        case 0x49u:
          a1[99] |= 0x200uLL;
          v185 = *v3;
          v186 = *(_QWORD *)(a2 + v185);
          if (v186 <= 0xFFFFFFFFFFFFFFF7 && v186 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v186);
            *(_QWORD *)(a2 + v185) = v186 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 10;
          goto LABEL_652;
        case 0x4Au:
          a1[99] |= 0x400uLL;
          v187 = *v3;
          v188 = *(_QWORD *)(a2 + v187);
          if (v188 <= 0xFFFFFFFFFFFFFFF7 && v188 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v188);
            *(_QWORD *)(a2 + v187) = v188 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 11;
          goto LABEL_652;
        case 0x4Bu:
          a1[99] |= 0x800uLL;
          v189 = *v3;
          v190 = *(_QWORD *)(a2 + v189);
          if (v190 <= 0xFFFFFFFFFFFFFFF7 && v190 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v190);
            *(_QWORD *)(a2 + v189) = v190 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 12;
          goto LABEL_652;
        case 0x4Cu:
          a1[99] |= 0x10000000uLL;
          v191 = *v3;
          v192 = *(_QWORD *)(a2 + v191);
          if (v192 <= 0xFFFFFFFFFFFFFFF7 && v192 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v192);
            *(_QWORD *)(a2 + v191) = v192 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 29;
          goto LABEL_652;
        case 0x4Du:
          a1[99] |= 0x2000000uLL;
          v193 = *v3;
          v194 = *(_QWORD *)(a2 + v193);
          if (v194 <= 0xFFFFFFFFFFFFFFF7 && v194 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v194);
            *(_QWORD *)(a2 + v193) = v194 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 26;
          goto LABEL_652;
        case 0x4Eu:
          a1[99] |= 0x4000000uLL;
          v195 = *v3;
          v196 = *(_QWORD *)(a2 + v195);
          if (v196 <= 0xFFFFFFFFFFFFFFF7 && v196 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v196);
            *(_QWORD *)(a2 + v195) = v196 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 27;
          goto LABEL_652;
        case 0x4Fu:
          a1[99] |= 0x8000000uLL;
          v197 = *v3;
          v198 = *(_QWORD *)(a2 + v197);
          if (v198 <= 0xFFFFFFFFFFFFFFF7 && v198 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v198);
            *(_QWORD *)(a2 + v197) = v198 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 28;
          goto LABEL_652;
        case 0x50u:
          a1[99] |= 0x1000000000uLL;
          v199 = *v3;
          v200 = *(_QWORD *)(a2 + v199);
          if (v200 <= 0xFFFFFFFFFFFFFFF7 && v200 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v200);
            *(_QWORD *)(a2 + v199) = v200 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 37;
          goto LABEL_652;
        case 0x51u:
          a1[99] |= 0x200000000uLL;
          v201 = *v3;
          v202 = *(_QWORD *)(a2 + v201);
          if (v202 <= 0xFFFFFFFFFFFFFFF7 && v202 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v202);
            *(_QWORD *)(a2 + v201) = v202 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 34;
          goto LABEL_652;
        case 0x52u:
          a1[99] |= 0x400000000uLL;
          v203 = *v3;
          v204 = *(_QWORD *)(a2 + v203);
          if (v204 <= 0xFFFFFFFFFFFFFFF7 && v204 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v204);
            *(_QWORD *)(a2 + v203) = v204 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 35;
          goto LABEL_652;
        case 0x53u:
          a1[99] |= 0x800000000uLL;
          v205 = *v3;
          v206 = *(_QWORD *)(a2 + v205);
          if (v206 <= 0xFFFFFFFFFFFFFFF7 && v206 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v206);
            *(_QWORD *)(a2 + v205) = v206 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 36;
          goto LABEL_652;
        case 0x54u:
          a1[99] |= 0x1000000uLL;
          v207 = *v3;
          v208 = *(_QWORD *)(a2 + v207);
          if (v208 <= 0xFFFFFFFFFFFFFFF7 && v208 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v208);
            *(_QWORD *)(a2 + v207) = v208 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 25;
          goto LABEL_652;
        case 0x55u:
          a1[99] |= 0x200000uLL;
          v209 = *v3;
          v210 = *(_QWORD *)(a2 + v209);
          if (v210 <= 0xFFFFFFFFFFFFFFF7 && v210 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v210);
            *(_QWORD *)(a2 + v209) = v210 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 22;
          goto LABEL_652;
        case 0x56u:
          a1[99] |= 0x400000uLL;
          v211 = *v3;
          v212 = *(_QWORD *)(a2 + v211);
          if (v212 <= 0xFFFFFFFFFFFFFFF7 && v212 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v212);
            *(_QWORD *)(a2 + v211) = v212 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 23;
          goto LABEL_652;
        case 0x57u:
          a1[99] |= 0x800000uLL;
          v213 = *v3;
          v214 = *(_QWORD *)(a2 + v213);
          if (v214 <= 0xFFFFFFFFFFFFFFF7 && v214 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v214);
            *(_QWORD *)(a2 + v213) = v214 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 24;
          goto LABEL_652;
        case 0x58u:
          a1[99] |= 0x100000000uLL;
          v215 = *v3;
          v216 = *(_QWORD *)(a2 + v215);
          if (v216 <= 0xFFFFFFFFFFFFFFF7 && v216 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v216);
            *(_QWORD *)(a2 + v215) = v216 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 33;
          goto LABEL_652;
        case 0x59u:
          a1[99] |= 0x20000000uLL;
          v217 = *v3;
          v218 = *(_QWORD *)(a2 + v217);
          if (v218 <= 0xFFFFFFFFFFFFFFF7 && v218 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v218);
            *(_QWORD *)(a2 + v217) = v218 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 30;
          goto LABEL_652;
        case 0x5Au:
          a1[99] |= 0x40000000uLL;
          v219 = *v3;
          v220 = *(_QWORD *)(a2 + v219);
          if (v220 <= 0xFFFFFFFFFFFFFFF7 && v220 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v220);
            *(_QWORD *)(a2 + v219) = v220 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 31;
          goto LABEL_652;
        case 0x5Bu:
          a1[99] |= 0x80000000uLL;
          v221 = *v3;
          v222 = *(_QWORD *)(a2 + v221);
          if (v222 <= 0xFFFFFFFFFFFFFFF7 && v222 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v27 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v222);
            *(_QWORD *)(a2 + v221) = v222 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v27 = 0;
          }
          v292 = 32;
LABEL_652:
          a1[v292] = v27;
          continue;
        case 0x5Cu:
          v223 = 0;
          v224 = 0;
          v106 = 0;
          a1[100] |= 0x20000000uLL;
          while (2)
          {
            v225 = *v3;
            v226 = *(_QWORD *)(a2 + v225);
            if (v226 == -1 || v226 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v227 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v226);
              *(_QWORD *)(a2 + v225) = v226 + 1;
              v106 |= (unint64_t)(v227 & 0x7F) << v223;
              if (v227 < 0)
              {
                v223 += 7;
                v14 = v224++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_429;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_429:
          v291 = 744;
          goto LABEL_474;
        case 0x5Du:
          PBReaderReadString();
          v228 = objc_claimAutoreleasedReturnValue();
          v229 = (void *)a1[98];
          a1[98] = v228;

          continue;
        case 0x5Eu:
          v230 = 0;
          v231 = 0;
          v106 = 0;
          a1[100] |= 0x10000000uLL;
          while (2)
          {
            v232 = *v3;
            v233 = *(_QWORD *)(a2 + v232);
            if (v233 == -1 || v233 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v234 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v233);
              *(_QWORD *)(a2 + v232) = v233 + 1;
              v106 |= (unint64_t)(v234 & 0x7F) << v230;
              if (v234 < 0)
              {
                v230 += 7;
                v14 = v231++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_433;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_433:
          v291 = 740;
          goto LABEL_474;
        case 0x5Fu:
          v235 = 0;
          v236 = 0;
          v106 = 0;
          a1[100] |= 0x4000000000uLL;
          while (2)
          {
            v237 = *v3;
            v238 = *(_QWORD *)(a2 + v237);
            if (v238 == -1 || v238 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v239 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v238);
              *(_QWORD *)(a2 + v237) = v238 + 1;
              v106 |= (unint64_t)(v239 & 0x7F) << v235;
              if (v239 < 0)
              {
                v235 += 7;
                v14 = v236++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_437;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_437:
          v291 = 780;
          goto LABEL_474;
        case 0x60u:
          v240 = 0;
          v241 = 0;
          v106 = 0;
          a1[100] |= 0x4000000uLL;
          while (2)
          {
            v242 = *v3;
            v243 = *(_QWORD *)(a2 + v242);
            if (v243 == -1 || v243 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v244 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v243);
              *(_QWORD *)(a2 + v242) = v243 + 1;
              v106 |= (unint64_t)(v244 & 0x7F) << v240;
              if (v244 < 0)
              {
                v240 += 7;
                v14 = v241++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_441;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_441:
          v291 = 732;
          goto LABEL_474;
        case 0x61u:
          v245 = 0;
          v246 = 0;
          v106 = 0;
          a1[100] |= 0x8000000uLL;
          while (2)
          {
            v247 = *v3;
            v248 = *(_QWORD *)(a2 + v247);
            if (v248 == -1 || v248 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v249 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v248);
              *(_QWORD *)(a2 + v247) = v248 + 1;
              v106 |= (unint64_t)(v249 & 0x7F) << v245;
              if (v249 < 0)
              {
                v245 += 7;
                v14 = v246++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_445;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_445:
          v291 = 736;
          goto LABEL_474;
        case 0x62u:
          v250 = 0;
          v251 = 0;
          v106 = 0;
          a1[100] |= 0x1000000000uLL;
          while (2)
          {
            v252 = *v3;
            v253 = *(_QWORD *)(a2 + v252);
            if (v253 == -1 || v253 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v254 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v253);
              *(_QWORD *)(a2 + v252) = v253 + 1;
              v106 |= (unint64_t)(v254 & 0x7F) << v250;
              if (v254 < 0)
              {
                v250 += 7;
                v14 = v251++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_449;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_449:
          v291 = 772;
          goto LABEL_474;
        case 0x63u:
          v255 = 0;
          v256 = 0;
          v106 = 0;
          a1[100] |= 0x2000000000uLL;
          while (2)
          {
            v257 = *v3;
            v258 = *(_QWORD *)(a2 + v257);
            if (v258 == -1 || v258 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v259 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v258);
              *(_QWORD *)(a2 + v257) = v258 + 1;
              v106 |= (unint64_t)(v259 & 0x7F) << v255;
              if (v259 < 0)
              {
                v255 += 7;
                v14 = v256++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_453;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_453:
          v291 = 776;
          goto LABEL_474;
        case 0x64u:
          v260 = 0;
          v261 = 0;
          v106 = 0;
          a1[100] |= 0x80000000uLL;
          while (2)
          {
            v262 = *v3;
            v263 = *(_QWORD *)(a2 + v262);
            if (v263 == -1 || v263 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v264 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v263);
              *(_QWORD *)(a2 + v262) = v263 + 1;
              v106 |= (unint64_t)(v264 & 0x7F) << v260;
              if (v264 < 0)
              {
                v260 += 7;
                v14 = v261++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_457;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_457:
          v291 = 752;
          goto LABEL_474;
        case 0x65u:
          v265 = 0;
          v266 = 0;
          v106 = 0;
          a1[100] |= 0x100000000uLL;
          while (2)
          {
            v267 = *v3;
            v268 = *(_QWORD *)(a2 + v267);
            if (v268 == -1 || v268 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v269 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v268);
              *(_QWORD *)(a2 + v267) = v268 + 1;
              v106 |= (unint64_t)(v269 & 0x7F) << v265;
              if (v269 < 0)
              {
                v265 += 7;
                v14 = v266++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_461;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_461:
          v291 = 756;
          goto LABEL_474;
        case 0x66u:
          v270 = 0;
          v271 = 0;
          v106 = 0;
          a1[100] |= 0x400000000uLL;
          while (2)
          {
            v272 = *v3;
            v273 = *(_QWORD *)(a2 + v272);
            if (v273 == -1 || v273 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v274 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v273);
              *(_QWORD *)(a2 + v272) = v273 + 1;
              v106 |= (unint64_t)(v274 & 0x7F) << v270;
              if (v274 < 0)
              {
                v270 += 7;
                v14 = v271++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_465;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_465:
          v291 = 764;
          goto LABEL_474;
        case 0x67u:
          v275 = 0;
          v276 = 0;
          v106 = 0;
          a1[100] |= 0x800000000uLL;
          while (2)
          {
            v277 = *v3;
            v278 = *(_QWORD *)(a2 + v277);
            if (v278 == -1 || v278 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v279 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v278);
              *(_QWORD *)(a2 + v277) = v278 + 1;
              v106 |= (unint64_t)(v279 & 0x7F) << v275;
              if (v279 < 0)
              {
                v275 += 7;
                v14 = v276++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_469;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_469:
          v291 = 768;
          goto LABEL_474;
        case 0x68u:
          v280 = 0;
          v281 = 0;
          v106 = 0;
          a1[100] |= 0x200000000uLL;
          while (2)
          {
            v282 = *v3;
            v283 = *(_QWORD *)(a2 + v282);
            if (v283 == -1 || v283 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v284 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v283);
              *(_QWORD *)(a2 + v282) = v283 + 1;
              v106 |= (unint64_t)(v284 & 0x7F) << v280;
              if (v284 < 0)
              {
                v280 += 7;
                v14 = v281++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_473;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v106) = 0;
LABEL_473:
          v291 = 760;
LABEL_474:
          *(_DWORD *)((char *)a1 + v291) = v106;
          continue;
        case 0x69u:
          v285 = 0;
          v286 = 0;
          v19 = 0;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v287 = *v3;
        v288 = *(_QWORD *)(a2 + v287);
        if (v288 == -1 || v288 >= *(_QWORD *)(a2 + *v4))
          break;
        v289 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v288);
        *(_QWORD *)(a2 + v287) = v288 + 1;
        v19 |= (unint64_t)(v289 & 0x7F) << v285;
        if ((v289 & 0x80) == 0)
          goto LABEL_476;
        v285 += 7;
        v14 = v286++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_478;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_476:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_478:
      v290 = 73;
LABEL_479:
      a1[v290] = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t VisionSignalGradingVisionGradeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  void *v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 0x20u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_70:
          v56 = v22 != 0;
          v57 = 39;
          goto LABEL_87;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v28) = 0;
LABEL_74:
          v58 = 32;
          goto LABEL_92;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_78:
          v56 = v34 != 0;
          v57 = 36;
          goto LABEL_87;
        case 5u:
          PBReaderReadString();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_msgSend((id)a1, "addExtractedSignals:", v38);

          continue;
        case 6u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          *(_BYTE *)(a1 + 40) |= 0x10u;
          while (2)
          {
            v42 = *v3;
            v43 = *(_QWORD *)(a2 + v42);
            if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
              *(_QWORD *)(a2 + v42) = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                v14 = v40++ >= 9;
                if (v14)
                {
                  v41 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v41 = 0;
LABEL_82:
          v56 = v41 != 0;
          v57 = 38;
          goto LABEL_87;
        case 7u:
          v45 = 0;
          v46 = 0;
          v47 = 0;
          *(_BYTE *)(a1 + 40) |= 8u;
          while (2)
          {
            v48 = *v3;
            v49 = *(_QWORD *)(a2 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
              *(_QWORD *)(a2 + v48) = v49 + 1;
              v47 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                v14 = v46++ >= 9;
                if (v14)
                {
                  v47 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v47 = 0;
LABEL_86:
          v56 = v47 != 0;
          v57 = 37;
LABEL_87:
          *(_BYTE *)(a1 + v57) = v56;
          continue;
        case 8u:
          v51 = 0;
          v52 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
        *(_QWORD *)(a2 + v53) = v54 + 1;
        v28 |= (unint64_t)(v55 & 0x7F) << v51;
        if ((v55 & 0x80) == 0)
          goto LABEL_89;
        v51 += 7;
        v14 = v52++ >= 9;
        if (v14)
        {
          LODWORD(v28) = 0;
          goto LABEL_91;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_89:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v28) = 0;
LABEL_91:
      v58 = 8;
LABEL_92:
      *(_DWORD *)(a1 + v58) = v28;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL VisionSignalGradingVisionGradeEventReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  VisionSignalGradingVisionGrade *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(VisionSignalGradingVisionGrade);
        objc_msgSend(a1, "addVisionGrades:", v17);
        if (!PBReaderPlaceMark() || (VisionSignalGradingVisionGradeReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(VisionSignalGradingEntry);
    objc_msgSend(a1, "addPopularityEntries:", v17);
    if (!PBReaderPlaceMark() || (VisionSignalGradingEntryReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _DKPRMetadataEntryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  _DKPRValue *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_35;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 8) = v22;
      }
      else if ((_DWORD)v17 == 2)
      {
        v26 = objc_alloc_init(_DKPRValue);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark() || (_DKPRValueReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DEFA610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_18DEFAD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_18DEFB4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_18DEFBD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DEFC0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DEFC8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DEFCC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18DEFCF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DEFD25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t FTCPPETInteractionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  FTCPPETParticipant *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  void *v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(FTCPPETParticipant);
          objc_msgSend((id)a1, "addParticipants:", v17);
          if (PBReaderPlaceMark() && (FTCPPETParticipantReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_42;
            v19 += 7;
            v14 = v20++ >= 9;
            if (v14)
            {
              v21 = 0;
              goto LABEL_44;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
          if (*(_BYTE *)(a2 + *v5))
            v21 = 0;
LABEL_44:
          *(_QWORD *)(a1 + 8) = v21;
          continue;
        case 3u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 24;
          goto LABEL_40;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          break;
        case 5u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 16;
LABEL_40:
          v33 = *(void **)(a1 + v26);
          *(_QWORD *)(a1 + v26) = v25;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          break;
        v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0)
          goto LABEL_46;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          v29 = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        v29 = 0;
LABEL_48:
      *(_BYTE *)(a1 + 40) = v29 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DEFE578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DEFE918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_18DEFF450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DEFF5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DF00C10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_18DF01520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_18DF02A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CDNormalizeString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "alphanumericCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_18DF04558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DF04CF0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf, int a18, __int16 a19, __int16 a20,const char *a21,__int128 a22)
{
  id v22;
  NSObject *v23;
  void *v24;
  char v25;
  void *v26;

  if (a2 == 1)
  {
    v22 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();
      if ((v25 & 1) != 0)
      {
        objc_msgSend(v22, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v24;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v22;
      a20 = 2082;
      a21 = "-[_DKSyncRapportCommonStorage handleDeviceFound:]";
      LOWORD(a22) = 2114;
      *(_QWORD *)((char *)&a22 + 2) = v26;
      _os_log_fault_impl(&dword_18DDBE000, v23, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v25 & 1) != 0)

    }
    objc_end_catch();
    JUMPOUT(0x18DF047F0);
  }
  _Unwind_Resume(a1);
}

void sub_18DF05720(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 buf,int a22,__int16 a23,__int16 a24,const char *a25,__int128 a26)
{
  id v26;
  NSObject *v27;
  void *v28;
  char v29;
  void *v30;

  if (a2 == 1)
  {
    v26 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_opt_respondsToSelector();
      if ((v29 & 1) != 0)
      {
        objc_msgSend(v26, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v28;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v26;
      a24 = 2082;
      a25 = "-[_DKSyncRapportCommonStorage handleDeviceChanged:changes:]";
      LOWORD(a26) = 2114;
      *(_QWORD *)((char *)&a26 + 2) = v30;
      _os_log_fault_impl(&dword_18DDBE000, v27, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v29 & 1) != 0)

    }
    objc_end_catch();
    JUMPOUT(0x18DF05248);
  }
  _Unwind_Resume(a1);
}

void sub_18DF05D40(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf, int a18, __int16 a19, __int16 a20,const char *a21,__int128 a22)
{
  id v22;
  NSObject *v23;
  void *v24;
  char v25;
  void *v26;

  if (a2 == 1)
  {
    v22 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();
      if ((v25 & 1) != 0)
      {
        objc_msgSend(v22, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v24;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v22;
      a20 = 2082;
      a21 = "-[_DKSyncRapportCommonStorage handleDeviceLost:]";
      LOWORD(a22) = 2114;
      *(_QWORD *)((char *)&a22 + 2) = v26;
      _os_log_fault_impl(&dword_18DDBE000, v23, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v25 & 1) != 0)

    }
    objc_end_catch();
    JUMPOUT(0x18DF05AB8);
  }
  _Unwind_Resume(a1);
}

void sub_18DF061F8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, const char *a19, __int128 a20)
{
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;

  if (a2 == 1)
  {
    v21 = objc_begin_catch(a1);
    objc_msgSend(*(id *)(v20 + 1976), "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();
      if ((v24 & 1) != 0)
      {
        objc_msgSend(v21, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v21;
      a18 = 2082;
      a19 = "-[_DKSyncRapportCommonStorage handleActivateWithError:]";
      LOWORD(a20) = 2114;
      *(_QWORD *)((char *)&a20 + 2) = v25;
      _os_log_fault_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v24 & 1) != 0)

    }
    objc_end_catch();
    JUMPOUT(0x18DF06130);
  }
  _Unwind_Resume(a1);
}

void sub_18DF067E8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,__int128 buf,int a28,__int16 a29,__int16 a30,const char *a31,__int128 a32)
{
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  char v37;
  void *v38;

  if (a2 == 1)
  {
    v34 = objc_begin_catch(a1);
    objc_msgSend(*(id *)(v32 + 1976), "syncChannel");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_opt_respondsToSelector();
      if ((v37 & 1) != 0)
      {
        objc_msgSend(v34, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v36;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v34;
      a30 = 2082;
      a31 = "-[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:]";
      LOWORD(a32) = 2114;
      *(_QWORD *)((char *)&a32 + 2) = v38;
      _os_log_fault_impl(&dword_18DDBE000, v35, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v37 & 1) != 0)

    }
    objc_msgSend(v33, "transformCaughtObject:existingError:", v34, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF06648);
  }
  _Unwind_Resume(a1);
}

void sub_18DF06C90(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, int a12, __int16 a13, __int16 a14, const char *a15, __int128 a16)
{
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  char v21;
  void *v22;

  if (a2 == 1)
  {
    v18 = objc_begin_catch(a1);
    objc_msgSend(*(id *)(v16 + 1976), "syncChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();
      if ((v21 & 1) != 0)
      {
        objc_msgSend(v18, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v18;
      a14 = 2082;
      a15 = "-[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:]";
      LOWORD(a16) = 2114;
      *(_QWORD *)((char *)&a16 + 2) = v22;
      _os_log_fault_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v21 & 1) != 0)

    }
    objc_msgSend(v17, "transformCaughtObject:existingError:", v18, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF06BD8);
  }
  _Unwind_Resume(a1);
}

void sub_18DF081C8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, const char *a19, __int128 a20)
{
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;

  if (a2 == 1)
  {
    v21 = objc_begin_catch(a1);
    objc_msgSend(*(id *)(v20 + 1976), "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();
      if ((v24 & 1) != 0)
      {
        objc_msgSend(v21, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v21;
      a18 = 2082;
      a19 = "-[_DKSyncRapportCommonStorage handleActivateCompanionLinkClient:forPeer:error:]";
      LOWORD(a20) = 2114;
      *(_QWORD *)((char *)&a20 + 2) = v25;
      _os_log_fault_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v24 & 1) != 0)

    }
    objc_end_catch();
    JUMPOUT(0x18DF07F08);
  }
  _Unwind_Resume(a1);
}

void sub_18DF090B8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 buf, int a20,__int16 a21,__int16 a22,const char *a23,__int128 a24)
{
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _BYTE v30[8];

  if (a2 == 1)
  {
    v26 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = objc_opt_respondsToSelector();
      if ((v30[0] & 1) != 0)
      {
        objc_msgSend(v26, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v28;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v26;
      a22 = 2082;
      a23 = "-[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithResponse:options:error:peer:plStartDate:completion:]";
      LOWORD(a24) = 2114;
      *(_QWORD *)((char *)&a24 + 2) = v29;
      _os_log_fault_impl(&dword_18DDBE000, v27, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v30[0] & 1) != 0)

    }
    objc_msgSend(v25, "transformCaughtObject:existingError:", v26, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v24)
      JUMPOUT(0x18DF08DE8);
    JUMPOUT(0x18DF08DB4);
  }
  _Unwind_Resume(a1);
}

void sub_18DF0B504(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __int128 buf;
  __int16 a68;
  const char *a69;
  __int128 a70;
  id v70;
  NSObject *v71;
  void *v72;
  char v73;
  void *v74;

  if (a2 == 1)
  {
    v70 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_opt_respondsToSelector();
      if ((v73 & 1) != 0)
      {
        objc_msgSend(v70, "callStackSymbols");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v74 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v72;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v70;
      a68 = 2082;
      a69 = "-[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:]";
      LOWORD(a70) = 2114;
      *(_QWORD *)((char *)&a70 + 2) = v74;
      _os_log_fault_impl(&dword_18DDBE000, v71, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v73 & 1) != 0)

    }
    objc_msgSend(a43, "transformCaughtObject:existingError:", v70, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF0B21CLL);
  }
  _Unwind_Resume(a1);
}

void sub_18DF0C334(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46)
{
  id v46;
  NSObject *v47;
  void *v48;
  char v49;
  void *v50;

  if (a2 == 1)
  {
    v46 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_opt_respondsToSelector();
      if ((v49 & 1) != 0)
      {
        objc_msgSend(v46, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v50 = 0;
      }
      LODWORD(STACK[0x220]) = 138544130;
      STACK[0x224] = (unint64_t)v48;
      LOWORD(STACK[0x22C]) = 2114;
      STACK[0x22E] = (unint64_t)v46;
      LOWORD(STACK[0x236]) = 2082;
      STACK[0x238] = (unint64_t)"-[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:]";
      LOWORD(STACK[0x240]) = 2114;
      STACK[0x242] = (unint64_t)v50;
      _os_log_fault_impl(&dword_18DDBE000, v47, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&STACK[0x220], 0x2Au);
      if ((v49 & 1) != 0)

    }
    objc_msgSend(a46, "transformCaughtObject:existingError:", v46, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF0C24CLL);
  }
  _Unwind_Resume(a1);
}

void sub_18DF0DBF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;

  if (a2 == 1)
  {
    v24 = objc_begin_catch(exception_object);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_respondsToSelector();
      if ((v27 & 1) != 0)
      {
        objc_msgSend(v24, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      *(_DWORD *)(v23 - 208) = 138544130;
      v29 = v23 - 208;
      *(_QWORD *)(v29 + 4) = v26;
      *(_WORD *)(v23 - 196) = 2114;
      *(_QWORD *)(v29 + 14) = v24;
      *(_WORD *)(v23 - 186) = 2082;
      *(_QWORD *)(v23 - 184) = "-[_DKSyncRapportKnowledgeStorage handleFetchEventsWithResponse:options:error:peer:plStart"
                               "Date:completion:]";
      *(_WORD *)(v23 - 176) = 2114;
      *(_QWORD *)(v29 + 34) = v28;
      _os_log_fault_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)(v23 - 208), 0x2Au);
      if ((v27 & 1) != 0)

    }
    objc_msgSend(a20, "transformCaughtObject:existingError:", v24, a21);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF0D9E0);
  }
  _Unwind_Resume(exception_object);
}

void sub_18DF0F4EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  void *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;

  v44 = v36;
  if (a2 == 1)
  {
    v38 = objc_begin_catch(exception_object);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_opt_respondsToSelector();
      if ((v41 & 1) != 0)
      {
        objc_msgSend(v38, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = 0;
      }
      *(_DWORD *)(v37 - 192) = 138544130;
      v43 = v37 - 192;
      *(_QWORD *)(v43 + 4) = v40;
      *(_WORD *)(v37 - 180) = 2114;
      *(_QWORD *)(v43 + 14) = v38;
      *(_WORD *)(v37 - 170) = 2082;
      *(_QWORD *)(v37 - 168) = "-[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithResponse:options:error:pee"
                               "r:plStartDate:completion:]";
      *(_WORD *)(v37 - 160) = 2114;
      *(_QWORD *)(v43 + 34) = v42;
      _os_log_fault_impl(&dword_18DDBE000, v39, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)(v37 - 192), 0x2Au);
      if ((v41 & 1) != 0)

    }
    objc_msgSend(a26, "transformCaughtObject:existingError:", v38, v44);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF0F320);
  }
  _Unwind_Resume(exception_object);
}

void sub_18DF0FE8C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf, int a14, __int16 a15, __int16 a16, const char *a17, __int128 a18)
{
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  char v23;
  void *v24;

  if (a2 == 1)
  {
    v20 = objc_begin_catch(a1);
    objc_msgSend(*(id *)(v18 + 1976), "syncChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();
      if ((v23 & 1) != 0)
      {
        objc_msgSend(v20, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v22;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v20;
      a16 = 2082;
      a17 = "-[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:]";
      LOWORD(a18) = 2114;
      *(_QWORD *)((char *)&a18 + 2) = v24;
      _os_log_fault_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v23 & 1) != 0)

    }
    objc_msgSend(v19, "transformCaughtObject:existingError:", v20, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF0FDC8);
  }
  _Unwind_Resume(a1);
}

void sub_18DF10628(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, const char *a19, __int128 a20)
{
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;

  if (a2 == 1)
  {
    v21 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();
      if ((v24 & 1) != 0)
      {
        objc_msgSend(v21, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v21;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:]";
      LOWORD(a20) = 2114;
      *(_QWORD *)((char *)&a20 + 2) = v25;
      _os_log_fault_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v24 & 1) != 0)

    }
    objc_msgSend(v20, "transformCaughtObject:existingError:", v21, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF104CCLL);
  }
  _Unwind_Resume(a1);
}

void sub_18DF10E48(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__int128 buf,int a26,__int16 a27,__int16 a28,const char *a29,__int128 a30)
{
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  char v34;
  void *v35;

  if (a2 == 1)
  {
    v31 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();
      if ((v34 & 1) != 0)
      {
        objc_msgSend(v31, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v33;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v31;
      a28 = 2082;
      a29 = "-[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]";
      LOWORD(a30) = 2114;
      *(_QWORD *)((char *)&a30 + 2) = v35;
      _os_log_fault_impl(&dword_18DDBE000, v32, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v34 & 1) != 0)

    }
    objc_msgSend(v30, "transformCaughtObject:existingError:", v31, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF10BF8);
  }
  _Unwind_Resume(a1);
}

void sub_18DF11664(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__int128 buf,int a26,__int16 a27,__int16 a28,const char *a29,__int128 a30)
{
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  char v34;
  void *v35;

  if (a2 == 1)
  {
    v31 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();
      if ((v34 & 1) != 0)
      {
        objc_msgSend(v31, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v33;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v31;
      a28 = 2082;
      a29 = "-[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]";
      LOWORD(a30) = 2114;
      *(_QWORD *)((char *)&a30 + 2) = v35;
      _os_log_fault_impl(&dword_18DDBE000, v32, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v34 & 1) != 0)

    }
    objc_msgSend(v30, "transformCaughtObject:existingError:", v31, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18DF11414);
  }
  _Unwind_Resume(a1);
}

void sub_18DF11FFC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, const char *a19, __int128 a20)
{
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  char v25;
  void *v26;

  if (a2 == 1)
  {
    v22 = objc_begin_catch(a1);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();
      if ((v25 & 1) != 0)
      {
        objc_msgSend(v22, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v24;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v22;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleFetchContextValuesWithResponse:options:error:peer:plStartDate:completion:]";
      LOWORD(a20) = 2114;
      *(_QWORD *)((char *)&a20 + 2) = v26;
      _os_log_fault_impl(&dword_18DDBE000, v23, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v25 & 1) != 0)

    }
    objc_msgSend(v21, "transformCaughtObject:existingError:", v22, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v20)
      JUMPOUT(0x18DF11E80);
    JUMPOUT(0x18DF11E54);
  }
  _Unwind_Resume(a1);
}

void sub_18DF12924(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, const char *a19, __int128 a20)
{
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  char v25;
  void *v26;
  void *v27;

  if (a2 == 1)
  {
    v23 = objc_begin_catch(a1);
    objc_msgSend(*(id *)(v22 + 1976), "syncChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();
      if ((v25 & 1) != 0)
      {
        objc_msgSend(v23, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v27;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v23;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleSendContextValuesWithResponse:options:error:peer:plStartDate:completion:]";
      LOWORD(a20) = 2114;
      *(_QWORD *)((char *)&a20 + 2) = v26;
      _os_log_fault_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v25 & 1) != 0)

    }
    objc_msgSend(v21, "transformCaughtObject:existingError:", v23, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v20)
      JUMPOUT(0x18DF1279CLL);
    JUMPOUT(0x18DF12774);
  }
  _Unwind_Resume(a1);
}

void sub_18DF1324C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, const char *a19, __int128 a20)
{
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  char v25;
  void *v26;
  void *v27;

  if (a2 == 1)
  {
    v23 = objc_begin_catch(a1);
    objc_msgSend(*(id *)(v22 + 1976), "syncChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();
      if ((v25 & 1) != 0)
      {
        objc_msgSend(v23, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v27;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v23;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithResponse:options:error:pe"
            "er:plStartDate:completion:]";
      LOWORD(a20) = 2114;
      *(_QWORD *)((char *)&a20 + 2) = v26;
      _os_log_fault_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v25 & 1) != 0)

    }
    objc_msgSend(v21, "transformCaughtObject:existingError:", v23, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v20)
      JUMPOUT(0x18DF130C4);
    JUMPOUT(0x18DF1309CLL);
  }
  _Unwind_Resume(a1);
}

void sub_18DF13B74(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, const char *a19, __int128 a20)
{
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  char v25;
  void *v26;
  void *v27;

  if (a2 == 1)
  {
    v23 = objc_begin_catch(a1);
    objc_msgSend(*(id *)(v22 + 1976), "syncChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();
      if ((v25 & 1) != 0)
      {
        objc_msgSend(v23, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v27;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v23;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithResponse:options:error:"
            "peer:plStartDate:completion:]";
      LOWORD(a20) = 2114;
      *(_QWORD *)((char *)&a20 + 2) = v26;
      _os_log_fault_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if ((v25 & 1) != 0)

    }
    objc_msgSend(v21, "transformCaughtObject:existingError:", v23, 0);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v20)
      JUMPOUT(0x18DF139ECLL);
    JUMPOUT(0x18DF139C4);
  }
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_12(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_2_9(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_4_7(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_12_5(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_13_3(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_17_5(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  uint64_t v0;

  return v0;
}

void sub_18DF1531C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_9(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

void _CDSizeMetricInitialize()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)_CDSizeMetricFamilies;
  _CDSizeMetricFamilies = v0;

  v2 = dispatch_queue_create("com.apple.coreduet.sizemetric", 0);
  v3 = (void *)_CDSizeMetricQueue;
  _CDSizeMetricQueue = (uint64_t)v2;

}

void CDSizeMetricAddSize(uint64_t a1, unsigned int a2)
{
  if (a1)
    -[_CDMutableSizeMetric addBytes:](a1, a2);
}

BOOL InteractionAnalysisPETInteractionEventsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  InteractionAnalysisPETInteractionEvent *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(InteractionAnalysisPETInteractionEvent **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(InteractionAnalysisPETInteractionEvent);
    -[InteractionAnalysisPETInteractionEvents addInteractionEvent:](a1, v18);
    if (!PBReaderPlaceMark()
      || (InteractionAnalysisPETInteractionEventReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18DF18E3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF19B90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF19CC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF19EE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1A110(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1A2E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1A538(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1A6D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1A880(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1AB6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1AC6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1AE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18DF1AF0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1B1E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1B3A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1B9D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1BA50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1C7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_12_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x2Au);
}

void sub_18DF1CDD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DF1CF4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void findAutoSuPlanByProbability_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Illegal probabilities[]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void findAutoSuPlanByProbability_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Unable to find bestSuStart or bestSuEnd with corresponding prob above desired threshold", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void findAutoSuPlanByProbability_cold_3(int *a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Interval too short, bestSuStart=%d, bestSuEnd=%d", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_5();
}

void __active_memory_limit_block_invoke_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "active memory limit: %dMB", (uint8_t *)v3, 8u);
}

void __active_memory_limit_block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "failed to get memory limit properties", v1, 2u);
}

void sleepPredictionWithParams2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "Sleep Prediction: Insufficient data: after removing all the leading continuous full days, the number of remaining full days < 3\n", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void sleepPredictionWithParams2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18DDBE000, a2, a3, "Sleep Prediction: %d probabilities given by sleep prediction algo. v2 (sleep: 0; wake: 1)",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_4();
}

void sleepPredictionWithParams2_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18DDBE000, a2, a3, "Sleep Prediction: number of days in consideration = %d\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

#error "18DF227E0: call analysis failed (funcsize=37)"

#error "18DF22880: call analysis failed (funcsize=37)"

#error "18DF22920: call analysis failed (funcsize=37)"

#error "18DF229C0: call analysis failed (funcsize=37)"

#error "18DF22A60: call analysis failed (funcsize=37)"

#error "18DF22B00: call analysis failed (funcsize=37)"

#error "18DF22BA0: call analysis failed (funcsize=37)"

#error "18DF22C40: call analysis failed (funcsize=37)"

#error "18DF22CE0: call analysis failed (funcsize=37)"

#error "18DF22D80: call analysis failed (funcsize=37)"

#error "18DF22E20: call analysis failed (funcsize=37)"

#error "18DF22EC0: call analysis failed (funcsize=37)"

#error "18DF22F60: call analysis failed (funcsize=37)"

#error "18DF23000: call analysis failed (funcsize=37)"

#error "18DF230A0: call analysis failed (funcsize=37)"

#error "18DF23140: call analysis failed (funcsize=37)"

void resolve_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Contact Resolution: Error fetching contacts from Contact Store = %@", a5, a6, a7, a8, 2u);
}

#error "18DF244A4: call analysis failed (funcsize=36)"

#error "18DF24A58: call analysis failed (funcsize=36)"

#error "18DF25BA8: call analysis failed (funcsize=49)"

void __dataCollectionIsEnabled_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Failed to determine subscription context with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __dataCollectionIsEnabled_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Failed to determine country code with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __dataCollectionIsEnabled_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Failed to determine iso country code with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

#error "18DF27C04: call analysis failed (funcsize=70)"

#error "18DF27D38: call analysis failed (funcsize=70)"

#error "18DF27E6C: call analysis failed (funcsize=70)"

void _DKSync3PolicyDuplicateNSStringPropertyValue_cold_1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_19_1();
  objc_msgSend((id)OUTLINED_FUNCTION_18_1(v3, v4), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  v5 = (id)OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_10_2(&dword_18DDBE000, v6, v7, "Not setting %@ because %@ is a %@ instead of a %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_6_7();
}

void _DKSync3PolicyDoesContainRequiredProperties_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_23_0(&dword_18DDBE000, a3, (uint64_t)a3, "Policy %@ is missing key %@", (uint8_t *)&v3);
}

void _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  __int16 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_8_1();
  v2 = v1;
  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  v4 = v3;
  objc_opt_class();
  v7 = 138413058;
  v8 = v2;
  OUTLINED_FUNCTION_22_0();
  v9 = v5;
  v10 = v3;
  v11 = v5;
  v12 = v6;
  _os_log_fault_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_FAULT, "Not setting %@ because %@ is a %@ instead of a %@", (uint8_t *)&v7, 0x2Au);

}

void _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue_cold_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_19_1();
  objc_msgSend((id)OUTLINED_FUNCTION_18_1(v3, v4), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  v5 = (id)OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_10_2(&dword_18DDBE000, v6, v7, "Not setting %@ because %@ is a %@ instead of a %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_6_7();
}

void _DKSync3PolicyDuplicateNSNumberPropertyValue_cold_1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_19_1();
  objc_msgSend((id)OUTLINED_FUNCTION_18_1(v3, v4), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  v5 = (id)OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_10_2(&dword_18DDBE000, v6, v7, "Not setting %@ because %@ is a %@ instead of a %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_6_7();
}

#error "18DF2C374: call analysis failed (funcsize=67)"

#error "18DF2C49C: call analysis failed (funcsize=67)"

#error "18DF2C5C4: call analysis failed (funcsize=67)"

#error "18DF2C6EC: call analysis failed (funcsize=67)"

#error "18DF2CACC: call analysis failed (funcsize=67)"

uint64_t getCNContactBirthdayKey_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:].cold.1(v0);
}

void ___logChannel_block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t for _CDReceiverNotifier", v0, 2u);
  OUTLINED_FUNCTION_4();
}

#error "18DF30170: call analysis failed (funcsize=69)"

#error "18DF302A0: call analysis failed (funcsize=69)"

#error "18DF305D8: call analysis failed (funcsize=76)"

#error "18DF30724: call analysis failed (funcsize=76)"

#error "18DF30858: call analysis failed (funcsize=69)"

#error "18DF309F4: call analysis failed (funcsize=97)"

#error "18DF31164: call analysis failed (funcsize=67)"

#error "18DF31284: call analysis failed (funcsize=67)"

#error "18DF316CC: call analysis failed (funcsize=67)"

#error "18DF31A94: call analysis failed (funcsize=77)"

void _clientNeedsHelpCallback_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10(&dword_18DDBE000, v0, (uint64_t)v0, "Unable to handle help callback for %@ (%@)", v1);
  OUTLINED_FUNCTION_5();
}

void _clientNeedsHelpCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "Got unexpected observer in client help callback %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _clientNeedsHelpCallback_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Client needs help: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

#error "18DF337E8: call analysis failed (funcsize=70)"

#error "18DF33A7C: call analysis failed (funcsize=70)"

#error "18DF33BB0: call analysis failed (funcsize=70)"

#error "18DF33DF8: call analysis failed (funcsize=86)"

#error "18DF33F18: call analysis failed (funcsize=66)"

#error "18DF34064: call analysis failed (funcsize=77)"

#error "18DF341B4: call analysis failed (funcsize=77)"

#error "18DF34310: call analysis failed (funcsize=79)"

#error "18DF348D8: call analysis failed (funcsize=66)"

void _CDClientStateFromEventIndexerBookmark_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Error archiving updated bookmark: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __recordInteractionsAsync_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(*(NSRange *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "count");
  v7 = 138543618;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_10(&dword_18DDBE000, a2, v6, "[async path] got !ok from daemon for chunk %{public}@ in %tu interactions", (uint8_t *)&v7);

}

#error "18DF38E90: call analysis failed (funcsize=56)"

#error "18DF38F84: call analysis failed (funcsize=56)"

#error "18DF39078: call analysis failed (funcsize=56)"

#error "18DF39444: call analysis failed (funcsize=56)"

#error "18DF39538: call analysis failed (funcsize=56)"

#error "18DF397C4: call analysis failed (funcsize=56)"

#error "18DF398B8: call analysis failed (funcsize=56)"

#error "18DF3ABF4: call analysis failed (funcsize=56)"

#error "18DF3ACE8: call analysis failed (funcsize=56)"

#error "18DF3ADDC: call analysis failed (funcsize=56)"

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

uint64_t CRIsAppleInternal()
{
  return MEMORY[0x1E0D1BCC8]();
}

uint64_t INExtractKeyImage()
{
  return MEMORY[0x1E0CBD410]();
}

uint64_t INInsertKeyImageExtraction()
{
  return MEMORY[0x1E0CBD430]();
}

uint64_t INTrimToKeyImage()
{
  return MEMORY[0x1E0CBD6B8]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x1E0CBB878]();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1E0CBB890]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1E0CBB8A0]();
}

CFStringRef IOPSGetProvidingPowerSourceType(CFTypeRef snapshot)
{
  return (CFStringRef)MEMORY[0x1E0CBB8B0](snapshot);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

uint64_t OSAGetDATaskingValue()
{
  return MEMORY[0x1E0D1BCF8]();
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1E0D1BD28]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE20]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CDDComplicationChangeNotificationString()
{
  return MEMORY[0x1E0D15CC0]();
}

uint64_t _CDDComplicationChangeOverCloudNotificationString()
{
  return MEMORY[0x1E0D15CC8]();
}

uint64_t _CDDCurrentActiveComplications()
{
  return MEMORY[0x1E0D15CD0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1E0DE3DC8]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1E0DE3DD0]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x1E0DE3E08]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1E0DE3E20]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x1E0DE3E28]();
}

uint64_t archive_errno()
{
  return MEMORY[0x1E0DE3E58]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x1E0DE3FB0]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1E0DE3FC0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1E0DE4010]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x1E0DE4028]();
}

uint64_t archive_write_set_format_pax_restricted()
{
  return MEMORY[0x1E0DE4058]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
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

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
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

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1E0C84C28](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x1E0C84C68]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1E0C84C70]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x1E0C84C78]();
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1E0C85140]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1E0C85150]();
}

uint64_t rootless_mkdir_datavault()
{
  return MEMORY[0x1E0C85158]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C853A8](a1, *(_QWORD *)&a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vrsum(const float *__A, vDSP_Stride __IA, const float *__S, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C7E0](__A, __IA, __S, __C, __IC, __N);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x1E0C85DA8]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
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

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x1E0C86428]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x1E0C86438]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x1E0C86448]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x1E0C86460]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x1E0C86470]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x1E0C86488]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

