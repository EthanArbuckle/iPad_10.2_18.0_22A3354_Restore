@implementation DRSRapidSandboxContainer

void __DRSRapidSandboxContainer_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.perfpowerservices.rapid"), 2);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v2);
  v1 = (void *)DRSRapidSandboxContainer_container;
  DRSRapidSandboxContainer_container = v0;

}

@end
