@implementation NSData(ContactsFoundation)

- (BOOL)_cn_containsData:()ContactsFoundation
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "rangeOfData:options:range:", v4, 0, 0, objc_msgSend(a1, "length"));

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cn_decodeBase64
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BYTE *v14;
  _BOOL4 v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", (unint64_t)(3 * objc_msgSend(a1, "length")) >> 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5 >= 1)
  {
    v6 = v4 + v5;
LABEL_3:
    v7 = 0;
    v8 = 0;
    v9 = (_BYTE *)(v4 + 1);
    v10 = 1;
    while (2)
    {
      v11 = v10;
      v10 = 0;
      switch(Decode64Table[*(v9 - 1) & 0x7F])
      {
        case -5:
          LODWORD(v10) = v7 == 0;
          if (v7)
            v12 = v8;
          else
            v12 = v8 + 1;
          if (v8 >= 2)
            LODWORD(v10) = 0;
          v13 = (v11 & 1) == 0;
          if ((v11 & 1) != 0)
            v8 = v12;
          goto LABEL_14;
        case -4:
          if ((v11 & (v7 == 0)) != 0)
            v7 = (unint64_t)(v9 - 1);
          v10 = v11;
          goto LABEL_20;
        case -3:
          v19 = v9 - 1;
          if ((unint64_t)v9 < v6 && *v9 == 10)
            v19 = v9;
          goto LABEL_29;
        case -2:
          v19 = v9 - 1;
LABEL_29:
          v17 = (uint64_t)(v19 + 1);
          v16 = (unint64_t)(v19 + 1) < v6;
          if ((v11 & 1) == 0)
            goto LABEL_37;
          v18 = v9 - 1;
          goto LABEL_31;
        case -1:
          goto LABEL_20;
        default:
          LODWORD(v10) = (v8 | v7) == 0;
          v13 = (v11 & 1) == 0;
LABEL_14:
          if (v13)
            v10 = 0;
          else
            v10 = v10;
LABEL_20:
          v14 = v9 + 1;
          if ((unint64_t)v9++ < v6)
            continue;
          v16 = 0;
          v17 = (uint64_t)(v14 - 1);
          if ((v10 & 1) != 0)
          {
            v18 = 0;
LABEL_31:
            if (!v7)
              v7 = (unint64_t)v18;
            if (!v7)
              v7 = v6;
            v20 = v8 + v4;
            v21 = v7 - v20;
            if (v7 == v20)
            {
              v22 = 0;
            }
            else
            {
              v27 = 0;
              v22 = 0;
              do
              {
                if ((Decode64Table[*(_BYTE *)(v4 + v27) & 0x7F] & 0x80000000) == 0)
                {
                  v22 = Decode64Table[*(_BYTE *)(v4 + v27) & 0x7F] + (v22 << 6);
                  if ((~(_BYTE)v27 & 3) == 0)
                  {
                    v29 = BYTE2(v22);
                    objc_msgSend(v2, "appendBytes:length:", &v29, 1);
                    v30 = BYTE1(v22);
                    objc_msgSend(v2, "appendBytes:length:", &v30, 1);
                    v31 = v22;
                    objc_msgSend(v2, "appendBytes:length:", &v31, 1);
                    v22 = 0;
                  }
                }
                ++v27;
              }
              while (v21 != v27);
            }
            if ((v21 & 3) == 2)
            {
              v34 = v22 >> 4;
              v26 = &v34;
            }
            else
            {
              if ((v21 & 3) != 3)
                goto LABEL_52;
              v32 = v22 >> 10;
              objc_msgSend(v2, "appendBytes:length:", &v32, 1);
              v33 = v22 >> 2;
              v26 = &v33;
            }
            v25 = v2;
            v24 = 1;
          }
          else
          {
LABEL_37:
            if (v16)
              v23 = v17;
            else
              v23 = v6;
            v24 = v23 - v4;
            v25 = v2;
            v26 = (char *)v4;
          }
          objc_msgSend(v25, "appendBytes:length:", v26, v24);
LABEL_52:
          v4 = v17;
          if (!v16)
            return v2;
          goto LABEL_3;
      }
    }
  }
  return v2;
}

