@implementation NSData(KSCKMigrationHash)

- (uint64_t)_hashCKMigration
{
  id v1;
  unsigned __int8 md[8];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  if (v4 >= 0)
    return v4;
  else
    return -v4;
}

@end
