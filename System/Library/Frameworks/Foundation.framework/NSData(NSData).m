@implementation NSData(NSData)

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (uint64_t)hash
{
  uint64_t v1;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v1, *MEMORY[0x1E0C9AA10]);
  objc_msgSend(a1, "length");
  objc_msgSend(a1, "bytes");
  return CFHashBytes();
}

- (uint64_t)isEqual:()NSData
{
  uint64_t v3;
  uint64_t result;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA10]);
  if (a3 == a1)
    return 1;
  if (!a3)
    return 0;
  result = _NSIsNSData();
  if ((_DWORD)result)
    return objc_msgSend(a1, "isEqualToData:", a3);
  return result;
}

- (uint64_t)isEqualToData:()NSData
{
  uint64_t v3;
  void *v5;
  size_t v6;
  _BOOL8 v7;
  const void *v8;
  const void *v9;
  const void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[3];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v5 = a1;
  v26 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
  {
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA10]);
    if (!a3)
      return 0;
  }
  else if (!a3)
  {
    return 0;
  }
  if (a3 == v5)
    return 1;
  v6 = objc_msgSend(v5, "length");
  if (v6 != objc_msgSend(a3, "length"))
    return 0;
  v7 = 1;
  if (v6)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 1;
    if (objc_msgSend(v5, "_isCompact"))
      v8 = (const void *)objc_msgSend(v5, "bytes");
    else
      v8 = 0;
    if ((objc_msgSend(a3, "_isCompact") & 1) != 0)
    {
      v9 = (const void *)objc_msgSend(a3, "bytes");
      v10 = v9;
      v11 = v8 != 0;
      v12 = v9 != 0;
      if (v8 && v9)
      {
        v7 = memcmp(v8, v9, v6) == 0;
        *((_BYTE *)v23 + 24) = v7;
LABEL_22:
        _Block_object_dispose(&v22, 8);
        return v7;
      }
    }
    else
    {
      v12 = 0;
      v10 = 0;
      v11 = v8 != 0;
    }
    if (v11 || v12)
    {
      if (v11)
        v5 = a3;
      v20[1] = MEMORY[0x1E0C809B0];
      v20[2] = 3221225472;
      v20[3] = __32__NSData_NSData__isEqualToData___block_invoke;
      v20[4] = &unk_1E0F4D178;
      v21[1] = v8;
      v21[2] = v10;
      v13 = v21;
    }
    else
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __32__NSData_NSData__isEqualToData___block_invoke_2;
      v18 = &unk_1E0F4D150;
      v19 = a3;
      v13 = v20;
    }
    *v13 = &v22;
    objc_msgSend(v5, "enumerateByteRangesUsingBlock:", v15, v16, v17, v18, v19);
    v7 = *((_BYTE *)v23 + 24) != 0;
    goto LABEL_22;
  }
  return v7;
}

- (id)subdataWithRange:()NSData
{
  uint64_t v4;
  unint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  unint64_t v16;
  NSString *v17;
  uint64_t v18;
  NSRange v19;
  NSRange v20;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA10]);
  v9 = objc_msgSend(a1, "length");
  if (!a4)
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  if (__CFADD__(a4, a3))
  {
    v14 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v19.location = a3;
    v19.length = a4;
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v14, NSStringFromRange(v19), v18);
    goto LABEL_22;
  }
  if (a3 + a4 > v9)
  {
    v16 = v9;
    v17 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v20.location = a3;
    v20.length = a4;
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ exceeds data length %lu"), v17, NSStringFromRange(v20), v16);
LABEL_22:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v15, 0));
  }
  if (a3 || a4 != v9)
  {
    if (a4 >= 0x40
      && ((__objc2_class *)objc_opt_class() != NSConcreteData
       || objc_msgSend(a1, "_copyWillRetain"))
      && ((__objc2_class *)objc_opt_class() == NSConcreteData
       || (v12 = objc_opt_class(), v12 == objc_opt_class())
       || (v13 = objc_opt_class(), v13 == objc_opt_class())
       || a4 >> 15))
    {
      v10 = (void *)objc_msgSend(objc_allocWithZone((Class)NSSubrangeData), "initWithData:range:", a1, a3, a4);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithBytes:length:", objc_msgSend(a1, "bytes") + a3, a4);
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(a1, "copyWithZone:", 0);
  }
  return v10;
}

- (uint64_t)enumerateByteRangesUsingBlock:()NSData
{
  uint64_t v3;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA10]);
  v7 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, char *))(a3 + 16))(a3, objc_msgSend(a1, "bytes"), 0, objc_msgSend(a1, "length"), &v7);
}

- (uint64_t)initWithData:()NSData
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a3, "length");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(a3, "bytes");
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v8 = a1;
    v7 = 0;
    v9 = 0;
    v10 = 0;
  }
  return objc_msgSend(v8, "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", v7, v9, v10, 0, 0);
}

- (uint64_t)encodeWithCoder:()NSData
{
  uint64_t v3;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA10]);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    return objc_msgSend(a3, "encodeDataObject:", a1);
  if (object_getClass(a3) == (Class)NSKeyedArchiver)
    return objc_msgSend(a3, "_encodePropertyList:forKey:", a1, CFSTR("NS.data"));
  return objc_msgSend(a3, "encodeBytes:length:forKey:", objc_msgSend(a1, "bytes"), objc_msgSend(a1, "length"), CFSTR("NS.bytes"));
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (uint64_t)mutableCopyWithZone:()NSData
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v1, *MEMORY[0x1E0C9AA10]);
  v3 = objc_msgSend(a1, "length");
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v3);
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__NSData_NSData__mutableCopyWithZone___block_invoke;
    v7[3] = &unk_1E0F4D100;
    v7[4] = v4;
    objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v7);
  }
  return v5;
}

