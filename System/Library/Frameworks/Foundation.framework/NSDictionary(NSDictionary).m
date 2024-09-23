@implementation NSDictionary(NSDictionary)

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:()NSDictionary
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  id *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  CFStringRef v28;
  void *v29;
  uint64_t v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA18]);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(a1, "count");
      v7 = v6;
      if (v6 >> 60)
      {
        v28 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
        v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v28, 0);
        CFRelease(v28);
        objc_exception_throw(v29);
      }
      v30 = 0;
      v8 = _CFCreateArrayStorage();
      v9 = _CFCreateArrayStorage();
      objc_msgSend(a1, "getObjects:andKeys:count:", v9, v8, v7);
      if (v8)
      {
        if (v7)
        {
          v10 = (id *)v8;
          v11 = v7;
          do
          {
            v12 = *v10++;
            --v11;
          }
          while (v11);
        }
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "_initByAdoptingBuffer:count:size:", v8, v7, v7);
      }
      else
      {
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", 0, v7);
      }
      v17 = (void *)v13;
      objc_msgSend(a3, "_encodeArrayOfObjects:forKey:", v13, CFSTR("NS.keys"));

      if (v9)
      {
        if (v7 >= 1)
        {
          v18 = (id *)v9;
          v19 = v7;
          do
          {
            v20 = *v18++;
            --v19;
          }
          while (v19);
        }
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "_initByAdoptingBuffer:count:size:", v9, v7, v7);
      }
      else
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", 0, v7);
      }
      v22 = (void *)v21;
      objc_msgSend(a3, "_encodeArrayOfObjects:forKey:", v21, CFSTR("NS.objects"));

    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v23 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      if (v23)
      {
        v24 = 0;
        v25 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v33 != v25)
              objc_enumerationMutation(a1);
            v27 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(a3, "encodeObject:forKey:", v27, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.key.%ld"), v24 + i));
            objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "objectForKey:", v27), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object.%ld"), v24 + i));
          }
          v23 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
          v24 += i;
        }
        while (v23);
      }
    }
  }
  else
  {
    LODWORD(v30) = objc_msgSend(a1, "count");
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v30);
    v14 = (void *)objc_msgSend(a1, "keyEnumerator");
    for (j = objc_msgSend(v14, "nextObject"); ; j = objc_msgSend(v14, "nextObject"))
    {
      v16 = j;
      if (!j)
        break;
      objc_msgSend(a3, "encodeBycopyObject:", j);
      objc_msgSend(a3, "encodeBycopyObject:", objc_msgSend(a1, "objectForKey:", v16));
    }
  }
}

- (uint64_t)initWithCoder:()NSDictionary
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  double v18;
  uint64_t v19;
  char *v20;
  char *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  NSString *v39;
  NSString *v40;
  uint64_t v41;
  const char *v42;
  objc_class *v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  const __CFString *v47;
  NSString *v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v46 = 0;
    v13 = objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v46, 4);
    v14 = v46;
    if (v46 >> 29)
    {
      objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: array is too large to decode"), _NSMethodExceptionProem(a1, a2));
      return 0;
    }
    MEMORY[0x1E0C80A78](v13);
    v17 = (objc_class *)((char *)&v42 - v16);
    v45 = 0;
    if (v14 >= 0x101)
    {
      v17 = (objc_class *)_CFCreateArrayStorage();
      v44 = 0;
      v20 = (char *)_CFCreateArrayStorage();
      v21 = v20;
      v22 = v17;
    }
    else
    {
      *(_QWORD *)&v18 = MEMORY[0x1E0C80A78](v15).n128_u64[0];
      v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFF0);
      v21 = 0;
      v22 = 0;
      v44 = 0;
      if (!(_DWORD)v14)
      {
LABEL_18:
        v25 = -[objc_class initWithObjects:forKeys:count:](a1, "initWithObjects:forKeys:count:", v20, v17, v14, v18);
        v26 = 8 * v14;
        v27 = v20 - 8;
        v28 = (char *)v17 - 8;
        while (v26)
        {

          v29 = *(void **)&v27[v26];
          v26 -= 8;

        }
        free(v21);
        free(v22);
        return (uint64_t)v25;
      }
    }
    v43 = v22;
    v23 = 0;
    v24 = v14;
    do
    {
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", (char *)v17 + v23, 8, v18);
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", &v20[v23], 8);
      v23 += 8;
      --v24;
    }
    while (v24);
    v22 = v43;
    goto LABEL_18;
  }
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.objects")))
  {
    v6 = objc_msgSend(a3, "_decodeArrayOfObjectsForKey:", CFSTR("NS.objects"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(a3, "_decodeArrayOfObjectsForKey:", CFSTR("NS.keys"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(v7, "count");
        v11 = objc_msgSend(v9, "count");
        if (v10 == v11)
          return (uint64_t)-[objc_class initWithObjects:forKeys:](a1, "initWithObjects:forKeys:", v7, v9);
        v49 = CFSTR("NSLocalizedDescription");
        v50[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("counts dont match between objects (%lu) and keys (%lu)"), v10, v11);
        objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1)));
        return 0;
      }
    }
    a1 = 0;
  }
  v30 = (char *)NSAllocateObjectArray(0x40uLL);
  if (!v30)
    return 0;
  v31 = v30;
  v32 = (char *)NSAllocateObjectArray(0x40uLL);
  if (!v32)
  {
    free(v31);
    return 0;
  }
  v33 = v32;
  v42 = a2;
  v43 = a1;
  v34 = 0;
  v35 = 64;
  while (1)
  {
    if (v35 > v34)
      goto LABEL_30;
    v35 *= 2;
    v36 = NSReallocateObjectArray(v31, v35);
    v37 = NSReallocateObjectArray(v33, v35);
    v38 = v37;
    if (!v36 || !v37)
      break;
    v31 = v36;
    v33 = v37;
LABEL_30:
    v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.key.%ld"), v34);
    if (!objc_msgSend(a3, "containsValueForKey:", v39, v42))
    {
      v25 = -[objc_class initWithObjects:forKeys:count:](v43, "initWithObjects:forKeys:count:", v33, v31, v34);
      goto LABEL_41;
    }
    v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object.%ld"), v34);
    if (!objc_msgSend(a3, "containsValueForKey:", v40))
      goto LABEL_40;
    *(_QWORD *)&v31[8 * v34] = objc_msgSend(a3, "decodeObjectForKey:", v39);
    v41 = objc_msgSend(a3, "decodeObjectForKey:", v40);
    *(_QWORD *)&v33[8 * v34] = v41;
    if (!*(_QWORD *)&v31[8 * v34] || !v41)
      goto LABEL_40;
    ++v34;
  }
  free(v36);
  free(v38);
  v47 = CFSTR("NSLocalizedDescription");
  v48 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: dictionary is too large to unarchive (%qd)"), _NSMethodExceptionProem(v43, v42), v35);
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1)));
LABEL_40:
  v25 = 0;
