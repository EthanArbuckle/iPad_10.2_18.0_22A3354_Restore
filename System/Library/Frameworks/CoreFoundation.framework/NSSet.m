@implementation NSSet

- (unint64_t)hash
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  return -[NSSet count](self, "count");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  int v6;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3)
  {
    v6 = _NSIsNSSet((uint64_t)a3);
    if (v6)
      LOBYTE(v6) = -[NSSet isEqualToSet:](self, "isEqualToSet:", a3);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)intersectsSet:(NSSet *)otherSet
{
  uint64_t v3;
  NSSet *v4;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSUInteger v19;
  unint64_t v20;
  BOOL v21;
  NSSet *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  NSException *v31;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v4 = otherSet;
  v43 = *MEMORY[0x1E0C80C00];
  if (otherSet)
  {
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      v7 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
    }
    v14 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v4);
          objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        }
        v16 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      }
      while (v16);
    }
    v4 = v14;
    if (v4)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
      {
        v27 = _os_log_pack_size();
        v29 = &v33[-((MEMORY[0x1E0C80A78](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0)];
        v30 = _os_log_pack_fill();
        *(_DWORD *)v30 = 136315138;
        *(_QWORD *)(v30 + 4) = "-[NSSet intersectsSet:]";
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSSet intersectsSet:]");
        v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v29, v27);
        objc_exception_throw(v31);
      }
    }
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  v19 = -[NSSet count](self, "count");
  v20 = -[NSSet count](v4, "count");
  v21 = v19 >= v20;
  v34 = 0u;
  v35 = 0u;
  if (v19 >= v20)
    v22 = v4;
  else
    v22 = self;
  if (!v21)
    self = v4;
  v36 = 0uLL;
  v37 = 0uLL;
  v23 = -[NSSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    while (2)
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        if (-[NSSet containsObject:](self, "containsObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v26)))
        {
          LOBYTE(v23) = 1;
          return v23;
        }
        ++v26;
      }
      while (v24 != v26);
      v23 = -[NSSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      v24 = v23;
      if (v23)
        continue;
      break;
    }
  }
  return v23;
}

- (BOOL)isNSSet__
{
  return 1;
}

- (BOOL)isEqualToSet:(NSSet *)otherSet
{
  uint64_t v3;
  NSSet *v4;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  char v19;
  BOOL result;
  char v21;
  NSUInteger v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  NSException *v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v4 = otherSet;
  v44 = *MEMORY[0x1E0C80C00];
  if (!otherSet)
    goto LABEL_17;
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_15;
  }
  if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
  {
    v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
  }
  v14 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v4);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      }
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    }
    while (v16);
  }
  v4 = v14;
  if (v4)
  {
LABEL_15:
    if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
    {
      v29 = _os_log_pack_size();
      v31 = &v34[-((MEMORY[0x1E0C80A78](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0)];
      v32 = _os_log_pack_fill();
      *(_DWORD *)v32 = 136315138;
      *(_QWORD *)(v32 + 4) = "-[NSSet isEqualToSet:]";
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSSet isEqualToSet:]");
      v33 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v31, v29);
      objc_exception_throw(v33);
    }
    v19 = 0;
  }
  else
  {
LABEL_17:
    v19 = 1;
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  result = v4 == self;
  if (v4 == self)
    v21 = 1;
  else
    v21 = v19;
  if ((v21 & 1) == 0)
  {
    v22 = -[NSSet count](self, "count");
    if (-[NSSet count](v4, "count") == v22)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v23 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      if (!v23)
        return 1;
      v24 = v23;
      v25 = *(_QWORD *)v36;
LABEL_27:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(self);
        v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v26);
        v28 = -[NSSet countForObject:](v4, "countForObject:", v27);
        if (v28 != -[NSSet countForObject:](self, "countForObject:", v27))
          break;
        if (v24 == ++v26)
        {
          v24 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
          result = 1;
          if (v24)
            goto LABEL_27;
          return result;
        }
      }
    }
    return 0;
  }
  return result;
}

- (NSString)descriptionWithLocale:(id)locale
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return (NSString *)-[NSSet descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", locale, 0);
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  unint64_t v5;
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
  __CFString *v23;
  CFStringRef v25;
  NSException *v26;
  uint64_t v27;
  void *v28;
  CFAllocatorRef v29;
  uint64_t *v30;
  char *v31;
  id v32;
  size_t v33[2];

  v32 = a3;
  v33[1] = *MEMORY[0x1E0C80C00];
  if (a4 >= 0x64)
    v5 = 100;
  else
    v5 = a4;
  v6 = -[NSSet count](self, "count");
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
  -[NSSet getObjects:count:](self, "getObjects:count:", v11, v8);
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

- (NSString)description
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  return (NSString *)-[NSSet descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0, 0);
}