- (NSString)_base64EncodingAsString:()NSData withOptions:
{
  unint64_t v8;
  size_t v9;
  unint64_t v10;
  unint64_t v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  _QWORD *v16;
  _BYTE *v17;
  _BYTE *v18;
  unint64_t v19;
  char v20;
  _QWORD *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  NSString *v27;
  _QWORD v28[11];
  _QWORD v29[4];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "length"))
  {
    if (a3)
      return +[NSString string](NSString, "string");
    else
      return (NSString *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  }
  v8 = objc_msgSend(a1, "length");
  v9 = 4 * (v8 / 3) + 4 * (v8 != 3 * (v8 / 3));
  if (v9 < v8)
  {
LABEL_15:
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: data is too large to encode"), _NSMethodExceptionProem((objc_class *)a1, a2));
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (_QWORD *)MEMORY[0x1E0C99858];
    goto LABEL_29;
  }
  if ((a4 & 3) == 1)
  {
    v10 = 64;
  }
  else
  {
    if ((a4 & 3) != 2)
    {
      v10 = 0;
      v12 = a4 & 0x30;
      goto LABEL_17;
    }
    v10 = 76;
  }
  if ((a4 & 0x30) != 0)
    v12 = a4 & 0x30;
  else
    v12 = 48;
  v13 = (v12 >> 4) & 1;
  if (v12 > 0x1F)
    ++v13;
  v9 += ((__PAIR128__(v9 / v10, v9 % v10) - 1) >> 64) * v13;
  if (v9 < v8)
    goto LABEL_15;
LABEL_17:
  v17 = malloc_type_malloc(v9, 0xB0D1F2B1uLL);
  if (!v17)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unable to allocate memory for length (%lu)"), _NSMethodExceptionProem((objc_class *)a1, a2), v9);
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (_QWORD *)MEMORY[0x1E0C99850];
LABEL_29:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", *v16, v14, 0));
  }
  v18 = v17;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = v10;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __54__NSData_NSData___base64EncodingAsString_withOptions___block_invoke;
  v28[3] = &unk_1E0F4D1F0;
  v28[4] = &v38;
  v28[5] = v29;
  v28[8] = v10;
  v28[9] = v12;
  v28[10] = v17;
  v28[6] = &v34;
  v28[7] = &v30;
  objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v28);
  v19 = v39[3] % 3uLL;
  if (v19 == 1)
  {
    v22 = _base64EncodingAsString_withOptions__DataEncodeTable[16 * (v31[3] & 3)];
    v21 = v35 + 3;
    v23 = v35[3];
    v35[3] = v23 + 1;
    v18[v23] = v22;
    v20 = 61;
    goto LABEL_22;
  }
  if (v19 == 2)
  {
    v20 = _base64EncodingAsString_withOptions__DataEncodeTable[4 * (v31[3] & 0xF)];
    v21 = v35 + 3;
LABEL_22:
    v24 = (*v21)++;
    v18[v24] = v20;
    v25 = (*v21)++;
    v18[v25] = 61;
  }
  if (a3)
    v26 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", v18, v9, 1, 1);
  else
    v26 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", v18, v9, 0, 1, 0);
  v27 = v26;
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  return v27;
}

- (uint64_t)_initWithBase64EncodedObject:()NSData options:
{
  unint64_t v7;
  unint64_t v8;
  size_t v9;
  malloc_zone_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t *v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[9];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v31 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "length");
  if (!v7)
    return objc_msgSend(a1, "initWithBytes:length:", 0, 0);
  v8 = v7;
  v9 = 3 * (v7 >> 2);
  v10 = malloc_default_zone();
  v11 = malloc_type_zone_malloc(v10, v9, 0xAB91708DuLL);
  if (!v11)
  {
    v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unable to allocate memory for length (%lu)"), _NSMethodExceptionProem((objc_class *)a1, a2), v9);

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], v29, 0));
  }
  v12 = v11;
  v33 = 0;
  v34 = &v33;
  v35 = 0x4810000000;
  v36 = &unk_1823C230D;
  v37 = 0u;
  v38 = 0u;
  v39 = 0;
  v13 = _NSIsNSString();
  if ((_DWORD)v13)
  {
    v14 = 0;
    do
    {
      if (v8 == v14)
        break;
      if (v8 - v14 >= 0x400)
        v15 = 1024;
      else
        v15 = v8 - v14;
      MEMORY[0x1E0C80A78](v13);
      v17 = (unsigned __int16 *)((char *)&v30 - v16);
      *(_QWORD *)&v19 = MEMORY[0x1E0C80A78](v18).n128_u64[0];
      v21 = (char *)&v30 - v20;
      objc_msgSend(a3, "getCharacters:range:", v17, v14, v15, v19);
      if (v15)
      {
        v22 = v21;
        v23 = v15;
        do
        {
          v25 = *v17++;
          v24 = v25;
          if (v25 >= 0x80)
            v24 = 0;
          *v22++ = v24;
          --v23;
        }
        while (v23);
      }
      v13 = objc_msgSend(a1, "_decodeBase64EncodedCharacterBuffer:length:options:buffer:bufferLength:state:", v21, v15, v31, v12, v9, v34 + 4);
      v14 += v15;
    }
    while ((v13 & 1) != 0);
  }
  else
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __55__NSData_NSData___initWithBase64EncodedObject_options___block_invoke;
    v32[3] = &unk_1E0F4D1C8;
    v32[6] = v31;
    v32[7] = v12;
    v32[8] = v9;
    v32[4] = a1;
    v32[5] = &v33;
    objc_msgSend(a3, "enumerateByteRangesUsingBlock:", v32);
  }
  v27 = v34;
  if (*((_BYTE *)v34 + 32) || v34[6])
  {
    if (!objc_msgSend((id)objc_opt_class(), "_base64DecodingAlwaysSucceedsForOptions:", v31))
    {

      free(v12);
      v28 = 0;
      goto LABEL_24;
    }
    v27 = v34;
  }
  v28 = objc_msgSend(a1, "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", v12, v27[5], 0, 1, 0);
