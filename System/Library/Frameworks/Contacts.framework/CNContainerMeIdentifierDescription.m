@implementation CNContainerMeIdentifierDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF6310];
}

- (id)CNValueFromABValue:(void *)a3
{
  return (id)objc_msgSend(a3, "stringValue");
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  objc_msgSend(a4, "setMeIdentifier:", a3);
}

- (id)key
{
  return CFSTR("meIdentifier");
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(a3, "meIdentifier");
}

- (void)ABValueFromCNValue:(id)a3
{
  uint64_t v3;
  const void *v4;
  CFTypeRef v5;

  v3 = objc_msgSend(a3, "intValue");
  v4 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  if (v4 && (v5 = CFRetain(v4)) != 0)
    return (void *)CFAutorelease(v5);
  else
    return 0;
}

@end