- (id)_cn_decodeBase64IgnoringWhitespace
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  _BOOL4 v13;
  _BOOL4 v14;
  char *v15;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", (unint64_t)(3 * objc_msgSend(a1, "length")) >> 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5 < 1)
    return v2;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = v4 + v5;
  v10 = v4 + 1;
  do
  {
    v11 = Decode64Table[*(_BYTE *)(v10 - 1) & 0x7F];
    if ((v11 + 4) >= 3)
    {
      if (v11 == -5)
      {
        v7 <<= 6;
        ++v6;
        v13 = ++v8 < 3;
        goto LABEL_13;
      }
      if (v11 == -1 || v8 != 0)
        return v2;
      v8 = 0;
      v7 = Decode64Table[*(_BYTE *)(v10 - 1) & 0x7F] + (v7 << 6);
      ++v6;
    }
    v13 = 1;
LABEL_13:
    if (v6 == 4 && v13)
    {
      v17 = BYTE2(v7);
      v13 = 1;
      objc_msgSend(v2, "appendBytes:length:", &v17, 1);
      if (v8 > 1)
      {
        v7 = 0;
        v6 = 0;
      }
      else
      {
        v18 = BYTE1(v7);
        v13 = 1;
        objc_msgSend(v2, "appendBytes:length:", &v18, 1);
        if (v8)
        {
          v7 = 0;
          v6 = 0;
          v8 = 1;
        }
        else
        {
          v19 = v7;
          v13 = 1;
          objc_msgSend(v2, "appendBytes:length:", &v19, 1);
          v7 = 0;
          v6 = 0;
        }
      }
    }
    if (v10 >= v9)
      break;
    ++v10;
  }
  while (v13);
  if (v6)
    v14 = v13;
  else
    v14 = 0;
  if (v14)
  {
    if (v6 == 3)
    {
      v21 = v7 >> 10;
      objc_msgSend(v2, "appendBytes:length:", &v21, 1);
      v22 = v7 >> 2;
      v15 = &v22;
LABEL_30:
      objc_msgSend(v2, "appendBytes:length:", v15, 1);
    }
    else if (v6 == 2)
    {
      v20 = v7 >> 4;
      v15 = &v20;
      goto LABEL_30;
    }
  }
  return v2;
}

- (id)_cn_SHA256HashDataWithSalt:()ContactsFoundation
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  void *v10;
  char v12;
  _BYTE v13[7];
  unsigned __int8 md[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", a1);
  v6 = objc_retainAutorelease(v5);
  CC_SHA256((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), md);
  v7 = 0;
  v8 = v13;
  do
  {
    v9 = md[v7];
    *(v8 - 1) = cn_nibbleToChar_byteMap[v9 >> 4];
    *v8 = cn_nibbleToChar_byteMap[v9 & 0xF];
    v8 += 2;
    ++v7;
  }
  while (v7 != 32);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v12, 64);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cn_md5Hash
{
  void *v2;
  id v3;
  const void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  LODWORD(v3) = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v2);
  CC_MD5(v4, (CC_LONG)v3, (unsigned __int8 *)objc_msgSend(v5, "mutableBytes"));
  return v5;
}

- (id)_cn_hexString
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  v2 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_retainAutorelease(a1);
  v5 = objc_msgSend(v4, "bytes");
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    do
      objc_msgSend(v3, "appendFormat:", CFSTR("%02lX"), *(unsigned __int8 *)(v5 + v6++));
    while (v6 < objc_msgSend(v4, "length"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_cn_SHA1String
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%x"), md[i]);
  return v2;
}

+ (id)_cn_dataFromHexString:()ContactsFoundation
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  char __str[2];
  __int16 v12;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = objc_msgSend(v3, "length");
  v6 = v5 - 1;
  if (v5 != 1)
  {
    v7 = 0;
    do
    {
      v8 = v7 + 1;
      v9 = objc_msgSend(v3, "characterAtIndex:", v7);
      if ((char)v9 >= 48 && v9 <= 0x66u && v9 - 58 >= 0x27)
      {
        __str[0] = v9;
        __str[1] = objc_msgSend(v3, "characterAtIndex:", v7 + 1);
        HIBYTE(v12) = strtol(__str, 0, 16);
        objc_msgSend(v4, "appendBytes:length:", (char *)&v12 + 1, 1);
        v8 = v7 + 2;
      }
      v7 = v8;
    }
    while (v8 < v6);
  }

  return v4;
}

- (id)_cn_writeToURL:()ContactsFoundation options:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NSData_ContactsFoundation___cn_writeToURL_options___block_invoke;
  v10[3] = &unk_1E29BBB40;
  v10[4] = a1;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  +[CNFuture futureWithBlock:](CNFuture, "futureWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_cn_trimTrailingZeros
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  if (v3)
  {
    v4 = v3;
    while (!*(_BYTE *)(v2 - 1 + v4))
    {
      if (!--v4)
        goto LABEL_5;
    }
    if (v4 >= objc_msgSend(v1, "length"))
    {
      v5 = v1;
    }
    else
    {
      objc_msgSend(v1, "subdataWithRange:", 0, v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_cn_padDataToLength:()ContactsFoundation
{
  id v5;

  if (objc_msgSend(a1, "length") >= a3)
  {
    v5 = a1;
  }
  else
  {
    v5 = (id)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v5, "increaseLengthBy:", a3 - objc_msgSend(a1, "length"));
  }
  return v5;
}

- (uint64_t)_cn_distanceFromData:()ContactsFoundation
{
  id v4;
  uint64_t v5;
  id v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  uint8x8_t v14;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (v5 == objc_msgSend(v4, "length"))
  {
    if ((objc_msgSend(a1, "isEqualToData:", v4) & 1) != 0
      || (v6 = objc_retainAutorelease(a1),
          v7 = (char *)objc_msgSend(v6, "bytes"),
          v8 = (char *)objc_msgSend(objc_retainAutorelease(v4), "bytes"),
          (v9 = objc_msgSend(v6, "length")) == 0))
    {
      v10 = 0;
    }
    else
    {
      v10 = 0;
      do
      {
        v12 = *v7++;
        v11 = v12;
        v13 = *v8++;
        v14 = (uint8x8_t)vcnt_s8((int8x8_t)(v13 ^ v11));
        v14.i16[0] = vaddlv_u8(v14);
        v10 += v14.u32[0];
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

@end
