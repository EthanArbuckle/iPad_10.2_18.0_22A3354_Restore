@implementation NSExpression(BRAdditions)

- (uint64_t)br_isKeyPathExpression:()BRAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "expressionType") == 3)
  {
    objc_msgSend(a1, "keyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)br_isConstantValueExpression:()BRAdditions
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "expressionType"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "constantValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v6, "isEqualToString:", v4);
    else
      v5 = 0;

  }
  return v5;
}

@end
