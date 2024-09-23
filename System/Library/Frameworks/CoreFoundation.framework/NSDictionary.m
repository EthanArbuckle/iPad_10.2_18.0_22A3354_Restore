@implementation NSDictionary

- (NSArray)allKeys
{
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  id *v6;
  id *v7;
  unint64_t v8;
  id v9;
  NSArray *v10;
  CFStringRef v12;
  NSException *v13;
  size_t v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  v4 = -[NSDictionary count](self, "count");
  v5 = v4;
  if (v4 >> 60)
  {
    v12 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v4);
    v13 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v12, 0);
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1)
    v4 = 1;
  v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, v6, v5);
  if (v6)
  {
    if (v5)
    {
      v7 = v6;
      v8 = v5;
      do
      {
        v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    v10 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v6, v5, v5);
  }
  else
  {
    v10 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v5);
  }
  return v10;
}

- (BOOL)__getValue:(id *)a3 forKey:(id)a4
{
  id v5;

  v5 = -[NSDictionary objectForKey:](self, "objectForKey:", a4);
  if (a3 && v5)
    *a3 = v5;
  return v5 != 0;
}

- (NSArray)allValues
{
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  id *v6;
  id *v7;
  unint64_t v8;
  id v9;
  NSArray *v10;
  CFStringRef v12;
  NSException *v13;
  size_t v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  v4 = -[NSDictionary count](self, "count");
  v5 = v4;
  if (v4 >> 60)
  {
    v12 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v4);
    v13 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v12, 0);
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1)
    v4 = 1;
  v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", v6, 0, v5);
  if (v6)
  {
    if (v5)
    {
      v7 = v6;
      v8 = v5;
      do
      {
        v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    v10 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v6, v5, v5);
  }
  else
  {
    v10 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v5);
  }
  return v10;
}

- (NSDictionary)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
{
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  NSDictionary *v23;
  NSUInteger v25;
  uint64_t v26;
  NSException *v27;
  CFStringRef v28;
  NSException *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  NSException *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  NSException *v39;
  uint64_t v40;
  uint64_t v41;
  size_t v42;
  size_t v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  if (objects && (_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    v30 = _os_log_pack_size();
    v32 = (char *)&v41 - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    *(_DWORD *)v33 = 136315138;
    *(_QWORD *)(v33 + 4) = "-[NSDictionary initWithObjects:forKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: objects argument is not an NSArray"), "-[NSDictionary initWithObjects:forKeys:]");
    v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v34);
  }
  if (keys && (_NSIsNSArray((uint64_t)keys) & 1) == 0)
  {
    v35 = _os_log_pack_size();
    v37 = (char *)&v41 - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    *(_DWORD *)v38 = 136315138;
    *(_QWORD *)(v38 + 4) = "-[NSDictionary initWithObjects:forKeys:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: keys argument is not an NSArray"), "-[NSDictionary initWithObjects:forKeys:]");
    v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v37, v35);
    objc_exception_throw(v39);
  }
  v8 = -[NSArray count](objects, "count");
  v9 = -[NSArray count](keys, "count");
  if (v8 != v9)
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("*** %s: count of objects (%lu) differs from count of keys (%lu)"), "-[NSDictionary initWithObjects:forKeys:]", v8, v9);
  v10 = -[NSArray count](keys, "count");
  v11 = -[NSArray count](objects, "count");
  if (v10 != v11)
  {
    v25 = v11;
    v26 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: number of objects (%lu) not equal to number of keys (%lu)"), v26, v25, v10);
    v27 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v27);
  }
  if (v10 >> 60)
  {
    v28 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v10);
    v29 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v28, 0);
    CFRelease(v28);
    objc_exception_throw(v29);
  }
  if (v10 <= 1)
    v13 = 1;
  else
    v13 = v10;
  v14 = MEMORY[0x1E0C80A78](v11, v12);
  v17 = (char *)&v41 - v16;
  v43[0] = 0;
  if (v10 > 0x100)
  {
    v20 = (char *)_CFCreateArrayStorage(v13, 0, v43);
    MEMORY[0x1E0C80A78](v20, v22);
    v19 = (char *)&v40;
    v42 = 0;
    v21 = (char *)_CFCreateArrayStorage(v13, 0, &v42);
    v17 = v20;
  }
  else
  {
    MEMORY[0x1E0C80A78](v14, v15);
    v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = 0;
    v21 = 0;
    v42 = 0;
  }
  if (v10 >= 0x101)
    v19 = v21;
  -[NSArray getObjects:range:](keys, "getObjects:range:", v17, 0, v10);
  -[NSArray getObjects:range:](objects, "getObjects:range:", v19, 0, v10);
  v23 = -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", v19, v17, v10);
  free(v21);
  free(v20);
  return v23;
}

