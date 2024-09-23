@implementation NSObject(PKAccessibility)

- (uint64_t)pkaxRespondsToSelector:()PKAccessibility fromExtrasProtocol:
{
  int v4;

  v4 = objc_msgSend(a1, "conformsToProtocol:", a4);
  if (v4)
    LOBYTE(v4) = objc_opt_respondsToSelector();
  return v4 & 1;
}

- (id)pkaxValueForKey:()PKAccessibility
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
