@implementation NSPredicate(HREAdditions)

- (uint64_t)isEqualToPredicate:()HREAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v3 = a3;
  objc_msgSend(v3, "predicateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

@end
