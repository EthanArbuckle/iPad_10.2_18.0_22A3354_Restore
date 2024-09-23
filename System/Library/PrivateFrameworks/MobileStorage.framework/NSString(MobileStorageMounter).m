@implementation NSString(MobileStorageMounter)

+ (id)hexStringWithData:()MobileStorageMounter
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initHexStringWithData:", v4);

  return v5;
}

- (id)initHexStringWithData:()MobileStorageMounter
{
  id v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _BYTE *v10;
  char v11;
  char v12;
  unsigned int v13;
  char v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = objc_msgSend(v4, "length"),
        v7 = (char *)objc_msgSend(objc_retainAutorelease(v5), "bytes"),
        v8 = 2 * v6,
        (v9 = (char *)malloc_type_malloc(2 * v6, 0xFBA8534AuLL)) != 0))
  {
    if (v6)
    {
      v10 = v9 + 1;
      do
      {
        if (*v7 <= 0x9Fu)
          v11 = 48;
        else
          v11 = 55;
        *(v10 - 1) = v11 + (*v7 >> 4);
        v12 = *v7++;
        v13 = v12 & 0xF;
        if (v13 <= 9)
          v14 = 48;
        else
          v14 = 55;
        *v10 = v14 + v13;
        v10 += 2;
        --v6;
      }
      while (v6);
    }
    a1 = (id)objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v9, v8, 1, 1);
    v15 = a1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