LABEL_24:
  _Block_object_dispose(&v33, 8);
  return v28;
}

+ (id)dataWithBytes:()NSData length:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithBytes:length:", a3, a4);
}

- (uint64_t)initWithBytes:()NSData length:
{
  return objc_msgSend(a1, "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", a3, a4, 1, 0, 0);
}

+ (id)dataWithBytesNoCopy:()NSData length:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithBytesNoCopy:length:", a3, a4);
}

+ (id)dataWithBytesNoCopy:()NSData length:freeWhenDone:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, a5);
}

+ (__objc2_class)allocWithZone:()NSData
{
  if ((objc_class *)MEMORY[0x1E0C99D50] == a1)
    return &___placeholderData;
  else
    return (__objc2_class **)NSAllocateObject(a1, 0, a3);
}

- (uint64_t)initWithBytes:()NSData length:copy:freeWhenDone:bytesAreVM:
{
  void *v7;
  void *v8;

  v7 = &__block_literal_global_6;
  if (a7)
    v7 = &__block_literal_global_1;
  if (a6)
    v8 = v7;
  else
    v8 = 0;
  return objc_msgSend(a1, "initWithBytes:length:copy:deallocator:", a3, a4, a5, v8);
}

- (uint64_t)initWithBytesNoCopy:()NSData length:freeWhenDone:
{
  return objc_msgSend(a1, "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", a3, a4, 0, a5, 0);
}

- (uint64_t)initWithBytesNoCopy:()NSData length:
{
  return objc_msgSend(a1, "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", a3, a4, 0, 1, 0);
}

- (uint64_t)_decodeBase64EncodedCharacterBuffer:()NSData length:options:buffer:bufferLength:state:
{
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  int v17;
  int v18;
  int v19;
  _BOOL4 v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  unsigned int v29;
  _BOOL4 v30;
  char v31;
  int v32;
  BOOL v33;

  if (a8)
  {
    v8 = *(_BYTE *)a8 != 0;
    v9 = *(_BYTE *)(a8 + 1) != 0;
    v11 = *(_QWORD *)(a8 + 8);
    v10 = *(_QWORD *)(a8 + 16);
    v12 = *(_QWORD *)(a8 + 24);
    v13 = *(_DWORD *)(a8 + 32);
  }
  else
  {
    v13 = 0;
    v12 = 0;
    v10 = 0;
    v11 = 0;
    v9 = 0;
    v8 = 0;
  }
  v14 = 0;
  v15 = a4 == 0;
  if (a4 && !v9)
  {
    v14 = 0;
    v16 = a4 - 1;
    v17 = 2;
    while (1)
    {
      if (*(char *)(a3 + v14) < 0 || (v18 = _decodeCharacter_DataDecodeTable[*(unsigned __int8 *)(a3 + v14)], v18 < 0))
      {
        if ((a5 & 1) == 0)
          goto LABEL_60;
        goto LABEL_14;
      }
      if (*(_BYTE *)(a3 + v14) == 61)
      {
        if ((a5 & 0x10000000) != 0 && !v10)
          goto LABEL_14;
        ++v12;
      }
      else if ((a5 & 1) == 0 && v12)
      {
LABEL_60:
        v25 = 0;
        goto LABEL_61;
      }
      v13 = v18 + (v13 << 6);
      if (++v10 == 4)
        break;
LABEL_14:
      ++v14;
      ++v17;
      if (v14 == a4)
      {
        v9 = 0;
        v15 = 1;
        v14 = a4;
        goto LABEL_42;
      }
    }
    v19 = 1;
    if (a7 < 3 || a7 - 3 < v11 || v12 == 3)
    {
      v25 = 0;
      v24 = v11;
      v10 = 4;
      goto LABEL_62;
    }
    v20 = v14 == v16;
    if (v14 != v16 && v12)
    {
      v21 = (int)v14 + 1;
      if (v21 < a4)
      {
        v22 = v17;
        while (1)
        {
          v23 = *(unsigned __int8 *)(a3 + v21);
          if (v23 != 61
            && ((a5 & 1) == 0 || (v23 & 0x80) == 0 && (_decodeCharacter_DataDecodeTable[v23] & 0x80000000) == 0))
          {
            break;
          }
          v21 = v22++;
          if (v21 >= a4)
            goto LABEL_31;
        }
        v20 = 0;
        v24 = v11 + 1;
        *(_BYTE *)(a6 + v11) = BYTE2(v13);
LABEL_36:
        *(_BYTE *)(a6 + v24) = BYTE1(v13);
        v24 = v11 + 2;
        if (!v20)
        {
LABEL_38:
          *(_BYTE *)(a6 + v24++) = v13;
LABEL_39:
          v10 = 0;
          if ((a5 & 1) == 0 && v12)
          {
            v10 = 0;
            v25 = 1;
            v19 = 1;
            if (v8)
              goto LABEL_62;
            goto LABEL_44;
          }
          v11 = v24;
          v12 = 0;
          goto LABEL_14;
        }
LABEL_37:
        if (v12)
          goto LABEL_39;
        goto LABEL_38;
      }
LABEL_31:
      v20 = 1;
    }
    v24 = v11 + 1;
    *(_BYTE *)(a6 + v11) = BYTE2(v13);
    if (v20 && v12 > 1)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_42:
  v25 = v9 || !v15;
  if (v8)
  {
LABEL_61:
    v19 = 1;
    v24 = v11;
    goto LABEL_62;
  }
  v24 = v11;
LABEL_44:
  if (v14 >= a4)
  {
    v19 = 0;
  }
  else
  {
    v26 = ~v14 + a4;
    v27 = (unsigned __int8 *)(a3 + v14);
    do
    {
      v29 = *v27++;
      v28 = v29;
      if ((a5 & 1) != 0)
      {
        if ((v28 & 0x80) != 0)
          v31 = -1;
        else
          v31 = _decodeCharacter_DataDecodeTable[v28];
        v30 = v31 < 0;
      }
      else
      {
        v30 = 0;
      }
      v32 = (_DWORD)v28 == 61 || v30;
      v33 = v26-- != 0;
    }
    while (v33 && (v32 & 1) != 0);
    v19 = v32 ^ 1;
  }
LABEL_62:
  if (a8)
  {
    *(_BYTE *)a8 = v19;
    *(_BYTE *)(a8 + 1) = v25;
    *(_QWORD *)(a8 + 8) = v24;
    *(_QWORD *)(a8 + 16) = v10;
    *(_QWORD *)(a8 + 24) = v12;
    *(_DWORD *)(a8 + 32) = v13;
  }
  return v19 ^ 1u;
}

+ (id)_alloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___NSData_0;
  return objc_msgSendSuper2(&v2, sel_allocWithZone_, 0);
}

