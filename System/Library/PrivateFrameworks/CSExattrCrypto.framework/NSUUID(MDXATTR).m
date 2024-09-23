@implementation NSUUID(MDXATTR)

- (uint64_t)MDUUIDData
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v2, 16);
}

@end
