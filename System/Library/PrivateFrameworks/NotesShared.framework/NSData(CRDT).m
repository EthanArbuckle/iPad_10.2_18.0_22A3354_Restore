@implementation NSData(CRDT)

- (uint64_t)mergeWith:()CRDT
{
  uint64_t result;

  result = objc_msgSend(a1, "isEqual:");
  if ((result & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self isEqual:other]", "-[NSData(CRDT) mergeWith:]", 1, 0, CFSTR("Cannot merge NSData with different value."));
  return result;
}

- (uint64_t)initWithICCRCoder:()CRDT
{
  uint64_t v4;

  objc_msgSend(a3, "decodeDataForKey:", CFSTR("self"));
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)encodeWithICCRCoder:()CRDT
{
  return objc_msgSend(a3, "encodeData:forKey:", a1, CFSTR("self"));
}

- (uint64_t)deltaSince:()CRDT in:
{
  return 0;
}

@end
