@implementation CalDatabaseBackupLocalSubscribedAccountInfos

void __CalDatabaseBackupLocalSubscribedAccountInfos_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accountPropertyForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, v4);

}

@end
