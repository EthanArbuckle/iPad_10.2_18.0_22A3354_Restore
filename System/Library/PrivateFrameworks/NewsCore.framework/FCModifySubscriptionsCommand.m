@implementation FCModifySubscriptionsCommand

- (FCModifySubscriptionsCommand)initWithSubscriptions:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  FCModifySubscriptionsCommand *v7;

  v4 = a4;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_97);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v6, v4);

  return v7;
}

uint64_t __60__FCModifySubscriptionsCommand_initWithSubscriptions_merge___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fc_isLaterThan:", v8);
  if (v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("dateAdded"));

  }
  return v9;
}

@end
