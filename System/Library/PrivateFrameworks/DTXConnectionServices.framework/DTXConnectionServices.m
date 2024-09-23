uint64_t sub_21DC86AEC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_messageReceived_, a2);
}

void *sub_21DC86D84(void *a1, compression_algorithm a2)
{
  char *v3;
  void *v4;
  uint64_t v5;
  unint64_t *v6;
  size_t v7;
  unint64_t v8;
  void *v9;

  v3 = a1;
  v4 = v3;
  if (a2 == COMPRESSION_LZ4)
  {
    v5 = 16;
  }
  else
  {
    if (a2 != COMPRESSION_LZFSE)
      sub_21DCA0288();
    v5 = 8;
  }
  v6 = (unint64_t *)&v3[v5];
  v7 = compression_encode_scratch_buffer_size(a2);
  v8 = atomic_load(v6);
  do
  {
    v9 = (void *)__ldaxr(v6);
    if (v9 != (void *)v8)
    {
      __clrex();
      goto LABEL_11;
    }
  }
  while (__stlxr(0, v6));
  if (v9)
    goto LABEL_12;
LABEL_11:
  v9 = malloc_type_malloc(v7, 0x2E4A8856uLL);
LABEL_12:

  return v9;
}

void sub_21DC86E28(void *a1, int a2, void *a3)
{
  char *v5;
  uint64_t v6;
  unint64_t *v7;
  char *v9;

  v5 = a1;
  if (a3)
  {
    if (a2 == 256)
    {
      v6 = 16;
    }
    else
    {
      if (a2 != 2049)
        sub_21DCA02B0();
      v6 = 8;
    }
    v7 = (unint64_t *)&v5[v6];
    while (!__ldaxr(v7))
    {
      if (!__stlxr((unint64_t)a3, v7))
        goto LABEL_11;
    }
    __clrex();
    v9 = v5;
    free(a3);
    v5 = v9;
  }
LABEL_11:

}

void sub_21DC87364(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_21DC87378(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DC87404(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) & 0xC) == 0)
  {
    v2 = MEMORY[0x22079E258](*(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

  }
}

void sub_21DC874F8(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  char v4;
  id v5;
  void *v6;

  v1 = a1[4];
  if ((*(_BYTE *)(v1 + 36) & 0xC) == 0)
  {
    v3 = (void *)a1[5];
    if (v3)
    {
      v4 = 2;
    }
    else
    {
      v3 = (void *)a1[6];
      v4 = 1;
    }
    v5 = v3;
    v6 = *(void **)(v1 + 8);
    *(_QWORD *)(v1 + 8) = v5;

    *(_BYTE *)(a1[4] + 36) = *(_BYTE *)(a1[4] + 36) & 0xFC | v4;
  }
}

void sub_21DC87614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC8762C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DC8763C(uint64_t a1)
{

}

void sub_21DC87644(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id v16;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) & 8) == 0)
  {
    v2 = dispatch_semaphore_create(0);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_21DC87780;
    v13[3] = &unk_24E1AAA00;
    v13[4] = *(_QWORD *)(a1 + 40);
    v6 = (void *)MEMORY[0x22079E258](v13);
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v8 = v6;
    v9 = v8;
    if (v8 && v7)
    {
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = sub_21DC877CC;
      v14[3] = &unk_24E1AAA50;
      v15 = v7;
      v16 = v9;
      v10 = MEMORY[0x22079E258](v14);

    }
    else
    {
      if (v7)
        v8 = v7;
      v10 = MEMORY[0x22079E258](v8);
    }

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

  }
}

intptr_t sub_21DC87780(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t sub_21DC877CC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_21DC8793C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_21DC87958(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  const char *v5;
  void *v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend__validateDispatch_(WeakRetained, v5, (uint64_t)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sub_21DC87A40(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_cancel(*(void **)(*(_QWORD *)(a1 + 32) + 24), a2, a3);
}

void sub_21DC880C8(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;

  v13 = a2;
  objc_msgSend_error(v13, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((id)kDTXInterruptionMessage == v13)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v5, (uint64_t)CFSTR("DTXProxyChannel"), 1, &unk_24E1B0288);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend__allowedClassesForReturnValues(*(void **)(a1 + 32), v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectWithAllowedClasses_(v13, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_invokeCompletionWithReturnValue_error_(*(void **)(a1 + 40), v12, (uint64_t)v11, v7);
}

void sub_21DC885C0(uint64_t a1)
{
  mach_msg_header_t *v2;
  unsigned int *p_msgh_bits;
  mach_port_name_t v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD block[5];

  v2 = (mach_msg_header_t *)malloc_type_malloc(0x8000uLL, 0x1000040B0612BB1uLL);
  p_msgh_bits = &v2->msgh_bits;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v4 + 1 < 2 || mach_msg(v2, 258, 0, 0x8000u, v4, 1u, 0))
  {
    free(p_msgh_bits);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 64);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21DC886D4;
    block[3] = &unk_24E1AAAC8;
    block[4] = v6;
    dispatch_async(v7, block);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = p_msgh_bits[6];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_21DC886DC;
    v10[3] = &unk_24E1AAAE8;
    v10[4] = p_msgh_bits;
    objc_msgSend_received_ofLength_destructor_(v8, v5, (uint64_t)(p_msgh_bits + 7), v9, v10);
  }
}

uint64_t sub_21DC886D4(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_disconnect(*(void **)(a1 + 32), a2, a3);
}

void sub_21DC886DC(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void sub_21DC886E4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC88744;
  block[3] = &unk_24E1AAAC8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t sub_21DC88744(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_disconnect(*(void **)(a1 + 32), a2, a3);
}

void sub_21DC88814(void *a1)
{
  dispatch_queue_t v1;
  void *v2;
  dispatch_queue_t v3;
  void *v4;
  _QWORD *v5;

  v5 = a1;
  v1 = dispatch_queue_create("DTXMachTransport input queue", 0);
  v2 = (void *)v5[7];
  v5[7] = v1;

  v3 = dispatch_queue_create("DTXMachTransport output queue", 0);
  v4 = (void *)v5[8];
  v5[8] = v3;

  v5[13] = malloc_type_malloc(0x8000uLL, 0x1000040B0612BB1uLL);
}

uint64_t sub_21DC88F4C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  mach_port_name_t v3;
  mach_port_name_t v4;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  v3 = *(_DWORD *)(v2 + 48);
  if (v3 + 1 >= 2)
  {
    result = mach_port_mod_refs(*MEMORY[0x24BDAEC58], v3, 1u, -1);
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 48) = 0;
    v2 = *(_QWORD *)(v1 + 32);
  }
  v4 = *(_DWORD *)(v2 + 52);
  if (v4 + 1 >= 2)
  {
    result = mach_port_deallocate(*MEMORY[0x24BDAEC58], v4);
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 52) = 0;
  }
  return result;
}

uint64_t sub_21DC89104(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  mach_port_name_t v3;
  mach_port_name_t v4;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  v3 = *(_DWORD *)(v2 + 48);
  if (v3 + 1 >= 2)
  {
    result = mach_port_mod_refs(*MEMORY[0x24BDAEC58], v3, 1u, -1);
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 48) = 0;
    v2 = *(_QWORD *)(v1 + 32);
  }
  v4 = *(_DWORD *)(v2 + 52);
  if (v4 + 1 >= 2)
  {
    result = mach_port_deallocate(*MEMORY[0x24BDAEC58], v4);
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 52) = 0;
  }
  return result;
}

uint64_t sub_21DC8924C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DC8925C(uint64_t a1)
{

}

void sub_21DC89264(uint64_t a1)
{
  __int128 v1;
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_21DC892C8;
  v3[3] = &unk_24E1AAA28;
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  v4 = v1;
  dispatch_sync(v2, v3);
}

uint64_t sub_21DC892C8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_DWORD *)(v1 + 52) + 1) >= 2 && (*(_DWORD *)(v1 + 48) + 1) >= 2)
  {
    v2 = result;
    v3 = xpc_dictionary_create(0, 0, 0);
    v4 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    xpc_dictionary_set_mach_send();
    result = xpc_dictionary_set_mach_recv();
    *(_DWORD *)(*(_QWORD *)(v2 + 32) + 48) = 0;
  }
  return result;
}

void sub_21DC895E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = 0;

  }
}

void sub_21DC89634(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 80);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC896B8;
  block[3] = &unk_24E1AAAC8;
  block[4] = v2;
  dispatch_sync(v4, block);
}

void sub_21DC896B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = 0;

  }
}

void sub_21DC89B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC89B98(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 32));
  return close(*(_DWORD *)(a1 + 36));
}

uint64_t sub_21DC89F8C(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 32));
  return close(*(_DWORD *)(a1 + 36));
}

void sub_21DC8A0C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC8A0DC(mach_port_name_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t, int, int, uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  _BYTE msg[32];
  __int128 v23;

  v3 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -1;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v14 = sub_21DC8AB3C;
  v15 = &unk_24E1AABB0;
  v17 = &v18;
  v4 = v3;
  v16 = v4;
  v5 = v13;
  v23 = 0u;
  memset(msg, 0, sizeof(msg));
  if (mach_msg((mach_msg_header_t *)msg, 2, 0, 0x30u, a1, 0, 0) || *(_DWORD *)&msg[20] == 70)
  {
    v14((uint64_t)v5, 0, 4, 0);
  }
  else
  {
    v6 = 0;
    v7 = 4;
    if (HIDWORD(v23) + *(_DWORD *)&msg[4] == 48)
    {
      v8 = 0;
      if (*(_DWORD *)&msg[24] == 1)
      {
        if (!HIBYTE(DWORD1(v23))
          && ((v9 = HIWORD(DWORD1(v23)), (HIWORD(DWORD1(v23)) - 22) < 0xFFFFFFFA)
           || (*(_DWORD *)msg & 0x80000000) != 0))
        {
          if (v9 == 16)
            v10 = 1;
          else
            v10 = 4 * ((v9 - 17) > 4);
          if (*(int *)msg >= 0)
            v7 = 6;
          else
            v7 = v10;
          v6 = *(unsigned int *)&msg[28];
          v8 = *(unsigned int *)&msg[8];
        }
        else
        {
          v6 = 0;
          v8 = 0;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    v14((uint64_t)v5, v6, v7, v8);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  v11 = *((unsigned int *)v19 + 6);
  _Block_object_dispose(&v18, 8);

  return v11;
}

void sub_21DC8A294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC8A2AC(uint64_t a1, int a2)
{
  uint64_t result;

  result = sub_21DC8A2E0(a2, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_21DC8A2E0(int a1, int a2)
{
  int v4;
  uint64_t result;
  const char *v6;
  pid_t v7;
  int *v8;
  char *v9;
  int v10;
  mach_msg_return_t v11;
  mach_error_t v12;
  const char *v13;
  pid_t v14;
  char *v15;
  int v16;
  int v17;
  int v18[2];
  uint8_t v19[4];
  const char *v20;
  __int16 v21;
  pid_t v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  mach_error_t v26;
  _BYTE buf[12];
  __int128 v28;
  _DWORD v29[3];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = pipe(v18);
  result = 0xFFFFFFFFLL;
  if (!v4 && (v18[0] & 0x80000000) == 0)
  {
    if (v18[1] < 0)
      return 0xFFFFFFFFLL;
    if (fileport_makeport())
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v6 = getprogname();
        v7 = getpid();
        v8 = __error();
        v9 = strerror(*v8);
        v10 = *__error();
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v6;
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v7;
        WORD3(v28) = 2080;
        *((_QWORD *)&v28 + 1) = v9;
        LOWORD(v29[0]) = 1024;
        *(_DWORD *)((char *)v29 + 2) = v10;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s(%d) [error]: '_send_fd' failed: %s (%d)\n", buf, 0x22u);
      }
      goto LABEL_12;
    }
    *(_QWORD *)((char *)&v28 + 4) = 0;
    HIDWORD(v28) = 1;
    *(_QWORD *)&v29[1] = 0x13000000000000;
    *(_DWORD *)&buf[8] = a1;
    LODWORD(v28) = a2;
    *(_QWORD *)buf = 0x2880001413;
    v29[0] = 0;
    v11 = mach_msg_send((mach_msg_header_t *)buf);
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v13 = getprogname();
        v14 = getpid();
        v15 = mach_error_string(v12);
        *(_DWORD *)v19 = 136315906;
        v20 = v13;
        v21 = 1024;
        v22 = v14;
        v23 = 2080;
        v24 = v15;
        v25 = 1024;
        v26 = v12;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n", v19, 0x22u);
      }
      mach_port_deallocate(*MEMORY[0x24BDAEC58], 0);
      goto LABEL_12;
    }
    mach_port_deallocate(*MEMORY[0x24BDAEC58], 0);
    v16 = v18[0];
    if ((v18[0] & 0x80000000) == 0)
    {
      v17 = fcntl(v18[0], 3);
      if ((v17 & 4) == 0)
      {
        fcntl(v16, 4, v17 | 4u);
LABEL_19:
        if ((v18[0] & 0x80000000) == 0 && fcntl(v18[0], 2, 1) != -1)
          goto LABEL_13;
        goto LABEL_12;
      }
      if (v17 != -1)
        goto LABEL_19;
    }
LABEL_12:
    close(v18[0]);
    v18[0] = -1;
LABEL_13:
    close(v18[1]);
    return v18[0];
  }
  return result;
}

uint64_t sub_21DC8A56C(uint64_t a1)
{
  close(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return close(*(_DWORD *)(a1 + 40));
}

void sub_21DC8A8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_21DC8A910(uint64_t a1, mach_port_name_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  DTXFileDescriptorTransport *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  int v14;
  int v15;

  v4 = sub_21DC8A2E0(*(_DWORD *)(a1 + 40), a2);
  if ((v4 & 0x80000000) == 0)
  {
    v5 = v4;
    v6 = sub_21DC8A0DC(a2, 0);
    if ((v6 & 0x80000000) != 0)
    {
      close(v5);
    }
    else
    {
      v7 = v6;
      v8 = [DTXFileDescriptorTransport alloc];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_21DC8A9DC;
      v13[3] = &unk_24E1AAAE8;
      v14 = v5;
      v15 = v7;
      v10 = objc_msgSend_initWithIncomingFileDescriptor_outgoingFileDescriptor_disconnectBlock_(v8, v9, v5, v7, v13);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }
}

uint64_t sub_21DC8A9DC(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 32));
  return close(*(_DWORD *)(a1 + 36));
}

uint64_t sub_21DC8AA94(uint64_t result, int a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t v4;
  int v5;
  _DWORD *v6;

  v4 = result;
  if (a2 != 2)
    goto LABEL_13;
  result = *a3;
  if ((result + 1) < 2 || *a4 || a3[1] + 1 < 2 || a4[1])
    goto LABEL_13;
  v5 = fileport_makefd();
  result = fileport_makefd();
  if (v5 < 0)
  {
    if ((result & 0x80000000) != 0)
      goto LABEL_13;
  }
  else
  {
    if ((result & 0x80000000) == 0)
    {
      v6 = *(_DWORD **)(v4 + 48);
      **(_DWORD **)(v4 + 40) = v5;
      *v6 = result;
      return result;
    }
    LODWORD(result) = v5;
  }
  result = close(result);
LABEL_13:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24) = 5;
  return result;
}

uint64_t sub_21DC8AB3C(uint64_t result, int a2, int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  int v8;

  if ((a2 + 1) >= 2 && a3 == 0)
  {
    v6 = result;
    result = fileport_makefd();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = result;
    v7 = *(_QWORD *)(*(_QWORD *)(v6 + 40) + 8);
    v8 = *(_DWORD *)(v7 + 24);
    if ((v8 & 0x80000000) == 0)
    {
      result = fcntl(*(_DWORD *)(v7 + 24), 3);
      if ((result & 4) != 0)
      {
        if ((_DWORD)result == -1)
        {
          result = close(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24));
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = -1;
        }
      }
      else
      {
        result = fcntl(v8, 4, result | 4);
      }
    }
    if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) & 0x80000000) == 0)
    {
      result = *(_QWORD *)(v6 + 32);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
    }
  }
  return result;
}

void sub_21DC8AC24(uint64_t a1, uint64_t a2, void *a3)
{
  uintptr_t v5;
  NSObject *v6;
  id v7;
  NSObject *source;

  v5 = *(unsigned int *)(a1 + 40);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a3;
  source = dispatch_source_create(MEMORY[0x24BDAC9E8], v5, 1uLL, v6);

  dispatch_source_set_event_handler(source, v7);
  dispatch_activate(source);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  dispatch_source_cancel(source);

}

void sub_21DC8ACD4(uint64_t a1)
{
  unsigned __int8 *v2;
  mach_port_name_t v4;
  ipc_space_t *v5;
  kern_return_t v6;
  mach_error_t v7;
  kern_return_t v8;
  mach_error_t v9;
  const char *v10;
  pid_t v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  pid_t v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  mach_error_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, v2));
  v4 = *(_DWORD *)(a1 + 40);
  if (v4 + 1 >= 2)
  {
    v5 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    v6 = mach_port_mod_refs(*MEMORY[0x24BDAEC58], v4, 1u, -1);
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v13 = 136315906;
        v14 = getprogname();
        v15 = 1024;
        v16 = getpid();
        v17 = 2080;
        v18 = mach_error_string(v7);
        v19 = 1024;
        v20 = v7;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_mod_refs' failed: %s (%d)\n", (uint8_t *)&v13, 0x22u);
      }
    }
    v8 = mach_port_deallocate(*v5, *(_DWORD *)(a1 + 40));
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v10 = getprogname();
        v11 = getpid();
        v12 = mach_error_string(v9);
        v13 = 136315906;
        v14 = v10;
        v15 = 1024;
        v16 = v11;
        v17 = 2080;
        v18 = v12;
        v19 = 1024;
        v20 = v9;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_deallocate' failed: %s (%d)\n", (uint8_t *)&v13, 0x22u);
      }
    }
  }
}

void sub_21DC8AF6C(_DWORD *a1)
{
  _QWORD *v1;
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;

  a1[10] = 2;
  v1 = a1;
  v2 = dispatch_queue_create("transport handler guard", 0);
  v3 = (void *)v1[2];
  v1[2] = v2;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("transport incoming serializer queue (%@)"), v5);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend_UTF8String(v17, v7, v8);
  v10 = dispatch_queue_create(v9, 0);
  dispatch_suspend(v10);
  v11 = (void *)v1[1];
  v1[1] = v10;
  v12 = v10;

  v13 = (void *)objc_opt_new();
  objc_msgSend_suspendLimits(v13, v14, v15);
  v16 = (void *)v1[3];
  v1[3] = v13;

}

void sub_21DC8B15C(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4;

  objc_msgSend_dataReceivedHandler(*(void **)(a1 + 32), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  free(*(void **)(a1 + 40));

}

void sub_21DC8B384(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_dataReceivedHandler(*(void **)(a1 + 32), a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    if (!*(_QWORD *)(a1 + 56))
      objc_msgSend_setDataReceivedHandler_(*(void **)(a1 + 32), v4, 0);
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    objc_msgSend_releaseSize_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v4, v5);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void sub_21DC8B488(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 44))
  {
    *(_BYTE *)(v1 + 44) = 1;
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  }
}

uint64_t sub_21DC8B5C0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_21DC8B64C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  if (v5)
  {
    *(_QWORD *)(v4 + 32) = 0;

  }
  else if (*(_QWORD *)(a1 + 40) && !*(_BYTE *)(v4 + 44))
  {
    *(_BYTE *)(v4 + 44) = 1;
    objc_msgSend_resumeLimits(*(void **)(*(_QWORD *)(a1 + 32) + 24), a2, a3);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  }
  v6 = *(_BYTE **)(a1 + 32);
  if (v6[44] && objc_msgSend_status(v6, a2, a3) == 3)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0);
  }
  else
  {
    v8 = MEMORY[0x22079E258](*(_QWORD *)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

  }
}

uint64_t sub_21DC8B7BC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x22079E258](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_21DC8B7E4(uint64_t a1)
{

}

void sub_21DC8B7EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x22079E258](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

double DTXPrimitiveArrayCreate()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_realloc(0, 0x200uLL, 0x555093E9uLL);
  *(_QWORD *)&result = 496;
  *v0 = xmmword_21DCA2160;
  return result;
}

void DTXPrimitiveArrayDestroy(void *a1)
{
  if (a1)
    free(a1);
}

unint64_t *DTXPrimitiveArrayCreateWithTypesAndValues(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  unint64_t *v10;

  v10 = (unint64_t *)malloc_type_realloc(0, 0x200uLL, 0x555093E9uLL);
  *(_OWORD *)v10 = xmmword_21DCA2160;
  return sub_21DC8B9A0(v10, 0, a1, &a9);
}