- (NSArray)allObjects
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
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  v4 = -[NSSet count](self, "count");
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
  -[NSSet getObjects:count:](self, "getObjects:count:", v6, v5);
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

+ (NSSet)setWithSet:(NSSet *)set
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSet:copyItems:", set, 0);
}

- (NSSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  _BOOL4 v4;
  NSSet *v5;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id *v24;
  id *v25;
  id *v26;
  unint64_t v27;
  NSSet *v28;
  CFStringRef v30;
  NSException *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSException *v36;
  size_t v37[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v4 = flag;
  v5 = set;
  v42 = *MEMORY[0x1E0C80C00];
  if (set)
  {
    if ((_NSIsNSSet((uint64_t)set) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      v8 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v9, v10, v11, v12, v13, v14, v8);
    }
    v15 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v5);
          objc_msgSend(v15, "addObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        }
        v16 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      }
      while (v16);
    }
    v5 = v15;
    if (v5)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v5) & 1) == 0)
      {
        v32 = _os_log_pack_size();
        v34 = (char *)v37 - ((MEMORY[0x1E0C80A78](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0);
        v35 = _os_log_pack_fill();
        *(_DWORD *)v35 = 136315138;
        *(_QWORD *)(v35 + 4) = "-[NSSet initWithSet:copyItems:]";
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSSet initWithSet:copyItems:]");
        v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v34, v32);
        objc_exception_throw(v36);
      }
    }
  }
  v19 = -[NSSet count](v5, "count");
  v21 = v19;
  if (v19 >> 60)
  {
    v30 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v19);
    v31 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v30, 0);
    CFRelease(v30);
    objc_exception_throw(v31);
  }
  if (v19 <= 1)
    v19 = 1;
  v22 = MEMORY[0x1E0C80A78](v19, v20);
  v24 = (id *)((char *)v37 - v23);
  v37[0] = 0;
  if (v21 >= 0x101)
  {
    v24 = (id *)_CFCreateArrayStorage(v22, 0, v37);
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  -[NSSet getObjects:count:](v5, "getObjects:count:", v24, v21, v37[0]);
  if (!v21)
    v4 = 0;
  if (v4)
  {
    v26 = v24;
    v27 = v21;
    do
    {
      *v26 = (id)objc_msgSend(*v26, "copyWithZone:", 0);
      ++v26;
      --v27;
    }
    while (v27);
  }
  v28 = -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v24, v21);
  if (v4)
  {
    do
    {

      --v21;
    }
    while (v21);
  }
  free(v25);
  return v28;
}

+ (NSSet)setWithArray:(NSArray *)array
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);
}

- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
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
  NSSet *v20;
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

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v43 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v30 = _os_log_pack_size();
    v32 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    *(_DWORD *)v33 = 136315138;
    *(_QWORD *)(v33 + 4) = "-[NSSet initWithArray:range:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSSet initWithArray:range:copyItems:]");
    v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v34);
  }
  v10 = objc_msgSend(a3, "count");
  v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      v22 = _os_log_pack_size();
      v24 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      v25 = _os_log_pack_fill();
      v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSSet initWithArray:range:copyItems:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty set"), v26, "-[NSSet initWithArray:range:copyItems:]", location, length);
      v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v24, v22);
      objc_exception_throw(v27);
    }
    v35 = _os_log_pack_size();
    v37 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    v39 = v12 - 1;
    v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v38, (uint64_t)"-[NSSet initWithArray:range:copyItems:]", location, length, v39);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v40, "-[NSSet initWithArray:range:copyItems:]", location, length, v39);
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
  objc_msgSend(a3, "getObjects:range:", v16, location, length, v42, v43);
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
  v20 = -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v16, length);
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

+ (NSSet)set
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:count:", 0, 0);
}

+ (NSSet)setWithObject:(id)object
{
  return (NSSet *)(id)__createSet(objc_alloc((Class)a1), (uint64_t)object);
}

+ (NSSet)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSSet == a1)
    return (NSSet *)__NSSetImmutablePlaceholder();
  if (NSMutableSet == a1)
    return (NSSet *)__NSSetMutablePlaceholder();
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSet;
  return (NSSet *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSSet)initWithSet:(NSSet *)set
{
  return -[NSSet initWithSet:copyItems:](self, "initWithSet:copyItems:", set, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return -[NSSet initWithSet:copyItems:](+[NSSet allocWithZone:](NSMutableSet, "allocWithZone:", a3), "initWithSet:copyItems:", self, 0);
}

uint64_t __48__NSSet_sortedArrayWithOptions_usingComparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3));
}

