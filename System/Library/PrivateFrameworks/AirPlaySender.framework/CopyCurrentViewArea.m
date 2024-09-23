@implementation CopyCurrentViewArea

uint64_t __carEndpoint_CopyCurrentViewArea_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, uint64_t);
  int v6;

  result = carEndpoint_getScreenStreamForDisplayUUID();
  if (result)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    CMBaseObject = FigEndpointStreamGetCMBaseObject();
    v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
      v6 = v5(CMBaseObject, *MEMORY[0x1E0CA4828], 0, v3 + 24);
    else
      v6 = -12782;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
    result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if ((_DWORD)result)
      return APSLogErrorAt();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -16725;
  }
  return result;
}

@end
