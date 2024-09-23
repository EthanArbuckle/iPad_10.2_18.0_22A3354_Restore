@implementation _COClusterRealmPair

+ (id)realmForCurrent
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE64BE0], "predicateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[COClusterRealm _initWithPredicate:]([_COClusterRealmPair alloc], "_initWithPredicate:", v2);

  return v3;
}

- (id)_identifierForGroupResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HomeKitMediaSystemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
