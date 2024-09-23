@implementation CPLoggingSlurpFileIntoLogFile

uint64_t __CPLoggingSlurpFileIntoLogFile_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __CPLoggingSlurpFileIntoLogFile_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  double v2;
  const void *v3;
  CFAbsoluteTime Current;
  CFStringRef v5;
  unsigned int v6;
  const __CFString *v7;
  int v8;
  int v9;
  int64_t v10;
  unsigned __int16 *UTF8StringFromString;
  unsigned __int16 *v12;
  int v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  xpc_object_t v16;
  void *v17;
  const char *string;
  size_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  const void *v25;
  const void *v26;
  const void *v27;
  uint64_t v28;
  BOOL v30;
  uint64_t v31;
  int64_t value;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  xpc_object_t object;
  _QWORD v37[5];
  _QWORD block[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  uint64_t v44;

  v1 = *(_QWORD *)(a1 + 40);
  v34 = *(const __CFString **)(a1 + 56);
  v35 = *(const __CFString **)(a1 + 48);
  v33 = *(const __CFString **)(a1 + 64);
  if (*(uint64_t *)(v1 + 24) < 1)
    goto LABEL_7;
  if (**(_QWORD **)(v1 + 64))
  {
    v2 = MEMORY[0x193FF67C4]();
    if (v2 < CFAbsoluteTimeGetCurrent())
    {
      v3 = **(const void ***)(v1 + 64);
      if (v3)
        CFRelease(v3);
      goto LABEL_6;
    }
LABEL_7:
    value = 0;
    goto LABEL_8;
  }
LABEL_6:
  Current = CFAbsoluteTimeGetCurrent();
  **(_QWORD **)(v1 + 64) = CFDateCreate(0, Current + 13.0);
  value = *(_QWORD *)(v1 + 24);
LABEL_8:
  v30 = 0;
  v5 = 0;
  v6 = 0;
  v7 = *(const __CFString **)(*(_QWORD *)(v1 + 64) + 8);
  v31 = v1;
  do
  {
    if (!v7)
    {
      _workQueueRefreshUUIDForWorkSettings(v1);
      v7 = *(const __CFString **)(*(_QWORD *)(v1 + 64) + 8);
      if (!v7)
      {
        v21 = 0;
        goto LABEL_42;
      }
    }
    if (v5)
    {
      CFRelease(v5);
      v7 = *(const __CFString **)(*(_QWORD *)(v1 + 64) + 8);
    }
    v8 = *(unsigned __int8 *)(v1 + 74);
    v9 = *(unsigned __int8 *)(v1 + 72);
    v10 = *(int *)(v1 + 32);
    object = (xpc_object_t)_workQueueCopyConnection();
    if (object)
    {
      UTF8StringFromString = _createUTF8StringFromString(v7);
      v12 = _createUTF8StringFromString(v35);
      v13 = open((const char *)v12, 0);
      v14 = _createUTF8StringFromString(v34);
      v15 = _createUTF8StringFromString(v33);
      v39 = 0;
      v40 = &v39;
      v41 = 0x3052000000;
      v42 = __Block_byref_object_copy__1;
      v43 = __Block_byref_object_dispose__1;
      v44 = 0;
      v16 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v16, "message", 4);
      xpc_dictionary_set_string(v16, "uuid", (const char *)UTF8StringFromString);
      xpc_dictionary_set_fd(v16, "slurpeefd", v13);
      xpc_dictionary_set_string(v16, "prefix", (const char *)v14);
      xpc_dictionary_set_string(v16, "suffix", (const char *)v15);
      xpc_dictionary_set_BOOL(v16, "startnewfile", v8 != 0);
      xpc_dictionary_set_int64(v16, "sizecheck", value);
      xpc_dictionary_set_int64(v16, "maxfilecount", v10);
      xpc_dictionary_set_BOOL(v16, "wantscompressed", v9 != 0);
      if (_waitForResponseQueue_once != -1)
        dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___workQueueSlurpToFileUUID_block_invoke;
      block[3] = &unk_1E2881868;
      block[4] = object;
      block[5] = v16;
      dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, block);
      if (_waitForResponseSema_once != -1)
        dispatch_once(&_waitForResponseSema_once, &__block_literal_global_150);
      dispatch_semaphore_wait((dispatch_semaphore_t)_waitForResponseSema_sema, 0xFFFFFFFFFFFFFFFFLL);
      xpc_release(v16);
      if (_waitForResponseQueue_once != -1)
        dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_148);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = ___workQueueSlurpToFileUUID_block_invoke_2;
      v37[3] = &unk_1E28819F8;
      v37[4] = &v39;
      dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v37);
      v17 = (void *)v40[5];
      if (v17)
      {
        v30 = xpc_dictionary_get_BOOL(v17, "didcreate");
        string = xpc_dictionary_get_string((xpc_object_t)v40[5], "newfilepath");
        v5 = (CFStringRef)string;
        if (string)
        {
          v19 = strlen(string);
          v5 = CFStringCreateWithBytes(0, (const UInt8 *)v5, v19, 0x8000100u, 0);
        }
        v20 = xpc_dictionary_get_BOOL((xpc_object_t)v40[5], "retval");
        xpc_release((xpc_object_t)v40[5]);
      }
      else
      {
        CFLog();
        v5 = 0;
        v20 = 0;
      }
      if (v13 != -1)
        close(v13);
      if (UTF8StringFromString)
        free(UTF8StringFromString);
      if (v12)
        free(v12);
      if (v14)
        free(v14);
      if (v15)
        free(v15);
      xpc_release(object);
      _Block_object_dispose(&v39, 8);
      if (v20)
      {
        v1 = v31;
        v21 = *(_QWORD *)(*(_QWORD *)(v31 + 64) + 8);
        goto LABEL_42;
      }
      v1 = v31;
    }
    else
    {
      v5 = 0;
    }
    v22 = *(_QWORD *)(v1 + 64);
    v23 = *(const void **)(v22 + 8);
    if (v23)
    {
      CFRelease(v23);
      v22 = *(_QWORD *)(v1 + 64);
    }
    v21 = 0;
    *(_QWORD *)(v22 + 8) = 0;
LABEL_42:
    if (v21)
      break;
    ++v6;
    v7 = 0;
  }
  while (v6 < 3);
  if (v6 >= 3)
    CFLog();
  v24 = *(_QWORD *)(v1 + 48);
  if (v24 && v30)
    (*(void (**)(uint64_t, CFStringRef))(v24 + 16))(v24, v5);
  if (v5)
    CFRelease(v5);
  free(*(void **)(a1 + 40));
  v25 = *(const void **)(a1 + 48);
  if (v25)
    CFRelease(v25);
  v26 = *(const void **)(a1 + 56);
  if (v26)
    CFRelease(v26);
  v27 = *(const void **)(a1 + 64);
  if (v27)
    CFRelease(v27);
  v28 = *(_QWORD *)(a1 + 32);
  if (v28)
  {
    (*(void (**)(uint64_t))(v28 + 16))(v28);
    _Block_release(*(const void **)(a1 + 32));
  }
}

@end
