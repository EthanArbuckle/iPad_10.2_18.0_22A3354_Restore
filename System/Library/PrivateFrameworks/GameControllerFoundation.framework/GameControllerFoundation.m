void sub_1DC7A37C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, const __CFString *a16, uint64_t a17)
{
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  if (a2)
  {
    if (a2 == 2)
    {
      v20 = objc_begin_catch(exception_object);
      if (v17)
      {
        a12 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(*(id *)(v19 + 3480), "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *MEMORY[0x1E0CB2D68];
        a15 = (uint64_t)v21;
        a16 = CFSTR("Model build failed.  This is a #BUG.");
        v23 = *MEMORY[0x1E0CB3388];
        a13 = v22;
        a14 = v23;
        objc_msgSend(v20, "gc_error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        a17 = (uint64_t)v24;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a15, &a12, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v25);
        *v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7A35FCLL);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1DC7A4148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

_QWORD *IOGCFastPathClientInterfacePrepareObjCVtbl(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD *v6;

  v3 = (id)objc_opt_class();
  objc_sync_enter(v3);
  objc_getAssociatedObject(v3, &unk_1F03A94E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA0D8), "initWithLength:", 96);
    objc_setAssociatedObject(v3, &unk_1F03A94E8, v4, (void *)0x301);
  }
  v5 = objc_retainAutorelease(v4);
  v6 = (_QWORD *)objc_msgSend(v5, "mutableBytes");

  objc_sync_exit(v3);
  if (!*v6)
  {
    *v6 = a2;
    v6[1] = queryInterface_0;
    v6[2] = addRef_0;
    v6[3] = release_0;
    v6[4] = 1;
    v6[5] = __IOGCFastPathClientInterfaceObjCThunk_CopyDescription;
    v6[6] = __IOGCFastPathClientInterfaceObjCThunk_Open;
    v6[7] = __IOGCFastPathClientInterfaceObjCThunk_Close;
    v6[8] = __IOGCFastPathClientInterfaceObjCThunk_GetClientProperty;
    v6[9] = __IOGCFastPathClientInterfaceObjCThunk_SetClientProperty;
    v6[10] = __IOGCFastPathClientInterfaceObjCThunk_CreateControlQueue;
    v6[11] = __IOGCFastPathClientInterfaceObjCThunk_CreateInputQueue;
  }
  return v6;
}

void sub_1DC7A445C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathClientInterfaceObjCThunk_CopyDescription(_QWORD **a1)
{
  char *v1;
  void *v2;
  CFTypeRef v3;

  v1 = (char *)a1 - **a1;
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_Open(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "open:", a2);
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_Close(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "close:", a2);
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_GetClientProperty(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getProperty:", a2);
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_SetClientProperty(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((char *)a1 - **a1, "setProperty:value:", a2, a3);
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_CreateControlQueue(_QWORD **a1)
{
  return objc_msgSend((char *)a1 - **a1, "createControlQueueWithOptions:object:");
}

uint64_t __IOGCFastPathClientInterfaceObjCThunk_CreateInputQueue(_QWORD **a1)
{
  return objc_msgSend((char *)a1 - **a1, "createInputQueueWithOptions:object:");
}

_QWORD *IOGCFastPathControlQueueInterfacePrepareObjCVtbl(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;

  v3 = a1;
  v4 = (id)objc_opt_class();
  objc_sync_enter(v4);
  objc_getAssociatedObject(v4, &unk_1F03A9548);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA0D8), "initWithLength:", 96);
    objc_setAssociatedObject(v4, &unk_1F03A9548, v5, (void *)0x301);
  }
  v6 = objc_retainAutorelease(v5);
  v7 = (_QWORD *)objc_msgSend(v6, "mutableBytes");

  objc_sync_exit(v4);
  if (!*v7)
  {
    *v7 = a2;
    v7[1] = queryInterface_0;
    v7[2] = addRef_0;
    v7[3] = release_0;
    v7[4] = 1;
    v7[5] = __IOGCFastPathControlQueueInterfaceObjCThunk_CopyDescription;
    v7[6] = __IOGCFastPathControlQueueInterfaceObjCThunk_GetProperty;
    v7[7] = __IOGCFastPathControlQueueInterfaceObjCThunk_SetProperty;
    v7[8] = __IOGCFastPathControlQueueInterfaceObjCThunk_GetActivePosition;
    v7[9] = __IOGCFastPathControlQueueInterfaceObjCThunk_GetReadPosition;
    v7[10] = __IOGCFastPathControlQueueInterfaceObjCThunk_ResetPosition;
    v7[11] = __IOGCFastPathControlQueueInterfaceObjCThunk_GetSampleWithOptions;
  }

  return v7;
}

void sub_1DC7A4668(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathControlQueueInterfaceObjCThunk_CopyDescription(_QWORD **a1)
{
  char *v1;
  void *v2;
  CFTypeRef v3;

  v1 = (char *)a1 - **a1;
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_GetProperty(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getProperty:", a2);
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_SetProperty(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((char *)a1 - **a1, "setProperty:value:", a2, a3);
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_GetActivePosition(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getActivePosition:", a2);
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_GetReadPosition(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getReadPosition:", a2);
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_ResetPosition(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "resetPosition:", a2);
}

uint64_t __IOGCFastPathControlQueueInterfaceObjCThunk_GetSampleWithOptions(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - **a1, "get:options:sample:", a2, a3, a4);
}

_QWORD *IOGCFastPathInputQueueInterfacePrepareObjCVtbl(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;

  v3 = a1;
  v4 = (id)objc_opt_class();
  objc_sync_enter(v4);
  objc_getAssociatedObject(v4, &unk_1F03A95A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA0D8), "initWithLength:", 96);
    objc_setAssociatedObject(v4, &unk_1F03A95A8, v5, (void *)0x301);
  }
  v6 = objc_retainAutorelease(v5);
  v7 = (_QWORD *)objc_msgSend(v6, "mutableBytes");

  objc_sync_exit(v4);
  if (!*v7)
  {
    *v7 = a2;
    v7[1] = queryInterface_0;
    v7[2] = addRef_0;
    v7[3] = release_0;
    v7[4] = 1;
    v7[5] = __IOGCFastPathInputQueueInterfaceObjCThunk_CopyDescription;
    v7[6] = __IOGCFastPathInputQueueInterfaceObjCThunk_InputQueueGetProperty;
    v7[7] = __IOGCFastPathInputQueueInterfaceObjCThunk_InputQueueSetProperty;
    v7[8] = __IOGCFastPathInputQueueInterfaceObjCThunk_GetDataAvailableNotification;
    v7[9] = __IOGCFastPathInputQueueInterfaceObjCThunk_GetLatestSamplePosition;
    v7[10] = __IOGCFastPathInputQueueInterfaceObjCThunk_GetSampleWithOptions;
    v7[11] = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7[11] = __IOGCFastPathInputQueueInterfaceObjCThunk_CreateReader;
  }

  return v7;
}

void sub_1DC7A489C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathInputQueueInterfaceObjCThunk_CopyDescription(_QWORD **a1)
{
  char *v1;
  void *v2;
  CFTypeRef v3;

  v1 = (char *)a1 - **a1;
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_InputQueueGetProperty(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getProperty:", a2);
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_InputQueueSetProperty(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((char *)a1 - **a1, "setProperty:value:", a2, a3);
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_GetDataAvailableNotification(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getDataAvailableNotification:", a2);
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_GetLatestSamplePosition(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getLatestSamplePosition:", a2);
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_GetSampleWithOptions(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - **a1, "get:options:sample:", a2, a3, a4);
}

uint64_t __IOGCFastPathInputQueueInterfaceObjCThunk_CreateReader(_QWORD **a1)
{
  return objc_msgSend((char *)a1 - **a1, "createReaderObject:");
}

_QWORD *IOGCFastPathReaderInterfacePrepareObjCVtbl(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;

  v3 = a1;
  v4 = (id)objc_opt_class();
  objc_sync_enter(v4);
  objc_getAssociatedObject(v4, &unk_1F03A9608);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA0D8), "initWithLength:", 88);
    objc_setAssociatedObject(v4, &unk_1F03A9608, v5, (void *)0x301);
  }
  v6 = objc_retainAutorelease(v5);
  v7 = (_QWORD *)objc_msgSend(v6, "mutableBytes");

  objc_sync_exit(v4);
  if (!*v7)
  {
    *v7 = a2;
    v7[1] = queryInterface_0;
    v7[2] = addRef_0;
    v7[3] = release_0;
    v7[4] = 1;
    v7[5] = __IOGCFastPathReaderInterfaceObjCThunk_CopyDescription;
    v7[6] = __IOGCFastPathReaderInterfaceObjCThunk_Reset;
    v7[7] = __IOGCFastPathReaderInterfaceObjCThunk_GetReadPosition;
    v7[8] = __IOGCFastPathReaderInterfaceObjCThunk_ReadCurrentSample;
    v7[9] = __IOGCFastPathReaderInterfaceObjCThunk_ReadNextSample;
    v7[10] = __IOGCFastPathReaderInterfaceObjCThunk_ReadPreviousSample;
  }

  return v7;
}

void sub_1DC7A4AAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathReaderInterfaceObjCThunk_CopyDescription(_QWORD **a1)
{
  char *v1;
  void *v2;
  CFTypeRef v3;

  v1 = (char *)a1 - **a1;
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_Reset(_QWORD **a1)
{
  return objc_msgSend((char *)a1 - **a1, "reset");
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_GetReadPosition(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getReadPosition:", a2);
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_ReadCurrentSample(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "readCurrentSample:", a2);
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_ReadNextSample(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "readNextSample:", a2);
}

uint64_t __IOGCFastPathReaderInterfaceObjCThunk_ReadPreviousSample(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "readPreviousSample:", a2);
}

_QWORD *IOGCFastPathSampleContainerInterfacePrepareObjCVtbl(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;

  v3 = a1;
  v4 = (id)objc_opt_class();
  objc_sync_enter(v4);
  objc_getAssociatedObject(v4, &unk_1F03A9668);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA0D8), "initWithLength:", 232);
    objc_setAssociatedObject(v4, &unk_1F03A9668, v5, (void *)0x301);
  }
  v6 = objc_retainAutorelease(v5);
  v7 = (_QWORD *)objc_msgSend(v6, "mutableBytes");

  objc_sync_exit(v4);
  if (!*v7)
  {
    *v7 = a2;
    v7[1] = queryInterface_0;
    v7[2] = addRef_0;
    v7[3] = release_0;
    v7[4] = 1;
    v7[5] = __IOGCFastPathSampleContainerInterfaceObjCThunk_CopyDescription;
    v7[6] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleDestroy;
    v7[7] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleRefresh;
    v7[8] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleCommit;
    v7[9] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetPosition;
    v7[10] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetSequenceID;
    v7[11] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetSubsampleCount;
    v7[12] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetFlags;
    v7[13] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetFlags;
    v7[14] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetTimestamp;
    v7[15] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetTimestamp;
    v7[16] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetInteger;
    v7[17] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetDouble;
    v7[18] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetInteger;
    v7[19] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetDouble;
    v7[20] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet2Integer;
    v7[21] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet2Double;
    v7[22] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet2Integer;
    v7[23] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet2Double;
    v7[24] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet3Integer;
    v7[25] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet3Double;
    v7[26] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet3Integer;
    v7[27] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet3Double;
    v7[28] = __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetTraceData;
  }

  return v7;
}

void sub_1DC7A4D50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __IOGCFastPathSampleContainerInterfaceObjCThunk_CopyDescription(_QWORD **a1)
{
  char *v1;
  void *v2;
  CFTypeRef v3;

  v1 = (char *)a1 - **a1;
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFRetain(v2);

  return v3;
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleDestroy(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "sampleDestroy:", a2);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleRefresh(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "sampleRefresh:", a2);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleCommit(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "sampleCommit:", a2);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetPosition(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "sampleGetPosition:", a2);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetSequenceID(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSequenceID:maxID:", a2, a3, a4);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetSubsampleCount(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsampleCount:", a2, a3);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetFlags(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsample:flags:", a2, a3, a4);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetFlags(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:flags:", a2, a3, a4);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetTimestamp(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsample:field:domain:options:timestamp:uncertainty:flags:", a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetTimestamp(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v10;

  LODWORD(v10) = a9;
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:domain:options:timestamp:tolerance:flags:", a2, a3, a4, a5, a6, a7, a8, v10);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetInteger(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsample:field:options:integer:", a2, a3, a4, a5, a6);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetDouble(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsample:field:options:double:", a2, a3, a4, a5, a6);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetInteger(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:integer:", a2, a3, a4, a5, a6);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSetDouble(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:double:", a2, a3, a4, a5);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet2Integer(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsample:field:options:integer::", a2, a3, a4, a5, a6, a7);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet2Double(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsample:field:options:double::", a2, a3, a4, a5, a6, a7);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet2Integer(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:integer::", a2, a3, a4, a5, a6, a7);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet2Double(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:double::", a2, a3, a4, a5);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet3Integer(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsample:field:options:integer:::", a2, a3, a4, a5, a6, a7, a8);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGet3Double(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getSubsample:field:options:double:::", a2, a3, a4, a5, a6, a7, a8);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet3Integer(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:integer:::", a2, a3, a4, a5, a6, a7, a8);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleSet3Double(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((char *)a1 - **a1, "sample:setSubsample:field:options:double:::", a2, a3, a4, a5);
}

uint64_t __IOGCFastPathSampleContainerInterfaceObjCThunk_SampleGetTraceData(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend((char *)a1 - **a1, "sample:getTraceProviderID:queueID:channel:position:", a2, a3, a4, a5, a6);
}

void sub_1DC7A53D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_1DC7A55E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7A6364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, const __CFString *a16, uint64_t a17)
{
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  if (a2)
  {
    if (a2 == 2)
    {
      v20 = objc_begin_catch(exception_object);
      if (v17)
      {
        a12 = *MEMORY[0x1E0CB2D50];
        v21 = *(void **)(v19 + 3480);
        objc_msgSend((id)objc_opt_class(), "modelClass");
        objc_msgSend(v21, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *MEMORY[0x1E0CB2D68];
        a15 = (uint64_t)v22;
        a16 = CFSTR("Model build failed.  This is a #BUG.");
        v24 = *MEMORY[0x1E0CB3388];
        a13 = v23;
        a14 = v24;
        objc_msgSend(v20, "gc_error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        a17 = (uint64_t)v25;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a15, &a12, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v26);
        *v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7A61DCLL);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id _gc_log_devicedb()
{
  if (_gc_log_devicedb_onceToken != -1)
    dispatch_once(&_gc_log_devicedb_onceToken, &__block_literal_global);
  return (id)_gc_log_devicedb_Log;
}

void ___gc_log_devicedb_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller.HIDGameControllerMappingsDB", "Common");
  v1 = (void *)_gc_log_devicedb_Log;
  _gc_log_devicedb_Log = (uint64_t)v0;

}

_GCDisposable *PushValueChangedHandler(void *a1, void *a2, uint64_t a3, int a4)
{
  _QWORD *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  _GCDisposable *v12;
  _QWORD *v13;
  _GCDisposable *v14;
  _QWORD v16[4];
  _QWORD *v17;
  _QWORD *v18;

  v7 = a1;
  v8 = a2;
  v9 = v7 + 5;
  if (v7[5])
    v9 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00406268BE83uLL);
  v10 = objc_msgSend(v8, "copy");
  v11 = (void *)*v9;
  *v9 = v10;

  v12 = 0;
  v9[1] = a3;
  v9[2] = 0;
  v13 = (_QWORD *)v7[4];
  v9[3] = v13;
  *v13 = v9;
  v7[4] = v9 + 2;
  if (a4)
  {
    v14 = [_GCDisposable alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __PushValueChangedHandler_block_invoke;
    v16[3] = &unk_1EA4D2C08;
    v18 = v9;
    v17 = v7;
    v12 = -[_GCDisposable initWithCleanupHandler:](v14, "initWithCleanupHandler:", v16);

  }
  return v12;
}

void sub_1DC7A8CB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,const __CFString *a37,uint64_t a38)
{
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;

  if (a2)
  {
    if (a2 == 2)
    {
      v38 = objc_begin_catch(exception_object);
      if (a16)
      {
        a33 = *MEMORY[0x1E0CB2D50];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *MEMORY[0x1E0CB2D68];
        a36 = (uint64_t)v39;
        a37 = CFSTR("Model build failed.  This is a #BUG.");
        v41 = *MEMORY[0x1E0CB3388];
        a34 = v40;
        a35 = v41;
        objc_msgSend(v38, "gc_error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        a38 = (uint64_t)v42;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a36, &a33, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v43);
        *a16 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7A8B94);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1DC7AB3CC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1DC7ABC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1DC7AC548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC7ACCA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_1DC7ACEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC7AD0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1DC7AD434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DC7AD5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DC7AD7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DC7ADBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void __HIDDevicesMatched(void *a1, io_iterator_t a2)
{
  const __CFAllocator *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *CFProperty;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  kern_return_t v15;
  GCHIDDeviceSnapshot *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  kern_return_t v22;
  NSObject *v23;
  kern_return_t v24;
  GCHIDDeviceSnapshot *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  kern_return_t v29;
  uint64_t v30;
  char *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *log;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  io_connect_t connect;
  uint64_t entryID;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  _OWORD *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  kern_return_t v51;
  _OWORD v52[8];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v36 = a1;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (1)
  {
    while (1)
    {
      v3 = IOIteratorNext(a2);
      if (!(_DWORD)v3)
        break;
      v4 = _os_activity_create(&dword_1DC79E000, "[Generic Device Manager] Matched Kernel Service", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      entryID = 0;
      memset(v52, 0, sizeof(v52));
      IORegistryEntryGetRegistryEntryID(v3, &entryID);
      MEMORY[0x1DF0CDC70](v3, v52);
      _gc_log_generic_device();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v47 = v52;
        v48 = 2048;
        v49 = (const char *)entryID;
        _os_log_debug_impl(&dword_1DC79E000, v5, OS_LOG_TYPE_DEBUG, "Matched kernel service <%s %#llx>.", buf, 0x16u);
      }

      CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("Transport"), v2, 0);
      v7 = CFProperty;
      if (!CFProperty || !objc_msgSend(CFProperty, "isEqualToString:", CFSTR("Rapport")))
      {
        v9 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("GCSyntheticDevice"), v2, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
        {
          _gc_log_generic_device();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v47 = v52;
            v48 = 2048;
            v49 = (const char *)entryID;
            _os_log_debug_impl(&dword_1DC79E000, v10, OS_LOG_TYPE_DEBUG, "Skipping <%s %#llx>.  Synthetic device.", buf, 0x16u);
          }

          IOObjectRelease(v3);
          goto LABEL_54;
        }
        v11 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("HIDVirtualDevice"), v2, 0);
        v41 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("VendorID"), v2, 0);
        v40 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("ProductID"), v2, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "BOOLValue"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v41, "unsignedShortValue") == 1118)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v40, "unsignedShortValue") == 654)
              {
                _gc_log_generic_device();
                v12 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v47 = v52;
                  v48 = 2048;
                  v49 = (const char *)entryID;
                  _os_log_debug_impl(&dword_1DC79E000, v12, OS_LOG_TYPE_DEBUG, "Skipping <%s %#llx>.  3rd party synthetic device.", buf, 0x16u);
                }

                IOObjectRelease(v3);
                goto LABEL_53;
              }
            }
          }
        }
        v13 = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("GameControllerSupportedHIDDevice"), v2, 0);
        if (v13)
        {
          _gc_log_generic_device();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v28 = entryID;
            v29 = objc_msgSend(v13, "BOOLValue");
            *(_DWORD *)buf = 136315650;
            v47 = v52;
            v48 = 2048;
            v49 = (const char *)v28;
            v50 = 1024;
            v51 = v29;
            _os_log_debug_impl(&dword_1DC79E000, v14, OS_LOG_TYPE_DEBUG, "Skipping <%s %#llx>.  Already determined game controller support: %{BOOL}d.", buf, 0x1Cu);
          }
          goto LABEL_29;
        }
        connect = 0;
        v15 = IOServiceOpen(v3, *MEMORY[0x1E0C83DA0], 0x484944u, &connect);
        if (v15)
        {
          _gc_log_generic_device();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v47 = v52;
            v48 = 2048;
            v49 = (const char *)entryID;
            v50 = 1024;
            v51 = v15;
            _os_log_error_impl(&dword_1DC79E000, v14, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to open connection: %{mach.errno}d", buf, 0x1Cu);
          }
LABEL_29:

          IOObjectRelease(v3);
LABEL_52:

LABEL_53:
LABEL_54:

          goto LABEL_55;
        }
        GCLookupService(0, (objc_class *)&unk_1F03A4588, 0, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          GCLookupService(0, (objc_class *)&unk_1F03A9750, 0, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[GCHIDDeviceSnapshot initWithService:]([GCHIDDeviceSnapshot alloc], "initWithService:", v3);
          objc_msgSend(v38, "hasModelForDevice:");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v39, "waitUntilFinished");
          if (v17 < 2)
          {
            _gc_log_generic_device();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              log = v18;
              v30 = entryID;
              objc_msgSend(v39, "error");
              v31 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v47 = (_OWORD *)v30;
              v48 = 2112;
              v49 = v31;
              v18 = log;
              _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "<IOHIDDevice %#llx> Error checking game controller support: %@", buf, 0x16u);

            }
            goto LABEL_38;
          }
          if (v17 == 2)
          {
            objc_msgSend(v39, "result");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "BOOLValue");

            if (v20)
            {
              _gc_log_generic_device();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v47 = (_OWORD *)entryID;
                _os_log_impl(&dword_1DC79E000, v21, OS_LOG_TYPE_DEFAULT, "<IOHIDDevice %#llx> is a supported game controller.  Initiating rematching...", buf, 0xCu);
              }

              v22 = IOConnectSetCFProperty(connect, CFSTR("GameControllerSupportedHIDDevice"), MEMORY[0x1E0C9AAB0]);
              if (v22)
              {
                _gc_log_generic_device();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218498;
                  v47 = (_OWORD *)entryID;
                  v48 = 2080;
                  v49 = "GameControllerSupportedHIDDevice";
                  v50 = 1024;
                  v51 = v22;
                  _os_log_error_impl(&dword_1DC79E000, v23, OS_LOG_TYPE_ERROR, "<IOHIDDevice %#llx> Error applying '%s' attribute: %{mach.errno}d", buf, 0x1Cu);
                }

              }
              v24 = IOConnectSetCFProperty(connect, CFSTR("IOHIDDeviceForceInterfaceRematch"), MEMORY[0x1E0C9AAB0]);
              if (v24)
              {
                _gc_log_generic_device();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  v47 = (_OWORD *)entryID;
                  v48 = 1024;
                  LODWORD(v49) = v24;
                  _os_log_error_impl(&dword_1DC79E000, v18, OS_LOG_TYPE_ERROR, "<IOHIDDevice %#llx> Error initiating rematching: %{mach.errno}d", buf, 0x12u);
                }
                goto LABEL_38;
              }
            }
            else
            {
              _gc_log_generic_device();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v47 = (_OWORD *)entryID;
                _os_log_debug_impl(&dword_1DC79E000, v18, OS_LOG_TYPE_DEBUG, "<IOHIDDevice %#llx> is NOT a supported game controller.", buf, 0xCu);
              }
LABEL_38:

            }
          }
          v25 = v16;
          objc_msgSend(v39, "result");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          GCAnalyticsSendCheckCompatibleHIDDeviceEvent(v37, v25, objc_msgSend(v26, "BOOLValue"));

          IOServiceClose(connect);
          IOObjectRelease(v3);

          v27 = v38;
        }
        else
        {
          unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", "void __HIDDevicesMatched(_GCGenericDeviceManager *__strong, io_iterator_t)");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("_GCGenericDeviceManager.m"), 448, CFSTR("In %s, but missing dbService."), "__HIDDevicesMatched");

          _gc_log_generic_device();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v47 = (_OWORD *)entryID;
            _os_log_error_impl(&dword_1DC79E000, v34, OS_LOG_TYPE_ERROR, "<IOHIDDevice %llx> Error checking game controller support: Internal error.", buf, 0xCu);
          }

          IOServiceClose(connect);
          v27 = 0;
          IOObjectRelease(v3);
        }

        goto LABEL_52;
      }
      _gc_log_generic_device();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v47 = v52;
        v48 = 2048;
        v49 = (const char *)entryID;
        _os_log_debug_impl(&dword_1DC79E000, v8, OS_LOG_TYPE_DEBUG, "Skipping <%s %#llx>.  Rapport device.", buf, 0x16u);
      }

      IOObjectRelease(v3);
LABEL_55:

      os_activity_scope_leave(&state);
    }
    if (IOIteratorIsValid(a2))
      break;
    MEMORY[0x1DF0CDBD4](a2);
  }

}

