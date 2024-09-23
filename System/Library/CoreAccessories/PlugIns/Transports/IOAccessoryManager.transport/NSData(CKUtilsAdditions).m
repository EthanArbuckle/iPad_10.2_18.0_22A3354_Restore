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
  uint64_t v11;
  char v12;
  unsigned int v13;
  char v14;
  char *v15;
  char v16;
  char v17;
  unsigned int v18;
  char v19;
  char v20;
  _BYTE *v21;
  void *v22;

  v1 = a1;
  v2 = objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  if (v3 <= 0x5555555555555555)
  {
    v6 = v3;
    v7 = malloc_type_calloc(1uLL, ((9 * v3) >> 2) & 0x1FFFFFFFFFFFFFFFLL, 0x9D46FE2BuLL);
    v5 = v7;
    if (v6 < 5)
    {
      v8 = 0;
      v10 = v7;
      if (!v6)
      {
LABEL_26:
        v4 = v10 - v7;
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
        v11 = 0;
        ++v10;
        do
        {
          if (*(unsigned __int8 *)(v9 + v11) <= 0x9Fu)
            v12 = 48;
          else
            v12 = 87;
          *(v10 - 1) = v12 + (*(_BYTE *)(v9 + v11) >> 4);
          v13 = *(_BYTE *)(v9 + v11) & 0xF;
          if (v13 <= 9)
            v14 = 48;
          else
            v14 = 87;
          *v10 = v14 + v13;
          v10 += 2;
          ++v11;
        }
        while (v11 != 4);
        *(v10 - 1) = 32;
        v8 += 4;
        v6 -= 4;
        v9 += 4;
      }
      while (v6 > 4);
      if (!v6)
        goto LABEL_26;
    }
    v15 = (char *)(v2 + v8);
    do
    {
      if (*v15 <= 0x9Fu)
        v16 = 48;
      else
        v16 = 87;
      *v10 = v16 + (*v15 >> 4);
      v17 = *v15++;
      v18 = v17 & 0xF;
      if (v18 <= 9)
        v19 = 48;
      else
        v19 = 87;
      v20 = v19 + v18;
      v21 = v10 + 2;
      v10[1] = v20;
      v10 += 2;
      --v6;
    }
    while (v6);
    v10 = v21;
    goto LABEL_26;
  }
  v4 = 0;
  v5 = 0;
LABEL_27:
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, v4, 1, 1);

  return v22;
}

- (id)CKLowercaseHexStringWithoutSpaces
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "CKHexString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_24D71B4F0, 0, 0, objc_msgSend(v2, "length"));
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

  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_24D71B4F0, 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (id)CKDataWithHexString:()CKUtilsAdditions stringIsUppercase:
{
  id v5;
  id v6;
  const __CFString *v7;
  char v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  char v19;
  char v20;
  char v22;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  if (a4)
    v7 = CFSTR("0123456789ABCDEF");
  else
    v7 = CFSTR("0123456789abcdef");
  if (a4)
    v8 = -65;
  else
    v8 = -97;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v10 = 0;
    do
    {
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
          v10 = v12;
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
      if (objc_msgSend(v5, "length") <= v11)
        break;
      ++v10;
      while (1)
      {
        v17 = objc_msgSend(v5, "characterAtIndex:", v11);
        if ((objc_msgSend(v9, "characterIsMember:", v17) & 1) != 0)
          break;
        v11 = v10;
        if (objc_msgSend(v5, "length") <= (unint64_t)v10++)
          goto LABEL_27;
      }
      if ((v16 & 1) != 0)
        break;
      v19 = (v13 - 48) >= 0xA ? v13 + 9 : v13;
      v20 = v17 - 48;
      if ((v17 - 48) >= 0xA)
        v20 = v8 + v17 + 10;
      v22 = v20 + 16 * v19;
      objc_msgSend(v6, "appendBytes:length:", &v22, 1);
    }
    while (objc_msgSend(v5, "length") > (unint64_t)v10);
  }
LABEL_27:

  return v6;
}

+ (uint64_t)CKDataWithHexString:()CKUtilsAdditions
{
  return objc_msgSend(a1, "CKDataWithHexString:stringIsUppercase:", a3, 0);
}

@end
