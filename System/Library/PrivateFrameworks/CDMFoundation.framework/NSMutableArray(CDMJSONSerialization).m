@implementation NSMutableArray(CDMJSONSerialization)

- (unint64_t)_cdm_safeJSONTraverse
{
  unint64_t result;
  unint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    v3 = 0;
    while (1)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      objc_msgSend(a1, "objectAtIndexedSubscript:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if ((v5 & 1) != 0)
        break;
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_cdm_safeJSONTraverse");
        goto LABEL_7;
      }
LABEL_8:
      ++v3;
      result = objc_msgSend(a1, "count");
      if (result <= v3)
        return result;
    }
    objc_msgSend(v6, "_cdm_safeJSONString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:atIndexedSubscript:", v8, v3);

LABEL_7:
    goto LABEL_8;
  }
  return result;
}

@end
