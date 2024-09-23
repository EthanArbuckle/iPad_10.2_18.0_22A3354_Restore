@implementation TMDeviceHasPMU

uint64_t __TMDeviceHasPMU_block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 8;
  result = sysctlnametomib("kern.monotonicclock_usecs", v2, &v1);
  TMDeviceHasPMU_hasPMU = (_DWORD)result == 0;
  return result;
}

@end
