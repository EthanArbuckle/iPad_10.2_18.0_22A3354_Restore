@implementation CPLoggingStartNewLogFile

void __CPLoggingStartNewLogFile_block_invoke(uint64_t a1)
{
  CFStringRef v2;
  unsigned int v3;
  _QWORD *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned __int16 *UTF8StringFromString;
  xpc_object_t v10;
  void *v11;
  const char *string;
  size_t v13;
  _BOOL4 v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  _QWORD v18[5];
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v2 = 0;
  v3 = 0;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(const __CFString **)(v4[8] + 8);
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    if (!v5)
    {
      _workQueueRefreshUUIDForWorkSettings((uint64_t)v4);
      v5 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 8);
      if (!v5)
        goto LABEL_20;
    }
    if (v2)
    {
      CFRelease(v2);
      v5 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 8);
    }
    v7 = _workQueueCopyConnection();
    if (v7)
    {
      v8 = (void *)v7;
      UTF8StringFromString = _createUTF8StringFromString(v5);
      v20 = 0;
      v21 = &v20;
      v22 = 0x3052000000;
      v23 = __Block_byref_object_copy__1;
      v24 = __Block_byref_object_dispose__1;
      v25 = 0;
      v10 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v10, "message", 3);
      xpc_dictionary_set_string(v10, "uuid", (const char *)UTF8StringFromString);
      if (_waitForResponseQueue_once != -1)
        dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = ___workQueueStartNewLogFile_block_invoke;
      block[3] = &unk_1E2881868;
      block[4] = v8;
      block[5] = v10;
      dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, block);
      if (_waitForResponseSema_once != -1)
        dispatch_once(&_waitForResponseSema_once, &__block_literal_global_150);
      dispatch_semaphore_wait((dispatch_semaphore_t)_waitForResponseSema_sema, 0xFFFFFFFFFFFFFFFFLL);
      xpc_release(v10);
      if (_waitForResponseQueue_once != -1)
        dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = ___workQueueStartNewLogFile_block_invoke_2;
      v18[3] = &unk_1E28819F8;
      v18[4] = &v20;
      dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v18);
      v11 = (void *)v21[5];
      if (v11)
      {
        string = xpc_dictionary_get_string(v11, "newfilepath");
        v2 = (CFStringRef)string;
        if (string)
        {
          v13 = strlen(string);
          v2 = CFStringCreateWithBytes(0, (const UInt8 *)v2, v13, 0x8000100u, 0);
        }
        v14 = xpc_dictionary_get_BOOL((xpc_object_t)v21[5], "retval");
        xpc_release((xpc_object_t)v21[5]);
        if (UTF8StringFromString)
          goto LABEL_17;
      }
      else
      {
        CFLog();
        v2 = 0;
        v14 = 0;
        if (UTF8StringFromString)
LABEL_17:
          free(UTF8StringFromString);
      }
      xpc_release(v8);
      _Block_object_dispose(&v20, 8);
      if (v14)
        goto LABEL_20;
      goto LABEL_19;
    }
    v2 = 0;
LABEL_19:
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 8));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 8) = 0;
LABEL_20:
    v5 = 0;
    v4 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)(v4[8] + 8))
      v15 = 1;
    else
      v15 = ++v3 >= 3;
  }
  while (!v15);
  if (v3 >= 3)
  {
    CFLog();
    v4 = *(_QWORD **)(a1 + 32);
  }
  v16 = v4[6];
  if (v16)
    v17 = v2 == 0;
  else
    v17 = 1;
  if (!v17)
  {
    (*(void (**)(_QWORD, CFStringRef))(v16 + 16))(v4[6], v2);
    goto LABEL_37;
  }
  if (v2)
  {
LABEL_37:
    CFRelease(v2);
    v4 = *(_QWORD **)(a1 + 32);
  }
  free(v4);
}

@end
