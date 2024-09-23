@implementation NSOrderedSet

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set
{
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", set, 0, -[NSOrderedSet count](set, "count"), 0);
}

- (id)firstObject
{
  uint64_t v2;
  id result;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  result = -[NSOrderedSet count](self, "count");
  if (result)
    return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", 0);
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  unint64_t v6;
  unint64_t var0;
  unint64_t *var3;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSException *v21;
  _QWORD v22[2];

  v6 = a5;
  v22[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v22 - ((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315394;
    *(_QWORD *)(v18 + 4) = "-[NSOrderedSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(_QWORD *)(v18 + 14) = v6;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSOrderedSet countByEnumeratingWithState:objects:count:]", v6);
    goto LABEL_21;
  }
  if (a5 >> 61)
  {
    v15 = _os_log_pack_size();
    v17 = (char *)v22 - ((MEMORY[0x1E0C80A78](v15, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = _os_log_pack_fill();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)(v20 + 4) = "-[NSOrderedSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(_QWORD *)(v20 + 14) = v6;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSOrderedSet countByEnumeratingWithState:objects:count:]", v6);
LABEL_21:
    v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v21);
  }
  var0 = a3->var0;
  if (a3->var0 == -1)
    return 0;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
    var0 = a3->var0;
  }
  var3 = a3->var3;
  if (var0)
  {
    v12 = *var3;
  }
  else
  {
    a3->var2 = var3;
    v12 = -[NSOrderedSet count](self, "count");
    a3->var3[0] = v12;
    var0 = a3->var0;
  }
  a3->var1 = a4;
  if (v12 - var0 < v6)
    v6 = v12 - var0;
  if (v6)
  {
    -[NSOrderedSet getObjects:range:](self, "getObjects:range:", a4);
    var0 = a3->var0;
  }
  v13 = var0 + v6;
  if (v12 <= var0 + v6)
    v13 = -1;
  a3->var0 = v13;
  return v6;
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
    *(_QWORD *)(v12 + 4) = "-[NSOrderedSet getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSOrderedSet getObjects:range:]", length);
    goto LABEL_14;
  }
  if (range.length >> 61)
  {
    v10 = _os_log_pack_size();
    v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "-[NSOrderedSet getObjects:range:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSOrderedSet getObjects:range:]", length);
LABEL_14:
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v10);
    objc_exception_throw(v14);
  }
  v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v19 = v9;
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = _os_log_pack_fill();
      v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v20, (uint64_t)"-[NSOrderedSet getObjects:range:]", location, length, --v19);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v21, "-[NSOrderedSet getObjects:range:]", location, length, v19);
    }
    else
    {
      v15 = _os_log_pack_size();
      v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSOrderedSet getObjects:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v18, "-[NSOrderedSet getObjects:range:]", location, length);
    }
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v16, v15);
    objc_exception_throw(v22);
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!length)
      return;
  }
  else if (!length)
  {
    return;
  }
  do
  {
    *v7++ = -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", location++);
    --length;
  }
  while (length);
}

- (NSOrderedSet)reversedOrderedSet
{
  return (NSOrderedSet *)-[__NSOrderedSetReversed initWithOrderedSet:]([__NSOrderedSetReversed alloc], "initWithOrderedSet:", self);
}

- (NSSet)set
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  return (NSSet *)-[__NSOrderedSetSetProxy initWithOrderedSet:]([__NSOrderedSetSetProxy alloc], "initWithOrderedSet:", self);
}

- (NSArray)array
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  return (NSArray *)-[__NSOrderedSetArrayProxy initWithOrderedSet:]([__NSOrderedSetArrayProxy alloc], "initWithOrderedSet:", self);
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", idx);
}

- (NSEnumerator)reverseObjectEnumerator
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  return (NSEnumerator *)-[__NSOrderedSetReverseEnumerator initWithObject:]([__NSOrderedSetReverseEnumerator alloc], "initWithObject:", self);
}

- (NSEnumerator)objectEnumerator
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  return (NSEnumerator *)-[__NSFastEnumerationEnumerator initWithObject:]([__NSFastEnumerationEnumerator alloc], "initWithObject:", self);
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet indexOfObject:](self, "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsObject:(id)object
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet indexOfObject:](self, "indexOfObject:", object) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (NSOrderedSet)orderedSetWithObjects:(id *)objects count:(NSUInteger)cnt
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:count:", objects, cnt);
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", set, range.location, range.length, flag);
}

- (NSOrderedSet)initWithArray:(NSArray *)array
{
  return -[NSOrderedSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);
}

+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSet:copyItems:", set, 0);
}

