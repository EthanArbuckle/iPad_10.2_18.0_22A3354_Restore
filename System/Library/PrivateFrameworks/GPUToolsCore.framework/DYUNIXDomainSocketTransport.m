@implementation DYUNIXDomainSocketTransport

- (DYUNIXDomainSocketTransport)initWithMode:(int)a3
{
  DYUNIXDomainSocketTransport *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYUNIXDomainSocketTransport;
  result = -[DYBaseSocketTransport init](&v5, sel_init);
  if (result)
    *(_DWORD *)(&result->super._scheduledReadOnWritableSocket + 3) = a3;
  return result;
}

- (void)setUrl:(id)a3
{
  NSObject *queue;
  _QWORD block[6];

  if (-[DYBaseSocketTransport connected](self, "connected"))
    dy_abort("tried to set socket path on connected unix domain socket transport");
  if (a3 && !objc_msgSend(a3, "filePathURL"))
    dy_abort("unix domain socket url must be a file url: %s", (const char *)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "UTF8String"));
  queue = self->super.super.super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__DYUNIXDomainSocketTransport_setUrl___block_invoke;
  block[3] = &unk_250D622A0;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

_QWORD *__38__DYUNIXDomainSocketTransport_setUrl___block_invoke(_QWORD *result)
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

- (void)_connectServer:(id)a3 future:(id)a4
{
  const __CFString *v7;
  __CFString *v8;
  size_t v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  _QWORD v21[6];
  int v22;
  _QWORD handler[6];
  int v24;
  sockaddr v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _WORD v30[13];
  char buffer[1024];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = (const __CFString *)a3;
  if (!a3)
  {
    v8 = (__CFString *)NSTemporaryDirectory();
    if (!v8)
      v8 = CFSTR("/tmp");
    v7 = (const __CFString *)-[__CFString stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", CFSTR("dysonXXXXXX"));
  }
  CFStringGetFileSystemRepresentation(v7, buffer, 1024);
  v9 = strlen(buffer) + 1;
  v29 = 0u;
  memset(v30, 0, sizeof(v30));
  v27 = 0u;
  v28 = 0u;
  v25 = (sockaddr)0;
  v26 = 0u;
  if (!a3 && v9 >= 0x69)
  {
    v7 = (const __CFString *)objc_msgSend(CFSTR("/tmp"), "stringByAppendingPathComponent:", CFSTR("dysonXXXXXX"));
    CFStringGetFileSystemRepresentation(v7, buffer, 1024);
    v9 = strlen(buffer) + 1;
  }
  if (v9 >= 0x69)
  {
    v10 = CFSTR("DYErrorDomain");
    v11 = 39;
LABEL_20:
    objc_msgSend(a4, "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v10, v11, 0));
    objc_msgSend(a4, "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
    return;
  }
  if (!a3)
  {
    v12 = mkstemp(buffer);
    if (v12 == -1)
    {
      v16 = -1;
      goto LABEL_23;
    }
    v13 = v12;
    v7 = (id)CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], buffer);
    close(v13);
  }
  if (!self->super.super.super._url)
    self->super.super.super._url = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v7);
  v25.sa_family = 1;
  strlcpy(v25.sa_data, buffer, 0x68uLL);
  v14 = strlen(v25.sa_data);
  v15 = socket(1, 1, 0);
  if (v15 == -1)
  {
    v20 = (const __CFString *)*MEMORY[0x24BDD1128];
    v11 = *__error();
    v10 = v20;
    goto LABEL_20;
  }
  v16 = v15;
  unlink(v25.sa_data);
  if (bind(v16, &v25, v14 + 2) != -1 && listen(v16, 1) != -1)
  {
    fcntl(v16, 4, 4);
    v17 = dispatch_source_create(MEMORY[0x24BDACA00], v16, 0, (dispatch_queue_t)self->super.super.super._queue);
    *(_QWORD *)&self->_mode = v17;
    v18 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __53__DYUNIXDomainSocketTransport__connectServer_future___block_invoke;
    handler[3] = &unk_250D622C8;
    v24 = v16;
    handler[4] = self;
    handler[5] = a4;
    dispatch_source_set_cancel_handler(v17, handler);
    v19 = *(NSObject **)&self->_mode;
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __53__DYUNIXDomainSocketTransport__connectServer_future___block_invoke_2;
    v21[3] = &unk_250D622C8;
    v22 = v16;
    v21[4] = self;
    v21[5] = a4;
    dispatch_source_set_event_handler(v19, v21);
    dispatch_resume(*(dispatch_object_t *)&self->_mode);
    return;
  }
LABEL_23:
  objc_msgSend(a4, "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0));
  objc_msgSend(a4, "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  if (v16 != -1)
    close(v16);
}

_BYTE *__53__DYUNIXDomainSocketTransport__connectServer_future___block_invoke(uint64_t a1)
{
  _BYTE *result;

  close(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 272));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (result[52])
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", objc_msgSend(result, "error"));
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  }
  return result;
}

