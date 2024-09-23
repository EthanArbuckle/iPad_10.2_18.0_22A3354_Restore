@implementation PSBundleController(BTSAdditions)

- (id)bundleParentController
{
  return objc_loadWeakRetained((id *)(a1 + (int)*MEMORY[0x1E0D80560]));
}

@end
