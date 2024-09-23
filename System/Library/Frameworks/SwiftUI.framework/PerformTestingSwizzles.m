@implementation PerformTestingSwizzles

uint64_t ___PerformTestingSwizzles_block_invoke()
{
  objc_msgSend(MEMORY[0x1E0DC3BF8], "_performSwiftUITestingOverrides");
  return objc_msgSend(MEMORY[0x1E0DC35B8], "_performSwiftUITestingOverrides");
}

@end
