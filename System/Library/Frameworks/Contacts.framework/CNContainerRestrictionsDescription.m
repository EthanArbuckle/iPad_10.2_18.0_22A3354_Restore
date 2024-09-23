@implementation CNContainerRestrictionsDescription

- (BOOL)isConvertibleABValue:(void *)a3
{
  BOOL v3;
  unsigned int valuePtr;

  valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr))
    v3 = valuePtr >= 0x10;
  else
    v3 = 1;
  return !v3;
}

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF62D0];
}

- (id)CNValueFromABValue:(void *)a3
{
  char v3;

  v3 = objc_msgSend(a3, "intValue");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3 & 3);
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setRestrictions:", objc_msgSend(a3, "unsignedIntegerValue"));

}

- (id)key
{
  return CFSTR("restrictions");
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
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "restrictions"));
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  unint64_t v5;

  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v5 >= 8)
    CNSetError(a4, 301, 0);
  return v5 < 8;
}

- (void)ABValueFromCNValue:(id)a3
{
  char v3;
  const void *v4;
  CFTypeRef v5;

  v3 = objc_msgSend(a3, "intValue");
  v4 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 & 3);
  if (v4 && (v5 = CFRetain(v4)) != 0)
    return (void *)CFAutorelease(v5);
  else
    return 0;
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  void *v6;

  if (!a3)
    return 1;
  v6 = a3;
  -[CNContainerRestrictionsDescription abPropertyID](self, "abPropertyID");
  ABRecordGetIntValue();
  objc_msgSend(v6, "intValue");

  -[CNContainerRestrictionsDescription abPropertyID](self, "abPropertyID");
  return ABRecordSetIntValue();
}

@end