+ (id)data
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithBytes:length:", 0, 0);
}

- (uint64_t)copyWithZone:()NSData
{
  uint64_t v1;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v1, *MEMORY[0x1E0C9AA10]);
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", objc_msgSend(a1, "bytes"), objc_msgSend(a1, "length"), 1, 0, 0);
}

- (void)getBytes:()NSData range:
{
  uint64_t v5;
  NSUInteger v6;
  unint64_t v11;
  NSString *v12;
  const __CFString *v13;
  NSUInteger v14;
  _QWORD *v15;
  NSUInteger v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  unint64_t v21;
  NSRange v22;
  NSRange v23;

  v6 = a5;
  if (*MEMORY[0x1E0C9AA80])
  {
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v5, *MEMORY[0x1E0C9AA10]);
    if (!v6)
      return;
  }
  else if (!a5)
  {
    return;
  }
  v11 = objc_msgSend(a1, "length");
  if (_CFExecutableLinkedOnOrAfter())
  {
    if (!__CFADD__(v6, a4))
    {
      if (a4 + v6 > v11)
      {
        v12 = _NSMethodExceptionProem((objc_class *)a1, a2);
        v22.location = a4;
        v22.length = v6;
        v20 = NSStringFromRange(v22);
        v21 = v11;
        v19 = v12;
        v13 = CFSTR("%@: range %@ exceeds data length %lu");
        goto LABEL_20;
      }
      goto LABEL_10;
    }
    v17 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v23.location = a4;
    v23.length = v6;
    v19 = v17;
    v20 = NSStringFromRange(v23);
    v13 = CFSTR("%@: range %@ causes integer overflow");
LABEL_20:
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v19, v20, v21);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v18, 0));
  }
  if (v11 <= a4)
  {
    v20 = (NSString *)a4;
    v21 = v11;
    v19 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v13 = CFSTR("%@: location %lu exceeds data length %lu");
    goto LABEL_20;
  }
  if (v6 >= v11 - a4)
    v6 = v11 - a4;
LABEL_10:
  v14 = objc_msgSend(a1, "bytes") + a4;
  if (v6 >= 0x80000)
  {
    v15 = (_QWORD *)MEMORY[0x1E0C85AD8];
    if (((*MEMORY[0x1E0C85AD8] - 1) & (v14 | a3)) != 0)
      goto LABEL_15;
    malloc_default_zone();
    if (malloc_zone_claimed_address())
      goto LABEL_15;
    v16 = v6 & -*v15;
    NSCopyMemoryPages((const void *)v14, (void *)a3, v16);
    v14 += v16;
    a3 += v16;
    v6 -= v16;
  }
  if (v6)
LABEL_15:
    memmove((void *)a3, (const void *)v14, v6);
}

- (uint64_t)_providesConcreteBacking
{
  return 0;
}

- (uint64_t)_allowsDirectEncoding
{
  return objc_msgSend(a1, "_canReplaceWithDispatchDataForXPCCoder") ^ 1;
}

- (dispatch_data_t)replacementObjectForCoder:()NSData
{
  NSUInteger v2;
  void *v3;

  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(a1, "_canReplaceWithDispatchDataForXPCCoder"))
    return (dispatch_data_t)a1;
  v2 = objc_msgSend(a1, "length");
  v3 = NSAllocateMemoryPages(v2);
  objc_msgSend(a1, "getBytes:length:", v3, v2);
  return dispatch_data_create(v3, v2, 0, (dispatch_block_t)*MEMORY[0x1E0C80CF8]);
}

- (BOOL)_canReplaceWithDispatchDataForXPCCoder
{
  return (objc_msgSend(a1, "_isDispatchData") & 1) == 0 && (unint64_t)objc_msgSend(a1, "length") > 0xFFF5;
}

- (uint64_t)_isDispatchData
{
  return 0;
}

- (void)getBytes:()NSData length:
{
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  NSUInteger v12;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA10]);
  v8 = objc_msgSend(a1, "length");
  if (v8 < a4)
    a4 = v8;
  v9 = objc_msgSend(a1, "bytes");
  v10 = (char *)v9;
  if (a4 < 0x80000)
  {
LABEL_9:
    if (!a4)
      return;
    goto LABEL_10;
  }
  v11 = (_QWORD *)MEMORY[0x1E0C85AD8];
  if (((*MEMORY[0x1E0C85AD8] - 1) & (v9 | a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      v12 = a4 & -*v11;
      NSCopyMemoryPages(v10, (void *)a3, v12);
      v10 += v12;
      a3 += v12;
      a4 -= v12;
      goto LABEL_9;
    }
  }
LABEL_10:
  memmove((void *)a3, v10, a4);
}

