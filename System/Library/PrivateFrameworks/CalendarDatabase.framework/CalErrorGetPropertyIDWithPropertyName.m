@implementation CalErrorGetPropertyIDWithPropertyName

void __CalErrorGetPropertyIDWithPropertyName_block_invoke()
{
  uint64_t i;
  __CFString *v1;
  int v2;
  __CFString *v3;
  int v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("storeOwner");
  v2 = 7;
  v3 = CFSTR("calendarOwner");
  v4 = 8;
  v5 = CFSTR("calendarItemOwner");
  v6 = 9;
  v7 = CFSTR("errorType");
  v8 = 3;
  v9 = CFSTR("errorCode");
  v10 = 4;
  v11 = CFSTR("userInfoData");
  v12 = 5;
  CalErrorGetPropertyIDWithPropertyName_sPropDict = (uint64_t)_CalDBCreatePropertyMap((uint64_t)&v1, 6);
  for (i = 80; i != -16; i -= 16)

}

@end
