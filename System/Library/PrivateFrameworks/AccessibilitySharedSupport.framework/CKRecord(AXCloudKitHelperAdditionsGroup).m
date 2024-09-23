@implementation CKRecord(AXCloudKitHelperAdditionsGroup)

- (uint64_t)entries
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("entries"));
}

- (uint64_t)setEntries:()AXCloudKitHelperAdditionsGroup
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("entries"));
}

- (id)name
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "encryptedValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setName:()AXCloudKitHelperAdditionsGroup
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "encryptedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("name"));

}

- (uint64_t)basePunctuationGroup
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("basePunctuationGroup"));
}

- (uint64_t)setBasePunctuationGroup:()AXCloudKitHelperAdditionsGroup
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("basePunctuationGroup"));
}

@end
