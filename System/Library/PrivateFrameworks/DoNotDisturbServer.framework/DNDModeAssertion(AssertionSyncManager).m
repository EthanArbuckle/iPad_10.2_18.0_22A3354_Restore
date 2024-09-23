@implementation DNDModeAssertion(AssertionSyncManager)

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

- (BOOL)isClientScheduled
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "isInternalScheduled") & 1) != 0)
    return 0;
  objc_msgSend(a1, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "reason") == 2;

  return v2;
}

- (BOOL)isUserInitiated
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "reason") == 1)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "details");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "reason") == 3;

  }
  return v3;
}

@end
