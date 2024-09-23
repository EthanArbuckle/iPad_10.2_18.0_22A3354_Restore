@implementation UIResponder(SafariServicesExtras)

- (BOOL)sf_inResponderChain
{
  uint64_t v2;
  void *v3;
  _BOOL8 i;
  void *v5;

  objc_msgSend(a1, "firstResponder");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  for (i = v2 != 0; v3 != a1 && v3; i = v3 != 0)
  {
    v5 = v3;
    objc_msgSend(v3, "nextResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return i;
}

@end