- (uint64_t)initWithContentsOfFile:()NSData options:maxLength:error:
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  NSError *v15;
  NSString *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil file argument"), _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0));
  }
  v19 = 0;
  v20[0] = 0;
  v18 = 0;
  v10 = pathifiedNSURL(a3, a6);
  if (v10
    && ((v11 = v10, a5 >= 0x7FFFFFFFFFFFFFFFLL) ? (v12 = 0x7FFFFFFFFFFFFFFFLL) : (v12 = a5),
        LOBYTE(v17) = 1,
        (objc_msgSend(MEMORY[0x1E0C99D50], "_readBytesFromPath:maxLength:bytes:length:didMap:options:reportProgress:error:", v10, v12, v20, &v19, &v18, a4, v17, a6) & 1) != 0))
  {
    if (v18)
      v13 = &__block_literal_global_2;
    else
      v13 = &__block_literal_global_6;
    result = -[objc_class initWithBytes:length:copy:deallocator:](a1, "initWithBytes:length:copy:deallocator:", v20[0], v19, 0, v13);
    if (a6)
    {
      if (!result)
      {
        v15 = _NSErrorWithFilePath(256, v11);
        result = 0;
        *a6 = v15;
      }
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (uint64_t)writeToFile:()NSData atomically:
{
  uint64_t v4;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA10]);
  if (_NSIsNSURL())
    return objc_msgSend(a1, "writeToURL:atomically:", a3, a4);
  else
    return objc_msgSend(MEMORY[0x1E0C99D50], "_writeDataToPath:data:options:reportProgress:error:", a3, a1, a4, 1, 0);
}

- (id)description
{
  unint64_t v2;
  unsigned __int8 *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  char v11;
  CFStringRef v12;
  UInt8 bytes[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((dyld_program_sdk_at_least() & 1) == 0)
    return (id)objc_msgSend(a1, "debugDescription");
  v2 = objc_msgSend(a1, "length");
  v3 = (unsigned __int8 *)objc_msgSend(a1, "bytes");
  v4 = (void *)objc_msgSend(objc_allocWithZone((Class)NSMutableString), "initWithCapacity:", 512);
  objc_msgSend(v4, "appendFormat:", CFSTR("{length = %lu, bytes = 0x"), v2);
  if (v2 < 0x19)
  {
    for (; v2; --v2)
    {
      v8 = *v3++;
      v7 = v8;
      if (v8 >= 0xA0)
        v9 = 87;
      else
        v9 = 48;
      bytes[0] = v9 + (v7 >> 4);
      v10 = v7 & 0xF;
      if (v10 >= 0xA)
        v11 = 87;
      else
        v11 = 48;
      bytes[1] = v11 + v10;
      v12 = CFStringCreateWithBytes(0, bytes, 2, 0x600u, 0);
      objc_msgSend(v4, "appendString:", v12);
      CFRelease(v12);
    }
  }
  else
  {
    v5 = -4;
    do
    {
      v5 += 4;
      append4Bytes(v4, &v3[v5]);
    }
    while (v5 < 0xC);
    objc_msgSend(v4, "appendString:", CFSTR("... "));
    v6 = v2 - 8;
    do
    {
      append4Bytes(v4, &v3[v6]);
      v6 += 4;
    }
    while (v6 < v2);
  }
  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

- (id)debugDescription
{
  uint64_t v1;
  unint64_t v3;
  unsigned __int8 *v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  unsigned int v20;
  char v21;
  CFStringRef v22;
  UInt8 bytes[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v1, *MEMORY[0x1E0C9AA10]);
  v3 = objc_msgSend(a1, "length");
  v4 = (unsigned __int8 *)objc_msgSend(a1, "bytes");
  v5 = v3 << ((v3 & 0x8000000000000000) == 0);
  v6 = v3 >> 2;
  v8 = __CFADD__(v5, v3 >> 2) || (v3 & 0x8000000000000000) != 0;
  if (v8)
    v6 = 0;
  v9 = v6 + v5;
  v10 = v9 > 0xFFFFFFFFFFFFFFEFLL || v8;
  v11 = v9 + 16;
  if (v10)
    v12 = -1;
  else
    v12 = v11;
  v13 = (void *)objc_msgSend(objc_allocWithZone((Class)NSMutableString), "initWithCapacity:", v12);
  objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length"), 0, CFSTR("<"));
  if (v3 < 5)
  {
    v14 = 2;
    if (v3)
    {
LABEL_23:
      v16 = v14 - 2;
      v14 += 2 * v3;
      while (1)
      {
        v16 += 2;
        if (v16 > v12 - 2)
          break;
        --v3;
        v18 = *v4++;
        v17 = v18;
        if (v18 >= 0xA0)
          v19 = 87;
        else
          v19 = 48;
        bytes[0] = v19 + (v17 >> 4);
        v20 = v17 & 0xF;
        if (v20 >= 0xA)
          v21 = 87;
        else
          v21 = 48;
        bytes[1] = v21 + v20;
        v22 = CFStringCreateWithBytes(0, bytes, 2, 0x600u, 0);
        objc_msgSend(v13, "appendString:", v22);
        CFRelease(v22);
        if (!v3)
          goto LABEL_32;
      }
    }
    else
    {
LABEL_32:
      if (v14 < v12)
        objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length"), 0, CFSTR(">"));
    }
    return v13;
  }
  else
  {
    v14 = 9 * ((v3 - 5) >> 2) + 11;
    v15 = -7;
    while (1)
    {
      v15 += 9;
      if (v15 > v12 - 9)
        return v13;
      v3 -= 4;
      append4Bytes(v13, v4);
      v4 += 4;
      if (v3 <= 4)
        goto LABEL_23;
    }
  }
}

- (uint64_t)_createDispatchData
{
  return _NSDataCreateDispatchDataFromData(a1, 1);
}

- (uint64_t)writeToFile:()NSData options:error:
{
  uint64_t v5;
  NSString *v12;

  if (!*MEMORY[0x1E0C9AA80])
  {
    if (a3)
      goto LABEL_3;
LABEL_8:
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil file argument"), _NSMethodExceptionProem(a1, a2));
    goto LABEL_10;
  }
  ((void (*)(objc_class *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v5, *MEMORY[0x1E0C9AA10]);
  if (!a3)
    goto LABEL_8;
LABEL_3:
  if ((~(_BYTE)a4 & 3) == 0)
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NSDataWritingWithoutOverwriting is not supported with NSDataWritingAtomic"), _NSMethodExceptionProem(a1, a2));
LABEL_10:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  if (_NSIsNSURL())
    return -[objc_class writeToURL:options:error:](a1, "writeToURL:options:error:", a3, a4, a5);
  else
    return objc_msgSend(MEMORY[0x1E0C99D50], "_writeDataToPath:data:options:reportProgress:error:", a3, a1, a4, 1, a5);
}

- (uint64_t)writeToURL:()NSData options:error:
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v13;
  NSString *v14;

  if (!*MEMORY[0x1E0C9AA80])
  {
    if (a3)
      goto LABEL_3;
LABEL_14:
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil URL argument"), _NSMethodExceptionProem(a1, a2));
    goto LABEL_16;
  }
  ((void (*)(objc_class *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v5, *MEMORY[0x1E0C9AA10]);
  if (!a3)
    goto LABEL_14;
LABEL_3:
  if ((~(_DWORD)a4 & 3) == 0)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NSDataWritingWithoutOverwriting is not supported with NSDataWritingAtomic"), _NSMethodExceptionProem(a1, a2));
LABEL_16:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
  }
  if (objc_msgSend(a3, "isFileURL"))
  {
    v11 = objc_msgSend(a3, "path");
    if (v11)
      return -[objc_class writeToFile:options:error:](a1, "writeToFile:options:error:", v11, a4, a5);
    if (a5)
    {
      v13 = 4;
      goto LABEL_11;
    }
  }
  else if (a5)
  {
    v13 = 518;
LABEL_11:
    *a5 = _NSErrorWithFilePath(v13, (uint64_t)a3);
  }
  return 0;
}

- (uint64_t)base64EncodedStringWithOptions:()NSData
{
  uint64_t v3;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA10]);
  return objc_msgSend(a1, "_base64EncodingAsString:withOptions:", 1, a3);
}

+ (id)dataWithContentsOfURL:()NSData options:maxLength:error:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfURL:options:maxLength:error:", a3, a4, a5, a6);
}

+ (id)dataWithContentsOfURL:()NSData
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfURL:", a3);
}