- (NSOrderedSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  _BOOL4 v4;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id *v12;
  id *v13;
  id *v14;
  unint64_t v15;
  NSOrderedSet *v16;
  CFStringRef v18;
  NSException *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSException *v24;
  size_t v25;
  uint64_t v26;

  v4 = flag;
  v26 = *MEMORY[0x1E0C80C00];
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    v20 = _os_log_pack_size();
    v22 = (char *)&v25 - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136315138;
    *(_QWORD *)(v23 + 4) = "-[NSOrderedSet initWithSet:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSOrderedSet initWithSet:copyItems:]");
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
    objc_exception_throw(v24);
  }
  v7 = -[NSSet count](set, "count");
  v9 = v7;
  if (v7 >> 60)
  {
    v18 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
    v19 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v18, 0);
    CFRelease(v18);
    objc_exception_throw(v19);
  }
  if (v7 <= 1)
    v7 = 1;
  v10 = MEMORY[0x1E0C80A78](v7, v8);
  v12 = (id *)((char *)&v25 - v11);
  v25 = 0;
  if (v9 >= 0x101)
  {
    v12 = (id *)_CFCreateArrayStorage(v10, 0, &v25);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  -[NSSet getObjects:count:](set, "getObjects:count:", v12, v9, v25, v26);
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
  v16 = -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:", v12, v9);
  if (v4)
  {
    do
    {

      --v9;
    }
    while (v9);
  }
  free(v13);
  return v16;
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  __CFString *Mutable;
  uint64_t *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t *v19;
  CFMutableStringRef i;
  unint64_t v21;
  const __CFString *v22;
  NSString *v23;
  CFStringRef v25;
  NSException *v26;
  uint64_t v27;
  void *v28;
  CFAllocatorRef v29;
  uint64_t *v30;
  char *v31;
  id v32;
  size_t v33[2];

  v32 = locale;
  v33[1] = *MEMORY[0x1E0C80C00];
  if (level >= 0x64)
    v5 = 100;
  else
    v5 = level;
  v6 = -[NSOrderedSet count](self, "count");
  v8 = v6;
  if (v6 >> 60)
  {
    v25 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v26 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v25, 0);
    CFRelease(v25);
    objc_exception_throw(v26);
  }
  if (v6 <= 1)
    v6 = 1;
  v9 = MEMORY[0x1E0C80A78](v6, v7);
  v11 = (uint64_t *)((char *)&v27 - v10);
  v33[0] = 0;
  if (v8 >= 0x101)
  {
    v11 = (uint64_t *)_CFCreateArrayStorage(v9, 0, v33);
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v11, 0, v8);
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v29 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  v30 = v12;
  v28 = (void *)MEMORY[0x186DB02F4]();
  if (v8)
  {
    v31 = sel_descriptionWithLocale_;
    v14 = v11;
    v15 = v8;
    do
    {
      v16 = (void *)*v14;
      if (_NSIsNSString(*v14))
      {
        v17 = objc_msgSend(v16, "_stringRepresentation");
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "descriptionWithLocale:indent:", v32, v5 + 1);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "descriptionWithLocale:", v32);
      }
      else
      {
        v17 = objc_msgSend(v16, "description");
      }
      if (v17)
        v18 = (const __CFString *)v17;
      else
        v18 = CFSTR("(null)");
      *v14++ = (uint64_t)v18;
      --v15;
    }
    while (v15);
  }
  v19 = v30;
  for (i = CFStringCreateMutable(v29, 0); v5; --v5)
    CFStringAppend(i, CFSTR("    "));
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, CFSTR("{(\n"));
  v21 = 0;
  while (v8 != v21)
  {
    CFStringAppend(Mutable, i);
    CFStringAppend(Mutable, CFSTR("    "));
    CFStringAppend(Mutable, (CFStringRef)v11[v21++]);
    if (v21 >= v8)
      v22 = CFSTR("\n");
    else
      v22 = CFSTR(",\n");
    CFStringAppend(Mutable, v22);
  }
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, CFSTR(")}"));
  CFRelease(i);
  objc_autoreleasePoolPop(v28);
  v23 = Mutable;
  free(v19);
  return v23;
}

- (id)lastObject
{
  uint64_t v2;
  id result;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  result = -[NSOrderedSet count](self, "count");
  if (result)
    return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", (char *)result - 1);
  return result;
}

+ (NSOrderedSet)orderedSetWithObject:(id)object
{
  return (NSOrderedSet *)(id)__createOrderedSet(objc_alloc((Class)a1), (uint64_t)object);
}

+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);
}

