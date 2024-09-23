@implementation NSURL(filePath)

+ (id)fileURLWithString:()filePath
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("file://"));
  v5 = (void *)MEMORY[0x24BDBCF48];
  if (v4)
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("file://"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