void sub_1DC7AE5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id gcfLocalizedStringCache()
{
  if (gcfLocalizedStringCache_onceToken != -1)
    dispatch_once(&gcfLocalizedStringCache_onceToken, &__block_literal_global_1);
  return (id)_gcfLocalizedStringCache;
}

void __gcfLocalizedStringCache_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  +[NSMutableDictionary dictionary](&off_1F03AA5A0, "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_gcfLocalizedStringCache;
  _gcfLocalizedStringCache = v0;

  +[NSNotificationCenter defaultCenter](&off_1F03AABE0, "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C99720], 0, 0, &__block_literal_global_3);

}

void __gcfLocalizedStringCache_block_invoke_2()
{
  void *v0;

  os_unfair_lock_lock((os_unfair_lock_t)&gcfLocalizedStringCacheLock);
  gcfLocalizedStringCache();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

  os_unfair_lock_unlock((os_unfair_lock_t)&gcfLocalizedStringCacheLock);
}

id _GCFConvertStringToLocalizedString(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&gcfLocalizedStringCacheLock);
    gcfLocalizedStringCache();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[NSBundle GameControllerFoundationBundle](NSBundle_0, "GameControllerFoundationBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", v2, &stru_1EA4D5008, CFSTR("Localizable"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v3, v2);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&gcfLocalizedStringCacheLock);

  }
  return v3;
}

void sub_1DC7AEE20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7AF5C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7AF734(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7AF800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DC7AFB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  void *v26;

  objc_sync_exit(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1DC7AFFCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void IOGCFastPathRoyaReplayClientSetProperty(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  do
  {
    os_unfair_lock_lock_with_options();
    v6 = *(id *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 80);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v8 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v8, "setValue:forKey:", a3, a2);
    v9 = (id)objc_msgSend(v8, "copy");

    if (a2)
    {
      if (objc_msgSend(a2, "isEqualToString:", CFSTR("ProviderID")))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = objc_msgSend(a3, "unsignedLongLongValue");
      }
    }
    os_unfair_lock_lock_with_options();
    if (*(id *)(a1 + 72) == v6)
    {
      *(_QWORD *)(a1 + 72) = v9;
      *(_QWORD *)(a1 + 80) = v7;
      v6 = v9;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));

  }
  while (v6 != v9);
}

__IOGCFastPathRoyaReplayClient *IOGCFastPathRoyaReplayClientCreate(__CFAllocator *a1)
{
  __CFAllocator *v1;
  __IOGCFastPathRoyaReplayClient *v2;

  if (a1)
    v1 = a1;
  else
    v1 = (__CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = [__IOGCFastPathRoyaReplayClient alloc];
  v2->super.allocator = v1;
  v2->super.pluginInterface = (IOCFPlugInInterfaceStruct **)&v2->_IOCFPlugInVTBL;
  v2->super.clientInterface = (IOGCFastPathClientInterface **)&v2->_IOGCFastPathClientVTBL;
  v2->_IOCFPlugInVTBL = (const IOCFPlugInInterfaceStruct *)&RoyaReplayCFPlugInVtable;
  v2->_IOGCFastPathClientVTBL = (const IOGCFastPathClientInterface *)&RoyaReplayClientVtable;
  v2->_lock._os_unfair_lock_opaque = 0;
  v2->_propertyTable = (NSDictionary *)objc_opt_new();
  return v2;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSetProperty(unsigned int ***a1, uint64_t a2, uint64_t a3)
{
  char *v5;
  void *v6;

  v5 = (char *)a1 - ***a1;
  os_unfair_lock_lock_with_options();
  v6 = (void *)*((_QWORD *)v5 + 16);
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    *((_QWORD *)v5 + 16) = v6;
  }
  objc_msgSend(v6, "setValue:forKey:", a3, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)v5 + 28);
  return 1;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueGetLatestSamplePosition(unsigned int ***a1, unint64_t *a2)
{
  char *v2;
  int v3;
  int v4;
  BOOL v5;
  unint64_t v6;
  uint64_t result;

  v2 = (char *)a1 - ***a1;
  v3 = atomic_load((unsigned __int16 *)v2 + 73);
  v4 = atomic_load((unsigned __int16 *)v2 + 72);
  if (v3)
    v5 = v3 == v4;
  else
    v5 = 0;
  if (!v5)
    return 3758097112;
  result = 0;
  v6 = atomic_load((unint64_t *)v2 + 20);
  *a2 = v6;
  return result;
}

uint64_t IOGCFastPathRoyaReplayInputQueueResetEnqueuePosition(uint64_t a1, unint64_t a2)
{
  unsigned __int16 *v4;
  unsigned __int16 v5;

  os_unfair_lock_lock_with_options();
  v4 = (unsigned __int16 *)(a1 + 144);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  atomic_store(a2, (unint64_t *)(a1 + 152));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 140));
  return 0;
}

uint64_t IOGCFastPathRoyaReplayInputQueueGetMutableSample(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *Instance;
  _QWORD *v15;
  objc_class *v17;

  v6 = 3758097127;
  os_unfair_lock_lock_with_options();
  v7 = atomic_load((unsigned __int16 *)(a1 + 144));
  if (v7)
  {
    v8 = atomic_load((unint64_t *)(a1 + 160));
    v9 = atomic_load((unint64_t *)(a1 + 152));
    if (v8 + 1 >= a2 || v9 == a2)
    {
      if (v9 <= a2)
      {
        v11 = *(_QWORD *)(a1 + 104);
        if (v11 + a2 > v8)
        {
          v12 = a1 + 168 + 24 * (a2 % v11);
          v15 = *(_QWORD **)(v12 + 16);
          v13 = (_QWORD *)(v12 + 16);
          Instance = v15;
          if (v15)
          {
            _objc_rootRetainCount();
            if (*((unsigned __int16 *)Instance + 8) != v7 || Instance[3] != a2)
            {
              ++Instance[1];
              *((_WORD *)Instance + 8) = v7;
              Instance[3] = a2;
              bzero(Instance + 4, 48 * *((unsigned __int16 *)Instance + 9));
            }
          }
          else
          {
            v17 = (objc_class *)objc_opt_class();
            Instance = class_createInstance(v17, 0x30uLL);
            *((_WORD *)Instance + 9) = 1;
            *((_WORD *)Instance + 8) = v7;
            Instance[1] = 1;
            Instance[3] = a2;
            *v13 = Instance;
          }
          v6 = 0;
          *(_QWORD *)a3 = a1 + 96;
          *(_QWORD *)(a3 + 8) = a2;
          *(_QWORD *)(a3 + 16) = Instance[1];
          *(_WORD *)(a3 + 24) = v7;
          *(_BYTE *)(a3 + 26) = *(_BYTE *)(a3 + 26) & 0xFC | 2;
        }
      }
    }
    else
    {
      v6 = 3758097128;
    }
  }
  else
  {
    v6 = 3758097112;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 140));
  return v6;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueGetSample(unsigned int ***a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  int v6;
  int v7;
  BOOL v8;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v4 = 3758097112;
  v5 = (char *)a1 - ***a1;
  v6 = atomic_load((unsigned __int16 *)v5 + 73);
  v7 = atomic_load((unsigned __int16 *)v5 + 72);
  if (v6)
    v8 = v6 == v7;
  else
    v8 = 0;
  if (v8)
  {
    v10 = atomic_load((unint64_t *)v5 + 20);
    v11 = atomic_load((unint64_t *)v5 + 19);
    if (v10 < a2)
    {
      return 3758097128;
    }
    else
    {
      if (v11 > a2)
        return 3758097127;
      v12 = *((_QWORD *)v5 + 13);
      if (v12 + a2 <= v10)
      {
        return 3758097127;
      }
      else
      {
        v14 = (uint64_t)&v5[24 * (a2 % v12) + 168];
        os_unfair_lock_lock_with_options();
        v15 = *(_QWORD *)(v14 + 8);
        if (v15)
        {
          v16 = *(unsigned __int16 *)(v15 + 16);
          v17 = *(_QWORD *)(v15 + 8);
          v18 = *(_QWORD *)(v15 + 24);
        }
        else
        {
          v16 = 0;
          v17 = 0;
          v18 = -1;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v14);
        if (v16 == v6 && v18 == a2)
        {
          v4 = 0;
          *(_QWORD *)a4 = v5 + 96;
          *(_QWORD *)(a4 + 8) = a2;
          *(_QWORD *)(a4 + 16) = v17;
          *(_WORD *)(a4 + 24) = v6;
          *(_BYTE *)(a4 + 26) &= 0xFCu;
        }
      }
    }
  }
  return v4;
}

