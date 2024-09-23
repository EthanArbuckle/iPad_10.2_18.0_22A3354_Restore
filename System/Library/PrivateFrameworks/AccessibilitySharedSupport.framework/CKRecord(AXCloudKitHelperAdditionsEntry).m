@implementation CKRecord(AXCloudKitHelperAdditionsEntry)

- (id)groupUUID
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "encryptedValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("groupUUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  else
    v3 = 0;

  return v3;
}

- (void)setGroupUUID:()AXCloudKitHelperAdditionsEntry
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "encryptedValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("groupUUID"));
}

- (void)setPunctuation:()AXCloudKitHelperAdditionsEntry
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "encryptedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("punctuation"));

}

- (id)punctuation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "encryptedValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("punctuation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)replacement
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "encryptedValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("replacement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setReplacement:()AXCloudKitHelperAdditionsEntry
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "encryptedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("replacement"));

}

- (id)rule
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "encryptedValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("rule"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setRule:()AXCloudKitHelperAdditionsEntry
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "encryptedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("rule"));

}

@end