intptr_t __53__DYUNIXDomainSocketTransport__connectServer_future___block_invoke_2(uint64_t a1)
{
  intptr_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  DYError *v7;
  void *v8;
  socklen_t v9;
  sockaddr v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = dispatch_source_testcancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 272));
  if (!result)
  {
    v9 = 106;
    v3 = accept(*(_DWORD *)(a1 + 48), &v10, &v9);
    if ((_DWORD)v3 == -1)
    {
      v7 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      v8 = *(void **)(a1 + 40);
      v6 = (id *)(a1 + 40);
      objc_msgSend(v8, "setError:", v7);
      v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    }
    else
    {
      v4 = v3;
      dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 272));
      objc_msgSend(*(id *)(a1 + 32), "runWithSocket:", v4);
      v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v6 = (id *)(a1 + 40);
    }
    return objc_msgSend(*v6, "setResult:", v5);
  }
  return result;
}

- (void)_connectClient:(id)a3 future:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  const __CFString *v16;
  char v17[1024];
  sockaddr v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _WORD v23[13];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v11 = CFSTR("DYErrorDomain");
    v12 = 38;
LABEL_7:
    objc_msgSend(a4, "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v11, v12, 0));
    objc_msgSend(a4, "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
    return;
  }
  v7 = socket(1, 1, 0);
  if ((_DWORD)v7 == -1)
  {
    v13 = (const __CFString *)*MEMORY[0x24BDD1128];
    v12 = *__error();
    v11 = v13;
    goto LABEL_7;
  }
  v8 = v7;
  v22 = 0u;
  memset(v23, 0, sizeof(v23));
  v20 = 0u;
  v21 = 0u;
  v18 = (sockaddr)0;
  v19 = 0u;
  CFStringGetFileSystemRepresentation((CFStringRef)a3, v17, 1024);
  if (strlen(v17) - 103 <= 0xFFFFFFFFFFFFFF97)
  {
    v9 = CFSTR("DYErrorDomain");
    v10 = 1;
LABEL_11:
    objc_msgSend(a4, "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v9, v10, 0));
    v15 = 0;
    goto LABEL_12;
  }
  v18.sa_family = 1;
  strlcpy(v18.sa_data, v17, 0x68uLL);
  v14 = strlen(v18.sa_data);
  if (connect(v8, &v18, v14 + 2) == -1)
  {
    v16 = (const __CFString *)*MEMORY[0x24BDD1128];
    v10 = *__error();
    v9 = v16;
    goto LABEL_11;
  }
  -[DYBaseSocketTransport runWithSocket:](self, "runWithSocket:", v8);
  v15 = 1;
LABEL_12:
  objc_msgSend(a4, "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15));
}

- (id)connect
{
  id v3;
  NSObject *queue;
  _QWORD v6[6];

  v3 = +[DYFuture future](DYFuture, "future");
  queue = self->super.super.super._queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__DYUNIXDomainSocketTransport_connect__block_invoke;
  v6[3] = &unk_250D622A0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

uint64_t __38__DYUNIXDomainSocketTransport_connect__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v7;
  BOOL v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[52])
  {
    v3 = 32;
LABEL_3:
    objc_msgSend(*(id *)(a1 + 40), "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), v3, 0));
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = 0;
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(v4, "numberWithBool:", v5));
  }
  if (objc_msgSend(v2, "connected"))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = 1;
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(v4, "numberWithBool:", v5));
  }
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "filePathURL");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v3 = 257;
    goto LABEL_3;
  }
  v9 = objc_msgSend(v7, "path");
  v10 = *(_DWORD **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  if (v10[67] == 2)
    return objc_msgSend(v10, "_connectServer:future:", v9, v11);
  else
    return objc_msgSend(v10, "_connectClient:future:", v9, v11);
}

- (void)_invalidate
{
  NSObject *v3;
  objc_super v4;

  v3 = *(NSObject **)&self->_mode;
  if (v3)
    dispatch_source_cancel(v3);
  v4.receiver = self;
  v4.super_class = (Class)DYUNIXDomainSocketTransport;
  -[DYBaseSocketTransport _invalidate](&v4, sel__invalidate);
}

@end