uint64_t IOGCFastPathSampleGetClient4Roya(unsigned int ****a1)
{
  unsigned int **v1;

  v1 = **a1;
  if (*((_DWORD *)v1 + 9) == 1919908193)
    return *(uint64_t *)((char *)*a1 - **v1 + 16);
  else
    return 0;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleRead(unsigned int ***a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char *v6;
  char *v7;
  uint64_t v8;
  int v9;
  char *v10;
  _QWORD *v11;
  os_unfair_lock_s *v12;
  int v14;

  v3 = 3758097127;
  if (*(unsigned int ****)a2 != a1)
    return 3758097090;
  v6 = (char *)a1 - ***a1;
  v7 = v6 + 168;
  v8 = *(_QWORD *)(a2 + 8) % *((_QWORD *)v6 + 13);
  if ((*(_BYTE *)(a2 + 26) & 2) == 0)
  {
    v9 = atomic_load((unsigned __int16 *)v6 + 73);
    if (*(unsigned __int16 *)(a2 + 24) == v9)
    {
      v10 = &v7[24 * v8];
      os_unfair_lock_lock_with_options();
      v11 = *((id *)v10 + 1);
      v12 = (os_unfair_lock_s *)v10;
      goto LABEL_5;
    }
    return 3758096385;
  }
  v14 = atomic_load((unsigned __int16 *)v6 + 72);
  if (*(unsigned __int16 *)(a2 + 24) != v14)
    return 3758096385;
  os_unfair_lock_lock_with_options();
  v11 = *(id *)&v7[24 * v8 + 16];
  v12 = (os_unfair_lock_s *)(v6 + 140);
LABEL_5:
  os_unfair_lock_unlock(v12);
  if (v11 && v11[3] == *(_QWORD *)(a2 + 8))
    v3 = (*(uint64_t (**)(uint64_t, _QWORD *))(a3 + 16))(a3, v11);

  return v3;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleReadField(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v5[3] = &unk_1EA4D3520;
  v5[4] = a3;
  v5[5] = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleModify(unsigned int ***a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char *v5;
  int v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = 3758097090;
  if (*(unsigned int ****)a2 == a1 && (*(_BYTE *)(a2 + 26) & 2) != 0)
  {
    v5 = (char *)a1 - ***a1;
    v6 = atomic_load((unsigned __int16 *)v5 + 72);
    if (*(unsigned __int16 *)(a2 + 24) == v6)
    {
      os_unfair_lock_lock_with_options();
      v8 = *(_QWORD *)(a2 + 8);
      v9 = (uint64_t)&v5[24 * (v8 % *((_QWORD *)v5 + 13)) + 168];
      v12 = *(_QWORD *)(v9 + 16);
      v10 = v9 + 16;
      v11 = v12;
      v3 = 3758097127;
      if (v12 && *(_QWORD *)(v11 + 24) == v8)
        v3 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a3 + 16))(a3, &v5[24 * (v8 % *((_QWORD *)v5 + 13)) + 168], v10);
      os_unfair_lock_unlock((os_unfair_lock_t)v5 + 35);
    }
    else
    {
      return 3758096385;
    }
  }
  return v3;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleModifyField(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v5[3] = &unk_1EA4D3548;
  v5[4] = a3;
  v5[5] = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleDestroy(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_QWORD *)a2 != a1)
    return 3758097090;
  result = 0;
  *(_BYTE *)(a2 + 26) &= 0xFCu;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *(_WORD *)(a2 + 24) = 0;
  return result;
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleCommit(unsigned int ***a1, uint64_t a2)
{
  char *v2;
  _QWORD v4[5];

  v2 = (char *)a1 - ***a1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ____IOGCFastPathRoyaReplayInputQueueSampleCommit_block_invoke;
  v4[3] = &unk_1EA4D3570;
  v4[4] = v2;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v4);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetPosition(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 8);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetSequenceID(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetSequenceID_block_invoke;
  v5[3] = &__block_descriptor_48_e56_i16__0____IOGCFastPathRoyaReplayInputQueueEntryStorage_8l;
  v5[4] = a3;
  v5[5] = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetSubsampleCount(unsigned int ***a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetSubsampleCount_block_invoke;
  v4[3] = &__block_descriptor_40_e56_i16__0____IOGCFastPathRoyaReplayInputQueueEntryStorage_8l;
  v4[4] = a3;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v4);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetFlags(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetFlags_block_invoke;
  v5[3] = &__block_descriptor_40_e56_i16__0____IOGCFastPathRoyaReplayInputQueueEntryStorage_8l;
  v5[4] = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetFlags(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4)
{
  _QWORD v5[4];
  int v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetFlags_block_invoke;
  v5[3] = &__block_descriptor_36_e76_i24__0____IOGCFastPathRoyaReplayInputQueueEntry__os_unfair_lock_s_I____8__16l;
  v6 = a4;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v5);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD v10[7];
  _QWORD v11[4];
  int v12;
  int v13;
  int v14;
  _QWORD v15[6];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp_block_invoke;
  v11[3] = &__block_descriptor_44_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp_block_invoke_2;
  v10[3] = &__block_descriptor_56_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v10[4] = a7;
  v10[5] = a8;
  v10[6] = a9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v15[3] = &unk_1EA4D3520;
  v15[4] = v11;
  v15[5] = v10;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v15);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  _QWORD v9[6];
  int v10;
  int v11;
  int v12;
  _QWORD v13[4];
  int v14;
  int v15;
  int v16;
  _QWORD v17[6];

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp_block_invoke;
  v13[3] = &__block_descriptor_44_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetTimestamp_block_invoke_2;
  v9[3] = &__block_descriptor_60_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v9[4] = a7;
  v9[5] = a8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v17[3] = &unk_1EA4D3548;
  v17[4] = v13;
  v17[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v17);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetInteger(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  _QWORD v7[5];
  _QWORD v8[4];
  int v9;
  int v10;
  _QWORD v11[6];

  v7[4] = a6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger_block_invoke;
  v8[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v9 = a4;
  v10 = a5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger_block_invoke_2;
  v7[3] = &__block_descriptor_40_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v11[3] = &unk_1EA4D3520;
  v11[4] = v8;
  v11[5] = v7;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v11);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetInteger(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  _QWORD v7[5];
  int v8;
  int v9;
  _QWORD v10[4];
  int v11;
  int v12;
  _QWORD v13[6];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger_block_invoke;
  v10[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v11 = a4;
  v12 = a5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger_block_invoke_2;
  v7[3] = &__block_descriptor_48_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v8 = a4;
  v9 = a5;
  v7[4] = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v13[3] = &unk_1EA4D3548;
  v13[4] = v10;
  v13[5] = v7;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v13);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetDouble(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  _QWORD v7[5];
  _QWORD v8[4];
  int v9;
  int v10;
  _QWORD v11[6];

  v7[4] = a6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble_block_invoke;
  v8[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v9 = a4;
  v10 = a5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble_block_invoke_2;
  v7[3] = &__block_descriptor_40_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v11[3] = &unk_1EA4D3520;
  v11[4] = v8;
  v11[5] = v7;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v11);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetDouble(unsigned int ***a1, uint64_t a2, double a3, uint64_t a4, int a5, int a6)
{
  _QWORD v7[5];
  int v8;
  int v9;
  _QWORD v10[4];
  int v11;
  int v12;
  _QWORD v13[6];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble_block_invoke;
  v10[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v11 = a5;
  v12 = a6;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble_block_invoke_2;
  v7[3] = &__block_descriptor_48_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v8 = a5;
  v9 = a6;
  *(double *)&v7[4] = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v13[3] = &unk_1EA4D3548;
  v13[4] = v10;
  v13[5] = v7;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v13);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetInteger2(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  _QWORD v8[6];
  _QWORD v9[4];
  int v10;
  int v11;
  _QWORD v12[6];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger2_block_invoke;
  v9[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v10 = a4;
  v11 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger2_block_invoke_2;
  v8[3] = &__block_descriptor_48_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v8[4] = a6;
  v8[5] = a7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v12[3] = &unk_1EA4D3520;
  v12[4] = v9;
  v12[5] = v8;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v12);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetInteger2(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  _QWORD v8[6];
  int v9;
  int v10;
  _QWORD v11[4];
  int v12;
  int v13;
  _QWORD v14[6];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger2_block_invoke;
  v11[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v12 = a4;
  v13 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger2_block_invoke_2;
  v8[3] = &__block_descriptor_56_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v9 = a4;
  v10 = a5;
  v8[4] = a6;
  v8[5] = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v14[3] = &unk_1EA4D3548;
  v14[4] = v11;
  v14[5] = v8;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v14);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetDouble2(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  _QWORD v8[6];
  _QWORD v9[4];
  int v10;
  int v11;
  _QWORD v12[6];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble2_block_invoke;
  v9[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v10 = a4;
  v11 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble2_block_invoke_2;
  v8[3] = &__block_descriptor_48_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v8[4] = a6;
  v8[5] = a7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v12[3] = &unk_1EA4D3520;
  v12[4] = v9;
  v12[5] = v8;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v12);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetDouble2(unsigned int ***a1, uint64_t a2, double a3, double a4, uint64_t a5, int a6, int a7)
{
  _QWORD v8[6];
  int v9;
  int v10;
  _QWORD v11[4];
  int v12;
  int v13;
  _QWORD v14[6];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble2_block_invoke;
  v11[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v12 = a6;
  v13 = a7;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble2_block_invoke_2;
  v8[3] = &__block_descriptor_56_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v9 = a6;
  v10 = a7;
  *(double *)&v8[4] = a3;
  *(double *)&v8[5] = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v14[3] = &unk_1EA4D3548;
  v14[4] = v11;
  v14[5] = v8;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v14);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetInteger3(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD v9[7];
  _QWORD v10[4];
  int v11;
  int v12;
  _QWORD v13[6];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger3_block_invoke;
  v10[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v11 = a4;
  v12 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger3_block_invoke_2;
  v9[3] = &__block_descriptor_56_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v9[4] = a6;
  v9[5] = a7;
  v9[6] = a8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v13[3] = &unk_1EA4D3520;
  v13[4] = v10;
  v13[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v13);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetInteger3(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD v9[7];
  int v10;
  int v11;
  _QWORD v12[4];
  int v13;
  int v14;
  _QWORD v15[6];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger3_block_invoke;
  v12[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v13 = a4;
  v14 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger3_block_invoke_2;
  v9[3] = &__block_descriptor_64_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v10 = a4;
  v11 = a5;
  v9[4] = a6;
  v9[5] = a7;
  v9[6] = a8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v15[3] = &unk_1EA4D3548;
  v15[4] = v12;
  v15[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v15);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetDouble3(unsigned int ***a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD v9[7];
  _QWORD v10[4];
  int v11;
  int v12;
  _QWORD v13[6];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble3_block_invoke;
  v10[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v11 = a4;
  v12 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble3_block_invoke_2;
  v9[3] = &__block_descriptor_56_e131_i16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v9[4] = a6;
  v9[5] = a7;
  v9[6] = a8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke;
  v13[3] = &unk_1EA4D3520;
  v13[4] = v10;
  v13[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleRead(a1, a2, (uint64_t)v13);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleSetDouble3(unsigned int ***a1, uint64_t a2, double a3, double a4, double a5, uint64_t a6, int a7, int a8)
{
  _QWORD v9[7];
  int v10;
  int v11;
  _QWORD v12[4];
  int v13;
  int v14;
  _QWORD v15[6];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble3_block_invoke;
  v12[3] = &__block_descriptor_40_e131_B16__0r____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v13 = a7;
  v14 = a8;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____IOGCFastPathRoyaReplayInputQueueSampleSetDouble3_block_invoke_2;
  v9[3] = &__block_descriptor_64_e130_i16__0____IOGCFastPathRoyaReplayInputQueueEntryBufferField_QII______IIQQ____I_1q_____I_2q_____I_3q_____I_1d_____I_2d_____I_3d____8l;
  v10 = a7;
  v11 = a8;
  *(double *)&v9[4] = a3;
  *(double *)&v9[5] = a4;
  *(double *)&v9[6] = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke;
  v15[3] = &unk_1EA4D3548;
  v15[4] = v12;
  v15[5] = v9;
  return __IOGCFastPathRoyaReplayInputQueueSampleModify(a1, a2, (uint64_t)v15);
}

uint64_t __IOGCFastPathRoyaReplayInputQueueSampleGetTraceData(unsigned int ***a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _DWORD *a5, _QWORD *a6)
{
  char *v6;

  v6 = (char *)a1 - ***a1;
  *a3 = *(_QWORD *)(*((_QWORD *)v6 + 2) + 40);
  *a4 = v6;
  *a5 = *((_DWORD *)v6 + 34);
  *a6 = *(_QWORD *)(a2 + 8);
  return 1;
}

_QWORD *IOGCFastPathRoyaReplayInputQueueCreateWithOptions(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  size_t v11;
  objc_class *v12;
  _QWORD *Instance;
  int v14;

  v4 = (void *)objc_msgSend(a3, "copy");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QueueCapacity"));
  if (!v6 || (v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    return 0;
  }
  v8 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("QueueChannel"));
  v9 = objc_msgSend(v7, "unsignedIntValue");
  v10 = v9;
  if (v9 <= 1)
    v11 = 0;
  else
    v11 = 24 * v9 - 24;
  v12 = (objc_class *)objc_opt_class();
  Instance = class_createInstance(v12, v11);
  Instance[2] = a2;
  Instance[3] = Instance + 11;
  Instance[11] = &RoyaReplayInputQueueVtable;
  Instance[12] = &RoyaReplayInputSampleContainerVtable;
  Instance[13] = v10;
  *((_DWORD *)Instance + 28) = 0;
  Instance[15] = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = objc_msgSend(v8, "unsignedIntValue");
  else
    v14 = -1;
  *((_DWORD *)Instance + 34) = v14;
  *((_DWORD *)Instance + 35) = 0;
  return Instance;
}

uint64_t queryInterface(unsigned int ***a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - ***a1, "queryInterface:outInterface:", a2, a3, a4);
}

uint64_t addRef(unsigned int ***a1)
{
  char *v1;
  int v2;

  v1 = (char *)a1 - ***a1;
  v2 = CFGetRetainCount(v1);
  CFRetain(v1);
  return (v2 + 1);
}

uint64_t release(unsigned int ***a1)
{
  char *v1;
  int v2;

  v1 = (char *)a1 - ***a1;
  v2 = CFGetRetainCount(v1);
  CFRelease(v1);
  return (v2 - 1);
}

uint64_t clientProbe()
{
  return 3758097095;
}

uint64_t clientStart()
{
  return 0;
}

uint64_t clientStop()
{
  return 0;
}

uint64_t clientOpen()
{
  return 0;
}

uint64_t clientClose()
{
  return 0;
}

id clientGetProperty(unsigned int ***a1, uint64_t a2)
{
  char *v3;
  id v4;
  id v5;

  v3 = (char *)a1 - ***a1;
  os_unfair_lock_lock_with_options();
  v4 = *((id *)v3 + 9);
  os_unfair_lock_unlock((os_unfair_lock_t)v3 + 16);
  v5 = (id)objc_msgSend(v4, "objectForKey:", a2);

  return v5;
}

uint64_t clientSetProperty()
{
  return 1;
}

uint64_t clientCreateControlQueue()
{
  return 3758097095;
}

uint64_t clientCreateInputQueue()
{
  return 3758097095;
}

id __IOGCFastPathRoyaReplayInputQueueGetProperty(unsigned int ***a1, uint64_t a2)
{
  char *v3;
  id v4;

  v3 = (char *)a1 - ***a1;
  v4 = (id)objc_msgSend(*((id *)v3 + 15), "objectForKey:", a2);
  if (!v4)
  {
    os_unfair_lock_lock_with_options();
    v4 = (id)objc_msgSend(*((id *)v3 + 16), "objectForKey:", a2);
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 28);
  }
  return v4;
}

NSXPCInterface *GCConfigXPCServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_1F03AAEE0, "interfaceWithProtocol:", &unk_1F03A97B0);
}

id GCConfigXPCServiceInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_1F03AAEE0, "interfaceWithProtocol:", &unk_1F03A4EA0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCConfigurationAssetManagementServiceXPCInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_connectToAssetManagementServiceWithClient_reply_, 0, 1);

  _GCGenericDeviceDBServiceXPCInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_connectToGenericDeviceDBServiceWithClient_reply_, 0, 1);

  return v0;
}

uint64_t _gc_log_localizedstring()
{
  if (_gc_log_localizedstring_onceToken != -1)
    dispatch_once(&_gc_log_localizedstring_onceToken, &__block_literal_global_3);
  return _gc_log_localizedstring_Log;
}

os_log_t ___gc_log_localizedstring_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.gamecontroller", "LocalizedString");
  _gc_log_localizedstring_Log = (uint64_t)result;
  return result;
}

void sub_1DC7B68B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7B6EDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7B726C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7B76C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __IOServiceMatchingCallback(const void *a1)
{
  void (**v1)(void);

  v1 = (void (**)(void))_Block_copy(a1);
  v1[2]();

}

void __IOServiceNotificationCallback(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (**v6)(id, uint64_t, uint64_t);

  v6 = (void (**)(id, uint64_t, uint64_t))_Block_copy(a1);
  v6[2](v6, a3, a4);

}

void sub_1DC7B8F94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, const __CFString *a16, uint64_t a17)
{
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  if (a2)
  {
    if (a2 == 2)
    {
      v20 = objc_begin_catch(exception_object);
      if (v17)
      {
        a12 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(*(id *)(v19 + 3480), "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *MEMORY[0x1E0CB2D68];
        a15 = (uint64_t)v21;
        a16 = CFSTR("Model build failed.  This is a #BUG.");
        v23 = *MEMORY[0x1E0CB3388];
        a13 = v22;
        a14 = v23;
        objc_msgSend(v20, "gc_error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        a17 = (uint64_t)v24;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a15, &a12, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v25);
        *v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7B8DE0);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1DC7BBDCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,const __CFString *a27,uint64_t a28)
{
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;

  if (a2)
  {
    if (a2 == 2)
    {
      v30 = objc_begin_catch(exception_object);
      if (a16)
      {
        a23 = *MEMORY[0x1E0CB2D50];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *MEMORY[0x1E0CB2D68];
        a26 = (uint64_t)v31;
        a27 = CFSTR("Model build failed.  This is a #BUG.");
        v33 = *MEMORY[0x1E0CB3388];
        a24 = v32;
        a25 = v33;
        objc_msgSend(v30, "gc_error");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        a28 = (uint64_t)v34;
        objc_msgSend(*(id *)(v29 + 3504), "dictionaryWithObjects:forKeys:count:", &a26, &a23, 3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v35);
        *a16 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7BBDC0);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1DC7BCAF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,const __CFString *a25,uint64_t a26)
{
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;

  if (a2)
  {
    if (a2 == 2)
    {
      v29 = objc_begin_catch(exception_object);
      if (a17)
      {
        a21 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(*(id *)(v27 + 3480), "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *MEMORY[0x1E0CB2D68];
        a24 = (uint64_t)v30;
        a25 = CFSTR("Model build failed.  This is a #BUG.");
        v32 = *MEMORY[0x1E0CB3388];
        a22 = v31;
        a23 = v32;
        objc_msgSend(v29, "gc_error");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        a26 = (uint64_t)v33;
        objc_msgSend(*(id *)(v28 + 3504), "dictionaryWithObjects:forKeys:count:", &a24, &a21, 3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v34);
        *a17 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7BCAE8);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1DC7BDED8()
{
  objc_end_catch();
  JUMPOUT(0x1DC7BDEE8);
}

uint64_t _IOObjectCFRetain(int a1, uint64_t object)
{
  if (IOObjectRetain(object))
    return 0;
  else
    return object;
}

uint64_t _IOObjectCFRelease(int a1, io_object_t object)
{
  return IOObjectRelease(object);
}

id _gc_log_iokit()
{
  if (_gc_log_iokit_onceToken != -1)
    dispatch_once(&_gc_log_iokit_onceToken, &__block_literal_global_4);
  return (id)_gc_log_iokit_Log;
}

void ___gc_log_iokit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller", "IOKit");
  v1 = (void *)_gc_log_iokit_Log;
  _gc_log_iokit_Log = (uint64_t)v0;

}

uint64_t IOGCDeviceManagerGetTypeID()
{
  return objc_opt_self();
}

__IOGCDeviceManager *IOGCDeviceManagerCreate(__CFAllocator *a1)
{
  __CFAllocator *v1;
  __IOGCDeviceManager *result;

  if (a1)
    v1 = a1;
  else
    v1 = (__CFAllocator *)*MEMORY[0x1E0C9AE00];
  result = [__IOGCDeviceManager alloc];
  result->_allocator = v1;
  return result;
}

void IOGCDeviceManagerSetDispatchQueue(uint64_t a1, dispatch_queue_t queue)
{
  const char *label;
  const char *v6;
  dispatch_queue_t v7;
  void *v8;
  char __str[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (atomic_load((unsigned __int8 *)(a1 + 16)))
    IOGCDeviceManagerSetDispatchQueue_cold_1();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)__str = 0u;
  v10 = 0u;
  label = dispatch_queue_get_label(queue);
  v6 = "";
  if (label)
    v6 = label;
  snprintf(__str, 0x100uLL, "%s.IOGCDeviceManager", v6);
  v7 = dispatch_queue_create_with_target_V2(__str, 0, queue);
  v8 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v7;

}

void IOGCDeviceManagerSetCancelHandler(uint64_t a1, void *aBlock)
{
  void *v3;
  void *v4;

  v3 = _Block_copy(aBlock);
  v4 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v3;

}

uint64_t IOGCDeviceManagerActivate(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  v1 = result;
  v2 = (unsigned __int8 *)(result + 16);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 | 1, v2));
  if ((v3 & 1) == 0)
  {
    if (!*(_QWORD *)(result + 40))
      IOGCDeviceManagerActivate_cold_1();
    *(_QWORD *)(result + 56) = objc_alloc_init(GCIONotificationPort);
    __IOGCDeviceManagerStartMatching(v1);
    v4 = *(void **)(v1 + 56);
    v5 = *(_QWORD *)(v1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __IOGCDeviceManagerActivate_block_invoke;
    v6[3] = &unk_1EA4D3878;
    v6[4] = v1;
    return objc_msgSend(v4, "setQueue:cancellationHandler:", v5, v6);
  }
  return result;
}

void __IOGCDeviceManagerStartMatching(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  IONotificationPort *v4;
  const __CFDictionary *v5;
  kern_return_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  io_iterator_t notification;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    v3 = *(const void **)(a1 + 24);
    if (v3)
    {
      if (*(_DWORD *)(a1 + 64))
      {
        IOObjectRelease(*(_DWORD *)(a1 + 64));
        *(_DWORD *)(a1 + 64) = 0;
        v2 = *(_QWORD *)(a1 + 56);
      }
      notification = 0;
      v4 = (IONotificationPort *)-[GCIONotificationPort port](v2);
      v5 = (const __CFDictionary *)CFRetain(v3);
      v6 = IOServiceAddMatchingNotification(v4, "IOServiceFirstMatch", v5, (IOServiceMatchingCallback)__IOGCDeviceManagerDevicesAdded, (void *)a1, &notification);
      if (v6)
      {
        v7 = v6;
        v8 = _gc_log_iokit();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __IOGCDeviceManagerStartMatching_cold_1(a1, v7, v8);
      }
      v9 = notification;
      *(_DWORD *)(a1 + 64) = notification;
      __IOGCDeviceManagerHandleDevices(a1, v9, 1, 1);
    }
  }
}

void IOGCDeviceManagerCancel(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  io_object_t v4;

  v2 = (unsigned __int8 *)(a1 + 16);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 | 3, v2));
  if ((v3 & 2) == 0)
  {
    v4 = *(_DWORD *)(a1 + 64);
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)(a1 + 64) = 0;
    }

    *(_QWORD *)(a1 + 56) = 0;
  }
}

void IOGCDeviceManagerSetDeviceMatching(uint64_t a1, uint64_t a2)
{
  CFMutableDictionaryRef v4;
  CFMutableDictionaryRef v5;
  const void *v6;

  v4 = IOServiceMatching("IOHIDGCDevice");
  v5 = v4;
  if (a2)
    -[__CFDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", a2);
  v6 = *(const void **)(a1 + 24);
  if (v6)
    CFRelease(v6);
  *(_QWORD *)(a1 + 24) = v5;
  __IOGCDeviceManagerStartMatching(a1);
}

CFSetRef IOGCDeviceManagerCopyDevices(uint64_t a1)
{
  CFSetRef result;
  mach_port_t v3;
  const __CFDictionary *v4;
  const __CFSet *v5;
  io_iterator_t existing;

  if (!*(_QWORD *)(a1 + 56))
  {
    result = *(CFSetRef *)(a1 + 24);
    if (!result)
      return result;
    existing = 0;
    v3 = *MEMORY[0x1E0CBBAA8];
    v4 = (const __CFDictionary *)CFRetain(result);
    if (IOServiceGetMatchingServices(v3, v4, &existing))
      return 0;
    __IOGCDeviceManagerHandleDevices(a1, existing, 1, 0);
    IOObjectRelease(existing);
  }
  v5 = *(const __CFSet **)(a1 + 32);
  if (v5)
    return CFSetCreateCopy(*(CFAllocatorRef *)(a1 + 8), v5);
  return 0;
}

void __IOGCDeviceManagerHandleDevices(uint64_t a1, uint64_t a2, int a3, int a4)
{
  const CFSetCallBacks *v7;
  const __CFSet *Mutable;
  __CFSet *v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  __IOGCDevice *v15;
  NSObject *v16;
  int *v17;
  uint64_t v18;
  int v19;
  const __CFAllocator *v20;
  CFIndex Count;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  const void *v28;
  __CFDictionary *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  _QWORD block[8];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[7];
  uint64_t entryID;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  _OWORD *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  int v49;
  _OWORD v50[8];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = (const CFSetCallBacks *)MEMORY[0x1E0C9B3B0];
  Mutable = CFSetCreateMutable(*(CFAllocatorRef *)(a1 + 8), 0, MEMORY[0x1E0C9B3B0]);
  v9 = CFSetCreateMutable(*(CFAllocatorRef *)(a1 + 8), 0, v7);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    if (!(_DWORD)a2)
      goto LABEL_12;
  }
  else
  {
    v20 = *(const __CFAllocator **)(a1 + 8);
    Count = CFSetGetCount(Mutable);
    *(_QWORD *)(a1 + 32) = CFSetCreateMutable(v20, Count, MEMORY[0x1E0C9B3B0]);
    if (!(_DWORD)a2)
      goto LABEL_12;
  }
  *(_QWORD *)&v10 = 138413058;
  v32 = v10;
  v12 = &dword_1DC79E000;
  while (1)
  {
    while (1)
    {
      v13 = IOIteratorNext(a2);
      if (!(_DWORD)v13)
        break;
      v14 = v13;
      v15 = -[__IOGCDevice initWithPort:error:]([__IOGCDevice alloc], "initWithPort:error:", v13, 0);
      IOObjectRelease(v14);
      if (v15)
      {
        CFSetAddValue(Mutable, v15);

      }
      else
      {
        entryID = 0;
        memset(v50, 0, sizeof(v50));
        IORegistryEntryGetRegistryEntryID(v14, &entryID);
        MEMORY[0x1DF0CDC70](v14, v50);
        v16 = _gc_log_iokit();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v12;
          v18 = entryID;
          v19 = objc_msgSend(0, "code");
          *(_DWORD *)buf = v32;
          v43 = a1;
          v44 = 2080;
          v45 = v50;
          v46 = 2048;
          v47 = v18;
          v12 = v17;
          v48 = 1024;
          v49 = v19;
          _os_log_impl(v17, v16, OS_LOG_TYPE_DEFAULT, "%@ #ERROR Failed to create IOGCDevice for service <%s %#llx>: %{mach.errno}d.", buf, 0x26u);
        }
      }
    }
    if (IOIteratorIsValid(a2))
      break;
    MEMORY[0x1DF0CDBD4](a2);
  }
LABEL_12:
  v22 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = ____IOGCDeviceManagerHandleDevices_block_invoke;
  v39[3] = &unk_1EA4D38A0;
  v39[4] = a1;
  v39[5] = a1;
  v39[6] = v9;
  -[__CFSet filterUsingPredicate:](Mutable, "filterUsingPredicate:", +[NSPredicate predicateWithBlock:](&off_1F03AA788, "predicateWithBlock:", v39, v32));
  if (a3)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = *(void **)(a1 + 32);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          v28 = *(const void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (!CFSetContainsValue(Mutable, v28))
          {
            v29 = *(__CFDictionary **)(a1 + 72);
            if (v29)
              CFDictionaryRemoveValue(v29, v28);
          }
          CFSetAddValue(v9, v28);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v25);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "minusSet:", v9);
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", Mutable);
  if (a4)
  {
    v30 = *(_QWORD *)(a1 + 80);
    if (v30)
    {
      v31 = *(_QWORD *)(a1 + 88);
      CFRetain(Mutable);
      CFRetain(v9);
      block[0] = v22;
      block[1] = 3221225472;
      block[2] = ____IOGCDeviceManagerHandleDevices_block_invoke_2;
      block[3] = &__block_descriptor_64_e5_v8__0l;
      block[4] = v9;
      block[5] = v30;
      block[6] = v31;
      block[7] = Mutable;
      if (v11)
        ____IOGCDeviceManagerHandleDevices_block_invoke_2((uint64_t)block);
      else
        dispatch_async(*(dispatch_queue_t *)(a1 + 40), block);
    }
  }
  CFRelease(v9);
  CFRelease(Mutable);
}

uint64_t IOGCDeviceManagerSetDeviceMatchingCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (atomic_load((unsigned __int8 *)(result + 16)))
    IOGCDeviceManagerSetDeviceMatchingCallback_cold_1();
  *(_QWORD *)(result + 80) = a2;
  *(_QWORD *)(result + 88) = a3;
  return result;
}

void __IOGCDeviceManagerDevicesAdded(uint64_t a1, uint64_t a2)
{
  __IOGCDeviceManagerHandleDevices(a1, a2, 0, 1);
}

void __IOGCDeviceManagerStopObservingDevice(uint64_t a1, CFTypeRef cf, int a3)
{
  __CFDictionary *v6;
  void (*v7)(_QWORD, CFTypeRef, _QWORD);

  v6 = *(__CFDictionary **)(a1 + 72);
  if (v6)
    CFDictionaryRemoveValue(v6, cf);
  if (a3)
  {
    CFRetain(cf);
    CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 32), cf);
    v7 = *(void (**)(_QWORD, CFTypeRef, _QWORD))(a1 + 80);
    if (v7)
      v7(*(_QWORD *)(a1 + 88), cf, 0);
    CFRelease(cf);
  }
}

__IOGCFastPathSimpleReader *IOGCFastPathSimpleReaderCreate(__CFAllocator *a1, void *a2)
{
  __IOGCFastPathSimpleReader *v4;

  v4 = [__IOGCFastPathSimpleReader alloc];
  v4->super.allocator = a1;
  v4->super.queue = (__IOGCFastPathInputQueue *)a2;
  v4->super.readerInterface = (IOGCFastPathReaderInterface **)&v4->_IOGCFastPathReaderVTBL;
  v4->_IOGCFastPathReaderVTBL = (const IOGCFastPathReaderInterface *)&__IOGCFastPathSimpleReaderVtable;
  return v4;
}

uint64_t __IOGCFastPathSimpleReader_QueryInterface(unsigned int ***a1, CFUUIDBytes a2, _QWORD *a3)
{
  uint64_t v5;
  CFUUIDRef v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  uint64_t v9;

  v5 = ***a1;
  v6 = CFUUIDCreateFromUUIDBytes(0, a2);
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x6Bu, 0x29u, 0x76u, 0xBCu, 0xFu, 0xD5u, 0x4Bu, 0x35u, 0xAAu, 0x8Cu, 7u, 0x9Du, 0x84u, 0xBEu, 0xAu, 0x4Bu), CFEqual(v6, v8)))
  {
    *a3 = (char *)a1 - v5 + 32;
    CFRetain((char *)a1 - v5);
    v9 = 0;
  }
  else
  {
    v9 = 2147483652;
  }
  CFRelease(v6);
  return v9;
}

uint64_t __IOGCFastPathSimpleReader_AddRef(unsigned int ***a1)
{
  char *v1;
  int v2;

  v1 = (char *)a1 - ***a1;
  v2 = CFGetRetainCount(v1);
  CFRetain(v1);
  return (v2 + 1);
}

uint64_t __IOGCFastPathSimpleReader_Release(unsigned int ***a1)
{
  char *v1;
  int v2;

  v1 = (char *)a1 - ***a1;
  v2 = CFGetRetainCount(v1);
  CFRelease(v1);
  return (v2 - 1);
}

uint64_t __IOGCFastPathSimpleReader_Reset(unsigned int ***a1)
{
  return IOGCFastPathInputQueueGetLatestSamplePosition(*(uint64_t *)((char *)a1 - ***a1 + 16));
}

uint64_t __IOGCFastPathSimpleReader_GetReadPosition(unsigned int ***a1, _QWORD *a2)
{
  *a2 = *(unsigned int ***)((char *)a1 - ***a1 + 40);
  return 0;
}

uint64_t __IOGCFastPathSimpleReader_ReadCurrentSample(unsigned int ***a1, uint64_t a2)
{
  char *v2;

  v2 = (char *)a1 - ***a1;
  return IOGCFastPathInputQueueGetSample(*((_QWORD *)v2 + 2), *((_QWORD *)v2 + 5), a2);
}

uint64_t __IOGCFastPathSimpleReader_ReadNextSample(unsigned int ***a1, _OWORD *a2)
{
  char *v3;
  _OWORD *v4;
  uint64_t Sample;
  uint64_t v6;
  _OWORD v8[2];

  v3 = (char *)a1 - ***a1;
  memset(v8, 0, sizeof(v8));
  if (a2)
    v4 = a2;
  else
    v4 = v8;
  Sample = IOGCFastPathInputQueueGetSample(*((_QWORD *)v3 + 2), *((_QWORD *)v3 + 5) + 1, (uint64_t)v4);
  v6 = Sample;
  if ((_DWORD)Sample == -536870169)
  {
LABEL_8:
    ++*((_QWORD *)v3 + 5);
    return v6;
  }
  if (!(_DWORD)Sample)
  {
    if (!a2)
      IOGCFastPathSampleDestory((uint64_t *)v8);
    goto LABEL_8;
  }
  return v6;
}

uint64_t __IOGCFastPathSimpleReader_ReadPreviousSample(unsigned int ***a1, _OWORD *a2)
{
  char *v2;
  uint64_t v3;
  _OWORD *v5;
  uint64_t Sample;
  uint64_t v7;
  _OWORD v9[2];

  v2 = (char *)a1 - ***a1;
  v3 = *((_QWORD *)v2 + 5);
  if (!v3)
    return 3758097127;
  memset(v9, 0, sizeof(v9));
  if (a2)
    v5 = a2;
  else
    v5 = v9;
  Sample = IOGCFastPathInputQueueGetSample(*((_QWORD *)v2 + 2), v3 - 1, (uint64_t)v5);
  v7 = Sample;
  if ((_DWORD)Sample == -536870169)
    goto LABEL_9;
  if (!(_DWORD)Sample)
  {
    if (!a2)
      IOGCFastPathSampleDestory((uint64_t *)v9);
LABEL_9:
    --*((_QWORD *)v2 + 5);
  }
  return v7;
}

uint64_t GCPrepareIOCFPlugInVtbl(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = (void *)objc_opt_class();
  objc_getAssociatedObject(v3, &unk_1F03A9810);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA0D8), "initWithLength:", 64);
    objc_setAssociatedObject(v3, &unk_1F03A9810, v4, (void *)0x301);
  }
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "mutableBytes");

  if (!*(_QWORD *)v6)
  {
    *(_QWORD *)v6 = a2;
    *(_QWORD *)(v6 + 8) = queryInterface_0;
    *(_QWORD *)(v6 + 16) = addRef_0;
    *(_QWORD *)(v6 + 24) = release_0;
    *(_DWORD *)(v6 + 32) = 1;
    *(_QWORD *)(v6 + 40) = probe;
    *(_QWORD *)(v6 + 48) = start;
    *(_QWORD *)(v6 + 56) = stop;
  }
  return v6;
}

uint64_t probe(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - **a1, "probe:service:outScore:", a2, a3, a4);
}

uint64_t start(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((char *)a1 - **a1, "start:service:", a2, a3);
}

uint64_t stop(_QWORD **a1)
{
  return objc_msgSend((char *)a1 - **a1, "stop");
}

uint64_t IOGCCircularControlQueueMemorySize(unsigned int a1, int a2)
{
  uint64_t result;
  unsigned int v4;
  uint64_t v5;

  result = 0;
  if (a2)
  {
    v4 = ((2 * a1 + 14) & 0xFFFFFFF0) + 64;
    if (v4 >= a1)
    {
      v5 = 2 * a2 * v4;
      if (v5 > 0xFFFFFFB7)
        return 0;
      else
        return v5 + 72;
    }
  }
  return result;
}

uint64_t IOGCCircularControlQueueMemoryInit(unint64_t *a1, uint64_t a2, unsigned int a3, int a4, unint64_t a5)
{
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t *v14;

  bzero(a1, a3);
  *(_QWORD *)a2 = a5;
  *a1 = a5;
  *(_DWORD *)(a2 + 8) = a3;
  *(_DWORD *)(a2 + 12) = a4;
  *((_DWORD *)a1 + 2) = a3;
  *((_DWORD *)a1 + 3) = a4;
  atomic_store(0, a1 + 2);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 3);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 4);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 5);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 6);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 7);
  v10 = ((2 * a4 + 14) & 0xFFFFFFF0) + 64;
  v11 = a3 - 72;
  atomic_store(0xFFFFFFFFFFFFFFFFLL, a1 + 8);
  if (v10 <= a3 - 72)
  {
    v12 = 0;
    LODWORD(v13) = v11 / v10;
    if (v11 / v10 <= 1)
      v13 = 1;
    else
      v13 = v13;
    do
    {
      v14 = (unint64_t *)((char *)a1 + v12 + 72);
      *v14 = a5;
      v14[2] = 0;
      v14[3] = -1;
      v14[4] = -1;
      v14[5] = 0;
      v12 += v10;
      v14[6] = -1;
      v14[7] = -1;
      --v13;
    }
    while (v13);
  }
  return 0;
}

uint64_t IOGCCircularControlQueueInit(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result;

  result = 3758097105;
  if (*(_QWORD *)a2 == a5 && *(_DWORD *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 12) == a4)
  {
    result = 0;
    *(_QWORD *)a1 = a2;
    *(_QWORD *)(a1 + 8) = a5;
    *(_DWORD *)(a1 + 16) = a3;
    *(_DWORD *)(a1 + 20) = a4;
  }
  return result;
}

uint64_t IOGCCircularControlQueueReset(_QWORD *a1, unint64_t a2)
{
  _QWORD *v2;
  uint64_t result;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;

  v2 = (_QWORD *)*a1;
  if (*(_QWORD *)*a1 != a1[1])
    return 3758097105;
  result = 0;
  v4 = v2 + 2;
  v5 = atomic_load(v2 + 2);
  v6 = &v2[3 * (++v5 & 1)];
  atomic_store(0xFFFFFFFFFFFFFFFFLL, v6 + 3);
  atomic_store(a2, v6 + 4);
  atomic_store(0xFFFFFFFFFFFFFFFFLL, v6 + 5);
  atomic_store(v5, v4);
  return result;
}

uint64_t IOGCCircularControlQueueGetNextApplyPosition(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t result;
  char v4;

  v2 = (_QWORD *)*a1;
  if (*(_QWORD *)*a1 != a1[1])
    return 3758097105;
  result = 0;
  v4 = atomic_load(v2 + 2);
  *a2 = v2[3 * (v4 & 1) + 4];
  return result;
}

uint64_t IOGCCircularControlQueueGetLastAppliedPosition(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t result;
  char v4;

  v2 = (_QWORD *)*a1;
  if (*(_QWORD *)*a1 != a1[1])
    return 3758097105;
  result = 0;
  v4 = atomic_load(v2 + 2);
  *a2 = v2[3 * (v4 & 1) + 3];
  return result;
}

uint64_t IOGCCircularControlQueueReadBackwardsFromLatestEnqueued(uint64_t **a1, char a2, uint64_t a3)
{
  uint64_t result;
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  int v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, unint64_t, uint64_t);
  void *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v30;

  result = 3758097105;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 0x40000000;
  v14 = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke;
  v15 = &unk_1EA4D39F8;
  v16 = a3;
  v17 = a2;
  v5 = *a1;
  v6 = (uint64_t *)**a1;
  if (v6 == a1[1])
  {
    v7 = *((_DWORD *)v5 + 2);
    if (v7 == *((_DWORD *)a1 + 4))
    {
      v8 = *((_DWORD *)v5 + 3);
      if (v8 == *((_DWORD *)a1 + 5))
      {
        v9 = atomic_load((unint64_t *)v5 + 2);
        v10 = (unint64_t *)&v5[3 * (v9 & 1)];
        atomic_load(v10 + 3);
        v11 = atomic_load(v10 + 4);
        atomic_load(v10 + 5);
        v12 = atomic_load((unint64_t *)v5 + 2);
        if (v9 == v12)
        {
          v18 = MEMORY[0x1E0C809B0];
          v19 = 0x40000000;
          v20 = ___IOGCCircularControlQueueValidateAndAccess_block_invoke;
          v21 = &__block_descriptor_tmp_8;
          v26 = (v7 - 72) / (2 * ((v8 + 7) & 0xFFFFFFF8) + 64);
          v27 = 2 * ((v8 + 7) & 0xFFFFFFF8) + 64;
          v22 = v5;
          v23 = v11;
          v24 = v6;
          v25 = v9;
          v28 = v7;
          v29 = (v8 + 7) & 0xFFFFFFF8;
          v30 = v8;
          return ((uint64_t (*)(_QWORD *))v14)(v13);
        }
        else
        {
          return 3758097109;
        }
      }
    }
  }
  return result;
}

