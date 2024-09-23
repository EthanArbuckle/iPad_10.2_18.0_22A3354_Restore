@implementation NSString(IMAPNameEncoding)

- (__CFString)mf_encodedIMAPMailboxName
{
  __CFString *v2;
  uint64_t v3;
  __int128 v4;
  const char *CStringPtr;
  id v6;
  uint64_t v7;
  uint64_t v8;
  UniChar *v9;
  uint64_t v10;
  UniChar v11;
  int IsCharacterMember;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  UniChar v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  CFStringRef v26;
  uint64_t v28;
  __CFString *v29;
  char v30[4];
  unsigned __int16 v31;
  UniChar buffer[8];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __CFString *v40;
  const UniChar *CharactersPtr;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CFRange v47;
  CFRange v48;
  CFRange v49;

  v2 = (__CFString *)-[__CFString copy](a1, "copy");
  v3 = -[__CFString length](a1, "length");
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38 = v4;
  v39 = v4;
  v36 = v4;
  v37 = v4;
  v34 = v4;
  v35 = v4;
  *(_OWORD *)buffer = v4;
  v33 = v4;
  if (!mf_encodedIMAPMailboxName_passThroughSet)
  {
    v47.location = 32;
    v47.length = 94;
    mf_encodedIMAPMailboxName_passThroughSet = (uint64_t)CFCharacterSetCreateWithCharactersInRange(0, v47);
  }
  v40 = a1;
  v43 = 0;
  v44 = v3;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v42 = CStringPtr;
  v45 = 0;
  v46 = 0;
  if (v3 < 1)
  {
    v6 = 0;
    goto LABEL_61;
  }
  v29 = v2;
  v6 = 0;
  v7 = 0;
  do
  {
    v31 = -21846;
    if (v7 < 0 || (v8 = v44, v44 <= v7))
    {
      v11 = 0;
    }
    else
    {
      v9 = (UniChar *)CharactersPtr;
      if (CharactersPtr)
      {
        v10 = v43 + v7;
      }
      else
      {
        if (v42)
        {
          v11 = v42[v43 + v7];
          goto LABEL_14;
        }
        if (v46 <= v7 || (v24 = v45, v45 > v7))
        {
          v25 = v7 - 4;
          if ((unint64_t)v7 < 4)
            v25 = 0;
          if (v25 + 64 < v44)
            v8 = v25 + 64;
          v45 = v25;
          v46 = v8;
          v49.location = v43 + v25;
          v49.length = v8 - v25;
          CFStringGetCharacters(v40, v49, buffer);
          v24 = v45;
        }
        v10 = v7 - v24;
        v9 = buffer;
      }
      v11 = v9[v10];
    }
LABEL_14:
    v31 = v11;
    IsCharacterMember = CFCharacterSetIsCharacterMember((CFCharacterSetRef)mf_encodedIMAPMailboxName_passThroughSet, v11);
    v13 = v31;
    if (IsCharacterMember && v31 != 38)
    {
      if (v6)
      {
        v30[0] = v31;
        objc_msgSend(v6, "appendBytes:length:", v30, 1);
      }
      goto LABEL_24;
    }
    if (!v6)
    {
      v14 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithCapacity:", -[__CFString length](a1, "length"));
      v15 = v14;
      if (v7 >= 1)
      {
        objc_msgSend(v14, "setLength:", v7);
        objc_msgSend(objc_retainAutorelease(v15), "mutableBytes");
        v28 = 0;
        MFStringGetBytes();
      }
      v13 = v31;
      v6 = v15;
    }
    if (v13 == 38)
    {
      strcpy(v30, "&-");
      objc_msgSend(v6, "appendBytes:length:", v30, 2);
LABEL_24:
      ++v7;
      continue;
    }
    v16 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 64);
    v17 = v31;
    v18 = v7 + 1;
    do
    {
      v7 = v18;
      v31 = bswap32(v17) >> 16;
      objc_msgSend(v16, "appendBytes:length:", &v31, 2, v28);
      if (v7 >= v3)
        break;
      if (v7 - 1 < -1 || (v19 = v44, v44 <= v7))
      {
        v20 = 0;
      }
      else if (CharactersPtr)
      {
        v20 = CharactersPtr[v7 + v43];
      }
      else if (v42)
      {
        v20 = v42[v43 + v7];
      }
      else
      {
        if (v46 <= v7 || (v21 = v45, v45 > v7))
        {
          v22 = v7 - 4;
          if ((unint64_t)v7 < 4)
            v22 = 0;
          if (v22 + 64 < v44)
            v19 = v22 + 64;
          v45 = v22;
          v46 = v19;
          v48.location = v43 + v22;
          v48.length = v19 - v22;
          CFStringGetCharacters(v40, v48, buffer);
          v21 = v45;
        }
        v20 = buffer[v7 - v21];
      }
      v31 = v20;
      if (CFCharacterSetIsCharacterMember((CFCharacterSetRef)mf_encodedIMAPMailboxName_passThroughSet, v20))
        break;
      v17 = v31;
      v18 = v7 + 1;
    }
    while (v31 != 38);
    objc_msgSend(v6, "appendBytes:length:", "&", 1);
    objc_msgSend(v16, "mf_encodeModifiedBase64");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendData:", v23);

    objc_msgSend(v6, "appendBytes:length:", "-", 1);
  }
  while (v7 < v3);
  v2 = v29;
  if (v6)
  {
    v6 = objc_retainAutorelease(v6);
    v26 = CFStringCreateWithBytes(0, (const UInt8 *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 0x600u, 0);

    v2 = (__CFString *)v26;
  }
LABEL_61:

  return v2;
}

