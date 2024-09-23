@implementation InitializeSysdiagnoseBlockRegistry

CFMutableDictionaryRef __InitializeSysdiagnoseBlockRegistry_block_invoke()
{
  CFMutableDictionaryRef result;
  CFDictionaryValueCallBacks v1;

  *(_OWORD *)&v1.version = xmmword_1E28DCB38;
  *(_OWORD *)&v1.release = *(_OWORD *)&off_1E28DCB48;
  v1.equal = 0;
  gFigSysdiagnoseBlockRegistry_0 = (uint64_t)dispatch_queue_create("FigSysdiagnoseBlockRegistryQueue", 0);
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], &v1);
  gFigSysdiagnoseBlockRegistry_1 = (uint64_t)result;
  return result;
}

@end