+ (NSDictionary)dictionary
{
  return (NSDictionary *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:forKeys:count:", 0, 0, 0);
}

+ (NSDictionary)dictionaryWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt
{
  return (NSDictionary *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:forKeys:count:", objects, keys, cnt);
}

+ (NSDictionary)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSDictionary == a1)
    return (NSDictionary *)__NSDictionaryImmutablePlaceholder();
  if (NSMutableDictionary == a1)
    return (NSDictionary *)__NSDictionaryMutablePlaceholder();
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSDictionary;
  return (NSDictionary *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (id)objectForKeyedSubscript:(id)key
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return -[NSDictionary objectForKey:](self, "objectForKey:", key);
}

- (unint64_t)_cfTypeID
{
  return 18;
}

- (void)getObjects:(id *)objects andKeys:(id *)keys
{
  uint64_t v4;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  v8 = -[NSDictionary count](self, "count");
  v9 = v8 >> 61;
  if (objects && v9 || keys && v9)
  {
    v10 = v8;
    v11 = _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[NSDictionary getObjects:andKeys:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = v10;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSDictionary getObjects:andKeys:]", v10);
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    objc_exception_throw(v13);
  }
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", objects, keys, v8);
}

- (BOOL)isEqualToDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v3;
  int v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  NSException *v18;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (otherDictionary && (_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    v16 = _os_log_pack_size();
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSDictionary isEqualToDictionary:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: dictionary argument is not an NSDictionary"), "-[NSDictionary isEqualToDictionary:]");
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v20[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)], v16);
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  LOBYTE(v6) = otherDictionary == self;
  if (otherDictionary != self && otherDictionary)
  {
    v7 = -[NSDictionary count](self, "count");
    if (-[NSDictionary count](otherDictionary, "count") == v7)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      if (!v8)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
      v9 = v8;
      v10 = *(_QWORD *)v22;
LABEL_10:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(self);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = -[NSDictionary objectForKey:](otherDictionary, "objectForKey:", v12);
        v14 = -[NSDictionary objectForKey:](self, "objectForKey:", v12);
        if (v13 && v14 == 0)
          break;
        if (v14)
        {
          if (!v13)
            break;
          v6 = objc_msgSend(v14, "isEqual:", v13);
          if (!v6)
            return v6;
        }
        if (v9 == ++v11)
        {
          v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
          LOBYTE(v6) = 1;
          if (v9)
            goto LABEL_10;
          return v6;
        }
      }
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  int v6;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3)
  {
    v6 = _NSIsNSDictionary((uint64_t)a3);
    if (v6)
      LOBYTE(v6) = -[NSDictionary isEqualToDictionary:](self, "isEqualToDictionary:", a3);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isNSDictionary__
{
  return 1;
}

- (unint64_t)hash
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return -[NSDictionary count](self, "count");
}

uint64_t __32__NSDictionary___apply_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(a2, a3, *(_QWORD *)(a1 + 40));
}

- (NSString)descriptionWithLocale:(id)locale
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return -[NSDictionary descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", locale, 0);
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFStringRef *v12;
  uint64_t v13;
  uint64_t v14;
  CFStringRef *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t *v30;
  CFStringRef *v31;
  unint64_t v32;
  uint64_t v33;
  __CFString *Mutable;
  CFStringRef *v35;
  CFStringRef *v36;
  unint64_t v37;
  __CFString *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  CFMutableStringRef v47;
  NSUInteger j;
  NSString *v49;
  CFStringRef v51;
  NSException *v52;
  uint64_t v53;
  void *v54;
  CFAllocatorRef v55;
  CFStringRef *v56;
  CFStringRef *v57;
  NSUInteger v58;
  NSUInteger v59;
  id v60;
  NSDictionary *v61;
  _QWORD v62[2];
  uint64_t (*v63)(uint64_t, void *);
  void *v64;
  size_t *v65;
  size_t v66[3];
  int v67;
  _QWORD v68[5];
  size_t v69;
  size_t v70[3];

  v60 = locale;
  v70[1] = *MEMORY[0x1E0C80C00];
  if (level >= 0x64)
    v4 = 100;
  else
    v4 = level;
  v61 = self;
  v5 = -[NSDictionary count](self, "count");
  v7 = v5;
  if (v5 >> 60)
  {
    v51 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
    v52 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v51, 0);
    CFRelease(v51);
    objc_exception_throw(v52);
  }
  v58 = v4;
  if (v5 <= 1)
    v8 = 1;
  else
    v8 = v5;
  v9 = MEMORY[0x1E0C80A78](v5, v6);
  v12 = (CFStringRef *)((char *)&v54 - v11);
  v70[0] = 0;
  if (v7 > 0x100)
  {
    v12 = (CFStringRef *)_CFCreateArrayStorage(v8, 0, v70);
    v69 = 0;
    v15 = (CFStringRef *)_CFCreateArrayStorage(v8, 0, &v69);
    MEMORY[0x1E0C80A78](v15, v20);
    v18 = (char *)&v53;
    v66[0] = 0;
    v19 = (char *)_CFCreateArrayStorage(v8, 0, v66);
    v56 = v15;
    v57 = v12;
  }
  else
  {
    v13 = MEMORY[0x1E0C80A78](v9, v10);
    v15 = (CFStringRef *)((char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    v69 = 0;
    MEMORY[0x1E0C80A78](v13, v16);
    v18 = (char *)&v54 - v17;
    v56 = 0;
    v57 = 0;
    v19 = 0;
    v66[0] = 0;
  }
  if (v7 >= 0x101)
    v18 = v19;
  v21 = -[NSDictionary getObjects:andKeys:count:](v61, "getObjects:andKeys:count:", 0, v18, v7);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      if (_NSIsNSString(*(_QWORD *)&v18[8 * i]))
      {
        v24 = objc_opt_respondsToSelector();
        if ((v24 & 1) != 0)
          continue;
      }
      memmove(v12, v18, 8 * v7);
      goto LABEL_28;
    }
    MEMORY[0x1E0C80A78](v24, v25);
    v27 = (char *)&v54 - v26;
    if (v7 <= 0x1000)
      goto LABEL_22;
    v28 = (char *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v21, v22);
    v27 = (char *)&v54 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_22:
    v28 = v27;
  }
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __45__NSDictionary_descriptionWithLocale_indent___block_invoke;
  v68[3] = &__block_descriptor_40_e11_q24__0q8q16l;
  v68[4] = v18;
  CFSortIndexes((uint64_t)v28, v7, 0, (uint64_t)v68);
  if (v7)
  {
    v30 = (uint64_t *)v28;
    v31 = v12;
    v32 = v7;
    do
    {
      v33 = *v30++;
      *v31++ = *(CFStringRef *)&v18[8 * v33];
      --v32;
    }
    while (v32);
  }
  if (v27 != v28)
    free(v28);
