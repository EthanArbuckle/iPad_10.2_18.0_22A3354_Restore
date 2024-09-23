@implementation NSArray(NSArray)

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (uint64_t)encodeWithCoder:()NSArray
{
  uint64_t v3;
  __objc2_class *Class;
  objc_class *v8;
  IMP MethodImplementation;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[5];
  int v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA08]);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    Class = (__objc2_class *)object_getClass(a3);
    if (Class == NSKeyedArchiver)
      return objc_msgSend(a3, "_encodeArrayOfObjects:forKey:", a1, CFSTR("NS.objects"));
    v8 = (objc_class *)Class;
    if (Class == NSXPCEncoder)
      return objc_msgSend(a3, "_encodeArrayOfObjects:forKey:", a1, CFSTR("NS.objects"));
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__NSArray_NSArray__encodeWithCoder___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = sel_encodeObject_forKey_;
    if (qword_1ECD09B08 != -1)
      dispatch_once(&qword_1ECD09B08, block);
    MethodImplementation = class_getMethodImplementation(v8, sel_encodeObject_forKey_);
    if (MethodImplementation == (IMP)_MergedGlobals_90 || MethodImplementation == (IMP)qword_1ECD09B00)
    {
      return objc_msgSend(a3, "_encodeArrayOfObjects:forKey:", a1, CFSTR("NS.objects"));
    }
    else
    {
LABEL_12:
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
      if (result)
      {
        v11 = result;
        v12 = 0;
        v13 = *(_QWORD *)v23;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(a1);
            objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object.%ld"), v12 + v14));
            ++v14;
          }
          while (v11 != v14);
          result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          v11 = result;
          v12 += v14;
        }
        while (result);
      }
    }
  }
  else
  {
    v15 = objc_msgSend(a1, "count");
    if (v15 >> 29)
    {
      return objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: array count (%lu) makes array too large to fit in non-keyed archive"), _NSMethodExceptionProem((objc_class *)a1, a2), v15);
    }
    else
    {
      v20 = v15;
      objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v20);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      if (result)
      {
        v16 = result;
        v17 = *(_QWORD *)v28;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(a1);
            objc_msgSend(a3, "encodeBycopyObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18++));
          }
          while (v16 != v18);
          result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
          v16 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)initWithCoder:()NSArray
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char *v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  NSString *v24;
  uint64_t v25;
  _QWORD v26[2];
  unsigned int v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v27 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v27, 4);
    v8 = v27;
    if (v27)
      v9 = v27;
    else
      v9 = 1;
    *(_QWORD *)&v10 = MEMORY[0x1E0C80A78](v9).n128_u64[0];
    v12 = (char *)v26 - v11;
    v26[1] = 0;
    if (v8 >= 0x101)
    {
      v13 = (char *)_CFCreateArrayStorage();
      v12 = v13;
    }
    else
    {
      v13 = 0;
      if (!(_DWORD)v8)
      {
LABEL_16:
        v16 = objc_msgSend(a1, "initWithObjects:count:", v12, v8, v10);
        for (i = 8 * v8; i; i -= 8)
        {
          v18 = *(void **)&v12[i - 8];

        }
        free(v13);
        return v16;
      }
    }
    v14 = v12;
    v15 = v8;
    do
    {
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", v14, 8, v10);
      v14 += 8;
      --v15;
    }
    while (v15);
    goto LABEL_16;
  }
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.objects")))
  {
    v6 = objc_msgSend(a3, "_decodeArrayOfObjectsForKey:", CFSTR("NS.objects"));
    if (v6)
      return objc_msgSend(a1, "initWithArray:", v6);
    a1 = 0;
  }
  v19 = (char *)NSAllocateObjectArray(0x80uLL);
  if (!v19)
    return 0;
  v20 = v19;
  v21 = 0;
  v22 = 128;
  while (1)
  {
    if (v22 > v21)
      goto LABEL_26;
    v22 *= 2;
    v23 = NSReallocateObjectArray(v20, v22);
    if (!v23)
      break;
    v20 = v23;
LABEL_26:
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object.%ld"), v21);
    if (!objc_msgSend(a3, "containsValueForKey:", v24))
    {
      v16 = objc_msgSend(a1, "initWithObjects:count:", v20, v21);
      goto LABEL_33;
    }
    v25 = objc_msgSend(a3, "decodeObjectForKey:", v24);
    *(_QWORD *)&v20[8 * v21] = v25;
    if (!v25)
      goto LABEL_32;
    ++v21;
  }
  v28 = CFSTR("NSLocalizedDescription");
  v29[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: array is too large to unarchive (%qd)"), _NSMethodExceptionProem((objc_class *)a1, a2), v22);
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1)));
LABEL_32:
  v16 = 0;
LABEL_33:
  free(v20);
  return v16;
}

