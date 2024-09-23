@implementation NSData(Checksum)

- (id)checksumData
{
  _BYTE v2[32];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "checksum:", v2);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v2, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)checksum:()Checksum
{
  id v4;

  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v4 = objc_retainAutorelease(a1);
  return CC_SHA256((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), (unsigned __int8 *)a3);
}

- (uint64_t)checksumDataToChecksum:()Checksum
{
  *a3 = 0u;
  a3[1] = 0u;
  return objc_msgSend(a1, "getBytes:length:");
}

- (BOOL)matchesChecksum:()Checksum
{
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "checksum:", v8);
  return *a3 == v8[0] && a3[1] == v8[1] && a3[2] == v8[2] && a3[3] == v8[3];
}

- (uint64_t)matchesChecksumData:()Checksum
{
  _BYTE v5[32];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "checksumDataToChecksum:", v5);
  return objc_msgSend(a1, "matchesChecksum:", v5);
}

@end
