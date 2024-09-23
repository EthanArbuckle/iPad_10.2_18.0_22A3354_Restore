void sub_214475E94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21447611C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_214476288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_214476484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_214476824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_214476AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_214476C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_214476D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_214478320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21447AF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21447B0AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21447B444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21447B59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21447B6A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21447B750(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21447C988(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_21447C9A0(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21447C94CLL);
}

void sub_21447CAA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21447DCD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _MXMGetLog()
{
  if (_MXMGetLog_onceToken != -1)
    dispatch_once(&_MXMGetLog_onceToken, &__block_literal_global_4);
  return _MXMGetLog__defaultLogger;
}

uint64_t _MXMGetInstrumentsLog()
{
  if (_MXMGetInstrumentsLog_onceToken != -1)
    dispatch_once(&_MXMGetInstrumentsLog_onceToken, &__block_literal_global_3);
  return _MXMGetInstrumentsLog__instrumentsLogger;
}

void sub_214480EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_21448161C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21448188C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214481B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_214482E64(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;
  id *v7;

  v7 = v4;
  objc_destroyWeak(v7);
  objc_destroyWeak(v5);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_21448860C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_214488A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a30);
  _Unwind_Resume(a1);
}

void sub_2144891DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MXMRunBlockIteration(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  BOOL v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v27[16];
  __int128 v28;
  uint8_t buf[16];

  _MXMGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214474000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Instrument_Iteration", (const char *)&unk_21449205B, buf, 2u);
  }

  if (!*(_QWORD *)(a1 + 40) && !*(_DWORD *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 32))
      v5 = *(_QWORD *)(a1 + 24) == 1;
    else
      v5 = 0;
    v6 = *(void **)(a1 + 128);
    if (!v6)
      goto LABEL_28;
    if (!*(_QWORD *)(a1 + 136))
      v5 = 0;
    if (!v5)
    {
LABEL_28:
      _MXMGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v3 = 2;
        _os_log_impl(&dword_214474000, v7, OS_LOG_TYPE_ERROR, "Bad state detected for iteration structure.", buf, 2u);
      }
      else
      {
        v3 = 2;
      }
LABEL_41:

      return v3;
    }
    v7 = v6;
    v8 = *(id *)(a1 + 136);
    v9 = *(void **)(a1 + 144);
    if (v9)
      v10 = v9;
    v11 = (void (**)(_QWORD))_Block_copy(v9);
    *(_DWORD *)(a1 + 16) = MEMORY[0x2199CE344]();
    if ((*(_BYTE *)(a1 + 120) & 1) != 0)
    {
      *(_QWORD *)(a1 + 24) = 2;
      -[NSObject _transitionWithState:iteration:instrumentals:](v7, "_transitionWithState:iteration:instrumentals:", 1, a1, v8);
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    }
    memset(buf, 0, sizeof(buf));
    v28 = 0uLL;
    _MXMGetInstrumentsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_214474000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Instrument_Iteration_User_Work", (const char *)&unk_21449205B, v27, 2u);
    }

    v14 = (void *)MEMORY[0x2199CE3C8]();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = mach_continuous_time();
    v17 = mach_absolute_time();
    thread_selfcounts();
    if ((*(_BYTE *)(a1 + 120) & 1) != 0)
    {
      *(_QWORD *)(a1 + 40) = v17;
      *(_OWORD *)(a1 + 88) = *(_OWORD *)buf;
      *(_QWORD *)(a1 + 56) = v16;
      *(_QWORD *)(a1 + 72) = v15;
    }
    v11[2](v11);
    thread_selfcounts();
    v18 = mach_absolute_time();
    v19 = mach_continuous_time();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v14);
    _MXMGetInstrumentsLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_214474000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Instrument_Iteration_User_Work", (const char *)&unk_21449205B, v27, 2u);
    }

    v22 = *(_QWORD *)(a1 + 120);
    if ((v22 & 1) != 0)
    {
      if ((v22 & 2) == 0)
      {
        if (*(_QWORD *)(a1 + 80))
          v3 = 0;
        else
          v3 = 5;
        goto LABEL_38;
      }
    }
    else
    {
      if (!*(_QWORD *)(a1 + 72))
      {
        v3 = 5;
        goto LABEL_38;
      }
      if ((v22 & 2) == 0)
      {
LABEL_36:
        v3 = 0;
LABEL_38:

        _MXMGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v26))
        {
          *(_WORD *)v27 = 0;
          _os_signpost_emit_with_name_impl(&dword_214474000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Instrument_Iteration", (const char *)&unk_21449205B, v27, 2u);
        }

        goto LABEL_41;
      }
    }
    *(_OWORD *)(a1 + 104) = v28;
    *(_QWORD *)(a1 + 48) = v18;
    *(_QWORD *)(a1 + 80) = v20;
    *(_QWORD *)(a1 + 64) = v19;
    -[NSObject _transitionWithState:iteration:instrumentals:](v7, "_transitionWithState:iteration:instrumentals:", 2, a1, v8);
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject _transitionWithState:iteration:instrumentals:](v7, "_transitionWithState:iteration:instrumentals:", 3, a1, v8);
    v24 = objc_claimAutoreleasedReturnValue();
    -[NSObject _transitionWithState:iteration:instrumentals:](v7, "_transitionWithState:iteration:instrumentals:", 4, a1, v8);
    v25 = objc_claimAutoreleasedReturnValue();
    dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_36;
  }
  return 1;
}

