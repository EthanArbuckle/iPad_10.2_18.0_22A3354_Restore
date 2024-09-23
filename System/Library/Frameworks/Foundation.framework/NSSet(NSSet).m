@implementation NSSet(NSSet)

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (void)encodeWithCoder:()NSSet
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  CFStringRef v20;
  void *v21;
  uint64_t v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA28]);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(a1, "count");
      v7 = v6;
      if (v6 >> 60)
      {
        v20 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
        v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v20, 0);
        CFRelease(v20);
        objc_exception_throw(v21);
      }
      v22 = 0;
      v8 = _CFCreateArrayStorage();
      objc_msgSend(a1, "getObjects:", v8);
      if (v8)
      {
        if (v7)
        {
          v9 = (id *)v8;
          v10 = v7;
          do
          {
            v11 = *v9++;
            --v10;
          }
          while (v10);
        }
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "_initByAdoptingBuffer:count:size:", v8, v7, v7);
      }
      else
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", 0, v7);
      }
      v15 = (void *)v12;
      objc_msgSend(a3, "_encodeArrayOfObjects:forKey:", v12, CFSTR("NS.objects"));

    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      if (v16)
      {
        v17 = 0;
        v18 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(a1);
            objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object.%ld"), v17 + i));
          }
          v16 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
          v17 += i;
        }
        while (v16);
      }
    }
  }
  else
  {
    LODWORD(v22) = objc_msgSend(a1, "count");
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &v22);
    v13 = (void *)objc_msgSend(a1, "objectEnumerator");
    for (j = objc_msgSend(v13, "nextObject"); j; j = objc_msgSend(v13, "nextObject"))
      objc_msgSend(a3, "encodeBycopyObject:", j);
  }
}

- (uint64_t)initWithCoder:()NSSet
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
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", &v27, 4);
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
LABEL_31:
      free(v20);
      return v16;
    }
    v25 = objc_msgSend(a3, "decodeObjectForKey:", v24);
    *(_QWORD *)&v20[8 * v21] = v25;
    if (!v25)
    {
      v16 = 0;
      goto LABEL_31;
    }
    ++v21;
  }
  free(v20);
  v28 = CFSTR("NSLocalizedDescription");
  v29[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: set is too large to unarchive (%qd)"), _NSMethodExceptionProem((objc_class *)a1, a2), v22);
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1)));
  return 0;
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

@end