unint64_t *sub_21DC8B9A0(unint64_t *ptr, unsigned int a2, int a3, const char **a4)
{
  unsigned int v5;
  unsigned int v6;
  const char **v7;
  const char *v8;
  size_t v9;
  unint64_t *v10;
  int v11;
  char *v12;
  const char **v13;
  const char **v14;
  const char **v15;
  const char **v16;
  const char *v18;
  const char **v19;

  v19 = a4;
  if (a2)
    v5 = a2;
  else
    v5 = -1;
  if (a3)
  {
    v6 = 0;
    do
    {
      switch(a3)
      {
        case 1:
          v7 = v19++;
          v8 = *v7;
          v9 = strlen(*v7) + 1;
          v10 = ptr;
          v11 = 1;
          v12 = (char *)v8;
          goto LABEL_13;
        case 3:
          v13 = v19++;
          LODWORD(v18) = *(_DWORD *)v13;
          v12 = (char *)&v18;
          v10 = ptr;
          v11 = 3;
          v9 = 4;
          goto LABEL_13;
        case 6:
          v14 = v19++;
          v18 = *v14;
          v12 = (char *)&v18;
          v10 = ptr;
          v11 = 6;
          goto LABEL_11;
        case 9:
          v15 = v19++;
          v18 = *v15;
          v12 = (char *)&v18;
          v10 = ptr;
          v11 = 9;
LABEL_11:
          v9 = 8;
          goto LABEL_13;
        case 10:
          v10 = ptr;
          v11 = 10;
          v12 = 0;
          v9 = 0;
LABEL_13:
          ptr = sub_21DC8BB78(v10, v11, v12, v9);
          ++v6;
          break;
        default:
          break;
      }
      v16 = v19++;
      if (v6 >= v5)
        break;
      a3 = *(_DWORD *)v16;
    }
    while (*(_DWORD *)v16);
  }
  return ptr;
}

unint64_t *DTXPrimitiveArrayAppendValues(unint64_t *result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  _QWORD *v9;

  if (result)
  {
    v9 = result;
    if (!*result)
    {
      result = sub_21DC8B9A0((unint64_t *)*result, 0, a2, &a9);
      *v9 = result;
    }
  }
  return result;
}

_QWORD *DTXPrimitiveArrayAppendBuffer(_QWORD *result, void *__src, size_t __n)
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    if (!*result)
    {
      result = sub_21DC8BB78(0, 2, __src, __n);
      *v3 = result;
    }
  }
  return result;
}

_QWORD *sub_21DC8BB78(unint64_t *ptr, int a2, void *__src, size_t __n)
{
  int v4;
  _QWORD *v7;
  unsigned int v8;
  size_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  _DWORD *v14;
  char *v15;

  v4 = __n;
  v7 = ptr;
  v8 = a2 - 1;
  if (ptr)
  {
    v9 = __n;
    v10 = ptr[1];
    v11 = __n + 4 * (v8 < 2) + v10 + 4;
    if (*ptr >= v11)
      goto LABEL_9;
  }
  else
  {
    v10 = 0;
    v9 = __n;
    v11 = __n + 4 * (v8 < 2) + 4;
  }
  v12 = (v11 + 527) & 0xFFFFFFFFFFFFFE00;
  if (v12)
    v13 = v12;
  else
    v13 = 256;
  v7 = malloc_type_realloc(ptr, v13, 0x555093E9uLL);
  *v7 = v13 - 16;
  v7[1] = v10;
LABEL_9:
  v14 = (_DWORD *)((char *)v7 + v10 + 16);
  *v14 = a2;
  v15 = (char *)(v14 + 1);
  if (v8 <= 1)
  {
    v14[1] = v4;
    v15 = (char *)(v14 + 2);
  }
  if (v4)
  {
    memcpy(v15, __src, v9);
    v15 += v9;
  }
  v7[1] = v15 - (char *)(v7 + 2);
  return v7;
}

CFDataRef _createObjectFromPrimitiveType(int a1, char *cStr, CFIndex length)
{
  uint64_t v3;
  uint64_t v4;
  CFNumberType v6;
  CFDataRef result;
  _QWORD valuePtr[3];

  switch(a1)
  {
    case 1:
      return (CFDataRef)CFStringCreateWithCString(0, cStr, 0x8000100u);
    case 2:
      return CFDataCreate(0, (const UInt8 *)cStr, length);
    case 3:
      v6 = kCFNumberSInt32Type;
      goto LABEL_9;
    case 4:
      valuePtr[1] = v3;
      valuePtr[2] = v4;
      valuePtr[0] = *(unsigned int *)cStr;
      return CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
    case 5:
    case 6:
    case 7:
    case 8:
      v6 = kCFNumberSInt64Type;
      goto LABEL_9;
    case 9:
      v6 = kCFNumberDoubleType;
LABEL_9:
      result = CFNumberCreate(0, v6, cStr);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

CFArrayRef CFArrayCreateWithDTXPrimitiveArray(uint64_t a1)
{
  unsigned int v2;
  const void **v3;
  unsigned int v4;
  CFArrayRef v5;
  unsigned int i;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v2 = sub_21DC8BE60(a1);
  if (!v2)
    return CFArrayCreate(0, 0, 0, MEMORY[0x24BDBD690]);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v3 = (const void **)malloc_type_malloc(8 * v2, 0x80040B8603338uLL);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = sub_21DC8C0BC;
  v8[3] = &unk_24E1AACA0;
  v8[4] = &v9;
  v8[5] = v3;
  sub_21DC8BEF4(a1, (uint64_t)v8);
  v4 = *((_DWORD *)v10 + 6);
  v5 = CFArrayCreate(0, v3, v4, MEMORY[0x24BDBD690]);
  *((_DWORD *)v10 + 6) = 0;
  if (v4)
  {
    for (i = 0; i < v4; *((_DWORD *)v10 + 6) = i)
    {
      CFRelease(v3[i]);
      i = *((_DWORD *)v10 + 6) + 1;
    }
  }
  free(v3);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_21DC8BE60(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  if (!a1)
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = sub_21DC8C698;
  v3[3] = &unk_24E1AAD18;
  v3[4] = &v4;
  sub_21DC8BEF4(a1, (uint64_t)v3);
  v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DC8BEF4(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const void *v10;
  size_t v11;
  char *v12;
  char *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a1 && *(_QWORD *)(a1 + 8))
  {
    v4 = 0;
    v5 = a1 + 16;
    do
    {
      v6 = *(unsigned int *)(v4 + v5);
      v7 = v4 + 4;
      if ((v6 - 1) > 1)
      {
        if (v6 > 9 || ((1 << v6) & 0x340) == 0)
        {
          v8 = 4 * ((_DWORD)v6 != 10);
          if (a2)
          {
LABEL_16:
            if ((_DWORD)v8)
            {
              if ((_DWORD)v6 != 1)
              {
                v10 = (const void *)(v7 + v5);
                if (((v7 + v5) & 7) != 0)
                {
                  if (v8 >= 0x101)
                  {
                    v11 = v8;
                    v12 = (char *)malloc_type_malloc(v8, 0x44B52BDuLL);
                    goto LABEL_23;
                  }
LABEL_22:
                  v11 = v8;
                  MEMORY[0x24BDAC7A8]();
                  v12 = (char *)v14 - ((v8 + 15) & 0x1FFFFFFF0);
                  bzero(v12, v8);
LABEL_23:
                  memcpy(v12, v10, v11);
LABEL_24:
                  if (v12)
                    v13 = v12;
                  else
                    v13 = (char *)(v7 + v5);
                  (*(void (**)(uint64_t, uint64_t, char *, uint64_t))(a2 + 16))(a2, v6, v13, v8);
                  if (v8 >= 0x101)
                  {
                    if (v12)
                      free(v12);
                  }
                  goto LABEL_30;
                }
              }
            }
LABEL_21:
            v12 = 0;
            goto LABEL_24;
          }
        }
        else
        {
          if (a2)
          {
            v10 = (const void *)(v7 + v5);
            v8 = 8;
            if (((v7 + v5) & 7) != 0)
              goto LABEL_22;
            goto LABEL_21;
          }
          LODWORD(v8) = 8;
        }
      }
      else
      {
        v8 = *(unsigned int *)(v7 + v5);
        v7 = v4 + 8;
        if (a2)
          goto LABEL_16;
      }
LABEL_30:
      v4 = v7 + v8;
    }
    while (v4 < *(_QWORD *)(a1 + 8));
  }
}

CFDataRef sub_21DC8C0BC(uint64_t a1, int a2, char *cStr, CFIndex length)
{
  CFDataRef result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = _createObjectFromPrimitiveType(a2, cStr, length);
  if (result)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(unsigned int *)(v7 + 24);
    *(_DWORD *)(v7 + 24) = v8 + 1;
    *(_QWORD *)(v6 + 8 * v8) = result;
  }
  return result;
}

CFDictionaryRef CFDictionaryCreateWithDTXPrimitiveDictionary(uint64_t a1)
{
  CFDictionaryRef v1;
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int i;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v1 = (CFDictionaryRef)a1;
  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = sub_21DC8BE60(a1);
    if (v2 >= 2)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2000000000;
      v13 = 0;
      v3 = 8 * (v2 >> 1);
      MEMORY[0x24BDAC7A8]();
      v4 = (v3 + 15) & 0x7FFFFFFF0;
      if (v3 >= 0x200)
        v5 = 512;
      else
        v5 = v3;
      bzero((char *)v9 - v4, v5);
      MEMORY[0x24BDAC7A8]();
      bzero((char *)v9 - v4, v5);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 0x40000000;
      v9[2] = sub_21DC8C388;
      v9[3] = &unk_24E1AACC8;
      v9[4] = &v10;
      v9[5] = (char *)v9 - v4;
      v9[6] = (char *)v9 - v4;
      _DTXPrimitiveDictionaryEnumerate((uint64_t)v1, (uint64_t)v9);
      v6 = *((_DWORD *)v11 + 6);
      v1 = CFDictionaryCreate(0, (const void **)((char *)v9 - v4), (const void **)((char *)v9 - v4), v6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      *((_DWORD *)v11 + 6) = 0;
      if (v6)
      {
        for (i = 0; i < v6; *((_DWORD *)v11 + 6) = i)
        {
          CFRelease(*(CFTypeRef *)((char *)&v9[i] - v4));
          CFRelease(*(CFTypeRef *)((char *)&v9[*((unsigned int *)v11 + 6)] - v4));
          i = *((_DWORD *)v11 + 6) + 1;
        }
      }
      _Block_object_dispose(&v10, 8);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t _DTXPrimitiveDictionaryGetCount(uint64_t a1)
{
  return sub_21DC8BE60(a1) >> 1;
}

void _DTXPrimitiveDictionaryEnumerate(uint64_t a1, uint64_t a2)
{
  _QWORD v2[7];
  _QWORD v3[3];
  int v4;
  _QWORD v5[4];

  if (a1)
  {
    if (a2)
    {
      v5[0] = 0;
      v5[1] = v5;
      v5[2] = 0x2000000000;
      v5[3] = 0;
      v3[0] = 0;
      v3[1] = v3;
      v3[2] = 0x2000000000;
      v4 = 0;
      v2[0] = MEMORY[0x24BDAC760];
      v2[1] = 0x40000000;
      v2[2] = sub_21DC8C584;
      v2[3] = &unk_24E1AACF0;
      v2[4] = a2;
      v2[5] = v3;
      v2[6] = v5;
      sub_21DC8BEF4(a1, (uint64_t)v2);
      _Block_object_dispose(v3, 8);
      _Block_object_dispose(v5, 8);
    }
  }
}

CFDataRef sub_21DC8C388(CFDataRef result, const char *a2, int a3, char *a4, CFIndex a5)
{
  CFDataRef v8;

  if (a2)
  {
    if (*a2)
    {
      v8 = result;
      *(_QWORD *)(*((_QWORD *)result + 5) + 8 * *(unsigned int *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 24)) = CFStringCreateWithCString(0, a2, 0x8000100u);
      result = _createObjectFromPrimitiveType(a3, a4, a5);
      *(_QWORD *)(*((_QWORD *)v8 + 6)
                + 8 * (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)v8 + 4) + 8) + 24))++) = result;
    }
  }
  return result;
}

double DTXPrimitiveDictionaryCreate()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_realloc(0, 0x200uLL, 0x555093E9uLL);
  *(_QWORD *)&result = 496;
  *v0 = xmmword_21DCA2160;
  return result;
}

void DTXPrimitiveDictionaryDestroy(void *a1)
{
  if (a1)
    free(a1);
}

unint64_t *DTXPrimitiveDictionaryAddPrimitivePair(unint64_t *result, char *__s, int a3, ...)
{
  _QWORD *v4;
  unint64_t *v6;
  size_t v7;
  unint64_t *v8;
  int v9;
  char *v10;
  unint64_t *v11;
  va_list va;

  va_start(va, a3);
  if (result)
  {
    if (a3)
    {
      v4 = result;
      if (*result)
      {
        v6 = (unint64_t *)*result;
        if (__s)
        {
          v7 = strlen(__s) + 1;
          v8 = v6;
          v9 = 1;
          v10 = __s;
        }
        else
        {
          v8 = (unint64_t *)*result;
          v9 = 10;
          v10 = 0;
          v7 = 0;
        }
        v11 = sub_21DC8BB78(v8, v9, v10, v7);
        *v4 = v11;
        result = sub_21DC8B9A0(v11, 1u, a3, (const char **)va);
        *v4 = result;
      }
    }
  }
  return result;
}

unint64_t **DTXPrimitiveDictionaryAddBufferPair(unint64_t **result, char *__s, void *a3, size_t a4)
{
  unint64_t **v4;
  unint64_t *v5;
  size_t v9;
  unint64_t *v10;
  int v11;
  char *v12;
  unint64_t *v13;

  if (result)
  {
    v4 = result;
    v5 = *result;
    if (*result)
    {
      if (__s)
      {
        v9 = strlen(__s) + 1;
        v10 = v5;
        v11 = 1;
        v12 = __s;
      }
      else
      {
        v10 = *result;
        v11 = 10;
        v12 = 0;
        v9 = 0;
      }
      v13 = sub_21DC8BB78(v10, v11, v12, v9);
      *v4 = v13;
      result = (unint64_t **)sub_21DC8BB78(v13, 2, a3, a4);
      *v4 = (unint64_t *)result;
    }
  }
  return result;
}

_QWORD *sub_21DC8C584(_QWORD *result, int a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = result;
  if ((*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) & 1) != 0)
  {
    result = (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  else
  {
    if (a2 != 1)
      a3 = 0;
    *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = a3;
  }
  ++*(_DWORD *)(*(_QWORD *)(v3[5] + 8) + 24);
  return result;
}

uint64_t DTXPrimitiveArrayGetSerialized(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (a2)
      *a2 = *(_DWORD *)(result + 8) + 16;
  }
  return result;
}

_QWORD *DTXPrimitiveArrayReferencingSerialized(_QWORD *result, unsigned int a2)
{
  if (!a2)
    return 0;
  if (!result || a2 < 0x10 || result[1] + 16 != a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "DTXPrimitiveArrayReferencingSerialized: unexpected bytes at %p of length %u, returning NULL\n", result, a2);
    return 0;
  }
  return result;
}

uint64_t DTXPrimitiveDictionaryGetSerialized(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (a2)
      *a2 = *(_DWORD *)(result + 8) + 16;
  }
  return result;
}

uint64_t sub_21DC8C698(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t sub_21DC8C7C0(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

intptr_t sub_21DC8C82C(intptr_t result)
{
  uint64_t v1;
  intptr_t v2;

  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = *(_QWORD *)(result + 40);
  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    v2 = result;
    do
    {
      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(_QWORD *)(v2 + 32) + 32);
      v1 = *(_QWORD *)(v2 + 32);
    }
    while (*(_DWORD *)(v1 + 32));
  }
  return result;
}

uint64_t sub_21DC8C910(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

intptr_t sub_21DC8C97C(intptr_t result)
{
  uint64_t v1;
  intptr_t v2;

  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    v2 = result;
    do
    {
      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(_QWORD *)(v2 + 32) + 32);
      v1 = *(_QWORD *)(v2 + 32);
    }
    while (*(_DWORD *)(v1 + 32));
  }
  return result;
}

_QWORD *sub_21DC8CACC(_QWORD *result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v1 = result[4];
  if (*(_DWORD *)(v1 + 40))
  {
    v2 = result[7];
    v3 = *(_QWORD *)(v1 + 24);
LABEL_9:
    *(_QWORD *)(v1 + 24) = v3 + v2;
    ++*(_DWORD *)(result[4] + 36);
    v6 = result[4];
    v7 = *(_DWORD *)(v6 + 36);
    if (!v7)
    {
      *(_DWORD *)(v6 + 36) = 1;
      v7 = *(_DWORD *)(result[4] + 36);
    }
    *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = v7;
    goto LABEL_12;
  }
  v3 = *(_QWORD *)(v1 + 24);
  v2 = result[7];
  v4 = *(_QWORD *)(v1 + 8);
  if (v2 >= v4)
    v5 = *(_QWORD *)(v1 + 8);
  else
    v5 = result[7];
  if (v5 + v3 <= v4)
    goto LABEL_9;
  if (v2 <= *(_QWORD *)(v1 + 16))
  {
    ++*(_DWORD *)(v1 + 32);
    return result;
  }
LABEL_12:
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 0;
  return result;
}

uint64_t sub_21DC8CBC8(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) += *(_QWORD *)(result + 40);
  return result;
}

intptr_t sub_21DC8CC34(intptr_t result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  uint64_t v6;
  intptr_t v7;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = v3 >= v2;
  v5 = v3 - v2;
  if (!v4)
    v5 = 0;
  *(_QWORD *)(v1 + 24) = v5;
  v6 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v6 + 32))
  {
    v7 = result;
    do
    {
      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v6 + 56));
      --*(_DWORD *)(*(_QWORD *)(v7 + 32) + 32);
      v6 = *(_QWORD *)(v7 + 32);
    }
    while (*(_DWORD *)(v6 + 32));
  }
  return result;
}

intptr_t sub_21DC8CCEC(intptr_t result)
{
  uint64_t v1;
  intptr_t v2;

  ++*(_DWORD *)(*(_QWORD *)(result + 32) + 40);
  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    v2 = result;
    do
    {
      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(_QWORD *)(v2 + 32) + 32);
      v1 = *(_QWORD *)(v2 + 32);
    }
    while (*(_DWORD *)(v1 + 32));
  }
  return result;
}

uint64_t sub_21DC8CDA0(uint64_t result)
{
  --*(_DWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

uint64_t sub_21DC8D55C(uint64_t a1)
{
  const char *v2;

  sub_21DC8D588();
  return objc_msgSend_setObject_forKey_((void *)qword_253F42650, v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_21DC8D588()
{
  objc_class *v0;
  char *ImageName;
  objc_class *v2;

  if ((byte_2553ACB24 & 1) == 0)
  {
    v0 = (objc_class *)objc_opt_class();
    ImageName = (char *)class_getImageName(v0);
    v2 = (objc_class *)objc_opt_class();
    sub_21DC8D918(ImageName, sel_schemes, v2, &unk_24E1AA920);
    byte_2553ACB24 = 1;
  }
}

void sub_21DC8D918(char *a1, const char *a2, objc_class *a3, void *a4)
{
  char *v7;
  const char **v8;
  NSObject *v9;
  const char *v10;
  unint64_t v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  objc_class *Class;
  Method ClassMethod;
  Method v19;
  _BOOL4 v20;
  objc_class *Superclass;
  const char *v22;
  const char *v23;
  objc_class *v24;
  Method *v25;
  Method *v26;
  uint64_t v27;
  Method *v28;
  NSObject *v29;
  void (**v30)(id, objc_class *);
  const char *v31;
  uint8_t v32[12];
  unsigned int outCount;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  unsigned int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = a4;
  v7 = sub_21DC949C4(a1);
  outCount = 0;
  v8 = objc_copyClassNamesForImage(v7, &outCount);
  v9 = qword_253F42620;
  if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_DEBUG))
  {
    v10 = "<nil image?>";
    if (v7)
      v10 = v7;
    *(_DWORD *)buf = 136315394;
    v35 = v10;
    v36 = 1024;
    v37 = outCount;
    _os_log_impl(&dword_21DC85000, v9, OS_LOG_TYPE_DEBUG, "scanning image %s (%u classes)", buf, 0x12u);
  }
  if (outCount)
  {
    v11 = 0;
    v12 = "<nil className>";
    v13 = "checking class %s";
    v31 = a2;
    do
    {
      v14 = qword_253F42620;
      if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_DEBUG))
      {
        v15 = v8[v11];
        if (!v15)
          v15 = v12;
        *(_DWORD *)buf = 136315138;
        v35 = v15;
        _os_log_impl(&dword_21DC85000, v14, OS_LOG_TYPE_DEBUG, v13, buf, 0xCu);
      }
      v16 = v8[v11];
      if (!v16)
        goto LABEL_30;
      Class = objc_getClass(v16);
      ClassMethod = class_getClassMethod(Class, a2);
      if (!ClassMethod)
        goto LABEL_30;
      v19 = ClassMethod;
      v20 = Class != 0;
      if (Class && Class != a3)
      {
        Superclass = Class;
        do
        {
          Superclass = class_getSuperclass(Superclass);
          v20 = Superclass != 0;
        }
        while (Superclass && Superclass != a3);
      }
      if (!v20)
        goto LABEL_30;
      v22 = v13;
      v23 = v12;
      *(_DWORD *)buf = 0;
      v24 = object_getClass(Class);
      v25 = class_copyMethodList(v24, (unsigned int *)buf);
      v26 = v25;
      v27 = *(unsigned int *)buf;
      v28 = v25;
      if (*(_DWORD *)buf)
      {
        while (*v28 != v19)
        {
          ++v28;
          if (!--v27)
            goto LABEL_28;
        }
        v29 = qword_253F42620;
        if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_21DC85000, v29, OS_LOG_TYPE_DEBUG, "selector matched for class, calling block", v32, 2u);
        }
        v30[2](v30, Class);
      }
      else if (!v25)
      {
        goto LABEL_29;
      }
LABEL_28:
      free(v26);
LABEL_29:
      v12 = v23;
      v13 = v22;
      a2 = v31;
LABEL_30:
      ++v11;
    }
    while (v11 < outCount);
  }
  if (v8)
    free(v8);

}

