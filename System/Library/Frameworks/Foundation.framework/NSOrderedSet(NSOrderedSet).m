@implementation NSOrderedSet(NSOrderedSet)

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (uint64_t)initWithCoder:()NSOrderedSet
{
  unint64_t v6;
  void *v7;
  unint64_t i;
  char *v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSOrderedSets cannot be decoded by non-keyed coders"), 0));
  v6 = 128;
  v7 = NSAllocateObjectArray(0x80uLL);
  for (i = 0; ; ++i)
  {
    if (v6 > i)
      goto LABEL_6;
    v6 *= 2;
    v9 = NSReallocateObjectArray(v7, v6);
    if (!v9)
      break;
    v7 = v9;
LABEL_6:
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object.%lu"), i);
    if (!objc_msgSend(a3, "containsValueForKey:", v10))
    {
      v12 = objc_msgSend(a1, "initWithObjects:count:", v7, i);
      goto LABEL_12;
    }
    v11 = objc_msgSend(a3, "decodeObjectForKey:", v10);
    *((_QWORD *)v7 + i) = v11;
    if (!v11)
      goto LABEL_11;
  }
  v15 = CFSTR("NSLocalizedDescription");
  v16[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: ordered set is too large to decode (%llu)"), _NSMethodExceptionProem((objc_class *)a1, a2), v6);
  v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C9AFB8], 4864, v13));
  v7 = 0;
LABEL_11:
  v12 = 0;
LABEL_12:
  free(v7);
  return v12;
}

- (uint64_t)encodeWithCoder:()NSOrderedSet
{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(void *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(a1, v3, *MEMORY[0x1E0C9AA20]);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSOrderedSets cannot be encoded by non-keyed coders"), 0));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (result)
  {
    v7 = result;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a1);
        objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object.%lu"), v8 + v10));
        ++v10;
      }
      while (v7 != v10);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      v7 = result;
      v8 += v10;
    }
    while (result);
  }
  return result;
}

@end