- (NSSet)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v4;
  char v6;
  NSSet *v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSException *v14;
  _QWORD v15[7];
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!predicate)
  {
    v10 = _os_log_pack_size();
    v12 = (char *)v15 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[NSSet objectsWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSSet objectsWithOptions:passingTest:]");
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v14);
  }
  v6 = opts;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  v8 = +[NSSet set](NSMutableSet, "set");
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  v16 = 850045857;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__NSSet_objectsWithOptions_passingTest___block_invoke;
  v15[3] = &unk_1E1079338;
  v15[5] = predicate;
  v15[6] = &v16;
  v15[4] = v8;
  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)v15);
  return +[NSSet setWithSet:](NSSet, "setWithSet:", v8);
}

uint64_t __40__NSSet_objectsWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
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

- (BOOL)isSubsetOfSet:(NSSet *)otherSet
{
  uint64_t v3;
  NSSet *v4;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  NSException *v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v4 = otherSet;
  v42 = *MEMORY[0x1E0C80C00];
  if (otherSet)
  {
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      v7 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v8, v9, v10, v11, v12, v13, v7);
    }
    v14 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v4);
          objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        }
        v16 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      }
      while (v16);
    }
    v4 = v14;
    if (v4)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
      {
        v27 = _os_log_pack_size();
        v29 = &v32[-((MEMORY[0x1E0C80A78](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0)];
        v30 = _os_log_pack_fill();
        *(_DWORD *)v30 = 136315138;
        *(_QWORD *)(v30 + 4) = "-[NSSet isSubsetOfSet:]";
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSSet isSubsetOfSet:]");
        v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v29, v27);
        objc_exception_throw(v31);
      }
    }
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  v19 = -[NSSet count](self, "count");
  if (v19 > -[NSSet count](v4, "count"))
    return 0;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
LABEL_22:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v23)
        objc_enumerationMutation(self);
      v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v24);
      v26 = -[NSSet countForObject:](v4, "countForObject:", v25);
      if (v26 < -[NSSet countForObject:](self, "countForObject:", v25))
        return 0;
      if (v22 == ++v24)
      {
        v22 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
        if (v22)
          goto LABEL_22;
        return v4 != 0;
      }
    }
  }
  return v4 != 0;
}

- (NSSet)setByAddingObjectsFromArray:(NSArray *)other
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  NSSet *v17;
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
  if (other && (_NSIsNSArray((uint64_t)other) & 1) == 0)
  {
    v18 = _os_log_pack_size();
    v20 = (char *)&v25 - ((MEMORY[0x1E0C80A78](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[NSSet setByAddingObjectsFromArray:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: array argument is not an NSArray"), "-[NSSet setByAddingObjectsFromArray:]");
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v20, v18);
    objc_exception_throw(v22);
  }
  v5 = -[NSArray count](other, "count");
  if (!v5)
    return self;
  v6 = v5;
  v7 = -[NSSet count](self, "count");
  v9 = v7 + v6;
  if ((v7 + v6) >> 60)
  {
    v23 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7 + v6);
    v24 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v23, 0);
    CFRelease(v23);
    objc_exception_throw(v24);
  }
  v10 = v7;
  if (v9 <= 1)
    v11 = 1;
  else
    v11 = v7 + v6;
  v12 = MEMORY[0x1E0C80A78](v11, v8);
  v14 = (char *)&v25 - v13;
  v25 = 0;
  if (v9 < 0x101)
  {
    v15 = 0;
    if (!v10)
      goto LABEL_14;
    goto LABEL_13;
  }
  v14 = (char *)_CFCreateArrayStorage(v12, 0, &v25);
  v15 = v14;
  if (v10)
LABEL_13:
    -[NSSet getObjects:count:](self, "getObjects:count:", v14, v10, v25, v26);
LABEL_14:
  -[NSArray getObjects:range:](other, "getObjects:range:", &v14[8 * v10], 0, v6, v25);
  v17 = +[NSSet setWithObjects:count:](NSSet, "setWithObjects:count:", v14, v9);
  free(v15);
  return v17;
}

- (NSSet)setByAddingObject:(id)anObject
{
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  NSSet *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSException *v20;
  CFStringRef v21;
  NSException *v22;
  size_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!anObject)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)&v23 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315138;
    *(_QWORD *)(v19 + 4) = "-[NSSet setByAddingObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[NSSet setByAddingObject:]");
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
    objc_exception_throw(v20);
  }
  if (-[NSSet containsObject:](self, "containsObject:"))
    return self;
  v6 = -[NSSet count](self, "count");
  v8 = v6 + 1;
  if ((v6 + 1) >> 60)
  {
    v21 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6 + 1);
    v22 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v21, 0);
    CFRelease(v21);
    objc_exception_throw(v22);
  }
  v9 = v6;
  if (v8 <= 1)
    v10 = 1;
  else
    v10 = v6 + 1;
  v11 = MEMORY[0x1E0C80A78](v10, v7);
  v13 = (char *)&v23 - v12;
  v23 = 0;
  if (v8 >= 0x101)
  {
    v13 = (char *)_CFCreateArrayStorage(v11, 0, &v23);
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  -[NSSet getObjects:count:](self, "getObjects:count:", v13, v9, v23, v24);
  *(_QWORD *)&v13[8 * v9] = anObject;
  v15 = +[NSSet setWithObjects:count:](NSSet, "setWithObjects:count:", v13, v8);
  free(v14);
  return v15;
}

