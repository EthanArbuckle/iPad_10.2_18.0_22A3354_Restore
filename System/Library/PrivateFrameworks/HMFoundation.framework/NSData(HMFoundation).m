@implementation NSData(HMFoundation)

- (id)shortDescription
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  if (qword_1ED013108 != -1)
    dispatch_once(&qword_1ED013108, &__block_literal_global_3);
  v2 = objc_msgSend(a1, "length");
  v3 = v2 - 8;
  if (v2 > 8)
  {
    v5 = v2;
    objc_msgSend(a1, "subdataWithRange:", 0, 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    v8 = 0;
    v9 = v5 - v7;
    if (v5 != v7)
    {
      if (v3 <= 8)
        v10 = 8;
      else
        v10 = v3;
      if (v9 >= 8)
        v11 = 8;
      else
        v11 = v5 - v7;
      objc_msgSend(a1, "subdataWithRange:", v10, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", _MergedGlobals_56);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v9 <= 8)
      v16 = &stru_1E3B39EC0;
    else
      v16 = CFSTR(" ... ");
    if (v8)
    {
      objc_msgSend(v8, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByTrimmingCharactersInSet:", _MergedGlobals_56);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<[%tu] %@%@%@>"), v5, v15, v16, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<[%tu] %@%@%@>"), v5, v14, v16, &stru_1E3B39EC0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(a1, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (NSString)shortDescription
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (uint64_t)hmf_isZeroed
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__NSData_HMFoundation__hmf_isZeroed__block_invoke;
  v3[3] = &unk_1E3B37DF8;
  v3[4] = &v4;
  objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (id)hmf_initWithHexadecimalString:()HMFoundation options:
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  void *v13;
  void *v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t i;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  _WORD v28[512];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if ((a4 & 1) != 0)
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E3B39EC0);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("0x")) & 1) != 0)
  {
    v9 = 2;
  }
  else if (objc_msgSend(v7, "hasPrefix:", CFSTR("0X")))
  {
    v9 = 2;
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v7, "length");
  v11 = v10;
  if ((v10 & 1) != 0)
  {
LABEL_36:
    v26 = 0;
  }
  else
  {
    v12 = (v10 - v9) >> 1;
    v13 = malloc_type_malloc(v12, 0xE54D36D4uLL);
    v14 = v13;
    if (v11 > v9)
    {
      v15 = v13;
      do
      {
        if (v11 - v9 >= 0x200)
          v16 = 512;
        else
          v16 = v11 - v9;
        objc_msgSend(v7, "getCharacters:range:", v28, v9, v16);
        if (v16)
        {
          for (i = 0; i < v16; i += 2)
          {
            v18 = (unsigned __int16)v28[i];
            v19 = v18 - 48;
            v20 = v18 - 65;
            if ((v18 - 97) >= 6)
              v21 = -1;
            else
              v21 = v18 - 87;
            v22 = v18 - 55;
            if (v20 > 5)
              v22 = v21;
            if (v19 <= 9)
              v22 = v19;
            v23 = (unsigned __int16)v28[i + 1];
            if ((v23 - 48) >= 0xA)
            {
              if ((v23 - 65) >= 6)
              {
                if ((v23 - 97) > 5 || (v24 = -87, (v22 & 0x80000000) != 0))
                {
LABEL_35:
                  free(v14);
                  goto LABEL_36;
                }
              }
              else
              {
                v24 = -55;
                if ((v22 & 0x80000000) != 0)
                  goto LABEL_35;
              }
            }
            else
            {
              v24 = -48;
              if ((v22 & 0x80000000) != 0)
                goto LABEL_35;
            }
            v25 = v24 + v23;
            if (v25 < 0)
              goto LABEL_35;
            *v15++ = v25 | (16 * v22);
          }
        }
        v9 += v16;
      }
      while (v9 < v11);
    }
    v26 = (void *)objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:", v14, v12, 1);
  }

  return v26;
}

- (__CFString)hmf_hexadecimalStringWithOptions:()HMFoundation
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  _BYTE *v8;
  _BYTE *v9;
  void *v10;
  __CFString *v12;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[3];
  _BYTE *v16;

  v5 = a3 & 1;
  v6 = objc_msgSend(a1, "length");
  if (v6)
  {
    v7 = 2 * (v6 + v5);
    v8 = malloc_type_malloc(v7, 0x9851D322uLL);
    v9 = v8;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = v8;
    if (v5)
    {
      *v8 = 48;
      v16 = v8 + 2;
      v8[1] = 120;
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__NSData_HMFoundation__hmf_hexadecimalStringWithOptions___block_invoke;
    v13[3] = &unk_1E3B37E20;
    v13[4] = v15;
    v14 = (a3 & 2) != 0;
    objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v13);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v9, v7, 1, 1);
    _Block_object_dispose(v15, 8);
    return (__CFString *)v10;
  }
  else
  {
    v12 = CFSTR("0x");
    if (!v5)
      v12 = &stru_1E3B39EC0;
    return v12;
  }
}

- (uint64_t)hmf_hexadecimalRepresentation
{
  return objc_msgSend(a1, "hmf_hexadecimalStringWithOptions:", 0);
}

@end