+ (id)dataWithContentsOfFile:()NSData
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfFile:", a3);
}

- (uint64_t)initWithContentsOfFile:()NSData
{
  uint64_t v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = pathifiedNSURL(a3, 0);
  if (v5
    && (v9 = 0,
        v10[0] = 0,
        v8 = 0,
        LOBYTE(v7) = 1,
        (objc_msgSend(MEMORY[0x1E0C99D50], "_readBytesFromPath:maxLength:bytes:length:didMap:options:reportProgress:error:", v5, 0x7FFFFFFFFFFFFFFFLL, v10, &v9, &v8, 0, v7, 0) & 1) != 0))
  {
    if (v8)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSData.m"), 917, CFSTR("Data should not have been mapped"));
    return objc_msgSend(a1, "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", v10[0], v9, 0, 1, 0);
  }
  else
  {

    return 0;
  }
}

- (uint64_t)initWithContentsOfURL:()NSData
{
  uint64_t v5;
  void *v7;
  uint64_t v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isFileURL"))
  {
    v5 = objc_msgSend(a3, "path");
    if (v5)
      return objc_msgSend(a1, "initWithContentsOfFile:", v5);
    goto LABEL_9;
  }
  if (!a3)
    return 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:cachePolicy:timeoutInterval:", a3, 1, 60.0);
  v9[0] = 0;
  v8 = objc_msgSend(MEMORY[0x1E0C92C58], "sendSynchronousRequest:returningResponse:error:", v7, v9, 0);

  if (v9[0] && v8)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(MEMORY[0x1E0C92C18], "isErrorStatusCode:", objc_msgSend(v9[0], "statusCode")) & 1) != 0)
    {
      goto LABEL_9;
    }
  }
  else if (!v8)
  {
LABEL_9:

    return 0;
  }
  return objc_msgSend(a1, "initWithData:", v8);
}

+ (id)dataWithContentsOfURL:()NSData options:error:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfURL:options:error:", a3, a4, a5);
}

- (uint64_t)initWithContentsOfURL:()NSData options:maxLength:error:
{
  uint64_t v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSError *v16;
  NSString *v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil URL argument"), _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0));
  }
  if (objc_msgSend(a3, "isFileURL"))
  {
    v11 = objc_msgSend(a3, "path");
    if (v11)
      return (uint64_t)-[objc_class initWithContentsOfFile:options:maxLength:error:](a1, "initWithContentsOfFile:options:maxLength:error:", v11, a4, a5, a6);

    if (!a6)
      return 0;
    v16 = _NSErrorWithFilePath(4, (uint64_t)a3);
    v15 = 0;
    goto LABEL_17;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:cachePolicy:timeoutInterval:", a3, 1, 60.0);
  v18[0] = 0;
  v14 = objc_msgSend(MEMORY[0x1E0C92C58], "sendSynchronousRequest:returningResponse:error:", v13, v18, 0);

  if (!v18[0] || !v14)
  {
    if (!v14)
      goto LABEL_9;
LABEL_12:
    v15 = -[objc_class initWithData:](a1, "initWithData:", v14);
    if (!a6)
      return v15;
    goto LABEL_13;
  }
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(MEMORY[0x1E0C92C18], "isErrorStatusCode:", objc_msgSend(v18[0], "statusCode")) & 1) == 0)
  {
    goto LABEL_12;
  }
