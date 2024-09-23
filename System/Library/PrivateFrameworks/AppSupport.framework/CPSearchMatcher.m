@implementation CPSearchMatcher

- (BOOL)matchesASCIIString:(const char *)a3 matchType:(int)a4
{
  const void *v7;
  NSUInteger v8;
  unsigned int (*v9)(const char *, const void *, NSUInteger);
  uint64_t (*v10)(const char *, uint64_t);
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  int v19;
  const char *v20;
  const char *v21;
  char v22;
  __darwin_ct_rune_t v23;
  unsigned int v24;
  _BOOL4 v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  BOOL v31;
  int v32;
  int v34;
  int v35;
  NSArray *obj;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t (*v41)(const char *, uint64_t);
  unsigned int (*v42)(const char *, const void *, NSUInteger);
  _QWORD v43[2];
  uint64_t (*v44)(uint64_t, uint64_t, unint64_t, char *);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  unsigned int (*v48)(const char *, const void *, NSUInteger);
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = -[NSData bytes](self->_wholeSearchStringData, "bytes");
  v8 = -[NSData length](self->_wholeSearchStringData, "length");
  if ((self->_options & 2) != 0)
    v9 = (unsigned int (*)(const char *, const void *, NSUInteger))MEMORY[0x1E0C85590];
  else
    v9 = (unsigned int (*)(const char *, const void *, NSUInteger))MEMORY[0x1E0C855A8];
  v42 = v9;
  v10 = (uint64_t (*)(const char *, uint64_t))MEMORY[0x1E0C85508];
  if ((self->_options & 2) == 0)
    v10 = (uint64_t (*)(const char *, uint64_t))MEMORY[0x1E0C85610];
  v41 = v10;
  v39 = a4;
  if (a4 == 4)
  {
    v11 = v8;
    if (strlen(a3) == v8)
    {
      LOBYTE(v12) = v42(a3, v7, v11) == 0;
      return v12;
    }
LABEL_49:
    LOBYTE(v12) = 0;
    return v12;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = self->_asciiComponents;
  v40 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (!v40)
    goto LABEL_49;
  v38 = *(_QWORD *)v56;
LABEL_11:
  v13 = 0;
LABEL_12:
  if (*(_QWORD *)v56 != v38)
    objc_enumerationMutation(obj);
  v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v13);
  v15 = objc_msgSend(v14, "bytes");
  v12 = v41(a3, v15);
  if (v12)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v16 = objc_msgSend(v14, "length");
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v44 = __48__CPSearchMatcher_matchesASCIIString_matchType___block_invoke;
    v45 = &unk_1E2881950;
    v50 = v39;
    v48 = v42;
    v49 = v15;
    v46 = &v51;
    v47 = v16 - 1;
    v59 = 0;
    if (!a3)
      goto LABEL_45;
    v17 = *a3;
    if (!*a3)
      goto LABEL_45;
    v18 = 0;
    v19 = 1;
    v20 = a3;
    v21 = a3;
    v22 = 1;
    while (1)
    {
      v23 = v17;
      if (v17 < 0)
      {
        v25 = __maskrune(v17, 0x8000uLL) == 0;
        v26 = __maskrune(v23, 0x1000uLL) != 0;
        if (__maskrune(v23, 0x4000uLL))
        {
LABEL_22:
          v28 = v19 & !v25;
          goto LABEL_25;
        }
        v27 = __maskrune(v23, 0x2000uLL);
      }
      else
      {
        v24 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v17 + 60);
        v25 = (v24 & 0x8000) == 0;
        v26 = (v24 >> 12) & 1;
        if ((v24 & 0x4000) != 0)
          goto LABEL_22;
        v27 = v24 & 0x2000;
      }
      v28 = v19 & !v25;
      if (!v27)
      {
        v29 = 0;
        v30 = 1;
        v19 = v26;
        goto LABEL_26;
      }
LABEL_25:
      v29 = 1;
      v19 = v26;
      v30 = v28;
LABEL_26:
      v31 = (v22 & 1) == 0;
      if ((v22 & 1) != 0)
        v32 = v30;
      else
        v32 = v28;
      if (v31)
        v28 |= v29;
      if (v28 == 1 && v18 != 0)
      {
        v44((uint64_t)v43, v18, (unint64_t)&v20[-v18], &v59);
        if (v59)
          goto LABEL_45;
        v18 = 0;
      }
      if (v32)
        v18 = (uint64_t)v21;
      v34 = *(unsigned __int8 *)++v21;
      v17 = v34;
      ++v20;
      v22 = v29;
      if (!v34)
      {
        if (v18)
          v44((uint64_t)v43, v18, (unint64_t)&v20[-v18], &v59);
LABEL_45:
        v35 = *((unsigned __int8 *)v52 + 24);
        _Block_object_dispose(&v51, 8);
        if (!v35)
          goto LABEL_49;
        if (++v13 == v40)
        {
          v40 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
          LOBYTE(v12) = 1;
          if (!v40)
            return v12;
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
  }
  return v12;
}

uint64_t __48__CPSearchMatcher_matchesASCIIString_matchType___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  unint64_t v6;

  v5 = result;
  v6 = *(_QWORD *)(result + 40);
  if (*(_DWORD *)(result + 64) == 6)
  {
    if (v6 != a3)
      return result;
  }
  else if (v6 > a3)
  {
    return result;
  }
  result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 48))(a2, *(_QWORD *)(result + 56));
  if (!(_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)matchesUTF8String:(const char *)a3
{
  return -[CPSearchMatcher matchesUTF8String:matchType:matchOptions:](self, "matchesUTF8String:matchType:matchOptions:", a3, 5, 1);
}

- (BOOL)matchesUTF8String:(const char *)a3 matchType:(int)a4 matchOptions:(int)a5
{
  uint64_t v9;
  char v10;
  const char *v11;
  int v12;
  int v13;
  int v14;
  NSData *wholeSearchStringData;
  BOOL v17;
  NSArray *components;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((a4 & 0xFFFFFFFD) == 4 || a4 == 5)
    v9 = a4;
  else
    v9 = 5;
  if (!a3 || !self->_asciiComponents)
    goto LABEL_14;
  v10 = 0;
  v11 = a3;
  do
  {
    v13 = *v11++;
    v12 = v13;
    if (!(_BYTE)v13)
      v10 = 1;
  }
  while (v12 > 0);
  if ((v10 & 1) != 0)
    return -[CPSearchMatcher matchesASCIIString:matchType:](self, "matchesASCIIString:matchType:", a3, v9);
LABEL_14:
  if ((_DWORD)v9 == 4)
  {
    v14 = -[NSData length](self->_wholeSearchStringData, "length");
    wholeSearchStringData = self->_wholeSearchStringData;
    if (wholeSearchStringData)
      return _ICUSQLiteMatch(a3, (char *)-[NSData bytes](wholeSearchStringData, "bytes"), v14, 4, (uint64_t)-[NSData bytes](self->_context, "bytes"));
    return 0;
  }
  else
  {
    v17 = -[NSArray count](self->_components, "count") != 0;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    components = self->_components;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](components, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(components);
          v23 = _ICUSQLiteMatch(a3, (char *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "bytes"), objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "length"), v9, (uint64_t)-[NSData bytes](self->_context, "bytes"));
          v17 = v23;
          if (a5)
          {
            if (!v23)
              return a5 == 0;
          }
          else if ((v23 & 1) != 0)
          {
            return a5 == 0;
          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](components, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v20)
          continue;
        break;
      }
    }
  }
  return v17;
}