- (NSOrderedSet)initWithArray:(NSArray *)set range:(NSRange)range copyItems:(BOOL)flag
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id *v16;
  id *v17;
  id *v18;
  NSUInteger v19;
  NSOrderedSet *v20;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  double v26;
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
  uint64_t v39;
  double v40;
  NSException *v41;
  size_t v42;
  uint64_t v43;

  v5 = flag;
  length = range.length;
  location = range.location;
  v43 = *MEMORY[0x1E0C80C00];
  if (set && (_NSIsNSArray((uint64_t)set) & 1) == 0)
  {
    v30 = _os_log_pack_size();
    v32 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    *(_DWORD *)v33 = 136315138;
    *(_QWORD *)(v33 + 4) = "-[NSOrderedSet initWithArray:range:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSOrderedSet initWithArray:range:copyItems:]");
    v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v34);
  }
  v10 = -[NSArray count](set, "count");
  v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      v22 = _os_log_pack_size();
      v24 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      v25 = _os_log_pack_fill();
      v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSOrderedSet initWithArray:range:copyItems:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v26, "-[NSOrderedSet initWithArray:range:copyItems:]", location, length);
      v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v24, v22);
      objc_exception_throw(v27);
    }
    v35 = _os_log_pack_size();
    v37 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    v39 = v12 - 1;
    v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v38, (uint64_t)"-[NSOrderedSet initWithArray:range:copyItems:]", location, length, v39);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v40, "-[NSOrderedSet initWithArray:range:copyItems:]", location, length, v39);
    v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v37, v35);
    objc_exception_throw(v41);
  }
  if (length >> 60)
  {
    v28 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v29 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v28, 0);
    CFRelease(v28);
    objc_exception_throw(v29);
  }
  if (length <= 1)
    v13 = 1;
  else
    v13 = length;
  v14 = MEMORY[0x1E0C80A78](v13, v11);
  v16 = (id *)((char *)&v42 - v15);
  v42 = 0;
  if (length >= 0x101)
  {
    v16 = (id *)_CFCreateArrayStorage(v14, 0, &v42);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  -[NSArray getObjects:range:](set, "getObjects:range:", v16, location, length, v42, v43);
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
  v20 = -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:", v16, length);
  if (v5)
  {
    do
    {

      --length;
    }
    while (length);
  }
  free(v17);
  return v20;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](+[NSOrderedSet allocWithZone:](NSMutableOrderedSet, "allocWithZone:", a3), "initWithOrderedSet:range:copyItems:", self, 0, -[NSOrderedSet count](self, "count"), 0);
}

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id *v16;
  id *v17;
  id *v18;
  NSUInteger v19;
  NSOrderedSet *v20;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  double v26;
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
  uint64_t v39;
  double v40;
  NSException *v41;
  size_t v42;
  uint64_t v43;

  v5 = flag;
  length = range.length;
  location = range.location;
  v43 = *MEMORY[0x1E0C80C00];
  if (set && (_NSIsNSOrderedSet((uint64_t)set) & 1) == 0)
  {
    v30 = _os_log_pack_size();
    v32 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    *(_DWORD *)v33 = 136315138;
    *(_QWORD *)(v33 + 4) = "-[NSOrderedSet initWithOrderedSet:range:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSOrderedSet initWithOrderedSet:range:copyItems:]");
    v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v34);
  }
  v10 = -[NSOrderedSet count](set, "count");
  v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      v22 = _os_log_pack_size();
      v24 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      v25 = _os_log_pack_fill();
      v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSOrderedSet initWithOrderedSet:range:copyItems:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v26, "-[NSOrderedSet initWithOrderedSet:range:copyItems:]", location, length);
      v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v24, v22);
      objc_exception_throw(v27);
    }
    v35 = _os_log_pack_size();
    v37 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    v39 = v12 - 1;
    v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v38, (uint64_t)"-[NSOrderedSet initWithOrderedSet:range:copyItems:]", location, length, v39);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v40, "-[NSOrderedSet initWithOrderedSet:range:copyItems:]", location, length, v39);
    v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v37, v35);
    objc_exception_throw(v41);
  }
  if (length >> 60)
  {
    v28 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v29 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v28, 0);
    CFRelease(v28);
    objc_exception_throw(v29);
  }
  if (length <= 1)
    v13 = 1;
  else
    v13 = length;
  v14 = MEMORY[0x1E0C80A78](v13, v11);
  v16 = (id *)((char *)&v42 - v15);
  v42 = 0;
  if (length >= 0x101)
  {
    v16 = (id *)_CFCreateArrayStorage(v14, 0, &v42);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  -[NSOrderedSet getObjects:range:](set, "getObjects:range:", v16, location, length, v42, v43);
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
  v20 = -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:", v16, length);
  if (v5)
  {
    do
    {

      --length;
    }
    while (length);
  }
  free(v17);
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  int v6;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3)
  {
    v6 = _NSIsNSOrderedSet((uint64_t)a3);
    if (v6)
      LOBYTE(v6) = -[NSOrderedSet isEqualToOrderedSet:](self, "isEqualToOrderedSet:", a3);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isEqualToOrderedSet:(NSOrderedSet *)other
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
  if (v5 && (_NSIsNSOrderedSet(v5) & 1) == 0)
  {
    v15 = _os_log_pack_size();
    v17 = &v22[-((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSOrderedSet isEqualToOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSOrderedSet isEqualToOrderedSet:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(v7, v3, __CFTSANTagMutableOrderedSet);
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

- (BOOL)isNSOrderedSet__
{
  return 1;
}

+ (NSOrderedSet)orderedSet
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:count:", 0, 0);
}

+ (NSOrderedSet)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSOrderedSet == a1)
    return (NSOrderedSet *)__NSOrderedSetImmutablePlaceholder();
  if (NSMutableOrderedSet == a1)
    return (NSOrderedSet *)__NSOrderedSetMutablePlaceholder();
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSOrderedSet;
  return (NSOrderedSet *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
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
  uint64_t v12;
  id *v13;
  uint64_t v14;
  unint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  id v21;
  NSArray *v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSException *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
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
  NSException *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  NSException *v50;
  CFStringRef v51;
  NSException *v52;
  size_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!indexes)
  {
    v24 = _os_log_pack_size();
    v26 = (char *)&v53 - ((MEMORY[0x1E0C80A78](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
    v27 = _os_log_pack_fill();
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)(v27 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSOrderedSet objectsAtIndexes:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v26, v24);
    objc_exception_throw(v28);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v29 = _os_log_pack_size();
    v31 = (char *)&v53 - ((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v32 = _os_log_pack_fill();
    *(_DWORD *)v32 = 136315138;
    *(_QWORD *)(v32 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSOrderedSet objectsAtIndexes:]");
    v33 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v31, v29);
    objc_exception_throw(v33);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v34 = _os_log_pack_size();
    v36 = (char *)&v53 - ((MEMORY[0x1E0C80A78](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = _os_log_pack_fill();
    *(_DWORD *)v37 = 136315138;
    *(_QWORD *)(v37 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSOrderedSet objectsAtIndexes:]");
    v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v36, v34);
    objc_exception_throw(v38);
  }
  v6 = -[NSOrderedSet count](self, "count");
  v7 = objc_msgSend(0, "count");
  v8 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  v9 = v8;
  if ((v8 & 0x8000000000000000) != 0)
  {
    v10 = v7 + v6;
    goto LABEL_26;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v7 + v6;
    if (v10 <= v8)
    {
LABEL_26:
      if (!v10)
      {
        v39 = _os_log_pack_size();
        v41 = (char *)&v53 - ((MEMORY[0x1E0C80A78](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
        v42 = _os_log_pack_fill();
        *(_DWORD *)v42 = 136315394;
        *(_QWORD *)(v42 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
        *(_WORD *)(v42 + 12) = 2048;
        *(_QWORD *)(v42 + 14) = v9;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds for empty ordered set"), "-[NSOrderedSet objectsAtIndexes:]", v9);
        v43 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v41, v39);
        objc_exception_throw(v43);
      }
      v44 = _os_log_pack_size();
      v46 = (char *)&v53 - ((MEMORY[0x1E0C80A78](v44, v45) + 15) & 0xFFFFFFFFFFFFFFF0);
      v47 = _os_log_pack_fill();
      v48 = v10 - 1;
      v49 = __os_log_helper_1_2_3_8_32_8_0_8_0(v47, (uint64_t)"-[NSOrderedSet objectsAtIndexes:]", v9, v48);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu in index set beyond bounds [0 .. %lu]"), v49, "-[NSOrderedSet objectsAtIndexes:]", v9, v48);
      v50 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v46, v44);
      objc_exception_throw(v50);
    }
  }
  v11 = -[NSIndexSet count](indexes, "count");
  v12 = v11;
  if (v11 >> 60)
  {
    v51 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v11);
    v52 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v51, 0);
    CFRelease(v51);
    objc_exception_throw(v52);
  }
  v53 = 0;
  if (v11 <= 1)
    v11 = 1;
  v13 = (id *)_CFCreateArrayStorage(v11, 0, &v53);
  v14 = 0;
  for (i = 0; i < -[NSIndexSet rangeCount](indexes, "rangeCount", v53, v54); ++i)
  {
    v16 = -[NSIndexSet rangeAtIndex:](indexes, "rangeAtIndex:", i);
    v18 = v17;
    -[NSOrderedSet getObjects:range:](self, "getObjects:range:", &v13[v14], v16, v17);
    v14 += v18;
  }
  if (v13)
  {
    if (v12 >= 1)
    {
      v19 = v13;
      v20 = v12;
      do
      {
        v21 = *v19++;
        --v20;
      }
      while (v20);
    }
    v22 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v13, v12, v12);
  }
  else
  {
    v22 = -[NSArray initWithObjects:count:]([NSArray alloc], "initWithObjects:count:", 0, v12);
  }
  return v22;
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
    *(_QWORD *)(v7 + 4) = "-[NSOrderedSet enumerateObjectsUsingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSOrderedSet enumerateObjectsUsingBlock:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  -[NSOrderedSet enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0, block);
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
    *(_QWORD *)(v8 + 4) = "-[NSOrderedSet indexesOfObjectsPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet indexesOfObjectsPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", 0, predicate);
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
    *(_QWORD *)(v10 + 4) = "-[NSOrderedSet enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSOrderedSet enumerateObjectsWithOptions:usingBlock:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    objc_exception_throw(v11);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if ((opts & 2) != 0)
    opts &= ~1uLL;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, opts, 0);
  __NSOrderedSetEnumerate(self, (uint64_t)block, opts, 0);
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
    *(_QWORD *)(v13 + 4) = "-[NSOrderedSet indexOfObjectWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet indexOfObjectWithOptions:passingTest:]");
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
    objc_exception_throw(v14);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v9 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v9 = opts;
  v10 = v9 | 0x2000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x2000000000000000, 0);
  return __NSOrderedSetGetIndexPassingTest(self, (uint64_t)predicate, v10, 0);
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
    *(_QWORD *)(v13 + 4) = "-[NSOrderedSet indexesOfObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet indexesOfObjectsWithOptions:passingTest:]");
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
    objc_exception_throw(v14);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v9 = opts;
  v10 = v9 | 0x4000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x4000000000000000, 0);
  return (NSIndexSet *)__NSOrderedSetGetIndexesPassingTest(self, (uint64_t)predicate, v10, 0);
}

