@implementation NSArray

- (id)firstObject
{
  uint64_t v2;
  id result;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  result = -[NSArray count](self, "count");
  if (result)
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", 0);
  return result;
}

- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id *v16;
  id *v17;
  id *v18;
  NSUInteger v19;
  NSUInteger v20;
  id *v21;
  id v22;
  NSArray *v23;
  NSArray *v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  double v30;
  NSException *v31;
  CFStringRef v32;
  NSException *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSException *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  NSException *v45;
  size_t v46;
  uint64_t v47;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v47 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v34 = _os_log_pack_size();
    v36 = (char *)&v46 - ((MEMORY[0x1E0C80A78](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = _os_log_pack_fill();
    *(_DWORD *)v37 = 136315138;
    *(_QWORD *)(v37 + 4) = "-[NSArray initWithArray:range:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSArray initWithArray:range:copyItems:]");
    v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
    objc_exception_throw(v38);
  }
  v10 = objc_msgSend(a3, "count");
  v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      v26 = _os_log_pack_size();
      v28 = (char *)&v46 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSArray initWithArray:range:copyItems:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v30, "-[NSArray initWithArray:range:copyItems:]", location, length);
      v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
      objc_exception_throw(v31);
    }
    v39 = _os_log_pack_size();
    v41 = (char *)&v46 - ((MEMORY[0x1E0C80A78](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    v42 = _os_log_pack_fill();
    v43 = v12 - 1;
    v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v42, (uint64_t)"-[NSArray initWithArray:range:copyItems:]", location, length, v43);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v44, "-[NSArray initWithArray:range:copyItems:]", location, length, v43);
    v45 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v41, v39);
    objc_exception_throw(v45);
  }
  if (length >> 60)
  {
    v32 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v33 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v32, 0);
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (length <= 1)
    v13 = 1;
  else
    v13 = length;
  v14 = MEMORY[0x1E0C80A78](v13, v11);
  v16 = (id *)((char *)&v46 - v15);
  v46 = 0;
  if (length >= 0x101)
  {
    v16 = (id *)_CFCreateArrayStorage(v14, 0, &v46);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v16, location, length, v46, v47);
  if (!length)
    v5 = 0;
  if (v5)
  {
    v18 = v16;
    v19 = length;
    do
    {
      *v18 = (id)objc_msgSend(*v18, "copyWithZone:", 0);
      ++v18;
      --v19;
    }
    while (v19);
  }
  if (v17)
  {
    if (length)
    {
      v20 = length;
      v21 = v17;
      do
      {
        if (((unint64_t)*v21 & 0x8000000000000000) == 0)
          v22 = *v21;
        ++v21;
        --v20;
      }
      while (v20);
    }
    v23 = -[NSArray _initByAdoptingBuffer:count:size:](self, "_initByAdoptingBuffer:count:size:", v17, length, length);
  }
  else
  {
    v23 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v16, length);
  }
  v24 = v23;
  if (v5)
  {
    do
    {

      --length;
    }
    while (length);
  }
  return v24;
}

- (BOOL)isNSArray__
{
  return 1;
}

- (id)lastObject
{
  uint64_t v2;
  id result;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  result = -[NSArray count](self, "count");
  if (result)
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", (char *)result - 1);
  return result;
}

+ (NSArray)arrayWithObjects:(id *)objects count:(NSUInteger)cnt
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:count:", objects, cnt);
}

+ (NSArray)array
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:count:", 0, 0);
}

+ (NSArray)arrayWithObject:(id)anObject
{
  return (NSArray *)(id)__createArray(objc_alloc((Class)a1), (uint64_t)anObject);
}

+ (NSArray)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSArray == a1)
    return (NSArray *)__NSArrayImmutablePlaceholder();
  if (NSMutableArray == a1)
    return (NSArray *)__NSArrayMutablePlaceholder();
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSArray;
  return (NSArray *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (unint64_t)_cfTypeID
{
  return 19;
}

- (unint64_t)hash
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  return -[NSArray count](self, "count");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return -[NSArray initWithArray:range:copyItems:](+[NSArray allocWithZone:](NSMutableArray, "allocWithZone:", a3), "initWithArray:range:copyItems:", self, 0, -[NSArray count](self, "count"), 0);
}

- (NSUInteger)indexOfObject:(id)anObject
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger result;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v15;
  while (2)
  {
    v10 = 0;
    v11 = v8 + v7;
    do
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(self);
      if (*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10) == anObject || (objc_msgSend(anObject, "isEqual:") & 1) != 0)
        return v8 + v10;
      ++v10;
    }
    while (v7 != v10);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    result = 0x7FFFFFFFFFFFFFFFLL;
    v8 = v11;
    if (v7)
      continue;
    break;
  }
  return result;
}

