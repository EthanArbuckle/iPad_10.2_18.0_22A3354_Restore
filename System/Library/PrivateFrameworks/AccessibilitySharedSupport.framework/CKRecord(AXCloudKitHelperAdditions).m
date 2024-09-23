@implementation CKRecord(AXCloudKitHelperAdditions)

- (uint64_t)uuid
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("uuid"));
}

- (uint64_t)setUuid:()AXCloudKitHelperAdditions
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("uuid"));
}

- (uint64_t)version
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("version"));
}

- (uint64_t)setVersion:()AXCloudKitHelperAdditions
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("version"));
}

@end