- (NSString)descriptionWithLocale:(id)locale
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", locale, 0);
}

- (NSString)description
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0, 0);
}

- (NSUInteger)indexOfObject:(id)object inSortedRange:(NSRange)range options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp
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
  if (!object)
  {
    v38 = _os_log_pack_size();
    v39 = (char *)&v49 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    v40 = _os_log_pack_fill();
    *(_DWORD *)v40 = 136315138;
    *(_QWORD *)(v40 + 4) = "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]");
    goto LABEL_58;
  }
  if (!cmp)
  {
    v38 = _os_log_pack_size();
    v39 = (char *)&v49 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    v41 = _os_log_pack_fill();
    *(_DWORD *)v41 = 136315138;
    *(_QWORD *)(v41 + 4) = "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]");
LABEL_58:
    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v39, v38);
    objc_exception_throw(v42);
  }
  length = range.length;
  location = range.location;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v6, __CFTSANTagMutableOrderedSet);
  v14 = -[NSOrderedSet count](self, "count");
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
      v47 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v46, (uint64_t)"-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]", location, length, --v45);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v47, "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]", location, length, v45);
    }
    else
    {
      v34 = _os_log_pack_size();
      v35 = (char *)&v49 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
      v36 = _os_log_pack_fill();
      v37 = __os_log_helper_1_2_3_8_32_8_0_8_0(v36, (uint64_t)"-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v37, "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]", location, length);
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
  v18 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v15 - 1), object);
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
  v19 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, object, -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", location));
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
      v21 = (*((uint64_t (**)(NSComparator, id, id))cmp + 2))(cmp, -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", location + (v24 >> 1)), object);
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
    *(_QWORD *)(v8 + 4) = "-[NSOrderedSet indexOfObjectPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet indexOfObjectPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet indexOfObjectWithOptions:passingTest:](self, "indexOfObjectWithOptions:passingTest:", 0, predicate);
}