- (BOOL)containsObject:(id)anObject
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(self);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * i) == anObject || (objc_msgSend(anObject, "isEqual:") & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      LOBYTE(v6) = 0;
      if (v7)
        continue;
      break;
    }
  }
  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  unint64_t v6;
  unint64_t var0;
  NSUInteger v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSException *v20;
  _QWORD v21[2];

  v6 = a5;
  v21[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v14 = _os_log_pack_size();
    v16 = (char *)v21 - ((MEMORY[0x1E0C80A78](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315394;
    *(_QWORD *)(v17 + 4) = "-[NSArray countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(_QWORD *)(v17 + 14) = v6;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSArray countByEnumeratingWithState:objects:count:]", v6);
    goto LABEL_21;
  }
  if (a5 >> 61)
  {
    v14 = _os_log_pack_size();
    v16 = (char *)v21 - ((MEMORY[0x1E0C80A78](v14, v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "-[NSArray countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = v6;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSArray countByEnumeratingWithState:objects:count:]", v6);
LABEL_21:
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v16, v14);
    objc_exception_throw(v20);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  var0 = a3->var0;
  if (a3->var0 == -1)
    return 0;
  if (var0)
  {
    v11 = a3->var3[0];
  }
  else
  {
    a3->var2 = a3->var3;
    v11 = -[NSArray count](self, "count");
    a3->var3[0] = v11;
    var0 = a3->var0;
  }
  a3->var1 = a4;
  if (v11 - var0 < v6)
    v6 = v11 - var0;
  if (v6)
  {
    -[NSArray getObjects:range:](self, "getObjects:range:", a4);
    var0 = a3->var0;
  }
  v12 = var0 + v6;
  if (v11 <= var0 + v6)
    v12 = -1;
  a3->var0 = v12;
  return v6;
}

- (NSString)descriptionWithLocale:(id)locale
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return -[NSArray descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", locale, 0);
}

- (BOOL)isEqualToArray:(NSArray *)otherArray
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id *v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  NSException *v19;
  _BYTE v22[2048];
  _QWORD v23[257];

  v4 = MEMORY[0x1E0C80A78](self, a2);
  v6 = (void *)v5;
  v7 = (void *)v4;
  v23[256] = *MEMORY[0x1E0C80C00];
  if (v5 && (_NSIsNSArray(v5) & 1) == 0)
  {
    v15 = _os_log_pack_size();
    v17 = &v22[-((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSArray isEqualToArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSArray isEqualToArray:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(v7, v3, __CFTSANTagMutableArray);
  LOBYTE(v8) = v6 == v7;
  if (v6 != v7 && v6)
  {
    v9 = objc_msgSend(v7, "count");
    if (objc_msgSend(v6, "count") == v9)
    {
      if (v9)
      {
        v10 = 0;
        if (v9 >= 0x100)
          v11 = 256;
        else
          v11 = v9;
        while (1)
        {
          objc_msgSend(v7, "getObjects:range:", v23, v10, v11);
          objc_msgSend(v6, "getObjects:range:", v22, v10, v11);
          if (v11)
            break;
LABEL_17:
          v10 += v11;
          if (v9 < v10 + v11)
            v11 = v9 - v10;
          if (v9 <= v10)
            goto LABEL_20;
        }
        v12 = (id *)v22;
        v13 = (id *)v23;
        v14 = v11;
        while (1)
        {
          if (*v13 != *v12)
          {
            v8 = objc_msgSend(*v13, "isEqual:");
            if (!v8)
              break;
          }
          ++v12;
          ++v13;
          if (!--v14)
            goto LABEL_17;
        }
      }
      else
      {
LABEL_20:
        LOBYTE(v8) = 1;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return -[NSArray objectAtIndex:](self, "objectAtIndex:", idx);
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  __CFString *Mutable;
  uint64_t *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t *v21;
  CFMutableStringRef i;
  unint64_t v23;
  const __CFString *v24;
  NSString *v25;
  CFStringRef v27;
  NSException *v28;
  void *v29;
  CFAllocatorRef v30;
  uint64_t *v31;
  _QWORD v32[2];
  uint64_t (*v33)(uint64_t, void *);
  void *v34;
  _QWORD *v35;
  _QWORD v36[3];
  int v37;
  size_t v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if (level >= 0x64)
    v6 = 100;
  else
    v6 = level;
  v7 = -[NSArray count](self, "count");
  v9 = v7;
  if (v7 >> 60)
  {
    v27 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
    v28 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v27, 0);
    CFRelease(v27);
    objc_exception_throw(v28);
  }
  if (v7 <= 1)
    v7 = 1;
  v10 = MEMORY[0x1E0C80A78](v7, v8);
  v12 = (uint64_t *)((char *)&v29 - v11);
  v38[0] = 0;
  if (v9 >= 0x101)
  {
    v12 = (uint64_t *)_CFCreateArrayStorage(v10, 0, v38);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  -[NSArray getObjects:range:](self, "getObjects:range:", v12, 0, v9);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = -1;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = __40__NSArray_descriptionWithLocale_indent___block_invoke;
  v34 = &unk_1E1333D80;
  v35 = v36;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v30 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  v31 = v13;
  v29 = (void *)MEMORY[0x186DB02F4]();
  if (v9)
  {
    v15 = v12;
    v16 = v9;
    do
    {
      v17 = (void *)*v15;
      if (_NSIsNSString(*v15))
      {
        v18 = objc_msgSend(v17, "_stringRepresentation");
      }
      else if ((_NSIsNSDictionary((uint64_t)v17) & 1) != 0 || _NSIsNSArray((uint64_t)v17))
      {
        v18 = objc_msgSend(v17, "descriptionWithLocale:indent:", locale, v6 + 1, v29);
      }
      else if (_NSIsNSData((uint64_t)v17))
      {
        v18 = objc_msgSend(v17, "description");
      }
      else
      {
        v20 = objc_msgSend(v17, "description", v29);
        v18 = v33((uint64_t)v32, (void *)v20);
      }
      if (v18)
        v19 = (const __CFString *)v18;
      else
        v19 = CFSTR("(null)");
      *v15++ = (uint64_t)v19;
      --v16;
    }
    while (v16);
  }
  v21 = v31;
  for (i = CFStringCreateMutable(v30, 0); v6; --v6)
    CFStringAppend(i, CFSTR("    "));
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, CFSTR("(\n"));
  v23 = 0;
  while (v9 != v23)
  {
    CFStringAppend(Mutable, i);
    CFStringAppend(Mutable, CFSTR("    "));
    CFStringAppend(Mutable, (CFStringRef)v12[v23++]);
    if (v23 >= v9)
      v24 = CFSTR("\n");
    else
      v24 = CFSTR(",\n");
    CFStringAppend(Mutable, v24);
  }
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, CFSTR(")"));
  CFRelease(i);
  objc_autoreleasePoolPop(v29);
  v25 = Mutable;
  _Block_object_dispose(v36, 8);
  free(v21);
  return v25;
}

uint64_t __40__NSArray_descriptionWithLocale_indent___block_invoke(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == -1)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_lookUpClass("NSString") != 0;
  if (_CFExecutableLinkedOnOrAfter(6uLL) && *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return objc_msgSend(a2, "_stringRepresentation");
  else
    return (uint64_t)a2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  int v6;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3)
  {
    v6 = _NSIsNSArray((uint64_t)a3);
    if (v6)
      LOBYTE(v6) = -[NSArray isEqualToArray:](self, "isEqualToArray:", a3);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (NSString)componentsJoinedByString:(NSString *)separator
{
  uint64_t v3;
  const __CFString *v4;
  unint64_t v6;
  __CFString *Mutable;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = (const __CFString *)separator;
  v22 = *MEMORY[0x1E0C80C00];
  if (separator && (_NSIsNSString((uint64_t)separator) & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSArray componentsJoinedByString:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: string argument is not an NSString"), "-[NSArray componentsJoinedByString:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v17[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], v14);
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  if (!v4)
    v4 = &stru_1E1337B18;
  v6 = -[NSArray count](self, "count");
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(self);
        CFStringAppend(Mutable, (CFStringRef)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "description"));
        if (v10 + 1 + i < v6)
          CFStringAppend(Mutable, v4);
      }
      v10 += v9;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v9);
  }
  return (NSString *)Mutable;
}

- (NSString)description
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  return -[NSArray descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0, 0);
}

+ (NSArray)arrayWithArray:(NSArray *)array
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);
}

- (NSArray)initWithArray:(NSArray *)array copyItems:(BOOL)flag
{
  return -[NSArray initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), flag);
}

uint64_t __56__NSArray_sortedArrayFromRange_options_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3));
}

id __36__NSArray_sortedArrayUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(a2, *(SEL *)(a1 + 32));
}

- (void)getObjects:(id *)objects range:(NSRange)range
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  id *v7;
  NSUInteger v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSException *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  double v18;
  NSUInteger v19;
  uint64_t v20;
  double v21;
  NSException *v22;
  _QWORD v23[2];

  length = range.length;
  location = range.location;
  v7 = objects;
  v23[1] = *MEMORY[0x1E0C80C00];
  if (!objects && range.length)
  {
    v10 = _os_log_pack_size();
    v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[NSArray getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSArray getObjects:range:]", length);
    goto LABEL_13;
  }
  if (range.length >> 61)
  {
    v10 = _os_log_pack_size();
    v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[NSArray getObjects:range:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSArray getObjects:range:]", length);
LABEL_13:
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v14);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v19 = v9;
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSArray getObjects:range:]", location, length, --v19);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v21, "-[NSArray getObjects:range:]", location, length, v19);
    }
    else
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSArray getObjects:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v18, "-[NSArray getObjects:range:]", location, length);
    }
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v16, v15);
    objc_exception_throw(v22);
  }
  for (; length; --length)
    *v7++ = -[NSArray objectAtIndex:](self, "objectAtIndex:", location++);
}

uint64_t __44__NSArray_sortedArrayUsingFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(a2, a3, *(_QWORD *)(a1 + 40));
}

- (NSUInteger)indexOfObject:(id)obj inSortedRange:(NSRange)r options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp
{
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v14;
  NSUInteger v15;
  NSBinarySearchingOptions v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v25;
  BOOL v26;
  BOOL v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  BOOL v31;
  NSUInteger v32;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  NSException *v42;
  uint64_t v43;
  NSException *v44;
  NSUInteger v45;
  uint64_t v46;
  double v47;
  NSException *v48;
  uint64_t v49;
  NSBinarySearchingOptions v50;
  NSBinarySearchingOptions v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!obj)
  {
    v38 = _os_log_pack_size();
    v39 = (char *)&v49 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    v40 = _os_log_pack_fill();
    *(_DWORD *)v40 = 136315138;
    *(_QWORD *)(v40 + 4) = "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]");
    goto LABEL_58;
  }
  if (!cmp)
  {
    v38 = _os_log_pack_size();
    v39 = (char *)&v49 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    v41 = _os_log_pack_fill();
    *(_DWORD *)v41 = 136315138;
    *(_QWORD *)(v41 + 4) = "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]");
