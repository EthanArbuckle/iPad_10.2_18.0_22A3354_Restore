@implementation PBCodable(HDCodingSupport)

- (uint64_t)encodedByteCount
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1BCCACAC4]();
  objc_msgSend(a1, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  objc_autoreleasePoolPop(v2);
  return v4;
}

@end
