@implementation GEOSharedNavSenderInfo(MSPExtras)

- (void)merge:()MSPExtras
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "hasFromDisplayName"))
  {
    objc_msgSend(v5, "fromDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setFromDisplayName:", v4);

  }
}

@end
