@implementation NSDictionary(FCTodayPrivateDataTransactionQueue)

- (id)fc_transactions
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("a"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x1E0C9AA60];
  v3 = v1;

  return v3;
}

@end
