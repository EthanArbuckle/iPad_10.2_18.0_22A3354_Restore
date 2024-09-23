@implementation DNDModeAssertionInvalidation(AssertionSyncManager)

- (uint64_t)isInternalScheduled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "source");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR(".private.schedule"));

  return v3;
}

- (BOOL)isUserInvalidated
{
  objc_msgSend(a1, "reason");
  objc_msgSend(a1, "reasonOverride");
  return DNDResolvedModeAssertionInvalidationReason() == 2;
}

@end
