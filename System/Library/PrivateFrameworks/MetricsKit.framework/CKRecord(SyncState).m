@implementation CKRecord(SyncState)

- (uint64_t)mt_isSynchronized
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_mt_isSynchronized);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)mt_setSynchronized:()SyncState
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_mt_isSynchronized, v2, (void *)3);

}

- (id)mt_secretValue
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_getAssociatedObject(a1, sel_mt_secretValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "encryptedValuesByKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secretValue"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)mt_setSecretValue:()SyncState
{
  void *v4;
  id value;

  value = a3;
  objc_msgSend(a1, "encryptedValuesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", value, CFSTR("secretValue"));

  objc_setAssociatedObject(a1, sel_mt_secretValue, value, (void *)3);
}

@end
