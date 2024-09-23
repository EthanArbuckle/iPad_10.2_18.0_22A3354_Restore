@implementation NSArray(PrependStringToItems)

+ (id)arrayWithArray:()PrependStringToItems prependPath:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingPathComponent:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v11, i);

      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
