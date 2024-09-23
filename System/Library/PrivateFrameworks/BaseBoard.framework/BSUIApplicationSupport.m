@implementation BSUIApplicationSupport

+ (id)GSEventPortNameForBundleID:(id)a3
{
  objc_msgSend(a3, "stringByAppendingString:", CFSTR(".gsEvents"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)resolveServiceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[BSMachServiceAliases environmentAliases](BSMachServiceAliases, "environmentAliases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolveMachService:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultEnvironment
{
  void *v2;
  void *v3;

  +[BSMachServiceAliases environmentAliases](BSMachServiceAliases, "environmentAliases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environmentRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