LABEL_28:
  free(v19);
  v66[0] = 0;
  v66[1] = (size_t)v66;
  v66[2] = 0x2020000000;
  v67 = -1;
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v63 = __45__NSDictionary_descriptionWithLocale_indent___block_invoke_2;
  v64 = &unk_1E1333D80;
  v65 = v66;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v55 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  v54 = (void *)MEMORY[0x186DB02F4]();
  if (v7)
  {
    v59 = v58 + 1;
    v35 = v12;
    v36 = v15;
    v37 = v7;
    do
    {
      v38 = (__CFString *)*v35;
      v39 = -[NSDictionary objectForKey:](v61, "objectForKey:", *v35, v54, v55, v56, v57);
      if (_NSIsNSString((uint64_t)v38))
      {
        v40 = -[__CFString _stringRepresentation](v38, "_stringRepresentation");
      }
      else if ((_NSIsNSDictionary((uint64_t)v38) & 1) != 0 || _NSIsNSArray((uint64_t)v38))
      {
        v40 = -[__CFString descriptionWithLocale:indent:](v38, "descriptionWithLocale:indent:", v60, v59);
      }
      else if (_NSIsNSData((uint64_t)v38))
      {
        v40 = -[__CFString description](v38, "description");
      }
      else
      {
        v45 = -[__CFString description](v38, "description");
        v40 = v63((uint64_t)v62, (void *)v45);
      }
      v41 = (const __CFString *)v40;
      if (_NSIsNSString((uint64_t)v39))
      {
        v42 = objc_msgSend(v39, "_stringRepresentation");
      }
      else if ((_NSIsNSDictionary((uint64_t)v39) & 1) != 0 || _NSIsNSArray((uint64_t)v39))
      {
        v42 = objc_msgSend(v39, "descriptionWithLocale:indent:", v60, v59);
      }
      else if (_NSIsNSData((uint64_t)v39))
      {
        v42 = objc_msgSend(v39, "description");
      }
      else
      {
        v46 = objc_msgSend(v39, "description");
        v42 = v63((uint64_t)v62, (void *)v46);
      }
      if (v41)
        v43 = v41;
      else
        v43 = CFSTR("(null)");
      *v35++ = v43;
      if (v42)
        v44 = (const __CFString *)v42;
      else
        v44 = CFSTR("(null)");
      *v36++ = v44;
      --v37;
    }
    while (v37);
  }
  v47 = CFStringCreateMutable(v55, 0);
  for (j = v58; j; --j)
    CFStringAppend(v47, CFSTR("    "));
  CFStringAppend(Mutable, v47);
  CFStringAppend(Mutable, CFSTR("{\n"));
  for (; v7; --v7)
  {
    CFStringAppend(Mutable, v47);
    CFStringAppend(Mutable, CFSTR("    "));
    CFStringAppend(Mutable, *v12);
    CFStringAppend(Mutable, CFSTR(" = "));
    CFStringAppend(Mutable, *v15);
    CFStringAppend(Mutable, CFSTR(";\n"));
    ++v15;
    ++v12;
  }
  CFStringAppend(Mutable, v47);
  CFStringAppend(Mutable, CFSTR("}"));
  CFRelease(v47);
  objc_autoreleasePoolPop(v54);
  v49 = Mutable;
  _Block_object_dispose(v66, 8);
  free(v56);
  free(v57);
  return v49;
}

uint64_t __45__NSDictionary_descriptionWithLocale_indent___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == -1)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_lookUpClass("NSString") != 0;
  if (_CFExecutableLinkedOnOrAfter(6uLL) && *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return objc_msgSend(a2, "_stringRepresentation");
  else
    return (uint64_t)a2;
}

- (NSString)description
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return -[NSDictionary descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0, 0);
}

+ (NSDictionary)dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
{
  return (NSDictionary *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:forKeys:", objects, keys);
}

- (void)enumerateKeysAndObjectsUsingBlock:(void *)block
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSException *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!block)
  {
    v6 = _os_log_pack_size();
    v7 = _os_log_pack_fill();
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = "-[NSDictionary enumerateKeysAndObjectsUsingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSDictionary enumerateKeysAndObjectsUsingBlock:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  -[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, block);
}

- (void)getObjects:(id *)objects andKeys:(id *)keys count:(NSUInteger)count
{
  uint64_t v5;
  NSUInteger v6;
  id *v7;
  id *v8;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSException *v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v6 = count;
  v7 = keys;
  v8 = objects;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = count >> 61;
  if (objects && v10 || keys && v10)
  {
    v16 = _os_log_pack_size();
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315394;
    *(_QWORD *)(v17 + 4) = "-[NSDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(_QWORD *)(v17 + 14) = v6;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSDictionary getObjects:andKeys:count:]", v6);
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v19[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)], v16);
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
LABEL_9:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(self);
      if (v6 == v14)
        break;
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
      if (v7)
        *v7++ = v15;
      if (v8)
        *v8++ = -[NSDictionary objectForKey:](self, "objectForKey:", v15);
      if (v12 == ++v14)
      {
        v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
        v6 -= v14;
        if (v12)
          goto LABEL_9;
        return;
      }
    }
  }
}

- (BOOL)containsKey:(id)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    if (a3)
      return -[NSDictionary objectForKey:](self, "objectForKey:", a3) != 0;
  }
  else if (a3)
  {
    return -[NSDictionary objectForKey:](self, "objectForKey:", a3) != 0;
  }
  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return -[NSDictionary initWithDictionary:copyItems:](+[NSDictionary allocWithZone:](NSMutableDictionary, "allocWithZone:", a3), "initWithDictionary:copyItems:", self, 0);
}

uint64_t __45__NSDictionary_descriptionWithLocale_indent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8 * a2), "compare:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a3));
}