- (uint64_t)writeToFile:()NSArray atomically:
{
  uint64_t v4;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA08]);
  v8 = (void *)MEMORY[0x186DA8F78]();
  if (_NSIsPList((uint64_t)a1, 1, (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set")) == 3)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0
      || !objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSWriteOldStylePropertyLists")))
    {
      v9 = -[NSData writeToFile:atomically:](+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a1, 100, 0, 0), "writeToFile:atomically:", a3, a4);
    }
    else
    {
      v9 = objc_msgSend((id)objc_msgSend(a1, "_stringToWrite"), "writeToFile:atomically:encoding:error:", a3, a4, +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding"), 0);
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  objc_autoreleasePoolPop(v8);
  return v10;
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

+ (id)arrayWithContentsOfFile:()NSArray
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfFile:", a3);
}

+ (id)newWithContentsOf:()NSArray immutable:
{
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSString *v11;
  NSError *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  if (!a3)
    return 0;
  v6 = _NSIsNSString();
  v7 = objc_allocWithZone(MEMORY[0x1E0C99D50]);
  v8 = v6
     ? objc_msgSend(v7, "initWithContentsOfFile:options:error:", a3, 0, &v13)
     : objc_msgSend(v7, "initWithContentsOfURL:options:error:", a3, 0, &v13);
  v9 = (void *)v8;
  if (!v8)
    return 0;
  v10 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v8, a4 ^ 1u, 0, &v13);

  if ((_NSIsNSArray() & 1) == 0)
  {

    v11 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ did not contain a top-level array value"), a3);
    v14 = CFSTR("NSDebugDescription");
    v15[0] = v11;
    v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 259, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));

    return 0;
  }
  return v10;
}

+ (id)newWithContentsOf:()NSArray immutable:error:
{
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSString *v13;
  NSError *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  if (a3)
  {
    v8 = _NSIsNSString();
    v9 = objc_allocWithZone(MEMORY[0x1E0C99D50]);
    v10 = v8
        ? objc_msgSend(v9, "initWithContentsOfFile:options:error:", a3, 0, &v15)
        : objc_msgSend(v9, "initWithContentsOfURL:options:error:", a3, 0, &v15);
    v11 = (void *)v10;
    if (v10)
    {
      v12 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v10, a4 ^ 1u, 0, &v15);

      if ((_NSIsNSArray() & 1) != 0)
        goto LABEL_9;

      v13 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ did not contain a top-level array value"), a3);
      v16 = CFSTR("NSDebugDescription");
      v17[0] = v13;
      v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 259, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1));

    }
  }
  v12 = 0;
LABEL_9:
  if (a5)
    *a5 = v15;
  return v12;
}

- (id)debugDescription
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v1, *MEMORY[0x1E0C9AA08]);
  v3 = (void *)objc_msgSend(objc_allocWithZone((Class)NSMutableString), "init");
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>(\n"), objc_opt_class(), a1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a1);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((v6 & 1) != 0)
          objc_msgSend(v3, "appendString:", CFSTR(",\n"));
        objc_msgSend(v3, "appendString:", objc_msgSend(v9, "debugDescription"));
        ++v8;
        v6 = 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "appendString:", CFSTR("\n)\n"));
  return v3;
}

- (uint64_t)sortedArrayUsingFunction:()NSArray context:hint:
{
  uint64_t v5;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  _QWORD *v13;
  unsigned int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  size_t v20;
  size_t v21;
  BOOL v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  size_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void *v35;

  if (!a3)
  {
    v35 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: compare function pointer is NULL"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v35);
  }
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(objc_class *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v5, *MEMORY[0x1E0C9AA08]);
  v8 = objc_msgSend(a5, "length");
  v9 = v8 >> 2;
  v10 = -[objc_class count](a1, "count");
  v11 = (char *)NSAllocateObjectArray(2 * v10 + (v8 >> 2));
  bzero(v11, v8 & 0xFFFFFFFFFFFFFFFCLL);
  -[objc_class getObjects:range:](a1, "getObjects:range:", &v11[8 * (v8 >> 2)], 0, v10);
  v12 = (v8 & 0xFFFFFFFFFFFFFFFCLL) + 13;
  v13 = malloc_type_calloc(v12, 0x10uLL, 0x100004000313F17uLL);
  v14 = (unsigned int *)objc_msgSend(a5, "bytes");
  if (v8 >= 4)
  {
    v15 = 0;
    if (v9 <= 1)
      v16 = 1;
    else
      v16 = v8 >> 2;
    do
    {
      v18 = *v14++;
      v17 = v18;
      v19 = -8;
      v20 = v18;
      while (1)
      {
        v21 = v20 % v12;
        if (!v13[2 * v21])
          break;
        v20 = v21 + 5;
        v22 = __CFADD__(v19++, 1);
        if (v22)
        {
          ++v15;
          goto LABEL_14;
        }
      }
      v13[2 * v21] = ++v15;
      *(_QWORD *)((char *)v13 + ((16 * v21) | 8)) = v17;
LABEL_14:
      ;
    }
    while (v15 != v16);
  }
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      v24 = *(void **)&v11[8 * i + 8 * v9];
      v25 = objc_msgSend(v24, "hash");
      v26 = -8;
      v27 = v25;
      while (1)
      {
        v28 = v27 % v12;
        v29 = v13[2 * v28];
        if (v29)
        {
          if (*(_QWORD *)((char *)v13 + ((16 * v28) | 8)) == v25)
            break;
        }
        v27 = v28 + 5;
        v22 = __CFADD__(v26++, 1);
        if (v22)
          goto LABEL_25;
      }
      if (!*(_QWORD *)&v11[8 * v29 - 8])
      {
        *(_QWORD *)&v11[8 * v29 - 8] = v24;
        *(_QWORD *)&v11[8 * i + 8 * v9] = 0;
      }
LABEL_25:
      ;
    }
  }
  free(v13);
  v30 = v9 + v10;
  if (v9 + v10)
  {
    v31 = 0;
    v32 = v11;
    do
    {
      if (*(_QWORD *)v32)
        *(_QWORD *)&v11[8 * v31++] = *(_QWORD *)v32;
      v32 += 8;
      --v30;
    }
    while (v30);
  }
  CFMergeSortArray();
  v33 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, v10);
  free(v11);
  return v33;
}

