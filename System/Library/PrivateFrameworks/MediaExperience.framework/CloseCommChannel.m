@implementation CloseCommChannel

uint64_t __central_CloseCommChannel_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
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
          (v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 104)) != 0))
    {
      result = v4(v2, v3);
    }
    else
    {
      result = 4294954514;
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __routingContextRemoteXPC_CloseCommChannel_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex FirstIndexOfValue;
  CFRange v4;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 56);
  v4.length = CFArrayGetCount(v2);
  v4.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v4, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 56), FirstIndexOfValue);
}

uint64_t __routingContextResilientRemote_CloseCommChannel_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 128);
  if (v4)
    return v4(a2, v3);
  else
    return 4294954514;
}

void __routingContext_CloseCommChannel_block_invoke(_QWORD *a1)
{
  CFTypeRef v2;
  uint64_t v3;
  uint64_t (*v4)(CFTypeRef, uint64_t);
  int v5;
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
      v4 = *(uint64_t (**)(CFTypeRef, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 104);
      if (v4)
        v5 = v4(v2, v3);
      else
        v5 = -12782;
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v5;
    }
    if (cf)
      CFRelease(cf);
  }
}

@end