uint64_t __61__NSDictionary_keysSortedByValueWithOptions_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3));
}

id __47__NSDictionary_keysSortedByValueUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(a2, *(SEL *)(a1 + 32));
}

- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary
{
  return -[NSDictionary initWithDictionary:copyItems:](self, "initWithDictionary:copyItems:", otherDictionary, 0);
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(self);
        v10 = -[NSDictionary objectForKey:](self, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        if (v10 == a3 || (objc_msgSend(a3, "isEqual:", v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      LOBYTE(v6) = 0;
      if (v7)
        continue;
      break;
    }
  }
  return v6;
}

- (NSSet)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v4;
  char v6;
  NSSet *v9;
  uint64_t v11;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[7];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!predicate)
  {
    v11 = _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSDictionary keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSDictionary keysOfEntriesWithOptions:passingTest:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    objc_exception_throw(v13);
  }
  v6 = opts;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate);
  v9 = +[NSSet set](NSMutableSet, "set");
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  v15 = 850045857;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__NSDictionary_keysOfEntriesWithOptions_passingTest___block_invoke;
  v14[3] = &unk_1E12E6320;
  v14[5] = predicate;
  v14[6] = &v15;
  v14[4] = v9;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v14);
  return +[NSSet setWithSet:](NSSet, "setWithSet:", v9);
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  uint64_t v4;
  NSException *v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v4 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: function pointer is NULL"), v4);
    v5 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v5);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__NSDictionary___apply_context___block_invoke;
  v6[3] = &__block_descriptor_48_e15_v32__0_8_16_B24l;
  v6[4] = a3;
  v6[5] = a4;
  -[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, v6);
}

- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v4;
  char v6;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!block)
  {
    v9 = _os_log_pack_size();
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    objc_exception_throw(v11);
  }
  v6 = opts;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)block);
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)block);
}

+ (id)newDictionaryWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  uint64_t i;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSException *v13;
  uint64_t v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a5)
    goto LABEL_25;
  if (a5 >> 61)
  {
    v10 = _os_log_pack_size();
    v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "+[NSDictionary newDictionaryWithObjects:forKeys:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "+[NSDictionary newDictionaryWithObjects:forKeys:count:]", a5);
    goto LABEL_22;
  }
  if (a5)
  {
    for (i = 0; i != a5; ++i)
    {
      if (!a3[i])
        goto LABEL_21;
    }
    if (a4)
    {
      i = 0;
      while (a4[i])
      {
        if (a5 == ++i)
          goto LABEL_12;
      }
LABEL_21:
      v9 = i;
      v10 = _os_log_pack_size();
      v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = _os_log_pack_fill();
      *(_DWORD *)v12 = 136315394;
      *(_QWORD *)(v12 + 4) = "+[NSDictionary newDictionaryWithObjects:forKeys:count:]";
      *(_WORD *)(v12 + 12) = 2048;
      *(_QWORD *)(v12 + 14) = v9;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "+[NSDictionary newDictionaryWithObjects:forKeys:count:]", v9);
LABEL_22:
      v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
      objc_exception_throw(v13);
    }
LABEL_25:
    v10 = _os_log_pack_size();
    v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315394;
    *(_QWORD *)(v17 + 4) = "+[NSDictionary newDictionaryWithObjects:forKeys:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(_QWORD *)(v17 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "+[NSDictionary newDictionaryWithObjects:forKeys:count:]", a5);
    goto LABEL_22;
  }
LABEL_12:
  if (NSDictionary == a1)
  {
    if (a5 == 1)
    {
      return __NSSingleEntryDictionaryI_new((unint64_t)*a4, (unint64_t)*a3, 4);
    }
    else if (a5)
    {
      return __NSDictionaryI_new((uint64_t *)a4, (uint64_t *)a3, 0, a5, 5);
    }
    else
    {
      return &__NSDictionary0__struct;
    }
  }
  else
  {
    if (NSMutableDictionary != a1)
    {
      v8 = __CFLookUpClass("NSDictionary");
      __CFRequireConcreteImplementation(v8, (uint64_t)a1);
    }
    return __NSDictionaryM_new((uint64_t)a4, (uint64_t)a3, a5, 3uLL);
  }
}

