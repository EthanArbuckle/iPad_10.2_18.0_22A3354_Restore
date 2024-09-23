@implementation DRSProductionContainer

void __DRSProductionContainer_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C94C40]);
  v3 = (id)objc_msgSend(v0, "initWithContainerIdentifier:environment:", kDRSCloudKitContainerName, 1);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v3);
  v2 = (void *)DRSProductionContainer_container;
  DRSProductionContainer_container = v1;

}

@end
