@implementation FigEndpointManagerRemoteXPC

void __FigEndpointManagerRemoteXPC_SetDiscoveryMode_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = remoteXPCFigEndpointManager_sendSetDiscoveryMode(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(const void **)(a1 + 56), *(const void **)(a1 + 64));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v2 = *(_QWORD *)(a1 + 72);
    v3 = *(const void **)(v2 + 48);
    v4 = *(const void **)(a1 + 56);
    *(_QWORD *)(v2 + 48) = v4;
    if (v4)
      CFRetain(v4);
    if (v3)
      CFRelease(v3);
    v5 = *(const void **)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 72);
    v7 = *(const void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;
    if (v5)
      CFRetain(v5);
    if (v7)
      CFRelease(v7);
  }
}

@end