+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, a5);
}

- (NSSet)setByAddingObjectsFromSet:(NSSet *)other
{
  NSSet *v3;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  NSSet *v27;
  CFStringRef v29;
  NSException *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSException *v35;
  size_t v36[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = other;
  v41 = *MEMORY[0x1E0C80C00];
  if (other)
  {
    if ((_NSIsNSSet((uint64_t)other) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      v6 = __CFExceptionProem((objc_class *)self, a2);
      CFLog(3, (uint64_t)CFSTR("%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s"), v7, v8, v9, v10, v11, v12, v6);
    }
    v13 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v3);
          objc_msgSend(v13, "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
        v14 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
      }
      while (v14);
    }
    v3 = v13;
    if (v3)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v3) & 1) == 0)
      {
        v31 = _os_log_pack_size();
        v33 = (char *)v36 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
        v34 = _os_log_pack_fill();
        *(_DWORD *)v34 = 136315138;
        *(_QWORD *)(v34 + 4) = "-[NSSet setByAddingObjectsFromSet:]";
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: set argument is not an NSSet"), "-[NSSet setByAddingObjectsFromSet:]");
        v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
        objc_exception_throw(v35);
      }
    }
  }
  v17 = -[NSSet count](v3, "count");
  if (v17)
  {
    v18 = -[NSSet count](self, "count");
    v20 = v18;
    v21 = v18 + v17;
    if ((v18 + v17) >> 60)
    {
      v29 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v18 + v17);
      v30 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v29, 0);
      CFRelease(v29);
      objc_exception_throw(v30);
    }
    if (v21 <= 1)
      v22 = 1;
    else
      v22 = v18 + v17;
    v23 = MEMORY[0x1E0C80A78](v22, v19);
    v25 = (char *)v36 - v24;
    v36[0] = 0;
    if (v21 >= 0x101)
    {
      v25 = (char *)_CFCreateArrayStorage(v23, 0, v36);
      v26 = v25;
      if (!v20)
      {
LABEL_27:
        -[NSSet getObjects:count:](v3, "getObjects:count:", &v25[8 * v20], v17, v36[0]);
        v27 = +[NSSet setWithObjects:count:](NSSet, "setWithObjects:count:", v25, v21);
        free(v26);
        return v27;
      }
    }
    else
    {
      v26 = 0;
      if (!v20)
        goto LABEL_27;
    }
    -[NSSet getObjects:count:](self, "getObjects:count:", v25, v20, v36[0]);
    goto LABEL_27;
  }
  return self;
}

+ (NSSet)setWithObjects:(id *)objects count:(NSUInteger)cnt
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:count:", objects, cnt);
}

- (void)getObjects:(id *)a3
{
  uint64_t v3;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = -[NSSet count](self, "count");
  if (!a3 && v6)
  {
    v7 = v6;
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315394;
    *(_QWORD *)(v10 + 4) = "-[NSSet getObjects:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(_QWORD *)(v10 + 14) = v7;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSSet getObjects:]", v7);
    goto LABEL_9;
  }
  if (v6 >> 61)
  {
    v11 = v6;
    v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v12 + 4) = "-[NSSet getObjects:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v12 + 14) = v11;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSSet getObjects:]", v11);
LABEL_9:
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v9, v8);
    objc_exception_throw(v13);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  -[NSSet getObjects:count:](self, "getObjects:count:", a3, -[NSSet count](self, "count"));
}

+ (id)newSetWithObjects:(const void *)a3 count:(unint64_t)a4
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
    *(_QWORD *)(v14 + 4) = "+[NSSet newSetWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "+[NSSet newSetWithObjects:count:]", a4);
    goto LABEL_18;
  }
  if (a4 >> 61)
  {
    v9 = _os_log_pack_size();
    v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "+[NSSet newSetWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(_QWORD *)(v16 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "+[NSSet newSetWithObjects:count:]", a4);
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
    *(_QWORD *)(v11 + 4) = "+[NSSet newSetWithObjects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(_QWORD *)(v11 + 14) = v8;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "+[NSSet newSetWithObjects:count:]", v8);
LABEL_18:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v10, v9);
    objc_exception_throw(v12);
  }