- (void)getObjects:(id *)a3
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
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  v6 = -[NSOrderedSet count](self, "count");
  if (!a3 && v6)
  {
    v7 = v6;
    v8 = _os_log_pack_size();
    v10 = (char *)v16 - ((MEMORY[0x1E0C80A78](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v11 + 4) = "-[NSOrderedSet getObjects:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = v7;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSOrderedSet getObjects:]", v7);
    goto LABEL_9;
  }
  if (v6 >> 61)
  {
    v12 = v6;
    v8 = _os_log_pack_size();
    v10 = (char *)v16 - ((MEMORY[0x1E0C80A78](v8, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[NSOrderedSet getObjects:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = v12;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSOrderedSet getObjects:]", v12);
LABEL_9:
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v10, v8);
    objc_exception_throw(v15);
  }
  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", a3, 0, v6);
}

- (NSOrderedSet)initWithObjects:(id)firstObj
{
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t i;
  _QWORD *v13;
  NSOrderedSet *v14;
  CFStringRef v16;
  NSException *v17;
  uint64_t v18;
  size_t v19;
  va_list v20;
  uint64_t v21;
  va_list va;

  va_start(va, firstObj);
  v21 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v5 = 0;
  if (firstObj)
  {
    va_copy(v20, va);
    do
    {
      v6 = v20;
      v20 += 8;
      ++v5;
    }
    while (*v6);
    if (v5 >> 60)
    {
      v16 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
      v17 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v16, 0);
      CFRelease(v16);
      objc_exception_throw(v17);
    }
  }
  if (v5 <= 1)
    v7 = 1;
  else
    v7 = v5;
  v8 = MEMORY[0x1E0C80A78](v7, a2);
  v10 = (uint64_t *)((char *)&v18 - v9);
  v19 = 0;
  if (v5 >= 0x101)
  {
    v10 = _CFCreateArrayStorage(v8, 0, &v19);
    va_copy(v20, va);
    *v10 = firstObj;
    v11 = v10;
LABEL_13:
    for (i = 1; i != v5; ++i)
    {
      v13 = v20;
      v20 += 8;
      v10[i] = *v13;
    }
    goto LABEL_15;
  }
  v11 = 0;
  if (v5)
  {
    va_copy(v20, va);
    *v10 = firstObj;
    if (v5 != 1)
      goto LABEL_13;
  }
LABEL_15:
  v14 = -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:");
  free(v11);
  return v14;
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
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  v4 = -[NSOrderedSet count](self, "count");
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
  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v6, 0, v5);
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  NSUInteger v15;
  uint64_t v16;
  double v17;
  NSException *v18;
  _QWORD v19[2];

  length = a4.length;
  location = a4.location;
  v19[1] = *MEMORY[0x1E0C80C00];
  v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v15 = v9;
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v16, (uint64_t)"-[NSOrderedSet containsObject:inRange:]", location, length, --v15);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v17, "-[NSOrderedSet containsObject:inRange:]", location, length, v15);
    }
    else
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSOrderedSet containsObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v14, "-[NSOrderedSet containsObject:inRange:]", location, length);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length) != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4
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

  length = a4.length;
  location = a4.location;
  v19[1] = *MEMORY[0x1E0C80C00];
  v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v15 = v9;
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = _os_log_pack_fill();
      v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v16, (uint64_t)"-[NSOrderedSet countForObject:inRange:]", location, length, --v15);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v17, "-[NSOrderedSet countForObject:inRange:]", location, length, v15);
    }
    else
    {
      v11 = _os_log_pack_size();
      v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v13 = _os_log_pack_fill();
      v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[NSOrderedSet countForObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v14, "-[NSOrderedSet countForObject:inRange:]", location, length);
    }
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length) != 0x7FFFFFFFFFFFFFFFLL;
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
    *(_QWORD *)(v15 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_12;
  }
  if (!block)
  {
    v13 = _os_log_pack_size();
    v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
LABEL_12:
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v14, v13);
    objc_exception_throw(v18);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  v11 = opts & 0xEFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v11 = opts;
  v12 = v11 | 0x1000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v11 | 0x1000000000000000, s);
  __NSOrderedSetEnumerate(self, (uint64_t)block, v12, s);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  unint64_t result;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  NSUInteger v16;
  uint64_t v17;
  double v18;
  NSException *v19;
  _QWORD v20[2];

  length = a4.length;
  location = a4.location;
  v20[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v9 < location + length)
  {
    if (v9)
    {
      v16 = v9;
      v12 = _os_log_pack_size();
      v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = _os_log_pack_fill();
      v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v17, (uint64_t)"-[NSOrderedSet indexOfObject:inRange:]", location, length, --v16);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v18, "-[NSOrderedSet indexOfObject:inRange:]", location, length, v16);
    }
    else
    {
      v12 = _os_log_pack_size();
      v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v14 = _os_log_pack_fill();
      v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSOrderedSet indexOfObject:inRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set"), v15, "-[NSOrderedSet indexOfObject:inRange:]", location, length);
    }
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v19);
  }
  result = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", a3);
  if (result - location >= length)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = result;
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return v11;
  return result;
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
    *(_QWORD *)(v16 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if (!predicate)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
LABEL_12:
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  v11 = opts & 0xCFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v11 = opts;
  v12 = v11 | 0x3000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x3000000000000000, s);
  return __NSOrderedSetGetIndexPassingTest(self, (uint64_t)predicate, v12, s);
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
    *(_QWORD *)(v16 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if (!predicate)
  {
    v14 = _os_log_pack_size();
    v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
LABEL_12:
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v15, v14);
    objc_exception_throw(v19);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  v11 = opts & 0xAFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v11 = opts;
  v12 = v11 | 0x5000000000000000;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x5000000000000000, s);
  return (NSIndexSet *)__NSOrderedSetGetIndexesPassingTest(self, (uint64_t)predicate, v12, s);
}

