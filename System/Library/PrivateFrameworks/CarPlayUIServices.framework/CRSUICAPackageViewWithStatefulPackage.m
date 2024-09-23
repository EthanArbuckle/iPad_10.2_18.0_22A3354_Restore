@implementation CRSUICAPackageViewWithStatefulPackage

id __CRSUICAPackageViewWithStatefulPackage_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = *(void **)(a1 + 32);
  if (v3 == 2)
    objc_msgSend(v4, "darkModeState");
  else
    objc_msgSend(v4, "lightModeState");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
