@implementation SharedTelemetry

CFMutableSetRef __SharedTelemetry_block_invoke()
{
  CFMutableSetRef result;

  _MergedGlobals_496 = (uint64_t)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  result = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6B8]);
  *(_QWORD *)_MergedGlobals_496 = result;
  return result;
}

@end
