@implementation NSRegularExpression(ITK)

+ (id)itk_regexForSearchStrings:()ITK
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(v4, "appendString:", CFSTR("("));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v10);

          objc_msgSend(v4, "appendString:", CFSTR("|"));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "length"))
      objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, &stru_250F9E800);
    objc_msgSend(v4, "appendString:", CFSTR(")"));
    v13 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v4, 1, &v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
