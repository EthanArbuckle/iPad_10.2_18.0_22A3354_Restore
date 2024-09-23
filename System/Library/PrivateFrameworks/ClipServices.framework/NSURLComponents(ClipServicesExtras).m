@implementation NSURLComponents(ClipServicesExtras)

- (void)cps_addQueryItem:()ClipServicesExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "addObject:", v4);
  objc_msgSend(a1, "setQueryItems:", v9);

}

@end
