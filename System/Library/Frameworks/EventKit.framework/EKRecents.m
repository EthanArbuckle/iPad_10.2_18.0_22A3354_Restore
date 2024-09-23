@implementation EKRecents

+ (Class)crRecentContactsLibraryClass
{
  if (crRecentContactsLibraryClass_onceToken != -1)
    dispatch_once(&crRecentContactsLibraryClass_onceToken, &__block_literal_global_17);
  return (Class)(id)crRecentContactsLibraryClass_crRecentContactsLibraryClass;
}

uint64_t __41__EKRecents_crRecentContactsLibraryClass__block_invoke()
{
  uint64_t result;

  result = EKWeakLinkClass();
  crRecentContactsLibraryClass_crRecentContactsLibraryClass = result;
  return result;
}

+ (id)crAddressKindEmailString
{
  if (crAddressKindEmailString_onceToken != -1)
    dispatch_once(&crAddressKindEmailString_onceToken, &__block_literal_global_2);
  return (id)crAddressKindEmailString_crAddressKindEmailString;
}

void __37__EKRecents_crAddressKindEmailString__block_invoke()
{
  uint64_t v0;
  void *v1;

  EKWeakLinkStringConstant();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)crAddressKindEmailString_crAddressKindEmailString;
  crAddressKindEmailString_crAddressKindEmailString = v0;

}

+ (id)crAddressKindPhoneNumberString
{
  if (crAddressKindPhoneNumberString_onceToken != -1)
    dispatch_once(&crAddressKindPhoneNumberString_onceToken, &__block_literal_global_4_0);
  return (id)crAddressKindPhoneNumberString_crAddressKindPhoneNumberString;
}

void __43__EKRecents_crAddressKindPhoneNumberString__block_invoke()
{
  uint64_t v0;
  void *v1;

  EKWeakLinkStringConstant();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)crAddressKindPhoneNumberString_crAddressKindPhoneNumberString;
  crAddressKindPhoneNumberString_crAddressKindPhoneNumberString = v0;

}

+ (id)crRecentsDomainCalendarString
{
  if (crRecentsDomainCalendarString_onceToken != -1)
    dispatch_once(&crRecentsDomainCalendarString_onceToken, &__block_literal_global_6_4);
  return (id)crRecentsDomainCalendarString_crRecentsDomainCalendarString;
}

void __42__EKRecents_crRecentsDomainCalendarString__block_invoke()
{
  uint64_t v0;
  void *v1;

  EKWeakLinkStringConstant();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)crRecentsDomainCalendarString_crRecentsDomainCalendarString;
  crRecentsDomainCalendarString_crRecentsDomainCalendarString = v0;

}

+ (id)recentForContactWithAddress:(id)a3 name:(id)a4 kind:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(a1, "crRecentContactsLibraryClass");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v10, v9, v8, v12, 0, 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)recordRecentWithAddress:(id)a3 name:(id)a4 kind:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v9)
    v9 = v8;
  objc_msgSend(a1, "recentForContactWithAddress:name:kind:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(a1, "crRecentContactsLibraryClass"), "defaultInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "crRecentsDomainCalendarString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordContactEvents:recentsDomain:sendingAddress:completion:", v12, v13, 0, 0);

}

+ (BOOL)recordRecentForContactWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  if (v9)
  {
    objc_msgSend(a1, "crAddressKindEmailString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordRecentWithAddress:name:kind:", v9, v8, v11);

  }
  if (v10)
  {
    objc_msgSend(a1, "crAddressKindPhoneNumberString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordRecentWithAddress:name:kind:", v10, v8, v12);

  }
  return (v9 | v10) != 0;
}

@end
