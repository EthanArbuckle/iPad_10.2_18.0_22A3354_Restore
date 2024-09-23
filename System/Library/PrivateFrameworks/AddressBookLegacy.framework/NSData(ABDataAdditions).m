@implementation NSData(ABDataAdditions)

- (id)abStringAtRange:()ABDataAdditions inEncoding:
{
  void *v6;

  v6 = (void *)objc_msgSend(a1, "subdataWithRange:");
  if (a5 == 4000100)
    return (id)objc_msgSend(v6, "abDecodedUTF7");
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, a5);
}

- (BOOL)abIsUTF16EntourageVCard
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  double v6;
  char v8;

  v2 = objc_msgSend(a1, "length");
  if (v2 >= 0x16)
    v3 = 22;
  else
    v3 = v2;
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(a1, "getBytes:range:", &v8, v4, 1);
      if (!v8)
        ++v5;
      v4 += 2;
    }
    while (v4 < v3);
    v6 = (float)v5;
  }
  else
  {
    v6 = 0.0;
  }
  return v6 / ((double)v3 * 0.5) > 0.8;
}

- (uint64_t)abEncodeVCardBase64DataWithInitialLength:()ABDataAdditions
{
  unint64_t v5;
  int *v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  v5 = 4 * objc_msgSend(a1, "length") / 3uLL;
  v6 = (int *)NSZoneMalloc(0, 0x10uLL);
  if (v5 <= 1)
    LODWORD(v5) = 1;
  *(_QWORD *)v6 = NSZoneMalloc(0, (int)v5);
  v6[2] = 0;
  v6[3] = v5;
  v7 = (_BYTE *)objc_msgSend(a1, "bytes");
  v8 = objc_msgSend(a1, "length");
  if (v8 < 1)
    goto LABEL_18;
  v9 = v8;
  v10 = 0;
  v11 = v8;
  do
  {
    v12 = v10 % 3;
    if (v10 % 3 == 2)
    {
      a3 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[((unint64_t)(*v7 | (*(v7 - 1) << 8)) >> 6) & 0x3F], a3);
      v13 = *v7 & 0x3F;
    }
    else if (v12 == 1)
    {
      v13 = ((unint64_t)(*v7 | (*(v7 - 1) << 8)) >> 4) & 0x3F;
    }
    else
    {
      if (v12)
        goto LABEL_12;
      v13 = (unint64_t)*v7 >> 2;
    }
    a3 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[v13], a3);
LABEL_12:
    ++v10;
    ++v7;
    --v11;
  }
  while (v11);
  if (v9 % 3 == 2)
  {
    v16 = Encode64Table[4 * (*(v7 - 1) & 0xF)];
    v15 = (uint64_t)v6;
    v14 = a3;
LABEL_17:
    v17 = appendToBufferWithLineFolding(v15, v16, v14);
    appendToBufferWithLineFolding((uint64_t)v6, 61, v17);
  }
  else if (v9 % 3 == 1)
  {
    v14 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[16 * (*(v7 - 1) & 3)], a3);
    v15 = (uint64_t)v6;
    v16 = 61;
    goto LABEL_17;
  }
LABEL_18:
  v18 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", *(_QWORD *)v6, v6[2]);
  NSZoneFree(0, v6);
  return v18;
}

- (char)abDecodedUTF7
{
  char *v2;
  char *v3;
  void *v4;
  id v5;
  char v6;
  int v7;
  int v8;
  BOOL v10;
  void *v11;
  void *v12;
  __int16 v14;
  char v15;

  v2 = (char *)objc_msgSend(a1, "length");
  if (v2)
  {
    v14 = 0;
    v3 = (char *)objc_msgSend(a1, "bytes");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v2);
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v8 = *v3++;
      v7 = v8;
      v15 = v8;
      if ((v6 & 1) != 0)
      {
        v10 = (v7 - 48) >= 0xA
           && (v7 - 64) >= 0x1Bu
           && (v7 - 97) >= 0x1Au;
        if (v10 && ((v7 - 43) & 0xFB) != 0)
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);

          if (v12)
          {
            objc_msgSend(v4, "appendData:", v12);

            v5 = 0;
          }
          LOWORD(v7) = v15;
          if (v15 != 45)
          {
LABEL_20:
            v14 = v7;
            objc_msgSend(v4, "appendBytes:length:", &v14, 2);
          }
          v6 = 0;
          goto LABEL_22;
        }
        v6 = 1;
        objc_msgSend(v5, "appendBytes:length:", &v15, 1);
      }
      else
      {
        if (v7 != 43)
          goto LABEL_20;

        v5 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
        v6 = 1;
      }
LABEL_22:
      if (!--v2)
      {
        v2 = (char *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 10);

        return v2;
      }
    }
  }
  return v2;
}

- (void)abDecodeVCardBase64
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  _BOOL4 v12;
  _BOOL4 v13;
  char *v14;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", (unint64_t)(3 * objc_msgSend(a1, "length")) >> 2);
  v3 = objc_msgSend(a1, "bytes");
  v4 = objc_msgSend(a1, "length");
  if (v4 < 1)
    return v2;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = v3 + v4;
  v9 = v3 + 1;
  do
  {
    v10 = Decode64Table[*(_BYTE *)(v9 - 1) & 0x7F];
    if ((v10 + 4) >= 3)
    {
      if (v10 == -5)
      {
        v5 <<= 6;
        ++v7;
        v12 = ++v6 < 3;
        goto LABEL_13;
      }
      if (v10 == -1 || v6 != 0)
        return v2;
      v6 = 0;
      v5 = Decode64Table[*(_BYTE *)(v9 - 1) & 0x7F] + (v5 << 6);
      ++v7;
    }
    v12 = 1;
LABEL_13:
    if (v7 == 4 && v12)
    {
      v16 = BYTE2(v5);
      v12 = 1;
      objc_msgSend(v2, "appendBytes:length:", &v16, 1);
      if (v6 > 1)
      {
        v7 = 0;
        v5 = 0;
      }
      else
      {
        v17 = BYTE1(v5);
        v12 = 1;
        objc_msgSend(v2, "appendBytes:length:", &v17, 1);
        if (v6)
        {
          v7 = 0;
          v5 = 0;
          v6 = 1;
        }
        else
        {
          v18 = v5;
          v12 = 1;
          objc_msgSend(v2, "appendBytes:length:", &v18, 1);
          v7 = 0;
          v5 = 0;
        }
      }
    }
    if (v9 >= v8)
      break;
    ++v9;
  }
  while (v12);
  if (v7)
    v13 = v12;
  else
    v13 = 0;
  if (v13)
  {
    if (v7 == 3)
    {
      v20 = v5 >> 10;
      objc_msgSend(v2, "appendBytes:length:", &v20, 1);
      v21 = v5 >> 2;
      v14 = &v21;
LABEL_30:
      objc_msgSend(v2, "appendBytes:length:", v14, 1);
    }
    else if (v7 == 2)
    {
      v19 = v5 >> 4;
      v14 = &v19;
      goto LABEL_30;
    }
  }
  return v2;
}

@end
