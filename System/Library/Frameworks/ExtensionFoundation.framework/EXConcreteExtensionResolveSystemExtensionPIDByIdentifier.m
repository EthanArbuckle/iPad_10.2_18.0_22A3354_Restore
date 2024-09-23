@implementation EXConcreteExtensionResolveSystemExtensionPIDByIdentifier

void __EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.extension.resolution-queue", MEMORY[0x1E0C80D50]);
  v1 = (void *)EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_resolution_queue;
  EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_resolution_queue = (uint64_t)v0;

}

@end
