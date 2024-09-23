@implementation HDSourceOrderTransactionCache

id __86___HDSourceOrderTransactionCache__orderedSourceIDsForBundleIdentifier_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "persistentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