- (NSArray)keysSortedByValueUsingSelector:(SEL)comparator
{
  uint64_t v3;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (!comparator)
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__NSDictionary_keysSortedByValueUsingSelector___block_invoke;
  v7[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v7[4] = comparator;
  return -[NSDictionary keysSortedByValueWithOptions:usingComparator:](self, "keysSortedByValueWithOptions:usingComparator:", 0, v7);
}

- (NSArray)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  uint64_t v4;
  char v6;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v19;
  char *v20;
  id *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t i;
  id *v28;
  unint64_t v29;
  id v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSException *v36;
  CFStringRef v37;
  NSException *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD v42[6];
  size_t v43;
  size_t v44;
  size_t v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  if (!cmptr)
  {
    v32 = _os_log_pack_size();
    v34 = (char *)&v40 - ((MEMORY[0x1E0C80A78](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
    v35 = _os_log_pack_fill();
    *(_DWORD *)v35 = 136315138;
    *(_QWORD *)(v35 + 4) = "-[NSDictionary keysSortedByValueWithOptions:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSDictionary keysSortedByValueWithOptions:usingComparator:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v34, v32);
    objc_exception_throw(v36);
  }
  v6 = opts;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  v8 = -[NSDictionary count](self, "count");
  if (!v8)
    return +[NSArray array](NSArray, "array");
  v10 = v8;
  if (v8 >> 60)
  {
    v37 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v8);
    v38 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v37, 0);
    CFRelease(v37);
    objc_exception_throw(v38);
  }
  v11 = MEMORY[0x1E0C80A78](v8, v9);
  v14 = (char *)&v40 - v13;
  v45[0] = 0;
  if (v10 > 0x100)
  {
    v14 = (char *)_CFCreateArrayStorage(v10, 0, v45);
    MEMORY[0x1E0C80A78](v14, v19);
    v16 = (char *)&v39;
    v44 = 0;
    v41 = v14;
    v17 = (char *)_CFCreateArrayStorage(v10, 0, &v44);
  }
  else
  {
    MEMORY[0x1E0C80A78](v11, v12);
    v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    v41 = 0;
    v17 = 0;
    v44 = 0;
  }
  if (v10 >= 0x101)
    v20 = v17;
  else
    v20 = v16;
  v43 = 0;
  v21 = (id *)_CFCreateArrayStorage(v10, 0, &v43);
  v22 = -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", v20, v14, v10);
  MEMORY[0x1E0C80A78](v22, v23);
  v25 = (char *)&v40 - v24;
  v26 = (char *)&v40 - v24;
  if (v10 > 0x1000)
    v26 = (char *)malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __61__NSDictionary_keysSortedByValueWithOptions_usingComparator___block_invoke;
  v42[3] = &unk_1E12E12E0;
  v42[4] = cmptr;
  v42[5] = v20;
  CFSortIndexes((uint64_t)v26, v10, v6, (uint64_t)v42);
  for (i = 0; i != v10; ++i)
    v21[i] = *(id *)&v14[8 * *(_QWORD *)&v26[8 * i]];
  if (v25 != v26)
    free(v26);
  if ((uint64_t)v10 >= 1)
  {
    v28 = v21;
    v29 = v10;
    do
    {
      v30 = *v28++;
      --v29;
    }
    while (v29);
  }
  v31 = (NSArray *)-[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v21, v10, v10);
  free(v17);
  free(v41);
  return v31;
}

- (NSArray)allKeysForObject:(id)anObject
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  id *v12;
  NSUInteger v13;
  char *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  id v22;
  NSArray *v23;
  CFStringRef v25;
  NSException *v26;
  uint64_t v27;
  size_t v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  v6 = -[NSDictionary count](self, "count");
  if (v6 >> 60)
  {
    v25 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v26 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v25, 0);
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v6 <= 1)
    v6 = 1;
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v10 = (char *)&v27 - v9;
  v28 = 0;
  if (v11 >= 0x101)
  {
    v10 = (char *)_CFCreateArrayStorage(v8, 0, &v28);
    v12 = (id *)v10;
  }
  else
  {
    v12 = 0;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  v14 = v10;
  if (v13)
  {
    v15 = *(_QWORD *)v31;
    v14 = v10;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(self);
        v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v18 = -[NSDictionary objectForKey:](self, "objectForKey:", v17);
        if (v18 == anObject || objc_msgSend(anObject, "isEqual:", v18))
        {
          *(_QWORD *)v14 = v17;
          v14 += 8;
        }
      }
      v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    }
    while (v13);
  }
  v19 = (v14 - v10) >> 3;
  if (v12)
  {
    if (v14 - v10 >= 1)
    {
      if (v19 <= 1)
        v20 = 1;
      else
        v20 = (v14 - v10) >> 3;
      v21 = v12;
      do
      {
        v22 = *v21++;
        --v20;
      }
      while (v20);
    }
    v23 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v12, v19, v19);
  }
  else
  {
    v23 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", v10, (v14 - v10) >> 3);
  }
  return v23;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)buffer count:(NSUInteger)len
{
  uint64_t v5;
  unint64_t v10;
  NSEnumerator *v11;
  NSEnumerator *v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  id v16;
  unint64_t v17;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSException *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!buffer && len)
  {
    v19 = _os_log_pack_size();
    v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)(v21 + 4) = "-[NSDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(_QWORD *)(v21 + 14) = len;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSDictionary countByEnumeratingWithState:objects:count:]", len);
    goto LABEL_28;
  }
  if (len >> 61)
  {
    v19 = _os_log_pack_size();
    v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136315394;
    *(_QWORD *)(v22 + 4) = "-[NSDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(_QWORD *)(v22 + 14) = len;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSDictionary countByEnumeratingWithState:objects:count:]", len);
LABEL_28:
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v20, v19);
    objc_exception_throw(v23);
  }
  v10 = state->state;
  if (state->state == -1)
    return 0;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
    v10 = state->state;
    if (state->state)
      goto LABEL_7;
    goto LABEL_9;
  }
  if (!v10)
  {
LABEL_9:
    state->mutationsPtr = state->extra;
    state->extra[0] = -[NSDictionary count](self, "count");
    v12 = -[NSDictionary keyEnumerator](self, "keyEnumerator");
    state->extra[1] = (unint64_t)v12;
    if (v12)
    {
      v11 = v12;
      v10 = state->state;
      goto LABEL_11;
    }
    return 0;
  }
LABEL_7:
  v11 = (NSEnumerator *)state->extra[1];
LABEL_11:
  state->itemsPtr = buffer;
  v13 = state->extra[0];
  if (v13 - v10 >= len)
    v14 = len;
  else
    v14 = v13 - v10;
  if (v14)
  {
    v15 = 0;
    while (1)
    {
      v16 = -[NSEnumerator nextObject](v11, "nextObject");
      if (!v16)
        break;
      buffer[v15++] = v16;
      if (v14 == v15)
      {
        v10 = state->state;
        goto LABEL_19;
      }
    }
    v17 = -1;
  }
  else
  {
LABEL_19:
    v17 = v10 + v14;
    if (v13 <= v17)
      v17 = -1;
    v15 = v14;
  }
  state->state = v17;
  return v15;
}

- (NSEnumerator)objectEnumerator
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return (NSEnumerator *)-[__NSFastEnumerationEnumerator initWithObject:]([__NSDictionaryObjectEnumerator alloc], "initWithObject:", self);
}

