@implementation ECEmailAddressParser

+ (BOOL)parseEmailAddressString:(id)a3 displayName:(id *)a4 localPart:(id *)a5 domain:(id *)a6 groupList:(id *)a7
{
  id v11;
  __int128 v12;
  __CFString *v13;
  const char *CStringPtr;
  BOOL v15;
  char v16;
  char v17;
  char v18;
  unint64_t v20;
  __CFString *v21;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD v25[8];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;

  v11 = a3;
  if (objc_msgSend(v11, "length"))
  {
    v29 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v27 = v12;
    v28 = v12;
    v25[7] = v12;
    v26 = v12;
    v25[6] = v12;
    v25[4] = v12;
    v25[5] = v12;
    v25[2] = v12;
    v25[3] = v12;
    v25[0] = v12;
    v25[1] = v12;
    v20 = 0xAAAAAAAAAAAA0000;
    v13 = (__CFString *)v11;
    v21 = v13;
    v22 = v25;
    v23 = 0;
    v24 = -[__CFString length](v13, "length");
    *(_QWORD *)&v26 = v13;
    *((_QWORD *)&v27 + 1) = 0;
    *(_QWORD *)&v28 = v24;
    *((_QWORD *)&v26 + 1) = CFStringGetCharactersPtr(v13);
    if (*((_QWORD *)&v26 + 1))
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(v13, 0x600u);
    *((_QWORD *)&v28 + 1) = 0;
    v29 = 0;
    *(_QWORD *)&v27 = CStringPtr;
    v16 = _parseAddress(&v20, a4, a5, a6, a7);
    if (v23 == v24)
      v17 = v16;
    else
      v17 = 0;
    if ((v17 & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      v23 = 0;
      LOWORD(v20) = 257;
      v18 = _parseAddress(&v20, a4, a5, a6, a7);
      if (v23 == v24)
        v15 = v18;
      else
        v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)_validateString:(id)a3 withFunction:(void *)a4
{
  id v5;
  __int128 v6;
  __CFString *v7;
  const char *CStringPtr;
  char v9;
  BOOL v10;
  unint64_t v12;
  __CFString *v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[8];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;

  v5 = a3;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19 = v6;
  v20 = v6;
  v17[7] = v6;
  v18 = v6;
  v17[6] = v6;
  v17[4] = v6;
  v17[5] = v6;
  v17[2] = v6;
  v17[3] = v6;
  v17[0] = v6;
  v17[1] = v6;
  v12 = 0xAAAAAAAAAAAA0000;
  v7 = (__CFString *)v5;
  v13 = v7;
  v14 = v17;
  v15 = 0;
  v16 = -[__CFString length](v7, "length");
  *(_QWORD *)&v18 = v7;
  *((_QWORD *)&v19 + 1) = 0;
  *(_QWORD *)&v20 = v16;
  *((_QWORD *)&v18 + 1) = CFStringGetCharactersPtr(v7);
  if (*((_QWORD *)&v18 + 1))
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  *((_QWORD *)&v20 + 1) = 0;
  v21 = 0;
  *(_QWORD *)&v19 = CStringPtr;
  v9 = ((uint64_t (*)(unint64_t *, _QWORD))a4)(&v12, 0);
  if (v15 == v16)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

+ (BOOL)validateLocalPart:(id)a3
{
  return objc_msgSend(a1, "_validateString:withFunction:", a3, _parseLocalPart);
}

+ (BOOL)validateDomain:(id)a3
{
  return objc_msgSend(a1, "_validateString:withFunction:", a3, _parseDomain);
}

+ (BOOL)validateDisplayName:(id)a3
{
  return objc_msgSend(a1, "_validateString:withFunction:", a3, _parseDisplayName);
}

+ (BOOL)parseString:(id)a3 emailAddressList:(id *)a4
{
  id v5;
  __int128 v6;
  __CFString *v7;
  const char *CStringPtr;
  BOOL v9;
  char v10;
  char v11;
  char v12;
  unint64_t v14;
  __CFString *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v23 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v21 = v6;
    v22 = v6;
    v19[7] = v6;
    v20 = v6;
    v19[6] = v6;
    v19[4] = v6;
    v19[5] = v6;
    v19[2] = v6;
    v19[3] = v6;
    v19[0] = v6;
    v19[1] = v6;
    v14 = 0xAAAAAAAAAAAA0100;
    v7 = (__CFString *)v5;
    v15 = v7;
    v16 = v19;
    v17 = 0;
    v18 = -[__CFString length](v7, "length");
    *(_QWORD *)&v20 = v7;
    *((_QWORD *)&v21 + 1) = 0;
    *(_QWORD *)&v22 = v18;
    *((_QWORD *)&v20 + 1) = CFStringGetCharactersPtr(v7);
    if (*((_QWORD *)&v20 + 1))
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    *((_QWORD *)&v22 + 1) = 0;
    v23 = 0;
    *(_QWORD *)&v21 = CStringPtr;
    v10 = _parseElementList((uint64_t)&v14, 1, _parseAddressAppendingToList, a4);
    if (v17 == v18)
      v11 = v10;
    else
      v11 = 0;
    v9 = 1;
    if ((v11 & 1) == 0)
    {
      v17 = 0;
      LOBYTE(v14) = 1;
      v12 = _parseElementList((uint64_t)&v14, BYTE1(v14), _parseAddressAppendingToList, a4);
      if (v17 == v18)
        v9 = v12;
      else
        v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
