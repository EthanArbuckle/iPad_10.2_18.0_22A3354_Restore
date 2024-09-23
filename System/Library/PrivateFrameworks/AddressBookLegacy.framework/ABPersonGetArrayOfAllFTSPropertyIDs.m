@implementation ABPersonGetArrayOfAllFTSPropertyIDs

CFArrayRef ___ABPersonGetArrayOfAllFTSPropertyIDs_block_invoke()
{
  CFArrayRef result;
  void *values[25];

  values[24] = *(void **)MEMORY[0x1E0C80C00];
  values[0] = (void *)kABPersonFirstNameProperty;
  values[1] = (void *)kABPersonLastNameProperty;
  values[2] = (void *)kABPersonMiddleNameProperty;
  values[3] = (void *)kABPersonFirstNamePhoneticProperty;
  values[4] = (void *)kABPersonMiddleNamePhoneticProperty;
  values[5] = (void *)kABPersonLastNamePhoneticProperty;
  values[6] = (void *)kABPersonOrganizationProperty;
  values[7] = (void *)kABPersonOrganizationPhoneticProperty;
  values[8] = (void *)kABPersonDepartmentProperty;
  values[9] = (void *)kABPersonNoteProperty;
  values[10] = (void *)kABPersonBirthdayProperty;
  values[11] = (void *)kABPersonJobTitleProperty;
  values[12] = (void *)kABPersonNicknameProperty;
  values[13] = (void *)kABPersonPrefixProperty;
  values[14] = (void *)kABPersonSuffixProperty;
  values[15] = (void *)kABPersonDisplayNameProperty;
  values[16] = (void *)kABPersonPhoneProperty;
  values[17] = (void *)kABPersonEmailProperty;
  values[18] = (void *)kABPersonAddressProperty;
  values[19] = (void *)kABPersonSocialProfileProperty;
  values[20] = (void *)kABPersonURLProperty;
  values[21] = (void *)kABPersonRelatedNamesProperty;
  values[22] = (void *)kABPersonInstantMessageProperty;
  values[23] = (void *)kABPersonDateProperty;
  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 24, 0);
  _ABPersonGetArrayOfAllFTSPropertyIDs_retVal = (uint64_t)result;
  return result;
}

@end
