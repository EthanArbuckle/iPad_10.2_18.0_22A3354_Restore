@implementation CreateRemoteControlSession

uint64_t __central_CreateRemoteControlSession_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t result;

  if (**(_BYTE **)(a1 + 40))
  {
    result = 4294954511;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2
      && (v3 = *(_QWORD *)(a1 + 56),
          v4 = *(_QWORD *)(a1 + 64),
          (v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 80)) != 0))
    {
      result = v5(v2, v3, v4);
    }
    else
    {
      result = 4294954514;
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
