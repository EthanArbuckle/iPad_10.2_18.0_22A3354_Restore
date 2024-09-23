@implementation GTUNIXDomainSocketTransport_replayer

- (GTUNIXDomainSocketTransport_replayer)initWithMode:(int)a3
{
  GTUNIXDomainSocketTransport_replayer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTUNIXDomainSocketTransport_replayer;
  result = -[GTBaseSocketTransport_replayer init](&v5, "init");
  if (result)
    *(_DWORD *)(&result->super._scheduledReadOnWritableSocket + 3) = a3;
  return result;
}

- (void)setUrl:(id)a3
{
  NSObject *queue;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  FILE *v11;
  FILE *v12;
  _QWORD block[6];
  uint8_t buf[4];
  id v15;

  if (-[GTBaseSocketTransport_replayer connected](self, "connected"))
  {
    if (s_logUsingOsLog)
    {
      v6 = gt_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "fail: tried to set socket path on connected unix domain socket transport";
        v8 = v6;
        v9 = 2;
        goto LABEL_11;
      }
    }
    else
    {
      v11 = __stderrp;
      -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail: tried to set socket path on connected unix domain socket transport")), "UTF8String");
      fprintf(v11, "%s\n");
    }
LABEL_14:
    abort();
  }
  if (a3 && !objc_msgSend(a3, "filePathURL"))
  {
    if (s_logUsingOsLog)
    {
      v10 = gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String");
        v7 = "fail: unix domain socket url must be a file url: %s";
        v8 = v10;
        v9 = 12;
LABEL_11:
        _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, v7, buf, v9);
        abort();
      }
    }
    else
    {
      v12 = __stderrp;
      -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail: unix domain socket url must be a file url: %s"), objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String")), "UTF8String");
      fprintf(v12, "%s\n");
    }
    goto LABEL_14;
  }
  queue = self->super.super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __38__GTUNIXDomainSocketTransport_setUrl___block_invoke;
  block[3] = &unk_725190;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

- (void)_connectServer:(id)a3 future:(id)a4
{
  const __CFString *v7;
  __CFString *v8;
  size_t v9;
  __objc2_class *v10;
  const __CFString *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[6];
  int v21;
  _QWORD handler[6];
  int v23;
  sockaddr v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _WORD v29[13];
  char buffer[1024];

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
  v28 = 0u;
  memset(v29, 0, sizeof(v29));
  v26 = 0u;
  v27 = 0u;
  v24 = (sockaddr)0;
  v25 = 0u;
  if (!a3 && v9 >= 0x69)
  {
    v7 = (const __CFString *)objc_msgSend(CFSTR("/tmp"), "stringByAppendingPathComponent:", CFSTR("dysonXXXXXX"));
    CFStringGetFileSystemRepresentation(v7, buffer, 1024);
    v9 = strlen(buffer) + 1;
  }
  if (v9 >= 0x69)
  {
    v10 = GTError_replayer;
    v11 = CFSTR("DYErrorDomain");
    v12 = 39;
LABEL_20:
    objc_msgSend(a4, "setError:", -[__objc2_class errorWithDomain:code:userInfo:](v10, "errorWithDomain:code:userInfo:", v11, v12, 0));
    objc_msgSend(a4, "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    return;
  }
  if (!a3)
  {
    v13 = mkstemp(buffer);
    if (v13 == -1)
    {
      v17 = -1;
      goto LABEL_23;
    }
    v14 = v13;
    v7 = (id)CFStringCreateWithFileSystemRepresentation(kCFAllocatorDefault, buffer);
    close(v14);
  }
  if (!self->super.super.super._url)
    self->super.super.super._url = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", v7);
  v24.sa_family = 1;
  strlcpy(v24.sa_data, buffer, 0x68uLL);
  v15 = strlen(v24.sa_data);
  v16 = socket(1, 1, 0);
  if (v16 == -1)
  {
    v12 = *__error();
    v10 = (__objc2_class *)NSError;
    v11 = (const __CFString *)NSPOSIXErrorDomain;
    goto LABEL_20;
  }
  v17 = v16;
  unlink(v24.sa_data);
  if (bind(v17, &v24, v15 + 2) != -1 && listen(v17, 1) != -1)
  {
    fcntl(v17, 4, 4);
    v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v17, 0, (dispatch_queue_t)self->super.super.super._queue);
    *(_QWORD *)&self->_mode = v18;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke;
    handler[3] = &unk_725230;
    v23 = v17;
    handler[4] = self;
    handler[5] = a4;
    dispatch_source_set_cancel_handler(v18, handler);
    v19 = *(NSObject **)&self->_mode;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke_2;
    v20[3] = &unk_725230;
    v21 = v17;
    v20[4] = self;
    v20[5] = a4;
    dispatch_source_set_event_handler(v19, v20);
    dispatch_resume(*(dispatch_object_t *)&self->_mode);
    return;
  }
LABEL_23:
  objc_msgSend(a4, "setError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0));
  objc_msgSend(a4, "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  if (v17 != -1)
    close(v17);
}

- (void)_connectClient:(id)a3 future:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __objc2_class *v9;
  const __CFString *v10;
  uint64_t v11;
  __objc2_class *v12;
  const __CFString *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  char v17[1024];
  sockaddr v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _WORD v23[13];

  if (!a3)
  {
    v12 = GTError_replayer;
    v13 = CFSTR("DYErrorDomain");
    v14 = 38;
LABEL_7:
    objc_msgSend(a4, "setError:", -[__objc2_class errorWithDomain:code:userInfo:](v12, "errorWithDomain:code:userInfo:", v13, v14, 0));
    objc_msgSend(a4, "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    return;
  }
  v7 = socket(1, 1, 0);
  if ((_DWORD)v7 == -1)
  {
    v14 = *__error();
    v12 = (__objc2_class *)NSError;
    v13 = (const __CFString *)NSPOSIXErrorDomain;
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
    v9 = GTError_replayer;
    v10 = CFSTR("DYErrorDomain");
    v11 = 1;
LABEL_11:
    objc_msgSend(a4, "setError:", -[__objc2_class errorWithDomain:code:userInfo:](v9, "errorWithDomain:code:userInfo:", v10, v11, 0));
    v16 = 0;
    goto LABEL_12;
  }
  v18.sa_family = 1;
  strlcpy(v18.sa_data, v17, 0x68uLL);
  v15 = strlen(v18.sa_data);
  if (connect(v8, &v18, v15 + 2) == -1)
  {
    v11 = *__error();
    v9 = (__objc2_class *)NSError;
    v10 = (const __CFString *)NSPOSIXErrorDomain;
    goto LABEL_11;
  }
  -[GTBaseSocketTransport_replayer runWithSocket:](self, "runWithSocket:", v8);
  v16 = 1;
LABEL_12:
  objc_msgSend(a4, "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v16));
}

- (id)connect
{
  id v3;
  NSObject *queue;
  _QWORD v6[6];

  v3 = +[GTFuture_replayer future](GTFuture_replayer, "future");
  queue = self->super.super.super._queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __38__GTUNIXDomainSocketTransport_connect__block_invoke;
  v6[3] = &unk_725190;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

- (void)_invalidate
{
  NSObject *v3;
  objc_super v4;

  v3 = *(NSObject **)&self->_mode;
  if (v3)
    dispatch_source_cancel(v3);
  v4.receiver = self;
  v4.super_class = (Class)GTUNIXDomainSocketTransport_replayer;
  -[GTBaseSocketTransport_replayer _invalidate](&v4, "_invalidate");
}

@end