LABEL_8:
  if (NSSet == a1)
  {
    if (a4 == 1)
    {
      return __NSSingleObjectSetI_new((uint64_t)*a3, 1);
    }
    else if (a4)
    {
      return __NSSetI_new((uint64_t *)a3, 0, a4, 1);
    }
    else
    {
      return (id)__NSSet0__;
    }
  }
  else
  {
    if (NSMutableSet != a1)
    {
      v7 = __CFLookUpClass("NSSet");
      __CFRequireConcreteImplementation(v7, (uint64_t)a1);
    }
    return __NSSetM_new((uint64_t)a3, a4, 0);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  unint64_t var0;
  NSEnumerator *v11;
  NSEnumerator *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSException *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!a4 && a5)
  {
    v19 = _os_log_pack_size();
    v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)(v21 + 4) = "-[NSSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(_QWORD *)(v21 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSSet countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_28;
  }
  if (a5 >> 61)
  {
    v19 = _os_log_pack_size();
    v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v22 = _os_log_pack_fill();
    *(_DWORD *)v22 = 136315394;
    *(_QWORD *)(v22 + 4) = "-[NSSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(_QWORD *)(v22 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSSet countByEnumeratingWithState:objects:count:]", a5);
LABEL_28:
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v20, v19);
    objc_exception_throw(v23);
  }
  var0 = a3->var0;
  if (a3->var0 == -1)
    return 0;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
    var0 = a3->var0;
    if (a3->var0)
      goto LABEL_7;
    goto LABEL_9;
  }
  if (!var0)
  {
LABEL_9:
    a3->var2 = a3->var3;
    a3->var3[0] = -[NSSet count](self, "count");
    v12 = -[NSSet objectEnumerator](self, "objectEnumerator");
    a3->var3[1] = (unint64_t)v12;
    if (v12)
    {
      v11 = v12;
      var0 = a3->var0;
      goto LABEL_11;
    }
    return 0;
  }
LABEL_7:
  v11 = (NSEnumerator *)a3->var3[1];
LABEL_11:
  a3->var1 = a4;
  v13 = a3->var3[0];
  if (v13 - var0 >= a5)
    v14 = a5;
  else
    v14 = v13 - var0;
  if (v14)
  {
    v15 = 0;
    while (1)
    {
      v16 = -[NSEnumerator nextObject](v11, "nextObject");
      if (!v16)
        break;
      a4[v15++] = v16;
      if (v14 == v15)
      {
        var0 = a3->var0;
        goto LABEL_19;
      }
    }
    v17 = -1;
  }
  else
  {
LABEL_19:
    v17 = var0 + v14;
    if (v13 <= v17)
      v17 = -1;
    v15 = v14;
  }
  a3->var0 = v17;
  return v15;
}

- (NSSet)initWithArray:(NSArray *)array
{
  return -[NSSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", array, 0, -[NSArray count](array, "count"), 0);
}

- (id)anyObject
{
  uint64_t v2;
  id result;
  uint64_t v5;
  _OWORD v6[4];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  memset(v6, 0, sizeof(v6));
  result = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", v6, &v5, 16);
  if (result)
    return (id)**((_QWORD **)&v6[0] + 1);
  return result;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return -[NSSet member:](self, "member:", a3) != 0;
}

- (BOOL)containsObject:(id)anObject
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    if (anObject)
      return -[NSSet member:](self, "member:", anObject) != 0;
  }
  else if (anObject)
  {
    return -[NSSet member:](self, "member:", anObject) != 0;
  }
  return 0;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  unint64_t v5;
  id *v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  NSException *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v5 = a4;
  v6 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && a4)
  {
    v12 = _os_log_pack_size();
    v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v14 + 4) = "-[NSSet getObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v14 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[NSSet getObjects:count:]", v5);
    goto LABEL_17;
  }
  if (a4 >> 61)
  {
    v12 = _os_log_pack_size();
    v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = "-[NSSet getObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(_QWORD *)(v15 + 14) = v5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[NSSet getObjects:count:]", v5);
LABEL_17:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v13, v12);
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
LABEL_8:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(self);
      if (v5 == v11)
        break;
      *v6++ = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v11);
      if (v9 == ++v11)
      {
        v9 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        v5 -= v11;
        if (v9)
          goto LABEL_8;
        return;
      }
    }
  }
}

+ (NSSet)setWithObjects:(id)firstObj
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
  _BYTE *v17;
  va_list v19;
  va_list v20;
  uint64_t v21[2];
  va_list va;

  va_start(va, firstObj);
  v21[1] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21[0] = (uint64_t)firstObj;
  if (firstObj)
  {
    v5 = 0;
    va_copy(v19, va);
    do
    {
      v6 = v19;
      v19 += 8;
      ++v5;
    }
    while (*v6);
    if (NSSet == a1)
    {
      va_copy(v20, va);
      v17 = __NSSetI_new(v21, (uint64_t *)va, v5, 0);
      return (NSSet *)v17;
    }
    if (v5 >> 60)
    {
      v7 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
      v8 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v7, 0);
      CFRelease(v7);
      objc_exception_throw(v8);
    }
