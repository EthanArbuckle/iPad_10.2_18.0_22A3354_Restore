@implementation NSArray(DACPLogShared)

- (id)DACPLogSubarrayFromIndexToEndOfArray:()DACPLogShared
{
  void *v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)DACPLogArrayBeginsWithArray:()DACPLogShared
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 <= objc_msgSend(a1, "count"))
  {
    if (objc_msgSend(v4, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "isEqual:", v9);

        if ((v6 & 1) == 0)
          break;
        ++v7;
      }
      while (v7 < objc_msgSend(v4, "count"));
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
