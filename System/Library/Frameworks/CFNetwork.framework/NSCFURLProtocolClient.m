@implementation NSCFURLProtocolClient

uint64_t __76____NSCFURLProtocolClient_NS_URLProtocol_didReceiveAuthenticationChallenge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v1 + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)result + 104))(result, *(_QWORD *)(v1 + 32));
  return result;
}

CFRunLoopRef __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_2(uint64_t a1, __CFRunLoop *a2)
{
  CFRunLoopRef result;

  result = CFRunLoopGetCurrent();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == a2;
  return result;
}

void __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke()
{
  uint64_t result;

  result = _copyPrivateProtocolSchedulingSet();
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling = result;
  return result;
}

uint64_t __59____NSCFURLProtocolClient_NS_URLProtocol_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)result + 96))(result, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __58____NSCFURLProtocolClient_NS_URLProtocolDidFinishLoading___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 88))(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(_QWORD *)(v2 + 16);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 64))(result);
  return result;
}

void __54____NSCFURLProtocolClient_NS_URLProtocol_didLoadData___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1[4] + 8);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 72))(v2, a1[5], a1[6]);
  v3 = (const void *)a1[5];
  if (v3)
    CFRelease(v3);
}

uint64_t __80____NSCFURLProtocolClient_NS_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 48);
    *(_DWORD *)(objc_msgSend(*(id *)(result + 40), "_inner") + 72) = v2;
    return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(v1 + 32) + 8) + 64))(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8), *(_QWORD *)(v1 + 40));
  }
  return result;
}

uint64_t __64____NSCFURLProtocolClient_NS_URLProtocol_cachedResponseIsValid___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 48))(v1, objc_msgSend(*(id *)(result + 40), "_CFCachedURLResponse"));
  return result;
}

uint64_t __82____NSCFURLProtocolClient_NS_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1[4] + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)result + 40))(result, a1[5], a1[6]);
  return result;
}

void __38____NSCFURLProtocolClient_NS_teardown__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const void *v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  if (v3)
  {
    CFRelease((CFTypeRef)(v3 - 16));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v2 = *(_QWORD **)(a1 + 32);
  }
  v4 = v2[1];
  if (v4)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_sync_enter(v2);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(const void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;
  objc_sync_exit(v2);

  if (v8)
    CFRelease(v8);
}

@end