- (id)mf_decodedIMAPMailboxName
{
  void *v2;
  CFIndex v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  CFIndex v14;
  id v15;
  __CFCharacterSet *MutableCopy;
  const __CFCharacterSet *Predefined;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  void *v28;
  UniChar *v29;
  BOOL v30;
  CFIndex v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v42;
  __CFString *theString;
  __int16 v44;
  CFRange v45;
  CFRange v46;
  CFRange v47;
  CFRange v48;
  CFRange v49;

  v2 = (void *)-[__CFString copy](a1, "copy");
  v3 = -[__CFString length](a1, "length");
  theString = a1;
  v4 = -[__CFString rangeOfString:options:range:](a1, "rangeOfString:options:range:", CFSTR("-"), 0, 0, v3);
  v6 = v5;
  if (!v5)
    goto LABEL_33;
  v7 = v4;
  v8 = 0;
  v9 = 0;
  v10 = a1;
  v42 = v2;
  do
  {
    v11 = -[__CFString rangeOfString:options:range:](v10, "rangeOfString:options:range:", CFSTR("&"), 4, v9, v7 - v9);
    if (!v12)
    {
LABEL_10:
      if (v8)
      {
        v10 = theString;
        if (v7 + v6 <= v9)
        {
          v15 = 0;
        }
        else
        {
          v18 = objc_msgSend(v8, "length");
          objc_msgSend(v8, "setLength:", v18 + 2 * (v7 + v6 - v9));
          v19 = objc_retainAutorelease(v8);
          v20 = objc_msgSend(v19, "mutableBytes");
          v45.location = v9;
          v45.length = v7 + v6 - v9;
          CFStringGetCharacters(theString, v45, (UniChar *)(v20 + v18));
          v15 = 0;
          v8 = v19;
        }
        v2 = v42;
      }
      else
      {
        v15 = 0;
        v2 = v42;
        v10 = theString;
      }
      goto LABEL_28;
    }
    v13 = v11;
    v14 = v7 - (v11 + v12);
    if (v7 == v11 + v12)
    {
      v44 = 38;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v44, 2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_10;
    }
    else
    {
      MutableCopy = (__CFCharacterSet *)mf_decodedIMAPMailboxName_invalidModifiedBase64Set;
      if (!mf_decodedIMAPMailboxName_invalidModifiedBase64Set)
      {
        Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
        CFCharacterSetAddCharactersInString(MutableCopy, CFSTR("+,"));
        CFCharacterSetInvert(MutableCopy);
        mf_decodedIMAPMailboxName_invalidModifiedBase64Set = (uint64_t)MutableCopy;
      }
      v49.location = v13 + 1;
      v49.length = v14;
      if (CFStringFindCharacterFromSet(theString, MutableCopy, v49, 0, 0))
        goto LABEL_10;
      v21 = objc_retainAutorelease((id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithLength:", v14));
      objc_msgSend(v21, "mutableBytes");
      MFStringGetBytes();
      objc_msgSend(v21, "mf_decodeModifiedBase64", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "mutableCopyWithZone:", 0);

      v15 = objc_retainAutorelease(v23);
      v24 = (char *)objc_msgSend(v15, "mutableBytes");
      v25 = objc_msgSend(v15, "length");
      if ((uint64_t)(v25 & 0xFFFFFFFFFFFFFFFELL) >= 1)
      {
        v26 = &v24[v25 & 0xFFFFFFFFFFFFFFFELL];
        do
        {
          *(_WORD *)v24 = bswap32(*(unsigned __int16 *)v24) >> 16;
          v24 += 2;
        }
        while (v24 < v26);
      }

      if (!v15)
        goto LABEL_10;
    }
    v10 = theString;
    if (!v8)
    {
      v27 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 2 * -[__CFString length](theString, "length"));
      v28 = v27;
      if (v9)
      {
        objc_msgSend(v27, "setLength:", 2 * v9);
        v8 = objc_retainAutorelease(v28);
        v29 = (UniChar *)objc_msgSend(v8, "mutableBytes");
        v46.location = 0;
        v46.length = v9;
        CFStringGetCharacters(theString, v46, v29);
      }
      else
      {
        v8 = v27;
      }
    }
    v30 = v13 > v9;
    v31 = v13 - v9;
    if (v30)
    {
      v32 = objc_msgSend(v8, "length");
      objc_msgSend(v8, "setLength:", v32 + 2 * v31);
      v33 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
      v47.location = v9;
      v47.length = v31;
      CFStringGetCharacters(theString, v47, (UniChar *)(v33 + v32));
    }
    v2 = v42;
    objc_msgSend(v8, "appendData:", v15);
LABEL_28:
    v34 = v3 + v9;
    v9 = v7 + v6;
    v3 = v34 - (v7 + v6);
    v7 = -[__CFString rangeOfString:options:range:](v10, "rangeOfString:options:range:", CFSTR("-"), 0, v7 + v6, v3);
    v6 = v35;

  }
  while (v6);
  if (!v8)
  {
LABEL_33:
    v39 = 0;
    goto LABEL_34;
  }
  if (v3)
  {
    v36 = objc_msgSend(v8, "length");
    objc_msgSend(v8, "setLength:", v36 + 2 * v3);
    v37 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
    v48.location = v9;
    v48.length = v3;
    CFStringGetCharacters(v10, v48, (UniChar *)(v37 + v36));
  }
  v38 = objc_alloc(MEMORY[0x1E0CB3940]);
  v39 = objc_retainAutorelease(v8);
  v40 = objc_msgSend(v38, "initWithCharacters:length:", objc_msgSend(v39, "bytes"), (unint64_t)objc_msgSend(v39, "length") >> 1);

  v2 = (void *)v40;
LABEL_34:

  return v2;
}

@end
