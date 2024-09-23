@implementation CalOrganizerGetPropertyIDWithPropertyName

void __CalOrganizerGetPropertyIDWithPropertyName_block_invoke()
{
  __CFDictionary *MutableCopy;
  uint64_t i;
  __CFString *v2;
  int v3;
  __CFString *v4;
  int v5;
  __CFString *v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (CalAttendeeBasePropertiesMappingDict_onceToken != -1)
    dispatch_once(&CalAttendeeBasePropertiesMappingDict_onceToken, &__block_literal_global_12);
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)CalAttendeeBasePropertiesMappingDict_sOrganizerPropDict);
  v2 = CFSTR("owner");
  v3 = 25;
  v4 = CFSTR("isCurrentUser");
  v5 = 11;
  v6 = CFSTR("scheduleAgent");
  v7 = 13;
  _CalDBInsertPropertyMap(MutableCopy, (uint64_t)&v2, 3);
  CalOrganizerGetPropertyIDWithPropertyName_sPropDict = (uint64_t)MutableCopy;
  for (i = 32; i != -16; i -= 16)

}

@end