uint64_t sub_21DC8DBC0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  void *v6;
  const char *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend_automaticallyRegistersCapabilities(a2, (const char *)a2, a3);
  if ((_DWORD)result)
  {
    v6 = (void *)qword_253F42620;
    if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_INFO))
    {
      v8 = v6;
      NSStringFromClass((Class)a2);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = 136315138;
      v13 = objc_msgSend_UTF8String(v9, v10, v11);
      _os_log_impl(&dword_21DC85000, v8, OS_LOG_TYPE_INFO, "registering capabilities: %s", (uint8_t *)&v12, 0xCu);

    }
    return objc_msgSend_registerCapabilities_(a2, v7, *(_QWORD *)(a1 + 32));
  }
  return result;
}

uint64_t sub_21DC8DCA8(uint64_t a1, objc_class *a2)
{
  void *v4;
  const char *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)qword_253F42620;
  if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_INFO))
  {
    v6 = v4;
    NSStringFromClass(a2);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = 136315138;
    v12 = objc_msgSend_UTF8String(v7, v8, v9);
    _os_log_impl(&dword_21DC85000, v6, OS_LOG_TYPE_INFO, "registering capabilities: %s", (uint8_t *)&v11, 0xCu);

  }
  return objc_msgSend_registerCapabilities_(a2, v5, *(_QWORD *)(a1 + 32));
}

uint64_t sub_21DC8DE74(uint64_t a1, const char *a2)
{
  return objc_msgSend__receiveQueueSetCompressionHint_onChannel_(*(void **)(a1 + 32), a2, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void sub_21DC8DF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC8E7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC8E814(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DC8E824(uint64_t a1)
{

}

void sub_21DC8E82C(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  v4 = (void *)a1[4];
  v7 = objc_msgSend_cost(v3, v5, v6);
  objc_msgSend_forceAcquireSize_(v4, v8, v7);
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = sub_21DC8E8E4;
  v13[3] = &unk_24E1AAE08;
  v10 = (void *)a1[4];
  v9 = a1[5];
  v11 = *(NSObject **)(v9 + 48);
  v13[1] = 3221225472;
  v16 = a1[6];
  v13[4] = v9;
  v14 = v3;
  v15 = v10;
  v12 = v3;
  dispatch_async(v11, v13);

}

uint64_t sub_21DC8E8E4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  const char *v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160))
    return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__routeMessage_, *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  v4 = objc_msgSend_cost(*(void **)(a1 + 40), a2, a3);
  return objc_msgSend_releaseSize_(v3, v5, v4);
}

uint64_t sub_21DC8E93C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__handleMessageParseException_forChannelCode_messageID_fragmentCount_withPayloadBytes_ofLength_, a2);
}

void sub_21DC8EFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC8F01C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dataReceivedHandler(*(void **)(*(_QWORD *)(a1 + 32) + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = CFSTR("Unable to publish capabilities after connection has been resumed.");
    goto LABEL_3;
  }
  v24 = *(int *)(a1 + 64);
  if ((int)v24 <= 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("Invalid version number for capability \"%@\": %ld not in one-sided range [0, INT_MAX)."), *(_QWORD *)(a1 + 40), v24);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v40 + 40);
    *(_QWORD *)(v40 + 40) = v39;
    goto LABEL_3;
  }
  objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 104), v5, *(_QWORD *)(a1 + 40));
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 112), v25, *(_QWORD *)(a1 + 40));
  v7 = v48;
  if (!v48)
    goto LABEL_3;
  v28 = v26;
  v29 = objc_msgSend_intValue(v48, (const char *)v48, v27);
  v32 = *(int *)(a1 + 64);
  if (v29 != (_DWORD)v32 && v28 == *(_QWORD *)(a1 + 56))
  {
    v41 = (void *)MEMORY[0x24BDD17C8];
    v42 = *(_QWORD *)(a1 + 40);
    v47 = objc_msgSend_integerValue(v48, v30, v31);
    objc_msgSend_stringWithFormat_(v41, v43, (uint64_t)CFSTR("Version mismatch for capability \"%@\" with service class \"%@\": %ld vs. %ld."), v42, v28, v32, v47);
  }
  else
  {
    if (objc_msgSend_intValue(v48, v30, v31) != *(_DWORD *)(a1 + 64) || v28 == *(_QWORD *)(a1 + 56))
      goto LABEL_21;
    v35 = (void *)MEMORY[0x24BDD17C8];
    v36 = *(_QWORD *)(a1 + 40);
    v37 = objc_msgSend_integerValue(v48, v33, v34);
    objc_msgSend_stringWithFormat_(v35, v38, (uint64_t)CFSTR("Class mismatch for capability \"%@\" with version %ld: \"%@\" vs. \"%@\"."), v36, v37, v28, *(_QWORD *)(a1 + 56));
  }
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v46 = *(void **)(v45 + 40);
  *(_QWORD *)(v45 + 40) = v44;

LABEL_21:
  if ((int)objc_msgSend_intValue(v48, v33, v34) > *(_DWORD *)(a1 + 64))
  {

    return;
  }
  v7 = v48;
LABEL_3:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = (void *)qword_253F42620;
    if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v8;
      LODWORD(v10) = objc_msgSend_atomicConnectionNumber(v10, v12, v13);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_DWORD *)(a1 + 64);
      NSStringFromClass(*(Class *)(a1 + 56));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("none");
      *(_DWORD *)buf = 67109890;
      v50 = (int)v10;
      if (v16)
        v18 = (const __CFString *)v16;
      v51 = 2114;
      v52 = v14;
      v53 = 1024;
      v54 = v15;
      v55 = 2114;
      v56 = v18;
      _os_log_impl(&dword_21DC85000, v11, OS_LOG_TYPE_INFO, "x%d \"%{public}@\" v%u (%{public}@)", buf, 0x22u);

    }
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v9, *(unsigned int *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v19, v21, (uint64_t)v20, *(_QWORD *)(a1 + 40));

    v23 = *(_QWORD *)(a1 + 56);
    if (v23)
      objc_msgSend_setObject_forKey_(*(void **)(*(_QWORD *)(a1 + 32) + 112), v22, v23, *(_QWORD *)(a1 + 40));
  }
}

void sub_21DC8F3E0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend_copy(*(void **)(*(_QWORD *)(a1 + 32) + 104), a2, a3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_21DC8F508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC8F520(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  double v6;
  unint64_t *v7;
  double v8;
  void *v9;
  double v10;
  const char *v11;
  dispatch_time_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], a2, a3);
  v7 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  while (1)
  {
    v8 = COERCE_DOUBLE(__ldaxr(v7));
    if (v8 != 0.0)
      break;
    if (!__stlxr(*(unint64_t *)&v6, v7))
    {
      v12 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      v13 = *(void **)(a1 + 40);
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_21DC8F65C;
      block[3] = &unk_24E1AAD40;
      v17 = v13;
      v18 = *(_QWORD *)(a1 + 56);
      dispatch_after(v12, v14, block);

      return;
    }
  }
  __clrex();
  v9 = *(void **)(a1 + 40);
  v10 = v6 - v8;
  if (v10 < 0.0)
    v10 = 0.0;
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v4, v5, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invokeCompletionWithReturnValue_error_(v9, v11, (uint64_t)v15, 0);

}

void sub_21DC8F65C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3, *(double *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invokeCompletionWithReturnValue_error_(v3, v4, (uint64_t)v5, 0);

}

void sub_21DC8F79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_21DC8F7B4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;

  objc_msgSend_doubleValue(a2, (const char *)a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_21DC8F8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC8F8C8(uint64_t result, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = result;
  v4 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v4 + 120))
  {
    result = objc_msgSend_supportedDirections(*(void **)(v4 + 32), a2, a3);
    if ((_DWORD)result == 2)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(v3 + 32);
      v9 = *(void **)(v8 + 120);
      *(_QWORD *)(v8 + 120) = v7;

      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v3 + 32) + 152));
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 120) == 0;
  return result;
}

void sub_21DC8FA58(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  objc_msgSend_dataReceivedHandler(*(void **)(*(_QWORD *)(a1 + 32) + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v5, (uint64_t)CFSTR("DTXConnectionException"), CFSTR("Unable to register capability override blocks after connection has been resumed."));
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (!v6)
  {
    v7 = objc_opt_new();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 128);
    *(_QWORD *)(v8 + 128) = v7;

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  }
  v11 = (id)MEMORY[0x22079E258](*(_QWORD *)(a1 + 40));
  objc_msgSend_addObject_(v6, v10, (uint64_t)v11);

}

void sub_21DC8FBE8(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend_intValue(a3, v5, v6) == 0x80000000)
    objc_msgSend_addObject_(*(void **)(a1 + 32), v7, (uint64_t)v8);

}

void sub_21DC8FCBC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v18;
  void *v19;
  id v20;
  const char *v21;
  _QWORD v22[4];
  id v23;

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 184))
  {
    objc_msgSend_description(*(void **)(a1 + 32), a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_21DC8FE68("resuming", (void *)v4, 0, v5);

    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend_dataReceivedHandler(*(void **)(v4 + 32), a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v9 + 72))
    {
      if ((objc_msgSend_supportedDirections(*(void **)(v9 + 32), v7, v8) & 0xFFFFFFFE) == 2)
      {
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v10, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v11, v13, (uint64_t)v12, CFSTR("com.apple.private.DTXConnection"));

        objc_msgSend_setObject_forKey_(*(void **)(*(_QWORD *)(a1 + 32) + 104), v14, (uint64_t)&unk_24E1B03A0, CFSTR("com.apple.private.DTXBlockCompression"));
        objc_msgSend_messageWithSelector_objectArguments_(DTXMessage, v15, (uint64_t)sel__notifyOfPublishedCapabilities_, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sendControlAsync_replyHandler_(*(void **)(a1 + 32), v17, (uint64_t)v16, 0);

      }
      v18 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = sub_21DC900BC;
      v22[3] = &unk_24E1AAF20;
      v23 = v18;
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v20 = v18;
      objc_msgSend_setDataReceivedHandler_(v19, v21, (uint64_t)v22);

    }
  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48));
}

void sub_21DC8FE68(const char *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  const char *v25;
  int v26;
  id v27;
  int v28;
  id v29;
  void *v30;
  const char *v31;
  id v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  FILE *v37;
  double v38;
  const char *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = (void *)MEMORY[0x22079E084]();
  if (!v9)
  {
    objc_msgSend_description((void *)kDTXInterruptionMessage, v10, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend_channelCode(v8, v10, v11);
  v16 = v13;
  if (v13 >= 0)
    v17 = v13;
  else
    v17 = -v13;
  v18 = objc_msgSend_atomicConnectionNumber(v7, v14, v15);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], v19, v20);
  v22 = v21;
  v23 = (void *)qword_253F42648;
  if (os_log_type_enabled((os_log_t)qword_253F42648, OS_LOG_TYPE_INFO))
  {
    v24 = v22 - *(double *)&qword_253F42618;
    if (v16 >= 0)
      v25 = "";
    else
      v25 = "f";
    v44 = v25;
    v26 = v18;
    v27 = v8;
    v28 = v17;
    v29 = v7;
    v30 = v12;
    v31 = a1;
    v32 = objc_retainAutorelease(v9);
    v33 = v23;
    v34 = v32;
    a1 = v31;
    v12 = v30;
    v7 = v29;
    v17 = v28;
    v8 = v27;
    v18 = v26;
    *(_DWORD *)buf = 134219266;
    v46 = v24;
    v47 = 1024;
    v48 = v26;
    v49 = 2080;
    v50 = a1;
    v51 = 1024;
    v52 = v17;
    v53 = 2080;
    v54 = v44;
    v55 = 2080;
    v56 = objc_msgSend_UTF8String(v34, v35, v36);
    _os_log_impl(&dword_21DC85000, v33, OS_LOG_TYPE_INFO, "%3.6f x%d %8s [c%d%s]: %s\n", buf, 0x36u);

  }
  v37 = (FILE *)qword_2553ACB10;
  if (qword_2553ACB10)
  {
    v38 = v22 - *(double *)&qword_253F42618;
    if (v16)
      v39 = "f";
    else
      v39 = "";
    v40 = objc_retainAutorelease(v9);
    v43 = (const char *)objc_msgSend_UTF8String(v40, v41, v42);
    fprintf(v37, "%3.6f x%d %8s [c%d%s]: %s\n", v38, v18, a1, v17, v39, v43);
  }
  objc_autoreleasePoolPop(v12);

}

uint64_t sub_21DC900BC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_parseIncomingBytes_length_, a2);
}

void sub_21DC90158(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x22079E258](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 192);
  *(_QWORD *)(v3 + 192) = v2;

}

void sub_21DC902B0(uint64_t a1, const char *a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  _QWORD block[5];
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[9];
  if (!v5)
  {
    v26 = *(void **)(a1 + 40);
    if (!v26)
      return;
    v27 = (void *)v4[22];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = sub_21DC9046C;
    v33[3] = &unk_24E1AAF48;
    v34 = v26;
    objc_msgSend__scheduleBlock_(v27, v28, (uint64_t)v33);
    v25 = v34;
    goto LABEL_8;
  }
  if (!v4[15])
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCE70], a2, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyOfPublishedCapabilities_(v4, v7, (uint64_t)v6);

    v4 = *(_QWORD **)(a1 + 32);
    v5 = (void *)v4[9];
  }
  v8 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_21DC9047C;
  v32[3] = &unk_24E1AAF70;
  v32[4] = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, a2, (uint64_t)v32);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 80);
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = sub_21DC9048C;
  v31[3] = &unk_24E1AAF70;
  v31[4] = v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v11, (uint64_t)v31);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 72);
  *(_QWORD *)(v12 + 72) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 80);
  *(_QWORD *)(v14 + 80) = 0;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 192);
  *(_QWORD *)(v16 + 192) = 0;

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 96);
  *(_QWORD *)(v18 + 96) = 0;

  v23 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(a1 + 40);
  if (v22)
  {
    v24 = *(NSObject **)(v23 + 16);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = sub_21DC904D0;
    block[3] = &unk_24E1AA9B0;
    block[4] = v23;
    v30 = v22;
    dispatch_async(v24, block);
    v25 = v30;
LABEL_8:

    return;
  }
  objc_msgSend_disconnect(*(void **)(v23 + 32), v20, v21);
}

uint64_t sub_21DC9046C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_21DC9047C(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__scheduleMessage_toChannel_(*(void **)(a1 + 32), a2, 0, a3);
}

void sub_21DC9048C(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = a3;
  objc_msgSend_resume(v7, v4, v5);
  objc_msgSend__scheduleMessage_toChannel_(*(void **)(a1 + 32), v6, 0, v7);

}

void sub_21DC904D0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  const char *v4;
  _QWORD v5[5];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC90544;
  v5[3] = &unk_24E1AAFC0;
  v5[4] = v1;
  v6 = v2;
  objc_msgSend_serializedDisconnect_(v3, v4, (uint64_t)v5);

}

void sub_21DC90544(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC905D8;
  block[3] = &unk_24E1AAF98;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void sub_21DC905D8(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const void *v11;
  const char *v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  objc_msgSend_parsingComplete(*(void **)(*(_QWORD *)(a1 + 32) + 160), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 40);
  v6 = v4;
  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (object_getClass(v5) != (Class)MEMORY[0x24BDACFA0])
      sub_21DCA02D8();
    v8 = objc_retainAutorelease(v6);
    v11 = (const void *)objc_msgSend_bytes(v8, v9, v10);
    v14 = objc_msgSend_length(v8, v12, v13);
    xpc_dictionary_set_data(v5, "__DTXTransport_preflightdata", v11, v14);
  }

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 160);
  *(_QWORD *)(v15 + 160) = 0;

  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_21DC90714;
  v19[3] = &unk_24E1AAC50;
  v21 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 40);
  objc_msgSend__scheduleBlock_(v17, v18, (uint64_t)v19);

}

uint64_t sub_21DC90714(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_21DC90C50(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  int v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  NSObject *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  __int128 v25;
  int v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[3];
  int v35;
  _QWORD block[5];
  id v37;

  v3 = a2;
  v5 = objc_msgSend_fragmentsForLength_(*(void **)(*(_QWORD *)(a1 + 32) + 168), v4, *(_QWORD *)(a1 + 64));
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if (*(_BYTE *)(a1 + 96))
  {
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 24);

    v7 = v8;
  }
  if (*(_BYTE *)(a1 + 97))
  {
    v9 = (void *)MEMORY[0x22079E258](v3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21DC90EF4;
    block[3] = &unk_24E1AA9B0;
    block[4] = *(_QWORD *)(a1 + 32);
    v37 = v9;
    v10 = v9;
    dispatch_async(v7, block);

  }
  if (*(_QWORD *)(a1 + 40) == kDTXBarrierMessage
    || !objc_msgSend__addHandler_forMessage_channel_(*(void **)(a1 + 32), v6, (uint64_t)v3, *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 48))|| (v11 = *(void **)(a1 + 40), v11 == (void *)qword_253F42610))
  {
    if (*(_BYTE *)(a1 + 96))
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    v17 = *(_QWORD *)(a1 + 72);
    if (v17)
      objc_msgSend_releaseSize_(*(void **)(*(_QWORD *)(a1 + 32) + 136), v6, v17);
  }
  else
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_21DC90F48;
    v32 = sub_21DC90F70;
    v33 = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_21DC90F78;
    v18[3] = &unk_24E1AB010;
    v18[4] = *(_QWORD *)(a1 + 32);
    v12 = v11;
    v25 = *(_OWORD *)(a1 + 80);
    v19 = v12;
    v22 = v34;
    v23 = &v28;
    v26 = v5;
    v27 = *(_BYTE *)(a1 + 96);
    v24 = *(_QWORD *)(a1 + 72);
    v20 = *(id *)(a1 + 56);
    v13 = v7;
    v21 = v13;
    v14 = MEMORY[0x22079E258](v18);
    v15 = (void *)v29[5];
    v29[5] = v14;

    if (*(_QWORD *)(a1 + 56))
      v16 = 1;
    else
      v16 = v5;
    for (; v16; --v16)
      dispatch_async(v13, (dispatch_block_t)v29[5]);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v34, 8);
  }

}

uint64_t sub_21DC90EF4(uint64_t a1, const char *a2)
{
  uint64_t result;

  objc_msgSend_transmit_ofLength_(*(void **)(*(_QWORD *)(a1 + 32) + 32), a2, 0, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, kDTXBarrierMessage);
  return result;
}

