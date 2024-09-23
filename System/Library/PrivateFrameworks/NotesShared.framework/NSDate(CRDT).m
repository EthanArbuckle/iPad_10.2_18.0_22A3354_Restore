@implementation NSDate(CRDT)

- (uint64_t)mergeWith:()CRDT
{
  uint64_t result;

  result = objc_msgSend(a1, "isEqual:");
  if ((result & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self isEqual:other]", "-[NSDate(CRDT) mergeWith:]", 1, 0, CFSTR("Cannot merge NSDate with different value."));
  return result;
}

- (uint64_t)initWithICCRCoder:()CRDT
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasDecodableValueForKey:", CFSTR("doubleValue")))
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("doubleValue"));
    objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = objc_msgSend(a1, "init");
  }

  return v6;
}

- (void)encodeWithICCRCoder:()CRDT
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "timeIntervalSince1970");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("doubleValue"));

}

- (uint64_t)deltaSince:()CRDT in:
{
  return 0;
}

@end
