@implementation CRXUIsVM

uint64_t __CRXUIsVM_block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!(_DWORD)result)
    CRXUIsVM_result = v2 != 0;
  return result;
}

@end
