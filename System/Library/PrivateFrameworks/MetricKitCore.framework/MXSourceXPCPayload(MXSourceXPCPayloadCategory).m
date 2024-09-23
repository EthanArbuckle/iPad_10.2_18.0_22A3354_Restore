@implementation MXSourceXPCPayload(MXSourceXPCPayloadCategory)

- (id)bundleID
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "metrics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)sourceIDString
{
  return objc_msgSend(&unk_24E2FEFE8, "objectAtIndexedSubscript:", objc_msgSend(a1, "sourceID"));
}

@end
