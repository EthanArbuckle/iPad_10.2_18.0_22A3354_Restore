@implementation NSExtensionItem(WFNaming)

- (id)wfName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributedTitle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
