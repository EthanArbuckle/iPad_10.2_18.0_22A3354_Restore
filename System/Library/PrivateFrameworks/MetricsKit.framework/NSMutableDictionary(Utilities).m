@implementation NSMutableDictionary(Utilities)

- (void)mt_removeNaNValues
{
  void *v2;
  id v3;

  objc_msgSend(a1, "keysOfEntriesPassingTest:", &__block_literal_global_22);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectsForKeys:", v2);

}

@end