uint64_t sub_21DC90F48(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x22079E258](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_21DC90F70(uint64_t a1)
{

}

void sub_21DC90F78(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 168);
  v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_21DC910B0;
  v14[3] = &unk_24E1AAFE8;
  v14[4] = v4;
  objc_msgSend_transmitMessage_routingInfo_fragment_transmitter_(v5, a2, v3, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v6, v14);
  if (++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == *(_DWORD *)(a1 + 104))
  {
    if ((*(_BYTE *)(a1 + 100) & 1) != 0
      || *(_DWORD *)(a1 + 92)
      || objc_msgSend_isBarrier(*(void **)(a1 + 40), v7, v8))
    {
      objc_msgSend_transmit_ofLength_(*(void **)(*(_QWORD *)(a1 + 32) + 32), v7, 0, 0);
    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    if (*(_BYTE *)(a1 + 108))
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    v12 = *(_QWORD *)(a1 + 80);
    if (v12)
      objc_msgSend_releaseSize_(*(void **)(*(_QWORD *)(a1 + 32) + 136), v11, v12);
    v13 = *(NSObject **)(a1 + 48);
    if (v13)
      dispatch_semaphore_signal(v13);
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  }
}

uint64_t sub_21DC910B0(uint64_t a1, const char *a2, unsigned int a3)
{
  uint64_t result;
  const char *v6;
  uint64_t v7;

  result = objc_msgSend_transmit_ofLength_(*(void **)(*(_QWORD *)(a1 + 32) + 32), a2, (uint64_t)a2, a3);
  if (result != a3)
    return objc_msgSend_disconnect(*(void **)(*(_QWORD *)(a1 + 32) + 32), v6, v7);
  return result;
}

void sub_21DC91100(void *a1, void *a2)
{
  void (**v3)(id, _QWORD);
  id v4;
  void (**v5)(_QWORD, _QWORD);
  dispatch_semaphore_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a1;
  v4 = a2;
  if (!v4)
    sub_21DCA0300();
  v5 = (void (**)(_QWORD, _QWORD))v4;
  v6 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_21DC8E814;
  v16 = sub_21DC8E824;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_21DC94B54;
  v9[3] = &unk_24E1AB2B0;
  v11 = &v12;
  v7 = v6;
  v10 = v7;
  v8 = (void *)MEMORY[0x22079E258](v9);
  ((void (**)(_QWORD, void *))v5)[2](v5, v8);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v3)
    v3[2](v3, v13[5]);

  _Block_object_dispose(&v12, 8);
}

void sub_21DC91220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC9139C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC913B8(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v4)
  {
    a3 = *(unsigned int *)(a1 + 72);
    if ((_DWORD)a3)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v4, v6, (uint64_t)v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 != *(void **)(a1 + 40))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v9 = *(void **)(v8 + 88);
    v13 = (id)MEMORY[0x22079E258](*(_QWORD *)(a1 + 56));
    objc_msgSend_setObject_forKey_(v9, v10, (uint64_t)v13, *(_QWORD *)(a1 + 48));

  }
  else
  {
    if (*(_BYTE *)(v8 + 184))
    {
      v11 = *(void **)(a1 + 40);
      sub_21DC914E4(*(unsigned int *)(a1 + 76), a2, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_21DC8FE68(" handler", (void *)v8, v11, v12);

    }
    objc_msgSend__scheduleMessage_tracker_withHandler_(*(void **)(a1 + 40), a2, 0, 0, *(_QWORD *)(a1 + 56));
  }
}

id sub_21DC914E4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_message(DTXMessage, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setErrorStatus_(v4, v5, 2);
  objc_msgSend_setIdentifier_(v4, v6, a1);
  objc_msgSend__makeImmutable((void *)kDTXInterruptionMessage, v7, v8);
  objc_msgSend_description(v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_21DC91B78(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v4;
  id v5;

  v5 = (id)objc_msgSend_newReply(a2, (const char *)a2, a3);
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(*(void **)(a1 + 32), v4, (uint64_t)v5, *(_QWORD *)(a1 + 40), 2, 0, 0);

}

void sub_21DC91BC4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = (void *)MEMORY[0x22079E258](a3);
  v8 = objc_msgSend_unsignedLongLongValue(v17, v6, v7);
  if (objc_msgSend_channelCode(*(void **)(a1 + 32), v9, v10) == HIDWORD(v8))
  {
    objc_msgSend_removeObjectForKey_(*(void **)(a1 + 40), v11, (uint64_t)v17);
    v14 = *(_BYTE **)(a1 + 48);
    if (v14[184])
    {
      v15 = *(void **)(a1 + 32);
      sub_21DC914E4(v8, v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_21DC8FE68(" handler", v14, v15, v16);

    }
    objc_msgSend__scheduleMessage_tracker_withHandler_(*(void **)(a1 + 32), v12, *(_QWORD *)(a1 + 56), 0, v5);
  }

}

void sub_21DC91E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21DC91E8C(uint64_t *a1, const char *a2)
{
  uint64_t v3;
  int v4;
  DTXChannel *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = a1[4];
  v4 = *(_DWORD *)(v3 + 64);
  *(_DWORD *)(v3 + 64) = v4 + 1;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, *(unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [DTXChannel alloc];
  v7 = objc_msgSend_initWithConnection_channelIdentifier_label_(v5, v6, a1[4], *(unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24), a1[5]);
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend_setObject_forKey_(*(void **)(a1[4] + 72), v10, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), v11);
}

uint64_t sub_21DC91F40(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend_errorStatus(a2, (const char *)a2, a3);
  if ((_DWORD)result)
  {
    v5 = qword_253F42648;
    if (os_log_type_enabled((os_log_t)qword_253F42648, OS_LOG_TYPE_ERROR))
    {
      v8 = CFSTR("nil");
      v9 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(a1 + 32))
        v8 = *(const __CFString **)(a1 + 32);
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_21DC85000, v5, OS_LOG_TYPE_ERROR, "Connection peer refused channel request for \"%{public}@\"; channel canceled %@",
        (uint8_t *)&v10,
        0x16u);
    }
    return objc_msgSend_cancel(*(void **)(a1 + 40), v6, v7);
  }
  return result;
}

void sub_21DC92184(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = objc_msgSend_channelCode(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_numberWithInt_(v4, v6, v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 40) + 80), v7, (uint64_t)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (v8)
  {
    if (*(void **)(a1 + 32) != v8)
      sub_21DCA0328();
    objc_msgSend_resume(v8, v9, v10);
    v12 = 80;
  }
  else
  {
    v12 = 72;
  }
  objc_msgSend_removeObjectForKey_(*(void **)(*(_QWORD *)(a1 + 40) + v12), v9, (uint64_t)v14);
  objc_msgSend__scheduleMessage_toChannel_(*(void **)(a1 + 40), v13, 0, *(_QWORD *)(a1 + 32));

}

void sub_21DC926A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21DC926D0(uint64_t a1)
{
  DTXProxyChannel *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;

  v2 = [DTXProxyChannel alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend_peerProtocol(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publishedProtocol(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend_initWithChannel_remoteProtocol_localProtocol_(v2, v10, v3, v6, v9);

  objc_msgSend_handlerBlock(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11, v12);
  v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v13)[2](v13, v14);

}

uint64_t sub_21DC92790(_QWORD *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[7];
  v5 = objc_msgSend_objectForKey_(*(void **)(a1[6] + 112), a2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v2, v3, v5);
}

uint64_t sub_21DC928CC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

void sub_21DC92A68(void *a1, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  id v6;

  v6 = a1;
  if (objc_msgSend_compressionTypeHint(v6, v3, v4) == 1)
    objc_msgSend_setCompressionTypeHint_(v6, v5, a2);

}

void sub_21DC930AC(uint64_t *a1)
{
  DTXProxyRequestHandler *v2;
  const char *v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = [DTXProxyRequestHandler alloc];
  v4 = (void *)objc_msgSend_initWithPublishedProtocol_publishedProtocolName_peerProtocol_peerProtocolName_handlerBlock_(v2, v3, a1[4], a1[5], a1[6], a1[7], a1[9]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1[8] + 96);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, v17, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v5);
        if (objc_msgSend_matchesPublishedProtocolName_peerProtocolName_(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v11), v8, a1[5], a1[7], (_QWORD)v13))objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v8, (uint64_t)CFSTR("DTXConnectionException"), CFSTR("Proxy handler already exists for protocol pair specified."));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  objc_msgSend_addObject_(*(void **)(a1[8] + 96), v12, (uint64_t)v4);
}

uint64_t sub_21DC938E4(uint64_t a1, const char *a2)
{
  const char *v3;
  const char *v4;

  objc_msgSend_setIsCanceled_(*(void **)(a1 + 32), a2, 1);
  objc_msgSend_setMessageHandler_(*(void **)(a1 + 32), v3, 0);
  return objc_msgSend_setDispatchTarget_(*(void **)(a1 + 32), v4, 0);
}

void sub_21DC93920(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, const char *);
  void *v30;
  id v31;
  uint64_t v32;
  id v33[4];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x22079E084]();
  v34 = 0u;
  v35 = 0u;
  v5 = *(void **)(a1 + 32);
  if (v5 && (objc_msgSend__callbackSnapshot(v5, v2, v3), *((_QWORD *)&v34 + 1)))
  {
    v6 = pthread_getspecific(qword_253F42628);
    pthread_setspecific(qword_253F42628, *(const void **)(a1 + 32));
    v8 = v34;
    if ((_QWORD)v34)
    {
      v27 = MEMORY[0x24BDAC760];
      v28 = 3254779904;
      v29 = sub_21DC93BA4;
      v30 = &unk_24E1AA8F0;
      v31 = *(id *)(a1 + 40);
      sub_21DC93BC4(v33, (uint64_t)&v34);
      v32 = *(_QWORD *)(a1 + 32);
      dispatch_sync(v8, &v27);
      sub_21DC93C1C(v33);

    }
    else
    {
      objc_msgSend_invokeWithTarget_replyChannel_validator_(*(void **)(a1 + 40), v7, *((uint64_t *)&v34 + 1), *(_QWORD *)(a1 + 32), *((_QWORD *)&v35 + 1));
    }
    pthread_setspecific(qword_253F42628, v6);
  }
  else if (objc_msgSend_expectsReply(*(void **)(a1 + 40), v2, v3)
         && (objc_msgSend_isCanceled(*(void **)(a1 + 32), v9, v10) & 1) == 0)
  {
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v9, (uint64_t)CFSTR("DTXMissingDispatchTargetException"), CFSTR("Unable to invoke message - channel has no dispatch target"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    v13 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_description(v11, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)v37, &v36, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v19, (uint64_t)CFSTR("DTXConnection"), 1, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend_newReplyWithError_(v12, v21, (uint64_t)v20);

    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(*(void **)(a1 + 48), v23, (uint64_t)v22, *(_QWORD *)(a1 + 32), 2, 0, 0);
  }
  v24 = *(void **)(a1 + 56);
  v25 = objc_msgSend_cost(*(void **)(a1 + 40), v9, v10, v27, v28, v29, v30);
  objc_msgSend_releaseSize_(v24, v26, v25);
  sub_21DC93C1C((id *)&v34);
  objc_autoreleasePoolPop(v4);
}

void sub_21DC93B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  sub_21DC93C1C((id *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC93BA4(uint64_t a1, const char *a2)
{
  return objc_msgSend_invokeWithTarget_replyChannel_validator_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
}

uint64_t sub_21DC93BB8(uint64_t a1, uint64_t a2)
{
  return sub_21DC93BC4((_QWORD *)(a1 + 48), a2 + 48);
}

uint64_t sub_21DC93BC4(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  *a1 = *(id *)a2;
  a1[1] = *(id *)(a2 + 8);
  a1[2] = MEMORY[0x22079E258](*(_QWORD *)(a2 + 16));
  result = MEMORY[0x22079E258](*(_QWORD *)(a2 + 24));
  a1[3] = result;
  return result;
}

void sub_21DC93C14(uint64_t a1)
{
  sub_21DC93C1C((id *)(a1 + 48));
}

void sub_21DC93C1C(id *a1)
{

}

void sub_21DC93C54(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isCanceled;
  uint64_t *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;

  v21 = 0u;
  v22 = 0u;
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend__callbackSnapshot(v4, a2, a3, v21);
  v5 = pthread_getspecific(qword_253F42628);
  pthread_setspecific(qword_253F42628, *(const void **)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
  {
    isCanceled = objc_msgSend_isCanceled(*(void **)(a1 + 32), v6, v7);
    v10 = (uint64_t *)(a1 + 40);
    if (isCanceled)
      v10 = &kDTXInterruptionMessage;
    goto LABEL_9;
  }
  v8 = v22;
  if ((_QWORD)v22)
  {
    v10 = (uint64_t *)(a1 + 40);
LABEL_9:
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, *v10);
    goto LABEL_10;
  }
  if (objc_msgSend_tracer(*(void **)(*(_QWORD *)(a1 + 32) + 24), v6, v7))
  {
    v18 = *(_QWORD **)(a1 + 32);
    v19 = (void *)v18[3];
    objc_msgSend_description(*(void **)(a1 + 40), v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    sub_21DC8FE68("dropped message (no message handler)", v19, v18, v20);

  }
LABEL_10:
  pthread_setspecific(qword_253F42628, v5);
  v11 = *(void **)(a1 + 48);
  v14 = objc_msgSend_cost(*(void **)(a1 + 40), v12, v13);
  objc_msgSend_releaseSize_(v11, v15, v14);
  sub_21DC93C1C((id *)&v21);
}

void sub_21DC93D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  sub_21DC93C1C(&a9);
  _Unwind_Resume(a1);
}

void sub_21DC93E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  sub_21DC93C1C(v7);
  _Unwind_Resume(a1);
}

_QWORD *sub_21DC93E5C(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a2[6];
  a2[6] = 0;
  result[6] = v2;
  v3 = a2[7];
  a2[7] = 0;
  result[7] = v3;
  v4 = a2[8];
  a2[8] = 0;
  result[8] = v4;
  v5 = a2[9];
  a2[9] = 0;
  result[9] = v5;
  return result;
}

void sub_21DC93E90(uint64_t a1)
{
  sub_21DC93C1C((id *)(a1 + 48));
}

void sub_21DC93E98(os_unfair_lock_s *a1, void *a2)
{
  os_unfair_lock_s *v3;
  void (**v4)(id, uint64_t);
  os_unfair_lock_s *v5;

  v3 = a1 + 10;
  v4 = a2;
  v5 = a1;
  os_unfair_lock_lock(v3);
  v4[2](v4, (uint64_t)&v5[14]);

  os_unfair_lock_unlock(v3);
}

void sub_21DC93F04(uint64_t a1, uint64_t a2)
{
  sub_21DC93F14(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, a2);
}

void sub_21DC93F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_storeStrong((id *)a1, *(id *)a2);
  objc_storeStrong((id *)(a1 + 8), *(id *)(a2 + 8));
  v4 = MEMORY[0x22079E258](*(_QWORD *)(a2 + 16));
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;

  v6 = MEMORY[0x22079E258](*(_QWORD *)(a2 + 24));
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;

}

void sub_21DC94040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC94058(uint64_t a1, uint64_t a2)
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (*(_QWORD *)(a1 + 40) != *(_QWORD *)(a2 + 16))
  {
    v14 = (id)MEMORY[0x22079E258]();
    if (objc_msgSend_isCanceled(*(void **)(a1 + 32), v4, v5))
    {
      v7 = v14;
      if (v14)
      {
        objc_msgSend__scheduleMessage_tracker_withHandler_(*(void **)(a1 + 32), v6, 0, 0, v14);
        v7 = v14;
      }

      v14 = 0;
    }
    if (*(_QWORD *)(a2 + 16))
    {
      objc_msgSend__scheduleMessage_tracker_withHandler_(*(void **)(a1 + 32), v6, 0, 0);
      v8 = *(_QWORD *)(a2 + 16);
    }
    else
    {
      v8 = 0;
    }
    v9 = MEMORY[0x22079E258](v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = MEMORY[0x22079E258](v14);
    v13 = *(void **)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v12;

  }
}

void sub_21DC94238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC94250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int isCanceled;
  char v6;
  void *v7;
  void *v8;

  isCanceled = objc_msgSend_isCanceled(*(void **)(a1 + 32), (const char *)a2, a3);
  v6 = isCanceled;
  if (isCanceled)
  {
    v7 = *(void **)(a2 + 8);
  }
  else
  {
    v7 = *(void **)(a2 + 8);
    if (*(void **)(a1 + 40) == v7)
      goto LABEL_8;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
  if ((v6 & 1) != 0)
    v8 = 0;
  else
    v8 = *(void **)(a1 + 40);
  objc_storeStrong((id *)(a2 + 8), v8);
LABEL_8:
  objc_storeStrong((id *)a2, *(id *)(a1 + 48));
}

void sub_21DC94354(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x22079E258](*(_QWORD *)(a1 + 32));
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v3;

}

uint64_t sub_21DC94420(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21DC944FC(uint64_t a1, const char *a2)
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *Name;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)qword_253F42648;
  if (os_log_type_enabled((os_log_t)qword_253F42648, OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&dword_21DC85000, v4, OS_LOG_TYPE_ERROR, "Warning: called -[%{public}@ %{public}s] with NULL replyHandler!\nThe caller will not block synchronously on this call as there is no handler to wait for.", (uint8_t *)&v7, 0x16u);

  }
}

void sub_21DC94610(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  id v14;

  v14 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(v9, v12, (uint64_t)v14, v10, 0, a4, v11))objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(v9, v13, (uint64_t)v14, v10, 1, a4, v11);

}

void sub_21DC9480C(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  objc_class *v13;
  const char *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  const char *Name;
  const char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_schemes(a2, (const char *)a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v21, v31, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v22;
    *(_QWORD *)&v8 = 138543874;
    v20 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = (objc_class *)(id)objc_msgSend_objectForKey_((void *)qword_253F42650, v7, v12, v20);
        if (v13)
        {
          v15 = v13;
          v16 = (void *)qword_253F42648;
          if (os_log_type_enabled((os_log_t)qword_253F42648, OS_LOG_TYPE_ERROR))
          {
            v17 = v16;
            Name = class_getName(v15);
            v19 = class_getName((Class)a2);
            *(_DWORD *)buf = v20;
            v26 = v12;
            v27 = 2082;
            v28 = Name;
            v29 = 2082;
            v30 = v19;
            _os_log_impl(&dword_21DC85000, v17, OS_LOG_TYPE_ERROR, "Warning: duplicate registration of scheme \"%{public}@\" - claims made by both %{public}s and %{public}s transports.", buf, 0x20u);

          }
        }
        else
        {
          objc_msgSend_setObject_forKey_((void *)qword_253F42650, v14, (uint64_t)a2, v12);
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v21, v31, 16);
    }
    while (v9);
  }

}

char *sub_21DC949C4(char *a1)
{
  char *v2;
  const char *v3;
  uint32_t v4;
  uint32_t v5;
  uint32_t v6;
  char *image_name;
  char *v8;
  int v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = strrchr(a1, 47);
  if (!v2)
    goto LABEL_7;
  v3 = v2;
  v4 = _dyld_image_count();
  if (!v4)
    goto LABEL_7;
  v5 = v4;
  v6 = 0;
  while (1)
  {
    image_name = (char *)_dyld_get_image_name(v6);
    v8 = strrchr(image_name, 47);
    if (v8)
    {
      if (!strcmp(v3, v8))
        break;
    }
    if (v5 == ++v6)
      goto LABEL_7;
  }
  if (!image_name)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = a1;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "couldn't find dyld's real path for loaded image %s", (uint8_t *)&v10, 0xCu);
    }
    return 0;
  }
  return image_name;
}

void sub_21DC94AD4(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_21DC8D588();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend_objectForKey_((void *)qword_253F42650, v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v5 = a1 + 40;
    *(_QWORD *)(*(_QWORD *)(v6 + 8) + 24) = v4;

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v5 = a1 + 40;
    *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24) = 0;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = objc_opt_class();
}

void sub_21DC94B54(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id sub_21DC94BA0(void *a1)
{
  id v1;
  const char *v2;
  const char *v3;
  uint64_t v4;
  id v5;

  v1 = a1;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("*")) & 1) != 0 || !objc_msgSend_length(v1, v3, v4))
    v5 = 0;
  else
    v5 = v1;

  return v5;
}

void sub_21DC94BF4(uint64_t a1, uint64_t a2, void *a3)
{
  sub_21DC92A68(a3, *(unsigned int *)(a1 + 32));
}

uint64_t sub_21DC94E40(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  void *v7;
  int *v8;
  const char *v9;
  socklen_t v10;
  sockaddr v11;
  uint64_t v12;
  int v13;

  *(_QWORD *)&v11.sa_len = 0;
  *(_QWORD *)&v11.sa_data[6] = 0;
  v13 = 0;
  v12 = 0;
  v10 = 28;
  if (getsockname(a1, &v11, &v10))
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, (uint64_t)"int _getPortOfSocketFileDescriptor(int)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = __error();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v9, (uint64_t)v7, CFSTR("DTXSocketTransport.m"), 23, CFSTR("socket port could not be determined for %u (%u)"), a1, *v8);

  }
  return bswap32(*(unsigned __int16 *)v11.sa_data) >> 16;
}

uint64_t sub_21DC94F04(uint64_t a1)
{
  int v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  socklen_t v9;
  sockaddr v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 40);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = (sockaddr)0;
  v11 = 0u;
  v9 = 128;
  v4 = accept(v2, &v10, &v9);
  v5 = *(void **)(a1 + 32);
  if ((_DWORD)v4 == -1)
    objc_msgSend_disconnect(v5, v3, v4);
  else
    objc_msgSend__setupChannelWithConnectedSocket_assumingOwnership_orDisconnectBlock_(v5, v3, v4, 1, 0);
  return objc_msgSend__signalSocketAccepted(*(void **)(a1 + 32), v6, v7);
}