+ (NSDictionary)dictionaryWithDictionary:(NSDictionary *)dict
{
  return (NSDictionary *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:copyItems:", dict, 0);
}

- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag
{
  _BOOL4 v4;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  id *v16;
  id *v17;
  id *v18;
  uint64_t v19;
  id *v20;
  id *v21;
  unint64_t v22;
  NSDictionary *v23;
  CFStringRef v25;
  NSException *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  NSException *v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  size_t v35[2];

  v4 = flag;
  v35[1] = *MEMORY[0x1E0C80C00];
  if (otherDictionary && (_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    v27 = _os_log_pack_size();
    v29 = (char *)&v33 - ((MEMORY[0x1E0C80A78](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    v30 = _os_log_pack_fill();
    *(_DWORD *)v30 = 136315138;
    *(_QWORD *)(v30 + 4) = "-[NSDictionary initWithDictionary:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: dictionary argument is not an NSDictionary"), "-[NSDictionary initWithDictionary:copyItems:]");
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v29, v27);
    objc_exception_throw(v31);
  }
  v7 = -[NSDictionary count](otherDictionary, "count");
  v9 = v7;
  if (v7 >> 60)
  {
    v25 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
    v26 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v25, 0);
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v7 <= 1)
    v10 = 1;
  else
    v10 = v7;
  v11 = MEMORY[0x1E0C80A78](v7, v8);
  v14 = (id *)((char *)&v33 - v13);
  v35[0] = 0;
  if (v9 > 0x100)
  {
    v17 = (id *)_CFCreateArrayStorage(v10, 0, v35);
    MEMORY[0x1E0C80A78](v17, v19);
    v16 = (id *)&v32;
    v34 = 0;
    v18 = (id *)_CFCreateArrayStorage(v10, 0, &v34);
    v14 = v17;
  }
  else
  {
    MEMORY[0x1E0C80A78](v11, v12);
    v16 = (id *)((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    v17 = 0;
    v18 = 0;
    v34 = 0;
  }
  if (v9 >= 0x101)
    v16 = v18;
  -[NSDictionary getObjects:andKeys:count:](otherDictionary, "getObjects:andKeys:count:", v16, v14, v9);
  if (!v9)
    v4 = 0;
  if (v4)
  {
    v20 = v14;
    v21 = v16;
    v22 = v9;
    do
    {
      *v20 = (id)objc_msgSend(*v20, "copyWithZone:", 0);
      *v21 = (id)objc_msgSend(*v21, "copyWithZone:", 0);
      ++v21;
      ++v20;
      --v22;
    }
    while (v22);
  }
  v23 = -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", v16, v14, v9);
  if (v4)
  {
    do
    {

      ++v14;
      --v9;
    }
    while (v9);
  }
  free(v18);
  free(v17);
  return v23;
}

- (id)_cfMutableCopy
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return (id)objc_msgSend(objc_allocWithZone((Class)NSMutableDictionary), "initWithDictionary:copyItems:", self, 0);
}

+ (NSDictionary)dictionaryWithObjectsAndKeys:(id)firstObject
{
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  CFStringRef v8;
  NSException *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  id *v16;
  _QWORD *v17;
  id *v18;
  _QWORD *v19;
  uint64_t i;
  _QWORD *v21;
  _QWORD *v22;
  NSDictionary *v23;
  NSDictionary *v24;
  uint64_t v26;
  NSException *v27;
  uint64_t v28;
  size_t v29;
  size_t v30;
  va_list v31;
  uint64_t v32[2];
  uint64_t v33;
  va_list va1;
  va_list va;

  va_start(va1, firstObject);
  va_start(va, firstObject);
  v33 = va_arg(va1, _QWORD);
  v32[1] = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32[0] = (uint64_t)firstObject;
  if (firstObject)
  {
    v5 = 0;
    va_copy(v31, va);
    do
    {
      v6 = v31;
      v31 += 8;
      ++v5;
    }
    while (*v6);
    if ((v5 & 1) != 0)
    {
      v26 = __CFExceptionProem((objc_class *)a1, a2);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: second object of each pair must be non-nil.  Or, did you forget to nil-terminate your parameter list?"), v26);
      v27 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
      objc_exception_throw(v27);
    }
    v7 = v5 >> 1;
    if (NSDictionary == a1)
    {
      va_copy(v31, va);
      v23 = (NSDictionary *)__NSDictionaryI_new(v32, 0, (uint64_t *)va, v5 >> 1, 1);
LABEL_25:
      v24 = v23;
      return v23;
    }
    if (v5 >> 61)
    {
      v8 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5 >> 1);
      v9 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v8, 0);
      CFRelease(v8);
      objc_exception_throw(v9);
    }
LABEL_10:
    if (v7 <= 1)
      v10 = 1;
    else
      v10 = v7;
    v11 = MEMORY[0x1E0C80A78](a1, a2);
    v14 = (uint64_t *)((char *)&v28 - v13);
    v30 = 0;
    if (v7 >= 0x101)
    {
      v17 = _CFCreateArrayStorage(v10, 0, &v30);
      v29 = 0;
      v18 = (id *)_CFCreateArrayStorage(v10, 0, &v29);
      va_copy(v31, va);
      *v18 = firstObject;
      v19 = v31;
      v31 += 8;
      *v17 = *v19;
      v14 = v17;
      v16 = v18;
    }
    else
    {
      MEMORY[0x1E0C80A78](v11, v12);
      v16 = (id *)((char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
      v29 = 0;
      if (!v7)
      {
        v18 = 0;
        v17 = 0;
LABEL_24:
        v23 = (NSDictionary *)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:forKeys:count:", v16, v14, v7);
        free(v18);
        free(v17);
        goto LABEL_25;
      }
      v17 = 0;
      v18 = 0;
      *v16 = firstObject;
      va_copy(v31, va1);
      *v14 = v33;
      if (v7 == 1)
        goto LABEL_24;
    }
    for (i = 1; i != v7; ++i)
    {
      v21 = v31;
      v31 += 8;
      v16[i] = (id)*v21;
      v22 = v31;
      v31 += 8;
      v14[i] = *v22;
    }
    goto LABEL_24;
  }
  if (NSDictionary != a1)
  {
    v7 = 0;
    goto LABEL_10;
  }
  return (NSDictionary *)&__NSDictionary0__struct;
}

+ (NSDictionary)dictionaryWithObject:(id)object forKey:(id)key
{
  return (NSDictionary *)(id)__createDictionary(objc_alloc((Class)a1), (uint64_t)object, (uint64_t)key);
}

- (NSDictionary)initWithObjectsAndKeys:(id)firstObject
{
  __objc2_class *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  CFStringRef v11;
  NSException *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  id *v18;
  _QWORD *v19;
  id *v20;
  _QWORD *v21;
  uint64_t i;
  _QWORD *v23;
  _QWORD *v24;
  NSDictionary *v25;
  uint64_t v27;
  NSException *v28;
  uint64_t v29;
  size_t v30;
  size_t v31;
  va_list v32;
  uint64_t v33[2];
  uint64_t v34;
  va_list va1;
  va_list va;

  va_start(va1, firstObject);
  va_start(va, firstObject);
  v34 = va_arg(va1, _QWORD);
  v33[1] = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33[0] = (uint64_t)firstObject;
  v6 = (__objc2_class *)objc_opt_class();
  if (firstObject)
  {
    v8 = 0;
    va_copy(v32, va);
    do
    {
      v9 = v32;
      v32 += 8;
      ++v8;
    }
    while (*v9);
    if ((v8 & 1) != 0)
    {
      v27 = __CFExceptionProem((objc_class *)self, a2);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: second object of each pair must be non-nil.  Or, did you forget to nil-terminate your parameter list?"), v27);
      v28 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
      objc_exception_throw(v28);
    }
    v10 = v8 >> 1;
    if (v6 != NSDictionary)
    {
      if (v8 >> 61)
      {
        v11 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v8 >> 1);
        v12 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v11, 0);
        CFRelease(v11);
        objc_exception_throw(v12);
      }
LABEL_10:
      if (v10 <= 1)
        v13 = 1;
      else
        v13 = v10;
      v14 = MEMORY[0x1E0C80A78](v6, v7);
      v31 = 0;
      if (v10 >= 0x101)
      {
        v19 = _CFCreateArrayStorage(v13, 0, &v31);
        v30 = 0;
        v20 = (id *)_CFCreateArrayStorage(v13, 0, &v30);
        va_copy(v32, va);
        *v20 = firstObject;
        v21 = v32;
        v32 += 8;
        *v19 = *v21;
        v16 = v19;
        v18 = v20;
      }
      else
      {
        MEMORY[0x1E0C80A78](v14, v15);
        v18 = (id *)((char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
        v30 = 0;
        if (!v10)
        {
          v20 = 0;
          v19 = 0;
LABEL_24:
          v25 = -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:");
          free(v20);
          free(v19);
          return v25;
        }
        v19 = 0;
        v20 = 0;
        *v18 = firstObject;
        va_copy(v32, va1);
        *v16 = v34;
        if (v10 == 1)
          goto LABEL_24;
      }
      for (i = 1; i != v10; ++i)
      {
        v23 = v32;
        v32 += 8;
        v18[i] = (id)*v23;
        v24 = v32;
        v32 += 8;
        v16[i] = *v24;
      }
      goto LABEL_24;
    }

    va_copy(v32, va);
    return (NSDictionary *)__NSDictionaryI_new(v33, 0, (uint64_t *)va, v10, 1);
  }
  else
  {
    if (v6 != NSDictionary)
    {
      v10 = 0;
      goto LABEL_10;
    }
    return (NSDictionary *)&__NSDictionary0__struct;
  }
}

- (NSArray)keysSortedByValueUsingComparator:(NSComparator)cmptr
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!cmptr)
  {
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[NSDictionary keysSortedByValueUsingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSDictionary keysSortedByValueUsingComparator:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return -[NSDictionary keysSortedByValueWithOptions:usingComparator:](self, "keysSortedByValueWithOptions:usingComparator:", 0, cmptr);
}

+ (id)sharedKeySetForKeys:(NSArray *)keys
{
  NSException *v7;
  uint64_t v8;
  uint64_t v9;

  if (!keys)
  {
    v8 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: keys cannot be nil"), v8);
    goto LABEL_6;
  }
  if ((_NSIsNSArray((uint64_t)keys) & 1) == 0)
  {
    v9 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: keys must be a kind of NSArray"), v9);
LABEL_6:
    v7 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v7);
  }
  return +[NSSharedKeySet keySetWithKeys:](NSSharedKeySet, "keySetWithKeys:", keys);
}

- (NSArray)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker
{
  uint64_t v4;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  id *v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  id v20;
  uint64_t v21;
  id *v22;
  id v23;
  NSArray *v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSException *v30;
  CFStringRef v31;
  NSException *v32;
  uint64_t v33;
  size_t v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!marker)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)&v33 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSDictionary objectsForKeys:notFoundMarker:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: marker cannot be nil"), "-[NSDictionary objectsForKeys:notFoundMarker:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
  v8 = -[NSArray count](keys, "count");
  if (v8 >> 60)
  {
    v31 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v8);
    v32 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v31, 0);
    CFRelease(v31);
    objc_exception_throw(v32);
  }
  if (v8 <= 1)
    v8 = 1;
  v10 = MEMORY[0x1E0C80A78](v8, v9);
  v12 = (char *)&v33 - v11;
  v34 = 0;
  if (v13 >= 0x101)
  {
    v12 = (char *)_CFCreateArrayStorage(v10, 0, &v34);
    v14 = (id *)v12;
  }
  else
  {
    v14 = 0;
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  v16 = v12;
  if (v15)
  {
    v17 = *(_QWORD *)v37;
    v16 = v12;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(keys);
        v19 = -[NSDictionary objectForKey:](self, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        if (v19)
          v20 = v19;
        else
          v20 = marker;
        *(_QWORD *)v16 = v20;
        v16 += 8;
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    }
    while (v15);
  }
  if (v14)
  {
    if (v16 - v12 >= 1)
    {
      if ((v16 - v12) >> 3 <= 1)
        v21 = 1;
      else
        v21 = (v16 - v12) >> 3;
      v22 = v14;
      do
      {
        v23 = *v22++;
        --v21;
      }
      while (v21);
    }
    v24 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v14, (v16 - v12) >> 3, (v16 - v12) >> 3);
  }
  else
  {
    v24 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", v12, (v16 - v12) >> 3);
  }
  return v24;
}

