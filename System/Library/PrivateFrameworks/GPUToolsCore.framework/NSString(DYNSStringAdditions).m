@implementation NSString(DYNSStringAdditions)

+ (uint64_t)dy_timeFormat:()DYNSStringAdditions unit:
{
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setMaximumFractionDigits:", 2);
  objc_msgSend(v6, "setAllowsFloats:", 1);
  objc_msgSend(v6, "setUsesGroupingSeparator:", 0);
  objc_msgSend(v6, "setRoundingMode:", 3);
  v7 = fabs(a1);
  if (v7 >= 1.0)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
    v10 = CFSTR(" s");
  }
  else if (v7 >= 0.001)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1 * 1000.0);
    v10 = CFSTR(" ms");
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    if (v7 >= 0.000001)
    {
      v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1 * 1000000.0);
      v10 = CFSTR(" μs");
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1 * 1000000000.0);
      v10 = CFSTR(" ns");
    }
  }
  v11 = objc_msgSend(v6, "stringFromNumber:", v9);
  v12 = &stru_250D63BC0;
  if (a4)
    v12 = v10;
  v13 = objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v11, v12);

  return v13;
}

- (uint64_t)dy_numericCompare:()DYNSStringAdditions
{
  return objc_msgSend(a1, "compare:options:", a3, 64);
}

- (id)dy_removeWhiteSpaceCharacters
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;

  v2 = objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_msgSend(a1, "mutableCopy");
  v4 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v2);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v4; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v3, "rangeOfCharacterFromSet:", v2))
      objc_msgSend(v3, "deleteCharactersInRange:", i, v5);
  }
  return v3;
}

- (uint64_t)dy_scanBuildPrefix:()DYNSStringAdditions number:
{
  void *v7;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a1);
  if (!objc_msgSend(v7, "scanInteger:", 0)
    || !objc_msgSend(v7, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ")), 0))
  {
    return 0;
  }
  if (a3)
    *a3 = objc_msgSend(a1, "substringToIndex:", objc_msgSend(v7, "scanLocation"));
  return objc_msgSend(v7, "scanInteger:", a4);
}

- (BOOL)dy_versionIsOlderThan:()DYNSStringAdditions
{
  return objc_msgSend(a1, "compare:options:", a3, 64) == -1;
}

- (uint64_t)dy_appendComponents:()DYNSStringAdditions usingSeparator:unique:
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "length"))
  {
    v9 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", a4);
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v9 = 0;
    if (a5)
    {
LABEL_3:
      v10 = (void *)objc_opt_new();
      v11 = (void *)objc_opt_new();
      v12 = 0;
      v28[0] = v9;
      v28[1] = a3;
      v13 = 1;
      do
      {
        v14 = v13;
        v15 = (void *)v28[v12];
        if (v15)
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v24;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v24 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
                if ((objc_msgSend(v10, "containsObject:", v20) & 1) == 0)
                {
                  objc_msgSend(v11, "addObject:", v20);
                  objc_msgSend(v10, "addObject:", v20);
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            }
            while (v17);
          }
        }
        v13 = 0;
        v12 = 1;
      }
      while ((v14 & 1) != 0);

      v21 = v11;
      goto LABEL_19;
    }
  }
  if (objc_msgSend(v9, "count"))
  {
    v21 = (id)objc_msgSend(v9, "arrayByAddingObjectsFromArray:", a3);
LABEL_19:
    a3 = v21;
  }
  return objc_msgSend(a3, "componentsJoinedByString:", a4);
}

- (uint64_t)dy_appendComponentsString:()DYNSStringAdditions usingSeparator:unique:
{
  if (objc_msgSend(a3, "length"))
    return objc_msgSend(a1, "dy_appendComponents:usingSeparator:unique:", objc_msgSend(a3, "componentsSeparatedByString:", a4), a4, a5);
  else
    return (uint64_t)a1;
}

- (uint64_t)simplifiedTestFileName:()DYNSStringAdditions
{
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  char v9;
  _BYTE *v10;
  void *v11;
  uint64_t v12;
  uint64_t result;

  if (!objc_msgSend(a1, "length"))
  {
    *a3 = 0;
    return 0;
  }
  v5 = malloc_type_malloc(objc_msgSend(a1, "length") + 1, 0xD459B532uLL);
  v6 = (_BYTE *)objc_msgSend(a1, "cStringUsingEncoding:", 1);
  v7 = v5;
  while (1)
  {
    v8 = *v6;
    v9 = v8 - 32;
    if ((v8 - 32) > 0x3D)
      goto LABEL_9;
    if (((1 << v9) & 0x2800000004008301) == 0)
      break;
    if (v7 > v5 && *(v7 - 1) != 95)
    {
      LOBYTE(v8) = 95;
      goto LABEL_10;
    }
LABEL_11:
    ++v6;
  }
  if (((1 << v9) & 0x84) != 0)
    goto LABEL_11;
LABEL_9:
  if (*v6)
  {
LABEL_10:
    *v7++ = v8;
    goto LABEL_11;
  }
  v10 = v7 - 1;
  if (*(v7 - 1) != 95)
    v10 = v7;
  *v10 = 0;
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  free(v5);
  v12 = objc_msgSend(v11, "length");
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("_0x[0-9a-f]+"), 1, 0), "stringByReplacingMatchesInString:options:range:withTemplate:", v11, 0, 0, v12, &stru_250D63BC0);
  *a3 = 0;
  return result;
}

@end
