@implementation SOSViewsGetV0ViewSet

CFSetRef __SOSViewsGetV0ViewSet_block_invoke(uint64_t a1)
{
  CFSetRef result;
  const void *v3[2];

  v3[1] = *(const void **)MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("KeychainV0");
  result = CFSetCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, 1, MEMORY[0x1E0C9B3B0]);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
