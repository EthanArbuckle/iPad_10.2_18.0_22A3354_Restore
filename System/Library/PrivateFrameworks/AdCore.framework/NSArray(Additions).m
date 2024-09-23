@implementation NSArray(Additions)

- (id)arrayCappedToMaxItems:()Additions
{
  unint64_t v5;
  id v6;

  v5 = objc_msgSend(a1, "count");
  if (v5 <= a3)
  {
    v6 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", v5 - a3, a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