- (NSSet)keysOfEntriesPassingTest:(void *)predicate
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!predicate)
  {
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[NSDictionary keysOfEntriesPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSDictionary keysOfEntriesPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return -[NSDictionary keysOfEntriesWithOptions:passingTest:](self, "keysOfEntriesWithOptions:passingTest:", 0, predicate);
}

- (unint64_t)countForKey:(id)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return -[NSDictionary objectForKey:](self, "objectForKey:", a3) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t ShouldCopy;

  ShouldCopy = __NSCollectionsShouldCopy();
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return -[NSDictionary initWithDictionary:copyItems:](+[NSDictionary allocWithZone:](NSDictionary, "allocWithZone:", a3), "initWithDictionary:copyItems:", self, ShouldCopy);
}

- (id)allObjects
{
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  id *v6;
  id *v7;
  unint64_t v8;
  id v9;
  NSArray *v10;
  CFStringRef v12;
  NSException *v13;
  size_t v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  v4 = -[NSDictionary count](self, "count");
  v5 = v4;
  if (v4 >> 60)
  {
    v12 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v4);
    v13 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v12, 0);
    CFRelease(v12);
    objc_exception_throw(v13);
  }
  v14[0] = 0;
  if (v4 <= 1)
    v4 = 1;
  v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", v6, 0, v5);
  if (v6)
  {
    if (v5)
    {
      v7 = v6;
      v8 = v5;
      do
      {
        v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    v10 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v6, v5, v5);
  }
  else
  {
    v10 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v5);
  }
  return v10;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(self);
      v11 = -[NSDictionary objectForKey:](self, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      if (v11 == a3 || objc_msgSend(a3, "isEqual:", v11))
        ++v8;
    }
    v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  }
  while (v7);
  return v8;
}

