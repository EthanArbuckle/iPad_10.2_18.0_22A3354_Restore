@implementation FedStatsCategoricalTypeCharacterTokenizer

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  return objc_alloc_init((Class)a1);
}

- (id)tokenize:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "addCharactersInString:", CFSTR("%"));
    if (objc_msgSend(v3, "length"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v3, "substringWithRange:", v7, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
        v9 = objc_claimAutoreleasedReturnValue();

        if (v9)
          v10 = (__CFString *)v9;
        else
          v10 = &stru_250C51910;
        objc_msgSend(v4, "addObject:", v10);

        ++v7;
      }
      while (v7 < objc_msgSend(v3, "length"));
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return a3;
}

@end
