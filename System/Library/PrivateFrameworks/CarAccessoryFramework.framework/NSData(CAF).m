@implementation NSData(CAF)

+ (id)CAF_encodeBinaryPlistFrom:()CAF error:
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)CAF_decodeBinaryPlist:()CAF
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a1, 0, &v10, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v10 == 200)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CAF_invalidDataForFormat:", v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v6 = 0;
  }

  return v6;
}

@end