uint64_t IOGCCircularControlQueueReadForwardFromNextApply(uint64_t **a1, char a2, uint64_t a3)
{
  uint64_t result;
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  int v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, unint64_t, uint64_t);
  void *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v30;

  result = 3758097105;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 0x40000000;
  v14 = __IOGCCircularControlQueueReadForwardFromNextApply_block_invoke;
  v15 = &unk_1EA4D3A70;
  v16 = a3;
  v17 = a2;
  v5 = *a1;
  v6 = (uint64_t *)**a1;
  if (v6 == a1[1])
  {
    v7 = *((_DWORD *)v5 + 2);
    if (v7 == *((_DWORD *)a1 + 4))
    {
      v8 = *((_DWORD *)v5 + 3);
      if (v8 == *((_DWORD *)a1 + 5))
      {
        v9 = atomic_load((unint64_t *)v5 + 2);
        v10 = (unint64_t *)&v5[3 * (v9 & 1)];
        atomic_load(v10 + 3);
        v11 = atomic_load(v10 + 4);
        atomic_load(v10 + 5);
        v12 = atomic_load((unint64_t *)v5 + 2);
        if (v9 == v12)
        {
          v18 = MEMORY[0x1E0C809B0];
          v19 = 0x40000000;
          v20 = ___IOGCCircularControlQueueValidateAndAccess_block_invoke;
          v21 = &__block_descriptor_tmp_8;
          v26 = (v7 - 72) / (2 * ((v8 + 7) & 0xFFFFFFF8) + 64);
          v27 = 2 * ((v8 + 7) & 0xFFFFFFF8) + 64;
          v22 = v5;
          v23 = v11;
          v24 = v6;
          v25 = v9;
          v28 = v7;
          v29 = (v8 + 7) & 0xFFFFFFF8;
          v30 = v8;
          return ((uint64_t (*)(_QWORD *))v14)(v13);
        }
        else
        {
          return 3758097109;
        }
      }
    }
  }
  return result;
}

uint64_t IOGCCircularControlQueueReadNext(uint64_t **a1, uint64_t a2)
{
  uint64_t result;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t **v12;
  char v13;
  unsigned int v14;

  result = 3758097105;
  v4 = *a1;
  v5 = (uint64_t *)**a1;
  if (v5 == a1[1])
  {
    v6 = *((unsigned int *)v4 + 2);
    if ((_DWORD)v6 == *((_DWORD *)a1 + 4))
    {
      v7 = *((_DWORD *)v4 + 3);
      if (v7 == *((_DWORD *)a1 + 5))
      {
        v8 = atomic_load((unint64_t *)v4 + 2);
        v9 = &v4[3 * (v8 & 1)];
        v10 = atomic_load((unint64_t *)v9 + 4);
        if (v10 == -1)
        {
          return 3758097112;
        }
        else
        {
          v11 = ((2 * v7 + 14) & 0xFFFFFFF0) + 64;
          v12 = (uint64_t **)((char *)v4
                           + v11 * (v10 % (((int)v6 - 72) / v11))
                           + 72);
          if ((char *)v12 + v11 <= (char *)v4 + v6 && *v12 == v5)
          {
            v13 = atomic_load((unint64_t *)((char *)v4
                                                 + v11
                                                 * (v10 % (((int)v6 - 72) / v11))
                                                 + 80));
            v14 = v13 & 1;
            result = 3758097112;
            if (v12[3 * v14 + 3] == (uint64_t *)v8 && v12[3 * v14 + 4] == (uint64_t *)v10)
            {
              result = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(a2 + 16))(a2, v10, (unint64_t)v12 + v14 * (unint64_t)((v7 + 7) & 0xFFFFFFF8) + 64);
              if ((_DWORD)result)
              {
                result = 0;
                v9[3] = v10;
                atomic_store(v10 + 1, (unint64_t *)v9 + 4);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t IOGCCircularControlQueueEntryModify(uint64_t **a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t **v14;
  unint64_t v15;
  uint64_t **v16;

  result = 3758097105;
  v5 = *a1;
  v6 = (uint64_t *)**a1;
  if (v6 == a1[1])
  {
    v7 = *((unsigned int *)v5 + 2);
    if ((_DWORD)v7 == *((_DWORD *)a1 + 4))
    {
      v8 = *((unsigned int *)v5 + 3);
      if ((_DWORD)v8 == *((_DWORD *)a1 + 5))
      {
        v9 = atomic_load((unint64_t *)v5 + 2);
        v10 = atomic_load((unint64_t *)&v5[3 * (v9 & 1) + 4]);
        if (v10 == -1)
        {
          return 3758097112;
        }
        else
        {
          v11 = (v8 + 7) & 0xFFFFFFF8;
          v12 = (((int)v7 - 72) / (2 * v11 + 64)) >> 1;
          if (v10 + v12 <= (unint64_t)a2)
          {
            return 3758097128;
          }
          else if ((unint64_t)a2 + v12 <= v10)
          {
            return 3758097127;
          }
          else
          {
            v13 = ((2 * (_DWORD)v8 + 14) & 0xFFFFFFF0) + 64;
            v14 = (uint64_t **)((char *)v5
                             + v13
                             * ((unint64_t)a2 % (((int)v7 - 72) / v13))
                             + 72);
            if ((char *)v14 + v13 <= (char *)v5 + v7 && *v14 == v6)
            {
              v15 = atomic_load((unint64_t *)((char *)v5
                                                   + v13
                                                   * ((unint64_t)a2
                                                                  % (((int)v7 - 72) / v13))
                                                   + 80));
              v16 = &v14[3 * ((v15 & 1) == 0)];
              v16[2] = (uint64_t *)v15;
              v16[3] = (uint64_t *)v9;
              v16[4] = a2;
              (*(void (**)(uint64_t, unint64_t, uint64_t))(a3 + 16))(a3, (unint64_t)v14 + ((v15 & 1) == 0) * (unint64_t)v11 + 64, v8);
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t IOGCCircularControlQueueEntryCommitModifications(uint64_t **a1, unint64_t a2)
{
  uint64_t result;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;

  result = 3758097105;
  v4 = *a1;
  v5 = (uint64_t *)**a1;
  if (v5 != a1[1])
    return result;
  v6 = *((unsigned int *)v4 + 2);
  if ((_DWORD)v6 != *((_DWORD *)a1 + 4))
    return result;
  v7 = *((_DWORD *)v4 + 3);
  if (v7 != *((_DWORD *)a1 + 5))
    return result;
  v8 = atomic_load((unint64_t *)v4 + 2);
  v9 = &v4[3 * (v8 & 1)];
  v10 = atomic_load((unint64_t *)v9 + 4);
  v11 = (unint64_t *)(v9 + 5);
  v12 = atomic_load(v11);
  if (v10 == -1)
    return 3758097112;
  v13 = ((2 * v7 + 14) & 0xFFFFFFF0) + 64;
  v14 = ((int)v6 - 72) / v13;
  v15 = v14 >> 1;
  if (v10 + v15 <= a2)
    return 3758097128;
  if (v15 + a2 <= v10)
    return 3758097127;
  v16 = (uint64_t *)((char *)v4 + v13 * (a2 % v14) + 72);
  if ((char *)v16 + v13 <= (char *)v4 + v6 && (uint64_t *)*v16 == v5)
  {
    v17 = atomic_load(v16 + 1);
    v18 = v17 + 1;
    if (v16[3 * (v18 & 1) + 3] != v8)
      return 3758097131;
    if (v16[3 * (v18 & 1) + 4] == a2)
    {
      atomic_store(v18, v16 + 1);
      if (v12 != -1 && v12 >= a2)
        return 0;
      result = 0;
      atomic_store(a2, v11);
      return result;
    }
    return 3758097112;
  }
  return result;
}

uint64_t IOGCCircularControlQueueEntryResetModifications(uint64_t **a1, unint64_t a2)
{
  uint64_t result;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  size_t v7;
  char v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t **v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;

  result = 3758097105;
  v4 = *a1;
  v5 = (uint64_t *)**a1;
  if (v5 == a1[1])
  {
    v6 = *((unsigned int *)v4 + 2);
    if ((_DWORD)v6 == *((_DWORD *)a1 + 4))
    {
      v7 = *((unsigned int *)v4 + 3);
      if ((_DWORD)v7 == *((_DWORD *)a1 + 5))
      {
        v8 = atomic_load((unint64_t *)v4 + 2);
        v9 = atomic_load((unint64_t *)&v4[3 * (v8 & 1) + 4]);
        if (v9 == -1)
        {
          return 3758097112;
        }
        else
        {
          v10 = (v7 + 7) & 0xFFFFFFF8;
          v12 = (((int)v6 - 72) / (2 * v10 + 64)) >> 1;
          if (v9 + v12 <= a2)
          {
            return 3758097128;
          }
          else if (v12 + a2 <= v9)
          {
            return 3758097127;
          }
          else
          {
            v13 = ((2 * (_DWORD)v7 + 14) & 0xFFFFFFF0) + 64;
            v11 = v6 - 72;
            v14 = (uint64_t **)((char *)v4
                             + v13 * (a2 % (((int)v6 - 72) / v13))
                             + 72);
            if ((char *)v14 + v13 <= (char *)v4 + v6 && *v14 == v5)
            {
              v15 = atomic_load((unint64_t *)((char *)v4
                                                   + v13 * (a2 % (v11 / v13))
                                                   + 80));
              v16 = v15 & 1;
              v17 = (uint64_t)&v4[3 * v16 + 11] + v13 * (a2 % (v11 / v13));
              v18 = (uint64_t)&v4[3 * (v16 ^ 1) + 11]
                  + v13 * (a2 % (v11 / v13));
              memcpy((char *)v14 + (v16 ^ 1) * (unint64_t)v10 + 64, (char *)v14 + v16 * (unint64_t)v10 + 64, v7);
              result = 0;
              *(_OWORD *)v18 = *(_OWORD *)v17;
              *(_QWORD *)(v18 + 16) = *(_QWORD *)(v17 + 16);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t queryInterface_0(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((char *)a1 - **a1, "queryInterface:outInterface:", a2, a3, a4);
}

uint64_t addRef_0(_QWORD **a1)
{
  char *v1;
  int v2;

  v1 = (char *)a1 - **a1;
  v2 = CFGetRetainCount(v1);
  CFRetain(v1);

  return (v2 + 1);
}

uint64_t release_0(_QWORD **a1)
{
  char *v1;
  int v2;

  v1 = (char *)a1 - **a1;
  v2 = CFGetRetainCount(v1);
  CFRelease(v1);

  return (v2 - 1);
}

_QWORD *GCPrepareIUnknownVtbl(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD *v6;

  v3 = (void *)objc_opt_class();
  objc_getAssociatedObject(v3, &unk_1F03A1D28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA0D8), "initWithLength:", 32);
    objc_setAssociatedObject(v3, &unk_1F03A1D28, v4, (void *)0x301);
  }
  v5 = objc_retainAutorelease(v4);
  v6 = (_QWORD *)objc_msgSend(v5, "mutableBytes");

  if (!*v6)
  {
    *v6 = a2;
    v6[1] = queryInterface_0;
    v6[2] = addRef_0;
    v6[3] = release_0;
  }
  return v6;
}

id GCConfigurationAssetManagementServiceXPCInterface()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  +[NSXPCInterface interfaceWithProtocol:](&off_1F03AAEE0, "interfaceWithProtocol:", &unk_1F03A3A28);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_assetsWithReply_, 0, 1);

  v3 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_currentAsset_withReply_, 0, 1);

  return v0;
}

void sub_1DC7C13DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DC7C1520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1DC7C1B8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1DC7C1C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1DC7C22B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1DC7C2664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id OUTLINED_FUNCTION_3_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1DC7C5100()
{
  objc_end_catch();
  JUMPOUT(0x1DC7C511CLL);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1DC7C6BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

NSXPCInterface *_GCGenericDeviceDBServiceXPCInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_1F03AAEE0, "interfaceWithProtocol:", &unk_1F03A61E8);
}

void sub_1DC7C7744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1DC7C7850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id GCHIDDeviceAttributesPredicateFromMatchingDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", "NSPredicate * _Nullable GCHIDDeviceAttributesPredicateFromMatchingDictionary(NSDictionary *__strong _Nonnull, NSString *__autoreleasing * _Nullable)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("GCHIDProtocols.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[matching isKindOfClass:NSDictionary.class]"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  v4 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __GCHIDDeviceAttributesPredicateFromMatchingDictionary_block_invoke;
  v11[3] = &unk_1EA4D3E78;
  v13 = &v14;
  v5 = v4;
  v12 = v5;
  objc_msgSend(v3, "gc_enumerateKeysAndObjectsUsingBlock:", v11);
  v6 = objc_msgSend(v5, "count");
  if (v6 == objc_msgSend(v3, "count"))
  {
    unk_1F03AB60C(&off_1F03AB7B8, "andPredicateWithSubpredicates:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    if (a2)
      *a2 = objc_retainAutorelease((id)v15[5]);
  }

  _Block_object_dispose(&v14, 8);
  return v7;
}

void sub_1DC7C7F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

id GCHIDDeviceAttributeKeys()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)GCHIDDeviceAttributeKeys_AllowedKeys;
  if (!GCHIDDeviceAttributeKeys_AllowedKeys)
  {
    v1 = objc_msgSend(objc_alloc((Class)&off_1F03A7348), "initWithArray:", &unk_1EA4F1918);
    v2 = (void *)GCHIDDeviceAttributeKeys_AllowedKeys;
    GCHIDDeviceAttributeKeys_AllowedKeys = v1;

    v0 = (void *)GCHIDDeviceAttributeKeys_AllowedKeys;
  }
  return v0;
}

id GCHIDElementAttributeKeys()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)GCHIDElementAttributeKeys_AllowedKeys;
  if (!GCHIDElementAttributeKeys_AllowedKeys)
  {
    v1 = objc_msgSend(objc_alloc((Class)&off_1F03A7348), "initWithArray:", &unk_1EA4F1930);
    v2 = (void *)GCHIDElementAttributeKeys_AllowedKeys;
    GCHIDElementAttributeKeys_AllowedKeys = v1;

    v0 = (void *)GCHIDElementAttributeKeys_AllowedKeys;
  }
  return v0;
}

os_log_t gc_log_create_configuration(char *category)
{
  return os_log_create("com.apple.gamecontroller.Configuration", category);
}

id _gc_log_configuration()
{
  if (_gc_log_configuration_onceToken != -1)
    dispatch_once(&_gc_log_configuration_onceToken, &__block_literal_global_11);
  return (id)_gc_log_configuration_Log;
}

void ___gc_log_configuration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller.Configuration", "Common");
  v1 = (void *)_gc_log_configuration_Log;
  _gc_log_configuration_Log = (uint64_t)v0;

}

void sub_1DC7CA504(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7CA670(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7CA73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DC7CAAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  void *v26;

  objc_sync_exit(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1DC7CAF08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _gc_log_runtime_issue()
{
  if (_gc_log_runtime_issue_onceToken != -1)
    dispatch_once(&_gc_log_runtime_issue_onceToken, &__block_literal_global_12);
  return (id)_gc_log_runtime_issue_Log;
}

void ___gc_log_runtime_issue_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller", "RuntimeIssues");
  v1 = (void *)_gc_log_runtime_issue_Log;
  _gc_log_runtime_issue_Log = (uint64_t)v0;

}

os_log_t gc_log_create_ipc(char *category)
{
  return os_log_create("com.apple.gamecontroller.ipc", category);
}

id _gc_log_ipc()
{
  if (_gc_log_ipc_onceToken != -1)
    dispatch_once(&_gc_log_ipc_onceToken, &__block_literal_global_4);
  return (id)_gc_log_ipc_Log;
}

void ___gc_log_ipc_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller.hid", "Common");
  v1 = (void *)_gc_log_ipc_Log;
  _gc_log_ipc_Log = (uint64_t)v0;

}

os_log_t gc_log_create_hid(char *category)
{
  return os_log_create("com.apple.gamecontroller.hid", category);
}

id _gc_log_hid()
{
  if (_gc_log_hid_onceToken != -1)
    dispatch_once(&_gc_log_hid_onceToken, &__block_literal_global_7);
  return (id)_gc_log_hid_Log;
}

void ___gc_log_hid_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller.hid", "Common");
  v1 = (void *)_gc_log_hid_Log;
  _gc_log_hid_Log = (uint64_t)v0;

}

id _gc_log_hid_input()
{
  if (_gc_log_hid_input_onceToken != -1)
    dispatch_once(&_gc_log_hid_input_onceToken, &__block_literal_global_8);
  return (id)_gc_log_hid_input_Log;
}

void ___gc_log_hid_input_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller.hid", "Input");
  v1 = (void *)_gc_log_hid_input_Log;
  _gc_log_hid_input_Log = (uint64_t)v0;

}

os_log_t gc_log_create_device(char *category)
{
  return os_log_create("com.apple.gamecontroller.device", category);
}

id _gc_log_device()
{
  if (_gc_log_device_onceToken != -1)
    dispatch_once(&_gc_log_device_onceToken, &__block_literal_global_11_0);
  return (id)_gc_log_device_Log;
}

void ___gc_log_device_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller.device", "Common");
  v1 = (void *)_gc_log_device_Log;
  _gc_log_device_Log = (uint64_t)v0;

}

id _gc_log_device_configuration()
{
  if (_gc_log_device_configuration_onceToken != -1)
    dispatch_once(&_gc_log_device_configuration_onceToken, &__block_literal_global_12);
  return (id)_gc_log_device_configuration_Log;
}

void ___gc_log_device_configuration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller.device", "Configuration");
  v1 = (void *)_gc_log_device_configuration_Log;
  _gc_log_device_configuration_Log = (uint64_t)v0;

}

NSXPCInterface *GCGenericDeviceDriverConfigurationServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_1F03AAEE0, "interfaceWithProtocol:", &unk_1F03A5F50);
}

NSXPCInterface *GCGenericDeviceDriverConfigurationServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_1F03AAEE0, "interfaceWithProtocol:", &unk_1F03A98D0);
}

void __IOHIDQueueInputElementValueCallback(void *a1, int a2, __IOHIDQueue *a3)
{
  id *v5;
  id *v6;
  IOHIDValueRef Value;
  __int128 v8;
  __IOHIDValue *v9;
  int v10;
  NSObject *v11;
  __IOHIDElement *Element;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t TimeStamp;
  IOHIDElementCookie Cookie;
  __int128 v20;
  uint8_t v21;
  _BYTE v22[15];
  uint8_t buf[4];
  id *v24;
  __int16 v25;
  IOHIDElementCookie v26;
  __int16 v27;
  __IOHIDElement *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = v5;
  if (!a2 && v5[1] == a3)
  {
    Value = IOHIDQueueCopyNextValue(a3);
    if (Value)
    {
      v9 = Value;
      v10 = 0;
      *(_QWORD *)&v8 = 138412802;
      v20 = v8;
      while (1)
      {
        if (v10)
        {
          if (++v10 == 20)
          {
            _gc_log_hid_input();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              __IOHIDQueueInputElementValueCallback_cold_1(&v21, v22, v11);

            v10 = 20;
          }
        }
        else
        {
          IOHIDValueGetTimeStamp(v9);
          objc_msgSend(v6[4], "count");
          kdebug_trace();
          v10 = 1;
        }
        Element = IOHIDValueGetElement(v9);
        objc_getProperty(v6, sel_elements, 56, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "member:", Element);
        v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!v14)
          break;
        -[GCHIDInputElement valueChanged:](v14, v9);
        if (IOHIDElementGetType(Element) == kIOHIDElementTypeInput_NULL)
          goto LABEL_14;
        objc_msgSend(v6[4], "addObject:", v15);
LABEL_20:
        CFRelease(v9);

        v9 = IOHIDQueueCopyNextValue(a3);
        if (!v9)
          goto LABEL_23;
      }
      if (IOHIDElementGetType(Element) == kIOHIDElementTypeInput_NULL)
      {
LABEL_14:
        -[GCHIDDeviceInput batchInputElementHandler](v6);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v6[4];
          TimeStamp = IOHIDValueGetTimeStamp(v9);
          (*(void (**)(uint64_t, id, uint64_t))(v16 + 16))(v16, v17, TimeStamp);
        }
        objc_msgSend(v6[4], "removeAllObjects", v20);
      }
      else
      {
        _gc_log_hid_input();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
        {
          Cookie = IOHIDElementGetCookie(Element);
          *(_DWORD *)buf = v20;
          v24 = v6;
          v25 = 1024;
          v26 = Cookie;
          v27 = 2112;
          v28 = Element;
          _os_log_debug_impl(&dword_1DC79E000, (os_log_t)v16, OS_LOG_TYPE_DEBUG, "%@: Element changed: <HIDElement cookie: %u %@>", buf, 0x1Cu);
        }
      }

      goto LABEL_20;
    }
  }
LABEL_23:

}

void sub_1DC7CBA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DC7CBB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  void *v15;

  os_activity_scope_leave(&state);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_1DC7CBBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1DC7CC3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

_DWORD *_gc_state_dictionary_builder(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSData *v9;
  uint64_t v10;
  _DWORD *v11;

  if (a2)
  {
    v5 = *(_DWORD *)(a1 + 16);
    if (v5)
    {
      if (((a2 >> (v5 - 1)) & 1) == 0)
        return 0;
    }
  }
  v6 = (void *)objc_opt_new();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, a1, v6);
  if (!v7)
    return 0;
  v8 = (void *)v7;
  v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](&off_1F03AA8A0, "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
  v10 = -[NSData length](v9, "length");

  if (!v9)
    return 0;
  v11 = malloc_type_calloc(1uLL, v10 + 200, 0x6C2410FBuLL);
  *v11 = 1;
  v11[1] = v10;
  objc_msgSend(v8, "getCString:maxLength:encoding:", v11 + 34, 64, 4);
  -[NSData getBytes:length:](v9, "getBytes:length:", v11 + 50, -[NSData length](v9, "length"));
  return v11;
}

void __USBDevicesMatched(void *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *CFProperty;
  void *v8;
  const __CFUUID *v9;
  const __CFUUID *v10;
  kern_return_t v11;
  IOCFPlugInInterface **v12;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v14;
  CFUUIDBytes v15;
  kern_return_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  kern_return_t v20;
  NSObject *v21;
  kern_return_t v22;
  NSObject *v23;
  kern_return_t v24;
  kern_return_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  NSObject *v33;
  kern_return_t v34;
  io_service_t v35;
  NSObject *v36;
  const __CFUUID *v37;
  const __CFUUID *v38;
  kern_return_t v39;
  IOCFPlugInInterface **v40;
  HRESULT (__cdecl *v41)(void *, REFIID, LPVOID *);
  const __CFUUID *v42;
  CFUUIDBytes v43;
  kern_return_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  kern_return_t v48;
  NSObject *v49;
  kern_return_t v50;
  NSObject *v51;
  unsigned __int8 v52;
  kern_return_t v53;
  NSObject *v54;
  NSObject *v56;
  NSObject *v57;
  kern_return_t v58;
  NSObject *v59;
  const __CFAllocator *alloc;
  int v61;
  char v62;
  char v63;
  __int16 v64;
  char v65;
  unsigned __int8 v66;
  uint64_t v67;
  io_iterator_t iterator;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint64_t entryID;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  _BYTE *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  kern_return_t v82;
  _BYTE v83[136];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  while (2)
  {
    while (1)
    {
      v4 = IOIteratorNext(a2);
      if (!(_DWORD)v4)
        break;
      v5 = _os_activity_create(&dword_1DC79E000, "[Logitech Racing Wheel Manager] Matched Kernel Service", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v5, &state);
      entryID = 0;
      memset(v83, 0, 128);
      IORegistryEntryGetRegistryEntryID(v4, &entryID);
      MEMORY[0x1DF0CDC70](v4, v83);
      v6 = v3[1];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v78 = v83;
        v79 = 2048;
        v80 = entryID;
        _os_log_debug_impl(&dword_1DC79E000, v6, OS_LOG_TYPE_DEBUG, "Matched kernel service <%s %#llx>.", buf, 0x16u);
      }
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("idVendor"), 0, 0);
      v8 = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("idProduct"), 0, 0);
      if (!objc_msgSend(CFProperty, "isEqual:", &unk_1EA4F1748)
        || (objc_msgSend(v8, "isEqual:", &unk_1EA4F1790) & 1) == 0
        && (objc_msgSend(v8, "isEqual:", &unk_1EA4F1760) & 1) == 0)
      {
        v18 = v3[1];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          _os_log_error_impl(&dword_1DC79E000, v18, OS_LOG_TYPE_ERROR, "<%s %#llx> Unknown device.", buf, 0x16u);
        }
        goto LABEL_21;
      }
      theInterface = 0;
      theScore = 0;
      v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      v11 = IOCreatePlugInInterfaceForService(v4, v9, v10, &theInterface, &theScore);
      if (v11 || (v12 = theInterface) == 0)
      {
        v19 = v3[1];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v11;
          _os_log_error_impl(&dword_1DC79E000, v19, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to load IOUSBDeviceUserClient plugin: %{mach.errno}d.", buf, 0x1Cu);
        }
LABEL_21:
        IOObjectRelease(v4);
        goto LABEL_22;
      }
      v72 = 0;
      QueryInterface = (*theInterface)->QueryInterface;
      v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x5Cu, 0x81u, 0x87u, 0xD0u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0x8Bu, 0x45u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      v15 = CFUUIDGetUUIDBytes(v14);
      v16 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))QueryInterface)(v12, *(_QWORD *)&v15.byte0, *(_QWORD *)&v15.byte8, &v72);
      if (v16)
      {
        v17 = v3[1];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v16;
          _os_log_error_impl(&dword_1DC79E000, v17, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to obtain IOUSBDeviceInterface from IOUSBDeviceUserClient plugin: %i.", buf, 0x1Cu);
        }
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        IOObjectRelease(v4);
        goto LABEL_22;
      }
      IOObjectRelease(v4);
      ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
      theInterface = 0;
      v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v72 + 64))(v72);
      if (v20)
      {
        v21 = v3[1];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v20;
          _os_log_error_impl(&dword_1DC79E000, v21, OS_LOG_TYPE_ERROR, "<%s %#llx> Device USBDeviceOpen failed: %{mach.errno}d.", buf, 0x1Cu);
        }
        (*(void (**)(uint64_t))(*(_QWORD *)v72 + 24))(v72);
        goto LABEL_22;
      }
      v71 = 0;
      v22 = (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)v72 + 152))(v72, &v71);
      if (v22)
      {
        v23 = v3[1];
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        *(_DWORD *)buf = 136315650;
        v78 = v83;
        v79 = 2048;
        v80 = entryID;
        v81 = 1024;
        v82 = v22;
        v30 = v23;
        v31 = "<%s %#llx> Device GetNumberOfConfigurations failed: %{mach.errno}d.";
        v32 = 28;
LABEL_46:
        _os_log_error_impl(&dword_1DC79E000, v30, OS_LOG_TYPE_ERROR, v31, buf, v32);
        goto LABEL_69;
      }
      if (!v71)
      {
        v29 = v3[1];
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        *(_DWORD *)buf = 136315394;
        v78 = v83;
        v79 = 2048;
        v80 = entryID;
        v30 = v29;
        v31 = "<%s %#llx> Device returned 0 configurations.";
        v32 = 22;
        goto LABEL_46;
      }
      v70 = 0;
      v24 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t *))(*(_QWORD *)v72 + 168))(v72, 0, &v70);
      if (v24 || !v70)
      {
        v33 = v3[1];
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        *(_DWORD *)buf = 136315650;
        v78 = v83;
        v79 = 2048;
        v80 = entryID;
        v81 = 1024;
        v82 = v24;
        v27 = v33;
        v28 = "<%s %#llx> Device GetConfigurationDescriptorPtr failed: %{mach.errno}d.";
        goto LABEL_60;
      }
      v25 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v72 + 184))(v72, *(unsigned __int8 *)(v70 + 5));
      if (v25)
      {
        v26 = v3[1];
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        *(_DWORD *)buf = 136315650;
        v78 = v83;
        v79 = 2048;
        v80 = entryID;
        v81 = 1024;
        v82 = v25;
        v27 = v26;
        v28 = "<%s %#llx> Device SetConfiguration failed: %{mach.errno}d.";
LABEL_60:
        _os_log_error_impl(&dword_1DC79E000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x1Cu);
LABEL_69:
        (*(void (**)(uint64_t))(*(_QWORD *)v72 + 72))(v72);
        (*(void (**)(uint64_t))(*(_QWORD *)v72 + 24))(v72);
        goto LABEL_22;
      }
      v69 = -1;
      iterator = 0;
      v34 = (*(uint64_t (**)(uint64_t, uint64_t *, io_iterator_t *))(*(_QWORD *)v72 + 224))(v72, &v69, &iterator);
      if (v34 || !iterator)
      {
        v36 = v3[1];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v34;
          _os_log_error_impl(&dword_1DC79E000, v36, OS_LOG_TYPE_ERROR, "<%s %#llx> Device CreateInterfaceIterator failed: %{mach.errno}d.", buf, 0x1Cu);
        }
        goto LABEL_69;
      }
      while (1)
      {
        v35 = IOIteratorNext(iterator);
        if (v35 || IOIteratorIsValid(a2))
          break;
        MEMORY[0x1DF0CDBD4](a2);
      }
      IOObjectRelease(iterator);
      if (!v35)
      {
        v46 = v3[1];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          _os_log_error_impl(&dword_1DC79E000, v46, OS_LOG_TYPE_ERROR, "<%s %#llx> No device interfaces found.", buf, 0x16u);
        }
        goto LABEL_69;
      }
      v37 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      v38 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      v39 = IOCreatePlugInInterfaceForService(v35, v37, v38, &theInterface, &theScore);
      if (v39 || (v40 = theInterface) == 0)
      {
        v47 = v3[1];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v39;
          _os_log_error_impl(&dword_1DC79E000, v47, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to load IOUSBInterfaceUserClient plugin: %{mach.errno}d.", buf, 0x1Cu);
        }
        IOObjectRelease(v35);
        goto LABEL_69;
      }
      v67 = 0;
      v41 = (*theInterface)->QueryInterface;
      v42 = CFUUIDGetConstantUUIDWithBytes(alloc, 0x87u, 0x52u, 0x66u, 0x3Bu, 0xC0u, 0x7Bu, 0x4Bu, 0xAEu, 0x95u, 0x84u, 0x22u, 3u, 0x2Fu, 0xABu, 0x9Cu, 0x5Au);
      v43 = CFUUIDGetUUIDBytes(v42);
      v44 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))v41)(v40, *(_QWORD *)&v43.byte0, *(_QWORD *)&v43.byte8, &v67);
      if (v44)
      {
        v45 = v3[1];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v44;
          _os_log_error_impl(&dword_1DC79E000, v45, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to obtain IOUSBInterfaceInterface from IOUSBDeviceUserClient plugin: %i.", buf, 0x1Cu);
        }
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        IOObjectRelease(v35);
        goto LABEL_69;
      }
      IOObjectRelease(v35);
      ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
      theInterface = 0;
      v48 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v67 + 352))(v67);
      if (v48)
      {
        v49 = v3[1];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v48;
          _os_log_error_impl(&dword_1DC79E000, v49, OS_LOG_TYPE_ERROR, "<%s %#llx> Interface USBInterfaceOpenSeize failed: %{mach.errno}d.", buf, 0x1Cu);
        }
        (*(void (**)(uint64_t))(*(_QWORD *)v67 + 24))(v67);
        goto LABEL_69;
      }
      v66 = 0;
      v50 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)v67 + 152))(v67, &v66);
      if (v50)
      {
        v51 = v3[1];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v50;
          _os_log_error_impl(&dword_1DC79E000, v51, OS_LOG_TYPE_ERROR, "<%s %#llx> Interface GetNumEndpoints failed: %{mach.errno}d.", buf, 0x1Cu);
        }
        goto LABEL_86;
      }
      if (!v66)
      {
        v57 = v3[1];
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          _os_log_error_impl(&dword_1DC79E000, v57, OS_LOG_TYPE_ERROR, "<%s %#llx> Interface returned 0 endpoints.", buf, 0x16u);
        }
        goto LABEL_86;
      }
      v52 = 0;
      while (1)
      {
        v65 = 0;
        v64 = 0;
        v63 = 0;
        LOWORD(v61) = 0;
        v53 = (*(uint64_t (**)(uint64_t, _QWORD, char *, char *, __int16 *, int *, char *))(*(_QWORD *)v67 + 208))(v67, v52, &v65, (char *)&v64 + 1, &v64, &v61, &v63);
        if (v53)
        {
          v54 = v3[1];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v78 = v83;
            v79 = 2048;
            v80 = entryID;
            v81 = 1024;
            v82 = v53;
            _os_log_error_impl(&dword_1DC79E000, v54, OS_LOG_TYPE_ERROR, "<%s %#llx> Interface GetPipeProperties failed: %{mach.errno}d.", buf, 0x1Cu);
          }
          goto LABEL_83;
        }
        if (v64 == 3 || v65 == 0)
          break;