- (BOOL)intersectsOrderedSet:(NSOrderedSet *)other
{
  uint64_t v3;
  NSOrderedSet *v4;
  NSUInteger v6;
  unint64_t v7;
  BOOL v8;
  NSOrderedSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v4 = other;
  v23 = *MEMORY[0x1E0C80C00];
  if (other && (_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSOrderedSet intersectsOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSOrderedSet intersectsOrderedSet:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v18[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], v14);
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  v6 = -[NSOrderedSet count](self, "count");
  v7 = -[NSOrderedSet count](v4, "count");
  v8 = v6 >= v7;
  v19 = 0u;
  v20 = 0u;
  if (v6 >= v7)
    v9 = v4;
  else
    v9 = self;
  if (v8)
    v4 = self;
  v21 = 0uLL;
  v22 = 0uLL;
  v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        if (-[NSOrderedSet containsObject:](v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13)))
        {
          LOBYTE(v10) = 1;
          return v10;
        }
        ++v13;
      }
      while (v11 != v13);
      v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      v11 = v10;
      if (v10)
        continue;
      break;
    }
  }
  return v10;
}

- (BOOL)intersectsSet:(NSSet *)set
{
  uint64_t v3;
  NSOrderedSet *v4;
  NSUInteger v6;
  unint64_t v7;
  BOOL v8;
  NSOrderedSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v4 = (NSOrderedSet *)set;
  v23 = *MEMORY[0x1E0C80C00];
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSOrderedSet intersectsSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSOrderedSet intersectsSet:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v18[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], v14);
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  v6 = -[NSOrderedSet count](self, "count");
  v7 = -[NSOrderedSet count](v4, "count");
  v8 = v6 >= v7;
  v19 = 0u;
  v20 = 0u;
  if (v6 >= v7)
    v9 = v4;
  else
    v9 = self;
  if (v8)
    v4 = self;
  v21 = 0uLL;
  v22 = 0uLL;
  v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        if (-[NSOrderedSet containsObject:](v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13)))
        {
          LOBYTE(v10) = 1;
          return v10;
        }
        ++v13;
      }
      while (v11 != v13);
      v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      v11 = v10;
      if (v10)
        continue;
      break;
    }
  }
  return v10;
}