LABEL_9:

  v15 = 0;
  if (!a6)
    return v15;
LABEL_13:
  if (!v15)
  {
    v16 = _NSErrorWithFilePath(256, (uint64_t)a3);
LABEL_17:
    *a6 = v16;
  }
  return v15;
}

- (uint64_t)initWithContentsOfURL:()NSData options:error:
{
  return objc_msgSend(a1, "initWithContentsOfURL:options:maxLength:error:", a3, a4, -1, a5);
}

+ (id)dataWithContentsOfFile:()NSData options:error:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfFile:options:error:", a3, a4, a5);
}

- (uint64_t)initWithContentsOfFile:()NSData options:error:
{
  return objc_msgSend(a1, "initWithContentsOfFile:options:maxLength:error:", a3, a4, -1, a5);
}

- (id)initWithCoder:()NSData
{
  void *v5;
  void *v6;
  const void *bytes_ptr;
  size_t length;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    return (id)objc_msgSend(a3, "decodeDataObject");
  }
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.xpcdata")))
  {
    v5 = (void *)objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812E8], CFSTR("NS.xpcdata"));
    if (v5)
    {
      v6 = v5;
      xpc_retain(v5);
      bytes_ptr = xpc_data_get_bytes_ptr(v6);
      length = xpc_data_get_length(v6);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __32__NSData_NSData__initWithCoder___block_invoke;
      v13[3] = &unk_1E0F4D128;
      v13[4] = v6;
      return (id)objc_msgSend(a1, "initWithBytes:length:copy:deallocator:", bytes_ptr, length, 0, v13);
    }
LABEL_12:

    return 0;
  }
  if (object_getClass(a3) == (Class)NSKeyedUnarchiver
    || objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.data")))
  {
    v10 = objc_msgSend(a3, "_decodePropertyListForKey:", CFSTR("NS.data"));
    if (_NSIsNSData())
      return (id)objc_msgSend(a1, "initWithData:", v10);
    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Decoded object is not a data")));
    goto LABEL_12;
  }
  v12 = 0;
  v11 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("NS.bytes"), &v12);
  if (!objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.zeroing")))
    return (id)objc_msgSend(a1, "initWithBytes:length:", v11, v12);

  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", v11, v12);
}

- (uint64_t)initWithBytesNoCopy:()NSData length:deallocator:
{
  return objc_msgSend(a1, "initWithBytes:length:copy:deallocator:", a3, a4, 0, a5);
}

- (uint64_t)initWithBase64EncodedString:()NSData options:
{
  NSString *v5;

  if (!a3)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil string argument"), _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0));
  }
  return -[objc_class _initWithBase64EncodedObject:options:](a1, "_initWithBase64EncodedObject:options:");
}

- (uint64_t)writeToURL:()NSData atomically:
{
  uint64_t v4;
  uint64_t v8;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA10]);
  if (objc_msgSend(a3, "isFileURL") && (v8 = objc_msgSend(a3, "path")) != 0)
    return objc_msgSend(a1, "writeToFile:atomically:", v8, a4);
  else
    return 0;
}

- (uint64_t)initWithBase64EncodedData:()NSData options:
{
  NSString *v5;

  if (!a3)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil data argument"), _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0));
  }
  return -[objc_class _initWithBase64EncodedObject:options:](a1, "_initWithBase64EncodedObject:options:");
}

+ (id)dataWithData:()NSData
{
  objc_class *v5;
  void *v6;

  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x1E0C99DF0];
    if ((Class)MEMORY[0x1E0C99D50] == a1 && _CFExecutableLinkedOnOrAfter())
    {
      v6 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
      return v6;
    }
    if (v5 == a1)
    {
      v6 = (void *)objc_msgSend(a3, "mutableCopyWithZone:", 0);
      return v6;
    }
  }
  v6 = (void *)objc_msgSend(objc_allocWithZone(a1), "initWithBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
  return v6;
}

- (uint64_t)base64EncodedDataWithOptions:()NSData
{
  uint64_t v3;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA10]);
  return objc_msgSend(a1, "_base64EncodingAsString:withOptions:", 0, a3);
}

- (void)length
{
  uint64_t v2;
  objc_class *v5;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(uint64_t, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v2, *MEMORY[0x1E0C9AA10]);
  v5 = NSClassFromString((NSString *)CFSTR("NSData"));
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (void)bytes
{
  uint64_t v2;
  objc_class *v5;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(uint64_t, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v2, *MEMORY[0x1E0C9AA10]);
  v5 = NSClassFromString((NSString *)CFSTR("NSData"));
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (id)_asciiDescription
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v2 = objc_msgSend(a1, "length");
  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(a1, "bytes");
  if (v2)
  {
    v5 = (unsigned __int8 *)v4;
    v6 = 0;
    v7 = 69;
    do
    {
      v9 = *v5++;
      LODWORD(v8) = v9;
      if ((v9 - 127) >= 0xFFFFFFA1)
        v8 = v8;
      else
        v8 = 32;
      objc_msgSend(v3, "appendFormat:", CFSTR("%c"), v8);
      if (!(v7 + 70 * (v6 / 0x46)))
        objc_msgSend(v3, "appendString:", CFSTR("\n"));
      ++v6;
      --v7;
      --v2;
    }
    while (v2);
  }
  return v3;
}

- (uint64_t)_copyWillRetain
{
  return 0;
}

- (void)getBytes:()NSData
{
  uint64_t v3;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  NSUInteger v9;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA10]);
  v6 = objc_msgSend(a1, "bytes");
  v7 = objc_msgSend(a1, "length");
  if (v7 < 0x80000)
  {
LABEL_7:
    if (!v7)
      return;
    goto LABEL_8;
  }
  v8 = (_QWORD *)MEMORY[0x1E0C85AD8];
  if (((*MEMORY[0x1E0C85AD8] - 1) & (v6 | a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      v9 = v7 & -*v8;
      NSCopyMemoryPages((const void *)v6, (void *)a3, v9);
      v6 += v9;
      a3 += v9;
      v7 -= v9;
      goto LABEL_7;
    }
  }
LABEL_8:
  memmove((void *)a3, (const void *)v6, v7);
}

