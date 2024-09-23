@implementation NSCFURLProxySessionConnection

uint64_t __110____NSCFURLProxySessionConnection_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 92))
  {
    if ((v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "originalRequest"), "HTTPBodyStream")) != 0
      && (v5 = (uint64_t)v4, !objc_msgSend(v4, "streamStatus"))
      || !objc_msgSend(a2, "HTTPBodyStream")
      && !objc_msgSend(a2, "HTTPBody")
      && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120)
      && (v5 = objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:")) != 0)
    {
      objc_msgSend((id)objc_msgSend(a2, "mutableCopy"), "setHTTPBodyStream:", v5);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[4];
  dispatch_queue_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke_3;
  v3[3] = &unk_1E14FE1E0;
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(dispatch_queue_t **)(a1 + 32);
  v5 = a2;
  v6 = v2;
  -[__NSCFURLSessionConnection withWorkQueueAsync:](v4, (const char *)v3);
}

void __64____NSCFURLProxySessionConnection__deliverDidCompleteWithError___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
}

void __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1)
{
  -[__NSCFURLSessionConnection _storeCachedResponse:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  -[__NSCFURLProxySessionConnection _deliverDidCompleteWithError:](*(id **)(a1 + 32), *(void **)(a1 + 48));
}

uint64_t __107____NSCFURLProxySessionConnection_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  id *Property;

  if (*(_BYTE *)(a1 + 48))
  {
    Property = *(id **)(a1 + 32);
    if (a2)
    {
      if (Property)
        Property = (id *)objc_getProperty(Property, a2, 8, 1);
      objc_msgSend(Property, "updateCurrentRequest:", a2);
    }
    else
    {
      objc_msgSend(Property[10], "cancel");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __92____NSCFURLProxySessionConnection_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 1))
    -[__NSCFURLSessionConnection _tossCache](*(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73____NSCFURLProxySessionConnection_setTLSMaximumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "set_TLSMaximumSupportedProtocolVersion:", *(unsigned __int16 *)(a1 + 40));
}

uint64_t __73____NSCFURLProxySessionConnection_setTLSMinimumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "set_TLSMinimumSupportedProtocolVersion:", *(unsigned __int16 *)(a1 + 40));
}

uint64_t __64____NSCFURLProxySessionConnection_expectedProgressTargetChanged__block_invoke(uint64_t a1, const char *a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "set_expectedProgressTarget:", objc_msgSend(objc_getProperty(*(id *)(a1 + 32), a2, 8, 1), "_expectedProgressTarget"));
}

uint64_t __51____NSCFURLProxySessionConnection_setPoolPriority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "set_priority:", *(_QWORD *)(a1 + 40));
}

uint64_t __41____NSCFURLProxySessionConnection_resume__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resume");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "resume");
}

uint64_t __42____NSCFURLProxySessionConnection_suspend__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "suspend");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "suspend");
}

uint64_t __41____NSCFURLProxySessionConnection_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cancel");
}

void __71____NSCFURLProxySessionConnection_initWithTask_delegate_delegateQueue___block_invoke(uint64_t a1, const char *a2)
{
  -[__NSCFURLProxySessionConnection _startLoad](*(_QWORD *)(a1 + 32), a2);
}

@end