LABEL_83:
        if (v66 <= ++v52)
          goto LABEL_84;
      }
      if (HIBYTE(v64) == 255)
      {
LABEL_84:
        v56 = v3[1];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          _os_log_error_impl(&dword_1DC79E000, v56, OS_LOG_TYPE_ERROR, "<%s %#llx> Interrupt pipe not found.", buf, 0x16u);
        }
        goto LABEL_86;
      }
      v62 = 66;
      v61 = 16842767;
      v58 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v67 + 256))(v67);
      v59 = v3[1];
      if (v58)
      {
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v78 = v83;
          v79 = 2048;
          v80 = entryID;
          v81 = 1024;
          v82 = v58;
          _os_log_error_impl(&dword_1DC79E000, v59, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v78 = v83;
        v79 = 2048;
        v80 = entryID;
        _os_log_impl(&dword_1DC79E000, v59, OS_LOG_TYPE_DEFAULT, "<%s %#llx> Issued mode switch command (G92x -> G92x/HID++).", buf, 0x16u);
      }
LABEL_86:
      (*(void (**)(uint64_t))(*(_QWORD *)v67 + 72))(v67);
      (*(void (**)(uint64_t))(*(_QWORD *)v67 + 24))(v67);
      (*(void (**)(uint64_t))(*(_QWORD *)v72 + 72))(v72);
      (*(void (**)(uint64_t))(*(_QWORD *)v72 + 24))(v72);
LABEL_22:

      os_activity_scope_leave(&state);
    }
    if (!IOIteratorIsValid(a2))
    {
      MEMORY[0x1DF0CDBD4](a2);
      continue;
    }
    break;
  }

}

void sub_1DC7CDCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void __HIDDevicesMatched_0(void *a1, uint64_t a2)
{
  _QWORD *v3;
  const __CFAllocator *v4;
  __int128 v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  __IOHIDDevice *v9;
  IOReturn v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  IOReturn v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  IOReturn v20;
  NSObject *v21;
  NSObject *v22;
  IOReturn v23;
  NSObject *v24;
  IOReturn v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  __int128 v29;
  uint8_t v30[4];
  uint64_t entryID;
  os_activity_scope_state_s state;
  uint8_t report[8];
  uint8_t buf[4];
  _OWORD *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  IOReturn v39;
  _OWORD v40[8];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_QWORD *)&v5 = 136315650;
  v29 = v5;
  while (1)
  {
    while (1)
    {
      v6 = IOIteratorNext(a2);
      if (!(_DWORD)v6)
        break;
      v7 = _os_activity_create(&dword_1DC79E000, "[Logitech Racing Wheel Manager] Matched Kernel Service", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v7, &state);
      entryID = 0;
      memset(v40, 0, sizeof(v40));
      IORegistryEntryGetRegistryEntryID(v6, &entryID);
      MEMORY[0x1DF0CDC70](v6, v40);
      v8 = v3[1];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v35 = v40;
        v36 = 2048;
        v37 = entryID;
        _os_log_debug_impl(&dword_1DC79E000, v8, OS_LOG_TYPE_DEBUG, "Matched kernel service <%s %#llx>.", buf, 0x16u);
      }
      v9 = IOHIDDeviceCreate(v4, v6);
      if (v9)
      {
        IOObjectRelease(v6);
        v10 = IOHIDDeviceOpen(v9, 0);
        if (v10)
        {
          v11 = v3[1];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v29;
            v35 = v40;
            v36 = 2048;
            v37 = entryID;
            v38 = 1024;
            v39 = v10;
            _os_log_error_impl(&dword_1DC79E000, v11, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to open device: %{mach.errno}d", buf, 0x1Cu);
          }
          CFRelease(v9);
          goto LABEL_43;
        }
        IOHIDDeviceGetProperty(v9, CFSTR("VendorID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        IOHIDDeviceGetProperty(v9, CFSTR("ProductID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqual:", &unk_1EA4F1748)
          && objc_msgSend(v14, "isEqual:", &unk_1EA4F1778))
        {
          *(_QWORD *)report = 0x1010709F830;
          v15 = IOHIDDeviceSetReport(v9, kIOHIDReportTypeOutput, 48, report, 8);
          if (v15)
          {
            v16 = v3[1];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              v35 = v40;
              v36 = 2048;
              v37 = entryID;
              v38 = 1024;
              v39 = v15;
              _os_log_error_impl(&dword_1DC79E000, v16, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
            }
          }
          v17 = v3[1];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v35 = v40;
            v36 = 2048;
            v37 = entryID;
            v18 = v17;
            v19 = "<%s %#llx> Issued mode switch command (G923/PS -> G923/Classic).";
            goto LABEL_39;
          }
          goto LABEL_42;
        }
        if (objc_msgSend(v13, "isEqual:", &unk_1EA4F1748, v29)
          && objc_msgSend(v14, "isEqual:", &unk_1EA4F17A8))
        {
          report[4] = 1;
          *(_DWORD *)report = 84539440;
          v20 = IOHIDDeviceSetReport(v9, kIOHIDReportTypeOutput, 48, report, 5);
          if (v20)
          {
            v21 = v3[1];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              v35 = v40;
              v36 = 2048;
              v37 = entryID;
              v38 = 1024;
              v39 = v20;
              _os_log_error_impl(&dword_1DC79E000, v21, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
            }
          }
          v22 = v3[1];
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            goto LABEL_42;
          *(_DWORD *)buf = 136315394;
          v35 = v40;
          v36 = 2048;
          v37 = entryID;
          v18 = v22;
          v19 = "<%s %#llx> Issued mode switch command (G29/PS4 -> G29/Classic).";
        }
        else
        {
          if (!objc_msgSend(v13, "isEqual:", &unk_1EA4F1748)
            || !objc_msgSend(v14, "isEqual:", &unk_1EA4F17C0))
          {
            v28 = v3[1];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v35 = v40;
              v36 = 2048;
              v37 = entryID;
              _os_log_error_impl(&dword_1DC79E000, v28, OS_LOG_TYPE_ERROR, "<%s %#llx> Unknown device.", buf, 0x16u);
            }
            goto LABEL_42;
          }
          *(_QWORD *)report = 0x10000002000921;
          *(_DWORD *)v30 = 17107448;
          v23 = IOHIDDeviceSetReport(v9, kIOHIDReportTypeOutput, 33, report, 8);
          if (v23)
          {
            v24 = v3[1];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              v35 = v40;
              v36 = 2048;
              v37 = entryID;
              v38 = 1024;
              v39 = v23;
              _os_log_error_impl(&dword_1DC79E000, v24, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
            }
          }
          v25 = IOHIDDeviceSetReport(v9, kIOHIDReportTypeOutput, v30[0], v30, 4);
          if (v25)
          {
            v26 = v3[1];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              v35 = v40;
              v36 = 2048;
              v37 = entryID;
              v38 = 1024;
              v39 = v25;
              _os_log_error_impl(&dword_1DC79E000, v26, OS_LOG_TYPE_ERROR, "<%s %#llx> Error issuing mode switch command: %{mach.errno}d", buf, 0x1Cu);
            }
          }
          v27 = v3[1];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
LABEL_42:
            IOHIDDeviceClose(v9, 0);
            CFRelease(v9);

            goto LABEL_43;
          }
          *(_DWORD *)buf = 136315394;
          v35 = v40;
          v36 = 2048;
          v37 = entryID;
          v18 = v27;
          v19 = "<%s %#llx> Issued mode switch command (G29/PS3 -> G29/Classic).";
        }
LABEL_39:
        _os_log_debug_impl(&dword_1DC79E000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0x16u);
        goto LABEL_42;
      }
      v12 = v3[1];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v35 = v40;
        v36 = 2048;
        v37 = entryID;
        _os_log_error_impl(&dword_1DC79E000, v12, OS_LOG_TYPE_ERROR, "<%s %#llx> Failed to create IOHIDDevice.", buf, 0x16u);
      }
      IOObjectRelease(v6);
LABEL_43:
      os_activity_scope_leave(&state);

    }
    if (IOIteratorIsValid(a2))
      break;
    MEMORY[0x1DF0CDBD4](a2);
  }

}

void sub_1DC7CE43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

_QWORD *IOGCDeviceInterfacePrepareObjCVtbl(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD *v6;

  v3 = (void *)objc_opt_class();
  objc_getAssociatedObject(v3, &unk_1F03A9930);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA0D8), "initWithLength:", 64);
    objc_setAssociatedObject(v3, &unk_1F03A9930, v4, (void *)0x301);
  }
  v5 = objc_retainAutorelease(v4);
  v6 = (_QWORD *)objc_msgSend(v5, "mutableBytes");

  if (!*v6)
  {
    *v6 = a2;
    v6[1] = queryInterface_0;
    v6[2] = addRef_0;
    v6[3] = release_0;
    v6[4] = openDevice;
    v6[5] = closeDevice;
    v6[6] = getProperty;
    v6[7] = setProperty;
  }
  return v6;
}

uint64_t openDevice(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "open:", a2);
}

uint64_t closeDevice(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "close:", a2);
}

uint64_t getProperty(_QWORD **a1, uint64_t a2)
{
  return objc_msgSend((char *)a1 - **a1, "getProperty:", a2);
}

uint64_t setProperty(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((char *)a1 - **a1, "setProperty:value:", a2, a3);
}

uint64_t IOGCFastPathClientGetTypeID()
{
  return objc_opt_self();
}

__IOGCFastPathClient *IOGCFastPathClientCreateWithPlugInInterface(const __CFAllocator *a1, io_object_t a2, uint64_t a3)
{
  objc_class *v6;
  size_t InstanceSize;
  __IOGCFastPathClient *v8;
  objc_class *v9;
  NSObject *v10;
  uint64_t (*v11)(uint64_t, _QWORD, _QWORD, IOCFPlugInInterfaceStruct ***);
  const __CFUUID *v12;
  CFUUIDBytes v13;
  IOCFPlugInInterfaceStruct ***p_pluginInterface;
  IOCFPlugInInterfaceStruct **v15;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v17;
  CFUUIDBytes v18;
  const __CFNumber *Property;
  const __CFNumber *v20;
  CFTypeID v21;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;

  if (a1)
  {
    v6 = (objc_class *)objc_opt_class();
    InstanceSize = class_getInstanceSize(v6);
    v8 = (__IOGCFastPathClient *)CFAllocatorAllocate(a1, InstanceSize, 0);
    if (!v8)
      return v8;
    v9 = (objc_class *)objc_opt_class();
    v8 = (__IOGCFastPathClient *)objc_constructInstance(v9, v8);
    v8->allocator = (__CFAllocator *)CFRetain(a1);
    if (!a2)
      goto LABEL_11;
  }
  else
  {
    v8 = [__IOGCFastPathClient alloc];
    if (!a2)
      goto LABEL_11;
  }
  if (IOObjectRetain(a2))
  {
    v10 = _gc_log_iokit();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      IOGCFastPathClientCreateWithPlugInInterface_cold_4();
    goto LABEL_9;
  }
  v8->service = a2;
LABEL_11:
  v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, IOCFPlugInInterfaceStruct ***))(*(_QWORD *)a3 + 8);
  v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v13 = CFUUIDGetUUIDBytes(v12);
  p_pluginInterface = &v8->pluginInterface;
  if ((v11(a3, *(_QWORD *)&v13.byte0, *(_QWORD *)&v13.byte8, &v8->pluginInterface) & 0x80000000) != 0
    || (v15 = *p_pluginInterface) == 0)
  {
    v23 = _gc_log_iokit();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      IOGCFastPathClientCreateWithPlugInInterface_cold_1();
    goto LABEL_9;
  }
  QueryInterface = (*v15)->QueryInterface;
  v17 = CFUUIDGetConstantUUIDWithBytes(0, 0xD2u, 0x4Au, 0x24u, 0x86u, 0x3Bu, 0xCDu, 0x4Eu, 0x96u, 0xB6u, 6u, 0x34u, 0xE1u, 0x5Fu, 0xD6u, 0x66u, 0x5Cu);
  v18 = CFUUIDGetUUIDBytes(v17);
  if ((((uint64_t (*)(IOCFPlugInInterfaceStruct **, _QWORD, _QWORD, IOGCFastPathClientInterface ***))QueryInterface)(v15, *(_QWORD *)&v18.byte0, *(_QWORD *)&v18.byte8, &v8->clientInterface) & 0x80000000) != 0|| !v8->clientInterface)
  {
    v24 = _gc_log_iokit();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      IOGCFastPathClientCreateWithPlugInInterface_cold_2();
    goto LABEL_9;
  }
  if ((**p_pluginInterface)->version != 1)
  {
    v25 = _gc_log_iokit();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      IOGCFastPathClientCreateWithPlugInInterface_cold_3();
LABEL_9:

    return 0;
  }
  Property = (const __CFNumber *)IOGCFastPathClientGetProperty((uint64_t)v8, CFSTR("ProviderID"));
  if (Property)
  {
    v20 = Property;
    v21 = CFGetTypeID(Property);
    if (v21 == CFNumberGetTypeID())
      CFNumberGetValue(v20, kCFNumberSInt64Type, &v8->providerID);
  }
  return v8;
}

CFTypeRef IOGCFastPathClientGetProperty(uint64_t a1, const void *a2)
{
  CFTypeRef result;
  CFNumberRef v5;
  uint64_t entryID;

  result = (CFTypeRef)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 64))(*(_QWORD *)(a1 + 32));
  if (a2 && !result)
  {
    if (CFEqual(a2, CFSTR("ProviderID")))
    {
      entryID = 0;
      IORegistryEntryGetRegistryEntryID(*(_DWORD *)(a1 + 16), &entryID);
    }
    else
    {
      if (!CFEqual(a2, CFSTR("ClientID")))
        return 0;
      entryID = a1;
    }
    v5 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 8), kCFNumberSInt64Type, &entryID);
    return CFAutorelease(v5);
  }
  return result;
}

__IOGCFastPathClient *IOGCFastPathClientCreate(const __CFAllocator *a1, io_object_t a2)
{
  objc_class *v4;
  size_t InstanceSize;
  __IOGCFastPathClient *v6;
  objc_class *v7;
  NSObject *v8;
  const __CFUUID *v10;
  const __CFUUID *v11;
  kern_return_t v12;
  IOCFPlugInInterfaceStruct **pluginInterface;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v15;
  CFUUIDBytes v16;
  kern_return_t v17;
  const __CFNumber *Property;
  const __CFNumber *v19;
  CFTypeID v20;
  CFStringRef v21;
  NSObject *v22;
  const char *v23;
  kern_return_t v24;
  NSObject *v25;
  uint64_t entryID;
  SInt32 theScore;
  uint8_t buf[4];
  CFStringRef v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  kern_return_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  theScore = 0;
  if (a1)
  {
    v4 = (objc_class *)objc_opt_class();
    InstanceSize = class_getInstanceSize(v4);
    v6 = (__IOGCFastPathClient *)CFAllocatorAllocate(a1, InstanceSize, 0);
    if (!v6)
      return v6;
    v7 = (objc_class *)objc_opt_class();
    v6 = (__IOGCFastPathClient *)objc_constructInstance(v7, v6);
    v6->allocator = (__CFAllocator *)CFRetain(a1);
  }
  else
  {
    v6 = [__IOGCFastPathClient alloc];
  }
  if (IOObjectRetain(a2))
  {
    v8 = _gc_log_iokit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      IOGCFastPathClientCreate_cold_2();
    goto LABEL_9;
  }
  v6->service = a2;
  v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xF2u, 0x5Fu, 0xF3u, 0xC2u, 0x33u, 0xFu, 0x4Bu, 0x52u, 0x82u, 7u, 0xA0u, 0xD6u, 0xF2u, 0x3Du, 0xF0u, 0xCDu);
  v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v12 = IOCreatePlugInInterfaceForService(a2, v10, v11, &v6->pluginInterface, &theScore);
  if (v12)
  {
    v24 = v12;
    entryID = 0;
    v21 = IOObjectCopyClass(a2);
    IORegistryEntryGetRegistryEntryID(a2, &entryID);
    v22 = _gc_log_iokit();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v29 = v21;
      v30 = 2048;
      v31 = entryID;
      v32 = 1024;
      v33 = v24;
      v23 = "[IOGCFastPathClient] #Error instantiating 'IOGCFastPathType' plugin object for <%@ '%#010llx'>: %{mach.errno}d";
LABEL_27:
      _os_log_error_impl(&dword_1DC79E000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x1Cu);
      if (!v21)
        goto LABEL_9;
      goto LABEL_23;
    }