LABEL_9:
    if (v5 <= 1)
      v9 = 1;
    else
      v9 = v5;
    v10 = MEMORY[0x1E0C80A78](v9, a2);
    v12 = (va_list *)((char *)&v19 - v11);
    v19 = 0;
    if (v5 >= 0x101)
    {
      v12 = _CFCreateArrayStorage(v10, 0, (size_t *)&v19);
      va_copy(v20, va);
      *v12 = firstObj;
      v13 = v12;
    }
    else
    {
      v13 = 0;
      if (!v5)
        goto LABEL_19;
      va_copy(v20, va);
      *v12 = firstObj;
      if (v5 == 1)
        goto LABEL_19;
    }
    for (i = 1; i != v5; ++i)
    {
      v15 = v20;
      v20 += 8;
      v12[i] = *v15;
    }
LABEL_19:
    v16 = objc_alloc((Class)a1);
    v17 = (_BYTE *)objc_msgSend(v16, "initWithObjects:count:", v12, v5, v19);
    free(v13);
    return (NSSet *)v17;
  }
  if (NSSet != a1)
  {
    v5 = 0;
    goto LABEL_9;
  }
  return (NSSet *)__NSSet0__;
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
    *(_QWORD *)(v7 + 4) = "-[NSSet enumerateObjectsUsingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSSet enumerateObjectsUsingBlock:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    objc_exception_throw(v8);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  -[NSSet enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0, block);
}

- (NSSet)objectsPassingTest:(void *)predicate
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
    *(_QWORD *)(v8 + 4) = "-[NSSet objectsPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSSet objectsPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return -[NSSet objectsWithOptions:passingTest:](self, "objectsWithOptions:passingTest:", 0, predicate);
}

- (NSSet)initWithObjects:(id)firstObj
{
  __objc2_class *Class;
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
  NSSet *v18;
  va_list v20;
  va_list v21;
  id v22;
  uint64_t v23;
  va_list va;

  va_start(va, firstObj);
  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = firstObj;
  Class = (__objc2_class *)object_getClass(self);
  if (firstObj)
  {
    v7 = 0;
    va_copy(v20, va);
    do
    {
      v8 = v20;
      v20 += 8;
      ++v7;
    }
    while (*v8);
    if (Class == NSSet)
    {
      va_copy(v21, va);
      return (NSSet *)__NSSetI_new((uint64_t *)&v22, (uint64_t *)va, v7, 0);
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
    if (Class == NSSet)
      return (NSSet *)__NSSet0__;
    v7 = 0;
  }
  if (v7 <= 1)
    v11 = 1;
  else
    v11 = v7;
  v12 = MEMORY[0x1E0C80A78](v11, v6);
  v14 = (va_list *)((char *)&v20 - v13);
  v20 = 0;
  if (v7 >= 0x101)
  {
    v14 = _CFCreateArrayStorage(v12, 0, (size_t *)&v20);
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
  v18 = -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v20, v21, v22, v23);
  free(v15);
  return v18;
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v4;
  char v6;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSException *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!block)
  {
    v8 = _os_log_pack_size();
    v10 = (char *)v13 - ((MEMORY[0x1E0C80A78](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = "-[NSSet enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[NSSet enumerateObjectsWithOptions:usingBlock:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v10, v8);
    objc_exception_throw(v12);
  }
  v6 = opts;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)block);
}

- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument
{
  uint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!aSelector)
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(self);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "performSelector:withObject:", aSelector, argument);
      }
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v9);
  }
}

- (void)makeObjectsPerformSelector:(SEL)aSelector
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!aSelector)
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(self);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "performSelector:", aSelector);
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
}

