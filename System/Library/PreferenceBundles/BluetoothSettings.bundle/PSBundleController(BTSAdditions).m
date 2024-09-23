@implementation PSBundleController(BTSAdditions)

- (id)bundleParentController
{
  return objc_loadWeakRetained((id *)(a1 + (int)*MEMORY[0x24BE75688]));
}

@end
