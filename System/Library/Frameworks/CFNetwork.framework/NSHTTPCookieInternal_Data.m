@implementation NSHTTPCookieInternal_Data

- (HTTPCookie)_inner
{
  return (HTTPCookie *)self->_fromData;
}

- (void)dealloc
{
  CompactHTTPCookieWithData *fromData;
  objc_super v4;

  fromData = self->_fromData;
  if (fromData)
  {
    (*((void (**)(CompactHTTPCookieWithData *, SEL))fromData->var0 + 1))(fromData, a2);
    self->_fromData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSHTTPCookieInternal_Data;
  -[NSHTTPCookieInternal_Data dealloc](&v4, sel_dealloc);
}

- (id)_initWithProperties:(id)a3 fromString:(BOOL)a4
{
  NSHTTPCookieInternal_Data *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  CompactHTTPCookieWithData *v13;
  objc_super v15;
  uint64_t (**v16)();
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
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
  _BYTE v35[28];
  id v36;
  uint64_t v37;

  if (a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)NSHTTPCookieInternal_Data;
    v6 = -[NSHTTPCookieInternal init](&v15, sel_init);
    if (v6)
    {
      v7 = (void *)objc_msgSend(a3, "mutableCopy");
      if (!a4 && objc_msgSend(a3, "objectForKey:", 0x1EDCFC780))
        objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, 0x1EDCFC780);
      v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Domain"));
      if (v8)
      {
        v9 = (void *)v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "hasPrefix:", CFSTR(".")))
          v10 = MEMORY[0x1E0C9AAA0];
        else
          v10 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, 0x1EDCFC780);
      }
      if (objc_msgSend(a3, "objectForKey:", 0x1EDCFC9B0))
      {
        if (objc_msgSend(a3, "objectForKey:", 0x1EDCFC748))
          objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, 0x1EDCFC748);
        if (objc_msgSend(a3, "objectForKey:", 0x1EDCFD270))
          objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, 0x1EDCFD270);
      }
      v11 = v7;
      if (v11)
        v12 = v11;
      else
        v12 = a3;
      v13 = (CompactHTTPCookieWithData *)operator new();
      v13->var0 = (void **)&off_1E14ED370;
      v34 = 0u;
      memset(v35, 0, sizeof(v35));
      v33 = 0u;
      v32 = 0u;
      v31 = 0u;
      v30 = 0u;
      v29 = 0u;
      v28 = 0u;
      v27 = 0u;
      v26 = 0u;
      v25 = 0u;
      v24 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
      v16 = &off_1E14F1E00;
      v36 = v12;
      v37 = 0;
      v13->var1 = (char *)Decanter::decant((Decanter *)&v16, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
      CompactHTTPCookieWithData::CompactHTTPCookieWithData(__CFDictionary const*)::PropDecanter::~PropDecanter(&v16);
      v6->_fromData = v13;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (NSHTTPCookieInternal_Data)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieInternal_Data;
  return -[NSHTTPCookieInternal init](&v3, sel_init);
}

- (id)_initWithCookie:(id)a3 partition:(id)a4
{
  NSHTTPCookieInternal_Data *v6;
  CompactHTTPCookieWithData *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFAllocator *v10;
  UInt8 *CString;
  objc_super v13;
  uint64_t (**v14)();
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
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
  _BYTE v33[28];
  uint64_t v34;
  void *v35;
  CFAllocatorRef allocator;
  uint64_t v37[2];
  UInt8 v38[1024];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)NSHTTPCookieInternal_Data;
  v6 = -[NSHTTPCookieInternal init](&v13, sel_init);
  if (v6)
  {
    v7 = (CompactHTTPCookieWithData *)operator new();
    v8 = objc_msgSend(a3, "_inner");
    v7->var0 = (void **)&off_1E14ED370;
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
    v32 = 0u;
    memset(v33, 0, sizeof(v33));
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    v14 = &off_1E14F1DA0;
    v34 = v9;
    if (a4)
    {
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      allocator = v10;
      v37[0] = 1023;
      CString = _CFStringGetOrCreateCString(v10, (CFStringRef)a4, v38, v37, 0x8000100u);
      v37[1] = (uint64_t)CString;
      v35 = strdup((const char *)CString);
      if (CString && v38 != CString)
        CFAllocatorDeallocate(allocator, CString);
    }
    else
    {
      v35 = 0;
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    }
    v7->var1 = (char *)Decanter::decant((Decanter *)&v14, v10);
    v14 = &off_1E14F1DA0;
    free(v35);
    v6->_fromData = v7;
  }
  return v6;
}

- (id)_initWithHeader:(const CompactCookieHeader *)a3
{
  NSHTTPCookieInternal_Data *v4;
  CompactHTTPCookieWithData *v5;
  CFIndex v6;
  char *v7;
  size_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSHTTPCookieInternal_Data;
  v4 = -[NSHTTPCookieInternal init](&v10, sel_init);
  if (v4)
  {
    v5 = (CompactHTTPCookieWithData *)operator new();
    v5->var0 = (void **)&off_1E14ED370;
    if (*(_DWORD *)a3 >= 4u)
      v6 = *(_DWORD *)a3;
    else
      v6 = 0;
    v7 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, 0);
    v5->var1 = v7;
    if (*(_DWORD *)a3 >= 4u)
      v8 = *(_DWORD *)a3;
    else
      v8 = 0;
    memcpy(v7, a3, v8);
    v4->_fromData = v5;
  }
  return v4;
}

@end