- (BOOL)isSubsetOfOrderedSet:(NSOrderedSet *)other
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
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
  if (other && (_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSOrderedSet isSubsetOfOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSOrderedSet isSubsetOfOrderedSet:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  v6 = -[NSOrderedSet count](self, "count");
  if (v6 > -[NSOrderedSet count](other, "count"))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(self);
        if (!-[NSOrderedSet countForObject:](other, "countForObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)))
        {
          v12 = 0;
          return other && v12;
        }
      }
      v9 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
  return other && v12;
}

- (BOOL)isSubsetOfSet:(NSSet *)set
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
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
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    v13 = _os_log_pack_size();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSOrderedSet isSubsetOfSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSOrderedSet isSubsetOfSet:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v13);
    objc_exception_throw(v15);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  v6 = -[NSOrderedSet count](self, "count");
  if (v6 > -[NSSet count](set, "count"))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(self);
        if (!-[NSSet countForObject:](set, "countForObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)))
        {
          v12 = 0;
          return set && v12;
        }
      }
      v9 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
  return set && v12;
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
    *(_QWORD *)(v14 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }
  if (!a5)
  {
    v12 = _os_log_pack_size();
    v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
LABEL_12:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v17);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  v10 = -[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:](self, "indexOfObjectAtIndexes:options:passingTest:", a3, a4, a5);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v10);
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
    *(_QWORD *)(v11 + 4) = "-[NSOrderedSet objectWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet objectWithOptions:passingTest:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
    objc_exception_throw(v12);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  v8 = -[NSOrderedSet indexOfObjectWithOptions:passingTest:](self, "indexOfObjectWithOptions:passingTest:", a3, a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v8);
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
    *(_QWORD *)(v8 + 4) = "-[NSOrderedSet objectPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet objectPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet objectWithOptions:passingTest:](self, "objectWithOptions:passingTest:", 0, a3);
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
    *(_QWORD *)(v13 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set cannot be nil"), "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
    goto LABEL_10;
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index set argument is not an NSIndexSet"), "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
    goto LABEL_10;
  }
  if (!a5)
  {
    v11 = _os_log_pack_size();
    v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
LABEL_10:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v11);
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  return +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", -[NSOrderedSet objectsAtIndexes:](self, "objectsAtIndexes:", -[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:](self, "indexesOfObjectsAtIndexes:options:passingTest:", a3, a4, a5)));
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
    *(_QWORD *)(v10 + 4) = "-[NSOrderedSet objectsWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet objectsWithOptions:passingTest:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    objc_exception_throw(v11);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  return +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", -[NSOrderedSet objectsAtIndexes:](self, "objectsAtIndexes:", -[NSOrderedSet indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", a3, a4)));
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
    *(_QWORD *)(v8 + 4) = "-[NSOrderedSet objectsPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSOrderedSet objectsPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet objectsWithOptions:passingTest:](self, "objectsWithOptions:passingTest:", 0, a3);
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
  NSOrderedSet *v14;
  uint64_t v16;
  char *v17;
  char *v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t i;
  id *v26;
  NSUInteger v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  NSException *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  double v39;
  NSException *v40;
  CFStringRef v41;
  NSException *v42;
  _QWORD v44[6];
  size_t v45;
  size_t v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v30 = _os_log_pack_size();
    v32 = (char *)&v44[-1] - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    *(_DWORD *)v33 = 136315138;
    *(_QWORD *)(v33 + 4) = "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]");
    v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v34);
  }
  v7 = a4;
  length = a3.length;
  location = a3.location;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  v11 = -[NSOrderedSet count](self, "count");
  if (!length || (v13 = v11) == 0)
  {
    v14 = (NSOrderedSet *)NSArray;
    return -[NSOrderedSet array](v14, "array");
  }
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    v35 = _os_log_pack_size();
    v37 = (char *)&v44[-1] - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    v39 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v38, (uint64_t)"-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]", location, length, v13 - 1);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v39, "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]", location, length, v13 - 1);
    v40 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v37, v35);
    objc_exception_throw(v40);
  }
  if (v11 == 1)
  {
    v14 = self;
    return -[NSOrderedSet array](v14, "array");
  }
  if (length == 1)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", location));
  if (length >> 60)
  {
    v41 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), length);
    v42 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v41, 0);
    CFRelease(v41);
    objc_exception_throw(v42);
  }
  MEMORY[0x1E0C80A78](v11, v12);
  v17 = (char *)&v44[-1] - v16;
  v46[0] = 0;
  if (length >= 0x101)
  {
    v17 = (char *)_CFCreateArrayStorage(length, 0, v46);
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v45 = 0;
  v19 = (id *)_CFCreateArrayStorage(length, 0, &v45);
  v20 = -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v17, location, length);
  MEMORY[0x1E0C80A78](v20, v21);
  v23 = (char *)&v44[-1] - v22;
  v24 = (char *)&v44[-1] - v22;
  if (length > 0x1000)
    v24 = (char *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __61__NSOrderedSet_sortedArrayFromRange_options_usingComparator___block_invoke;
  v44[3] = &unk_1E12E12E0;
  v44[4] = a5;
  v44[5] = v17;
  CFSortIndexes((uint64_t)v24, length, v7, (uint64_t)v44);
  for (i = 0; i != length; ++i)
    v19[i] = *(id *)&v17[8 * *(_QWORD *)&v24[8 * i]];
  if (v23 != v24)
    free(v24);
  if ((uint64_t)length >= 1)
  {
    v26 = v19;
    v27 = length;
    do
    {
      v28 = *v26++;
      --v27;
    }
    while (v27);
  }
  v29 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v19, length, length);
  free(v18);
  return v29;
}

