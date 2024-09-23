@implementation NSMutableDictionary(IC)

- (void)ic_setNonNilObject:()IC forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKeyedSubscript:");
  return a1;
}

- (void)ic_setNonNilObject:()IC forNonNilKey:
{
  if (a3)
  {
    if (a4)
      return (void *)objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
  return a1;
}

- (void)ic_removeObjectForNonNilKey:()IC
{
  if (a3)
    return (void *)objc_msgSend(a1, "removeObjectForKey:");
  return a1;
}

- (uint64_t)ic_addKey:()IC forNonNilObject:
{
  return objc_msgSend(a1, "ic_setNonNilObject:forKey:", a4, a3);
}

+ (id)ic_dictionaryFromNonNilDictionary:()IC
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
