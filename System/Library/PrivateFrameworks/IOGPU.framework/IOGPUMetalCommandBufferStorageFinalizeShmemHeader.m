@implementation IOGPUMetalCommandBufferStorageFinalizeShmemHeader

uint64_t __IOGPUMetalCommandBufferStorageFinalizeShmemHeader_block_invoke(uint64_t result, uint64_t a2, BOOL *a3)
{
  unsigned int *v3;
  uint64_t v4;

  v3 = *(unsigned int **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  v4 = *v3;
  v3[v4 + 1] = *(_DWORD *)(a2 + 40);
  **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v4 + 1;
  *a3 = (_DWORD)v4 == 39;
  return result;
}

@end
