@implementation AXCheckForCatalogUpdate

void ___AXCheckForCatalogUpdate_block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateCatalogIfNeeded");

  _checkedForCatalogUpdate = 1;
}

@end
