@implementation NSString(AssistantServices)

+ (id)hexStringFromBytes:()AssistantServices length:
{
  uint64_t v4;
  _BYTE *v6;
  _BYTE *v7;
  _BYTE *v8;
  char v9;
  char v10;
  unsigned int v11;
  char v12;

  v4 = a4;
  v6 = malloc_type_malloc(2 * a4, 0xA08751D5uLL);
  v7 = v6;
  if (v4)
  {
    v8 = v6;
    do
    {
      if (*a3 <= 0x9Fu)
        v9 = 48;
      else
        v9 = 87;
      *v8 = v9 + (*a3 >> 4);
      v10 = *a3++;
      v11 = v10 & 0xF;
      if (v11 <= 9)
        v12 = 48;
      else
        v12 = 87;
      v7 = v8 + 2;
      v8[1] = v12 + v11;
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v7 - v6, 1, 1);
}

+ (id)hexStringFromData:()AssistantServices
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  objc_msgSend(a1, "hexStringFromBytes:length:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
