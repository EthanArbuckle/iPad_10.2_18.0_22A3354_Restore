@implementation CNiOSABContactsUserDefaultsABWrapper

- (id)displayedContactsFilterRepresentationPref
{
  const __CFString *v2;

  v2 = (const __CFString *)ABPeoplePickerPrefs();
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("displayedGroupRepresentation"), v2);
}

- (id)abDefaultCountryCode
{
  return (id)objc_msgSend(MEMORY[0x1E0CF5D78], "abDefaultCountryCode");
}

- (unsigned)ABPersonGetCompositeNameFormatForRecord:(void *)a3
{
  return ABPersonGetCompositeNameFormatForRecord(a3);
}

- (void)ABPersonSetCompositeNameFormat:(unsigned int)a3
{
  ABPersonSetCompositeNameFormat();
}

- (void)ABPersonSetShortNameFormat:(unsigned int)a3
{
  ABPersonSetShortNameFormat();
}

- (void)ABPersonSetShortNameFormatEnabled:(BOOL)a3
{
  ABPersonSetShortNameFormatEnabled();
}

- (void)ABPersonSetShortNamePreferNicknames:(BOOL)a3
{
  ABPersonSetShortNamePreferNicknames();
}

- (void)setDisplayedContactsFilterRepresentationPref:(id)a3
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = a3;
  v4 = (const __CFString *)ABPeoplePickerPrefs();
  CFPreferencesSetAppValue(CFSTR("displayedGroupRepresentation"), v3, v4);

  v5 = (const __CFString *)ABPeoplePickerPrefs();
  CFPreferencesAppSynchronize(v5);
}

- (int64_t)lastIgnoredNewDuplicatesCount
{
  const __CFString *v2;

  v2 = (const __CFString *)ABPeoplePickerPrefs();
  return CFPreferencesGetAppIntegerValue(CFSTR("lastIgnoredNewDuplicatesCount"), v2, 0);
}

- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3
{
  const void *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (const __CFString *)ABPeoplePickerPrefs();
  CFPreferencesSetAppValue(CFSTR("lastIgnoredNewDuplicatesCount"), v3, v4);
  v5 = (const __CFString *)ABPeoplePickerPrefs();
  CFPreferencesAppSynchronize(v5);
}

@end