void sub_21DC950E0(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int *v4;
  char *v5;

  v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2))
    {
      v3 = *(unsigned int *)(a1 + 32);
      v4 = __error();
      v5 = strerror(*v4);
      NSLog(CFSTR("Error closing socket file descriptor %d while disconnecting: %s"), v3, v5);
    }
  }
}

id sub_21DC959F4(uint64_t a1, const char *a2)
{
  unsigned int v4;
  useconds_t v5;
  uint64_t v7;
  _DWORD *v8;
  int v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  signed int v24;
  signed int v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  BOOL v30;
  unint64_t v31;
  BOOL v32;
  unint64_t v33;
  pid_t v34;
  _QWORD *v35;
  useconds_t v36;
  int *v37;
  signed int v38;
  unsigned int v39;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v46;
  unsigned int *v47;
  unsigned int *v48;
  unsigned int *v49;
  _DWORD *v50;
  objc_super v51;
  _QWORD v52[2];
  uint64_t (*v53)(uint64_t, const void *, size_t);
  void *v54;
  uint64_t v55;
  uint8_t buf[15];
  unsigned __int8 v57;

  if (!atomic_load((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 48)))
  {
    v4 = 64;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 44))
        break;
      if (v4 <= 0x40)
        v5 = 64;
      else
        v5 = v4;
      usleep(v5);
      v4 = 2 * v5;
      if (2 * v5 >= 0x20000)
        v4 = 0x20000;
    }
    while (!atomic_load((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 48)));
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_DWORD **)(v7 + 48);
  v46 = a1;
  if (!v8[12])
  {
    objc_msgSend_setStatus_((void *)v7, a2, 1);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_DWORD **)(v7 + 48);
  }
  v9 = *(unsigned __int8 *)(v7 + 64);
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v53 = sub_21DC95D94;
  v54 = &unk_24E1AB340;
  v55 = v7;
  v10 = v52;
  v50 = v8;
  if (v8)
  {
    v11 = 0;
    v12 = 15;
    if (!v9)
      v12 = 13;
    v13 = 14;
    if (v9)
      v13 = 16;
    v14 = 8;
    if (!v9)
      v14 = 6;
    v15 = v8[v14];
    if (v9)
      v16 = v8 + 16;
    else
      v16 = v8 + 14;
    v17 = (uint64_t)v8 + v15 + 80;
    v18 = 9;
    if (!v9)
      v18 = 7;
    v19 = v8[v18];
    v20 = 11;
    if (!v9)
      v20 = 10;
    v21 = -1;
    v49 = &v50[v12];
    v48 = &v50[v13];
    v47 = &v50[v20];
    v22 = 64;
    v23 = (uint64_t)v50 + v15 + 80;
    while (1)
    {
      while (1)
      {
        v24 = atomic_load(v49);
        v25 = atomic_load(v48);
        v26 = v24 >= v25 ? 0 : v19;
        v27 = v26 + v24;
        v28 = atomic_load(v50 + 12);
        v29 = v28 | v11;
        if (v27 != v25)
          break;
        if (v29)
          v30 = 1;
        else
          v30 = v21 == 0;
        if (v30)
          goto LABEL_67;
        v31 = 1000 * v22;
        v32 = v21 >= v31;
        v33 = v21 - v31;
        if (v32)
          v21 = v33;
        else
          v21 = 0;
        v34 = atomic_load(v47);
        v35 = v10;
        if (v22 <= 0x40)
          v36 = 64;
        else
          v36 = v22;
        usleep(v36);
        v17 = v23;
        v11 = 0;
        v22 = 2 * v36;
        v10 = v35;
        if (v22 > 0x20000)
        {
          v11 = 0;
          v22 = 0x20000;
          if (v34)
          {
            v17 = v23;
            if (kill(v34, 0) != -1 || (v37 = __error(), v17 = v23, v11 = 1, *v37 != 3))
              v11 = 0;
          }
        }
      }
      v38 = v25;
      v39 = v27 - v25;
      if ((v22 & 0xFFFE0000) != 0 || v39 > v19 >> 2)
        v22 = 64;
      v41 = v10;
      v42 = v19 - v25 >= v39 ? v39 : v19 - v25;
      v57 = 0;
      ((void (*)(_QWORD *, uint64_t, uint64_t, unsigned __int8 *))v53)(v41, v17 + v25, v42, &v57);
      v43 = v39 - v42;
      if ((_DWORD)v43)
        ((void (*)(_QWORD *, uint64_t, uint64_t, unsigned __int8 *))v53)(v41, v17, v43, &v57);
      else
        LODWORD(v43) = v42 + v38;
      v10 = v41;
      v17 = v23;
      while (1)
      {
        v44 = __ldaxr(v16);
        if (v44 != v38)
          break;
        if (!__stlxr(v43, v16))
          goto LABEL_63;
      }
      __clrex();
      v17 = v23;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Inconsistent reader offset in shared memory! MT reception suspected...\n", buf, 2u);
        v17 = v23;
      }
LABEL_63:
      v11 = v57;
      if (v57)
        break;
      v21 = -1;
      if (v29)
        goto LABEL_67;
    }
    atomic_store(1u, v50 + 12);
  }
LABEL_67:

  v51.receiver = *(id *)(v46 + 32);
  v51.super_class = (Class)DTXSharedMemoryTransport;
  return objc_msgSendSuper2(&v51, sel_disconnect);
}

uint64_t sub_21DC95D94(uint64_t a1, const void *a2, size_t size)
{
  size_t v5;
  void *v6;
  void *v7;
  const char *v8;
  _QWORD v10[5];

  v5 = size;
  v6 = malloc_type_malloc(size, 0xFFD3155uLL);
  memcpy(v6, a2, v5);
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_21DC95E2C;
  v10[3] = &unk_24E1AAAE8;
  v10[4] = v6;
  return objc_msgSend_received_ofLength_destructor_(v7, v8, (uint64_t)v6, v5, v10);
}

void sub_21DC95E2C(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void sub_21DC96980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC96D8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_21DC973E8(uint64_t result, _QWORD *a2)
{
  if (a2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *a2;
  return result;
}

void sub_21DC976F4(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  const char *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  _BYTE *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  id v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  id v37;
  const char *v38;
  pid_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[5];
  uint64_t v49;
  int v50;
  uint64_t v51;
  _QWORD v52[8];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  const char *v58;
  unint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = sub_21DC97BC8;
  v52[3] = &unk_24E1AB3B0;
  v3 = a1 + 5;
  v2 = a1[5];
  v52[4] = a1[4];
  v52[5] = &v53;
  v4 = a1[6];
  v52[6] = v2;
  v52[7] = v4;
  v45 = MEMORY[0x22079E258](v52);
  v5 = (unint64_t)v54[3] >= *v3;
  v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v45;
  if (!v5)
  {
    do
    {
      v51 = 0;
      v7 = ((uint64_t (**)(_QWORD, uint64_t, uint64_t *))v6)[2](v6, 32, &v51);
      if (!v7 || *(_BYTE *)(a1[4] + 48))
        break;
      v9 = *(_DWORD *)v7;
      v10 = *(_DWORD *)(v7 + 4);
      v11 = *(unsigned __int16 *)(v7 + 8);
      v12 = *(unsigned __int16 *)(v7 + 10);
      v13 = *(unsigned int *)(v7 + 12);
      v14 = *(unsigned int *)(v7 + 16);
      v49 = *(_QWORD *)(v7 + 20);
      v50 = *(_DWORD *)(v7 + 28);
      if (v9 != 524114809)
      {
        v36 = MEMORY[0x24BDACB70];
        v37 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v38 = getprogname();
          v39 = getpid();
          v40 = a1[5] - v54[3] + 32;
          *(_DWORD *)buf = 136315650;
          v58 = v38;
          LOWORD(v59) = 1024;
          *(_DWORD *)((char *)&v59 + 2) = v39;
          HIWORD(v59) = 2048;
          v60 = v40;
          _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%u]: [connection error] handling %llu bytes with unexpected protocol header; disconnecting.",
            buf,
            0x1Cu);
        }

        *(_BYTE *)(a1[4] + 48) = 1;
        free(*(void **)(a1[4] + 8));
        *(_QWORD *)(a1[4] + 8) = 0;
        (*(void (**)(void))(*(_QWORD *)(a1[4] + 40) + 16))();
        v42 = a1[4];
        v41 = a1 + 4;
        v43 = *(void **)(v42 + 40);
        *(_QWORD *)(v42 + 40) = 0;

        v18 = *(void **)(*v41 + 32);
        *(_QWORD *)(*v41 + 32) = 0;
LABEL_21:

        v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v45;
        break;
      }
      if (v12 == 1)
      {
        v16 = ((uint64_t (**)(_QWORD, uint64_t, uint64_t *))v6)[2](v6, v13, &v51);
        if (!v16)
          break;
        v17 = (_BYTE *)a1[4];
        if (v17[48])
          break;
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = sub_21DC97CC8;
        v48[3] = &unk_24E1AAAE8;
        v48[4] = v16;
        *(_DWORD *)buf = 524114809;
        LODWORD(v58) = v10;
        WORD2(v58) = v11;
        HIWORD(v58) = 1;
        v59 = __PAIR64__(v14, v13);
        v60 = v49;
        v61 = v50;
        objc_msgSend__messageParsedWithHeader_bytes_length_destructor_(v17, v15, (uint64_t)buf, v16 + 32, v13, v48);
        *(_QWORD *)(a1[4] + 8) = 0;
        *(_QWORD *)(a1[4] + 16) = 0;
        *(_QWORD *)(a1[4] + 24) = 0;
      }
      else
      {
        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v8, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(v45 + 16))(v45, v13, &v51);
          if (!v20)
            goto LABEL_21;
          v21 = a1[4];
          if (*(_BYTE *)(v21 + 48))
            goto LABEL_21;
          objc_msgSend_objectForKeyedSubscript_(*(void **)(v21 + 64), v19, (uint64_t)v18);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendBytes_length_(v22, v23, v20 + 32, v13);
          if (v12 - 1 == v11)
          {
            v44 = (void *)a1[4];
            v24 = objc_retainAutorelease(v22);
            v27 = objc_msgSend_bytes(v24, v25, v26);
            v30 = objc_msgSend_length(v24, v28, v29);
            v46[0] = MEMORY[0x24BDAC760];
            v46[1] = 3221225472;
            v46[2] = sub_21DC97CD0;
            v46[3] = &unk_24E1AAAC8;
            v22 = v24;
            v47 = v22;
            *(_DWORD *)buf = 524114809;
            LODWORD(v58) = v10;
            WORD2(v58) = v11;
            HIWORD(v58) = v12;
            v59 = __PAIR64__(v14, v13);
            v60 = v49;
            v61 = v50;
            objc_msgSend__messageParsedWithHeader_bytes_length_destructor_(v44, v31, (uint64_t)buf, v27, v30, v46);
            objc_msgSend_removeObjectForKey_(*(void **)(a1[4] + 64), v32, (uint64_t)v18);

          }
        }
        else
        {
          v33 = objc_alloc(MEMORY[0x24BDBCEC8]);
          v22 = (id)objc_msgSend_initWithCapacity_(v33, v34, v13);
          objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 64), v35, (uint64_t)v22, v18);
        }
        *(_QWORD *)(a1[4] + 16) = 0;

        v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v45;
      }
    }
    while ((unint64_t)v54[3] < a1[5]);
  }

  _Block_object_dispose(&v53, 8);
}

void sub_21DC97B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC97BC8(_QWORD *a1, unsigned int a2, unint64_t *a3)
{
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *a3 + a2;
  *a3 = v5;
  v6 = (_QWORD *)a1[4];
  if (v6[3] < v5)
  {
    v6[3] = (v5 + 127) & 0xFFFFFFFFFFFFFF80;
    *(_QWORD *)(a1[4] + 8) = malloc_type_realloc(*(void **)(a1[4] + 8), *(_QWORD *)(a1[4] + 24), 0x8FB168ACuLL);
    v6 = (_QWORD *)a1[4];
    v5 = *a3;
  }
  v7 = v6[2];
  v8 = v5 - v7;
  if (v5 > v7)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    if (v8 >= a1[6] - v9)
      v8 = a1[6] - v9;
    v10 = v8;
    if ((_DWORD)v8)
    {
      memcpy((void *)(v6[1] + v7), (const void *)(a1[7] + v9), v8);
      *(_QWORD *)(a1[4] + 16) += v10;
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += v10;
      v6 = (_QWORD *)a1[4];
      v7 = v6[2];
      v5 = *a3;
    }
  }
  if (v7 >= v5)
    return v6[1];
  else
    return 0;
}

void sub_21DC97CC8(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t sub_21DC97CD0(uint64_t a1, const char *a2)
{
  return objc_msgSend_setLength_(*(void **)(a1 + 32), a2, 0);
}

uint64_t sub_21DC97D90(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DC97DA0(uint64_t a1)
{

}

void sub_21DC97DA8(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 48) = 1;
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = 0;

    v3 = *(_QWORD *)(a1 + 32);
  }
  v8 = *(_QWORD *)(v3 + 8);
  if (v8)
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, v8, *(_QWORD *)(v3 + 16));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void sub_21DC9814C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC98170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_QWORD *sub_21DC9817C(_QWORD *result, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;

  if (*(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v3 = *(_QWORD *)(result[6] + 8);
    v4 = *(_QWORD *)(v3 + 24);
    v5 = a3;
    if (v4 < a3)
      v5 = *(_QWORD *)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v4 - v5;
    v6 = a3 - v5;
    if (a3 != (_DWORD)v5)
    {
      v7 = *(_QWORD *)(result[5] + 8);
      v8 = *(_DWORD *)(v7 + 24);
      if (v6 >= v8)
        v9 = *(_DWORD *)(v7 + 24);
      else
        v9 = v6;
      *(_DWORD *)(v7 + 24) = v8 - v9;
      return (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
    }
  }
  return result;
}

__CFString *sub_21DC98474(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  const char *v6;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  __CFString *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  size_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  const char *v33;
  unint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  CFDictionaryRef v45;
  _QWORD v47[4];
  __CFString *v48;
  unint64_t *v49;
  size_t v50;
  _QWORD *v51;
  _QWORD v52[7];
  unint64_t v53;
  unint64_t *v54;
  uint64_t v55;
  int v56;

  v5 = a1;
  v8 = v5;
  if ((uint64_t *)kDTXInterruptionMessage == v5)
  {
    v10 = CFSTR("< DTXMessage : kDTXInterruptionMessage >");
    goto LABEL_43;
  }
  if (objc_msgSend_errorStatus(v5, v6, v7) == 2)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("< DTXMessage : i%u kDTXInterruptionMessage >"), a2);
LABEL_4:
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if ((uint64_t *)kDTXBarrierMessage == v8)
  {
    v10 = CFSTR("< DTXMessage : kDTXBarrierMessage >");
    goto LABEL_43;
  }
  if ((uint64_t *)kDTXAckBarrierMessage == v8)
  {
    v10 = CFSTR("< DTXMessage : kDTXAckBarrierMessage >");
    goto LABEL_43;
  }
  v11 = "";
  if ((a3 & 0x100000000) != 0)
    v12 = "e";
  else
    v12 = "";
  if ((uint64_t *)kDTXHeartbeatMessage == v8)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("< DTXMessage : i%d.%d%s kDTXHeartbeatMessage >"), a2, HIDWORD(a2), v12);
    goto LABEL_4;
  }
  if ((int)a3 >= 0)
    v13 = a3;
  else
    v13 = -(int)a3;
  if ((int)a3 < 0)
    v11 = "f";
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD16A8], v9, (uint64_t)CFSTR("< DTXMessage %p : i%d.%d%s c%d%s"), v8, a2, HIDWORD(a2), v12, v13, v11);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend_messageType(v8, v14, v15))
  {
    case 1u:
      v53 = 0;
      v18 = objc_retainAutorelease(v8);
      objc_msgSend_getBufferWithReturnedLength_(v18, v19, (uint64_t)&v53);
      if (v53 >> 30)
      {
        objc_msgSend_appendFormat_(v10, v20, (uint64_t)CFSTR(" buffer: %.3f GB"), (double)v53 * 9.31322575e-10);
      }
      else if (v53 < 0x100000)
      {
        if (v53 < 0x400)
          objc_msgSend_appendFormat_(v10, v20, (uint64_t)CFSTR(" buffer: %lld bytes"), v53);
        else
          objc_msgSend_appendFormat_(v10, v20, (uint64_t)CFSTR(" buffer: %.3f KB"), (double)v53 * 0.0009765625);
      }
      else
      {
        objc_msgSend_appendFormat_(v10, v20, (uint64_t)CFSTR(" buffer: %.3f MB"), (double)v53 * 0.000000953674316);
      }
      break;
    case 2u:
      objc_msgSend_appendString_(v10, v16, (uint64_t)CFSTR(" dispatch:["));
      objc_msgSend_payloadObject(v8, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsSeparatedByString_(v23, v24, (uint64_t)CFSTR(":"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_count(v25, v26, v27);
      v29 = malloc_type_calloc(v28, 8uLL, 0x80040B8603338uLL);
      v53 = 0;
      v54 = &v53;
      v55 = 0x2020000000;
      v56 = 0;
      v30 = v8[7];
      v31 = MEMORY[0x24BDAC760];
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = sub_21DC9C248;
      v52[3] = &unk_24E1AB628;
      v52[4] = &v53;
      v52[5] = v28;
      v52[6] = v29;
      sub_21DC9C1BC(v30, v52);
      v47[0] = v31;
      v47[1] = 3221225472;
      v47[2] = sub_21DC9C2B4;
      v47[3] = &unk_24E1AB650;
      v32 = v10;
      v48 = v32;
      v49 = &v53;
      v50 = v28;
      v51 = v29;
      objc_msgSend_enumerateObjectsUsingBlock_(v25, v33, (uint64_t)v47);
      if (*((_DWORD *)v54 + 6))
      {
        v34 = 0;
        do
        {
          v35 = (void *)v29[v34];
          v29[v34] = 0;

          ++v34;
        }
        while (v34 < *((unsigned int *)v54 + 6));
      }
      free(v29);
      objc_msgSend_appendString_(v32, v36, (uint64_t)CFSTR("]"));

      _Block_object_dispose(&v53, 8);
      goto LABEL_34;
    case 3u:
      objc_msgSend_payloadObject(v8, v16, v17);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v10, v40, (uint64_t)CFSTR(" object:(%@*)"), v39);

      objc_msgSend_payloadObject(v8, v41, v42);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      sub_21DC9C348(v10, v23, 0, 1);
      goto LABEL_34;
    case 4u:
      objc_msgSend_payloadObject(v8, v16, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v10, v43, (uint64_t)CFSTR(" error: \"%@\""), v23);
      goto LABEL_34;
    case 5u:
      objc_msgSend_appendString_(v10, v16, (uint64_t)CFSTR(" ack barrier"));
      break;
    case 6u:
      objc_msgSend_appendString_(v10, v16, (uint64_t)CFSTR(" primitive message"));
      break;
    case 7u:
      objc_msgSend_appendString_(v10, v16, (uint64_t)CFSTR(" compressed buffer"));
      break;
    case 8u:
      objc_msgSend_payloadObject(v8, v16, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v10, v44, (uint64_t)CFSTR(" rerouted message: %@"), v23);
LABEL_34:

      break;
    default:
      break;
  }
  objc_msgSend_appendString_(v10, v16, (uint64_t)CFSTR(" >"));
  v45 = CFDictionaryCreateWithDTXPrimitiveDictionary(v8[7]);
  if (v45)
    sub_21DC9C348(v10, v45, 1, 1);

LABEL_43:
  return v10;
}

void sub_21DC98910(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21DC989A4(void *a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2553ACB28);
    v2[2]();
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2553ACB28);
    v1 = v2;
  }

}

void sub_21DC989F8(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2553ACB28);
  objc_exception_rethrow();
}

void sub_21DC98A10(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DC98A24(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = MEMORY[0x22079E258](*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_2553ACB30;
  qword_2553ACB30 = v1;

}

uint64_t sub_21DC98D20(uint64_t result, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = qword_2553ACB30;
  if (qword_2553ACB30)
  {
    v4 = result;
    v5 = *(_QWORD *)(result + 40);
    v6 = objc_msgSend_length(*(void **)(*(_QWORD *)(result + 32) + 24), a2, a3);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, _QWORD))(v3 + 16))(v3, v5, v6, *(_QWORD *)(v4 + 48) * (unint64_t)dword_253F42640 / *(unsigned int *)algn_253F42644, *(unsigned int *)(v4 + 56));
  }
  return result;
}

