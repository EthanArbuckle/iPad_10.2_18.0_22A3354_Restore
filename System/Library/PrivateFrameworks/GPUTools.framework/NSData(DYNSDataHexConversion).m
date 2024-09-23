@implementation NSData(DYNSDataHexConversion)

- (uint64_t)hexStringWithLength:()DYNSDataHexConversion
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;

  v5 = objc_msgSend(a1, "bytes");
  if (!v5)
    return objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v6 = v5;
  if (objc_msgSend(a1, "length") <= a3)
    a3 = objc_msgSend(a1, "length");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", a3);
  if (a3)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v6 + v8));
      v8 = v9;
    }
    while (a3 > v9++);
  }
  return (uint64_t)v7;
}

@end
