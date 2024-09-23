@implementation NSURL(InstallCoordinationAdditions)

- (id)urlByAppendingPathComponents:()InstallCoordinationAdditions lastIsDirectory:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A85A5738]();
  v8 = a1;
  v9 = objc_msgSend(v6, "count");
  if (v9)
  {
    v10 = v9 - 1;
    if (v9 == 1)
    {
      v13 = v8;
    }
    else
    {
      v11 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v8 = v13;
      }
      while (v10 != v11);
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v14, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = v8;

  objc_autoreleasePoolPop(v7);
  return v15;
}

@end
