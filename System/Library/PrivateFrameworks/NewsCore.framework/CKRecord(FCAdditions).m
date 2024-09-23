@implementation CKRecord(FCAdditions)

- (id)fc_safeObjectForKey:()FCAdditions
{
  if (!a3)
    return 0;
  objc_msgSend(a1, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)fc_isDifferentFromRecord:()FCAdditions forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
    v10 = 0;
  else
    v10 = objc_msgSend(v8, "isEqual:", v9) ^ 1;

  return v10;
}

@end
