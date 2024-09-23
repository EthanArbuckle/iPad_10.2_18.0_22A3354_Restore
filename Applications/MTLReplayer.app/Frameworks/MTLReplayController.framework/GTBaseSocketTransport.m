@implementation GTBaseSocketTransport

id __53__GTBaseSocketTransport_destroySharedMemoryTransport__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_destroySharedMemoryTransport");
}

_BYTE *__63__GTBaseSocketTransport_createNewSharedMemoryTransportWithURL___block_invoke(uint64_t a1)
{
  _BYTE *result;
  GTSharedMemoryTransport_replayer *v3;
  uint64_t v4;

  result = *(_BYTE **)(a1 + 32);
  if (!result[52])
  {
    objc_msgSend(result, "_destroySharedMemoryTransport");
    v3 = [GTSharedMemoryTransport_replayer alloc];
    v4 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = -[GTSharedMemoryTransport_replayer initWithMode:initialMessageSerial:](v3, "initWithMode:initialMessageSerial:", 2, v4);
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setUrl:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setRelayTransport:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setPrioritizeOutgoingMessages:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 53));
    if (objc_msgSend(*(id *)(a1 + 32), "connected"))
      objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "connect"), "waitUntilResolved");
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "url");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  }
  return result;
}

id __55__GTBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setPrioritizeOutgoingMessages:", *(unsigned __int8 *)(a1 + 40));
}

void __39__GTBaseSocketTransport_runWithSocket___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "closeSocketDescriptor");
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 232));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = 0;
}

void __39__GTBaseSocketTransport_runWithSocket___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 232));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 240));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 0;
}

id __39__GTBaseSocketTransport_runWithSocket___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readAndAccumulateLoop");
}

_BYTE *__39__GTBaseSocketTransport_runWithSocket___block_invoke_4(uint64_t a1)
{
  _BYTE *result;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 240));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 1;
  result = *(_BYTE **)(a1 + 32);
  if (result[257])
    return objc_msgSend(result, "_readAndAccumulateLoop");
  return result;
}

@end
