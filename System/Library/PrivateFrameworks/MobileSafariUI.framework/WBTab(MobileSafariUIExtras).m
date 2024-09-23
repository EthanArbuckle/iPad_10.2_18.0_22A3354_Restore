@implementation WBTab(MobileSafariUIExtras)

- (id)addressForNewBookmark
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_originalDataAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