- (id)sortedArrayUsingComparator:(id)a3
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
    *(_QWORD *)(v8 + 4) = "-[NSSet sortedArrayUsingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSSet sortedArrayUsingComparator:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return -[NSSet sortedArrayWithOptions:usingComparator:](self, "sortedArrayWithOptions:usingComparator:", 0, a3);
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  uint64_t v4;
  char v6;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t i;
  id *v22;
  unint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSException *v30;
  CFStringRef v31;
  NSException *v32;
  _QWORD v34[6];
  size_t v35;
  size_t v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)&v34[-1] - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSSet sortedArrayWithOptions:usingComparator:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: comparator cannot be nil"), "-[NSSet sortedArrayWithOptions:usingComparator:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
  v6 = a3;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  v8 = -[NSSet count](self, "count");
  if (!v8)
    return +[NSArray array](NSArray, "array");
  v10 = v8;
  if (v8 >> 60)
  {
    v31 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v8);
    v32 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v31, 0);
    CFRelease(v31);
    objc_exception_throw(v32);
  }
  MEMORY[0x1E0C80A78](v8, v9);
  v12 = (char *)&v34[-1] - v11;
  v36[0] = 0;
  if (v10 >= 0x101)
  {
    v12 = (char *)_CFCreateArrayStorage(v10, 0, v36);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v35 = 0;
  v15 = (id *)_CFCreateArrayStorage(v10, 0, &v35);
  v16 = -[NSSet getObjects:count:](self, "getObjects:count:", v12, v10);
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v34[-1] - v18;
  v20 = (char *)&v34[-1] - v18;
  if (v10 > 0x1000)
    v20 = (char *)malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __48__NSSet_sortedArrayWithOptions_usingComparator___block_invoke;
  v34[3] = &unk_1E12E12E0;
  v34[4] = a4;
  v34[5] = v12;
  CFSortIndexes((uint64_t)v20, v10, v6, (uint64_t)v34);
  for (i = 0; i != v10; ++i)
    v15[i] = *(id *)&v12[8 * *(_QWORD *)&v20[8 * i]];
  if (v19 != v20)
    free(v20);
  if ((uint64_t)v10 >= 1)
  {
    v22 = v15;
    v23 = v10;
    do
    {
      v24 = *v22++;
      --v23;
    }
    while (v23);
  }
  v25 = -[NSArray _initByAdoptingBuffer:count:size:]([NSArray alloc], "_initByAdoptingBuffer:count:size:", v15, v10, v10);
  free(v13);
  return v25;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger length;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  __int16 v14;

  length = a4.length;
  CFLog(3, (uint64_t)CFSTR("*** ERROR: this process has called an NSArray-taking method, such as initWithArray:, and passed in an NSSet object.  This is being worked-around for now, but will soon cause you grief."), (uint64_t)a3, a4.location, a4.length, v4, v5, v6, v14);
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v7, __CFTSANTagMutableSet);
  v11 = -[NSSet count](self, "count");
  if (v11)
  {
    v12 = v11;
    v13 = malloc_type_malloc(16 * v11, 0xBAD6032DuLL);
    -[NSSet getObjects:count:](self, "getObjects:count:", v13, v12);
    memmove(a3, v13, 8 * length);
  }
}

- (BOOL)intersectsOrderedSet:(id)a3
{
  uint64_t v3;
  NSSet *v4;
  NSUInteger v6;
  unint64_t v7;
  BOOL v8;
  NSSet *v9;
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

  v4 = (NSSet *)a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v14 = _os_log_pack_size();
    v15 = _os_log_pack_fill();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = "-[NSSet intersectsOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSSet intersectsOrderedSet:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v18[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], v14);
    objc_exception_throw(v16);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  v6 = -[NSSet count](self, "count");
  v7 = -[NSSet count](v4, "count");
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
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
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
        if (-[NSSet containsObject:](v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13)))
        {
          LOBYTE(v10) = 1;
          return v10;
        }
        ++v13;
      }
      while (v11 != v13);
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      v11 = v10;
      if (v10)
        continue;
      break;
    }
  }
  return v10;
}

- (BOOL)isSubsetOfOrderedSet:(id)a3
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  NSException *v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v15 = _os_log_pack_size();
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[NSSet isSubsetOfOrderedSet:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSSet isSubsetOfOrderedSet:]");
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, &v18[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)], v15);
    objc_exception_throw(v17);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  v6 = -[NSSet count](self, "count");
  if (v6 > objc_msgSend(a3, "count"))
    return 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(self);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(a3, "countForObject:", v12);
        if (v13 < -[NSSet countForObject:](self, "countForObject:", v12))
        {
          v14 = 0;
          return a3 && v14;
        }
      }
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 1;
  return a3 && v14;
}

- (id)members:(id)a3 notFoundMarker:(id)a4
{
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  id *v14;
  uint64_t v15;
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
  if (!a4)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)&v33 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    *(_DWORD *)v29 = 136315138;
    *(_QWORD *)(v29 + 4) = "-[NSSet members:notFoundMarker:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: marker cannot be nil"), "-[NSSet members:notFoundMarker:]");
    v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v30);
  }
  v8 = objc_msgSend(a3, "count");
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
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
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
          objc_enumerationMutation(a3);
        v19 = -[NSSet member:](self, "member:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        if (v19)
          v20 = v19;
        else
          v20 = a4;
        *(_QWORD *)v16 = v20;
        v16 += 8;
      }
      v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
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

- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  char v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSException *v13;
  _QWORD v14[7];
  char v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v9 = _os_log_pack_size();
    v11 = (char *)v14 - ((MEMORY[0x1E0C80A78](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v12 + 4) = "-[NSSet objectWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSSet objectWithOptions:passingTest:]");
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v11, v9);
    objc_exception_throw(v13);
  }
  v6 = a3;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  v16[0] = 0;
  v15 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__NSSet_objectWithOptions_passingTest___block_invoke;
  v14[3] = &unk_1E13345E8;
  v14[4] = a4;
  v14[5] = &v15;
  v14[6] = v16;
  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)v14);
  return (id)v16[0];
}

uint64_t __39__NSSet_objectWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    **(_QWORD **)(a1 + 48) = a2;
    *a3 = 1;
  }
  if (**(_BYTE **)(a1 + 40))
    *a3 = 1;
  return result;
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
    *(_QWORD *)(v8 + 4) = "-[NSSet objectPassingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[NSSet objectPassingTest:]");
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    objc_exception_throw(v9);
  }
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return -[NSSet objectWithOptions:passingTest:](self, "objectWithOptions:passingTest:", 0, a3);
}

- (void)__applyValues:(void *)a3 context:(void *)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSException *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: function pointer is NULL"), v11);
    v12 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v12);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(self);
        ((void (*)(_QWORD, void *))a3)(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a4);
      }
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
}

- (BOOL)__getValue:(id *)a3 forObj:(id)a4
{
  id v5;

  v5 = -[NSSet member:](self, "member:", a4);
  if (a3 && v5)
    *a3 = v5;
  return v5 != 0;
}

- (NSSet)initWithObject:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  return -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v4, 1);
}

- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSSet)initWithArray:(id)a3 copyItems:(BOOL)a4
{
  return -[NSSet initWithArray:range:copyItems:](self, "initWithArray:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
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
  NSSet *v20;
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

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v43 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    v30 = _os_log_pack_size();
    v32 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = _os_log_pack_fill();
    *(_DWORD *)v33 = 136315138;
    *(_QWORD *)(v33 + 4) = "-[NSSet initWithOrderedSet:range:copyItems:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: ordered set argument is not an NSOrderedSet"), "-[NSSet initWithOrderedSet:range:copyItems:]");
    v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v32, v30);
    objc_exception_throw(v34);
  }
  v10 = objc_msgSend(a3, "count");
  v12 = v10;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v10 < location + length)
  {
    if (!v10)
    {
      v22 = _os_log_pack_size();
      v24 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      v25 = _os_log_pack_fill();
      v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[NSSet initWithOrderedSet:range:copyItems:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty set"), v26, "-[NSSet initWithOrderedSet:range:copyItems:]", location, length);
      v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v24, v22);
      objc_exception_throw(v27);
    }
    v35 = _os_log_pack_size();
    v37 = (char *)&v42 - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    v39 = v12 - 1;
    v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v38, (uint64_t)"-[NSSet initWithOrderedSet:range:copyItems:]", location, length, v39);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v40, "-[NSSet initWithOrderedSet:range:copyItems:]", location, length, v39);
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
  objc_msgSend(a3, "getObjects:range:", v16, location, length, v42, v43);
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
  v20 = -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v16, length);
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

- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

- (NSSet)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return -[NSSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

- (NSSet)initWithOrderedSet:(id)a3
{
  return -[NSSet initWithOrderedSet:range:copyItems:](self, "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), 0);
}

+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, a4.location, a4.length, 0);
}

+ (NSSet)setWithArray:(id)a3 copyItems:(BOOL)a4
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, a5);
}

+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, a4.location, a4.length, 0);
}

+ (NSSet)setWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), a4);
}

+ (NSSet)setWithOrderedSet:(id)a3
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithOrderedSet:range:copyItems:", a3, 0, objc_msgSend(a3, "count"), 0);
}

+ (NSSet)setWithSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSet:copyItems:", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t ShouldCopy;

  ShouldCopy = __NSCollectionsShouldCopy();
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return -[NSSet initWithSet:copyItems:](+[NSSet allocWithZone:](NSSet, "allocWithZone:", a3), "initWithSet:copyItems:", self, ShouldCopy);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSUInteger)count
{
  objc_class *v2;

  OUTLINED_FUNCTION_2_10();
  v2 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_23(v2);
}

- (id)member:(id)object
{
  objc_class *v3;

  OUTLINED_FUNCTION_2_10();
  v3 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_23(v3);
}

- (NSEnumerator)objectEnumerator
{
  objc_class *v2;

  OUTLINED_FUNCTION_2_10();
  v2 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_23(v2);
}

- (NSSet)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  objc_class *v4;

  OUTLINED_FUNCTION_2_10();
  v4 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_23(v4);
}

@end
