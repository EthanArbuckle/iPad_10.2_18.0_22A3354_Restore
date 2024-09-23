@implementation AppleGetCPUCapabilities

void __AppleGetCPUCapabilities_block_invoke()
{
  AppleGetCPUCapabilities::gImageIO_cpu_capabilities = MEMORY[0xFFFFFC020];
}

@end
