@implementation NSObject(BLTNSNullRemoval)

- (id)objectWithNoNSNulls:()BLTNSNullRemoval
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == a1)
    v3 = 0;
  else
    v3 = a1;
  return v3;
}

- (uint64_t)objectWithNSNulls:()BLTNSNullRemoval
{
  return objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (uint64_t)objectSentinelNull
{
  return objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

@end
