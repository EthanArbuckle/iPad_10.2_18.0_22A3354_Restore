@implementation CalImageGetPropertyIDWithPropertyName

void __CalImageGetPropertyIDWithPropertyName_block_invoke()
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
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("colorData");
  v2 = 3;
  v3 = CFSTR("identifier");
  v4 = 4;
  v5 = CFSTR("name");
  v6 = 2;
  v7 = CFSTR("type");
  v8 = 1;
  v9 = CFSTR("source");
  v10 = 7;
  CalImageGetPropertyIDWithPropertyName_sPropDict = (uint64_t)_CalDBCreatePropertyMap((uint64_t)&v1, 5);
  for (i = 64; i != -16; i -= 16)

}

@end
