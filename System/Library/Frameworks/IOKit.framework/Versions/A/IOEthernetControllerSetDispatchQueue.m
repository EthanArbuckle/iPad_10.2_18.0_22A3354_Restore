@implementation IOEthernetControllerSetDispatchQueue

uint64_t __IOEthernetControllerSetDispatchQueue_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[32];

  memset(v5, 0, sizeof(v5));
  result = mach_msg((mach_msg_header_t *)v5, 258, 0, 0x20u, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56), 0, 0);
  if (!(_DWORD)result)
    return __IOEthernetControllerCFMachPortCallBack(result, v3, v4, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __IOEthernetControllerSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t (*v2)(uint64_t, _QWORD);

  result = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t (**)(uint64_t, _QWORD))(result + 168);
  if (v2)
    return v2(result, *(_QWORD *)(result + 176));
  return result;
}

@end
