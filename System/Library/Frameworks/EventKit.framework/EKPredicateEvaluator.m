@implementation EKPredicateEvaluator

+ (BOOL)evaluatePredicate:(id)a3 withObject:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v5, "ekPredicateEvaluateWithObject:", v6);
  else
    v7 = 0;

  return v7;
}

@end