LABEL_22:
    if (!v21)
    {
LABEL_9:

      return 0;
    }
LABEL_23:
    CFRelease(v21);
    goto LABEL_9;
  }
  pluginInterface = v6->pluginInterface;
  QueryInterface = (*pluginInterface)->QueryInterface;
  v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xD2u, 0x4Au, 0x24u, 0x86u, 0x3Bu, 0xCDu, 0x4Eu, 0x96u, 0xB6u, 6u, 0x34u, 0xE1u, 0x5Fu, 0xD6u, 0x66u, 0x5Cu);
  v16 = CFUUIDGetUUIDBytes(v15);
  v17 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, _QWORD, _QWORD, IOGCFastPathClientInterface ***))QueryInterface)(pluginInterface, *(_QWORD *)&v16.byte0, *(_QWORD *)&v16.byte8, &v6->clientInterface);
  if (v17 < 0 || !v6->clientInterface)
  {
    entryID = 0;
    v21 = IOObjectCopyClass(a2);
    IORegistryEntryGetRegistryEntryID(a2, &entryID);
    v22 = _gc_log_iokit();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v29 = v21;
      v30 = 2048;
      v31 = entryID;
      v32 = 1024;
      v33 = v17;
      v23 = "[IOGCFastPathClient] #Error obtaining 'IOGFastPathClientInterface' from 'IOGCFastPathType' plugin object for"
            " <%@ '%#010llx'>: %d";
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  if ((*v6->pluginInterface)->version != 1)
  {
    v25 = _gc_log_iokit();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      IOGCFastPathClientCreate_cold_1();
    goto LABEL_9;
  }
  Property = (const __CFNumber *)IOGCFastPathClientGetProperty((uint64_t)v6, CFSTR("ProviderID"));
  if (Property)
  {
    v19 = Property;
    v20 = CFGetTypeID(Property);
    if (v20 == CFNumberGetTypeID())
      CFNumberGetValue(v19, kCFNumberSInt64Type, &v6->providerID);
  }
  return v6;
}

uint64_t IOGCFastPathClientGetPlugInInterface(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t IOGCFastPathClientGetService(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t IOGCFastPathClientOpen(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 48))(*(_QWORD *)(a1 + 32));
}

uint64_t IOGCFastPathClientClose(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 56))(*(_QWORD *)(a1 + 32));
}

uint64_t IOGCFastPathClientSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 72))(*(_QWORD *)(a1 + 32));
}

uint64_t IOGCFastPathControlQueueGetTypeID()
{
  return objc_opt_self();
}

__IOGCFastPathControlQueue *IOGCFastPathControlQueueCreateWithOptions(const __CFAllocator *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  objc_class *v7;
  size_t InstanceSize;
  __IOGCFastPathControlQueue *v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, _QWORD, _QWORD, IOGCFastPathControlQueueInterface ***);
  const __CFUUID *v13;
  CFUUIDBytes v14;
  IOGCFastPathControlQueueInterface ***p_queueInterface;
  int v16;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v5 = a2[4];
  v24 = 0;
  v6 = (*(uint64_t (**)(uint64_t, const __CFAllocator *, uint64_t, uint64_t *))(*(_QWORD *)v5 + 80))(v5, a1, a3, &v24);
  if (v6 < 0 || !v24)
  {
    v21 = _gc_log_iokit();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v26 = v6;
      _os_log_impl(&dword_1DC79E000, v21, OS_LOG_TYPE_INFO, "#Error creating control queue object: %d", buf, 8u);
    }
    return 0;
  }
  if (!a1)
  {
    v9 = [__IOGCFastPathControlQueue alloc];
    goto LABEL_8;
  }
  v7 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v7);
  v9 = (__IOGCFastPathControlQueue *)CFAllocatorAllocate(a1, InstanceSize, 0);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    v9 = (__IOGCFastPathControlQueue *)objc_constructInstance(v10, v9);
    v9->allocator = (__CFAllocator *)CFRetain(a1);
LABEL_8:
    v9->client = (__IOGCFastPathClient *)a2;
    v11 = v24;
    v12 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, IOGCFastPathControlQueueInterface ***))(*(_QWORD *)v24 + 8);
    v13 = CFUUIDGetConstantUUIDWithBytes(0, 0x5Du, 0xF3u, 0x6Au, 0xD7u, 0xDDu, 0x2Bu, 0x49u, 0xBEu, 0xB3u, 0xFu, 0xF0u, 0xFAu, 0xEAu, 0x2Cu, 0xD7u, 0x74u);
    v14 = CFUUIDGetUUIDBytes(v13);
    p_queueInterface = &v9->queueInterface;
    v16 = v12(v11, *(_QWORD *)&v14.byte0, *(_QWORD *)&v14.byte8, &v9->queueInterface);
    (*(void (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);
    if (v16 < 0 || !*p_queueInterface)
    {
      v18 = _gc_log_iokit();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_19:

        return 0;
      }
      *(_DWORD *)buf = 67109120;
      v26 = v16;
      v19 = "#Error obtaining 'kIOGFastPathControlQueueInterface' from control queue object: %d";
      v20 = v18;
    }
    else
    {
      if (*((_WORD *)**p_queueInterface + 16) == 1)
        return v9;
      v22 = _gc_log_iokit();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      v23 = *((unsigned __int16 *)**p_queueInterface + 16);
      *(_DWORD *)buf = 67109120;
      v26 = v23;
      v19 = "The 'kIOGFastPathControlQueueInterface' obtained from plugin reader object is an unsupported version: %d";
      v20 = v22;
    }
    _os_log_impl(&dword_1DC79E000, v20, OS_LOG_TYPE_INFO, v19, buf, 8u);
    goto LABEL_19;
  }
  return v9;
}

__IOGCFastPathControlQueue *IOGCFastPathControlQueueCreate(const __CFAllocator *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("QueueChannel");
  v8[1] = CFSTR("QueueCapacity");
  v9[0] = +[NSNumber numberWithUnsignedInt:](&off_1F03A9E90, "numberWithUnsignedInt:");
  v9[1] = +[NSNumber numberWithUnsignedLong:](&off_1F03A9E90, "numberWithUnsignedLong:", a4);
  return IOGCFastPathControlQueueCreateWithOptions(a1, a2, (uint64_t)+[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
}

uint64_t IOGCFastPathControlQueueGetPlugInInterface(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t IOGCFastPathControlQueueGetClient(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t IOGCFastPathControlQueueGetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 48))(*(_QWORD *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 56))(*(_QWORD *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueGetActivePosition(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 64))(*(_QWORD *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueGetReadPosition(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 72))(*(_QWORD *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueResetPosition(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 80))(*(_QWORD *)(a1 + 24));
}

uint64_t IOGCFastPathControlQueueGetSample(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 88))(*(_QWORD *)(a1 + 24), a2, 0, a3);
}

uint64_t IOGCFastPathInputQueueGetTypeID()
{
  return objc_opt_self();
}

__IOGCFastPathInputQueue *IOGCFastPathInputQueueCreateWithOptions(const __CFAllocator *a1, _QWORD *a2, CFDictionaryRef theDict)
{
  const __CFNumber *Value;
  const __CFNumber *v7;
  CFTypeID v8;
  uint64_t v9;
  objc_class *v10;
  size_t InstanceSize;
  __IOGCFastPathInputQueue *v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, _QWORD, _QWORD, IOGCFastPathInputQueueInterface ***);
  const __CFUUID *v16;
  CFUUIDBytes v17;
  IOGCFastPathInputQueueInterface ***p_queueInterface;
  const __CFNumber *Property;
  const __CFNumber *v20;
  CFTypeID v21;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  int valuePtr;

  if (!a2)
    return 0;
  valuePtr = 0;
  if (theDict)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("QueueChannel"));
    if (Value)
    {
      v7 = Value;
      v8 = CFGetTypeID(Value);
      if (v8 == CFNumberGetTypeID())
        CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr);
    }
  }
  kdebug_trace();
  v9 = a2[4];
  v26 = 0;
  if (((*(uint64_t (**)(uint64_t, const __CFAllocator *, CFDictionaryRef, uint64_t *))(*(_QWORD *)v9 + 88))(v9, a1, theDict, &v26) & 0x80000000) != 0|| !v26)
  {
    v24 = _gc_log_iokit();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      IOGCFastPathInputQueueCreateWithOptions_cold_1();
LABEL_28:
    v12 = 0;
    goto LABEL_18;
  }
  if (!a1)
  {
    v12 = [__IOGCFastPathInputQueue alloc];
LABEL_12:
    v12->client = (__IOGCFastPathClient *)a2;
    v14 = v26;
    v15 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, IOGCFastPathInputQueueInterface ***))(*(_QWORD *)v26 + 8);
    v16 = CFUUIDGetConstantUUIDWithBytes(0, 0x19u, 0x43u, 0x1Bu, 0xCFu, 0xBBu, 0xEFu, 0x43u, 0x5Bu, 0x9Cu, 0x57u, 0xB3u, 0xF3u, 0x48u, 6u, 0x86u, 0x2Du);
    v17 = CFUUIDGetUUIDBytes(v16);
    p_queueInterface = &v12->queueInterface;
    LODWORD(v14) = v15(v14, *(_QWORD *)&v17.byte0, *(_QWORD *)&v17.byte8, &v12->queueInterface);
    (*(void (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
    if ((v14 & 0x80000000) != 0 || !*p_queueInterface)
    {
      v23 = _gc_log_iokit();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        IOGCFastPathInputQueueCreateWithOptions_cold_2();
    }
    else
    {
      if ((**p_queueInterface)->var4 == 1)
      {
        Property = (const __CFNumber *)IOGCFastPathInputQueueGetProperty((uint64_t)v12, CFSTR("QueueID"));
        if (Property)
        {
          v20 = Property;
          v21 = CFGetTypeID(Property);
          if (v21 == CFNumberGetTypeID())
            CFNumberGetValue(v20, kCFNumberSInt64Type, &v12->queueID);
        }
        goto LABEL_18;
      }
      v25 = _gc_log_iokit();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        IOGCFastPathInputQueueCreateWithOptions_cold_3();
    }

    goto LABEL_28;
  }
  v10 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v10);
  v12 = (__IOGCFastPathInputQueue *)CFAllocatorAllocate(a1, InstanceSize, 0);
  if (v12)
  {
    v13 = (objc_class *)objc_opt_class();
    v12 = (__IOGCFastPathInputQueue *)objc_constructInstance(v13, v12);
    v12->allocator = (__CFAllocator *)CFRetain(a1);
    goto LABEL_12;
  }
LABEL_18:
  kdebug_trace();
  return v12;
}

CFTypeRef IOGCFastPathInputQueueGetProperty(uint64_t a1, const void *a2)
{
  CFTypeRef result;
  CFNumberRef v5;
  uint64_t valuePtr;

  result = (CFTypeRef)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 48))(*(_QWORD *)(a1 + 24));
  if (a2 && !result)
  {
    if (CFEqual(a2, CFSTR("QueueID")))
    {
      valuePtr = a1;
      v5 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 8), kCFNumberSInt64Type, &valuePtr);
      return CFAutorelease(v5);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__IOGCFastPathInputQueue *IOGCFastPathInputQueueCreateWithDuration(const __CFAllocator *a1, _QWORD *a2, double a3)
{
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("QueueChannel");
  v7[1] = CFSTR("QueueDuration");
  v8[0] = +[NSNumber numberWithUnsignedInt:](&off_1F03A9E90, "numberWithUnsignedInt:");
  v8[1] = +[NSNumber numberWithDouble:](&off_1F03A9E90, "numberWithDouble:", a3);
  return IOGCFastPathInputQueueCreateWithOptions(a1, a2, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
}

uint64_t IOGCFastPathInputQueueGetPlugInInterface(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t IOGCFastPathInputQueueGetClient(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t IOGCFastPathInputQueueSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 56))(*(_QWORD *)(a1 + 24));
}

uint64_t IOGCFastPathInputQueueRegisterDataAvailableCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(result + 80))
    IOGCFastPathInputQueueRegisterDataAvailableCallback_cold_1();
  *(_QWORD *)(result + 56) = a2;
  *(_QWORD *)(result + 64) = a3;
  return result;
}

void IOGCFastPathInputQueueSetDispatchQueue(uint64_t a1, dispatch_object_t object)
{
  NSObject *v4;

  if (*(_BYTE *)(a1 + 80))
    IOGCFastPathInputQueueSetDispatchQueue_cold_1();
  v4 = *(NSObject **)(a1 + 40);
  if (v4)
    dispatch_release(v4);
  *(_QWORD *)(a1 + 40) = object;
  if (object)
    dispatch_retain(object);
}

void *IOGCFastPathInputQueueSetCancelHandler(uint64_t a1, void *aBlock)
{
  const void *v4;
  void *result;

  if (*(_BYTE *)(a1 + 80))
    IOGCFastPathInputQueueSetCancelHandler_cold_1();
  v4 = *(const void **)(a1 + 48);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(aBlock);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

uint64_t IOGCFastPathInputQueueActivate(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v7;

  if (*(_BYTE *)(a1 + 80))
    return 0;
  v2 = *(_QWORD *)(a1 + 24);
  v3 = 3758097112;
  v7 = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v4 = (*(uint64_t (**)(uint64_t, int *))(*(_QWORD *)v2 + 64))(v2, &v7);
      if ((_DWORD)v4)
      {
        v3 = v4;
      }
      else
      {
        v5 = dispatch_mach_create();
        *(_QWORD *)(a1 + 72) = v5;
        if (v5)
        {
          dispatch_retain(v5);
          dispatch_mach_connect();
          v3 = 0;
          *(_BYTE *)(a1 + 80) = 1;
          return v3;
        }
        v3 = 3758097097;
      }
    }
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 64))(v2, 0);
  }
  return v3;
}

uint64_t IOGCFastPathInputQueueCancel(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 80))
    IOGCFastPathInputQueueCancel_cold_1();
  v1 = result;
  if (!*(_BYTE *)(result + 81))
  {
    result = dispatch_mach_cancel();
    *(_BYTE *)(v1 + 81) = 1;
  }
  return result;
}

uint64_t IOGCFastPathInputQueueGetLatestSamplePosition(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 72))(*(_QWORD *)(a1 + 24));
}

uint64_t IOGCFastPathInputQueueGetSampleWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  v7 = *(_QWORD *)(a1 + 24);
  kdebug_trace();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 80))(v7, a2, a3, a4);
  kdebug_trace();
  return v8;
}

uint64_t IOGCFastPathInputQueueGetSample(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return IOGCFastPathInputQueueGetSampleWithOptions(a1, a2, 0, a3);
}

uint64_t IOGCFastPathQueueGetTypeID()
{
  return objc_opt_self();
}

uint64_t IOGCFastPathQueueGetPlugInInterface(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t IOGCFastPathQueueGetClient(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t IOGCFastPathQueueSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 56))(*(_QWORD *)(a1 + 24));
}

uint64_t IOGCFastPathReaderGetTypeID()
{
  return objc_opt_self();
}

__IOGCFastPathReader *IOGCFastPathReaderCreate(const __CFAllocator *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, const __CFAllocator *, uint64_t *);
  objc_class *v6;
  size_t InstanceSize;
  void *v8;
  void *v9;
  objc_class *v10;
  __IOGCFastPathReader *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, _QWORD, _QWORD, IOGCFastPathReaderInterface ***);
  const __CFUUID *v14;
  CFUUIDBytes v15;
  IOGCFastPathReaderInterface ***p_readerInterface;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;

  if (!a2)
    return 0;
  v4 = a2[3];
  kdebug_trace();
  v5 = *(uint64_t (**)(uint64_t, const __CFAllocator *, uint64_t *))(*(_QWORD *)v4 + 88);
  if (v5)
  {
    v21 = 0;
    if ((v5(v4, a1, &v21) & 0x80000000) != 0 || !v21)
    {
      v19 = _gc_log_iokit();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        IOGCFastPathReaderCreate_cold_1();
    }
    else
    {
      if (!a1)
      {
        v11 = [__IOGCFastPathReader alloc];
LABEL_10:
        v11->queue = (__IOGCFastPathInputQueue *)a2;
        v12 = v21;
        v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, IOGCFastPathReaderInterface ***))(*(_QWORD *)v21 + 8);
        v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x6Bu, 0x29u, 0x76u, 0xBCu, 0xFu, 0xD5u, 0x4Bu, 0x35u, 0xAAu, 0x8Cu, 7u, 0x9Du, 0x84u, 0xBEu, 0xAu, 0x4Bu);
        v15 = CFUUIDGetUUIDBytes(v14);
        p_readerInterface = &v11->readerInterface;
        LODWORD(v12) = v13(v12, *(_QWORD *)&v15.byte0, *(_QWORD *)&v15.byte8, &v11->readerInterface);
        (*(void (**)(uint64_t))(*(_QWORD *)v21 + 24))(v21);
        if ((v12 & 0x80000000) != 0 || !*p_readerInterface)
        {
          v18 = _gc_log_iokit();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            IOGCFastPathReaderCreate_cold_2();
        }
        else
        {
          if ((**p_readerInterface)->var4 == 1)
            goto LABEL_13;
          v20 = _gc_log_iokit();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            IOGCFastPathReaderCreate_cold_3();
        }

        goto LABEL_22;
      }
      v6 = (objc_class *)objc_opt_class();
      InstanceSize = class_getInstanceSize(v6);
      v8 = CFAllocatorAllocate(a1, InstanceSize, 0);
      if (v8)
      {
        v9 = v8;
        v10 = (objc_class *)objc_opt_class();
        v11 = (__IOGCFastPathReader *)objc_constructInstance(v10, v9);
        v11->allocator = (__CFAllocator *)CFRetain(a1);
        goto LABEL_10;
      }
    }
LABEL_22:
    kdebug_trace();
    return 0;
  }
  v11 = (__IOGCFastPathReader *)IOGCFastPathSimpleReaderCreate(a1, a2);
LABEL_13:
  kdebug_trace();
  return v11;
}

uint64_t IOGCFastPathReaderGetPlugInInterface(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t IOGCFastPathReaderGetQueue(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t IOGCFastPathReaderReset(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 24);
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
  v4 = -1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v1 + 56))(v1, &v4);
  kdebug_trace();
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
  v4 = -1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v1 + 56))(v1, &v4);
  kdebug_trace();
  return v3;
}

uint64_t IOGCFastPathReaderReadCurrentSample(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 64))(v3, a2);
  v6 = -1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 56))(v3, &v6);
  kdebug_trace();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 64))(v3, a2);
  v6 = -1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 56))(v3, &v6);
  kdebug_trace();
  return v5;
}

uint64_t IOGCFastPathReaderReadNextSample(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 72))(v3, a2);
  v6 = -1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 56))(v3, &v6);
  kdebug_trace();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 72))(v3, a2);
  v6 = -1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 56))(v3, &v6);
  kdebug_trace();
  return v5;
}

uint64_t IOGCFastPathReaderReadPreviousSample(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 80))(v3, a2);
  v6 = -1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 56))(v3, &v6);
  kdebug_trace();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 80))(v3, a2);
  v6 = -1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 56))(v3, &v6);
  kdebug_trace();
  return v5;
}

uint64_t IOGCFastPathReaderInitializeSampleBuffer(uint64_t a1, _QWORD *a2)
{
  *a2 = 0;
  return 0;
}

uint64_t IOGCFastPathReaderFinalizeSampleBuffer(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (*a2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint64_t IOGCFastPathSampleDestory(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 48))(v2, a1);
  else
    return 3758097090;
}

uint64_t IOGCFastPathSampleGetPosition(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD *))(*(_QWORD *)*a1 + 72))(*a1, a1);
}

uint64_t IOGCFastPathSampleGetSequenceID(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t))(*(_QWORD *)*a1 + 80))(*a1, a1, a2, a3);
}

uint64_t IOGCFastPathSampleGetSubsampleCount(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)*a1 + 88))(*a1, a1, a2);
}

uint64_t IOGCFastPathSampleGetFlags(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t))(*(_QWORD *)*a1 + 96))(*a1, a1, a2, a3);
}

uint64_t IOGCFastPathSampleSetFlags(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t))(*(_QWORD *)*a1 + 104))(*a1, a1, a2, a3);
}

uint64_t IOGCFastPathSampleGetTimestamp(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v16 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v16 + 112))(v16, a1, a2, a3, a4, a5, a6, a7, a8);
  v21 = 0;
  v22 = 0;
  v20 = 0;
  v19 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v16 + 224))(v16, a1, &v22, &v21, &v20, &v19);
  kdebug_trace();
  v18 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v16 + 112))(v16, a1, a2, a3, a4, a5, a6, a7, a8);
  kdebug_trace();
  return v18;
}

uint64_t IOGCFastPathSampleSetTimestamp(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v14 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD))(*(_QWORD *)v14 + 120))(v14, a1, a2, a3, a4, a5, a6, a7, 0);
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v17 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v14 + 224))(v14, a1, &v20, &v19, &v18, &v17);
  kdebug_trace();
  v16 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD))(*(_QWORD *)v14 + 120))(v14, a1, a2, a3, a4, a5, a6, a7, 0);
  kdebug_trace();
  return v16;
}

uint64_t IOGCFastPathSampleGetInteger(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v10 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 128))(v10, a1, a2, a3, a4, a5);
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v10 + 224))(v10, a1, &v16, &v15, &v14, &v13);
  kdebug_trace();
  v12 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 128))(v10, a1, a2, a3, a4, a5);
  kdebug_trace();
  return v12;
}

uint64_t IOGCFastPathSampleGetDouble(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v10 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 136))(v10, a1, a2, a3, a4, a5);
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v10 + 224))(v10, a1, &v16, &v15, &v14, &v13);
  kdebug_trace();
  v12 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 136))(v10, a1, a2, a3, a4, a5);
  kdebug_trace();
  return v12;
}

uint64_t IOGCFastPathSampleSetInteger(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v10 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 144))(v10, a1, a2, a3, a4, a5);
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v10 + 224))(v10, a1, &v16, &v15, &v14, &v13);
  kdebug_trace();
  v12 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 144))(v10, a1, a2, a3, a4, a5);
  kdebug_trace();
  return v12;
}

uint64_t IOGCFastPathSampleSetDouble(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v10 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double))(*(_QWORD *)v10 + 152))(v10, a1, a2, a3, a4, a5);
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v10 + 224))(v10, a1, &v16, &v15, &v14, &v13);
  kdebug_trace();
  v12 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double))(*(_QWORD *)v10 + 152))(v10, a1, a2, a3, a4, a5);
  kdebug_trace();
  return v12;
}

uint64_t IOGCFastPathSampleGet2Integer(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v12 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 160))(v12, a1, a2, a3, a4, a5, a6);
  v17 = 0;
  v18 = 0;
  v16 = 0;
  v15 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v12 + 224))(v12, a1, &v18, &v17, &v16, &v15);
  kdebug_trace();
  v14 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 160))(v12, a1, a2, a3, a4, a5, a6);
  kdebug_trace();
  return v14;
}

uint64_t IOGCFastPathSampleGet2Double(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v12 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 168))(v12, a1, a2, a3, a4, a5, a6);
  v17 = 0;
  v18 = 0;
  v16 = 0;
  v15 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v12 + 224))(v12, a1, &v18, &v17, &v16, &v15);
  kdebug_trace();
  v14 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 168))(v12, a1, a2, a3, a4, a5, a6);
  kdebug_trace();
  return v14;
}

uint64_t IOGCFastPathSampleSetInteger2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v12 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 176))(v12, a1, a2, a3, a4, a5, a6);
  v17 = 0;
  v18 = 0;
  v16 = 0;
  v15 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v12 + 224))(v12, a1, &v18, &v17, &v16, &v15);
  kdebug_trace();
  v14 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 176))(v12, a1, a2, a3, a4, a5, a6);
  kdebug_trace();
  return v14;
}

uint64_t IOGCFastPathSampleSetDouble2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v12 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double, double))(*(_QWORD *)v12 + 184))(v12, a1, a2, a3, a4, a5, a6);
  v17 = 0;
  v18 = 0;
  v16 = 0;
  v15 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v12 + 224))(v12, a1, &v18, &v17, &v16, &v15);
  kdebug_trace();
  v14 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double, double))(*(_QWORD *)v12 + 184))(v12, a1, a2, a3, a4, a5, a6);
  kdebug_trace();
  return v14;
}

uint64_t IOGCFastPathSampleGet3Integer(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v14 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 192))(v14, a1, a2, a3, a4, a5, a6, a7);
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v17 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v14 + 224))(v14, a1, &v20, &v19, &v18, &v17);
  kdebug_trace();
  v16 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 192))(v14, a1, a2, a3, a4, a5, a6, a7);
  kdebug_trace();
  return v16;
}

