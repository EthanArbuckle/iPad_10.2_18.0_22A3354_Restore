@implementation NSData(ValidateSize)

- (id)lengthValidatedBuffer
{
  id v1;
  int v2;
  void *v3;
  unint64_t v5;
  uint64_t v6;
  unsigned __int16 v7;

  v7 = 0;
  v1 = objc_retainAutorelease(a1);
  v6 = objc_msgSend(v1, "bytes");
  v5 = objc_msgSend(v1, "length");
  v2 = readSize(&v6, (uint64_t *)&v5, &v7, 0);
  v3 = 0;
  if (!v2)
  {
    if (v5 < v7)
      return 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
