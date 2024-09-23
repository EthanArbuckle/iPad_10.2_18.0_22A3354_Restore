@implementation GTUNIXDomainSocketTransport

id __38__GTUNIXDomainSocketTransport_connect__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  BOOL v7;
  id v8;
  _DWORD *v9;
  uint64_t v10;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[52])
  {
    v3 = 32;
LABEL_3:
    objc_msgSend(*(id *)(a1 + 40), "setError:", +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v3, 0));
    v4 = 0;
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  }
  if (objc_msgSend(v2, "connected"))
  {
    v4 = 1;
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  }
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "filePathURL");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v3 = 257;
    goto LABEL_3;
  }
  v8 = objc_msgSend(v6, "path");
  v9 = *(_DWORD **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (v9[65] == 2)
    return objc_msgSend(v9, "_connectServer:future:", v8, v10);
  else
    return objc_msgSend(v9, "_connectClient:future:", v8, v10);
}

_BYTE *__53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke(uint64_t a1)
{
  _BYTE *result;

  close(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 264));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (result[52])
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", objc_msgSend(result, "error"));
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  }
  return result;
}

id __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke_2(uint64_t a1)
{
  id result;
  uint64_t v3;
  uint64_t v4;
  NSNumber *v5;
  id *v6;
  NSError *v7;
  void *v8;
  socklen_t v9;
  sockaddr v10;

  result = (id)dispatch_source_testcancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 264));
  if (!result)
  {
    v9 = 106;
    v3 = accept(*(_DWORD *)(a1 + 48), &v10, &v9);
    if ((_DWORD)v3 == -1)
    {
      v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
      v8 = *(void **)(a1 + 40);
      v6 = (id *)(a1 + 40);
      objc_msgSend(v8, "setError:", v7);
      v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0);
    }
    else
    {
      v4 = v3;
      dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 264));
      objc_msgSend(*(id *)(a1 + 32), "runWithSocket:", v4);
      v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
      v6 = (id *)(a1 + 40);
    }
    return objc_msgSend(*v6, "setResult:", v5);
  }
  return result;
}

_QWORD *__38__GTUNIXDomainSocketTransport_setUrl___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[5] + 8);
  if ((void *)result[4] != v1)
  {
    v2 = result;

    result = (id)v2[4];
    *(_QWORD *)(v2[5] + 8) = result;
  }
  return result;
}

@end