uint64_t IOGCFastPathSampleGet3Double(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v14 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 200))(v14, a1, a2, a3, a4, a5, a6, a7);
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v17 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v14 + 224))(v14, a1, &v20, &v19, &v18, &v17);
  kdebug_trace();
  v16 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 200))(v14, a1, a2, a3, a4, a5, a6, a7);
  kdebug_trace();
  return v16;
}

uint64_t IOGCFastPathSampleSetInteger3(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v14 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 208))(v14, a1, a2, a3, a4, a5, a6, a7);
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v17 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v14 + 224))(v14, a1, &v20, &v19, &v18, &v17);
  kdebug_trace();
  v16 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 208))(v14, a1, a2, a3, a4, a5, a6, a7);
  kdebug_trace();
  return v16;
}

uint64_t IOGCFastPathSampleSetDouble3(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v14 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double, double, double))(*(_QWORD *)v14 + 216))(v14, a1, a2, a3, a4, a5, a6, a7);
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v17 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v14 + 224))(v14, a1, &v20, &v19, &v18, &v17);
  kdebug_trace();
  v16 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, double, double, double))(*(_QWORD *)v14 + 216))(v14, a1, a2, a3, a4, a5, a6, a7);
  kdebug_trace();
  return v16;
}

uint64_t IOGCFastPathSampleCommit(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 64))(v2, a1);
  v7 = 0;
  v8 = 0;
  v6 = 0;
  v5 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v2 + 224))(v2, a1, &v8, &v7, &v6, &v5);
  kdebug_trace();
  v4 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 64))(v2, a1);
  kdebug_trace();
  return v4;
}

uint64_t IOGCFastPathSampleRefresh(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  if (!kdebug_is_enabled())
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 56))(v2, a1);
  v7 = 0;
  v8 = 0;
  v6 = 0;
  v5 = -1;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *, int *, uint64_t *))(*(_QWORD *)v2 + 224))(v2, a1, &v8, &v7, &v6, &v5);
  kdebug_trace();
  v4 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 56))(v2, a1);
  kdebug_trace();
  return v4;
}

uint64_t IOGCFastPathSampleGetHostTimestamp(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return IOGCFastPathSampleGetTimestamp(a1, 0, 3, 1, 0, a3, 0, 0);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_1DC7D2BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void ConnectToDriverService(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (&unk_1F03A3B48 == v7)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __ConnectToDriverService_block_invoke;
    v15[3] = &unk_1EA4D4068;
    v12 = &v16;
    v16 = v10;
    objc_msgSend(v8, "connectToAssetManagementServiceWithClient:reply:", v9, v15);
  }
  else
  {
    if (&unk_1F03A4588 != v7)
      ConnectToDriverService_cold_1((uint64_t)v7);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __ConnectToDriverService_block_invoke_2;
    v13[3] = &unk_1EA4D4090;
    v12 = &v14;
    v14 = v10;
    objc_msgSend(v8, "connectToGenericDeviceDBServiceWithClient:reply:", v9, v13);
  }

}

id GCLookupService(void *a1, objc_class *a2, uint64_t a3, int a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  id v17;

  objc_msgSend(a1, "serviceFor:client:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = FallbackProvider;
    objc_msgSend((id)FallbackProvider, "serviceFor:client:", a2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 && a4 != 0)
    {
      if (object_isClass(a2))
      {
        NSStringFromClass(a2);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", protocol_getName(a2));
        else
          -[objc_class description](a2, "description");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> returned nil for required dependency '%@'."), v15, v8, v13);
      v16 = objc_claimAutoreleasedReturnValue();

      +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v16, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
  }
  return v7;
}

void GCLookupSetFallbackProvider(id obj)
{
  objc_storeStrong((id *)&FallbackProvider, obj);
}

id GCLookupDispatchWorkloop(void *a1, int a2)
{
  return GCLookupService(a1, (objc_class *)&unk_1F03A96F0, 0, a2);
}

void sub_1DC7D3B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1DC7D477C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DC7D4830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1DC7D55A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,const __CFString *a37,uint64_t a38)
{
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;

  if (a2)
  {
    if (a2 == 2)
    {
      v38 = objc_begin_catch(exception_object);
      if (a17)
      {
        a33 = *MEMORY[0x1E0CB2D50];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *MEMORY[0x1E0CB2D68];
        a36 = (uint64_t)v39;
        a37 = CFSTR("Model build failed.  This is a #BUG.");
        v41 = *MEMORY[0x1E0CB3388];
        a34 = v40;
        a35 = v41;
        objc_msgSend(v38, "gc_error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        a38 = (uint64_t)v42;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a36, &a33, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v43);
        *a17 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7D53C4);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

__CFString *NSStringFromGCHIDElementUsageType(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1EA4D4178[a1];
}

void Observer::runAndFree(Observer *this, GCFuture *a2)
{
  GCFuture *v3;
  Observer **tqe_prev;
  Observer *v5;
  GCFuture *v6;

  v3 = a2;
  tqe_prev = this->pointers.tqe_prev;
  this->_handler = (_scaleType *)v3;
  BYTE1(this->var0) |= 1u;
  v6 = v3;
  if (tqe_prev)
  {
    CFRetain(v3);
    BYTE1(this->var0) |= 2u;
    dispatch_async((dispatch_queue_t)this->pointers.tqe_prev, this->pointers.tqe_next);
  }
  else
  {
    ((void (*)(void))this->pointers.tqe_next->pointers.tqe_next)();
    Observer::_CleanupInvocationAndFree(this, v5);
  }

}

void sub_1DC7D6750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void Observer::_CleanupInvocationAndFree(Observer *this, Observer *a2)
{
  char v3;
  Observer *tqe_next;

  v3 = BYTE1(this->var0);
  if ((v3 & 2) != 0)
  {
    CFRelease(this->_handler);
    v3 = BYTE1(this->var0) & 0xFD;
  }
  BYTE1(this->var0) = v3 & 0xFE;
  this->_handler = 0;
  tqe_next = this->pointers.tqe_next;
  this->pointers.tqe_next = 0;

}

void sub_1DC7D6834(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7D6AA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DC7D6B58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7D6C0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7D6CEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DC7D6DAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7D6E60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7D6EF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7D6F7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id __immutablePlaceholderFuture(void)
{
  if (__immutablePlaceholderFuture(void)::onceToken != -1)
    dispatch_once(&__immutablePlaceholderFuture(void)::onceToken, &__block_literal_global_289);
  return (id)__immutablePlaceholderFuture(void)::placeholder;
}

void sub_1DC7D71B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7D7254(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7D7348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7D73B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7D74AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7D7504(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7D75EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7D766C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7D7738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  void *v11;
  void *v12;

  a11.super_class = (Class)GCFuture;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1DC7D7990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id sub_1DC7D7A48()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;

  if (v1 && v0)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ '%@' @0x%lx [pending]>"), v3, v0, v1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (v1)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ @0x%lx [pending]>"), v3, v1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v0)
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ '%@' [pending]>"), v3, v0);
    else
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ [pending]>"), v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v4;

  return v7;
}

void sub_1DC7D7F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7D84A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7D8540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DC7D859C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DC7D8804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t __GCFUTURE_IS_CALLING_OUT_TO_AN_OBSERVER__(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_1DC7D8920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1DC7D8984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DC7D8A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1DC7D8A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DC7D8B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1DC7D8B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DC7D8C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1DC7D8F10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DC7D901C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1DC7D91EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1DC7D92B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1DC7D9438(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DC7D953C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1DC7D96FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1DC7D9898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7D9964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1DC7D9A84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7D9B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1DC7D9C48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7D9D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1DC7D9E68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1DC7D9F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1DC7DA064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7DA144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1DC7DA264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7DA30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1DC7DA454(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7DA530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1DC7DA688(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1DC7DA73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1DC7DA8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1DC7DA9B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7DAB30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL ContinuationList::addOrInvokeContinuation_takesLock(uint64_t a1, void *a2, void *a3)
{
  GCFuture *v5;
  uint64_t (**v6)(_QWORD);
  uint64_t v7;
  Observer *v8;
  Observer *v9;

  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock_with_options();
  v7 = *(_QWORD *)(a1 + 8);
  v8 = (Observer *)v6[2](v6);
  v9 = v8;
  if (v7)
  {
    v8->_handler = 0;
    **(_QWORD **)(a1 + 8) = v8;
    *(_QWORD *)(a1 + 8) = v8;
    os_unfair_lock_unlock(&v5->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&v5->_lock);
    Observer::runAndFree(v9, v5);
  }

  return v7 != 0;
}

void sub_1DC7DAC08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *Observer::Create(void *a1, void *a2, char a3, dispatch_qos_class_t a4, int a5)
{
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  void *v14;
  dispatch_block_flags_t v15;
  dispatch_block_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  id v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  id v29;

  v9 = a1;
  v26 = 0;
  v27 = 1;
  v28 = 0;
  v29 = a2;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3321888768;
  v20[2] = ___ZN8Observer6CreateEU13block_pointerFv13GCFutureStateP11objc_objectP7NSErrorEPU28objcproto17OS_dispatch_queue8NSObjectj11qos_class_ti_block_invoke;
  v20[3] = &unk_1EA4D44C0;
  v22 = 0;
  v23 = 1;
  v24 = 0;
  v25 = v29;
  v21 = v9;
  v10 = v9;
  v11 = objc_msgSend(v20, "copy");
  v12 = (_QWORD *)v11;
  if ((a3 & 2) != 0)
  {
    v15 = DISPATCH_BLOCK_DETACHED;
    if (a4 == QOS_CLASS_UNSPECIFIED)
    {
LABEL_7:
      v16 = dispatch_block_create(v15, v12);
LABEL_10:
      v14 = v16;

      goto LABEL_11;
    }
LABEL_9:
    v16 = dispatch_block_create_with_qos_class(v15, a4, a5, v12);
    goto LABEL_10;
  }
  v13 = a3 & 4;
  v14 = (void *)v11;
  if (v13 | a4)
  {
    if (v13)
      v15 = DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT;
    else
      v15 = 0;
    if (a4 == QOS_CLASS_UNSPECIFIED)
      goto LABEL_7;
    goto LABEL_9;
  }
LABEL_11:
  v17 = _Block_copy(v14);
  v18 = (void *)v12[7];
  v12[7] = v17;

  Continuation::~Continuation((Continuation *)&v22);
  Continuation::~Continuation((Continuation *)&v26);
  return v12 + 5;
}

void sub_1DC7DAD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, Observer *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  Observer *v19;
  void *v20;

  Observer::~Observer(v19);
  Observer::~Observer((Observer *)&a19);
  _Unwind_Resume(a1);
}

void sub_1DC7DAE78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ContinuationList::drainContinuations_takesLock(ContinuationList *this, GCFuture *a2)
{
  GCFuture *v3;
  os_unfair_lock_s *p_lock;
  Observer **tqh_first;
  Observer *i;
  Observer *handler;
  Observer **p_tqh_first;
  Observer *v9[2];

  v3 = a2;
  p_lock = &v3->_lock;
  os_unfair_lock_lock_with_options();
  v9[0] = 0;
  v9[1] = (Observer *)v9;
  tqh_first = (Observer **)this->_continuations.tqh_first;
  if (this->_continuations.tqh_first)
  {
    *(ContinuationList *)v9 = *this;
    this->_continuations.tqh_first = 0;
    tqh_first = &this->_continuations.tqh_first;
  }
  this->_continuations.tqh_last = tqh_first;
  os_unfair_lock_unlock(p_lock);
  for (i = v9[0]; v9[0]; i = v9[0])
  {
    while (i)
    {
      handler = (Observer *)i->_handler;
      Observer::runAndFree(i, v3);
      i = handler;
    }
    v9[0] = 0;
    v9[1] = (Observer *)v9;
    os_unfair_lock_lock_with_options();
    p_tqh_first = (Observer **)this->_continuations.tqh_first;
    if (this->_continuations.tqh_first)
    {
      *(ContinuationList *)v9 = *this;
      this->_continuations.tqh_first = 0;
      p_tqh_first = &this->_continuations.tqh_first;
    }
    this->_continuations.tqh_last = p_tqh_first;
    os_unfair_lock_unlock(p_lock);
  }

}

void sub_1DC7DAF68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7DB220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7DB33C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7DB3EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7DB56C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7DB5F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1DC7DB690(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7DB6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DC7DB764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DC7DBC9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DC7DBE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  uint64_t v24;

  _Block_object_dispose(&a19, 8);

  _Block_object_dispose((const void *)(v24 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_1DC7DC188(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7DC340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  uint64_t v24;

  _Block_object_dispose(&a19, 8);

  _Block_object_dispose((const void *)(v24 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DC7DC660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1DC7DC764(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7DC9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1DC7DCACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1DC7DCC80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1DC7DCDF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7DCEF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DC7DCFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)GCPromise;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1DC7DD0BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7DD154(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DC7DD1EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZL17__creatorFrameKeyv_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&__creatorFrameKey(void)::key, 0);
}

void ___ZL28__immutablePlaceholderFuturev_block_invoke()
{
  _GCPlaceholderFuture *v0;
  void *v1;

  v0 = [_GCPlaceholderFuture alloc];
  v1 = (void *)__immutablePlaceholderFuture(void)::placeholder;
  __immutablePlaceholderFuture(void)::placeholder = (uint64_t)v0;

}

void ___ZN8Observer6CreateEU13block_pointerFv13GCFutureStateP11objc_objectP7NSErrorEPU28objcproto17OS_dispatch_queue8NSObjectj11qos_class_ti_block_invoke(uint64_t a1)
{
  Observer *v2;
  id *v3;
  id *v4;
  id v5;
  id v6;
  Observer *v7;

  if ((*(_BYTE *)(a1 + 49) & 1) == 0)
    ___ZN8Observer6CreateEU13block_pointerFv13GCFutureStateP11objc_objectP7NSErrorEPU28objcproto17OS_dispatch_queue8NSObjectj11qos_class_ti_block_invoke_cold_1();
  v2 = (Observer *)(a1 + 40);
  v3 = (id *)Continuation::future((Continuation *)(a1 + 40));
  v4 = v3;
  if (*((_BYTE *)v3 + 12) == 2)
    v5 = v3[2];
  else
    v5 = 0;

  if (*((_BYTE *)v4 + 12) == 1)
    v6 = v4[2];
  else
    v6 = 0;

  __GCFUTURE_IS_CALLING_OUT_TO_AN_OBSERVER__(*(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 64))
    Observer::_CleanupInvocationAndFree(v2, v7);
}

id Continuation::future(Continuation *this)
{
  if ((*((_BYTE *)this + 9) & 1) != 0)
    return *(id *)this;
  else
    return 0;
}

id __copy_helper_block_ea8_40c13_ZTS8Observer(uint64_t a1, uint64_t a2)
{
  id result;
  uint64_t v4;

  if ((*(_BYTE *)(a2 + 49) & 1) != 0)
  {
    _os_assert_log();
    v4 = _os_crash();
    __copy_helper_block_ea8_40c13_ZTS8Observer_cold_1(v4);
  }
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) &= 0xFCu;
  *(_QWORD *)(a1 + 56) = 0;
  result = *(id *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_ea8_40c13_ZTS8Observer(uint64_t a1)
{
  Continuation *v2;

  v2 = (Continuation *)(a1 + 40);

  Continuation::~Continuation(v2);
}

void Observer::~Observer(Observer *this)
{

  Continuation::~Continuation((Continuation *)this);
}

void Continuation::~Continuation(Continuation *this)
{
  uint64_t v1;

  if ((*((_BYTE *)this + 9) & 1) != 0)
  {
    _os_assert_log();
    v1 = _os_crash();
    Continuation::~Continuation(v1);
  }
  *(_QWORD *)this = 0;
}

void sub_1DC7DED7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,const __CFString *a45,uint64_t a46)
{
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;

  if (a2)
  {
    if (a2 == 2)
    {
      v47 = objc_begin_catch(exception_object);
      if (a17)
      {
        a41 = *MEMORY[0x1E0CB2D50];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = *MEMORY[0x1E0CB2D68];
        a44 = (uint64_t)v48;
        a45 = CFSTR("Model build failed.  This is a #BUG.");
        v50 = *MEMORY[0x1E0CB3388];
        a42 = v49;
        a43 = v50;
        objc_msgSend(v47, "gc_error");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        a46 = (uint64_t)v51;
        objc_msgSend(*(id *)(v46 + 3504), "dictionaryWithObjects:forKeys:count:", &a44, &a41, 3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v52);
        *a17 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7DE4D8);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

id _gc_log_generic_device()
{
  if (_gc_log_generic_device_onceToken != -1)
    dispatch_once(&_gc_log_generic_device_onceToken, &__block_literal_global_15);
  return (id)_gc_log_generic_device_Log;
}

void ___gc_log_generic_device_block_invoke()
{
  uint64_t v0;
  void *v1;

  gc_log_create_device("Generic");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_gc_log_generic_device_Log;
  _gc_log_generic_device_Log = v0;

}

void GCAnalyticsSendCheckCompatibleHIDDeviceEvent(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v5 = a1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3254779904;
  v7[2] = __GCAnalyticsSendCheckCompatibleHIDDeviceEvent_block_invoke;
  v7[3] = &__block_descriptor_48_e8_32n11_8_8_s0_t8w1_e30___NSObject_OS_xpc_object__8__0l;
  v8 = a2;
  v9 = a3;
  v6 = a2;
  objc_msgSend(v5, "sendEvent:withXPCPayloadBuilder:", CFSTR("com.apple.GameController.ConfiguredDevice.CheckCompatibleHIDDevice"), v7);

}

void sub_1DC7E14EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_32n11_8_8_s0_t8w1(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return result;
}

void __destroy_helper_block_e8_32n4_8_s0(uint64_t a1)
{

}

void sub_1DC7E1F14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, const __CFString *a16, uint64_t a17)
{
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  if (a2)
  {
    if (a2 == 2)
    {
      v20 = objc_begin_catch(exception_object);
      if (v18)
      {
        a12 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(*(id *)(v19 + 3480), "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *MEMORY[0x1E0CB2D68];
        a15 = (uint64_t)v21;
        a16 = CFSTR("Model build failed.  This is a #BUG.");
        v23 = *MEMORY[0x1E0CB3388];
        a13 = v22;
        a14 = v23;
        objc_msgSend(v20, "gc_error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        a17 = (uint64_t)v24;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a15, &a12, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v25);
        *v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7E1F08);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1DC7E2A94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,const __CFString *a37,uint64_t a38)
{
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;

  if (a2)
  {
    if (a2 == 2)
    {
      v38 = objc_begin_catch(exception_object);
      if (a16)
      {
        a33 = *MEMORY[0x1E0CB2D50];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *MEMORY[0x1E0CB2D68];
        a36 = (uint64_t)v39;
        a37 = CFSTR("Model build failed.  This is a #BUG.");
        v41 = *MEMORY[0x1E0CB3388];
        a34 = v40;
        a35 = v41;
        objc_msgSend(v38, "gc_error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        a38 = (uint64_t)v42;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a36, &a33, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v43);
        *a16 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7E2974);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_1DC7E583C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,const __CFString *a37,uint64_t a38)
{
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;

  if (a2)
  {
    if (a2 == 2)
    {
      v38 = objc_begin_catch(exception_object);
      if (a16)
      {
        a33 = *MEMORY[0x1E0CB2D50];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *MEMORY[0x1E0CB2D68];
        a36 = (uint64_t)v39;
        a37 = CFSTR("Model build failed.  This is a #BUG.");
        v41 = *MEMORY[0x1E0CB3388];
        a34 = v40;
        a35 = v41;
        objc_msgSend(v38, "gc_error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        a38 = (uint64_t)v42;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a36, &a33, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v43);
        *a16 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7E571CLL);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_1DC7E77F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,const __CFString *a53,uint64_t a54)
{
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;

  if (a2)
  {
    if (a2 == 2)
    {
      v54 = objc_begin_catch(exception_object);
      if (a16)
      {
        a49 = *MEMORY[0x1E0CB2D50];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = *MEMORY[0x1E0CB2D68];
        a52 = (uint64_t)v55;
        a53 = CFSTR("Model build failed.  This is a #BUG.");
        v57 = *MEMORY[0x1E0CB3388];
        a50 = v56;
        a51 = v57;
        objc_msgSend(v54, "gc_error");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        a54 = (uint64_t)v58;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &a52, &a49, 3);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v59);
        *a16 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7E748CLL);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

uint64_t IOGCDeviceGetTypeID()
{
  return objc_opt_self();
}

void *IOGCDeviceCreate(uint64_t a1, uint64_t a2)
{
  __IOGCDevice *v3;
  uint64_t v4;
  void *v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  if (!(_DWORD)a2)
    return 0;
  v9 = 0;
  v3 = [__IOGCDevice alloc];
  v3->_allocator = (__CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = -[__IOGCDevice initWithPort:error:](v3, "initWithPort:error:", a2, &v9);
  if (!v4)
  {
    v7 = _gc_log_iokit();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      IOGCDeviceCreate_cold_1(&v9, v7);
    return 0;
  }
  v5 = (void *)v4;
  if (!_IOGCDeviceGetPlugInInterface(v4))
  {
    v8 = _gc_log_iokit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      IOGCDeviceCreate_cold_2(v8);

    return 0;
  }
  return v5;
}

uint64_t _IOGCDeviceGetPlugInInterface(uint64_t a1)
{
  io_object_t v2;
  const __CFUUID *v3;
  const __CFUUID *v4;
  kern_return_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _QWORD, _QWORD, uint64_t);
  const __CFUUID *v9;
  CFUUIDBytes v10;
  kern_return_t v11;
  CFStringRef v12;
  NSObject *v13;
  const char *v14;
  kern_return_t v15;
  uint64_t entryID;
  SInt32 theScore;
  uint8_t buf[4];
  CFStringRef v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  kern_return_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  theScore = 0;
  v2 = -[GCIOObject port](a1);
  if (!*(_QWORD *)(a1 + 32)
    && (v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x21u, 0x7Du, 0x5Bu, 0xADu, 0xABu, 0x5Eu, 0x43u, 0x23u, 0x9Cu, 0, 0x2Au, 0xE4u, 0x88u, 0xD5u, 0xDAu, 0x87u), v4 = CFUUIDGetConstantUUIDWithBytes(0,
               0xC2u,
               0x44u,
               0xE8u,
               0x58u,
               0x10u,
               0x9Cu,
               0x11u,
               0xD4u,
               0x91u,
               0xD4u,
               0,
               0x50u,
               0xE4u,
               0xC6u,
               0x42u,
               0x6Fu),
        (v5 = IOCreatePlugInInterfaceForService(v2, v3, v4, (IOCFPlugInInterface ***)(a1 + 32), &theScore)) != 0))
  {
    v15 = v5;
    entryID = 0;
    v12 = IOObjectCopyClass(v2);
    IORegistryEntryGetRegistryEntryID(v2, &entryID);
    v13 = _gc_log_iokit();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      v20 = 2048;
      v21 = entryID;
      v22 = 1024;
      v23 = v15;
      v14 = "#Error instantiating 'kIOGCDeviceTypeID' CFPlugIn for <%@ '%#010llx'>: %{mach.errno}d";
      goto LABEL_11;
    }
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return result;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v7 + 8);
    v9 = CFUUIDGetConstantUUIDWithBytes(0, 0x3Au, 0xE7u, 0x17u, 0x8Eu, 0xEAu, 0x88u, 0x44u, 0x2Cu, 0x8Cu, 0xE9u, 0x8Fu, 0x85u, 0xBBu, 0xD5u, 0x67u, 0xDAu);
    v10 = CFUUIDGetUUIDBytes(v9);
    v11 = v8(v7, *(_QWORD *)&v10.byte0, *(_QWORD *)&v10.byte8, a1 + 40);
    if ((v11 & 0x80000000) == 0)
    {
      result = *(_QWORD *)(a1 + 40);
      if (result)
        return result;
    }
    entryID = 0;
    v12 = IOObjectCopyClass(v2);
    IORegistryEntryGetRegistryEntryID(v2, &entryID);
    v13 = _gc_log_iokit();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      v20 = 2048;
      v21 = entryID;
      v22 = 1024;
      v23 = v11;
      v14 = "#Error obtaining 'kIOGCDeviceInterfaceID' from 'kIOGCDeviceTypeID' CFPlugIn for <%@ '%#010llx'>: %d";
LABEL_11:
      _os_log_impl(&dword_1DC79E000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x1Cu);
    }
  }
  if (v12)
    CFRelease(v12);
  return 0;
}

uint64_t IOGCDeviceOpen(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 32))(*(_QWORD *)(a1 + 40));
}

uint64_t IOGCDeviceClose(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 40))(*(_QWORD *)(a1 + 40));
}

uint64_t IOGCDeviceGetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 48))(*(_QWORD *)(a1 + 40));
}

uint64_t IOGCDeviceSetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 56))(*(_QWORD *)(a1 + 40));
}

uint64_t __IOHIDDeviceRemovedNotification(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;

  if (a3 == -536870896)
  {
    v3 = result;
    IOObjectRelease(*(_DWORD *)(result + 88));
    *(_DWORD *)(v3 + 88) = 0;
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(v3 + 72))(*(_QWORD *)(v3 + 80), 0, v3);
  }
  return result;
}

void IOGCDeviceSetDispatchQueue(uint64_t a1, dispatch_queue_t queue)
{
  const char *label;
  const char *v6;
  dispatch_queue_t v7;
  void *v8;
  char __str[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (atomic_load((unsigned __int8 *)(a1 + 92)))
    IOGCDeviceSetDispatchQueue_cold_1();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)__str = 0u;
  v10 = 0u;
  label = dispatch_queue_get_label(queue);
  v6 = "";
  if (label)
    v6 = label;
  snprintf(__str, 0x100uLL, "%s.IOGCDevice", v6);
  v7 = dispatch_queue_create_with_target_V2(__str, 0, queue);
  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v7;

}

void *IOGCDeviceSetCancelHandler(uint64_t a1, const void *a2)
{
  void *result;

  result = _Block_copy(a2);
  *(_QWORD *)(a1 + 56) = result;
  return result;
}

uint64_t IOGCDeviceActivate(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 v3;
  GCIONotificationPort *v4;
  uint64_t v5;
  IONotificationPort *v6;
  io_service_t v7;
  _QWORD v8[5];

  v1 = result;
  v2 = (unsigned __int8 *)(result + 92);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 | 1, v2));
  if ((v3 & 1) == 0)
  {
    if (!*(_QWORD *)(result + 48))
      IOGCDeviceActivate_cold_1();
    v4 = objc_alloc_init(GCIONotificationPort);
    *(_QWORD *)(v1 + 64) = v4;
    v5 = *(_QWORD *)(v1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __IOGCDeviceActivate_block_invoke;
    v8[3] = &unk_1EA4D3878;
    v8[4] = v1;
    result = -[GCIONotificationPort setQueue:cancellationHandler:](v4, "setQueue:cancellationHandler:", v5, v8);
    if (*(_QWORD *)(v1 + 72))
    {
      v6 = (IONotificationPort *)-[GCIONotificationPort port](*(_QWORD *)(v1 + 64));
      v7 = -[GCIOObject port](v1);
      return IOServiceAddInterestNotification(v6, v7, "IOGeneralInterest", (IOServiceInterestCallback)__IOHIDDeviceRemovedNotification, (void *)v1, (io_object_t *)(v1 + 88));
    }
  }
  return result;
}

void IOGCDeviceCancel(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  io_object_t v4;
  void *v5;

  v2 = (unsigned __int8 *)(a1 + 92);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 | 3, v2));
  if ((v3 & 2) == 0)
  {
    v4 = *(_DWORD *)(a1 + 88);
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)(a1 + 88) = 0;
    }
    v5 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

  }
}

uint64_t IOGCDeviceSetRemovalCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (atomic_load((unsigned __int8 *)(result + 92)))
    IOGCDeviceSetRemovalCallback_cold_1();
  *(_QWORD *)(result + 72) = a2;
  *(_QWORD *)(result + 80) = a3;
  return result;
}

uint64_t IOCircularDataQueueInitFixed(uint64_t a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5)
{
  uint64_t result;

  if (HIDWORD(a3))
    return 3758097090;
  result = 0;
  *(_QWORD *)a2 = a5;
  *(_QWORD *)a1 = a5;
  *(_DWORD *)(a2 + 8) = a3;
  *(_DWORD *)(a2 + 12) = a4;
  *(_DWORD *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 12) = a4;
  atomic_store(1uLL, (unint64_t *)(a1 + 16));
  atomic_store(1uLL, (unint64_t *)(a1 + 24));
  atomic_store(0, (unint64_t *)(a1 + 32));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 40));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 48));
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 56));
  return result;
}