- (uint64_t)_isCompact
{
  uint64_t v1;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v1, *MEMORY[0x1E0C9AA10]);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__NSData_NSData___isCompact__block_invoke;
  v5[3] = &unk_1E0F4D150;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)writeToFile:()NSData atomically:error:
{
  uint64_t v5;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v5, *MEMORY[0x1E0C9AA10]);
  return objc_msgSend(a1, "writeToFile:options:error:", a3, a4, a5);
}

+ (id)dataWithContentsOfMappedFile:()NSData
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfMappedFile:", a3);
}

- (void)initWithBytes:()NSData length:copy:deallocator:
{
  _NSRequestConcreteObject(a1, a2);
}

- (uint64_t)initWithContentsOfMappedFile:()NSData
{
  void *v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9[0] = 0;
  v7 = 0;
  LOBYTE(v6) = 1;
  if ((objc_msgSend(MEMORY[0x1E0C99D50], "_readBytesFromPath:maxLength:bytes:length:didMap:options:reportProgress:error:", a3, 0x7FFFFFFFFFFFFFFFLL, v9, &v8, &v7, 8, v6, 0) & 1) != 0)
  {
    if (v7)
      v4 = &__block_literal_global_2;
    else
      v4 = &__block_literal_global_6;
    return objc_msgSend(a1, "initWithBytes:length:copy:deallocator:", v9[0], v8, 0, v4);
  }
  else
  {

    return 0;
  }
}

- (uint64_t)initWithContentsOfMappedFile:()NSData error:
{
  return objc_msgSend(a1, "initWithContentsOfFile:options:error:", a3, 1, a4);
}

- (uint64_t)initWithContentsOfFile:()NSData error:
{
  return objc_msgSend(a1, "initWithContentsOfFile:options:error:", a3, 0, a4);
}

+ (_NSClrDat)_newZeroingDataWithBytes:()NSData length:
{
  return -[NSConcreteData initWithBytes:length:copy:deallocator:]([_NSClrDat alloc], "initWithBytes:length:copy:deallocator:", a3, a4, 1, 0);
}

+ (_NSClrDat)_newZeroingDataWithBytesNoCopy:()NSData length:deallocator:
{
  return -[NSConcreteData initWithBytes:length:copy:deallocator:]([_NSClrDat alloc], "initWithBytes:length:copy:deallocator:", a3, a4, 0, a5);
}

- (uint64_t)rangeOfData:()NSData options:range:
{
  uint64_t v6;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  char *v18;
  NSConcreteData *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  _QWORD *v23;
  NSString *v24;
  NSString *v25;
  unint64_t v26;
  NSString *v27;
  NSString *v28;
  _QWORD v29[2];
  NSRange v30;
  NSRange v31;

  v29[1] = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0C9AA80])
  {
    if (a3)
      goto LABEL_3;
LABEL_16:
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil data argument"), _NSMethodExceptionProem(a1, a2));
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_22;
  }
  ((void (*)(objc_class *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v6, *MEMORY[0x1E0C9AA10]);
  if (!a3)
    goto LABEL_16;
LABEL_3:
  v13 = -[objc_class length](a1, "length");
  if (__CFADD__(a6, a5))
  {
    v24 = _NSMethodExceptionProem(a1, a2);
    v30.location = a5;
    v30.length = a6;
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v24, NSStringFromRange(v30));
LABEL_21:
    v21 = v25;
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = (_QWORD *)MEMORY[0x1E0C99858];
LABEL_22:
    objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", *v23, v21, 0));
  }
  if (a5 + a6 > v13)
  {
    v26 = v13;
    v27 = _NSMethodExceptionProem(a1, a2);
    v28 = v27;
    if (a6)
    {
      v31.location = a5;
      v31.length = a6;
      v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ exceeds data length %lu"), v28, NSStringFromRange(v31), v26);
    }
    else
    {
      v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: location %lu exceeds data length %lu"), v27, a5, v26);
    }
    goto LABEL_21;
  }
  v14 = -[objc_class _isCompact](a1, "_isCompact");
  if ((_DWORD)v14)
  {
    result = _CFDataFindBytes();
    if (result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    MEMORY[0x1E0C80A78](v14);
    v17 = (char *)v29 - v16;
    v18 = (char *)v29 - v16;
    if (a6 >= 0x101)
      v18 = (char *)malloc_type_malloc(a6, 0x100004077774924uLL);
    -[objc_class getBytes:range:](a1, "getBytes:range:", v18, a5, a6);
    v19 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]([NSConcreteData alloc], "initWithBytesNoCopy:length:freeWhenDone:", v18, a6, v18 != v17);
    v20 = -[NSData rangeOfData:options:range:](v19, "rangeOfData:options:range:", a3, a4, 0, a6);

    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      return 0x7FFFFFFFFFFFFFFFLL;
    else
      return v20 + a5;
  }
  return result;
}

+ (BOOL)_base64DecodingAlwaysSucceedsForOptions:()NSData
{
  return a3 == 1 && _CFAppVersionCheck() != 0;
}

- (uint64_t)initWithBase64Encoding:()NSData
{
  NSString *v5;

  if (!a3)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil string argument"), _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0));
  }
  return -[objc_class _initWithBase64EncodedObject:options:](a1, "_initWithBase64EncodedObject:options:", a3, 268435457);
}

- (uint64_t)base64Encoding
{
  uint64_t v1;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v1, *MEMORY[0x1E0C9AA10]);
  return objc_msgSend(a1, "_base64EncodingAsString:withOptions:", 1, 0);
}

@end
