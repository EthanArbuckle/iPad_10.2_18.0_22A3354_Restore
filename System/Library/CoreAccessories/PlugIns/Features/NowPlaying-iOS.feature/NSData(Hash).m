@implementation NSData(Hash)

- (id)SHA1
{
  id v1;
  _BYTE v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(v3, 170, 20);
  v1 = objc_retainAutorelease(a1);
  CC_SHA1((const void *)objc_msgSend(v1, "bytes", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], v4), objc_msgSend(v1, "length"), v3);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v3, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)SHA256
{
  __int128 v1;
  id v2;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v4 = v1;
  v5 = v1;
  v2 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v2, "bytes", v4, v5), objc_msgSend(v2, "length"), (unsigned __int8 *)&v4);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v4, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
