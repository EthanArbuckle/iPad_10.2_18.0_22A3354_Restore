@implementation NSString(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)

- (id)MPC_storeFrontIdentifierKey
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR(","));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