uint64_t __61__NSOrderedSet_sortedArrayFromRange_options_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3));
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
    *(_QWORD *)(v12 + 4) = "-[NSOrderedSet sortedArrayWithOptions:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSOrderedSet sortedArrayWithOptions:usingComparator:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v9);
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  return (NSArray *)-[NSOrderedSet sortedArrayFromRange:options:usingComparator:](self, "sortedArrayFromRange:options:usingComparator:", 0, -[NSOrderedSet count](self, "count"), opts, cmptr);
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
    *(_QWORD *)(v10 + 4) = "-[NSOrderedSet sortedArrayUsingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSOrderedSet sortedArrayUsingComparator:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v7);
    objc_exception_throw(v11);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return (NSArray *)-[NSOrderedSet sortedArrayFromRange:options:usingComparator:](self, "sortedArrayFromRange:options:usingComparator:", 0, -[NSOrderedSet count](self, "count"), 0, cmptr);
}

- (unint64_t)hash
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet count](self, "count");
}

+ (id)newOrderedSetWithObjects:(const void *)a3 count:(unint64_t)a4
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
    *(_QWORD *)(v14 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "+[NSOrderedSet newOrderedSetWithObjects:count:]", a4);
    goto LABEL_14;
  }
  if (a4 >> 61)
  {
    v9 = _os_log_pack_size();
    v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "+[NSOrderedSet newOrderedSetWithObjects:count:]", a4);
    goto LABEL_14;
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
    *(_QWORD *)(v11 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = v8;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "+[NSOrderedSet newOrderedSetWithObjects:count:]", v8);
LABEL_14:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v10, v9);
    objc_exception_throw(v12);
  }
LABEL_8:
  if (NSOrderedSet == a1)
    return __NSOrderedSetI_new((uint64_t)a3, a4, 1);
  if (NSMutableOrderedSet != a1)
  {
    v7 = __CFLookUpClass("NSOrderedSet");
    __CFRequireConcreteImplementation(v7, (uint64_t)a1);
  }
  return __NSOrderedSetM_new((id *)a3, a4, 1);
}

- (NSOrderedSet)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSOrderedSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSOrderedSet)initWithArray:(NSArray *)set copyItems:(BOOL)flag
{
  return -[NSOrderedSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", set, 0, -[NSArray count](set, "count"), flag);
}

- (NSOrderedSet)initWithObject:(id)object
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = object;
  return -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:", v4, 1);
}

- (NSOrderedSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set copyItems:(BOOL)flag
{
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", set, 0, -[NSOrderedSet count](set, "count"), flag);
}

- (NSOrderedSet)initWithSet:(NSSet *)set
{
  return -[NSOrderedSet initWithSet:copyItems:](self, "initWithSet:copyItems:", set, 0);
}

+ (NSOrderedSet)orderedSetWithObjects:(id)firstObj
{
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t i;
  _QWORD *v13;
  NSOrderedSet *v14;
  CFStringRef v16;
  NSException *v17;
  uint64_t v18;
  size_t v19;
  va_list v20;
  uint64_t v21;
  va_list va;

  va_start(va, firstObj);
  v21 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v5 = 0;
  if (firstObj)
  {
    va_copy(v20, va);
    do
    {
      v6 = v20;
      v20 += 8;
      ++v5;
    }
    while (*v6);
    if (v5 >> 60)
    {
      v16 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
      v17 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v16, 0);
      CFRelease(v16);
      objc_exception_throw(v17);
    }
  }
  if (v5 <= 1)
    v7 = 1;
  else
    v7 = v5;
  v8 = MEMORY[0x1E0C80A78](v7, a2);
  v10 = (uint64_t *)((char *)&v18 - v9);
  v19 = 0;
  if (v5 >= 0x101)
  {
    v10 = _CFCreateArrayStorage(v8, 0, &v19);
    va_copy(v20, va);
    *v10 = firstObj;
    v11 = v10;
LABEL_13:
    for (i = 1; i != v5; ++i)
    {
      v13 = v20;
      v20 += 8;
      v10[i] = *v13;
    }
    goto LABEL_15;
  }
  v11 = 0;
  if (v5)
  {
    va_copy(v20, va);
    *v10 = firstObj;
    if (v5 != 1)
      goto LABEL_13;
  }
LABEL_15:
  v14 = (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:count:", v10, v5);
  free(v11);
  return v14;
}

+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array range:(NSRange)range copyItems:(BOOL)flag
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", array, range.location, range.length, flag);
}

+ (NSOrderedSet)orderedSetWithArray:(id)a3 range:(_NSRange)a4
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

+ (NSOrderedSet)orderedSetWithArray:(id)a3 copyItems:(BOOL)a4
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", set, 0, -[NSOrderedSet count](set, "count"), 0);
}

+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  return (NSOrderedSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSet:copyItems:", set, flag);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:](+[NSOrderedSet allocWithZone:](NSOrderedSet, "allocWithZone:", a3), "initWithOrderedSet:range:copyItems:", self, 0, -[NSOrderedSet count](self, "count"), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSOrderedSet)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSUInteger)count
{
  objc_class *v2;

  OUTLINED_FUNCTION_2_14();
  v2 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_31(v2);
}

- (NSUInteger)indexOfObject:(id)object
{
  objc_class *v3;

  OUTLINED_FUNCTION_2_14();
  v3 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_31(v3);
}

- (id)objectAtIndex:(NSUInteger)idx
{
  objc_class *v3;

  OUTLINED_FUNCTION_2_14();
  v3 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_31(v3);
}

- (NSOrderedSet)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  objc_class *v4;

  OUTLINED_FUNCTION_2_14();
  v4 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_31(v4);
}

@end
