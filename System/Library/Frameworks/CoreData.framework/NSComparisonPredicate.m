@implementation NSComparisonPredicate

- (BOOL)_isForeignObjectExpression:(void *)a3 givenContext:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    if (objc_msgSend(a2, "expressionType"))
      return 0;
    v5 = objc_msgSend(a2, "constantValue");
    if (!v5)
      return 0;
    v6 = (void *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(v6, "objectID");
      if (!v6)
        return 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return 0;
    }
    if ((objc_msgSend(v6, "isTemporaryID") & 1) != 0)
      return 1;
    v7 = objc_msgSend(v6, "persistentStore");
    return v7 != objc_msgSend(a3, "objectForKey:", CFSTR("persistentStore"));
  }
  return result;
}

@end
