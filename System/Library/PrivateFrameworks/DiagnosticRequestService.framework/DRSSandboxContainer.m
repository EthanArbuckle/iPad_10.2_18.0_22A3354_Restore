@implementation DRSSandboxContainer

void __DRSSandboxContainer_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C94C40]);
  v3 = (id)objc_msgSend(v0, "initWithContainerIdentifier:environment:", kDRSCloudKitContainerName, 2);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v3);
  v2 = (void *)DRSSandboxContainer_container;
  DRSSandboxContainer_container = v1;

}

@end
