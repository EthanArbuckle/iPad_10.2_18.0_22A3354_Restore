@implementation PlayerLoadForService

void __mt_PlayerLoadForService_block_invoke(uint64_t a1)
{
  ipc_space_t *v2;

  v2 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  MEMORY[0x22073CCBC](*(unsigned int *)(*(_QWORD *)(a1 + 32) + 112), 32, *MEMORY[0x24BDAEC58], *(_QWORD *)(a1 + 40));
  mach_port_mod_refs(*v2, *(_DWORD *)(a1 + 48), 1u, -1);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __mt_PlayerLoadForService_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _QWORD, _BYTE *, uint64_t, unsigned int *, _QWORD);
  unsigned int v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, _QWORD, _BYTE *, uint64_t, _QWORD);
  unsigned int v12[135];
  uint32_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  _BYTE v17[512];
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (dispatch_source_testcancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 128))
    || IODataQueueWaitForAvailableData(*(IODataQueueMemory **)(a1 + 40), *(_DWORD *)(a1 + 48))
    || !IODataQueueDataAvailable(*(IODataQueueMemory **)(a1 + 40)))
  {
    return puts("unable to handle control requests");
  }
  v13 = 528;
  MEMORY[0x24BDAC7A8]();
  memset(v12, 170, 0x210uLL);
  result = IODataQueueDequeue(*(IODataQueueMemory **)(a1 + 40), v12, &v13);
  if (!(_DWORD)result)
  {
    v3 = -536870201;
    v4 = bswap32(v12[0]);
    v5 = bswap32(v12[2]);
    v14 = v4;
    v16 = v5;
    v6 = bswap32(v12[131]);
    v18 = v6;
    memcpy(v17, &v12[3], sizeof(v17));
    v15 = -536870201;
    if (v4 == 1)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _BYTE *, uint64_t, _QWORD))(v10 + 200);
      if (!v11)
        goto LABEL_13;
      v9 = v11(v10, v5, v17, v6, *(_QWORD *)(v10 + 192));
    }
    else
    {
      if (v4)
        goto LABEL_13;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(uint64_t (**)(uint64_t, _QWORD, _BYTE *, uint64_t, unsigned int *, _QWORD))(v7 + 184);
      if (!v8)
        goto LABEL_13;
      v9 = v8(v7, v5, v17, v6, &v18, *(_QWORD *)(v7 + 192));
    }
    v3 = v9;
LABEL_13:
    v14 = bswap32(v14);
    v15 = bswap32(v3);
    v16 = bswap32(v16);
    v18 = bswap32(v18);
    result = IOConnectCallStructMethod(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 112), 1u, &v14, 0x210uLL, 0, 0);
    if ((_DWORD)result)
      return printf("error 0x%08X handling control request\n", result);
  }
  return result;
}

@end
