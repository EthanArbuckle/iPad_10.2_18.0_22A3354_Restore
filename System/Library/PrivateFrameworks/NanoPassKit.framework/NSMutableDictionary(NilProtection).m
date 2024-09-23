@implementation NSMutableDictionary(NilProtection)

- (uint64_t)npkSetObject:()NilProtection forKey:
{
  if (a3)
    return objc_msgSend(a1, "setObject:forKey:");
  else
    return objc_msgSend(a1, "removeObjectForKey:", a4);
}

+ (uint64_t)_processArgumentWithMutableDictionary:()NilProtection object:key:
{
  BOOL v5;
  uint64_t v6;

  if (a4)
    v5 = a5 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
    objc_msgSend(a3, "npkSetObject:forKey:", a4, a5);
  return v6;
}

+ (id)npkDictionaryWithObjectsAndKeys:()NilProtection
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id *v16;
  id v17;
  id v18;
  id *v20;

  v10 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v20 = (id *)&a10;
  v13 = a9;
  if (objc_msgSend(MEMORY[0x24BDBCED8], "_processArgumentWithMutableDictionary:object:key:", v11, v12, v13))
  {
    v14 = v12;
    do
    {
      v15 = *v20;

      v16 = v20 + 1;
      v20 += 2;
      v17 = *v16;

      v14 = v15;
      v13 = v17;
    }
    while ((objc_msgSend(MEMORY[0x24BDBCED8], "_processArgumentWithMutableDictionary:object:key:", v11, v15, v17) & 1) != 0);
  }
  else
  {
    v17 = v13;
    v15 = v12;
  }
  v18 = v11;

  return v18;
}

@end
