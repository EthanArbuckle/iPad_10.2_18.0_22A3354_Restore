@implementation ZN27CSCppDyldLoadUnloadNotifierC2ERK22CSCppMachTaskContainerb

void *___ZN27CSCppDyldLoadUnloadNotifierC2ERK22CSCppMachTaskContainerb_block_invoke_2(uint64_t a1)
{
  void **v1;
  void *result;
  _QWORD v3[5];

  v1 = *(void ***)(a1 + 32);
  result = *v1;
  if (*v1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 0x40000000;
    v3[2] = ___ZN27CSCppDyldLoadUnloadNotifierC2ERK22CSCppMachTaskContainerb_block_invoke_3;
    v3[3] = &__block_descriptor_tmp_5_3;
    v3[4] = v1;
    return (void *)_thread_local_invoke_notifier(result, (uint64_t)v3);
  }
  return result;
}

@end
