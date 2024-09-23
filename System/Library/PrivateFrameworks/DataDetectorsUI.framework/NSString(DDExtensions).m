@implementation NSString(DDExtensions)

- (id)dd_uidna:()DDExtensions
{
  id v4;
  uint64_t v5;
  const UIDNA *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  int32_t v12;
  int32_t v13;
  uint64_t v14;
  UIDNAInfo pInfo;
  UErrorCode pErrorCode;

  v4 = a1;
  pErrorCode = U_ZERO_ERROR;
  v5 = MEMORY[0x1A1AF3400](0, &pErrorCode);
  if (pErrorCode <= U_ZERO_ERROR)
  {
    v6 = (const UIDNA *)v5;
    v7 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
    v8 = (char *)malloc_type_malloc(v7, 0xD1DD3C3uLL);
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v8, v7, 0, 4, 0, 0, objc_msgSend(v4, "length"), 0))
      {
        v10 = (char *)malloc_type_malloc(4 * v7, 0x771E4D41uLL);
        if (v10)
        {
          v11 = v10;
          pInfo = (UIDNAInfo)xmmword_19F0068E0;
          v12 = 4 * v7;
          if (a3)
            v13 = uidna_nameToUnicodeUTF8(v6, v9, v7, v10, v12, &pInfo, &pErrorCode);
          else
            v13 = uidna_nameToASCII_UTF8(v6, v9, v7, v10, v12, &pInfo, &pErrorCode);
          if (pErrorCode <= U_ZERO_ERROR && !pInfo.errors)
          {
            v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v11, v13, 4);

            v4 = (id)v14;
          }
          free(v11);
        }
      }
      free(v9);
    }
    uidna_close(v6);
  }
  return v4;
}

- (id)dd_EmailCoding:()DDExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 2)
    goto LABEL_15;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length") || !objc_msgSend(v7, "length"))
  {

LABEL_15:
    v16 = v4;
    goto LABEL_16;
  }
  objc_msgSend(v6, "stringByRemovingPercentEncoding");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v6;
  v11 = v10;

  v12 = (uint64_t)v11;
  if ((a3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLUserAllowedCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v13;
    if (v13)
      v12 = v13;
    else
      v12 = (uint64_t)v11;
  }
  v18[0] = v12;
  objc_msgSend(v7, "dd_uidna:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("@"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if ((a3 & 1) == 0)
  {

  }
LABEL_16:

  return v16;
}

- (uint64_t)dd_userFriendlyEmail
{
  return objc_msgSend(a1, "dd_EmailCoding:", 1);
}

- (uint64_t)dd_encodedEmail
{
  return objc_msgSend(a1, "dd_EmailCoding:", 0);
}

@end
