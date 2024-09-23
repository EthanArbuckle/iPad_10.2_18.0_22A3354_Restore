@implementation IOUserServerMain

void __IOUserServerMain_block_invoke(int8x16_t *a1)
{
  int8x16_t v1;
  IODispatchQueue *v2;
  _QWORD v3[4];
  int8x16_t v4;

  v3[0] = MEMORY[0x24BDAC760];
  v1 = vextq_s8(a1[2], a1[2], 8uLL);
  v2 = *(IODispatchQueue **)(*(_QWORD *)(a1[2].i64[0] + 8) + 24);
  v3[1] = 1107296256;
  v3[2] = __IOUserServerMain_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_71;
  v4 = v1;
  IODispatchQueue::DispatchSync_f(v2, v3, (IODispatchFunction)__IOUserServerMain_block_invoke_2);
}

void __IOUserServerMain_block_invoke_2(uint64_t a1)
{
  __int128 v1;
  IODispatchQueue *v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(IODispatchQueue **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3[1] = 1107296256;
  v3[2] = __IOUserServerMain_block_invoke_3;
  v3[3] = &__block_descriptor_tmp_70;
  v4 = v1;
  IODispatchQueue::DispatchSync_f(v2, v3, (IODispatchFunction)__IOUserServerMain_block_invoke_3);
}

BOOL __IOUserServerMain_block_invoke_3(uint64_t a1)
{
  int program_sdk_version;
  _BOOL8 result;

  program_sdk_version = gIOExecutableSDKVersion;
  if (!gIOExecutableSDKVersion)
  {
    program_sdk_version = dyld_get_program_sdk_version();
    gIOExecutableSDKVersion = program_sdk_version;
  }
  IOLog("OnQueue SDK version 0x%x\n", program_sdk_version);
  if (!IODispatchQueue::OnQueue(*(IODispatchQueue **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)))
    __IOUserServerMain_block_invoke_3_cold_2();
  result = IODispatchQueue::OnQueue(*(IODispatchQueue **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if (!result)
    __IOUserServerMain_block_invoke_3_cold_1();
  return result;
}

void __IOUserServerMain_block_invoke_3_cold_1()
{
  __assert_rtn("IOUserServerMain_block_invoke_3", "uioserver.cpp", 2810, "q2->OnQueue()");
}

void __IOUserServerMain_block_invoke_3_cold_2()
{
  __assert_rtn("IOUserServerMain_block_invoke_3", "uioserver.cpp", 2809, "q1->OnQueue()");
}

@end