id sub_21DC99490(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  id v12;
  const char *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a2;
  v12 = [v10 alloc];
  v14 = (__CFString *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, &a9);

  v15 = &stru_24E1ACC90;
  if (v14)
    v15 = v14;
  v16 = v15;

  v17 = (void *)MEMORY[0x24BDD1540];
  v23 = *MEMORY[0x24BDD0FC8];
  v24[0] = v16;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)v24, &v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v17, v20, (uint64_t)CFSTR("DTXConnection"), a1, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void sub_21DC99728(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, uint64_t, uint64_t);
  const char *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const __CFString *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v3 = a1;
  v4 = a2;
  v6 = (void *)MEMORY[0x22079E084]();
  if (v3)
  {
    v21 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x24BDD1618], v5, (uint64_t)v3, 1, &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)v21;
    if (!v7)
    {
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB8];
      v11 = objc_opt_class();
      v13 = &stru_24E1ACC90;
      if (v8)
        v13 = v8;
      objc_msgSend_raise_format_(v9, v12, v10, CFSTR("Unable to archive object <%@ %p> via NSSecureCoding. %@"), v3, v11, v13);
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v14 = objc_retainAutorelease(v7);
  v17 = objc_msgSend_bytes(v14, v15, v16);
  v20 = objc_msgSend_length(v14, v18, v19);
  v4[2](v4, v17, v20);

  objc_autoreleasePoolPop(v6);
}

unint64_t **sub_21DC9984C(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(_QWORD *)(a1 + 32) + 56), 0, a2, a3);
}

unint64_t **sub_21DC99A1C(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(_QWORD *)(a1 + 32) + 56), 0, a2, a3);
}

unint64_t **sub_21DC99C30(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(_QWORD *)(a1 + 32) + 56), 0, a2, a3);
}

uint64_t sub_21DC99DA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_21DC99EA4(uint64_t a1, const char *a2, unsigned int a3)
{
  uint64_t result;

  result = objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(*(void **)(a1 + 32), a2, (uint64_t)a2, a3, 1, 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 3;
  return result;
}

void sub_21DC99F28(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  _QWORD v23[4];
  id v24;

  v3 = a1;
  v6 = a2;
  if (!*((_QWORD *)v3 + 6))
  {
    v7 = (void *)*((_QWORD *)v3 + 3);
    if (v7)
    {
      v8 = *((_DWORD *)v3 + 2);
      if ((v8 - 2) < 3)
      {
        v9 = objc_msgSend_bytes(v7, v4, v5);
        v12 = objc_msgSend_length(*((void **)v3 + 3), v10, v11);
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = sub_21DC9CA8C;
        v23[3] = &unk_24E1AB6A0;
        v24 = v3;
        sub_21DC9C6B4(v9, v12, v6, v23);
        v13 = v24;
LABEL_12:

        goto LABEL_13;
      }
      if (v8 == 1)
      {
        v20 = objc_opt_class();
        if ((objc_msgSend_containsObject_(v6, v21, v20) & 1) == 0)
        {
          v13 = (void *)*((_QWORD *)v3 + 6);
          *((_QWORD *)v3 + 6) = 0;
          goto LABEL_12;
        }
        objc_msgSend_dataWithData_(MEMORY[0x24BDBCE50], v22, *((_QWORD *)v3 + 3));
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (v8 == 6)
      {
        v14 = objc_msgSend_bytes(v7, v4, v5);
        v17 = objc_msgSend_length(*((void **)v3 + 3), v15, v16);
        v18 = DTXPrimitiveDictionaryReferencingSerialized(v14, v17);
        v19 = (uint64_t)CFDictionaryCreateWithDTXPrimitiveDictionary(v18);
LABEL_10:
        v13 = (void *)*((_QWORD *)v3 + 6);
        *((_QWORD *)v3 + 6) = v19;
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

void sub_21DC9A2C0()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v4[0] = &unk_24E1AB4B8;
  v3[1] = objc_opt_class();
  v4[1] = &unk_24E1AB4F8;
  v3[2] = objc_opt_class();
  v4[2] = &unk_24E1AB538;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_253F42608;
  qword_253F42608 = v1;

}

unint64_t *sub_21DC9A384(int a1, unint64_t *a2, id a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v10 = (char *)objc_msgSend_UTF8String(v6, v8, v9);
  v13 = objc_msgSend_longLongValue(v7, v11, v12);

  return DTXPrimitiveDictionaryAddPrimitivePair(a2, v10, 6, v13);
}

unint64_t *sub_21DC9A3F8(int a1, unint64_t *a2, id a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v10 = (char *)objc_msgSend_UTF8String(v6, v8, v9);
  v11 = objc_retainAutorelease(v7);
  v14 = objc_msgSend_UTF8String(v11, v12, v13);

  return DTXPrimitiveDictionaryAddPrimitivePair(a2, v10, 1, v14);
}

unint64_t **sub_21DC9A474(int a1, unint64_t **a2, id a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  size_t v17;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v10 = (char *)objc_msgSend_UTF8String(v6, v8, v9);
  v11 = objc_retainAutorelease(v7);
  v14 = (void *)objc_msgSend_bytes(v11, v12, v13);
  v17 = objc_msgSend_length(v11, v15, v16);

  return DTXPrimitiveDictionaryAddBufferPair(a2, v10, v14, v17);
}

void sub_21DC9A4F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  Class Class;
  const char *v7;
  objc_class *Superclass;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  Class = object_getClass(v5);
  if (Class)
  {
    Superclass = Class;
    do
    {
      objc_msgSend_objectForKeyedSubscript_((void *)qword_253F42608, v7, (uint64_t)Superclass);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, *(_QWORD *)(a1 + 32) + 56, v11, v5);

      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
  }

}

unint64_t **sub_21DC9A90C(uint64_t a1, void *a2, size_t a3)
{
  unint64_t **v5;
  id v6;
  const char *v7;
  uint64_t v8;
  char *v9;

  v5 = (unint64_t **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = objc_retainAutorelease(*(id *)(a1 + 40));
  v9 = (char *)objc_msgSend_UTF8String(v6, v7, v8);
  return DTXPrimitiveDictionaryAddBufferPair(v5, v9, a2, a3);
}

uint64_t sub_21DC9AFC8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a2;
  if (qword_253F42600 != -1)
    dispatch_once(&qword_253F42600, &unk_24E1AB710);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = qword_253F425E8;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC9CBF8;
  block[3] = &unk_24E1AB760;
  v10 = &v12;
  v11 = a1;
  v9 = v3;
  v5 = v3;
  dispatch_sync(v4, block);
  v6 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_21DC9B578(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  void *v31;
  void *v32;
  uint64_t v33;
  id v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  if (a2 == 1)
  {
    v36 = objc_begin_catch(a1);
    v37 = (void *)MEMORY[0x24BDD1540];
    *(_QWORD *)(v33 - 128) = *MEMORY[0x24BDD0FC8];
    objc_msgSend_description(v36, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v33 - 120) = v40;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v41, v33 - 120, v33 - 128, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v37, v43, (uint64_t)CFSTR("DTXMessage"), 1, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend_newReplyWithError_(v32, v45, (uint64_t)v44);

    objc_msgSend_sendControlAsync_replyHandler_(v31, v47, (uint64_t)v46, 0);
    objc_end_catch();
    JUMPOUT(0x21DC9B52CLL);
  }
  _Unwind_Resume(a1);
}

void sub_21DC9B6B8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_21DC9CE40;
  v9[3] = &unk_24E1AB7B0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  _DTXPrimitiveDictionaryEnumerate(a1, (uint64_t)v9);

}

void sub_21DC9B758(uint64_t a1, uint64_t a2, void *a3, const void *a4, unsigned int a5, void *a6)
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  id v24;

  v10 = a3;
  v24 = v10;
  v11 = a6;
  v14 = v11;
  if (v11)
  {
    v15 = (void *)MEMORY[0x24BDBCE88];
    v16 = *MEMORY[0x24BDD1118];
    objc_msgSend_userInfo(v11, v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, *MEMORY[0x24BDD0BA0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v15, v20, v16, CFSTR("Arguments must conform to expected NSSecureCoding classes: %@"), v19, v24);

  }
  v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v21 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (a4)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = CFArrayCreateMutable(0, 0, 0);
      v22 = malloc_type_malloc(a5, 0x811CD51AuLL);
      memcpy(v22, a4, a5);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v22);
      objc_msgSend_setArgument_atIndex_(*(void **)(a1 + 32), v23, (uint64_t)v22, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 2);
    }
    else
    {
      if (v10)
      {
        objc_msgSend_addObject_(*(void **)(a1 + 40), v12, (uint64_t)v10);
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      objc_msgSend_setArgument_atIndex_(*(void **)(a1 + 32), v12, (uint64_t)&v24, v21 + 2);
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

void sub_21DC9B90C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  char *v6;

  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (a3)
    v5 = objc_msgSend_newReplyWithError_(v3, a2, a3);
  else
    v5 = objc_msgSend_newReplyWithObject_(v3, a2, (uint64_t)a2);
  v6 = (char *)v5;
  objc_msgSend_sendControlAsync_replyHandler_(v4, v6, (uint64_t)v6, 0);

}

uint64_t sub_21DC9BE40(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(*(void **)(a1 + 32), a2, (uint64_t)a2, a3, 0, 0);
}

uint64_t sub_21DC9BF88(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_21DC9BF9C(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(*(void **)(a1 + 32), a2, (uint64_t)a2, a3, 0, 0);
}

void sub_21DC9C1BC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)qword_253F42630;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_21DC9C648;
  v6[3] = &unk_24E1AB678;
  v7 = v3;
  v5 = v3;
  sub_21DC9B6B8(a1, v4, v6);

}

void sub_21DC9C248(_QWORD *a1, void *a2)
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a2;
  v5 = *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (a1[5] > v5)
  {
    v6 = v4;
    objc_storeStrong((id *)(a1[6] + 8 * v5), a2);
    v4 = v6;
    ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  }

}

void sub_21DC9C2B4(uint64_t a1, const char *a2, unint64_t a3)
{
  const char *v5;

  objc_msgSend_appendString_(*(void **)(a1 + 32), a2, (uint64_t)a2);
  if (a3 + 1 < *(_QWORD *)(a1 + 48))
  {
    if (a3)
      objc_msgSend_appendString_(*(void **)(a1 + 32), v5, (uint64_t)CFSTR(" "));
    objc_msgSend_appendString_(*(void **)(a1 + 32), v5, (uint64_t)CFSTR(":"));
    if (*(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > a3)
      sub_21DC9C348(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 56) + 8 * a3), 0, 0);
  }
}

void sub_21DC9C348(void *a1, void *a2, int a3, int a4)
{
  id v7;
  const char *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  id v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  id v39;
  const char *v40;
  const char *v41;
  char isKindOfClass;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  _QWORD v50[4];
  id v51;
  char v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;

  v7 = a1;
  v9 = a2;
  if (!v9)
  {
    objc_msgSend_appendString_(v7, v8, (uint64_t)CFSTR("nil"));
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v13 = objc_msgSend_length(v10, v11, v12);
    objc_msgSend_appendFormat_(v7, v14, (uint64_t)CFSTR("<NSData %p | %u bytes> "), v10, v13);
    if (!a3)
    {
LABEL_6:

      goto LABEL_8;
    }
    v15 = objc_retainAutorelease(v10);
    v18 = objc_msgSend_bytes(v15, v16, v17);
    v21 = objc_msgSend_length(v15, v19, v20);
    objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = sub_21DC9C8B8;
    v55[3] = &unk_24E1AB6A0;
    v56 = v7;
    sub_21DC9C6B4(v18, v21, v24, v55);

    v25 = v56;
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = objc_msgSend_count(v9, v26, v27);
    objc_msgSend_appendFormat_(v7, v29, (uint64_t)CFSTR("<NSArray %p | %ld objects>"), v9, v28);
    if (a4)
    {
      objc_msgSend_appendString_(v7, v30, (uint64_t)CFSTR(" { "));
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = sub_21DC9C988;
      v53[3] = &unk_24E1AB6C8;
      v31 = v7;
      v54 = v31;
      objc_msgSend_enumerateObjectsUsingBlock_(v9, v32, (uint64_t)v53);
      objc_msgSend_appendString_(v31, v33, (uint64_t)CFSTR(" }"));

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!a4)
      {
        v48 = objc_msgSend_count(v9, v34, v35);
        objc_msgSend_appendFormat_(v7, v49, (uint64_t)CFSTR("<NSDictionary %p | %ld key/value pairs>"), v9, v48);
        goto LABEL_8;
      }
      v10 = v9;
      if (!objc_msgSend_count(v10, v36, v37))
        goto LABEL_6;
      objc_msgSend_appendString_(v7, v38, (uint64_t)CFSTR(" {\n"));
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = sub_21DC9CA18;
      v50[3] = &unk_24E1AB6F0;
      v39 = v7;
      v51 = v39;
      v52 = a3;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v40, (uint64_t)v50);
      objc_msgSend_appendString_(v39, v41, (uint64_t)CFSTR("}"));
      v25 = v51;
      goto LABEL_5;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    sub_21DC9C900(v9, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v45;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend_appendFormat_(v7, v46, (uint64_t)CFSTR("\"%@\""), v45);
    else
      objc_msgSend_appendFormat_(v7, v46, (uint64_t)CFSTR("[%@]"), v45);

  }
LABEL_8:

}

void sub_21DC9C648(uint64_t a1, int a2, int a3, char *cStr, CFIndex length)
{
  CFDataRef ObjectFromPrimitiveType;

  if (cStr)
  {
    ObjectFromPrimitiveType = _createObjectFromPrimitiveType(a2, cStr, length);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void sub_21DC9C6B4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, _QWORD, id);
  const char *v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  void *v16;
  id v17[4];

  v17[3] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v10 = (void *)MEMORY[0x22079E084]();
  if (a2)
  {
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v9, a1, a2, 0);
    v17[0] = 0;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x24BDD1620], v13, (uint64_t)v12, v11, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v17[0];
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  if (v15)
    v16 = 0;
  else
    v16 = v14;
  ((void (**)(id, void *, id))v8)[2](v8, v16, v15);

  objc_autoreleasePoolPop(v10);
}

void sub_21DC9C8B8(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  sub_21DC9C900(a2, (const char *)a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("[%@]"), v5);

}

id sub_21DC9C900(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  objc_msgSend_description(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_length(v3, v4, v5) >= 0x101)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_substringToIndex_(v3, v6, 253);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)CFSTR("%@..."), v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }
  return v3;
}

void sub_21DC9C988(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  const char *v7;
  char *v8;

  v7 = a2;
  v8 = (char *)v7;
  if (a3 && (objc_msgSend_appendString_(*(void **)(a1 + 32), v7, (uint64_t)CFSTR(", ")), v7 = v8, a3 > 4))
  {
    objc_msgSend_appendString_(*(void **)(a1 + 32), v8, (uint64_t)CFSTR("... "));
    *a4 = 1;
  }
  else
  {
    sub_21DC9C348(*(_QWORD *)(a1 + 32), v7, 0, 0);
  }

}

uint64_t sub_21DC9CA18(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  const char *v7;
  const char *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend_appendFormat_(v5, v7, (uint64_t)CFSTR("    \"%@\" : "), a2);
  sub_21DC9C348(*(_QWORD *)(a1 + 32), v6, *(unsigned __int8 *)(a1 + 40), 0);

  return objc_msgSend_appendString_(*(void **)(a1 + 32), v8, (uint64_t)CFSTR("\n"));
}

void sub_21DC9CA8C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  if (v7 && *(_DWORD *)(v10 + 8) == 4)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD1398];
    v18[0] = *MEMORY[0x24BDD0FC8];
    v18[1] = v12;
    v19[0] = CFSTR("Failed to deserialize message");
    v19[1] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v19, v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v14, (uint64_t)CFSTR("DTXMessage"), 2, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 48);
    *(_QWORD *)(v16 + 48) = v15;

  }
  else
  {
    objc_storeStrong((id *)(v10 + 48), a2);
  }

}

void sub_21DC9CBB0()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("selector checking queue", 0);
  v1 = (void *)qword_253F425E8;
  qword_253F425E8 = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)qword_253F425F0;
  qword_253F425F0 = v2;

}

void sub_21DC9CBF8(uint64_t a1)
{
  objc_class *Superclass;
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD *v9;
  Protocol **v10;
  uint64_t v11;
  Protocol *v12;
  objc_method_description *v13;
  objc_method_description *v14;
  unint64_t v15;
  objc_method_description *v16;
  const char *name;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  void (*v22)(uint64_t, SEL);
  void *v23;
  id v24;
  unsigned int v25;
  unsigned int outCount;

  Superclass = (objc_class *)objc_opt_class();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(Superclass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_((void *)qword_253F425F0, v5, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v18 = v4;
    v19 = a1;
    v20 = v3;
    v7 = (void *)objc_opt_new();
    if (Superclass)
    {
      while (1)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v22 = sub_21DC9CDFC;
        v23 = &unk_24E1AB738;
        v24 = v7;
        v9 = v21;
        outCount = 0;
        v10 = class_copyProtocolList(Superclass, &outCount);
        if (outCount)
          break;
LABEL_13:
        if (v10)
          free(v10);

        Superclass = class_getSuperclass(Superclass);
        if (!Superclass)
          goto LABEL_16;
      }
      v11 = 0;
      while (1)
      {
        v12 = v10[v11];
        if (protocol_conformsToProtocol(v12, (Protocol *)&unk_2553ADC50))
        {
          v25 = 0;
          v13 = protocol_copyMethodDescriptionList(v12, 1, 1, &v25);
          v14 = v13;
          if (v25)
          {
            v15 = 0;
            v16 = v13;
            do
            {
              name = v16->name;
              ++v16;
              v22((uint64_t)v9, name);
              ++v15;
            }
            while (v15 < v25);
LABEL_11:
            free(v14);
            goto LABEL_12;
          }
          if (v13)
            goto LABEL_11;
        }
LABEL_12:

        if (++v11 >= (unint64_t)outCount)
          goto LABEL_13;
      }
    }
LABEL_16:
    v4 = v18;
    objc_msgSend_setObject_forKey_((void *)qword_253F425F0, v8, (uint64_t)v7, v18);
    a1 = v19;
    v3 = v20;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend_containsObject_(v7, v6, (uint64_t)v3);

}

void sub_21DC9CDFC(uint64_t a1, SEL aSelector)
{
  void *v2;
  const char *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(aSelector);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v2, v3, (uint64_t)v4);

}

