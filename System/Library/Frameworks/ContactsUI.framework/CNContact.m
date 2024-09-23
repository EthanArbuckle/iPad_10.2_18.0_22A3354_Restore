@implementation CNContact

uint64_t __44__CNContact_UIAdditions__suggestionsEnabled__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnableSuggestions"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 0;
  v2 = !v1;
  suggestionsEnabled_enabled = v2;
  return result;
}

uint64_t __52__CNContact_UIAdditions__suggestionsShownInEditMode__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CNShowSuggestionsInEditMode"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  v2 = !v1;
  suggestionsShownInEditMode_enabled = v2;
  return result;
}

uint64_t __52__CNContact_UIAdditions__downtimeWhitelistUIEnabled__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnableDowntimeWhiteListUI"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  v2 = !v1;
  downtimeWhitelistUIEnabled_enabled = v2;
  return result;
}

uint64_t __45__CNContact_UIAdditions__quickActionsEnabled__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnableQuickActions"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  v2 = !v1;
  quickActionsEnabled_enabled = v2;
  return result;
}

uint64_t __60__CNContact_UIAdditions__copyWithCuratingBirthdaySuggestion__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

uint64_t __60__CNContact_UIAdditions__copyWithCuratingBirthdaySuggestion__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isSuggested"))
    v3 = objc_msgSend(v2, "isBirthday");
  else
    v3 = 0;

  return v3;
}

uint64_t __86__CNContact_UIAdditions__validPropertiesByEvaluatingPredicate_onMultiValueProperties___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "multiValuePropertiesSupportingPredicateValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2);

  return v4;
}

uint64_t __35__CNContact_UIAdditions__birthdays__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isSuggested"))
    v3 = objc_msgSend(v2, "isBirthday");
  else
    v3 = 0;

  return v3;
}

void __75__CNContact_UIAdditions__multiValuePropertiesSupportingPredicateValidation__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966A8];
  v6[0] = *MEMORY[0x1E0C967C0];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0C967F0];
  v6[2] = *MEMORY[0x1E0C968A0];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0C96868];
  v6[4] = *MEMORY[0x1E0C96690];
  v6[5] = v2;
  v6[6] = *MEMORY[0x1E0C96740];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)multiValuePropertiesSupportingPredicateValidation_cn_once_object_2;
  multiValuePropertiesSupportingPredicateValidation_cn_once_object_2 = v4;

}

void __48__CNContact_UIAdditions__descriptorForAllUIKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContact(UIAdditions) descriptorForAllUIKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForAllUIKeys_cn_once_object_1;
  descriptorForAllUIKeys_cn_once_object_1 = v4;

}

uint64_t __59__CNContact_UIAdditions__nameAndPhotoSharingDebugUIEnabled__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnableNameAndPhotoSharingDebugUI"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  v2 = !v1;
  nameAndPhotoSharingDebugUIEnabled_enabled = v2;
  return result;
}

uint64_t __47__CNContact_UIAdditions__settableMeCardEnabled__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnableSettableMeCard"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  v2 = !v1;
  settableMeCardEnabled_enabled = v2;
  return result;
}

uint64_t __39__CNContact_UIAdditions__geminiEnabled__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnableGemini"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  v2 = !v1;
  geminiEnabled_enabled = v2;
  return result;
}

@end
