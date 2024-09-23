@implementation FPItem(DOCUtils)

- (BOOL)doc_isAppContainerRoot
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "fp_appContainerBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