LABEL_58:
    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v39, v38);
    objc_exception_throw(v42);
  }
  length = r.length;
  location = r.location;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v6, __CFTSANTagMutableArray);
  v14 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0
    || (length & 0x8000000000000000) != 0
    || (v15 = location + length, v14 < location + length))
  {
    if (v14)
    {
      v45 = v14;
      v34 = _os_log_pack_size();
      v35 = (char *)&v49 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
      v46 = _os_log_pack_fill();
      v47 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v46, (uint64_t)"-[NSArray indexOfObject:inSortedRange:options:usingComparator:]", location, length, --v45);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v47, "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]", location, length, v45);
    }
    else
    {
      v34 = _os_log_pack_size();
      v35 = (char *)&v49 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
      v36 = _os_log_pack_fill();
      v37 = __os_log_helper_1_2_3_8_32_8_0_8_0(v36, (uint64_t)"-[NSArray indexOfObject:inSortedRange:options:usingComparator:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v37, "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]", location, length);
    }
    v48 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v35, v34);
    objc_exception_throw(v48);
  }
  v16 = opts & 0x300;
  if (v16 == 768)
  {
    v43 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: both NSBinarySearchingFirstEqual and NSBinarySearchingLastEqual options cannot be specified"), v43);
    v44 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v44);
  }
  if (!length)
  {
    v31 = (opts & 0x400) == 0;
    v32 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_43;
  }
  v51 = opts & 0x200;
  if (length < 0x101)
    goto LABEL_15;
  v17 = v15 - 1;
  v18 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, -[NSArray objectAtIndex:](self, "objectAtIndex:", v15 - 1), obj);
  if (v18 < 0)
  {
    v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_47:
    if ((opts & 0x400) != 0)
      return location + length;
    else
      return v17;
  }
  if (!(v18 | opts & 0x100))
    goto LABEL_47;
  v19 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, obj, -[NSArray objectAtIndex:](self, "objectAtIndex:", location));
  if (v19 < 0)
  {
    v32 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_53:
    v31 = (opts & 0x400) == 0;
LABEL_43:
    if (v31)
      return v32;
    else
      return location;
  }
  if (!(v19 | v51))
  {
    v32 = location;
    goto LABEL_53;
  }
LABEL_15:
  v50 = opts;
  v20 = flsl(length);
  v21 = 0;
  v22 = 0;
  v23 = 2 << v20;
  do
  {
    if (v23 >= 0)
      v24 = v23;
    else
      v24 = v23 + 1;
    v25 = location + (v24 >> 1);
    if (v25 < v15)
    {
      v21 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, -[NSArray objectAtIndex:](self, "objectAtIndex:", location + (v24 >> 1)), obj);
      if (!(v21 | v16))
        return v25;
      if (v21)
        v26 = 1;
      else
        v26 = v51 == 0;
      v22 |= v21 == 0;
      v27 = !v26 || v21 <= -1;
      if (v27)
        location += v24 >> 1;
    }
    v27 = v23 <= 1;
    v23 = v24 >> 1;
  }
  while (!v27);
  LODWORD(v28) = v51 != 0;
  if (v21)
    LODWORD(v28) = 0;
  if (v21 < 0)
    v28 = 1;
  else
    v28 = v28;
  v29 = location + v28;
  v30 = location + ((unint64_t)v21 >> 63);
  if ((v22 & 1) == 0)
    v30 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v50 & 0x400) != 0)
    return v29;
  else
    return v30;
}

- (void)enumerateObjectsUsingBlock:(void *)block
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
    *(_QWORD *)(v7 + 4) = "-[NSArray enumerateObjectsUsingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSArray enumerateObjectsUsingBlock:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  -[NSArray enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0, block);
}

- (id)arrayByExcludingToObjectsInArray:(id)a3
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  char *v12;
  NSSet *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t j;
  id v20;
  NSArray *v21;
  CFStringRef v23;
  NSException *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  NSException *v29;
  uint64_t v30;
  size_t v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v25 = _os_log_pack_size();
    v27 = (char *)&v30 - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136315138;
    *(_QWORD *)(v28 + 4) = "-[NSArray arrayByExcludingToObjectsInArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSArray arrayByExcludingToObjectsInArray:]");
    v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
    objc_exception_throw(v29);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v6 = -[NSArray count](self, "count");
  if (v6 >> 60)
  {
    v23 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v24 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v23, 0);
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (v6 <= 1)
    v6 = 1;
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v10 = (char *)&v30 - v9;
  v31 = 0;
  if (v11 >= 0x101)
  {
    v10 = (char *)_CFCreateArrayStorage(v8, 0, &v31);
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }
  v13 = +[NSSet setWithArray:](NSSet, "setWithArray:", a3);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = 0;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(self);
        v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (-[NSSet containsObject:](v13, "containsObject:", v18))
          *(_QWORD *)&v10[8 * v14++] = v18;
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v15);
    if (v12)
    {
      if (v14 >= 1)
      {
        for (j = 0; j != v14; ++j)
          v20 = *(id *)&v12[8 * j];
      }
      goto LABEL_26;
    }
LABEL_27:
    v21 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", v10, v14);
    return v21;
  }
  if (!v12)
    goto LABEL_27;
LABEL_26:
  v21 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v12, v14, v14);
  return v21;
}

- (id)arrayByExcludingObjectsInArray:(id)a3
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  char *v12;
  NSSet *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t j;
  id v20;
  NSArray *v21;
  CFStringRef v23;
  NSException *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  NSException *v29;
  uint64_t v30;
  size_t v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v25 = _os_log_pack_size();
    v27 = (char *)&v30 - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136315138;
    *(_QWORD *)(v28 + 4) = "-[NSArray arrayByExcludingObjectsInArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSArray arrayByExcludingObjectsInArray:]");
    v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
    objc_exception_throw(v29);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v6 = -[NSArray count](self, "count");
  if (v6 >> 60)
  {
    v23 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v24 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v23, 0);
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  if (v6 <= 1)
    v6 = 1;
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v10 = (char *)&v30 - v9;
  v31 = 0;
  if (v11 >= 0x101)
  {
    v10 = (char *)_CFCreateArrayStorage(v8, 0, &v31);
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }
  v13 = +[NSSet setWithArray:](NSSet, "setWithArray:", a3);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = 0;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(self);
        v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (!-[NSSet containsObject:](v13, "containsObject:", v18))
          *(_QWORD *)&v10[8 * v14++] = v18;
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v15);
    if (v12)
    {
      if (v14 >= 1)
      {
        for (j = 0; j != v14; ++j)
          v20 = *(id *)&v12[8 * j];
      }
      goto LABEL_26;
    }
LABEL_27:
    v21 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", v10, v14);
    return v21;
  }
  if (!v12)
    goto LABEL_27;
LABEL_26:
  v21 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v12, v14, v14);
  return v21;
}

+ (id)newArrayWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v5;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSException *v12;
  uint64_t v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    v9 = _os_log_pack_size();
    v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "+[NSArray newArrayWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "+[NSArray newArrayWithObjects:count:]", a4);
    goto LABEL_18;
  }
  if (a4 >> 61)
  {
    v9 = _os_log_pack_size();
    v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "+[NSArray newArrayWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "+[NSArray newArrayWithObjects:count:]", a4);
    goto LABEL_18;
  }
  if (a4)
  {
    v5 = 0;
    while (a3[v5])
    {
      if (a4 == ++v5)
        goto LABEL_8;
    }
    v8 = v5;
    v9 = _os_log_pack_size();
    v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v11 + 4) = "+[NSArray newArrayWithObjects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = v8;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "+[NSArray newArrayWithObjects:count:]", v8);
LABEL_18:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v10, v9);
    objc_exception_throw(v12);
  }
LABEL_8:
  if (NSArray == a1)
  {
    if (a4 == 1)
    {
      return __NSSingleObjectArrayI_new((uint64_t)*a3, 1);
    }
    else if (a4)
    {
      return __NSArrayI_new((id *)a3, 0, a4, 1);
    }
    else
    {
      return &__NSArray0__struct;
    }
  }
  else
  {
    if (NSMutableArray != a1)
    {
      v7 = __CFLookUpClass("NSArray");
      __CFRequireConcreteImplementation(v7, (uint64_t)a1);
    }
    return __NSArrayM_new(a3, a4, 1);
  }
}