- (void)getKeys:(id *)a3
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  v6 = -[NSDictionary count](self, "count");
  if (a3 && v6 >> 61)
  {
    v7 = v6;
    v8 = _os_log_pack_size();
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)(v9 + 4) = "-[NSDictionary getKeys:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = v7;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSDictionary getKeys:]", v7);
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    objc_exception_throw(v10);
  }
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, a3, v6);
}

- (void)getObjects:(id *)a3
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSException *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  v6 = -[NSDictionary count](self, "count");
  if (a3 && v6 >> 61)
  {
    v7 = v6;
    v8 = _os_log_pack_size();
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)(v9 + 4) = "-[NSDictionary getObjects:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = v7;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSDictionary getObjects:]", v7);
    v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    objc_exception_throw(v10);
  }
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", a3, 0, v6);
}

- (id)invertedDictionary
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return +[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", -[NSDictionary allKeys](self, "allKeys"), -[NSDictionary allObjects](self, "allObjects"));
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  char v6;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[6];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSDictionary keyOfEntryWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSDictionary keyOfEntryWithOptions:passingTest:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
    objc_exception_throw(v12);
  }
  v6 = a3;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4);
  v14[0] = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__NSDictionary_keyOfEntryWithOptions_passingTest___block_invoke;
  v13[3] = &unk_1E1334408;
  v13[4] = a4;
  v13[5] = v14;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v13);
  return (id)v14[0];
}

uint64_t __50__NSDictionary_keyOfEntryWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    **(_QWORD **)(a1 + 40) = a2;
    *a4 = 1;
  }
  if (v8)
    *a4 = 1;
  return result;
}

- (id)keyOfEntryPassingTest:(id)a3
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  NSException *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v7 = _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[NSDictionary keyOfEntryPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSDictionary keyOfEntryPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return -[NSDictionary keyOfEntryWithOptions:passingTest:](self, "keyOfEntryWithOptions:passingTest:", 0, a3);
}

uint64_t __53__NSDictionary_keysOfEntriesWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
    return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 48));
  }
  return result;
}

- (NSDictionary)initWithObject:(id)a3 forKey:(id)a4
{
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6[0] = a3;
  return -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", v6, &v5, 1);
}

+ (NSDictionary)dictionaryWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  return (NSDictionary *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:copyItems:", a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSUInteger)count
{
  objc_class *v2;

  OUTLINED_FUNCTION_2_7();
  v2 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_18(v2);
}

- (id)objectForKey:(id)aKey
{
  objc_class *v3;

  OUTLINED_FUNCTION_2_7();
  v3 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_18(v3);
}

- (NSEnumerator)keyEnumerator
{
  objc_class *v2;

  OUTLINED_FUNCTION_2_7();
  v2 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_18(v2);
}

- (NSDictionary)initWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt
{
  objc_class *v5;

  OUTLINED_FUNCTION_2_7();
  v5 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_18(v5);
}

@end
