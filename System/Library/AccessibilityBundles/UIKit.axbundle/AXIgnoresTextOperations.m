@implementation AXIgnoresTextOperations

void __AXIgnoresTextOperations_block_invoke(void *a1)
{
  id v1;
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v1 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2[0] = (id)objc_msgSend(v1, "bundleIdentifier");

  AXIgnoresTextOperations_Ignores = objc_msgSend(v2[0], "isEqualToString:", CFSTR("com.apple.AssetViewer.ASVAssetViewer")) & 1;
  objc_storeStrong(v2, 0);
}

@end
