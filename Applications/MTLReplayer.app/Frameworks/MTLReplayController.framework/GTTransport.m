@implementation GTTransport

void __34__GTTransport_relayMessage_error___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 48))
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52))
  {
    v2 = objc_autoreleasePoolPush();
    objc_msgSend(*(id *)(a1 + 32), "_sendMessage:error:", *(_QWORD *)(a1 + 40), 0);
    objc_autoreleasePoolPop(v2);
  }
}

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReplyTimeout:count:", *(unsigned int *)(a1 + 40), 0);
}

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forIntKey:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;
  id v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unsigned int *v12;
  unsigned int v13;
  _QWORD block[7];
  int v15;
  id v16;

  if (*(_BYTE *)(a1 + 60))
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52))
  {
    v11 = objc_autoreleasePoolPush();
    objc_msgSend(*(id *)(a1 + 40), "dispatchError:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 32, 0));
    objc_autoreleasePoolPop(v11);
    v12 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 48);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    objc_msgSend(*(id *)(a1 + 48), "setEncodedAttributes:", 0);
  }
  else
  {
    v16 = 0;
    v2 = objc_autoreleasePoolPush();
    if (*(_QWORD *)(a1 + 40))
      v3 = &v16;
    else
      v3 = 0;
    v4 = objc_msgSend(*(id *)(a1 + 32), "_sendMessage:error:", *(_QWORD *)(a1 + 48), v3);
    v5 = v16;
    objc_autoreleasePoolPop(v2);
    v6 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 48);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (v4 == (id)-1)
    {
      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(NSObject **)(v9 + 24);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4;
        block[3] = &unk_725258;
        v15 = *(_DWORD *)(a1 + 56);
        block[4] = v9;
        block[5] = v8;
        block[6] = v16;
        dispatch_async(v10, block);
      }
    }

  }
}

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForIntKey:", *(unsigned int *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "dispatchError:", *(_QWORD *)(a1 + 48));
}

uint64_t __30__GTTransport_setSynchronous___block_invoke(uint64_t result)
{
  void (__cdecl **v1)(dispatch_queue_t, dispatch_block_t);

  if (*(_BYTE *)(result + 40))
    v1 = &_dispatch_sync;
  else
    v1 = &_dispatch_async;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 96) = v1;
  return result;
}

id *__37__GTTransport__scheduleInvalidation___block_invoke(id *result)
{
  id *v1;

  if (!*((_QWORD *)result[4] + 10))
  {
    v1 = result;
    *((_QWORD *)result[4] + 10) = result[5];
    return (id *)objc_msgSend(v1[4], "_invalidate");
  }
  return result;
}

void __32__GTTransport__dispatchMessage___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  int64_t v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD block[5];
  int v13;

  v1 = a1[4];
  if (!*(_BYTE *)(v1 + 24))
  {
    v3 = (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 16) + 16))();
    v4 = a1[4];
    if ((v3 & 1) != 0)
    {
      v5 = *(_QWORD *)(v4 + 32);
      if (v5)
      {
        v6 = dispatch_time(0, v5);
        v7 = a1[6];
        v8 = *(NSObject **)(v7 + 24);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = __32__GTTransport__dispatchMessage___block_invoke_3;
        v11[3] = &unk_726378;
        v11[4] = v7;
        v11[5] = a1[7];
        dispatch_after(v6, v8, v11);
      }
    }
    else
    {
      *(_BYTE *)(v4 + 24) = 1;
      v9 = a1[6];
      v10 = *(NSObject **)(v9 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __32__GTTransport__dispatchMessage___block_invoke_2;
      block[3] = &unk_7251E0;
      block[4] = v9;
      v13 = *((_DWORD *)a1 + 14);
      dispatch_async(v10, block);
    }
  }
}

id __32__GTTransport__dispatchMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForIntKey:", *(unsigned int *)(a1 + 40));
}

id __32__GTTransport__dispatchMessage___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReplyTimeout:count:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

id __26__GTTransport__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "dispatchError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

id __29__GTTransport__cancelSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
}

_QWORD *__31__GTTransport__activateSource___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 52))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 64), "addObject:", result[5]);
    *(_BYTE *)(*(_QWORD *)(v2[6] + 8) + 24) = 1;
  }
  return result;
}

_QWORD *__34__GTTransport_newSourceWithQueue___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  if (!*(_BYTE *)(result[4] + 52))
  {
    v1 = result;
    result = -[GTTransportSource_replayer _initWithQueue:transport:]([GTTransportSource_replayer alloc], "_initWithQueue:transport:", v1[5], v1[4]);
    *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40) = result;
  }
  return result;
}

id __18__GTTransport_url__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end
