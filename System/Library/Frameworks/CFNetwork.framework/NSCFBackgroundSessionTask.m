@implementation NSCFBackgroundSessionTask

void *__50____NSCFBackgroundSessionTask_setTaskDescription___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)-[__NSURLBackgroundSession ensureRemoteSession](objc_msgSend(*(id *)(a1 + 32), "session"));
  if (result)
    return (void *)objc_msgSend(result, "setDescription:forTask:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  return result;
}

void *__70____NSCFBackgroundSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)-[__NSURLBackgroundSession ensureRemoteSession](objc_msgSend(*(id *)(a1 + 32), "session"));
  if (result)
    return (void *)objc_msgSend(result, "setTLSMaximumSupportedProtocolVersion:forTaskWithIdentifier:", *(unsigned __int16 *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  return result;
}

void *__70____NSCFBackgroundSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)-[__NSURLBackgroundSession ensureRemoteSession](objc_msgSend(*(id *)(a1 + 32), "session"));
  if (result)
    return (void *)objc_msgSend(result, "setTLSMinimumSupportedProtocolVersion:forTaskWithIdentifier:", *(unsigned __int16 *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  return result;
}

void *__57____NSCFBackgroundSessionTask_set_discretionaryOverride___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)-[__NSURLBackgroundSession ensureRemoteSession](objc_msgSend(*(id *)(a1 + 32), "session"));
  if (result)
    return (void *)objc_msgSend(result, "setDiscretionaryOverride:forTaskWithIdentifier:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "taskIdentifier"));
  return result;
}

uint64_t __95____NSCFBackgroundSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

NSDictionary *__49____NSCFBackgroundSessionTask_cookiesForRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  NSDictionary *result;

  result = +[NSHTTPCookie requestHeaderFieldsWithCookies:](NSHTTPCookie, "requestHeaderFieldsWithCookies:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end
