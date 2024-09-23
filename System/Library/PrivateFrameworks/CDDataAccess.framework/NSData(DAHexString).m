@implementation NSData(DAHexString)

- (id)da_hexString
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  char v9;
  unsigned int v10;
  char v11;
  char *v12;
  char v13;
  char v14;
  unsigned int v15;
  char v16;
  char v17;
  _BYTE *v18;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  v4 = malloc_type_malloc(((9 * v3) >> 2) & 0x1FFFFFFFFFFFFFFFLL, 0xACE2245uLL);
  if (v3 < 5)
  {
    v5 = 0;
    v7 = v4;
    if (!v3)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v4, v7 - v4, 1, 1);
    goto LABEL_15;
  }
  v5 = 0;
  v6 = v2;
  v7 = v4;
  do
  {
    v8 = 0;
    ++v7;
    do
    {
      if (*(unsigned __int8 *)(v6 + v8) <= 0x9Fu)
        v9 = 48;
      else
        v9 = 87;
      *(v7 - 1) = v9 + (*(_BYTE *)(v6 + v8) >> 4);
      v10 = *(_BYTE *)(v6 + v8) & 0xF;
      if (v10 <= 9)
        v11 = 48;
      else
        v11 = 87;
      *v7 = v11 + v10;
      v7 += 2;
      ++v8;
    }
    while (v8 != 4);
    *(v7 - 1) = 32;
    v5 += 4;
    v3 -= 4;
    v6 += 4;
  }
  while (v3 > 4);
  if (v3)
  {
LABEL_15:
    v12 = (char *)(v2 + v5);
    do
    {
      if (*v12 <= 0x9Fu)
        v13 = 48;
      else
        v13 = 87;
      *v7 = v13 + (*v12 >> 4);
      v14 = *v12++;
      v15 = v14 & 0xF;
      if (v15 <= 9)
        v16 = 48;
      else
        v16 = 87;
      v17 = v16 + v15;
      v18 = v7 + 2;
      v7[1] = v17;
      v7 += 2;
      --v3;
    }
    while (v3);
    v7 = v18;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v4, v7 - v4, 1, 1);
}

- (id)da_lowercaseHexStringWithoutSpaces
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "da_hexString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_1E7B93480, 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)da_uppercaseHexStringWithoutSpaces
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "da_hexString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uppercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_1E7B93480, 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (id)da_dataWithHexString:()DAHexString stringIsUppercase:
{
  id v5;
  void *v6;
  const __CFString *v7;
  char v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  char v13;
  unint64_t v14;
  char v15;
  char v17;
  char v18;
  char v20;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (a4)
    v7 = CFSTR("0123456789ABCDEF");
  else
    v7 = CFSTR("0123456789abcdef");
  if (a4)
    v8 = -55;
  else
    v8 = -87;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v10 = 0;
    do
    {
      v11 = v10;
      if (objc_msgSend(v5, "length") <= (unint64_t)v10)
      {
LABEL_13:
        v13 = -1;
      }
      else
      {
        v12 = v10 + 1;
        while (1)
        {
          v10 = v12;
          v13 = objc_msgSend(v5, "characterAtIndex:", v11);
          v11 = v10;
          if ((objc_msgSend(v9, "characterIsMember:", (unsigned __int16)v13) & 1) != 0)
            break;
          v14 = objc_msgSend(v5, "length");
          v12 = v10 + 1;
          if (v14 <= v10)
            goto LABEL_13;
        }
      }
      if (objc_msgSend(v5, "length") <= v11)
        break;
      ++v10;
      while (1)
      {
        v15 = objc_msgSend(v5, "characterAtIndex:", v11);
        if ((objc_msgSend(v9, "characterIsMember:", (unsigned __int16)v15) & 1) != 0)
          break;
        v11 = v10;
        if (objc_msgSend(v5, "length") <= (unint64_t)v10++)
          goto LABEL_27;
      }
      if (v13 == -1 || v15 == -1)
        break;
      v17 = v15 - 48;
      if ((v15 - 48) >= 0xAu)
        v17 = v8 + v15;
      v18 = (v13 - 48) >= 0xAu ? 16 * v13 - 112 : 16 * v13;
      v20 = v17 + v18;
      objc_msgSend(v6, "appendBytes:length:", &v20, 1);
    }
    while (objc_msgSend(v5, "length") > (unint64_t)v10);
  }
LABEL_27:

  return v6;
}

+ (uint64_t)da_dataWithHexString:()DAHexString
{
  return objc_msgSend(a1, "da_dataWithHexString:stringIsUppercase:", a3, 0);
}

@end
