@implementation CreateCommChannel

uint64_t __central_CreateCommChannel_block_invoke(uint64_t a1)
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
          (v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 88)) != 0))
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

void __routingContextRemoteXPC_CreateCommChannel_block_invoke(uint64_t a1)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 56), *(const void **)(a1 + 40));
}

uint64_t __routingContextResilientRemote_CreateCommChannel_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

void __routingContext_CreateCommChannel_block_invoke(_QWORD *a1)
{
  CFTypeRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(CFTypeRef, uint64_t, uint64_t);
  int v6;
  uint64_t v7;
  CFTypeRef cf;

  cf = 0;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = FigRoutingManagerCopyPickedEndpointForRoutingContext(*(_QWORD *)(a1[5] + 8), &cf);
  v2 = cf;
  if (cf)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      v3 = a1[6];
      v4 = a1[7];
      v5 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 88);
      if (v5)
        v6 = v5(v2, v3, v4);
      else
        v6 = -12782;
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v6;
      if (!*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
      {
        v7 = *(_QWORD *)a1[7];
        if (v7)
          *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = FigRoutingManagerSaveCommunicationChannelUUIDForContext(*(_QWORD *)(a1[5] + 8), v7);
      }
    }
    if (cf)
      CFRelease(cf);
  }
}

@end