void sub_21DC9CE40(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  int v10;

  if (!a2)
  {
    if (a3 == 2)
    {
      v6 = a5;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_21DC9CF04;
      v8[3] = &unk_24E1AB788;
      v7 = *(void **)(a1 + 32);
      v9 = *(id *)(a1 + 40);
      v10 = 2;
      sub_21DC9C6B4(a4, v6, v7, v8);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
}

void sub_21DC9CF04(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v8 = v5;
  if (v5 && objc_msgSend_code(v5, v6, v7) == 4865)
  {

    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t DTXSpawnSubtask(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  __int16 v24;
  int v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  int v34;
  const char *v35;
  int v36;
  id v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  int v51;
  int v52;
  int v53;
  int v54;
  _QWORD *v56;
  ipc_space_t *v57;
  mach_error_t v58;
  NSObject *v59;
  id v60;
  const char *v61;
  pid_t v62;
  char *v63;
  mach_error_t inserted;
  NSObject *v65;
  id v66;
  const char *v67;
  pid_t v68;
  char *v69;
  uint64_t v70;
  void (**v71)(_QWORD);
  void *v72;
  _QWORD v73[2];
  void (*v74)(uint64_t, mach_port_t, void *);
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  int v88;
  __int16 v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  posix_spawn_file_actions_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const posix_spawnattr_t *v99;
  uint64_t v100;
  posix_spawnattr_t v101;
  mach_port_name_t name[2];
  mach_port_name_t *v103;
  uint64_t v104;
  char v105;
  _BYTE buf[40];
  int v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v15 = a5;
  if (v9 && objc_msgSend_length(v9, v13, v14))
  {
    v98 = 0;
    v99 = (const posix_spawnattr_t *)&v98;
    v100 = 0x2020000000;
    v101 = 0;
    v94 = 0;
    v95 = (posix_spawn_file_actions_t *)&v94;
    v96 = 0x2020000000;
    v97 = 0;
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v93 = posix_spawnattr_init(&v101);
    if (*((_DWORD *)v91 + 6))
    {
      v16 = 0xFFFFFFFFLL;
LABEL_28:
      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v94, 8);
      _Block_object_dispose(&v98, 8);
      goto LABEL_29;
    }
    v89 = 0;
    v17 = posix_spawnattr_getflags(v99 + 3, &v89);
    *((_DWORD *)v91 + 6) |= v17;
    v18 = posix_spawnattr_setpgroup((posix_spawnattr_t *)v99 + 3, 0);
    *((_DWORD *)v91 + 6) |= v18;
    v89 |= 0x4002u;
    objc_msgSend_objectForKeyedSubscript_(v12, v19, (uint64_t)CFSTR("__DTX_SpawnSuspended"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_BOOLValue(v20, v21, v22);

    v24 = v89;
    if (v23)
    {
      v24 = v89 | 0x80;
      v89 |= 0x80u;
    }
    v25 = posix_spawnattr_setflags((posix_spawnattr_t *)v99 + 3, v24);
    *((_DWORD *)v91 + 6) |= v25;
    objc_msgSend_objectForKeyedSubscript_(v12, v26, (uint64_t)CFSTR("cpu_type"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    if (v27 && objc_msgSend_intValue(v27, v28, v29) != -1)
    {
      *(_DWORD *)buf = 0;
      *(_DWORD *)buf = objc_msgSend_intValue(v30, v31, v32);
      v33 = posix_spawnattr_setbinpref_np((posix_spawnattr_t *)v99 + 3, 1uLL, (cpu_type_t *)buf, 0);
      *((_DWORD *)v91 + 6) |= v33;
    }
    v34 = posix_spawn_file_actions_init(v95 + 3);
    v36 = *((_DWORD *)v91 + 6) | v34;
    *((_DWORD *)v91 + 6) = v36;
    v72 = v30;
    if (v36)
    {
      posix_spawnattr_destroy((posix_spawnattr_t *)v99 + 3);
    }
    else
    {
      objc_msgSend_objectForKeyedSubscript_(v12, v35, (uint64_t)CFSTR("stdin_path"));
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v39 = objc_msgSend_cStringUsingEncoding_(v37, v38, 4);
      if (v39)
        v40 = (const char *)v39;
      else
        v40 = "/dev/null";

      objc_msgSend_objectForKeyedSubscript_(v12, v41, (uint64_t)CFSTR("stdout_path"));
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend_cStringUsingEncoding_(v42, v43, 4);
      if (v44)
        v45 = (const char *)v44;
      else
        v45 = "/dev/null";

      objc_msgSend_objectForKeyedSubscript_(v12, v46, (uint64_t)CFSTR("stderr_path"));
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v49 = objc_msgSend_cStringUsingEncoding_(v47, v48, 4);
      if (v49)
        v50 = (const char *)v49;
      else
        v50 = "/dev/null";

      v51 = posix_spawn_file_actions_addopen(v95 + 3, 0, v40, 0, 0);
      *((_DWORD *)v91 + 6) |= v51;
      v52 = posix_spawn_file_actions_addopen(v95 + 3, 1, v45, 2, 0);
      *((_DWORD *)v91 + 6) |= v52;
      v53 = posix_spawn_file_actions_addopen(v95 + 3, 2, v50, 2, 0);
      v54 = *((_DWORD *)v91 + 6) | v53;
      *((_DWORD *)v91 + 6) = v54;
      if (!v54)
      {
        v85 = 0;
        v86 = &v85;
        v87 = 0x2020000000;
        v88 = -1;
        v73[0] = MEMORY[0x24BDAC760];
        v73[1] = 3221225472;
        v74 = sub_21DC9D6E0;
        v75 = &unk_24E1AB8D8;
        v76 = v10;
        v77 = v9;
        v78 = v11;
        v79 = v12;
        v81 = &v90;
        v82 = &v85;
        v83 = &v94;
        v84 = &v98;
        v80 = v15;
        v56 = v73;
        name[0] = 0;
        v57 = (ipc_space_t *)MEMORY[0x24BDAEC58];
        v58 = mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, name);
        if (v58)
        {
          v59 = MEMORY[0x24BDACB70];
          v60 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v61 = getprogname();
            v62 = getpid();
            v63 = mach_error_string(v58);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v61;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v62;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v63;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v58;
            _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n", buf, 0x22u);
          }

        }
        inserted = mach_port_insert_right(*v57, name[0], name[0], 0x14u);
        if (inserted)
        {
          v65 = MEMORY[0x24BDACB70];
          v66 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v67 = getprogname();
            v68 = getpid();
            v69 = mach_error_string(inserted);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v67;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v68;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v69;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = inserted;
            _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n", buf, 0x22u);
          }

        }
        v70 = name[0];
        *(_QWORD *)name = 0;
        v103 = name;
        v104 = 0x2020000000;
        v105 = 0;
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_21DC9EEA8;
        *(_QWORD *)&buf[24] = &unk_24E1AAB38;
        *(_QWORD *)&buf[32] = name;
        v107 = v70;
        v71 = (void (**)(_QWORD))MEMORY[0x22079E258](buf);
        v74((uint64_t)v56, v70, v71);
        v71[2](v71);

        _Block_object_dispose(name, 8);
        v16 = *((unsigned int *)v86 + 6);

        _Block_object_dispose(&v85, 8);
        goto LABEL_27;
      }
      posix_spawn_file_actions_destroy(v95 + 3);
      posix_spawnattr_destroy((posix_spawnattr_t *)v99 + 3);
    }
    v16 = 0xFFFFFFFFLL;
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "empty executable path specified", buf, 2u);
  }
  v16 = 0xFFFFFFFFLL;
LABEL_29:

  return v16;
}

void sub_21DC9D664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_21DC9D6E0(uint64_t a1, mach_port_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char **v9;
  size_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  char *const *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  size_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *const *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  int v66;
  task_t *v67;
  task_t v68;
  mach_error_t v69;
  const char *v70;
  pid_t v71;
  char *v72;
  uint64_t v73;
  id v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  int v78;
  mach_error_t v79;
  const char *v80;
  pid_t v81;
  char *v82;
  uint64_t v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  dispatch_semaphore_t v89;
  dispatch_queue_t v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  uint64_t v94;
  dispatch_source_t v95;
  NSObject *v96;
  id v97;
  NSObject *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  id v105;
  dispatch_time_t v106;
  int v107;
  pid_t v108;
  id *v109;
  uint64_t v110;
  pid_t v111;
  uint64_t v112;
  mach_port_t v113;
  id v114;
  id v115;
  uint64_t v116;
  char *v117;
  char *const *__attribute__((__org_arrdim(0,0))) v118;
  char **v119;
  dispatch_semaphore_t v120;
  NSObject *v121;
  void *v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  NSObject *v126;
  id v127;
  mach_port_t v128;
  _QWORD v129[4];
  NSObject *v130;
  NSObject *v131;
  id v132;
  id v133;
  uint64_t v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  id v139;
  NSObject *v140;
  id v141;
  _QWORD *v142;
  _QWORD *v143;
  _QWORD v144[3];
  char v145;
  mach_port_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  mach_port_t v155;
  int v156[4];
  _QWORD v157[5];
  id v158;
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;

  v113 = a2;
  v161 = *MEMORY[0x24BDAC8D0];
  v114 = a3;
  v6 = objc_msgSend_count(*(void **)(a1 + 32), v4, v5);
  v112 = (uint64_t)&v112;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char **)((char *)&v112 - v8);
  if (v7 >= 0x200)
    v10 = 512;
  else
    v10 = v7;
  bzero((char *)&v112 - v8, v10);
  v11 = objc_retainAutorelease(*(id *)(a1 + 40));
  v14 = objc_msgSend_UTF8String(v11, v12, v13);
  v119 = v9;
  *v9 = (char *)v14;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v116 = a1;
  v15 = *(id *)(a1 + 32);
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v151, v160, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v152;
    v21 = 1;
    do
    {
      v22 = 0;
      v23 = v21;
      v24 = v21;
      v25 = &v119[v21];
      do
      {
        if (*(_QWORD *)v152 != v20)
          objc_enumerationMutation(v15);
        objc_msgSend_description(*(void **)(*((_QWORD *)&v151 + 1) + 8 * v22), v17, v18);
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v25[v22] = (char *const)objc_msgSend_UTF8String(v26, v27, v28);

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v151, v160, 16);
      v21 = v24 + v22;
    }
    while (v19);
    v29 = v22 + v23;
  }
  else
  {
    v29 = 1;
  }

  v119[v29] = 0;
  v32 = *(void **)(v116 + 48);
  if (v32)
  {
    v122 = (void *)objc_msgSend_mutableCopy(v32, v30, v31);
  }
  else
  {
    objc_msgSend_processInfo(MEMORY[0x24BDD1760], v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_environment(v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = (void *)objc_msgSend_mutableCopy(v36, v37, v38);

  }
  v39 = getpid();
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v40, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v122, v42, (uint64_t)v41, CFSTR("__DTX_SpawnParentPidKey"));

  objc_msgSend_objectForKeyedSubscript_(*(void **)(v116 + 56), v43, (uint64_t)CFSTR("__DTX_SpawnDYLDForcePlatformKey"));
  v115 = (id)objc_claimAutoreleasedReturnValue();
  if (v115)
    objc_msgSend_setObject_forKeyedSubscript_(v122, v44, (uint64_t)v115, CFSTR("DYLD_FORCE_PLATFORM"));
  v46 = objc_msgSend_count(v122, v44, v45);
  MEMORY[0x24BDAC7A8](v46);
  if (v47 >= 0x200)
    v49 = 512;
  else
    v49 = v47;
  v118 = (char *const *)((char *)&v112 - v48);
  bzero((char *)&v112 - v48, v49);
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  objc_msgSend_allKeys(v122, v50, v51);
  v121 = objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v52, (uint64_t)&v147, v159, 16);
  if (v54)
  {
    v55 = 0;
    v56 = *(_QWORD *)v148;
    do
    {
      v57 = 0;
      v120 = (dispatch_semaphore_t)(int)v55;
      v117 = v55;
      v58 = &v118[(int)v55];
      do
      {
        if (*(_QWORD *)v148 != v56)
          objc_enumerationMutation(v121);
        v59 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v57);
        v60 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_objectForKey_(v122, v53, v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v60, v62, (uint64_t)CFSTR("%@=%@"), v59, v61);
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v58[v57] = (char *const)objc_msgSend_UTF8String(v63, v64, v65);

        ++v57;
      }
      while (v54 != v57);
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v53, (uint64_t)&v147, v159, 16);
      v55 = (char *)v120 + v57;
    }
    while (v54);
    v66 = v57 + (_DWORD)v117;
  }
  else
  {
    v66 = 0;
  }

  v118[v66] = 0;
  os_unfair_lock_lock(&stru_2553ACB38);
  v67 = (task_t *)MEMORY[0x24BDAEC58];
  v68 = *MEMORY[0x24BDAEC58];
  v146 = v113;
  v69 = mach_ports_register(v68, &v146, 1u);
  if (v69 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v70 = getprogname();
    v71 = getpid();
    v72 = mach_error_string(v69);
    LODWORD(v157[0]) = 136315906;
    *(_QWORD *)((char *)v157 + 4) = v70;
    WORD2(v157[1]) = 1024;
    *(_DWORD *)((char *)&v157[1] + 6) = v71;
    WORD1(v157[2]) = 2080;
    *(_QWORD *)((char *)&v157[2] + 4) = v72;
    WORD2(v157[3]) = 1024;
    *(_DWORD *)((char *)&v157[3] + 6) = v69;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n", (uint8_t *)v157, 0x22u);
  }
  v73 = *(_QWORD *)(*(_QWORD *)(v116 + 80) + 8);
  v74 = objc_retainAutorelease(*(id *)(v116 + 40));
  v77 = (const char *)objc_msgSend_UTF8String(v74, v75, v76);
  v78 = posix_spawn((pid_t *)(v73 + 24), v77, (const posix_spawn_file_actions_t *)(*(_QWORD *)(*(_QWORD *)(v116 + 88) + 8) + 24), (const posix_spawnattr_t *)(*(_QWORD *)(*(_QWORD *)(v116 + 96) + 8) + 24), v119, v118);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v116 + 72) + 8) + 24) = v78;
  v79 = mach_ports_register(*v67, &v155, 0);
  if (v79 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v80 = getprogname();
    v81 = getpid();
    v82 = mach_error_string(v79);
    LODWORD(v157[0]) = 136315906;
    *(_QWORD *)((char *)v157 + 4) = v80;
    WORD2(v157[1]) = 1024;
    *(_DWORD *)((char *)&v157[1] + 6) = v81;
    WORD1(v157[2]) = 2080;
    *(_QWORD *)((char *)&v157[2] + 4) = v82;
    WORD2(v157[3]) = 1024;
    *(_DWORD *)((char *)&v157[3] + 6) = v79;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n", (uint8_t *)v157, 0x22u);
  }
  os_unfair_lock_unlock(&stru_2553ACB38);
  posix_spawn_file_actions_destroy((posix_spawn_file_actions_t *)(*(_QWORD *)(*(_QWORD *)(v116 + 88) + 8) + 24));
  posix_spawnattr_destroy((posix_spawnattr_t *)(*(_QWORD *)(*(_QWORD *)(v116 + 96) + 8) + 24));
  v83 = v116;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v116 + 72) + 8) + 24))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v84 = objc_retainAutorelease(*(id *)(v83 + 40));
      v87 = objc_msgSend_UTF8String(v84, v85, v86);
      v88 = strerror(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v116 + 72) + 8) + 24));
      LODWORD(v157[0]) = 136315394;
      *(_QWORD *)((char *)v157 + 4) = v87;
      WORD2(v157[1]) = 2080;
      *(_QWORD *)((char *)&v157[1] + 6) = v88;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to posix spawn %s: %s", (uint8_t *)v157, 0x16u);
      v83 = v116;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v83 + 80) + 8) + 24) = -1;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v121 = objc_claimAutoreleasedReturnValue();
    v89 = dispatch_semaphore_create(0);
    v90 = dispatch_queue_create("helper process handshake queue", 0);
    v157[0] = 0;
    v157[1] = v157;
    v157[2] = 0x3032000000;
    v157[3] = sub_21DC9E18C;
    v157[4] = sub_21DC9E19C;
    v158 = 0;
    v144[0] = 0;
    v144[1] = v144;
    v144[2] = 0x2020000000;
    v145 = 0;
    v91 = MEMORY[0x24BDAC760];
    v137[0] = MEMORY[0x24BDAC760];
    v137[1] = 3221225472;
    v137[2] = sub_21DC9E1A4;
    v137[3] = &unk_24E1AB810;
    v142 = v144;
    v141 = *(id *)(v83 + 64);
    v138 = *(id *)(v83 + 40);
    v120 = v89;
    v139 = v120;
    v143 = v157;
    v92 = v90;
    v140 = v92;
    v93 = (void *)MEMORY[0x22079E258](v137);
    v94 = v116;
    v95 = dispatch_source_create(MEMORY[0x24BDAC9F8], *(int *)(*(_QWORD *)(*(_QWORD *)(v116 + 80) + 8) + 24), 0x80000000uLL, v121);
    if (v95)
    {
      v129[0] = v91;
      v129[1] = 3221225472;
      v129[2] = sub_21DC9E530;
      v129[3] = &unk_24E1AB838;
      v134 = *(_QWORD *)(v94 + 80);
      v96 = v92;
      v130 = v96;
      v97 = v93;
      v132 = v97;
      v133 = v114;
      v98 = v95;
      v131 = v98;
      dispatch_source_set_event_handler(v98, v129);
      dispatch_resume(v98);
      if (*(_QWORD *)(v94 + 64))
      {
        objc_msgSend_objectForKeyedSubscript_(*(void **)(v94 + 56), v99, (uint64_t)CFSTR("SpawnTimeout"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend_unsignedLongLongValue(v100, v101, v102);

        v125[0] = v91;
        v125[1] = 3221225472;
        v125[2] = sub_21DC9E5E8;
        v125[3] = &unk_24E1AB8B0;
        v128 = v113;
        v104 = v96;
        v126 = v104;
        v105 = v97;
        v127 = v105;
        dispatch_async(v121, v125);
        if (v103)
          v106 = dispatch_time(0, 1000000 * v103);
        else
          v106 = -1;
        v110 = v116;
        if (dispatch_semaphore_wait(v120, v106))
        {
          v123[0] = v91;
          v123[1] = 3221225472;
          v123[2] = sub_21DC9E804;
          v123[3] = &unk_24E1AAF48;
          v124 = v105;
          dispatch_sync(v104, v123);
          v111 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v110 + 80) + 8) + 24);
          if (v111 >= 1)
            kill(v111, 9);

        }
      }

      v109 = (id *)&v130;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v107 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v94 + 80) + 8) + 24);
        v156[0] = 67109120;
        v156[1] = v107;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to start observing process with pid %i", (uint8_t *)v156, 8u);
      }
      v108 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v94 + 80) + 8) + 24);
      v156[0] = 0;
      waitpid(v108, v156, 1);
      v135[0] = v91;
      v135[1] = 3221225472;
      v135[2] = sub_21DC9E51C;
      v135[3] = &unk_24E1AAF48;
      v136 = v93;
      dispatch_async(v92, v135);
      (*((void (**)(void))v114 + 2))();
      v109 = &v136;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v94 + 80) + 8) + 24) = -1;
    }

    _Block_object_dispose(v144, 8);
    _Block_object_dispose(v157, 8);

  }
}

void sub_21DC9E158(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 + 376), 8);
  _Block_object_dispose((const void *)(v1 + 576), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC9E18C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DC9E19C(uint64_t a1)
{

}

void sub_21DC9E1A4(uint64_t a1, mach_port_t a2, int a3)
{
  uint64_t v3;
  void *v7;
  dispatch_source_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  pid_t v12;
  mach_msg_return_t v13;
  const char *v14;
  pid_t v15;
  char *v16;
  _QWORD v17[4];
  id v18;
  mach_port_t v19;
  mach_msg_header_t v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  pid_t v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  mach_msg_return_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    if (*(_QWORD *)(a1 + 56))
    {
      v7 = (void *)MEMORY[0x22079E084]();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      if (a2 - 1 > 0xFFFFFFFD
        || (a3 - 1) >= 0xFFFFFFFE
        || mach_port_mod_refs(*MEMORY[0x24BDAEC58], a2, 0, 1))
      {
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      }
      else
      {
        v8 = dispatch_source_create(MEMORY[0x24BDAC9E8], a2, 1uLL, *(dispatch_queue_t *)(a1 + 48));
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v11 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = sub_21DC9E4E8;
        v17[3] = &unk_24E1AB2F8;
        v18 = *(id *)(a1 + 40);
        v19 = a2;
        dispatch_source_set_event_handler(v11, v17);
        dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
        v12 = getpid();
        v20.msgh_remote_port = a2;
        v20.msgh_local_port = 0;
        *(_QWORD *)&v20.msgh_bits = 0x2000000013;
        *(_QWORD *)&v20.msgh_voucher_port = 0;
        v21 = v12;
        v13 = mach_msg_send(&v20);
        if (v13)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v14 = getprogname();
            v15 = getpid();
            v16 = mach_error_string(v13);
            *(_DWORD *)buf = 136315906;
            v23 = v14;
            v24 = 1024;
            v25 = v15;
            v26 = 2080;
            v27 = v16;
            v28 = 1024;
            v29 = v13;
            _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n", buf, 0x22u);
          }
        }

      }
      objc_autoreleasePoolPop(v7);
    }
  }
}

void sub_21DC9E3DC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 buf)
{
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;

  if (a2)
  {
    if (a2 == 2)
    {
      v20 = objc_begin_catch(a1);
      v21 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_retainAutorelease(*(id *)(v19 + 32));
        v26 = objc_msgSend_UTF8String(v23, v24, v25);
        objc_msgSend_description(v20, v27, v28);
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v32 = objc_msgSend_UTF8String(v29, v30, v31);
        LODWORD(buf) = 136315394;
        *(_QWORD *)((char *)&buf + 4) = v26;
        WORD6(buf) = 2080;
        *(_QWORD *)((char *)&buf + 14) = v32;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DTXSpawnSubtask handshake block failed for %s: %s", (uint8_t *)&buf, 0x16u);

      }
      objc_end_catch();
      JUMPOUT(0x21DC9E24CLL);
    }
    objc_begin_catch(a1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v19 + 40));
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21DC9E4E8(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return mach_port_deallocate(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 40));
}

uint64_t sub_21DC9E51C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21DC9E530(uint64_t a1)
{
  pid_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  int v9;

  v2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v9 = 0;
  waitpid(v2, &v9, 1);
  v3 = *(NSObject **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21DC9E5D4;
  v7[3] = &unk_24E1AAF48;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v3, v7);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v4, v5, v6);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));

}

