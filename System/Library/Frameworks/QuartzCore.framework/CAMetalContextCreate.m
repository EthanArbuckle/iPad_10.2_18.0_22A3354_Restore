@implementation CAMetalContextCreate

uint64_t __CAMetalContextCreate_block_invoke()
{
  uint64_t result;
  unsigned int i;
  mach_port_t v2;
  const __CFDictionary *v3;
  char j;
  io_object_t v5;
  io_iterator_t iterator[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)iterator = 0;
  result = MEMORY[0x186DBCEF8](*MEMORY[0x1E0C81720], &iterator[1]);
  if (!(_DWORD)result)
  {
    for (i = 0; ; ++i)
    {
      v2 = iterator[1];
      v3 = IOServiceMatching("IOAcceleratorES");
      result = IOServiceGetMatchingServices(v2, v3, iterator);
      if ((_DWORD)result)
        break;
      for (j = 0; ; j = 1)
      {
        v5 = IOIteratorNext(iterator[0]);
        if (!v5)
          break;
        IOObjectRelease(v5);
      }
      result = IOObjectRelease(iterator[0]);
      if (j & 1 | (i > 0x12B))
        break;
      usleep(0x186A0u);
    }
  }
  return result;
}

@end