LABEL_41:
  free(v31);
  free(v33);
  return (uint64_t)v25;
}

- (uint64_t)writeToURL:()NSDictionary error:
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
    ((void (*)(uint64_t, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA18]);
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

- (uint64_t)writeToURL:()NSDictionary atomically:
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
    ((void (*)(uint64_t, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA18]);
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

+ (id)dictionaryWithContentsOfURL:()NSDictionary
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfURL:", a3);
}

+ (id)dictionaryWithContentsOfURL:()NSDictionary error:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfURL:error:", a3, a4);
}

+ (id)newWithContentsOf:()NSDictionary immutable:error:
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

      if ((_NSIsNSDictionary() & 1) != 0)
        goto LABEL_9;

      v13 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ did not contain a top-level dictionary value"), a3);
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

+ (id)dictionaryWithContentsOfFile:()NSDictionary
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithContentsOfFile:", a3);
}

+ (id)newWithContentsOf:()NSDictionary immutable:
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

  if ((_NSIsNSDictionary() & 1) == 0)
  {

    v11 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ did not contain a top-level dictionary value"), a3);
    v14 = CFSTR("NSDebugDescription");
    v15[0] = v11;
    v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 259, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));

    return 0;
  }
  return v10;
}

- (id)descriptionInStringsFileFormat
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (id)objc_msgSend(objc_allocWithZone((Class)NSMutableString), "init");
  v3 = (void *)objc_msgSend(a1, "keyEnumerator");
  v4 = objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = (void *)objc_msgSend(a1, "objectForKey:", v5);
      if (_NSIsNSString())
        v7 = objc_msgSend(v6, "quotedStringRepresentation");
      else
        v7 = objc_msgSend(v6, "description");
      v8 = v7;
      objc_msgSend(v2, "replaceCharactersInRange:withString:", objc_msgSend(v2, "length"), 0, objc_msgSend(v5, "quotedStringRepresentation"));
      objc_msgSend(v2, "replaceCharactersInRange:withString:", objc_msgSend(v2, "length"), 0, CFSTR(" = "));
      objc_msgSend(v2, "appendString:", v8);
      objc_msgSend(v2, "replaceCharactersInRange:withString:", objc_msgSend(v2, "length"), 0, CFSTR(";\n"));
      v5 = (void *)objc_msgSend(v3, "nextObject");
    }
    while (v5);
  }
  return v2;
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

- (uint64_t)writeToFile:()NSDictionary atomically:
{
  uint64_t v4;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v4, *MEMORY[0x1E0C9AA18]);
  v8 = (void *)MEMORY[0x186DA8F78]();
  if (_NSIsPList((uint64_t)a1, 1, (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set")) == 4)
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

- (uint64_t)initWithContentsOfFile:()NSDictionary
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "newWithContentsOf:immutable:", a3, 1);

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSDictionary
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "newWithContentsOf:immutable:", a3, 1);

  return v4;
}

- (id)initWithContentsOfURL:()NSDictionary error:
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

      if ((_NSIsNSDictionary() & 1) != 0)
        goto LABEL_9;

      v12 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ did not contain a top-level dictionary value"), a3);
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

@end
