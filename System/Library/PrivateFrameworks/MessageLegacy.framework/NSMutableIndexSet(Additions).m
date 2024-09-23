@implementation NSMutableIndexSet(Additions)

- (uint64_t)mf_intersectIndexes:()Additions
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[65];

  v10[64] = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "count");
  if (result)
  {
    v6 = objc_msgSend(a1, "firstIndex");
    v7 = objc_msgSend(a1, "lastIndex");
    if (objc_msgSend(a3, "firstIndex") <= v7 && objc_msgSend(a3, "lastIndex") >= v6)
    {
      v9[0] = v6;
      v9[1] = v7 - v6 + 1;
      result = objc_msgSend(a1, "getIndexes:maxCount:inIndexRange:", v10, 64, v9);
      if (result)
      {
        v8 = result;
        while (1)
        {
          if ((objc_msgSend(a3, "containsIndex:", v10[--v8]) & 1) == 0)
            objc_msgSend(a1, "removeIndex:", v10[v8]);
          if (!v8)
          {
            result = objc_msgSend(a1, "getIndexes:maxCount:inIndexRange:", v10, 64, v9);
            v8 = result;
            if (!result)
              break;
          }
        }
      }
    }
    else
    {
      return objc_msgSend(a1, "removeAllIndexes");
    }
  }
  return result;
}

@end
