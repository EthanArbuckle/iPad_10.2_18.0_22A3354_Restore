@implementation NSString(CRDT_Additions)

- (uint64_t)mergeWith:()CRDT_Additions
{
  uint64_t result;

  result = objc_msgSend(a1, "isEqual:");
  if ((result & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self isEqual:other]", "-[NSString(CRDT_Additions) mergeWith:]", 1, 0, CFSTR("Cannot merge NSString with different value."));
  return result;
}

- (uint64_t)initWithICCRCoder:()CRDT_Additions
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "decodeStringForKey:", CFSTR("self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "initWithString:", v4);

  return v5;
}

- (uint64_t)encodeWithICCRCoder:()CRDT_Additions
{
  return objc_msgSend(a3, "encodeString:forKey:", a1, CFSTR("self"));
}

- (uint64_t)deltaSince:()CRDT_Additions in:
{
  return 0;
}

@end