- (NSArray)sortedArrayUsingFunction:(NSInteger (__cdecl *)comparator context:
{
  uint64_t v4;
  NSException *v9;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  if (!comparator)
  {
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: function pointer cannot be NULL"), context, "-[NSArray sortedArrayUsingFunction:context:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__NSArray_sortedArrayUsingFunction_context___block_invoke;
  v10[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v10[4] = comparator;
  v10[5] = context;
  return -[NSArray sortedArrayWithOptions:usingComparator:](self, "sortedArrayWithOptions:usingComparator:", 0, v10);
}

- (NSEnumerator)objectEnumerator
{
  return (NSEnumerator *)-[__NSFastEnumerationEnumerator initWithObject:]([__NSFastEnumerationEnumerator alloc], "initWithObject:", self);
}

- (NSEnumerator)reverseObjectEnumerator
{
  return (NSEnumerator *)-[__NSArrayReverseEnumerator initWithObject:]([__NSArrayReverseEnumerator alloc], "initWithObject:", self);
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(self);
        if (*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10) == anObject)
          return v8 + v10;
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSArray)sortedArrayUsingSelector:(SEL)comparator
{
  uint64_t v3;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (!comparator)
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSArray_sortedArrayUsingSelector___block_invoke;
  v7[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v7[4] = comparator;
  return -[NSArray sortedArrayWithOptions:usingComparator:](self, "sortedArrayWithOptions:usingComparator:", 0, v7);
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  uint64_t v5;
  char v7;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v15;
  char *v16;
  char *v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t i;
  id *v25;
  NSUInteger v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSException *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  double v38;
  NSException *v39;
  CFStringRef v40;
  NSException *v41;
  _QWORD v43[6];
  size_t v44;
  size_t v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v29 = _os_log_pack_size();
    v31 = (char *)&v43[-1] - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v32 = _os_log_pack_fill();
    *(_DWORD *)v32 = 136315138;
    *(_QWORD *)(v32 + 4) = "-[NSArray sortedArrayFromRange:options:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSArray sortedArrayFromRange:options:usingComparator:]");
    v33 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v31, v29);
    objc_exception_throw(v33);
  }
  v7 = a4;
  length = a3.length;
  location = a3.location;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  v11 = -[NSArray count](self, "count");
  if (!length)
    return +[NSArray array](NSArray, "array");
  v13 = v11;
  if (!v11)
    return +[NSArray array](NSArray, "array");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    v34 = _os_log_pack_size();
    v36 = (char *)&v43[-1] - ((MEMORY[0x1E0C80A78](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = _os_log_pack_fill();
    v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v37, (uint64_t)"-[NSArray sortedArrayFromRange:options:usingComparator:]", location, length, v13 - 1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v38, "-[NSArray sortedArrayFromRange:options:usingComparator:]", location, length, v13 - 1);
    v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
    objc_exception_throw(v39);
  }
  if (v11 == 1)
    return self;
  if (length == 1)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", -[NSArray objectAtIndex:](self, "objectAtIndex:", location));
  if (length >> 60)
  {
    v40 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v41 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v40, 0);
    CFRelease(v40);
    objc_exception_throw(v41);
  }
  MEMORY[0x1E0C80A78](v11, v12);
  v16 = (char *)&v43[-1] - v15;
  v45[0] = 0;
  if (length >= 0x101)
  {
    v16 = (char *)_CFCreateArrayStorage(length, 0, v45);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  v44 = 0;
  v18 = (id *)_CFCreateArrayStorage(length, 0, &v44);
  v19 = -[NSArray getObjects:range:](self, "getObjects:range:", v16, location, length);
  MEMORY[0x1E0C80A78](v19, v20);
  v22 = (char *)&v43[-1] - v21;
  v23 = (char *)&v43[-1] - v21;
  if (length > 0x1000)
    v23 = (char *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __56__NSArray_sortedArrayFromRange_options_usingComparator___block_invoke;
  v43[3] = &unk_1E12E12E0;
  v43[4] = a5;
  v43[5] = v16;
  CFSortIndexes((uint64_t)v23, length, v7, (uint64_t)v43);
  for (i = 0; i != length; ++i)
    v18[i] = *(id *)&v16[8 * *(_QWORD *)&v23[8 * i]];
  if (v22 != v23)
    free(v23);
  if ((uint64_t)length >= 1)
  {
    v25 = v18;
    v26 = length;
    do
    {
      v27 = *v25++;
      --v26;
    }
    while (v26);
  }
  v28 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v18, length, length);
  free(v17);
  return v28;
}

- (NSArray)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!cmptr)
  {
    v9 = _os_log_pack_size();
    v11 = (char *)v14 - ((MEMORY[0x1E0C80A78](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSArray sortedArrayWithOptions:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSArray sortedArrayWithOptions:usingComparator:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v9);
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  return (NSArray *)-[NSArray sortedArrayFromRange:options:usingComparator:](self, "sortedArrayFromRange:options:usingComparator:", 0, -[NSArray count](self, "count"), opts, cmptr);
}

- (NSArray)initWithObjects:(id)firstObj
{
  __objc2_class **v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  CFStringRef v9;
  NSException *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t i;
  _QWORD *v17;
  NSArray *v18;
  size_t v20;
  va_list v21;
  id v22;
  uint64_t v23;
  va_list va;

  va_start(va, firstObj);
  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = firstObj;
  v5 = __NSArrayImmutablePlaceholder();
  if (firstObj)
  {
    v7 = 0;
    va_copy(v21, va);
    do
    {
      v8 = v21;
      v21 += 8;
      ++v7;
    }
    while (*v8);
    if (v5 == (__objc2_class **)self)
    {
      va_copy(v21, va);
      return (NSArray *)__NSArrayI_new(&v22, (uint64_t *)va, v7, 0);
    }
    if (v7 >> 60)
    {
      v9 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
      v10 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v9, 0);
      CFRelease(v9);
      objc_exception_throw(v10);
    }
  }
  else
  {
    if (v5 == (__objc2_class **)self)
      return (NSArray *)&__NSArray0__struct;
    v7 = 0;
  }
  if (v7 <= 1)
    v11 = 1;
  else
    v11 = v7;
  v12 = MEMORY[0x1E0C80A78](v11, v6);
  v14 = (size_t *)((char *)&v20 - v13);
  v20 = 0;
  if (v7 >= 0x101)
  {
    v14 = _CFCreateArrayStorage(v12, 0, &v20);
    va_copy(v21, va);
    *v14 = firstObj;
    v15 = v14;
  }
  else
  {
    v15 = 0;
    if (!v7)
      goto LABEL_19;
    va_copy(v21, va);
    *v14 = firstObj;
    if (v7 == 1)
      goto LABEL_19;
  }
  for (i = 1; i != v7; ++i)
  {
    v17 = v21;
    v21 += 8;
    v14[i] = *v17;
  }
LABEL_19:
  v18 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v20, v21, v22, v23);
  free(v15);
  return v18;
}

- (NSUInteger)indexOfObjectPassingTest:(void *)predicate
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
    *(_QWORD *)(v8 + 4) = "-[NSArray indexOfObjectPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray indexOfObjectPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return -[NSArray indexOfObjectWithOptions:passingTest:](self, "indexOfObjectWithOptions:passingTest:", 0, predicate);
}

- (NSArray)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  id *v12;
  id *v13;
  unint64_t v14;
  id v15;
  NSArray *v16;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  NSException *v22;
  CFStringRef v23;
  NSException *v24;
  size_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (otherArray && (_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    v18 = _os_log_pack_size();
    v20 = (char *)&v25 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[NSArray arrayByAddingObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSArray arrayByAddingObjectsFromArray:]");
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
    objc_exception_throw(v22);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v6 = -[NSArray count](otherArray, "count");
  if (!v6)
    return self;
  v7 = v6;
  v8 = -[NSArray count](self, "count");
  v9 = v8 + v7;
  if ((v8 + v7) >> 60)
  {
    v23 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v8 + v7);
    v24 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v23, 0);
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  v10 = v8;
  v25 = 0;
  if (v9 <= 1)
    v11 = 1;
  else
    v11 = v8 + v7;
  v12 = (id *)_CFCreateArrayStorage(v11, 0, &v25);
  if (v10)
    -[NSArray getObjects:range:](self, "getObjects:range:", v12, 0, v10, v25, v26);
  -[NSArray getObjects:range:](otherArray, "getObjects:range:", &v12[v10], 0, v7, v25);
  if (v12)
  {
    if (v9)
    {
      v13 = v12;
      v14 = v9;
      do
      {
        v15 = *v13++;
        --v14;
      }
      while (v14);
    }
    v16 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v12, v9, v9);
  }
  else
  {
    v16 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v9);
  }
  return v16;
}

uint64_t __28__NSArray_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "getObjects:range:", *(_QWORD *)(a1 + 48) + 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