- (uint64_t)sortedArrayHint
{
  size_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = 4 * objc_msgSend(a1, "count");
  v3 = malloc_type_malloc(v2, 0x6C64A1FCuLL);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(a1);
        *v7++ = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "hash");
      }
      while (v5 != v8);
      v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v5);
  }
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v3, v2, 1);
}

- (uint64_t)sortedArrayUsingSelector:()NSArray hint:
{
  uint64_t v4;
  void *v9;

  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: compare selector is 0"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v9);
  }
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(objc_class *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA08]);
  return -[objc_class sortedArrayUsingFunction:context:hint:](a1, "sortedArrayUsingFunction:context:hint:", _NSUseParamAsSortSelector, a3, a4);
}

+ (id)arrayWithContentsOfURL:()NSArray
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfURL:", a3);
}

+ (id)arrayWithContentsOfURL:()NSArray error:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfURL:error:", a3, a4);
}

- (uint64_t)initWithContentsOfFile:()NSArray
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "newWithContentsOf:immutable:", a3, 1);

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSArray
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "newWithContentsOf:immutable:", a3, 1);

  return v4;
}

- (id)initWithContentsOfURL:()NSArray error:
{
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSString *v12;
  NSError *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14 = 0;
  if (a3)
  {
    v7 = _NSIsNSString();
    v8 = objc_allocWithZone(MEMORY[0x1E0C99D50]);
    v9 = v7
       ? objc_msgSend(v8, "initWithContentsOfFile:options:error:", a3, 0, &v14)
       : objc_msgSend(v8, "initWithContentsOfURL:options:error:", a3, 0, &v14);
    v10 = (void *)v9;
    if (v9)
    {
      v11 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v9, 0, 0, &v14);

      if ((_NSIsNSArray() & 1) != 0)
        goto LABEL_9;

      v12 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ did not contain a top-level array value"), a3);
      v15 = CFSTR("NSDebugDescription");
      v16[0] = v12;
      v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 259, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));

    }
  }
  v11 = 0;
LABEL_9:
  if (a4)
    *a4 = v14;

  return v11;
}

- (uint64_t)_stringToWrite
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "descriptionWithLocale:indent:", 0, 0);
  if ((objc_msgSend(v1, "hasSuffix:", CFSTR("\n")) & 1) != 0)
    return (uint64_t)v1;
  else
    return objc_msgSend(v1, "stringByAppendingString:", CFSTR("\n"));
}

- (uint64_t)writeToURL:()NSArray atomically:
{
  uint64_t v4;
  void *v8;
  NSData *v9;
  id v11;
  id v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
  {
    ((void (*)(uint64_t, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA08]);
    if (!a3)
      return 0;
  }
  else if (!a3)
  {
    return 0;
  }
  v13[0] = 0;
  v8 = (void *)MEMORY[0x186DA8F78]();
  v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a1, 100, 0, v13);
  if (v9 && -[NSData writeToURL:options:error:](v9, "writeToURL:options:error:", a3, a4, v13))
  {
    objc_autoreleasePoolPop(v8);
    return 1;
  }
  v11 = v13[0];
  objc_autoreleasePoolPop(v8);
  v12 = v13[0];
  return 0;
}

- (uint64_t)writeToURL:()NSArray error:
{
  uint64_t v4;
  void *v8;
  NSData *v9;
  id v11;
  id v12;
  id v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(uint64_t, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA08]);
  v14[0] = 0;
  v8 = (void *)MEMORY[0x186DA8F78]();
  v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a1, 100, 0, v14);
  if (v9 && -[NSData writeToURL:options:error:](v9, "writeToURL:options:error:", a3, 1, v14))
  {
    objc_autoreleasePoolPop(v8);
    return 1;
  }
  else
  {
    v11 = v14[0];
    objc_autoreleasePoolPop(v8);
    v12 = v14[0];
    if (a4)
      *a4 = v14[0];
    v13 = v12;
    return 0;
  }
}

@end