void sub_214489ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

uint64_t CARenderServerGetFrameCounterByIndex()
{
  return MEMORY[0x24BDE5538]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

kern_return_t host_processor_info(host_t host, processor_flavor_t flavor, natural_t *out_processor_count, processor_info_array_t *out_processor_info, mach_msg_type_number_t *out_processor_infoCnt)
{
  return MEMORY[0x24BDAE808](*(_QWORD *)&host, *(_QWORD *)&flavor, out_processor_count, out_processor_info, out_processor_infoCnt);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x24BDAE828](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info64_out, host_info64_outCnt);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x24BDAEB68]();
}

kern_return_t mach_port_space_basic_info(ipc_space_inspect_t task, ipc_info_space_basic_t *basic_info)
{
  return MEMORY[0x24BDAEC20](*(_QWORD *)&task, basic_info);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x24BDAEC60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDAEC78](*(_QWORD *)&target, address, size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x24BDAF238](__bufp, __sizep);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

uint64_t pdwriter_close()
{
  return MEMORY[0x24BECE1D0]();
}

uint64_t pdwriter_new_value()
{
  return MEMORY[0x24BECE1D8]();
}

uint64_t pdwriter_open_stream()
{
  return MEMORY[0x24BECE1E8]();
}

uint64_t pm_sample_task_and_pid()
{
  return MEMORY[0x24BEDD628]();
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6D8](*(_QWORD *)&type, *(_QWORD *)&typeinfo, buffer, *(_QWORD *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x24BDAF6E8](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x24BDAF720]();
}

kern_return_t processor_set_default(host_t host, processor_set_name_t *default_set)
{
  return MEMORY[0x24BDAF758](*(_QWORD *)&host, default_set);
}

kern_return_t processor_set_statistics(processor_set_name_t pset, processor_set_flavor_t flavor, processor_set_info_t info_out, mach_msg_type_number_t *info_outCnt)
{
  return MEMORY[0x24BDAF760](*(_QWORD *)&pset, *(_QWORD *)&flavor, info_out, info_outCnt);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x24BDAF798](__attr, *(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7B8](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x24BDB0160](*(_QWORD *)&target_tport, *(_QWORD *)&pid, t);
}

uint64_t thread_selfcounts()
{
  return MEMORY[0x24BDB0230]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3228](__A, __I, __C, __N);
}

void vDSP_minvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3268](__A, __IA, __C, __N);
}

void vDSP_normalizeD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, double *__Mean, double *__StandardDeviation, vDSP_Length __N)
{
  MEMORY[0x24BDB32B8](__A, __IA, __C, __IC, __Mean, __StandardDeviation, __N);
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D8](__A, __I, __C, __N);
}

