@implementation CNContainerIOSLegacyIdentifierDescription

- (void)ABValueForABSource:(void *)a3
{
  void *result;
  ABRecordID valuePtr;

  valuePtr = ABRecordGetRecordID(a3);
  result = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  if (result)
    return (void *)CFAutorelease(result);
  return result;
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setIOSLegacyIdentifier:", objc_msgSend(a3, "intValue"));

}

- (id)key
{
  return CFSTR("iOSLegacyIdentifier");
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
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "iOSLegacyIdentifier"));
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end
