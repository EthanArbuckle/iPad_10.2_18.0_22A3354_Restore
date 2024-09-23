@implementation NSURL(HealthRecordServices)

- (id)hrs_fhirResourcePathComponentsAgainstBaseURL:()HealthRecordServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_msgSend(a1, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  while (1)
  {

    if (!objc_msgSend(v8, "count"))
      break;
    objc_msgSend(v8, "hk_dequeue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v7) & 1) == 0)
    {

      break;
    }
    v10 = (id)objc_msgSend(v6, "hk_dequeue");

  }
  objc_msgSend(v6, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("/"));

  if (v12)
  {
    do
    {
      v13 = (id)objc_msgSend(v6, "hk_dequeue");
      objc_msgSend(v6, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("/"));

    }
    while ((v15 & 1) != 0);
  }

  return v6;
}

- (id)hrs_URLByExpandingReference:()HealthRecordServices
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = a1;
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("/"));

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v5, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v11;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
