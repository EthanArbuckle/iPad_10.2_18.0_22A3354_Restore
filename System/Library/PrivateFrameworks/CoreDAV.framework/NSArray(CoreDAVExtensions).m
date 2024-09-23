@implementation NSArray(CoreDAVExtensions)

+ (id)_arrayWithIntArg:()CoreDAVExtensions additionalArgs:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int *v9;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((_DWORD)a3)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = a3;
    while (1)
    {
      objc_msgSend(v6, "numberWithInt:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      v9 = a4;
      a4 += 2;
      v7 = *v9;
      if (!(_DWORD)v7)
        break;
      v6 = (void *)MEMORY[0x24BDD16E0];
    }
  }
  return v5;
}

+ (id)cdvArrayWithIntegers:()CoreDAVExtensions
{
  objc_msgSend(a1, "_arrayWithIntArg:additionalArgs:", a3, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