- (NSArray)sortedArrayUsingComparator:(NSComparator)cmptr
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSException *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!cmptr)
  {
    v7 = _os_log_pack_size();
    v9 = (char *)v12 - ((MEMORY[0x1E0C80A78](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSArray sortedArrayUsingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSArray sortedArrayUsingComparator:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v7);
    objc_exception_throw(v11);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return (NSArray *)-[NSArray sortedArrayFromRange:options:usingComparator:](self, "sortedArrayFromRange:options:usingComparator:", 0, -[NSArray count](self, "count"), 0, cmptr);
}

- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v5;
  NSEnumerationOptions v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSException *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!s)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_12;
  }
  if (!block)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
LABEL_12:
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v13);
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  v11 = opts & 0xEFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v11 = opts;
  v12 = v11 | 0x1000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v11 | 0x1000000000000000, s);
  __NSArrayEnumerate(self, (uint64_t)block, v12, s);
}

- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v4;
  NSEnumerationOptions v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  NSException *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!predicate)
  {
    v12 = _os_log_pack_size();
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[NSArray indexesOfObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray indexesOfObjectsWithOptions:passingTest:]");
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
    objc_exception_throw(v14);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v9 = opts;
  v10 = v9 | 0x4000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x4000000000000000, 0);
  return (NSIndexSet *)__NSArrayGetIndexesPassingTest(self, (uint64_t)predicate, v10, 0);
}

- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v4;
  NSEnumerationOptions v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  NSException *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!predicate)
  {
    v12 = _os_log_pack_size();
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[NSArray indexOfObjectWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray indexOfObjectWithOptions:passingTest:]");
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
    objc_exception_throw(v14);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v9 = opts;
  v10 = v9 | 0x2000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x2000000000000000, 0);
  return __NSArrayGetIndexPassingTest(self, (uint64_t)predicate, v10, 0);
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v4;
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
    *(_QWORD *)(v10 + 4) = "-[NSArray enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSArray enumerateObjectsWithOptions:usingBlock:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    objc_exception_throw(v11);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  if ((opts & 2) != 0)
    opts &= ~1uLL;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, opts, 0);
  __NSArrayEnumerate(self, (uint64_t)block, opts, 0);
}

- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  unint64_t v12;
  id *v13;
  id *v14;
  unint64_t v15;
  id v16;
  NSArray *v17;
  NSArray *v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSException *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
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
  char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  NSException *v46;
  CFStringRef v47;
  NSException *v48;
  _QWORD v50[7];
  _QWORD v51[4];
  size_t v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  if (!indexes)
  {
    v20 = _os_log_pack_size();
    v22 = (char *)&v50[-1] - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136315138;
    *(_QWORD *)(v23 + 4) = "-[NSArray objectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSArray objectsAtIndexes:]");
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
    objc_exception_throw(v24);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v25 = _os_log_pack_size();
    v27 = (char *)&v50[-1] - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136315138;
    *(_QWORD *)(v28 + 4) = "-[NSArray objectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSArray objectsAtIndexes:]");
    v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
    objc_exception_throw(v29);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v30 = _os_log_pack_size();
    v32 = (char *)&v50[-1] - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    *(_DWORD *)v33 = 136315138;
    *(_QWORD *)(v33 + 4) = "-[NSArray objectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSArray objectsAtIndexes:]");
    v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v34);
  }
  v6 = -[NSArray count](self, "count");
  v7 = objc_msgSend(0, "count");
  v8 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  v9 = v8;
  if ((v8 & 0x8000000000000000) != 0)
  {
    v10 = v7 + v6;
    goto LABEL_23;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v7 + v6;
    if (v10 <= v8)
    {
LABEL_23:
      if (!v10)
      {
        v35 = _os_log_pack_size();
        v37 = (char *)&v50[-1] - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
        v38 = _os_log_pack_fill();
        *(_DWORD *)v38 = 136315394;
        *(_QWORD *)(v38 + 4) = "-[NSArray objectsAtIndexes:]";
        *(_WORD *)(v38 + 12) = 2048;
        *(_QWORD *)(v38 + 14) = v9;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty array"), "-[NSArray objectsAtIndexes:]", v9);
        v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v37, v35);
        objc_exception_throw(v39);
      }
      v40 = _os_log_pack_size();
      v42 = (char *)&v50[-1] - ((MEMORY[0x1E0C80A78](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
      v43 = _os_log_pack_fill();
      v44 = v10 - 1;
      v45 = __os_log_helper_1_2_3_8_32_8_0_8_0(v43, (uint64_t)"-[NSArray objectsAtIndexes:]", v9, v44);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v45, "-[NSArray objectsAtIndexes:]", v9, v44);
      v46 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v42, v40);
      objc_exception_throw(v46);
    }
  }
  v11 = -[NSIndexSet count](indexes, "count");
  v12 = v11;
  if (v11 >> 60)
  {
    v47 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v11);
    v48 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v47, 0);
    CFRelease(v47);
    objc_exception_throw(v48);
  }
  v52[0] = 0;
  if (v11 <= 1)
    v11 = 1;
  v13 = (id *)_CFCreateArrayStorage(v11, 0, v52);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __28__NSArray_objectsAtIndexes___block_invoke;
  v50[3] = &unk_1E1333DD0;
  v50[5] = v51;
  v50[6] = v13;
  v50[4] = self;
  -[NSIndexSet __forwardEnumerateRanges:](indexes, "__forwardEnumerateRanges:", v50);
  if (v13)
  {
    if (v12)
    {
      v14 = v13;
      v15 = v12;
      do
      {
        v16 = *v14++;
        --v15;
      }
      while (v15);
    }
    v17 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v13, v12, v12);
  }
  else
  {
    v17 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v12);
  }
  v18 = v17;
  _Block_object_dispose(v51, 8);
  return v18;
}

- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate
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
    *(_QWORD *)(v8 + 4) = "-[NSArray indexesOfObjectsPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray indexesOfObjectsPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return -[NSArray indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", 0, predicate);
}

+ (NSArray)arrayWithObjects:(id)firstObj
{
  unint64_t v5;
  _QWORD *v6;
  CFStringRef v7;
  NSException *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t i;
  _QWORD *v15;
  id v16;
  NSArray *v17;
  NSArray *v18;
  size_t v20;
  va_list v21;
  id v22[2];
  va_list va;

  va_start(va, firstObj);
  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  v21 = 0;
  v22[0] = firstObj;
  if (firstObj)
  {
    v5 = 0;
    va_copy(v21, va);
    do
    {
      v6 = v21;
      v21 += 8;
      ++v5;
    }
    while (*v6);
    if (__NSPlaceholderArray == a1)
    {
      va_copy(v21, va);
      v17 = (NSArray *)__NSArrayI_new(v22, (uint64_t *)va, v5, 0);
      goto LABEL_21;
    }
    if (v5 >> 60)
    {
      v7 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
      v8 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v7, 0);
      CFRelease(v7);
      objc_exception_throw(v8);
    }
  }
  else
  {
    if (__NSPlaceholderArray == a1)
      return (NSArray *)&__NSArray0__struct;
    v5 = 0;
  }
  if (v5 <= 1)
    v9 = 1;
  else
    v9 = v5;
  v10 = MEMORY[0x1E0C80A78](v9, a2);
  v12 = (size_t *)((char *)&v20 - v11);
  v20 = 0;
  if (v5 >= 0x101)
  {
    v12 = _CFCreateArrayStorage(v10, 0, &v20);
    va_copy(v21, va);
    *v12 = firstObj;
    v13 = v12;
  }
  else
  {
    v13 = 0;
    if (!v5)
      goto LABEL_19;
    va_copy(v21, va);
    *v12 = firstObj;
    if (v5 == 1)
      goto LABEL_19;
  }
  for (i = 1; i != v5; ++i)
  {
    v15 = v21;
    v21 += 8;
    v12[i] = *v15;
  }
LABEL_19:
  v16 = objc_alloc((Class)a1);
  v17 = (NSArray *)objc_msgSend(v16, "initWithObjects:count:", v12, v5, v20);
  free(v13);
LABEL_21:
  v18 = v17;
  return v17;
}