uint64_t IOCircularDataQueueGetStartingPosition(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;

  result = 3758097095;
  if (*(_DWORD *)(a1 + 12))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 == -1)
    {
      return 3758097112;
    }
    else
    {
      result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t IOCircularDataQueueGetLatestPosition(uint64_t a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v4;

  result = 3758097095;
  if (*(_DWORD *)(a1 + 12))
  {
    v4 = atomic_load((unint64_t *)(a1 + 48));
    if (v4 == -1)
    {
      return 3758097112;
    }
    else
    {
      result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t IOCircularDataQueueReset(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 3758097109;
  if (a2 == -1)
    return 3758097090;
  v4 = atomic_load((unint64_t *)(a1 + 16));
  v5 = (unint64_t *)(a1 + 24);
  v6 = atomic_load((unint64_t *)(a1 + 24));
  if (v4 == v6)
  {
    do
    {
      v7 = __ldaxr(v5);
      if (v7 != v4)
      {
        __clrex();
        return result;
      }
    }
    while (__stlxr(v4 + 1, v5));
    v8 = atomic_load((unint64_t *)(a1 + 32));
    if (v8 <= 0)
    {
      if (*(_DWORD *)(a1 + 12))
      {
        result = 0;
        atomic_store(a2, (unint64_t *)(a1 + 40));
        atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 48));
        atomic_store(a2, (unint64_t *)(a1 + 56));
      }
      else
      {
        result = 3758097095;
      }
      ++v4;
    }
    atomic_store(v4, (unint64_t *)(a1 + 16));
  }
  return result;
}

uint64_t IOCircularDataQueueEnqueueCopy(unint64_t a1, uint64_t a2, void *__src, size_t __n)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  result = 3758097090;
  v6 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v6 != *(_DWORD *)(a2 + 8))
    return 3758097105;
  v7 = *(unsigned int *)(a1 + 12);
  if ((_DWORD)v7 != *(_DWORD *)(a2 + 12))
    return 3758097105;
  if (__n <= 0xFFFFFFC7)
  {
    v8 = (unint64_t *)(a1 + 32);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
    v10 = atomic_load((unint64_t *)(a1 + 16));
    v11 = atomic_load((unint64_t *)(a1 + 24));
    if (v10 == v11)
    {
      if ((_DWORD)v7)
      {
        if (v7 >= __n)
        {
          v12 = (unint64_t *)(a1 + 56);
          v13 = atomic_load((unint64_t *)(a1 + 56));
          if (v13 == -1)
          {
            result = 3758097112;
          }
          else
          {
            v14 = (v7 + 63) & 0x1FFFFFFF8;
            v15 = (v6 - 64) / v14;
            v16 = a1 + 64 + v13 % v15 * v14;
            v17 = a1 + v6;
            if (v16 >= a1 && v16 < v17)
            {
              do
              {
                v19 = __ldaxr(v12);
                if (v19 != v13)
                {
                  result = 3758097109;
                  goto LABEL_28;
                }
              }
              while (__stlxr(v13 + 1, v12));
              atomic_store(v13, (unint64_t *)(v16 + 40));
              *(_QWORD *)v16 = *(_QWORD *)a1;
              atomic_store(v10, (unint64_t *)(v16 + 8));
              atomic_store(v13 - 1, (unint64_t *)(v16 + 16));
              atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v16 + 24));
              *(_DWORD *)(v16 + 48) = __n;
              memcpy((void *)(v16 + 56), __src, __n);
              atomic_store(v13, (unint64_t *)(v16 + 32));
              if (v13)
                atomic_store(v13, (unint64_t *)(a1 + 64 + (v13 - 1) % v15 * v14 + 24));
              v20 = (unint64_t *)(a1 + 48);
              v21 = atomic_load((unint64_t *)(a1 + 48));
              if (v21 != -1 && v13 <= v21)
              {
LABEL_25:
                result = 0;
                goto LABEL_29;
              }
              while (1)
              {
                v23 = __ldaxr(v20);
                if (v23 != v21)
                  break;
                if (!__stlxr(v13, v20))
                  goto LABEL_25;
              }
              result = 0;
LABEL_28:
              __clrex();
            }
          }
        }
      }
      else
      {
        result = 3758097095;
      }
    }
    else
    {
      do
        v25 = __ldaxr(v8);
      while (__stlxr(v25 - 1, v8));
      result = 3758097109;
    }
    do
LABEL_29:
      v24 = __ldaxr(v8);
    while (__stlxr(v24 - 1, v8));
  }
  return result;
}

uint64_t IOCircularDataQueueCursorReset(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  result = 3758097095;
  if (*(_DWORD *)(a1 + 12))
  {
    v5 = atomic_load((unint64_t *)(a1 + 16));
    v6 = atomic_load((unint64_t *)(a1 + 40));
    v7 = atomic_load((unint64_t *)(a1 + 48));
    if (v7 == -1)
    {
      return 3758097112;
    }
    else if (v6 > a3)
    {
      return 3758097127;
    }
    else if (v7 < a3)
    {
      return 3758097128;
    }
    else
    {
      result = 0;
      *a2 = v5;
      a2[1] = a3;
    }
  }
  return result;
}

uint64_t IOCircularDataQueueCursorResetLatest(uint64_t a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;

  result = 3758097095;
  v4 = atomic_load((unint64_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 12))
  {
    v5 = atomic_load((unint64_t *)(a1 + 48));
    if (v5 == -1)
    {
      return 3758097112;
    }
    else
    {
      result = 0;
      *a2 = v4;
      a2[1] = v5;
    }
  }
  return result;
}

uint64_t IOCircularDataQueueCursorMovePrevious(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  result = 3758097095;
  v4 = atomic_load((unint64_t *)(a1 + 16));
  if (*a2 != v4)
    return 3758097131;
  if (*(_DWORD *)(a1 + 12))
  {
    v5 = atomic_load((unint64_t *)(a1 + 40));
    v6 = atomic_load((unint64_t *)(a1 + 48));
    if (v6 == -1)
    {
      return 3758097112;
    }
    else
    {
      v7 = a2[1];
      if (v7 <= v5)
      {
        return 3758097127;
      }
      else
      {
        result = 0;
        a2[1] = v7 - 1;
      }
    }
  }
  return result;
}

uint64_t IOCircularDataQueueCursorMoveNext(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  result = 3758097095;
  v4 = atomic_load((unint64_t *)(a1 + 16));
  if (*a2 != v4)
    return 3758097131;
  if (*(_DWORD *)(a1 + 12))
  {
    v5 = atomic_load((unint64_t *)(a1 + 48));
    if (v5 == -1)
    {
      return 3758097112;
    }
    else
    {
      v6 = a2[1];
      if (v6 >= v5)
      {
        return 3758097128;
      }
      else
      {
        result = 0;
        a2[1] = v6 + 1;
      }
    }
  }
  return result;
}

uint64_t IOCircularDataQueueCursorAccess(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v4 = *(unsigned int *)(a1 + 8);
  v3 = *(unsigned int *)(a1 + 12);
  v5 = atomic_load((unint64_t *)(a1 + 16));
  v6 = atomic_load((unint64_t *)(a1 + 48));
  if (*a2 != v5)
    return 3758097131;
  v7 = a2[1];
  if (v7 > v6)
    return 3758097128;
  if (!(_DWORD)v3)
    return 3758097095;
  v8 = v7 % ((v4 - 64) / ((v3 + 63) & 0x1FFFFFFF8uLL)) * ((v3 + 63) & 0x1FFFFFFF8);
  v9 = 3758097090;
  if ((v8 & 0x8000000000000000) == 0)
  {
    v10 = a1 + v8 + 64;
    if (v10 < a1 + v4)
    {
      if (*(_QWORD *)v10 != *(_QWORD *)a1)
        return 3758097105;
      v11 = atomic_load((unint64_t *)(v10 + 8));
      if (v11 == v5)
      {
        v12 = atomic_load((unint64_t *)(v10 + 32));
        v13 = atomic_load((unint64_t *)(v10 + 40));
        if (v12 != v13)
          return 3758097127;
        v9 = 3758097127;
        if (v12 == a2[1])
        {
          (*(void (**)(uint64_t, unint64_t, _QWORD))(a3 + 16))(a3, v10 + 56, *(unsigned int *)(v10 + 48));
          return 0;
        }
        return v9;
      }
      return 3758097131;
    }
  }
  return v9;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1DC7ED7CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,const __CFString *a23,uint64_t a24)
{
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;

  if (a2)
  {
    if (a2 == 2)
    {
      v27 = objc_begin_catch(exception_object);
      if (v25)
      {
        a19 = *MEMORY[0x1E0CB2D50];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *MEMORY[0x1E0CB2D68];
        a22 = (uint64_t)v28;
        a23 = CFSTR("Model build failed.  This is a #BUG.");
        v30 = *MEMORY[0x1E0CB3388];
        a20 = v29;
        a21 = v30;
        objc_msgSend(v27, "gc_error");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        a24 = (uint64_t)v31;
        objc_msgSend(*(id *)(v26 + 3504), "dictionaryWithObjects:forKeys:count:", &a22, &a19, 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v32);
        *v25 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_end_catch();
      JUMPOUT(0x1DC7ED7C0);
    }
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1DC7EDC88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7EE278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DC7EE40C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_4(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_5_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DC7EEDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_1DC7EF784(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7EF918(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7EF9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DC7EFAF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC7EFB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DC7F2870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,uint64_t a24,uint64_t a25,char a26)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1DC7F2E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DC7F30FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC7F32D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1DC7F382C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void IOGCDeviceManagerSetDispatchQueue_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN GameControllerFoundation: Already activated.";
  qword_1F039F828 = (uint64_t)"IOGCDeviceManager";
  __break(1u);
}

void IOGCDeviceManagerActivate_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN GameControllerFoundation: Queue not set.";
  qword_1F039F828 = (uint64_t)"IOGCDeviceManager";
  __break(1u);
}

void __IOGCDeviceManagerStartMatching_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "%@ IOServiceAddMatchingNotification failed: %{mach.errno}d", (uint8_t *)&v3, 0x12u);
}

void IOGCDeviceManagerSetDeviceMatchingCallback_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN GameControllerFoundation: Already activated.";
  qword_1F039F828 = (uint64_t)"IOGCDeviceManager";
  __break(1u);
}

void __IOHIDQueueInputElementValueCallback_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DC79E000, log, OS_LOG_TYPE_DEBUG, "#WARNING IOHIDQueue is full, events may have been dropped!", buf, 2u);
}

void IOGCFastPathClientCreateWithPlugInInterface_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2(&dword_1DC79E000, v0, v1, "[IOGCFastPathClient] #Error obtaining 'kIOCFPlugInInterface' from %p: %d", v2, v3);
}

void IOGCFastPathClientCreateWithPlugInInterface_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2(&dword_1DC79E000, v0, v1, "[IOGCFastPathClient] #Error obtaining 'IOGFastPathClientInterface' from %p: %d", v2, v3);
}

void IOGCFastPathClientCreateWithPlugInInterface_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathClient] The 'IOGFastPathClientInterface' obtained from the plugin object is an unsupported version: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathClientCreateWithPlugInInterface_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathClient] #Error retaining service port: %{mach.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathClientCreate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathClient] The 'IOGFastPathClientInterface' obtained from the plugin object is an unsupported version: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathClientCreate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathClient] #Error retaining service port: %{mach.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathInputQueueCreateWithOptions_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathInputQueue] #Error creating queue plugin object: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathInputQueueCreateWithOptions_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathInputQueue] #Error obtaining 'IOGFastPathQueueInterface' from queue plugin object: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathInputQueueCreateWithOptions_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "The 'IOGFastPathQueueInterface' obtained from the queue plugin object is an unsupported version: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathInputQueueRegisterDataAvailableCallback_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF IOGCFastPathInputQueue: Queue has already been activated";
  __break(1u);
}

void IOGCFastPathInputQueueSetDispatchQueue_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF IOGCFastPathInputQueue: Queue has already been activated";
  __break(1u);
}

void IOGCFastPathInputQueueSetCancelHandler_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF IOGCFastPathInputQueue: Queue has already been activated";
  __break(1u);
}

void IOGCFastPathInputQueueCancel_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF IOGCFastPathInputQueue: Queue has not been activated";
  __break(1u);
}

void IOGCFastPathReaderCreate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathReader] #Error creating reader plugin object: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathReaderCreate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathReader] #Error obtaining 'IOGCFastPathReaderInterface' from reader plugin object: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void IOGCFastPathReaderCreate_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_4(&dword_1DC79E000, v0, v1, "[IOGCFastPathReader] The 'IOGCFastPathReaderInterface' obtained from the reader plugin object is an unsupported version: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void ConnectToDriverService_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;

  unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", "void ConnectToDriverService(Protocol *__strong, __strong id<GCConfigXPCServiceInterface>, __strong id, void (^__strong)(__strong id, NSError *__strong))");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("GCConfigXPCServiceConnection.m"), 66, CFSTR("Unknown service: %@"), a1);

  __break(1u);
}

void ___ZN8Observer6CreateEU13block_pointerFv13GCFutureStateP11objc_objectP7NSErrorEPU28objcproto17OS_dispatch_queue8NSObjectj11qos_class_ti_block_invoke_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void IOGCDeviceCreate_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1DC79E000, a2, OS_LOG_TYPE_ERROR, "IOGCDevice creation failed: %@", (uint8_t *)&v3, 0xCu);
}

void IOGCDeviceCreate_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "IOGCDevice creation failed.", v1, 2u);
}

void IOGCDeviceSetDispatchQueue_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF IOGCDevice: Already activated.";
  __break(1u);
}

void IOGCDeviceActivate_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF IOGCDevice: A queue must be set before activation.";
  __break(1u);
}

void IOGCDeviceSetRemovalCallback_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF IOGCDevice: Already activated.";
  __break(1u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1E0C98D90](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1E0C99558](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x1E0CBAD30](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1E0CBAD40](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x1E0CBADA0](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1E0CBADB8](*(_QWORD *)&connect, propertyName, property);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x1E0CBAE08](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x1E0CBAE40](interface);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1E0CBAE60](device, *(_QWORD *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x1E0CBAE70](device, matching, *(_QWORD *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x1E0CBAE78](allocator, *(_QWORD *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBAE88](device, key);
}

io_service_t IOHIDDeviceGetService(IOHIDDeviceRef device)
{
  return MEMORY[0x1E0CBAEA0](device);
}

IOReturn IOHIDDeviceGetValue(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef *pValue)
{
  return MEMORY[0x1E0CBAEB0](device, element, pValue);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1E0CBAEB8](device, *(_QWORD *)&options);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1E0CBAF10](device, *(_QWORD *)&reportType, reportID, report, reportLength);
}

CFArrayRef IOHIDElementGetChildren(IOHIDElementRef element)
{
  return (CFArrayRef)MEMORY[0x1E0CBAF30](element);
}

IOHIDElementCollectionType IOHIDElementGetCollectionType(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF38](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF40](element);
}

IOHIDDeviceRef IOHIDElementGetDevice(IOHIDElementRef element)
{
  return (IOHIDDeviceRef)MEMORY[0x1E0CBAF48](element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF50](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF58](element);
}

CFStringRef IOHIDElementGetName(IOHIDElementRef element)
{
  return (CFStringRef)MEMORY[0x1E0CBAF60](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF70](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF78](element);
}

CFTypeRef IOHIDElementGetProperty(IOHIDElementRef element, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBAF80](element, key);
}

uint32_t IOHIDElementGetReportCount(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF88](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFA0](element);
}

CFTypeID IOHIDElementGetTypeID(void)
{
  return MEMORY[0x1E0CBAFA8]();
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFC0](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFC8](element);
}

Boolean IOHIDElementHasNullState(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFD0](element);
}

Boolean IOHIDElementHasPreferredState(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFD8](element);
}

Boolean IOHIDElementIsArray(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFE0](element);
}

Boolean IOHIDElementIsNonLinear(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFE8](element);
}

Boolean IOHIDElementIsRelative(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFF0](element);
}

Boolean IOHIDElementIsWrapping(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFF8](element);
}

Boolean IOHIDElementSetProperty(IOHIDElementRef element, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1E0CBB000](element, key, property);
}

void IOHIDQueueActivate(IOHIDQueueRef queue)
{
  MEMORY[0x1E0CBB430](queue);
}

void IOHIDQueueAddElement(IOHIDQueueRef queue, IOHIDElementRef element)
{
  MEMORY[0x1E0CBB438](queue, element);
}

void IOHIDQueueCancel(IOHIDQueueRef queue)
{
  MEMORY[0x1E0CBB440](queue);
}

IOHIDValueRef IOHIDQueueCopyNextValue(IOHIDQueueRef queue)
{
  return (IOHIDValueRef)MEMORY[0x1E0CBB448](queue);
}

IOHIDQueueRef IOHIDQueueCreate(CFAllocatorRef allocator, IOHIDDeviceRef device, CFIndex depth, IOOptionBits options)
{
  return (IOHIDQueueRef)MEMORY[0x1E0CBB450](allocator, device, depth, *(_QWORD *)&options);
}

IOHIDDeviceRef IOHIDQueueGetDevice(IOHIDQueueRef queue)
{
  return (IOHIDDeviceRef)MEMORY[0x1E0CBB458](queue);
}

void IOHIDQueueRegisterValueAvailableCallback(IOHIDQueueRef queue, IOHIDCallback callback, void *context)
{
  MEMORY[0x1E0CBB460](queue, callback, context);
}

void IOHIDQueueRemoveElement(IOHIDQueueRef queue, IOHIDElementRef element)
{
  MEMORY[0x1E0CBB468](queue, element);
}

void IOHIDQueueSetCancelHandler(IOHIDQueueRef queue, dispatch_block_t handler)
{
  MEMORY[0x1E0CBB470](queue, handler);
}

void IOHIDQueueSetDispatchQueue(IOHIDQueueRef queue, dispatch_queue_t dispatchQueue)
{
  MEMORY[0x1E0CBB478](queue, dispatchQueue);
}

void IOHIDQueueStart(IOHIDQueueRef queue)
{
  MEMORY[0x1E0CBB480](queue);
}

void IOHIDQueueStop(IOHIDQueueRef queue)
{
  MEMORY[0x1E0CBB488](queue);
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4B0](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4D0](service);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x1E0CBB618](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x1E0CBB620](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x1E0CBB628](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x1E0CBB630](value);
}

double_t IOHIDValueGetScaledValue(IOHIDValueRef value, IOHIDValueScaleType type)
{
  double_t result;

  MEMORY[0x1E0CBB638](value, *(_QWORD *)&type);
  return result;
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x1E0CBB640](value);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB658](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
  MEMORY[0x1E0CBB670](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x1E0CBB6A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1E0CBB6C8](*(_QWORD *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x1E0CBB6D0](*(_QWORD *)&object);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return MEMORY[0x1E0CBB6D8](*(_QWORD *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x1E0CBB6E0](*(_QWORD *)&object, *(_QWORD *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1E0CBB6F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1E0CBB8F0](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x1E0CBB938](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1E0CBB988](*(_QWORD *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1E0CBB9B0](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1E0CBB9C8](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _IOHIDElementGetFlags()
{
  return MEMORY[0x1E0CBBA50]();
}

uint64_t _IOHIDElementGetLength()
{
  return MEMORY[0x1E0CBBA58]();
}

uint64_t _IOHIDElementGetValue()
{
  return MEMORY[0x1E0CBBA60]();
}

uint64_t _IOHIDQueueCopyElements()
{
  return MEMORY[0x1E0CBBA90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _objc_rootRetainCount()
{
  return MEMORY[0x1E0DE7A20]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1E0DE7A90](cls, extraBytes);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

uint64_t dispatch_block_create_with_voucher()
{
  return MEMORY[0x1E0C82C70]();
}

uint64_t dispatch_block_create_with_voucher_and_qos_class()
{
  return MEMORY[0x1E0C82C78]();
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
  MEMORY[0x1E0C82C88](flags, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1E0C82DB8]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1E0C82DC0]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1E0C82DC8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C82DE8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1E0C82E60](queue, relative_priority_ptr);
}

uint64_t dispatch_queue_set_label_nocopy()
{
  return MEMORY[0x1E0C82E78]();
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

uint64_t dispatch_workloop_copy_current()
{
  return MEMORY[0x1E0C82FD0]();
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1E0C830F8]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1E0C83C98](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C83DD8](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x1E0DE7C00](cls, bytes);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x1E0DE7C68](obj);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty(id self, SEL _cmd, ptrdiff_t offset, id newValue, BOOL atomic, char shouldCopy)
{
  MEMORY[0x1E0DE7F80](self, _cmd, offset, newValue, atomic, shouldCopy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1E0DE8028](obj);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1E0DE8030](a1, a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x1E0C84D98](__pthread, __qos_class, __relative_priority);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80D0](str);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return MEMORY[0x1E0C85D78]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

uint64_t xpc_activity_remove_eligibility_changed_handler()
{
  return MEMORY[0x1E0C85DA0]();
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x1E0C85DA8]();
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1E0C86200]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1E0C86258]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1E0C86378]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

