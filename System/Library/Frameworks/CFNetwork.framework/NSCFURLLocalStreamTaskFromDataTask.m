@implementation NSCFURLLocalStreamTaskFromDataTask

void __77____NSCFURLLocalStreamTaskFromDataTask_connection_didReceiveData_completion___block_invoke(uint64_t a1)
{
  __NSCFURLLocalStreamTaskFromDataTaskDataBlobby *v2;
  NSObject *v3;
  const void *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v7;

  v2 = [__NSCFURLLocalStreamTaskFromDataTaskDataBlobby alloc];
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 32);
    v4 = *(const void **)(a1 + 48);
    v7.receiver = v2;
    v7.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTaskDataBlobby;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    v6 = v5;
    if (v5)
    {
      v5[1] = v3;
      dispatch_retain(v3);
      v6[2] = _Block_copy(v4);
    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1232), "addObject:", v6);

  -[__NSCFURLLocalStreamTaskFromDataTask _onqueue_ioTickFromDataTaskConversion:](*(_QWORD *)(a1 + 40), (uint64_t)"didReceiveData");
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __78____NSCFURLLocalStreamTaskFromDataTask__onqueue_ioTickFromDataTaskConversion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __CFWriteStream *v4;
  NSObject *map;
  size_t v6;
  void (**v7)(_QWORD);
  dispatch_data_t subrange;
  CFIndex v9;
  void *buffer_ptr;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1
    || !*(_QWORD *)(v1 + 1200)
    || *(_BYTE *)(v1 + 1208)
    || *(_QWORD *)(v1 + 1216)
    || !*(_BYTE *)(v1 + 1209)
    || !objc_msgSend(*(id *)(v1 + 1232), "count"))
  {
    return;
  }
  *(_BYTE *)(v1 + 1209) = 0;
  v2 = objc_msgSend(*(id *)(v1 + 1232), "firstObject");
  if (!v2)
  {
LABEL_17:
    objc_msgSend(*(id *)(v1 + 1232), "removeObjectAtIndex:", 0);
    return;
  }
  v3 = v2;
  v4 = *(__CFWriteStream **)(v1 + 1200);
  if (!CFWriteStreamCanAcceptBytes(v4))
    return;
  v9 = 0;
  buffer_ptr = 0;
  map = dispatch_data_create_map(*(dispatch_data_t *)(v3 + 8), (const void **)&buffer_ptr, (size_t *)&v9);
  v6 = CFWriteStreamWrite(v4, (const UInt8 *)buffer_ptr, v9);
  if (!v6)
  {
    dispatch_release(map);
    *(_BYTE *)(v1 + 1208) = 1;
    goto LABEL_17;
  }
  if ((v6 & 0x8000000000000000) != 0)
  {
    dispatch_release(map);
    *(CFStreamError *)(v1 + 1216) = CFWriteStreamGetError((CFWriteStreamRef)*(_QWORD *)(v1 + 1200));
    goto LABEL_17;
  }
  if (v9 == v6)
  {
    dispatch_release(map);
    v7 = *(void (***)(_QWORD))(v3 + 16);
    if (v7)
    {
      *(_QWORD *)(v3 + 16) = 0;
      v7[2](v7);
      _Block_release(v7);
    }
    goto LABEL_17;
  }
  subrange = dispatch_data_create_subrange(*(dispatch_data_t *)(v3 + 8), v6, v9 - v6);
  dispatch_release(*(dispatch_object_t *)(v3 + 8));
  *(_QWORD *)(v3 + 8) = subrange;
  dispatch_release(map);
}

void __77____NSCFURLLocalStreamTaskFromDataTask_connection_didFinishLoadingWithError___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __77____NSCFURLLocalStreamTaskFromDataTask_connection_didFinishLoadingWithError___block_invoke_2;
  v2[3] = &unk_1E14FDE88;
  v3 = *(_OWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v2, (uint64_t)"connection:didFinishLoadingWithError"));
  -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
}

void __77____NSCFURLLocalStreamTaskFromDataTask_connection_didFinishLoadingWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  __CFWriteStream *v2;
  __CFReadStream *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(__CFWriteStream **)(v1 + 1200);
    if (v2)
    {
      CFWriteStreamSetClient(v2, 0, 0, 0);
      CFWriteStreamClose(*(CFWriteStreamRef *)(v1 + 1200));
      CFRelease(*(CFTypeRef *)(v1 + 1200));
      *(_QWORD *)(v1 + 1200) = 0;
    }
    v3 = *(__CFReadStream **)(v1 + 1168);
    if (v3)
    {
      CFReadStreamSetClient(v3, 0, 0, 0);
      CFReadStreamClose(*(CFReadStreamRef *)(v1 + 1168));
      CFRelease(*(CFTypeRef *)(v1 + 1168));
      *(_QWORD *)(v1 + 1168) = 0;
    }
  }
}

void __86____NSCFURLLocalStreamTaskFromDataTask_initWithTask_inputStream_ouptutStream_disavow___block_invoke(uint64_t a1)
{
  -[__NSCFURLLocalStreamTask _onqueue_readStream:writeStreamAvailable:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(const void **)(a1 + 48));
}

