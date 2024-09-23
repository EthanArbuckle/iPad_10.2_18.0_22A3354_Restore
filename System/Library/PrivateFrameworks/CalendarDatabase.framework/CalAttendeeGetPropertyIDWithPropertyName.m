@implementation CalAttendeeGetPropertyIDWithPropertyName

void __CalAttendeeGetPropertyIDWithPropertyName_block_invoke()
{
  __CFDictionary *MutableCopy;
  __CFString *v1;
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (CalAttendeeBasePropertiesMappingDict_onceToken != -1)
    dispatch_once(&CalAttendeeBasePropertiesMappingDict_onceToken, &__block_literal_global_12);
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)CalAttendeeBasePropertiesMappingDict_sAttendeePropDict);
  v1 = CFSTR("owner");
  v2 = 26;
  _CalDBInsertPropertyMap(MutableCopy, (uint64_t)&v1, 1);
  CalAttendeeGetPropertyIDWithPropertyName_sPropDict = (uint64_t)MutableCopy;

}

@end