- (NSArray)subarrayWithRange:(NSRange)range
{
  uint64_t v3;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  id *v8;
  uint64_t i;
  id v10;
  NSArray *v11;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  CFStringRef v19;
  NSException *v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  double v26;
  NSException *v27;
  size_t v28[2];

  length = range.length;
  location = range.location;
  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v7 < location + length)
  {
    if (!v7)
    {
      v13 = _os_log_pack_size();
      v15 = (char *)v28 - ((MEMORY[0x1E0C80A78](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSArray subarrayWithRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v17, "-[NSArray subarrayWithRange:]", location, length);
      v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v15, v13);
      objc_exception_throw(v18);
    }
    v21 = v7;
    v22 = _os_log_pack_size();
    v24 = (char *)v28 - ((MEMORY[0x1E0C80A78](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
    v25 = _os_log_pack_fill();
    v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"-[NSArray subarrayWithRange:]", location, length, --v21);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v26, "-[NSArray subarrayWithRange:]", location, length, v21);
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v24, v22);
    objc_exception_throw(v27);
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    if (length)
      goto LABEL_6;
    return +[NSArray array](NSArray, "array");
  }
  if (!length)
    return +[NSArray array](NSArray, "array");
LABEL_6:
  if (length >> 60)
  {
    v19 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v20 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v19, 0);
    CFRelease(v19);
    objc_exception_throw(v20);
  }
  v28[0] = 0;
  v8 = (id *)_CFCreateArrayStorage(length, 0, v28);
  -[NSArray getObjects:range:](self, "getObjects:range:", v8, location, length);
  if (v8)
  {
    for (i = 0; i != length; ++i)
      v10 = v8[i];
    v11 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v8, length, length);
  }
  else
  {
    v11 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, length);
  }
  return v11;
}

- (NSArray)arrayByAddingObject:(id)anObject
{
  uint64_t v3;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id *v10;
  id *v11;
  unint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSException *v19;
  CFStringRef v20;
  NSException *v21;
  size_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!anObject)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)&v22 - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSArray arrayByAddingObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSArray arrayByAddingObject:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v6 = -[NSArray count](self, "count");
  v7 = v6 + 1;
  if ((v6 + 1) >> 60)
  {
    v20 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6 + 1);
    v21 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v20, 0);
    CFRelease(v20);
    objc_exception_throw(v21);
  }
  v8 = v6;
  v22 = 0;
  if (v7 <= 1)
    v9 = 1;
  else
    v9 = v6 + 1;
  v10 = (id *)_CFCreateArrayStorage(v9, 0, &v22);
  -[NSArray getObjects:range:](self, "getObjects:range:", v10, 0, v8, v22, v23);
  v10[v8] = anObject;
  if (v8 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v11 = v10;
    v12 = v7;
    do
    {
      v13 = *v11++;
      --v12;
    }
    while (v12);
  }
  return (NSArray *)-[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v10, v7, v7);
}

- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument
{
  uint64_t v4;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!aSelector)
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v8 = -[NSArray count](self, "count");
  if (v8 > 0x80)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(self);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "performSelector:withObject:", aSelector, argument);
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      }
      while (v16);
    }
  }
  else
  {
    v10 = v8;
    v11 = MEMORY[0x1E0C80A78](v8, v9);
    v13 = (void **)&v19[-v12];
    if (v11)
    {
      v14 = 0;
      do
      {
        v13[v14] = -[NSArray objectAtIndex:](self, "objectAtIndex:", v14);
        ++v14;
      }
      while (v10 != v14);
      for (; v10; --v10)
      {
        v15 = *v13++;
        objc_msgSend(v15, "performSelector:withObject:", aSelector, argument);
      }
    }
  }
}

- (void)makeObjectsPerformSelector:(SEL)aSelector
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!aSelector)
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v6 = -[NSArray count](self, "count");
  if (v6 > 0x80)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(self);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "performSelector:", aSelector);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      }
      while (v14);
    }
  }
  else
  {
    v8 = v6;
    v9 = MEMORY[0x1E0C80A78](v6, v7);
    v11 = (void **)&v17[-v10];
    if (v9)
    {
      v12 = 0;
      do
      {
        v11[v12] = -[NSArray objectAtIndex:](self, "objectAtIndex:", v12);
        ++v12;
      }
      while (v8 != v12);
      for (; v8; --v8)
      {
        v13 = *v11++;
        objc_msgSend(v13, "performSelector:", aSelector);
      }
    }
  }
}

- (id)arrayByApplyingSelector:(SEL)a3
{
  uint64_t v3;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t j;
  id v19;
  NSArray *v20;
  CFStringRef v22;
  NSException *v23;
  uint64_t v24;
  size_t v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v6 = -[NSArray count](self, "count");
  if (v6 >> 60)
  {
    v22 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v22, 0);
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (v6 <= 1)
    v6 = 1;
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v10 = (char *)&v24 - v9;
  v25 = 0;
  if (v11 >= 0x101)
  {
    v10 = (char *)_CFCreateArrayStorage(v8, 0, &v25);
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = 0;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(self);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "performSelector:", a3);
        if (v17)
          *(_QWORD *)&v10[8 * v13++] = v17;
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v14);
    if (v12)
    {
      if (v13 >= 1)
      {
        for (j = 0; j != v13; ++j)
          v19 = *(id *)&v12[8 * j];
      }
      goto LABEL_26;
    }
LABEL_27:
    v20 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", v10, v13);
    return v20;
  }
  if (!v12)
    goto LABEL_27;
LABEL_26:
  v20 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v12, v13, v13);
  return v20;
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger i;
  id v13;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  NSException *v22;
  _QWORD v23[2];

  length = range.length;
  location = range.location;
  v23[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = v10 - 1;
      v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[NSArray indexOfObject:inRange:]", location, length, v20);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v21, "-[NSArray indexOfObject:inRange:]", location, length, v20);
    }
    else
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSArray indexOfObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v18, "-[NSArray indexOfObject:inRange:]", location, length);
    }
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v16, v15);
    objc_exception_throw(v22);
  }
  if (!length)
    return 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0;
  for (i = location; ; ++i)
  {
    v13 = -[NSArray objectAtIndex:](self, "objectAtIndex:", i);
    if (v13 == anObject)
      break;
    if (objc_msgSend(anObject, "isEqual:", v13))
      return i;
    ++v11;
    if (!--length)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v11 + location;
}

- (NSArray)initWithObject:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  return -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v4, 1);
}

- (void)getObjects:(id *)objects
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v6 = -[NSArray count](self, "count");
  if (!objects && v6)
  {
    v7 = v6;
    v8 = _os_log_pack_size();
    v10 = (char *)v16 - ((MEMORY[0x1E0C80A78](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v11 + 4) = "-[NSArray getObjects:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = v7;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSArray getObjects:]", v7);
    goto LABEL_9;
  }
  if (v6 >> 61)
  {
    v12 = v6;
    v8 = _os_log_pack_size();
    v10 = (char *)v16 - ((MEMORY[0x1E0C80A78](v8, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[NSArray getObjects:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = v12;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSArray getObjects:]", v12);
LABEL_9:
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v10, v8);
    objc_exception_throw(v15);
  }
  -[NSArray getObjects:range:](self, "getObjects:range:", objects, 0, -[NSArray count](self, "count"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return -[NSArray initWithArray:range:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:range:copyItems:", self, 0, -[NSArray count](self, "count"), __NSCollectionsShouldCopy());
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
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  v4 = -[NSArray count](self, "count");
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
  -[NSArray getObjects:range:](self, "getObjects:range:", v6, 0, v5);
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

- (BOOL)containsObject:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  id v10;
  id v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  double v18;
  NSUInteger v19;
  uint64_t v20;
  double v21;
  NSException *v22;
  _QWORD v23[2];

  length = a4.length;
  location = a4.location;
  v23[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v19 = v9;
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSArray containsObject:inRange:]", location, length, --v19);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v21, "-[NSArray containsObject:inRange:]", location, length, v19);
    }
    else
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSArray containsObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v18, "-[NSArray containsObject:inRange:]", location, length);
    }
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v16, v15);
    objc_exception_throw(v22);
  }
  if (length)
  {
    v10 = -[NSArray objectAtIndex:](self, "objectAtIndex:", location);
    if (v10 == a3)
    {
      return 1;
    }
    else
    {
      v11 = v10;
      v12 = 1;
      v13 = 1;
      do
      {
        if (objc_msgSend(a3, "isEqual:", v11))
          break;
        v13 = v12 < length;
        if (length == v12)
          break;
        v11 = -[NSArray objectAtIndex:](self, "objectAtIndex:", location + v12++);
      }
      while (v11 != a3);
    }
  }
  else
  {
    return 0;
  }
  return v13;
}

