@implementation NSData(MSDataUtilities)

- (id)MSInitWithBase64Encoding:()MSDataUtilities
{
  id v3;
  unint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  id v19;
  void *v20;
  uint64_t v22;
  id v23;
  uint64_t *v24;
  _BYTE *v25;
  id v26;
  uint64_t v27;

  v23 = a1;
  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = malloc_type_malloc(3 * (v4 >> 2), 0xB54753B8uLL);
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99850], CFSTR("Unable to allocate memory for length (%lu)"), 3 * (v4 >> 2));
  v24 = &v22;
  v25 = v5;
  if (v4 >= 0x3E8)
    v6 = 1000;
  else
    v6 = v4;
  v7 = (char *)&v22 - ((2 * (_WORD)v6 + 15) & 0xFF0);
  v26 = v3;
  objc_msgSend(v3, "getCharacters:range:", v7, 0, v6);
  if (v4)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = v6;
    while (1)
    {
      if (v8 >= v6)
      {
        if (v4 - (v11 + v15) < v6)
          v15 = v4 - (v11 + v15);
        objc_msgSend(v26, "getCharacters:range:", v7, v9, v15);
        v8 = 0;
        v11 = v9;
      }
      v16 = *(unsigned __int16 *)&v7[2 * v8];
      if (v16 > 0x7F || MSInitWithBase64Encoding__DataDecodeTable[v16] < 0)
        goto LABEL_19;
      if ((_DWORD)v16 == 61)
      {
        if ((v14 & 3) == 0)
          goto LABEL_19;
        ++v13;
      }
      else if (v13)
      {
        goto LABEL_28;
      }
      ++v14;
      v10 = MSInitWithBase64Encoding__DataDecodeTable[v16] + (v10 << 6);
      if ((v14 & 3) == 0)
      {
        v18 = v25;
        v25[v12] = BYTE2(v10);
        if (v13 > 1)
        {
          v17 = v12 + 1;
        }
        else
        {
          v17 = v12 + 2;
          v18[v12 + 1] = BYTE1(v10);
          if (v13)
          {
            v13 = 1;
          }
          else
          {
            v18[v17] = v10;
            v17 = v12 + 3;
          }
        }
        goto LABEL_20;
      }
LABEL_19:
      v17 = v12;
LABEL_20:
      ++v9;
      ++v8;
      v12 = v17;
      if (v4 == v9)
        goto LABEL_29;
    }
  }
  v14 = 0;
  v13 = 0;
  v12 = 0;
  v9 = 0;
LABEL_28:
  v17 = v12;
  if (v9 != v4)
    goto LABEL_32;
LABEL_29:
  if ((v14 & 3) != 0 || v13 > 2)
  {
LABEL_32:
    free(v25);
    v20 = 0;
    goto LABEL_33;
  }
  v19 = v23;
  v20 = (void *)objc_msgSend(v19, "initWithBytesNoCopy:length:freeWhenDone:", v25, v17, 1);
LABEL_33:

  return v20;
}

- (id)MSBase64Encoding
{
  unint64_t v2;
  unint64_t v3;
  size_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v2 = objc_msgSend(a1, "length");
  v3 = v2 % 3;
  v4 = 4 * (v2 / 3) + 4 * (v2 % 3 != 0);
  if (v4 < v2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("data is too large to encode"));
  v5 = malloc_type_malloc(v4, 0xE99ED157uLL);
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99850], CFSTR("unable to allocate memory for length (%lu)"), v4);
  v6 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (!v2)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, v4, 1, 1);
  v7 = 0;
  v8 = 0;
  v9 = (unsigned __int8 *)(v6 - 1);
  do
  {
    v10 = v8 % 3;
    if (v8 % 3 == 2)
    {
      v12 = v7 + 1;
      v5[v7] = MSPCUCreateBase64StringFromData_DataEncodeTable[((unint64_t)(v9[1] | (*v9 << 8)) >> 6) & 0x3F];
      v11 = v9[1] & 0x3F;
      v13 = 2;
    }
    else
    {
      if (v10 == 1)
      {
        v11 = ((unint64_t)(v9[1] | (*v9 << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v10)
          goto LABEL_15;
        v11 = (unint64_t)v9[1] >> 2;
      }
      v13 = 1;
      v12 = v7;
    }
    v7 += v13;
    v5[v12] = MSPCUCreateBase64StringFromData_DataEncodeTable[v11];
LABEL_15:
    ++v8;
    ++v9;
    --v2;
  }
  while (v2);
  if (v3 == 2)
  {
    v16 = MSPCUCreateBase64StringFromData_DataEncodeTable[4 * (*v9 & 0xF)];
    v17 = 1;
    v15 = v7;
LABEL_20:
    v5[v15] = v16;
    v5[v7 + v17] = 61;
  }
  else if (v3 == 1)
  {
    v14 = MSPCUCreateBase64StringFromData_DataEncodeTable[16 * (*v9 & 3)];
    v15 = v7 + 1;
    v5[v7] = v14;
    v16 = 61;
    v17 = 2;
    goto LABEL_20;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, v4, 1, 1);
}

- (id)MSHexString
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  unsigned int v8;
  void *v9;

  v2 = objc_msgSend(a1, "length");
  v3 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v4 = 2 * v2;
  v5 = malloc_type_malloc((2 * v2) | 1, 0x70C6BC9BuLL);
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99850], CFSTR("Cannot allocate space for hex conversion buffer"));
  v6 = v5;
  if (v2)
  {
    v7 = v5;
    do
    {
      v8 = *v3++;
      *v7 = a0123456789abcd[(unint64_t)v8 >> 4];
      v6 = v7 + 2;
      v7[1] = a0123456789abcd[v8 & 0xF];
      v7 += 2;
      --v2;
    }
    while (v2);
  }
  *v6 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v5, v4, 1);
  free(v5);
  return v9;
}

@end
