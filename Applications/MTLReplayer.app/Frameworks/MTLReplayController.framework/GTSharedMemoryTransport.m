@implementation GTSharedMemoryTransport

id __34__GTSharedMemoryTransport_connect__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  _BYTE *v7;
  NSObject *global_queue;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[52])
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 32, 0));
    v3 = 0;
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  }
  v5 = objc_msgSend(v2, "connected");
  v6 = *(_QWORD *)(a1 + 32);
  if (v5 && !*(_BYTE *)(v6 + 304))
  {
    v3 = 1;
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  }
  v11 = 0;
  if (*(_DWORD *)(v6 + 300) == 2)
  {
    if ((objc_msgSend((id)v6, "_serverConnect:", &v11) & 1) == 0)
    {
      v7 = *(_BYTE **)(a1 + 32);
LABEL_13:
      objc_msgSend(v7, "_tearDownSharedMemory");
      v9 = 0;
      goto LABEL_14;
    }
  }
  else if ((objc_msgSend((id)v6, "_clientConnect:", &v11) & 1) == 0)
  {
    v7 = *(_BYTE **)(a1 + 32);
    if (!v7[304])
      goto LABEL_13;
    v11 = 0;
    global_queue = dispatch_get_global_queue(0, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __34__GTSharedMemoryTransport_connect__block_invoke_2;
    v10[3] = &unk_726128;
    v10[4] = v7;
    dispatch_async(global_queue, v10);
    v7 = *(_BYTE **)(a1 + 32);
    if (!v7[304])
      goto LABEL_13;
  }
  v9 = 1;
LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "setError:", v11);
  return objc_msgSend(*(id *)(a1 + 40), "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
}

id __34__GTSharedMemoryTransport_connect__block_invoke_2(uint64_t a1)
{
  id result;
  uint64_t v3;
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v13;

  if ((objc_msgSend(*(id *)(a1 + 32), "_clientConnect:", 0) & 1) == 0)
  {
    do
      usleep(0x3D090u);
    while (!objc_msgSend(*(id *)(a1 + 32), "_clientConnect:", 0));
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "count");
  if (result)
  {
    v3 = 0;
    v4 = 1;
    do
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "objectAtIndex:", v3);
      v6 = *(void **)(a1 + 32);
      v7 = objc_msgSend(v5, "message");
      v8 = objc_msgSend(v5, "replyTo");
      v9 = objc_msgSend(v5, "queue");
      v10 = objc_msgSend(v5, "timeout");
      v11 = objc_msgSend(v5, "replyBlock");
      v13.receiver = v6;
      v13.super_class = (Class)GTSharedMemoryTransport_replayer;
      objc_msgSendSuper2(&v13, "send:inReplyTo:error:replyQueue:timeout:handler:", v7, v8, 0, v9, v10, v11);
      v3 = v4;
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "count");
    }
    while ((unint64_t)result > v4++);
  }
  return result;
}

id __48__GTSharedMemoryTransport__createAndRunSources___block_invoke(id result)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *((_QWORD *)result + 4);
  if (*(_BYTE *)(v1 + 52))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 5) + 8) + 40) + 24) = 1;
  }
  else
  {
    v2 = atomic_load((unsigned int *)(v1 + 48));
    atomic_store(v2, *(unsigned int **)(*((_QWORD *)result + 4) + 232));
    return objc_msgSend(*((id *)result + 4), "_dequeueIncomingMessages");
  }
  return result;
}

_QWORD *__45__GTSharedMemoryTransport_setRelayTransport___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  char **v4;

  v1 = *(void **)(result[4] + 272);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    *(_QWORD *)(v2[4] + 272) = (id)v2[5];
    v3 = v2[4];
    if (*(_QWORD *)(v3 + 272))
      v4 = &selRef__relayPacket;
    else
      v4 = &selRef__accumulateMessageBytes;
    *(_QWORD *)(v3 + 288) = *v4;
    result = objc_msgSend((id)v2[4], "methodForSelector:", *(_QWORD *)(v2[4] + 288));
    *(_QWORD *)(v2[4] + 280) = result;
    if (!*(_QWORD *)(v2[4] + 280))
      __assert_rtn("-[GTSharedMemoryTransport setRelayTransport:]_block_invoke", ", 0, "_consumeBytesIMP");
  }
  return result;
}

_QWORD *__34__GTSharedMemoryTransport_setUrl___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;

  v1 = *(void **)(result[5] + 8);
  if ((void *)result[4] != v1)
  {
    v2 = result;

    *(_QWORD *)(v2[5] + 8) = (id)v2[4];
    result = objc_msgSend(objc_msgSend(*(id *)(v2[5] + 8), "scheme"), "isEqualToString:", CFSTR("dysmtdeferred"));
    v3 = v2[5];
    if ((_DWORD)result)
      v4 = *(_DWORD *)(v3 + 300) != 2;
    else
      v4 = 0;
    *(_BYTE *)(v3 + 304) = v4;
  }
  return result;
}

@end
