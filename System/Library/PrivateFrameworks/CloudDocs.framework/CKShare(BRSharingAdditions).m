@implementation CKShare(BRSharingAdditions)

- (BOOL)br_isCloudDocsShare
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "valueForKey:", CFSTR("BRAssociatedURLWrapperDataKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
