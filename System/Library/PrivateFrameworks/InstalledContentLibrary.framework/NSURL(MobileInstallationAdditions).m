@implementation NSURL(MobileInstallationAdditions)

- (id)MI_URLByAppendingPathComponents:()MobileInstallationAdditions lastIsDirectory:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = (void *)MEMORY[0x1BCCAA068]();
  v8 = a1;
  v9 = objc_msgSend(v6, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = v9 - 1;
    do
    {
      if (v12 == v11)
        v13 = a4;
      else
        v13 = 1;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      ++v11;
      v8 = v15;
    }
    while (v10 != v11);
  }
  else
  {
    v15 = v8;
  }
  v16 = v15;

  objc_autoreleasePoolPop(v7);
  return v16;
}

- (id)MI_allAccessURLs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  while (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

    objc_msgSend(v4, "removeLastObject");
  }
  v6 = (void *)objc_msgSend(v2, "copy");

  return v6;
}

@end
