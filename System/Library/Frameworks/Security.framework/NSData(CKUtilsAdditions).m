@implementation NSData(CKUtilsAdditions)

- (id)CKHexString
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t i;
  _BYTE *v12;
  char v13;
  unsigned int v14;
  char v15;
  char v16;
  _BYTE *v17;
  char *v18;
  char v19;
  char v20;
  unsigned int v21;
  char v22;
  char v23;
  _BYTE *v24;
  void *v25;

  v1 = a1;
  v2 = objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  if (v3 <= 0x5555555555555555)
  {
    v6 = v3;
    v7 = malloc_type_calloc(1uLL, ((9 * v3) >> 2) & 0x1FFFFFFFFFFFFFFFLL, 0x277CBE2FuLL);
    v5 = v7;
    if (v6 < 5)
    {
      v8 = 0;
      v17 = v7;
      if (!v6)
      {
LABEL_26:
        v4 = v17 - v7;
        goto LABEL_27;
      }
    }
    else
    {
      v8 = 0;
      v9 = v2;
      v10 = v7;
      do
      {
        for (i = 0; i != 4; ++i)
        {
          v12 = v10;
          if (*(unsigned __int8 *)(v9 + i) <= 0x9Fu)
            v13 = 48;
          else
            v13 = 87;
          *v10 = v13 + (*(_BYTE *)(v9 + i) >> 4);
          v14 = *(_BYTE *)(v9 + i) & 0xF;
          if (v14 <= 9)
            v15 = 48;
          else
            v15 = 87;
          v16 = v15 + v14;
          v10 = v12 + 2;
          v12[1] = v16;
        }
        v17 = v12 + 3;
        *v10 = 32;
        v8 += 4;
        v6 -= 4;
        v9 += 4;
        v10 = v12 + 3;
      }
      while (v6 > 4);
      if (!v6)
        goto LABEL_26;
    }
    v18 = (char *)(v2 + v8);
    do
    {
      if (*v18 <= 0x9Fu)
        v19 = 48;
      else
        v19 = 87;
      *v17 = v19 + (*v18 >> 4);
      v20 = *v18++;
      v21 = v20 & 0xF;
      if (v21 <= 9)
        v22 = 48;
      else
        v22 = 87;
      v23 = v22 + v21;
      v24 = v17 + 2;
      v17[1] = v23;
      v17 += 2;
      --v6;
    }
    while (v6);
    v17 = v24;
    goto LABEL_26;
  }
  v4 = 0;
  v5 = 0;
LABEL_27:
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, v4, 1, 1);

  return v25;
}

- (id)CKLowercaseHexStringWithoutSpaces
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "CKHexString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_1E1FDD448, 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)CKUppercaseHexStringWithoutSpaces
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "CKHexString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uppercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_1E1FDD448, 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (id)CKDataWithHexString:()CKUtilsAdditions stringIsUppercase:
{
  id v5;
  id v6;
  const __CFString *v7;
  char v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v22;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (a4)
    v7 = CFSTR("0123456789ABCDEF");
  else
    v7 = CFSTR("0123456789abcdef");
  if (a4)
    v8 = -65;
  else
    v8 = -97;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    LODWORD(v10) = 0;
LABEL_9:
    v11 = v10;
    if (objc_msgSend(v5, "length") <= (unint64_t)v10)
    {
      LODWORD(v13) = 0;
      v16 = 1;
    }
    else
    {
      v12 = v10 + 1;
      do
      {
        LODWORD(v10) = v12;
        v13 = objc_msgSend(v5, "characterAtIndex:", v11);
        v14 = objc_msgSend(v9, "characterIsMember:", v13);
        v11 = v10;
        if ((v14 & 1) != 0)
          break;
        v15 = objc_msgSend(v5, "length");
        v12 = v10 + 1;
      }
      while (v15 > v10);
      v16 = v14 ^ 1;
    }
    v17 = objc_msgSend(v5, "length");
    while (v17 > v11)
    {
      v18 = objc_msgSend(v5, "characterAtIndex:", v11);
      if ((objc_msgSend(v9, "characterIsMember:", v18) & 1) != 0)
      {
        if ((v16 & 1) == 0)
        {
          v10 = (v10 + 1);
          v19 = v18 - 48;
          if ((v18 - 48) >= 0xA)
            v19 = v8 + v18 + 10;
          v20 = (v13 - 48) >= 0xA ? 16 * v13 - 112 : 16 * v13;
          v22 = v19 + v20;
          objc_msgSend(v6, "appendBytes:length:", &v22, 1);
          if (objc_msgSend(v5, "length") > v10)
            goto LABEL_9;
        }
        break;
      }
      v11 = (v10 + 1);
      v17 = objc_msgSend(v5, "length");
      LODWORD(v10) = v10 + 1;
    }
  }

  return v6;
}

+ (uint64_t)CKDataWithHexString:()CKUtilsAdditions
{
  return objc_msgSend(a1, "CKDataWithHexString:stringIsUppercase:", a3, 0);
}

@end