uint64_t __104____NSCFURLLocalStreamTaskFromDataTask_initWithTask_remainingInputStream_remainingOutputStream_disavow___block_invoke(_QWORD *a1)
{
  const __CFAllocator *v2;
  void *v3;
  CFArrayRef v4;
  __CFReadStream *v5;
  const void *v6;
  __CFWriteStream *v7;
  const __CFAllocator *v8;
  CFReadStreamRef v9;
  CFWriteStreamRef v10;
  CFReadStreamRef *v11;
  CFReadStreamRef readStream;
  CFWriteStreamRef writeStream;
  CFReadStreamRef v15;
  CFStreamClientContext values;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  writeStream = 0;
  v15 = 0;
  if (a1[4] && a1[5])
  {
    readStream = 0;
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &readStream, (CFWriteStreamRef *)(a1[6] + 1200), 0xFFFFLL);
    v3 = (void *)a1[4];
    values.version = (CFIndex)readStream;
    values.info = v3;
    v4 = CFArrayCreate(v2, (const void **)&values, 2, MEMORY[0x1E0C9B378]);
    if (readStream)
      CFRelease(readStream);
    v5 = (__CFReadStream *)CFReadStreamCreate();
    v15 = v5;
    if (v4)
      CFRelease(v4);
    v6 = (const void *)a1[5];
    if (v6)
      v7 = (__CFWriteStream *)CFRetain(v6);
    else
      v7 = 0;
    writeStream = v7;
  }
  else
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v15, (CFWriteStreamRef *)(a1[6] + 1200), 0xFFFFLL);
    CFStreamCreateBoundPair(v8, (CFReadStreamRef *)(a1[6] + 1168), &writeStream, 0xFFFFLL);
    v7 = writeStream;
    v5 = v15;
  }
  -[__NSCFURLLocalStreamTask _onqueue_readStream:writeStreamAvailable:](a1[6], v5, v7);
  v9 = v15;
  v15 = 0;
  if (v9)
    CFRelease(v9);
  v10 = writeStream;
  writeStream = 0;
  if (v10)
    CFRelease(v10);
  v11 = (CFReadStreamRef *)a1[6];
  values.version = 0;
  values.info = v11;
  values.retain = _rr_retain;
  values.release = _rr_release;
  values.copyDescription = (CFStringRef (__cdecl *)(void *))MEMORY[0x1E0C98350];
  CFReadStreamSetClient(v11[146], 0x1AuLL, (CFReadStreamClientCallBack)_onqueue_stFromDataTaskReadCallback, &values);
  MEMORY[0x186DB62D4](*(_QWORD *)(a1[6] + 1168), objc_msgSend((id)a1[6], "workQueue"));
  CFReadStreamOpen(*(CFReadStreamRef *)(a1[6] + 1168));
  if (!a1[5])
    -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp]((_QWORD *)a1[6]);
  CFWriteStreamSetClient(*(CFWriteStreamRef *)(a1[6] + 1200), 0x1CuLL, (CFWriteStreamClientCallBack)_onqueue_stFromDataTaskWriteCallback, &values);
  MEMORY[0x186DB6A90](*(_QWORD *)(a1[6] + 1200), objc_msgSend((id)a1[6], "workQueue"));
  return CFWriteStreamOpen(*(CFWriteStreamRef *)(a1[6] + 1200));
}

uint64_t __61____NSCFURLLocalStreamTaskFromDataTask_initWithTask_disavow___block_invoke(uint64_t a1)
{
  const void *v2;
  CFReadStreamRef v3;
  CFWriteStreamRef *v4;
  CFStreamClientContext v6;
  CFReadStreamRef readStream;

  readStream = 0;
  CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &readStream, (CFWriteStreamRef *)(*(_QWORD *)(a1 + 32) + 1200), 0xFFFFLL);
  v2 = (const void *)CFWriteStreamCreate();
  -[__NSCFURLLocalStreamTask _onqueue_readStream:writeStreamAvailable:](*(_QWORD *)(a1 + 32), readStream, v2);
  v3 = readStream;
  readStream = 0;
  if (v3)
    CFRelease(v3);
  if (v2)
    CFRelease(v2);
  v4 = *(CFWriteStreamRef **)(a1 + 32);
  v6.version = 0;
  v6.info = v4;
  v6.retain = _rr_retain;
  v6.release = _rr_release;
  v6.copyDescription = (CFStringRef (__cdecl *)(void *))MEMORY[0x1E0C98350];
  CFWriteStreamSetClient(v4[150], 0x1CuLL, (CFWriteStreamClientCallBack)_onqueue_stFromDataTaskWriteCallback, &v6);
  MEMORY[0x186DB6A90](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1200), objc_msgSend(*(id *)(a1 + 32), "workQueue"));
  return CFWriteStreamOpen(*(CFWriteStreamRef *)(*(_QWORD *)(a1 + 32) + 1200));
}

_QWORD *__61____NSCFURLLocalStreamTaskFromDataTask_initWithTask_disavow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 32, 0);
  *result = &off_1E14ECCC0;
  result[1] = a2;
  result[2] = 0;
  result[3] = 0;
  return result;
}

@end
