@implementation NSSQLStoreMappingGenerator

- (NSSQLStoreMappingGenerator)init
{
  NSSQLStoreMappingGenerator *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSSQLStoreMappingGenerator;
  v2 = -[NSSQLStoreMappingGenerator init](&v4, sel_init);
  if (v2)
    v2->_names = (NSMutableDictionary *)objc_opt_new();
  return v2;
}

- (CFStringRef)newGeneratedPropertyName:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  UniChar *v8;
  uint64_t v9;
  int v10;
  __CFString *v11;
  const __CFAllocator *v12;
  void *v13;
  int v14;
  CFMutableStringRef MutableWithExternalCharactersNoCopy;
  const __CFAllocator *v16;
  uint64_t v17;
  CFStringRef Copy;
  CFNumberRef v19;
  int valuePtr;
  UniChar chars[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)objc_msgSend(a2, "name");
    v4 = objc_msgSend(v3, "length");
    v5 = v4 + 1;
    if ((unint64_t)(v4 + 1) >= 0x201)
      return (CFStringRef)(id)-[NSSQLStoreMappingGenerator uniqueNameWithBase:](a1, (void *)objc_msgSend(CFSTR("Z"), "stringByAppendingString:", objc_msgSend(v3, "uppercaseString")));
    v7 = v4;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    *(_OWORD *)chars = 0u;
    v22 = 0u;
    chars[0] = 90;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v3, "getCharacters:", &chars[1]);
    chars[v5] = 0;
    if (v5 >= 2)
    {
      v8 = &chars[1];
      v9 = v7;
      do
      {
        *v8 = __toupper(*v8);
        ++v8;
        --v9;
      }
      while (v9);
    }
    if (!v5)
      goto LABEL_11;
    v10 = chars[0] << 24;
    if (v10 < 0)
    {
      if (__maskrune(SLOBYTE(chars[0]), 0x100uLL))
        goto LABEL_11;
    }
    else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * SLOBYTE(chars[0]) + 60) & 0x100) != 0)
    {
LABEL_11:
      v11 = (__CFString *)CFStringCreateWithCharacters(0, chars, v5);
      v84 = 0u;
      v83 = 0u;
      v82 = 0u;
      v81 = 0u;
      v80 = 0u;
      v79 = 0u;
      v78 = 0u;
      v77 = 0u;
      v76 = 0u;
      v75 = 0u;
      v74 = 0u;
      v73 = 0u;
      v72 = 0u;
      v71 = 0u;
      v70 = 0u;
      v69 = 0u;
      v68 = 0u;
      v67 = 0u;
      v66 = 0u;
      v65 = 0u;
      v64 = 0u;
      v63 = 0u;
      v62 = 0u;
      v61 = 0u;
      v60 = 0u;
      v59 = 0u;
      v58 = 0u;
      v57 = 0u;
      v56 = 0u;
      v55 = 0u;
      v54 = 0u;
      v53 = 0u;
      v12 = _PFStackAllocatorCreate((unint64_t *)&v53, 1024);
      v13 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v11);
      if (v13)
      {
        v14 = objc_msgSend(v13, "unsignedIntValue");
        MutableWithExternalCharactersNoCopy = 0;
        v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
        v17 = (v14 + 1);
        do
        {
          if (*((_QWORD *)&v54 + 1))
          {
            if (MutableWithExternalCharactersNoCopy)
              CFRelease(MutableWithExternalCharactersNoCopy);
          }
          else
          {
            *((_QWORD *)&v53 + 1) = v53;
          }
          MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(v12, chars, v5, 512, v16);
          valuePtr = v17;
          CFStringAppendFormat(MutableWithExternalCharactersNoCopy, 0, CFSTR("%d"), v17);
          v17 = (v17 + 1);
        }
        while (objc_msgSend(*(id *)(a1 + 8), "objectForKey:", MutableWithExternalCharactersNoCopy));
        Copy = CFStringCreateCopy(0, MutableWithExternalCharactersNoCopy);
      }
      else
      {
        valuePtr = 0;
        Copy = v11;
        MutableWithExternalCharactersNoCopy = 0;
      }
      v19 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v19, v11);

      if (MutableWithExternalCharactersNoCopy)
      {
        if (*((_QWORD *)&v54 + 1))
          CFRelease(MutableWithExternalCharactersNoCopy);
      }
      return Copy;
    }
    __memmove_chk();
    chars[0] = (HIBYTE(v10)
                               - 48
                               - 26
                               * ((unsigned __int16)((v10 >> 24) - 48) / 0x1Au
                                + ((((20165 * ((v10 >> 24) - 48)) >> 16) & 0x8000u) != 0))
                               + 65);
    v5 = v7 + 2;
    chars[v7 + 2] = 0;
    goto LABEL_11;
  }
  return 0;
}

- (uint64_t)generateTableName:(int)a3 isAncillary:
{
  void *v4;
  const __CFString *v5;

  if (result)
  {
    do
    {
      v4 = a2;
      a2 = (void *)objc_msgSend(a2, "superentity");
    }
    while (a2);
    if (a3)
      v5 = CFSTR("A");
    else
      v5 = CFSTR("Z");
    return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v5, objc_msgSend((id)objc_msgSend(v4, "name"), "uppercaseString"));
  }
  return result;
}

+ (NSSQLStoreMappingGenerator)defaultMappingGenerator
{
  NSSQLStoreMappingGenerator *result;

  objc_opt_self();
  result = (NSSQLStoreMappingGenerator *)_NSSQLDefaultMappingGenerator;
  if (!_NSSQLDefaultMappingGenerator)
  {
    result = objc_alloc_init(NSSQLStoreMappingGenerator);
    _NSSQLDefaultMappingGenerator = (uint64_t)result;
  }
  return result;
}

- (uint64_t)uniqueNameWithBase:(uint64_t)a1
{
  void *v2;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CFNumberRef v9;
  int valuePtr;

  if (!a1)
    return 0;
  v2 = a2;
  if (objc_msgSend(a2, "length"))
  {
    v4 = objc_msgSend(v2, "characterAtIndex:", 0);
    v5 = v4 << 24;
    if (v4 << 24 < 0)
    {
      if (__maskrune((char)v4, 0x100uLL))
        goto LABEL_6;
      goto LABEL_5;
    }
    if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * (char)v4 + 60) & 0x100) == 0)
LABEL_5:
      v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%@"), (unsigned __int16)((__int16)((v5 >> 24) - 48) % 26 + 65), objc_msgSend(v2, "substringFromIndex:", 1));
  }
LABEL_6:
  v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v2);
  if (v6)
  {
    LODWORD(v7) = objc_msgSend(v6, "unsignedIntValue");
    do
    {
      v7 = (v7 + 1);
      v8 = objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("%d"), v7);
    }
    while (objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v8));
  }
  else
  {
    LODWORD(v7) = 0;
    v8 = (uint64_t)v2;
  }
  valuePtr = v7;
  v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v9, v2);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLStoreMappingGenerator;
  -[NSSQLStoreMappingGenerator dealloc](&v3, sel_dealloc);
}

@end
