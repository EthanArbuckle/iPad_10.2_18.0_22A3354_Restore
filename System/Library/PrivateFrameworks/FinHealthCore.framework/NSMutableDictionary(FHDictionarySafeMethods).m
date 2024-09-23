@implementation NSMutableDictionary(FHDictionarySafeMethods)

- (void)safelySetObject:()FHDictionarySafeMethods forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKey:");
  return a1;
}

- (void)setObjectOrNull:()FHDictionarySafeMethods forKey:
{
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    v8 = a4;
    objc_msgSend(a1, "setObject:forKey:", a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBCEF8];
    v7 = a4;
    objc_msgSend(v6, "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:");

  }
}

- (void)setInt32:()FHDictionarySafeMethods forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setInteger:()FHDictionarySafeMethods forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setLongLong:()FHDictionarySafeMethods forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setUnsignedLongLong:()FHDictionarySafeMethods forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setDouble:()FHDictionarySafeMethods forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setBool:()FHDictionarySafeMethods forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setDate:()FHDictionarySafeMethods forKey:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "description");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "safelySetObject:forKey:", v7, v6);

}

- (void)setOrAddToDecimalValue:()FHDictionarySafeMethods forKey:
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(a1, "setOrAddToDoubleValue:forKey:", v6);

}

- (void)setOrAddToDoubleValue:()FHDictionarySafeMethods forKey:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  id v13;

  v6 = a4;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v9;

  v10 = objc_alloc(MEMORY[0x24BDD1518]);
  objc_msgSend(v13, "doubleValue");
  v12 = (void *)objc_msgSend(v10, "initWithDouble:", v11 + a2);
  objc_msgSend(a1, "safelySetObject:forKey:", v12, v6);

}

- (void)safelyAddObjectToArrayCollection:()FHDictionarySafeMethods forKey:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);
    v9 = objc_msgSend(v8, "copy");
    objc_msgSend(a1, "safelySetObject:forKey:", v9, v6);

    v6 = (id)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "safelySetObject:forKey:", v8, v6);
  }

}

- (void)safelyAddObjectToSetCollection:()FHDictionarySafeMethods forKey:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);
    v9 = objc_msgSend(v8, "copy");
    objc_msgSend(a1, "safelySetObject:forKey:", v9, v6);

    v6 = (id)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "safelySetObject:forKey:", v8, v6);
  }

}

@end