uint64_t sub_21DC9E5D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21DC9E5E8(uint64_t a1)
{
  mach_port_name_t v2;
  _QWORD *v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  _QWORD v7[2];
  void (*v8)(uint64_t, uint64_t, uint64_t, int);
  void *v9;
  id v10;
  id v11;
  int v12;
  _BYTE msg[32];
  __int128 v14;

  v2 = *(_DWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v8 = sub_21DC9E770;
  v9 = &unk_24E1AB888;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(_DWORD *)(a1 + 48);
  v3 = v7;
  v14 = 0u;
  memset(msg, 0, sizeof(msg));
  if (mach_msg((mach_msg_header_t *)msg, 2, 0, 0x30u, v2, 0, 0) || *(_DWORD *)&msg[20] == 70)
  {
    v8((uint64_t)v3, 0, 4, 0);
  }
  else
  {
    if (HIDWORD(v14) + *(_DWORD *)&msg[4] == 48
      && *(_DWORD *)&msg[24] == 1
      && !HIBYTE(DWORD1(v14))
      && ((v4 = HIWORD(DWORD1(v14)), (HIWORD(DWORD1(v14)) - 22) < 0xFFFFFFFA)
       || (*(_DWORD *)msg & 0x80000000) != 0))
    {
      if (v4 == 16)
        v5 = 1;
      else
        v5 = 4 * ((v4 - 17) > 4);
      if (*(int *)msg >= 0)
        v6 = 6;
      else
        v6 = v5;
      v8((uint64_t)v3, *(unsigned int *)&msg[28], v6, *(unsigned int *)&msg[8]);
    }
    else
    {
      v8((uint64_t)v3, 0, 4, 0);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

}

void sub_21DC9E770(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  NSObject *v6;
  int v7;
  _QWORD v8[4];
  id v9;
  int v10;
  int v11;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_21DC9E7F0;
  v8[3] = &unk_24E1AB860;
  v6 = *(NSObject **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v7 = *(_DWORD *)(a1 + 48);
  v10 = a4;
  v11 = v7;
  dispatch_sync(v6, v8);

}

uint64_t sub_21DC9E7F0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

uint64_t sub_21DC9E804(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void DTXSubtaskCheckin(void *a1)
{
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  char *v6;
  int v7;
  const char *v8;
  uint64_t v9;
  task_t *v10;
  BOOL v11;
  mach_port_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  int *v16;
  mach_error_t v17;
  const char *v18;
  pid_t v19;
  char *v20;
  mach_error_t inserted;
  const char *v22;
  pid_t v23;
  char *v24;
  uint64_t v25;
  void (**v26)(_QWORD);
  const char *v27;
  mach_error_t v28;
  const char *v29;
  pid_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void *v35;
  id v36;
  mach_port_t v37;
  mach_msg_type_number_t init_port_setCnt;
  mach_port_array_t init_port_set;
  size_t v40[3];
  char v41;
  mach_port_t v42;
  int v43[2];
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, void *);
  void *v46;
  uint64_t *v47;
  mach_port_t v48;
  uint8_t buf[48];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)MEMORY[0x22079E084]();
  v5 = (const char *)objc_msgSend_UTF8String(CFSTR("__DTX_SpawnParentPidKey"), v3, v4);
  v6 = getenv(v5);
  if (v6)
  {
    v7 = atoi(v6);
    if (v7 != getppid())
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      memset(buf, 0, sizeof(buf));
      v40[0] = 648;
      *(_QWORD *)v43 = 0xE00000001;
      LODWORD(v44) = 1;
      HIDWORD(v44) = getpid();
      if (sysctl(v43, 4u, buf, v40, 0, 0) || !v40[0] || (*(_WORD *)&buf[32] & 0x800) == 0)
        goto LABEL_21;
    }
  }
  else if (getppid())
  {
    goto LABEL_21;
  }
  init_port_set = 0;
  init_port_setCnt = 0;
  v10 = (task_t *)MEMORY[0x24BDAEC58];
  if (mach_ports_lookup(*MEMORY[0x24BDAEC58], &init_port_set, &init_port_setCnt))
    v11 = 1;
  else
    v11 = init_port_setCnt == 0;
  if (v11 || (v12 = *init_port_set, *init_port_set + 1 < 2))
  {
    v12 = 0;
  }
  else
  {
    mig_deallocate((vm_address_t)init_port_set, 4 * init_port_setCnt);
    v28 = mach_ports_register(*v10, &v42, 0);
    if (v28 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v29 = getprogname();
      v30 = getpid();
      v31 = mach_error_string(v28);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v30;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v31;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v28;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n", buf, 0x22u);
    }
  }
  v13 = MEMORY[0x24BDAC760];
  v32 = MEMORY[0x24BDAC760];
  v33 = 3221225472;
  v34 = sub_21DC9ECF8;
  v35 = &unk_24E1AB900;
  v37 = v12;
  v36 = v1;
  v14 = &v32;
  *(_QWORD *)v43 = v13;
  v44 = 3221225472;
  v45 = sub_21DC9F07C;
  v46 = &unk_24E1AABD8;
  v48 = v12;
  v15 = v14;
  v47 = v15;
  v16 = v43;
  LODWORD(v40[0]) = 0;
  v17 = mach_port_allocate(*v10, 1u, (mach_port_name_t *)v40);
  if (v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v18 = getprogname();
    v19 = getpid();
    v20 = mach_error_string(v17);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v19;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v20;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v17;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n", buf, 0x22u);
  }
  inserted = mach_port_insert_right(*v10, v40[0], v40[0], 0x14u);
  if (inserted && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v22 = getprogname();
    v23 = getpid();
    v24 = mach_error_string(inserted);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v23;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v24;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = inserted;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n", buf, 0x22u);
  }
  v25 = LODWORD(v40[0]);
  v40[0] = 0;
  v40[1] = (size_t)v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  *(_QWORD *)buf = v13;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_21DC9EEA8;
  *(_QWORD *)&buf[24] = &unk_24E1AAB38;
  *(_QWORD *)&buf[32] = v40;
  *(_DWORD *)&buf[40] = v25;
  v26 = (void (**)(_QWORD))MEMORY[0x22079E258](buf);
  v45((uint64_t)v16, v25, v26);
  v26[2](v26);

  _Block_object_dispose(v40, 8);
  mach_port_deallocate(*v10, v12);

LABEL_21:
  v27 = (const char *)objc_msgSend_UTF8String(CFSTR("__DTX_SpawnParentPidKey"), v8, v9, v32, v33, v34, v35);
  unsetenv(v27);
  objc_autoreleasePoolPop(v2);

}

void sub_21DC9ECD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DC9ECF8(uint64_t a1, uint64_t a2)
{
  mach_port_name_t v4;
  mach_msg_return_t v5;
  mach_error_t v6;
  const char *v7;
  pid_t v8;
  char *v9;
  uint64_t v10;
  mach_port_name_t name[4];
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  pid_t v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  mach_error_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 40);
  *(_QWORD *)&v12 = 0;
  *((_QWORD *)&v12 + 1) = 1;
  v13 = 0x13000000000000;
  name[2] = v4;
  name[3] = a2;
  *(_QWORD *)name = 0x2880001413;
  v5 = mach_msg_send((mach_msg_header_t *)name);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v7 = getprogname();
      v8 = getpid();
      v9 = mach_error_string(v6);
      *(_DWORD *)buf = 136315906;
      v15 = v7;
      v16 = 1024;
      v17 = v8;
      v18 = 2080;
      v19 = v9;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n", buf, 0x22u);
    }
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v10, *(unsigned int *)(a1 + 40), a2);
  v13 = 0;
  *(_OWORD *)name = 0u;
  v12 = 0u;
  if (!mach_msg((mach_msg_header_t *)name, 2, 0, 0x28u, a2, 0, 0) && DWORD1(v12) != 70)
  {
    if ((name[0] & 0x80000000) != 0)
    {
      mach_msg_destroy((mach_msg_header_t *)name);
    }
    else if (HIDWORD(v13) + name[1] == 40)
    {
      mach_port_deallocate(*MEMORY[0x24BDAEC58], name[2]);
    }
  }
}

void sub_21DC9EEA8(uint64_t a1)
{
  unsigned __int8 *v2;
  mach_port_name_t v4;
  ipc_space_t *v5;
  kern_return_t v6;
  mach_error_t v7;
  kern_return_t v8;
  mach_error_t v9;
  const char *v10;
  pid_t v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  pid_t v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  mach_error_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, v2));
  v4 = *(_DWORD *)(a1 + 40);
  if (v4 + 1 >= 2)
  {
    v5 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    v6 = mach_port_mod_refs(*MEMORY[0x24BDAEC58], v4, 1u, -1);
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v13 = 136315906;
        v14 = getprogname();
        v15 = 1024;
        v16 = getpid();
        v17 = 2080;
        v18 = mach_error_string(v7);
        v19 = 1024;
        v20 = v7;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_mod_refs' failed: %s (%d)\n", (uint8_t *)&v13, 0x22u);
      }
    }
    v8 = mach_port_deallocate(*v5, *(_DWORD *)(a1 + 40));
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v10 = getprogname();
        v11 = getpid();
        v12 = mach_error_string(v9);
        v13 = 136315906;
        v14 = v10;
        v15 = 1024;
        v16 = v11;
        v17 = 2080;
        v18 = v12;
        v19 = 1024;
        v20 = v9;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_deallocate' failed: %s (%d)\n", (uint8_t *)&v13, 0x22u);
      }
    }
  }
}

void sub_21DC9F07C(uint64_t a1, uint64_t a2, void *a3)
{
  uintptr_t v5;
  NSObject *v6;
  id v7;
  NSObject *source;

  v5 = *(unsigned int *)(a1 + 40);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a3;
  source = dispatch_source_create(MEMORY[0x24BDAC9E8], v5, 1uLL, v6);

  dispatch_source_set_event_handler(source, v7);
  dispatch_activate(source);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  dispatch_source_cancel(source);

}

void sub_21DC9F17C(_DWORD *a1)
{
  dispatch_queue_t v1;
  void *v2;
  dispatch_queue_t v3;
  void *v4;
  _DWORD *v5;

  a1[12] = -1;
  a1[13] = -1;
  v5 = a1;
  v1 = dispatch_queue_create("transport input queue", 0);
  v2 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v1;

  v3 = dispatch_queue_create("transport output queue", 0);
  v4 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v3;

  v5[18] = -1;
}

uint64_t sub_21DC9F394(void *a1, int a2, _QWORD *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;

  v5 = objc_retainAutorelease(a1);
  v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  v9 = 420;
  if ((a2 & 0x200) == 0)
    v9 = 0;
  v10 = open(v8, a2, v9);
  if ((v10 & 0x80000000) != 0)
  {
    if (a3)
    {
      __error();
      _NSErrorWithFilePathErrnoAndVariant();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = __error();
      NSLog(CFSTR("Error opening path: %@ (%d)"), v5, *v11);
    }
  }

  return v10;
}

void sub_21DC9F448(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int *v4;
  char *v5;
  int v6;
  uint64_t v7;
  int *v8;
  char *v9;

  v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0 && close(v2))
  {
    v3 = *(unsigned int *)(a1 + 32);
    v4 = __error();
    v5 = strerror(*v4);
    NSLog(CFSTR("Error closing input file descriptor %d while disconnecting: %s"), v3, v5);
  }
  v6 = *(_DWORD *)(a1 + 36);
  if ((v6 & 0x80000000) == 0 && v6 != *(_DWORD *)(a1 + 32))
  {
    if (close(v6))
    {
      v7 = *(unsigned int *)(a1 + 36);
      v8 = __error();
      v9 = strerror(*v8);
      NSLog(CFSTR("Error closing output file descriptor %d while disconnecting: %s"), v7, v9);
    }
  }
}

void sub_21DC9F67C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  ssize_t v4;
  const char *v5;
  ssize_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v2 = malloc_type_malloc(0x4000uLL, 0x9FB2C939uLL);
  v3 = MEMORY[0x24BDAC760];
  do
  {
    while (1)
    {
      v4 = read(*(_DWORD *)(a1 + 40), v2, 0x4000uLL);
      if (v4 < 0)
        break;
      v6 = v4;
      if (!v4)
        goto LABEL_9;
      v7 = *(void **)(a1 + 32);
      v11[0] = v3;
      v11[1] = 3221225472;
      v11[2] = sub_21DC9F7B0;
      v11[3] = &unk_24E1AAAE8;
      v11[4] = v2;
      objc_msgSend_received_ofLength_destructor_(v7, v5, (uint64_t)v2, v6, v11);
      v2 = malloc_type_malloc(0x4000uLL, 0xF7738F1FuLL);
    }
  }
  while (*__error() == 4);
  if (*__error() == 35)
  {
    free(v2);
    return;
  }
LABEL_9:
  free(v2);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 64);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = sub_21DC9F7B8;
  v10[3] = &unk_24E1AAAC8;
  v10[4] = v8;
  dispatch_async(v9, v10);
}

void sub_21DC9F7B0(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t sub_21DC9F7B8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_disconnect(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_21DC9FA58(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0)
    close(v2);
  result = *(unsigned int *)(a1 + 36);
  if ((result & 0x80000000) == 0)
    return close(result);
  return result;
}

uint64_t sub_21DC9FBAC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DC9FBBC(uint64_t a1)
{

}

void sub_21DC9FBC4(uint64_t a1)
{
  __int128 v1;
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_21DC9FC28;
  v3[3] = &unk_24E1AAA28;
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  v4 = v1;
  dispatch_sync(v2, v3);
}

void sub_21DC9FC28(uint64_t a1)
{
  uint64_t v1;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(v1 + 48) & 0x80000000) == 0 && (*(_DWORD *)(v1 + 52) & 0x80000000) == 0)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    xpc_dictionary_set_fd(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_inFD", *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48));
    xpc_dictionary_set_fd(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_outFD", *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52));
  }
}

void sub_21DC9FE28(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC9FE48(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  _QWORD block[6];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC9FEF8;
  block[3] = &unk_24E1AB928;
  block[4] = v1;
  block[5] = &v8;
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  dispatch_sync(v2, block);
  v3 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

ssize_t sub_21DC9FEF8(uint64_t a1)
{
  ssize_t result;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  result = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 52);
  if ((result & 0x80000000) != 0)
    goto LABEL_7;
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
  {
    if (*(_QWORD *)(a1 + 64))
      abort();
    result = 0;
    goto LABEL_10;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  result = write(result, (const void *)(v3 + v4), *(_QWORD *)(a1 + 64) - v4);
  if (result != -1)
  {
LABEL_10:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += result;
    return result;
  }
  result = (ssize_t)__error();
  if (*(_DWORD *)result != 4)
  {
    result = (ssize_t)__error();
    if (*(_DWORD *)result != 35)
    {
      result = objc_msgSend_disconnect(*(void **)(a1 + 32), v5, v6);
LABEL_7:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  return result;
}

void sub_21DCA0084(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = 0;

  }
}

void sub_21DCA00D4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DCA0134;
  block[3] = &unk_24E1AAAC8;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_21DCA0134(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 96);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 52) = -1;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = -1;
}

void sub_21DCA0288()
{
  __assert_rtn("_getScratchBufferForAlgorithm", "DTXBlockCompressor.m", 153, "false && \"unexpected: compression type with libcompression is not known\"");
}

void sub_21DCA02B0()
{
  __assert_rtn("_returnScratchBufferForAlgorithm", "DTXBlockCompressor.m", 183, "false && \"unexpected: compression type with libcompression is not known\"");
}

void sub_21DCA02D8()
{
  __assert_rtn("DTXTransportPreserveDataInSerializedTransport", "DTXTransport_Internal.h", 22, "xpc_get_type(serializedTransport) == XPC_TYPE_DICTIONARY");
}

void sub_21DCA0300()
{
  __assert_rtn("_withSynchronizedHandler", "DTXConnection.m", 967, "actions");
}

void sub_21DCA0328()
{
  __assert_rtn("-[DTXConnection _unregisterChannel:]_block_invoke", "DTXConnection.m", 1404, "channel == unconfiguredChannel");
}

void sub_21DCA0350()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 30, "socketFlagsSet");
}

void sub_21DCA0378()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 38, "ret == 0");
}

void sub_21DCA03A0()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 36, "ret == 0");
}

void sub_21DCA03C8()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 33, "ret == 0");
}

void sub_21DCA03F0()
{
  __assert_rtn("-[DTXSocketTransport _setupChannelWithConnectedSocket:assumingOwnership:orDisconnectBlock:]", "DTXSocketTransport.m", 91, "self.status == DTXTransportStatus_Unavailable");
}

void sub_21DCA0418()
{
  __assert_rtn("-[DTXMessageTransmitter transmitMessage:routingInfo:fragment:transmitter:]", "DTXMessageProtocols.m", 241, "fragmentIndex < numberOfPieces");
}

void sub_21DCA0440()
{
  __assert_rtn("-[DTXMessage compressWithCompressor:usingType:forCompatibilityWithVersion:]", "DTXMessage.m", 417, "compressor && \"null compressor\"");
}

void sub_21DCA0468(int *a1, uint64_t a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v4 = *a1;
    v5[0] = 67109376;
    v5[1] = v4;
    v6 = 2048;
    v7 = a2;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "invalid compression type %d specified for compatibility version %ld", (uint8_t *)v5, 0x12u);
  }
  __assert_rtn("-[DTXMessage compressWithCompressor:usingType:forCompatibilityWithVersion:]", "DTXMessage.m", 471, "false && \"unexpected _compressionType, unsupported by compatibility version 1 --- logic error in compression selection\"");
}

void sub_21DCA050C()
{
  __assert_rtn("-[DTXMessage _decompressedData:compressor:compressionType:]", "DTXMessage.m", 1177, "compressor && \"deserializing compressed block but no DTXBlockCompressor provided\"");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _NSErrorWithFilePathErrnoAndVariant()
{
  return MEMORY[0x24BDD19D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x24BDACA40](*(_QWORD *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x24BDACA78]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x24BEDCE30]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x24BEDCE60](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x24BEDCE70](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x24BEDCE80](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCE90](cls, name);
}

const char *__cdecl class_getImageName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCE98](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB990](*(_QWORD *)&algorithm);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E8](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE0A8](*(_QWORD *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x24BDAE398]();
}

uint64_t fileport_makeport()
{
  return MEMORY[0x24BDAE3A0]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x24BDAE458](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x24BDAE598](*(_QWORD *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x24BDAE5A0](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

pid_t getppid(void)
{
  return MEMORY[0x24BDAE6D8]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF278](strm, version, *(_QWORD *)&stream_size);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x24BDAE968](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, timeout);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int kqueue(void)
{
  return MEMORY[0x24BDAE998]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

mach_msg_return_t mach_msg_send(mach_msg_header_t *a1)
{
  return MEMORY[0x24BDAEB98](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x24BDAEBC8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_ports_lookup(task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  return MEMORY[0x24BDAEC30](*(_QWORD *)&target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_ports_register(task_t target_task, mach_port_array_t init_port_set, mach_msg_type_number_t init_port_setCnt)
{
  return MEMORY[0x24BDAEC38](*(_QWORD *)&target_task, init_port_set, *(_QWORD *)&init_port_setCnt);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x24BDAEC50](*(_QWORD *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDAEC78](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_remap(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDAECB8](*(_QWORD *)&target_task, target_address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&src_task, src_address, *(_QWORD *)&copy);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x24BDAEEF0](a1, a2);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x24BDAEF80](a1, *(_QWORD *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

const char **__cdecl objc_copyClassNamesForImage(const char *image, unsigned int *outCount)
{
  return (const char **)MEMORY[0x24BEDD000](image, outCount);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x24BEDD0B8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int pipe(int a1[2])
{
  return MEMORY[0x24BDAF5D0](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x24BDAF600](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return MEMORY[0x24BDAF628](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x24BDAF630](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x24BDAF638](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x24BDAF640](a1);
}

int posix_spawnattr_getflags(const posix_spawnattr_t *a1, __int16 *a2)
{
  return MEMORY[0x24BDAF648](a1, a2);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x24BDAF650](a1);
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  return MEMORY[0x24BDAF658](a1, a2, a3, a4);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x24BDAF660](a1, a2);
}

int posix_spawnattr_setpgroup(posix_spawnattr_t *a1, pid_t a2)
{
  return MEMORY[0x24BDAF668](a1, *(_QWORD *)&a2);
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x24BEDD4C8](proto, other);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x24BEDD4D0](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x24BEDD4E8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x24BEDD4F0](p);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x24BDAFD38](a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAFDA0](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x24BDAFDA8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x24BDB0160](*(_QWORD *)&target_tport, *(_QWORD *)&pid, t);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x24BDB02D0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x24BDB08B8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB08E0](xdict, key);
}

uint64_t xpc_dictionary_extract_mach_recv()
{
  return MEMORY[0x24BDB08F0]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x24BDB09A0](xdict, key, *(_QWORD *)&fd);
}

uint64_t xpc_dictionary_set_mach_recv()
{
  return MEMORY[0x24BDB09B0]();
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x24BDB09B8]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