- (BOOL)containsObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  id v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  double v17;
  NSUInteger v18;
  uint64_t v19;
  double v20;
  NSException *v21;
  _QWORD v22[2];

  length = a4.length;
  location = a4.location;
  v22[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v18 = v9;
      v14 = _os_log_pack_size();
      v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = _os_log_pack_fill();
      v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v19, (uint64_t)"-[NSArray containsObjectIdenticalTo:inRange:]", location, length, --v18);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v20, "-[NSArray containsObjectIdenticalTo:inRange:]", location, length, v18);
    }
    else
    {
      v14 = _os_log_pack_size();
      v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSArray containsObjectIdenticalTo:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v17, "-[NSArray containsObjectIdenticalTo:inRange:]", location, length);
    }
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v21);
  }
  if (!length)
    return 0;
  if (-[NSArray objectAtIndex:](self, "objectAtIndex:", location) == a3)
    return 1;
  v10 = 1;
  do
  {
    v11 = v10;
    if (length == v10)
      break;
    v12 = -[NSArray objectAtIndex:](self, "objectAtIndex:", location + v10);
    v10 = v11 + 1;
  }
  while (v12 != a3);
  return v11 < length;
}

- (BOOL)containsObjectIdenticalTo:(id)a3
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(self);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9) == a3)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t i;
  id v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  NSException *v21;
  _QWORD v22[2];

  length = a4.length;
  location = a4.location;
  v22[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  v10 = v9;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v14 = _os_log_pack_size();
      v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = _os_log_pack_fill();
      v19 = v10 - 1;
      v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v18, (uint64_t)"-[NSArray countForObject:inRange:]", location, length, v19);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v20, "-[NSArray countForObject:inRange:]", location, length, v19);
    }
    else
    {
      v14 = _os_log_pack_size();
      v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSArray countForObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v17, "-[NSArray countForObject:inRange:]", location, length);
    }
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v21);
  }
  for (i = 0; length; --length)
  {
    v12 = -[NSArray objectAtIndex:](self, "objectAtIndex:", location);
    if (v12 == a3 || objc_msgSend(a3, "isEqual:", v12))
      ++i;
    ++location;
  }
  return i;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(self);
      if (*(id *)(*((_QWORD *)&v13 + 1) + 8 * i) == a3 || objc_msgSend(a3, "isEqual:"))
        ++v8;
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  }
  while (v7);
  return v8;
}

- (id)firstObjectCommonWithArray:(NSArray *)otherArray
{
  uint64_t v3;
  NSSet *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  NSException *v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    if (!otherArray)
      goto LABEL_4;
  }
  else if (!otherArray)
  {
    goto LABEL_4;
  }
  if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSArray firstObjectCommonWithArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSArray firstObjectCommonWithArray:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
LABEL_4:
  v6 = +[NSSet setWithArray:](NSSet, "setWithArray:", otherArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v18;
LABEL_6:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v9)
      objc_enumerationMutation(self);
    v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
    if (-[NSSet containsObject:](v6, "containsObject:", v11))
      return v11;
    if (v8 == ++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      if (v8)
        goto LABEL_6;
      return 0;
    }
  }
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  NSUInteger v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  _QWORD v19[2];

  length = range.length;
  location = range.location;
  v19[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v15 = v9;
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v16, (uint64_t)"-[NSArray indexOfObjectIdenticalTo:inRange:]", location, length, --v15);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v17, "-[NSArray indexOfObjectIdenticalTo:inRange:]", location, length, v15);
    }
    else
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSArray indexOfObjectIdenticalTo:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v14, "-[NSArray indexOfObjectIdenticalTo:inRange:]", location, length);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v18);
  }
  if (!length)
    return 0x7FFFFFFFFFFFFFFFLL;
  while (-[NSArray objectAtIndex:](self, "objectAtIndex:", location) != anObject)
  {
    ++location;
    if (!--length)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return location;
}

- (id)indexesOfObject:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  NSUInteger v16;
  uint64_t v17;
  double v18;
  NSException *v19;
  _QWORD v20[6];

  length = a4.length;
  location = a4.location;
  v20[5] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v16 = v9;
      v12 = _os_log_pack_size();
      v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSArray indexesOfObject:inRange:]", location, length, --v16);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v18, "-[NSArray indexesOfObject:inRange:]", location, length, v16);
    }
    else
    {
      v12 = _os_log_pack_size();
      v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v14 = _os_log_pack_fill();
      v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSArray indexesOfObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v15, "-[NSArray indexesOfObject:inRange:]", location, length);
    }
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v19);
  }
  v10 = -[objc_class indexSetWithIndexesInRange:](__CFLookUpClass("NSIndexSet"), "indexSetWithIndexesInRange:", location, length);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __35__NSArray_indexesOfObject_inRange___block_invoke;
  v20[3] = &unk_1E1333DA8;
  v20[4] = a3;
  return -[NSArray indexesOfObjectsAtIndexes:options:passingTest:](self, "indexesOfObjectsAtIndexes:options:passingTest:", v10, 0, v20);
}

uint64_t __35__NSArray_indexesOfObject_inRange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2 == a2)
    return 1;
  else
    return objc_msgSend(v2, "isEqual:", a2);
}

- (id)indexesOfObject:(id)a3
{
  uint64_t v3;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__NSArray_indexesOfObject___block_invoke;
  v7[3] = &unk_1E1333DA8;
  v7[4] = a3;
  return -[NSArray indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", 0, v7);
}

uint64_t __27__NSArray_indexesOfObject___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2 == a2)
    return 1;
  else
    return objc_msgSend(v2, "isEqual:", a2);
}

- (id)indexesOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  NSUInteger v16;
  uint64_t v17;
  double v18;
  NSException *v19;
  _QWORD v20[6];

  length = a4.length;
  location = a4.location;
  v20[5] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v16 = v9;
      v12 = _os_log_pack_size();
      v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSArray indexesOfObjectIdenticalTo:inRange:]", location, length, --v16);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v18, "-[NSArray indexesOfObjectIdenticalTo:inRange:]", location, length, v16);
    }
    else
    {
      v12 = _os_log_pack_size();
      v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v14 = _os_log_pack_fill();
      v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSArray indexesOfObjectIdenticalTo:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v15, "-[NSArray indexesOfObjectIdenticalTo:inRange:]", location, length);
    }
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v19);
  }
  v10 = -[objc_class indexSetWithIndexesInRange:](__CFLookUpClass("NSIndexSet"), "indexSetWithIndexesInRange:", location, length);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__NSArray_indexesOfObjectIdenticalTo_inRange___block_invoke;
  v20[3] = &unk_1E1333DA8;
  v20[4] = a3;
  return -[NSArray indexesOfObjectsAtIndexes:options:passingTest:](self, "indexesOfObjectsAtIndexes:options:passingTest:", v10, 0, v20);
}

BOOL __46__NSArray_indexesOfObjectIdenticalTo_inRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (id)indexesOfObjectIdenticalTo:(id)a3
{
  uint64_t v3;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__NSArray_indexesOfObjectIdenticalTo___block_invoke;
  v7[3] = &unk_1E1333DA8;
  v7[4] = a3;
  return -[NSArray indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", 0, v7);
}

BOOL __38__NSArray_indexesOfObjectIdenticalTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v5;
  NSEnumerationOptions v11;
  uint64_t v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSException *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!s)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if (!predicate)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
LABEL_12:
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  v11 = opts & 0xCFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v11 = opts;
  v12 = v11 | 0x3000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x3000000000000000, s);
  return __NSArrayGetIndexPassingTest(self, (uint64_t)predicate, v12, s);
}

- (NSIndexSet)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v5;
  NSEnumerationOptions v11;
  uint64_t v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSException *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!s)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if (!predicate)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
LABEL_12:
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  v11 = opts & 0xAFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v11 = opts;
  v12 = v11 | 0x5000000000000000;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x5000000000000000, s);
  return (NSIndexSet *)__NSArrayGetIndexesPassingTest(self, (uint64_t)predicate, v12, s);
}

- (id)objectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  uint64_t v5;
  NSUInteger v10;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSArray objectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSArray objectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if (!a5)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray objectAtIndexes:options:passingTest:]");
LABEL_12:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v17);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  v10 = -[NSArray indexOfObjectAtIndexes:options:passingTest:](self, "indexOfObjectAtIndexes:options:passingTest:", a3, a4, a5);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", v10);
}

- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  NSUInteger v8;
  uint64_t v10;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v10 = _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSArray objectWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray objectWithOptions:passingTest:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
    objc_exception_throw(v12);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  v8 = -[NSArray indexOfObjectWithOptions:passingTest:](self, "indexOfObjectWithOptions:passingTest:", a3, a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", v8);
}

- (id)objectPassingTest:(id)a3
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
    *(_QWORD *)(v8 + 4) = "-[NSArray objectPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray objectPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return -[NSArray objectWithOptions:passingTest:](self, "objectWithOptions:passingTest:", 0, a3);
}

- (id)objectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  uint64_t v5;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSArray objectsAtIndexes:options:passingTest:]");
    goto LABEL_10;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSArray objectsAtIndexes:options:passingTest:]");
    goto LABEL_10;
  }
  if (!a5)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray objectsAtIndexes:options:passingTest:]");
LABEL_10:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  return -[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", -[NSArray indexesOfObjectsAtIndexes:options:passingTest:](self, "indexesOfObjectsAtIndexes:options:passingTest:", a3, a4, a5));
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v9 = _os_log_pack_size();
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[NSArray objectsWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray objectsWithOptions:passingTest:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    objc_exception_throw(v11);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  return -[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", -[NSArray indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", a3, a4));
}

- (id)objectsPassingTest:(id)a3
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
    *(_QWORD *)(v8 + 4) = "-[NSArray objectsPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSArray objectsPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return -[NSArray objectsWithOptions:passingTest:](self, "objectsWithOptions:passingTest:", 0, a3);
}

- (id)reversedArray
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  return -[__NSArrayReversed initWithArray:]([__NSArrayReversed alloc], "initWithArray:", self);
}

- (NSArray)initWithArray:(NSArray *)array
{
  return -[NSArray initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);
}

- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSArray initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSArray)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id *v12;
  id *v13;
  id *v14;
  unint64_t v15;
  unint64_t v16;
  id *v17;
  id v18;
  NSArray *v19;
  NSArray *v20;
  CFStringRef v22;
  NSException *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSException *v28;
  size_t v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    v24 = _os_log_pack_size();
    v26 = (char *)&v29 - ((MEMORY[0x1E0C80A78](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)(v27 + 4) = "-[NSArray initWithSet:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSArray initWithSet:copyItems:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
  v7 = objc_msgSend(a3, "count");
  v9 = v7;
  if (v7 >> 60)
  {
    v22 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
    v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v22, 0);
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  if (v7 <= 1)
    v7 = 1;
  v10 = MEMORY[0x1E0C80A78](v7, v8);
  v12 = (id *)((char *)&v29 - v11);
  v29 = 0;
  if (v9 >= 0x101)
  {
    v12 = (id *)_CFCreateArrayStorage(v10, 0, &v29);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a3, "getObjects:count:", v12, v9, v29, v30);
  if (!v9)
    v4 = 0;
  if (v4)
  {
    v14 = v12;
    v15 = v9;
    do
    {
      *v14 = (id)objc_msgSend(*v14, "copyWithZone:", 0);
      ++v14;
      --v15;
    }
    while (v15);
  }
  if (v13)
  {
    if (v9)
    {
      v16 = v9;
      v17 = v13;
      do
      {
        if (((unint64_t)*v17 & 0x8000000000000000) == 0)
          v18 = *v17;
        ++v17;
        --v16;
      }
      while (v16);
    }
    v19 = -[NSArray _initByAdoptingBuffer:count:size:](self, "_initByAdoptingBuffer:count:size:", v13, v9, v9);
  }
  else
  {
    v19 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v12, v9);
  }
  v20 = v19;
  if (v4)
  {
    do
    {

      --v9;
    }
    while (v9);
  }
  return v20;
}

- (NSArray)initWithSet:(id)a3
{
  return -[NSArray initWithSet:copyItems:](self, "initWithSet:copyItems:", a3, 0);
}

- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id *v16;
  id *v17;
  id *v18;
  NSUInteger v19;
  NSUInteger v20;
  id *v21;
  id v22;
  NSArray *v23;
  NSArray *v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  double v30;
  NSException *v31;
  CFStringRef v32;
  NSException *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSException *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  NSException *v45;
  size_t v46;
  uint64_t v47;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v47 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v34 = _os_log_pack_size();
    v36 = (char *)&v46 - ((MEMORY[0x1E0C80A78](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = _os_log_pack_fill();
    *(_DWORD *)v37 = 136315138;
    *(_QWORD *)(v37 + 4) = "-[NSArray initWithOrderedSet:range:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSArray initWithOrderedSet:range:copyItems:]");
    v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
    objc_exception_throw(v38);
  }
  v10 = objc_msgSend(a3, "count");
  v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      v26 = _os_log_pack_size();
      v28 = (char *)&v46 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[NSArray initWithOrderedSet:range:copyItems:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v30, "-[NSArray initWithOrderedSet:range:copyItems:]", location, length);
      v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
      objc_exception_throw(v31);
    }
    v39 = _os_log_pack_size();
    v41 = (char *)&v46 - ((MEMORY[0x1E0C80A78](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
    v42 = _os_log_pack_fill();
    v43 = v12 - 1;
    v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v42, (uint64_t)"-[NSArray initWithOrderedSet:range:copyItems:]", location, length, v43);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v44, "-[NSArray initWithOrderedSet:range:copyItems:]", location, length, v43);
    v45 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v41, v39);
    objc_exception_throw(v45);
  }
  if (length >> 60)
  {
    v32 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v33 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v32, 0);
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (length <= 1)
    v13 = 1;
  else
    v13 = length;
  v14 = MEMORY[0x1E0C80A78](v13, v11);
  v16 = (id *)((char *)&v46 - v15);
  v46 = 0;
  if (length >= 0x101)
  {
    v16 = (id *)_CFCreateArrayStorage(v14, 0, &v46);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v16, location, length, v46, v47);
  if (!length)
    v5 = 0;
  if (v5)
  {
    v18 = v16;
    v19 = length;
    do
    {
      *v18 = (id)objc_msgSend(*v18, "copyWithZone:", 0);
      ++v18;
      --v19;
    }
    while (v19);
  }
  if (v17)
  {
    if (length)
    {
      v20 = length;
      v21 = v17;
      do
      {
        if (((unint64_t)*v21 & 0x8000000000000000) == 0)
          v22 = *v21;
        ++v21;
        --v20;
      }
      while (v20);
    }
    v23 = -[NSArray _initByAdoptingBuffer:count:size:](self, "_initByAdoptingBuffer:count:size:", v17, length, length);
  }
  else
  {
    v23 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v16, length);
  }
  v24 = v23;
  if (v5)
  {
    do
    {

      --length;
    }
    while (length);
  }
  return v24;
}

- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSArray initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSArray)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return -[NSArray initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

- (NSArray)initWithOrderedSet:(id)a3
{
  return -[NSArray initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), 0);
}

- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5
{
  unint64_t v5;
  NSArray *v7;
  id *v8;
  void *v9;

  v5 = a4;
  v7 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", a3, a4, a5);
  if (v5)
  {
    v8 = a3;
    do
    {
      v9 = *v8++;

      --v5;
    }
    while (v5);
  }
  free(a3);
  return v7;
}

+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, a5);
}

+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

+ (NSArray)arrayWithArray:(id)a3 copyItems:(BOOL)a4
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, a5);
}

+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

+ (NSArray)arrayWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

+ (NSArray)arrayWithOrderedSet:(id)a3
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), 0);
}

+ (NSArray)arrayWithSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSet:copyItems:", a3, a4);
}

+ (NSArray)arrayWithSet:(id)a3
{
  return (NSArray *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSet:copyItems:", a3, 0);
}

- (NSArray)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSUInteger)count
{
  objc_class *v2;

  v2 = __CFLookUpClass("NSArray");
  OUTLINED_FUNCTION_0_15(v2);
}

- (id)objectAtIndex:(NSUInteger)index
{
  objc_class *v3;

  v3 = __CFLookUpClass("NSArray");
  OUTLINED_FUNCTION_0_15(v3);
}

- (NSArray)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  objc_class *v4;

  v4 = __CFLookUpClass("NSArray");
  OUTLINED_FUNCTION_0_15(v4);
}

@end
