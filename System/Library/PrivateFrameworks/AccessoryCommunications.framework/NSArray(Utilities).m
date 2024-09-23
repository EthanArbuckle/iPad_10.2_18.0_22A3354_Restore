@implementation NSArray(Utilities)

- (id)truncatedArray:()Utilities
{
  unint64_t v5;
  unint64_t v6;
  id v7;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v7 = a1;
  }
  else
  {
    v5 = objc_msgSend(a1, "count");
    if (v5 >= a3)
      v6 = a3;
    else
      v6 = v5;
    objc_msgSend(a1, "subarrayWithRange:", 0, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
