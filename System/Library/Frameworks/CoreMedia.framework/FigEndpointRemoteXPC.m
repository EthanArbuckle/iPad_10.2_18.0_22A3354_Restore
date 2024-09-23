@implementation FigEndpointRemoteXPC

void __FigEndpointRemoteXPC_runAllCallbacks_block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  const void *v3;
  _QWORD v4[5];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __FigEndpointRemoteXPC_runAllCallbacks_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_5_6;
  v2 = *(const __CFDictionary **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(_DWORD *)(a1 + 48);
  FigCFDictionaryApplyBlock(v2, v4);
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
}

char **__FigEndpointRemoteXPC_runAllCallbacks_block_invoke_2(uint64_t a1, uint64_t a2, char **a3)
{
  return remoteXPCEndpointClient_runCallback(a3, *(_QWORD *)(a1 + 32), 0, 0, *(unsigned int *)(a1 + 40));
}

void __FigEndpointRemoteXPC_ActivateWithCompletionCallback_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), 0, 0, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __FigEndpointRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 32;
  remoteXPCEndpointClient_runCallback((char **)(a1 + 32), *(_QWORD *)(a1 + 104), 0, 0, *(unsigned int *)(a1 + 112));
  remoteXPCEndpointClient_releaseCompletionCallbackEntryFields(v1);
}

void __FigEndpointRemoteXPC_DeactivateWithCompletionCallback_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __FigEndpointRemoteXPC_SendCommand_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), 0, *(_QWORD *)(a1 + 48));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __FigEndpointRemoteXPC_SendData_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

void __FigEndpointRemoteXPC_EndpointAggregateOperationWithCompletionCallback_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 64));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

@end
