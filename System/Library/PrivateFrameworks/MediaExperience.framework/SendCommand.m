@implementation SendCommand

uint64_t __central_SendCommand_block_invoke(uint64_t a1)
{
  return _FigEndpointCentralSendCommand(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __routingContextResilientRemote_SendCommand_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 136);
  if (v7)
    return v7(a2, v3, v4, v5, v6);
  else
    return 4294954514;
}

void __routingContext_SendCommand_block_invoke(uint64_t a1)
{
  CFTypeRef v2;
  CFTypeRef *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(CFTypeRef, uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, CFTypeRef *), CFTypeRef *);
  uint64_t v7;
  CFTypeRef cf;

  cf = 0;
  FigRoutingManagerCopyPickedEndpointForRoutingContext(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), &cf);
  v2 = cf;
  if (cf && (FigEndpointExtendedGetClassID(), CMBaseObjectIsMemberOfClass()))
  {
    v3 = (CFTypeRef *)malloc_type_calloc(1uLL, 0x18uLL, 0xA00402214FCE6uLL);
    *v3 = CFRetain(*(CFTypeRef *)(a1 + 48));
    v3[1] = *(CFTypeRef *)(a1 + 56);
    v3[2] = *(CFTypeRef *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 80);
    v6 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, CFTypeRef *), CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 72);
    if (v6)
      v7 = v6(v2, v4, v5, routingContext_sendCommandCompletionCallback, v3);
    else
      v7 = 4294954514;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == -12782)
      routingContext_sendCommandCompletionCallback(v7, 4294954514, 0, v3);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48), 0, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_QWORD *)(a1 + 64));
  }
  if (cf)
    CFRelease(cf);
}

uint64_t __endpointAggregate_SendCommand_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  if (!a2 || (v3 = a2, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass()))
    v3 = 0;
  v4 = a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                             + 72);
  if (v8)
    return v8(v3, v4, v5, v7, v6);
  else
    return 4294954514;
}

@end