- (BOOL)matchesUTF8String:(const char *)a3 matchType:(int)a4
{
  return -[CPSearchMatcher matchesUTF8String:matchType:matchOptions:](self, "matchesUTF8String:matchType:matchOptions:", a3, *(_QWORD *)&a4, 1);
}

- (BOOL)matches:(id)a3
{
  return -[CPSearchMatcher matchesUTF8String:](self, "matchesUTF8String:", objc_msgSend(a3, "UTF8String"));
}

- (BOOL)matches:(id)a3 matchType:(int)a4
{
  return -[CPSearchMatcher matchesUTF8String:matchType:](self, "matchesUTF8String:matchType:", objc_msgSend(a3, "UTF8String"), *(_QWORD *)&a4);
}

- (CPSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4 andOptions:(int)a5
{
  uint64_t v5;
  CPSearchMatcher *v8;
  CPSearchMatcher *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const void *inited;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = *(_QWORD *)&a5;
  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)CPSearchMatcher;
  v8 = -[CPSearchMatcher init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_options = v5;
    v8->_components = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9->_wholeSearchStringData = (NSData *)(id)objc_msgSend(a3, "dataUsingEncoding:", 4);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = (void *)objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          -[NSArray addObject:](v9->_components, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dataUsingEncoding:", 4));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }
    inited = (const void *)initICUSearchContext(objc_msgSend(a4, "UTF8String"), v5);
    v9->_context = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", inited, malloc_size(inited), 0);
  }
  return v9;
}

- (CPSearchMatcher)initWithSearchString:(id)a3
{
  return -[CPSearchMatcher initWithSearchString:andLocale:andOptions:](self, "initWithSearchString:andLocale:andOptions:", a3, 0, 3);
}

- (CPSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4
{
  return -[CPSearchMatcher initWithSearchString:andLocale:andOptions:](self, "initWithSearchString:andLocale:andOptions:", a3, a4, 3);
}

- (CPSearchMatcher)initWithSearchString:(id)a3 options:(int)a4
{
  return -[CPSearchMatcher initWithSearchString:andLocale:andOptions:](self, "initWithSearchString:andLocale:andOptions:", a3, 0, *(_QWORD *)&a4);
}

- (void)dealloc
{
  objc_super v3;

  freeICUSearchContext(-[NSData bytes](self->_context, "bytes"));

  v3.receiver = self;
  v3.super_class = (Class)CPSearchMatcher;
  -[CPSearchMatcher dealloc](&v3, sel_dealloc);
}

@end
