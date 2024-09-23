uint64_t sub_227BF262C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_227BF265C()
{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v0 = atomic_load((unsigned __int8 *)&qword_25591EB28);
  v1 = 0x25591E000uLL;
  if ((v0 & 1) == 0)
  {
    v3 = __cxa_guard_acquire(&qword_25591EB28);
    v1 = 0x25591E000;
    if (v3)
    {
      qword_25591EB20 = (uint64_t)os_log_create("com.apple.agx", "AGCEnv");
      __cxa_guard_release(&qword_25591EB28);
      v1 = 0x25591E000;
    }
  }
  return *(_QWORD *)(v1 + 2848);
}

uint64_t sub_227BF26C8()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_25591EB30);
}

_QWORD *sub_227BF26D4(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_227BF278C(uint64_t a1)
{
  sub_227BF33F0(a1);
  JUMPOUT(0x22E2A5D80);
}

uint64_t sub_227BF27B0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  pid_t v8;
  int v9;
  uint64_t v10;
  __int128 *p_buffer;
  uint64_t v12;
  unsigned int v13;
  int v14;
  pid_t v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  std::string::size_type size;
  std::string *v22;
  __int128 v23;
  const std::string::value_type *v24;
  std::string::size_type v25;
  std::string *v26;
  uint64_t v27;
  _QWORD v29[10];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  std::string v38;
  std::string v39;
  std::string v40;
  std::string v41;
  std::string v42;
  std::string v43;
  __int128 buffer;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v7 = a1[1];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_227BF2D7C;
  v29[3] = &unk_24F05CBF0;
  v29[4] = a2;
  v29[5] = a3;
  v29[6] = a4;
  v29[7] = &v30;
  v29[8] = &v34;
  v29[9] = a1;
  dispatch_sync(v7, v29);
  if (*((_BYTE *)v31 + 24) && MGGetBoolAnswer())
  {
    sub_227BF26D4(&v42, (char *)&unk_227BF4921);
    v8 = getpid();
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    buffer = 0u;
    v45 = 0u;
    v9 = proc_name(v8, &buffer, 0x80u);
    if (v9)
    {
      v10 = v9;
      p_buffer = &buffer;
      v12 = MEMORY[0x24BDAC740];
      do
      {
        v13 = *(char *)p_buffer;
        if ((v13 & 0x80000000) != 0)
          v14 = __maskrune(v13, 0x500uLL);
        else
          v14 = *(_DWORD *)(v12 + 4 * v13 + 60) & 0x500;
        if (!v14)
          *(_BYTE *)p_buffer = 95;
        p_buffer = (__int128 *)((char *)p_buffer + 1);
        --v10;
      }
      while (v10);
    }
    std::string::append(&v42, (const std::string::value_type *)&buffer);
    v43 = v42;
    memset(&v42, 0, sizeof(v42));
    v15 = getpid();
    std::to_string(&v39, v15);
    v16 = std::string::insert(&v39, 0, "_");
    v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v40.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    v18 = std::string::append(&v40, "_");
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v41.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    LODWORD(v18) = dword_25591EB40++;
    std::to_string(&v38, v18);
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = &v38;
    else
      v20 = (std::string *)v38.__r_.__value_.__r.__words[0];
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v38.__r_.__value_.__r.__words[2]);
    else
      size = v38.__r_.__value_.__l.__size_;
    v22 = std::string::append(&v41, (const std::string::value_type *)v20, size);
    v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    *(_QWORD *)&v45 = *((_QWORD *)&v22->__r_.__value_.__l + 2);
    buffer = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    if ((SBYTE7(v45) & 0x80u) == 0)
      v24 = (const std::string::value_type *)&buffer;
    else
      v24 = (const std::string::value_type *)buffer;
    if ((SBYTE7(v45) & 0x80u) == 0)
      v25 = BYTE7(v45);
    else
      v25 = *((_QWORD *)&buffer + 1);
    std::string::append(&v43, v24, v25);
    if (SBYTE7(v45) < 0)
      operator delete((void *)buffer);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v41.__r_.__value_.__l.__data_);
    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v40.__r_.__value_.__l.__data_);
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v26 = &v43;
    else
      v26 = (std::string *)v43.__r_.__value_.__r.__words[0];
    (*(void (**)(_QWORD *, uint64_t, uint64_t, std::string *))(*a1 + 24))(a1, a2, a3, v26);
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v43.__r_.__value_.__l.__data_);
  }
  v27 = *((unsigned int *)v35 + 6);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v27;
}

void sub_227BF2AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,char a52,uint64_t a53,int a54,__int16 a55,char a56,char a57)
{
  uint64_t v57;

  if (*(char *)(v57 - 233) < 0)
    operator delete(*(void **)(v57 - 256));
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_227BF2BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v4;
  _QWORD v5[8];

  v4 = *(NSObject **)(a1 + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_227BF2C10;
  v5[3] = &unk_24F05CC18;
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a1;
  v5[7] = a4;
  dispatch_sync(v4, v5);
}

void sub_227BF2C10(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  xpc_object_t v4;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = sub_227BF2C98(v2, *(NSObject **)(a1 + 32), *(NSObject **)(a1 + 40));
  xpc_dictionary_set_string(v3, "log_file_name", *(const char **)(a1 + 56));
  v4 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 88), v3);
  if (MEMORY[0x22E2A605C]() == MEMORY[0x24BDACFB8])
    syslog(3, "AGX compiler connection: Failed to log build request");
  xpc_release(v3);
  xpc_release(v4);
}

xpc_object_t sub_227BF2C98(uint64_t a1, NSObject *a2, NSObject *a3)
{
  xpc_object_t v6;
  const void *v7;
  size_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "architecture", *(unsigned int *)(a1 + 20));
  if (*(char *)(a1 + 47) < 0)
  {
    v7 = *(const void **)(a1 + 24);
    v8 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = (const void *)(a1 + 24);
    v8 = *(unsigned __int8 *)(a1 + 47);
  }
  v9 = xpc_data_create(v7, v8);
  xpc_dictionary_set_value(v6, "compiler_options", v9);
  xpc_release(v9);
  v10 = xpc_data_create_with_dispatch_data(a2);
  xpc_dictionary_set_value(v6, "state", v10);
  xpc_release(v10);
  if (a3)
  {
    v11 = xpc_data_create_with_dispatch_data(a3);
    xpc_dictionary_set_value(v6, "bitcode", v11);
    xpc_release(v11);
  }
  return v6;
}

void sub_227BF2D7C(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();
  NSObject *v9;
  int v10;
  xpc_object_t v11;
  char v12;
  char v13;
  uint64_t v14;
  xpc_object_t v15;
  char v16;
  xpc_object_t v17;
  uint64_t v18;
  unsigned int v19;
  xpc_object_t v20;
  uint64_t v21;
  xpc_object_t v22;
  uint64_t v23;
  const void *data;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD *v30;
  os_activity_scope_state_s state;
  _QWORD v32[5];
  size_t applier;
  uint64_t p_applier;
  uint64_t v35;
  void *v36;
  uint64_t *p_block;
  uint64_t block;
  __int128 v39;
  __n128 (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)();
  const char *v42;
  CC_SHA256_CTX v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = a1[9];
  v3 = _os_activity_create(&dword_227BF1000, "compiling shader", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  v5 = a1[4];
  v4 = a1[5];
  v30 = a1;
  block = 0;
  *(_QWORD *)&v39 = &block;
  *((_QWORD *)&v39 + 1) = 0x9812000000;
  v40 = sub_227BF3DAC;
  v41 = nullsub_4;
  v42 = "";
  CC_SHA256_Init(&v43);
  applier = MEMORY[0x24BDAC760];
  p_applier = 3221225472;
  v35 = (uint64_t)sub_227BF3DDC;
  v36 = &unk_24F05CC60;
  p_block = &block;
  v6 = MEMORY[0x24BDAC760];
  dispatch_data_apply(v5, &applier);
  if (v4)
  {
    v32[0] = v6;
    v32[1] = 3221225472;
    v32[2] = sub_227BF3E08;
    v32[3] = &unk_24F05CC60;
    v32[4] = &block;
    dispatch_data_apply(v4, v32);
  }
  CC_SHA256_Final((unsigned __int8 *)(v2 + 48), (CC_SHA256_CTX *)(v39 + 48));
  _Block_object_dispose(&block, 8);
  v7 = *(_QWORD *)(v2 + 80);
  v8 = (uint64_t (*)())v30[6];
  applier = 0;
  p_applier = (uint64_t)&applier;
  v35 = 0x2020000000;
  LODWORD(v36) = 0;
  if (*(_DWORD *)v7)
  {
    v9 = *(NSObject **)(v7 + 24);
    block = v6;
    *(_QWORD *)&v39 = 3221225472;
    *((_QWORD *)&v39 + 1) = sub_227BF3E8C;
    v40 = (__n128 (*)(uint64_t, uint64_t))&unk_24F05CC88;
    *(_QWORD *)v43.count = v7;
    *(_QWORD *)v43.hash = v2 + 48;
    v41 = v8;
    v42 = (const char *)&applier;
    dispatch_sync(v9, &block);
    v10 = *(_DWORD *)(p_applier + 24);
    _Block_object_dispose(&applier, 8);
    if (v10)
    {
      *(_DWORD *)(*(_QWORD *)(v30[8] + 8) + 24) = 2;
      goto LABEL_36;
    }
  }
  else
  {
    _Block_object_dispose(&applier, 8);
  }
  v29 = v3;
  v11 = sub_227BF2C98(v2, v30[4], v30[5]);
  v12 = 0;
  v13 = 1;
  v14 = MEMORY[0x24BDACFB8];
  v15 = (xpc_object_t)MEMORY[0x24BDACF30];
  while (1)
  {
    v16 = v12;
    if ((v13 & 1) == 0)
    {
      v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v17, "connection_ping", 1);
      v18 = mach_absolute_time();
      v19 = 0;
      do
      {
        if (v19 == 5)
          sleep(1u);
        v20 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 88), v17);
        v21 = MEMORY[0x22E2A605C]();
        xpc_release(v20);
        if (v19 > 8)
          break;
        ++v19;
      }
      while (v21 == v14);
      xpc_release(v17);
      if (v21 == v14)
      {
        v3 = v29;
        v28 = mach_absolute_time();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          if (qword_25591EB38 != -1)
            dispatch_once(&qword_25591EB38, &unk_24F05CAE8);
          block = 0xA04000200;
          LOWORD(v39) = 2048;
          *(_QWORD *)((char *)&v39 + 2) = (*(unsigned int *)algn_25591EB34
                                         + (v28 - v18) * dword_25591EB30
                                         - 1)
                                        / *(unsigned int *)algn_25591EB34;
          _os_log_fault_impl(&dword_227BF1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "AGXCompiler: failed to ping the compiler service %u times over %llu ns", (uint8_t *)&block, 0x12u);
        }
        v23 = v30[7];
        goto LABEL_33;
      }
    }
    v22 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 88), v11);
    if (MEMORY[0x22E2A605C]() != v14)
      break;
    if (v22 == v15)
    {
      syslog(4, "Compiler connection failed with XPC_ERROR_CONNECTION_INTERRUPTED");
    }
    else
    {
      if (v22 == (xpc_object_t)MEMORY[0x24BDACF38])
      {
        syslog(3, "Compiler connection failed with XPC_ERROR_CONNECTION_INVALID");
LABEL_23:
        sub_227BF338C(v2);
        goto LABEL_24;
      }
      if (v22 == (xpc_object_t)MEMORY[0x24BDACF48])
      {
        syslog(3, "Compiler connection failed  with XPC_ERROR_TERMINATION_IMMINENT");
        goto LABEL_23;
      }
      syslog(3, "Compiler connection failed with unknown XPC error");
    }
LABEL_24:
    v13 = 0;
    v12 = 1;
    if ((v16 & 1) != 0)
    {
      sub_227BF32E0((uint64_t)v22);
      v3 = v29;
      v23 = v30[7];
LABEL_33:
      *(_BYTE *)(*(_QWORD *)(v23 + 8) + 24) = 1;
      goto LABEL_36;
    }
  }
  xpc_release(v11);
  applier = 0;
  data = xpc_dictionary_get_data(v22, "reply", &applier);
  v3 = v29;
  v25 = MEMORY[0x24BDAC760];
  v32[0] = data;
  if (data)
  {
    (*(void (**)(void))(v30[6] + 16))();
    if (xpc_dictionary_get_BOOL(v22, "error"))
    {
      v26 = *(_QWORD *)(v2 + 80);
      if (*(_DWORD *)v26)
      {
        v27 = *(NSObject **)(v26 + 24);
        block = v25;
        *(_QWORD *)&v39 = 3221225472;
        *((_QWORD *)&v39 + 1) = sub_227BF4044;
        v40 = (__n128 (*)(uint64_t, uint64_t))&unk_24F05CCA8;
        v41 = (uint64_t (*)())v26;
        v42 = (const char *)v32;
        *(_QWORD *)v43.count = &applier;
        *(_QWORD *)v43.hash = v2 + 48;
        dispatch_sync(v27, &block);
      }
      *(_DWORD *)(*(_QWORD *)(v30[8] + 8) + 24) = 1;
    }
  }
  else
  {
    sub_227BF32E0((uint64_t)v22);
    *(_BYTE *)(*(_QWORD *)(v30[7] + 8) + 24) = 1;
  }
  xpc_release(v22);
LABEL_36:

  os_activity_scope_leave(&state);
}

void sub_227BF3298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_227BF32E0(uint64_t a1)
{
  const char *v1;

  if (a1 == MEMORY[0x24BDACF30])
  {
    v1 = "XPC_ERROR_CONNECTION_INTERRUPTED";
  }
  else if (a1 == MEMORY[0x24BDACF38])
  {
    v1 = "XPC_ERROR_CONNECTION_INVALID";
  }
  else if (a1 == MEMORY[0x24BDACF48])
  {
    v1 = "XPC_ERROR_TERMINATION_IMMINENT";
  }
  else if (a1 && MEMORY[0x22E2A605C]() == MEMORY[0x24BDACFB8])
  {
    v1 = "XPC_TYPE_ERROR_UNKNOWN";
  }
  else
  {
    v1 = "XPC_SERVICE_BUILD_FAILURE";
  }
  syslog(3, "AGX compiler connection %s", v1);
}

void sub_227BF338C(uint64_t a1)
{
  _xpc_connection_s *v2;

  syslog(3, "Deleting compiler connection and creating a new one");
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 88));
  xpc_release(*(xpc_object_t *)(a1 + 88));
  v2 = xpc_connection_create("com.apple.AGXCompilerService-S2A8", 0);
  *(_QWORD *)(a1 + 88) = v2;
  xpc_connection_set_event_handler(v2, &unk_24F05CB58);
  xpc_connection_resume(*(xpc_connection_t *)(a1 + 88));
}

uint64_t sub_227BF33F0(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24F05CB88;
  xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 88), &unk_24F05CBC8);
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 88));
  xpc_release(*(xpc_object_t *)(a1 + 88));
  return sub_227BF3450(a1);
}

void sub_227BF343C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_227BF3450(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_227BF3450(uint64_t a1)
{
  *(_QWORD *)a1 = off_24F05CB18;
  CompilerFSCacheDestroy((uint64_t *)(a1 + 80));
  dispatch_release(*(dispatch_object_t *)(a1 + 8));
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  return a1;
}

uint64_t CompilerConnectionCreate(int a1)
{
  uint64_t v2;
  void **v3;
  NSObject *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  const std::string::value_type *v12;
  NSObject *v13;
  pid_t v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  unsigned int v18;
  int v19;
  std::string *p_p;
  std::string::size_type size;
  uint64_t v22;
  NSObject *v23;
  _xpc_connection_s *v24;
  _OWORD *v26;
  std::string v27;
  std::string v28;
  std::string __p;
  std::string v30;
  _OWORD buffer[8];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = operator new();
  *(_QWORD *)v2 = off_24F05CB18;
  *(_QWORD *)(v2 + 24) = 0;
  v3 = (void **)(v2 + 24);
  *(_DWORD *)(v2 + 16) = 3;
  *(_DWORD *)(v2 + 20) = a1;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = 0;
  memset(&v27, 0, sizeof(v27));
  if (MGGetBoolAnswer())
  {
    v4 = sub_227BF265C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buffer[0]) = 136315138;
      *(_QWORD *)((char *)buffer + 4) = "serialize";
      _os_log_debug_impl(&dword_227BF1000, v4, OS_LOG_TYPE_DEBUG, "%s(){\n", (uint8_t *)buffer, 0xCu);
    }
    v5 = atomic_load((unsigned __int8 *)&qword_25591EB18);
    if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_25591EB18))
    {
      v26 = operator new(0x70uLL);
      qword_25591EB08 = (uint64_t)(v26 + 7);
      unk_25591EB10 = v26 + 7;
      v26[4] = xmmword_24F05CA98;
      v26[5] = *(_OWORD *)&off_24F05CAA8;
      v26[6] = xmmword_24F05CAB8;
      *v26 = xmmword_24F05CA58;
      v26[1] = *(_OWORD *)&off_24F05CA68;
      v26[2] = xmmword_24F05CA78;
      v26[3] = *(_OWORD *)&off_24F05CA88;
      qword_25591EB00 = (uint64_t)v26;
      __cxa_atexit((void (*)(void *))sub_227BF262C, &qword_25591EB00, &dword_227BF1000);
      __cxa_guard_release(&qword_25591EB18);
    }
    sub_227BF26D4(&v30, "AGC_ENABLE_STATUS_FILE");
    v6 = qword_25591EB00;
    v7 = qword_25591EB08;
    if (qword_25591EB08 != qword_25591EB00)
    {
      v8 = 0;
      v9 = 0;
      v10 = MEMORY[0x24BDAC740];
      do
      {
        v11 = getenv(*(const char **)(v6 + 8 * v8));
        if (v11)
        {
          v12 = v11;
          v13 = sub_227BF265C();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v22 = *(_QWORD *)(qword_25591EB00 + 8 * v8);
            LODWORD(buffer[0]) = 136315394;
            *(_QWORD *)((char *)buffer + 4) = v22;
            WORD6(buffer[0]) = 2080;
            *(_QWORD *)((char *)buffer + 14) = v12;
            _os_log_debug_impl(&dword_227BF1000, v13, OS_LOG_TYPE_DEBUG, "%s = %s\n", (uint8_t *)buffer, 0x16u);
          }
          if (!std::string::compare(&v30, *(const std::string::value_type **)(qword_25591EB00 + 8 * v8)))
          {
            std::string::append(&v27, "AGC_CLIENT_PROCESS_NAME");
            std::string::push_back(&v27, 10);
            sub_227BF26D4(&v28, "agc_status_");
            v14 = getpid();
            memset(buffer, 0, sizeof(buffer));
            v15 = proc_name(v14, buffer, 0x80u);
            if (v15)
            {
              v16 = v15;
              v17 = buffer;
              do
              {
                v18 = (char)*v17;
                if ((v18 & 0x80000000) != 0)
                  v19 = __maskrune(v18, 0x500uLL);
                else
                  v19 = *(_DWORD *)(v10 + 4 * v18 + 60) & 0x500;
                if (!v19)
                  *v17 = 95;
                ++v17;
                --v16;
              }
              while (v16);
            }
            std::string::append(&v28, (const std::string::value_type *)buffer);
            __p = v28;
            memset(&v28, 0, sizeof(v28));
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              p_p = &__p;
            else
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            else
              size = __p.__r_.__value_.__l.__size_;
            std::string::append(&v27, (const std::string::value_type *)p_p, size);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v28.__r_.__value_.__l.__data_);
            std::string::push_back(&v27, 10);
          }
          std::string::append(&v27, *(const std::string::value_type **)(qword_25591EB00 + 8 * v8));
          std::string::push_back(&v27, 10);
          std::string::append(&v27, v12);
          std::string::push_back(&v27, 10);
          v6 = qword_25591EB00;
          v7 = qword_25591EB08;
        }
        v8 = ++v9;
      }
      while (v9 < (unint64_t)((v7 - v6) >> 3));
    }
    v23 = sub_227BF265C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buffer[0]) = 0;
      _os_log_debug_impl(&dword_227BF1000, v23, OS_LOG_TYPE_DEBUG, "}\n", (uint8_t *)buffer, 2u);
    }
    v3 = (void **)(v2 + 24);
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v30.__r_.__value_.__l.__data_);
  }
  if (*(char *)(v2 + 47) < 0)
    operator delete(*v3);
  *(std::string *)v3 = v27;
  *(_QWORD *)(v2 + 8) = dispatch_queue_create("CompilerConnectionSerialQueue", 0);
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  CompilerFSCacheCreate((uint64_t *)(v2 + 80));
  *(_QWORD *)v2 = &off_24F05CB88;
  v24 = xpc_connection_create("com.apple.AGXCompilerService-S2A8", 0);
  *(_QWORD *)(v2 + 88) = v24;
  xpc_connection_set_event_handler(v24, &unk_24F05CBA8);
  xpc_connection_resume(*(xpc_connection_t *)(v2 + 88));
  return v2;
}

void sub_227BF3934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  uint64_t v36;
  void **v37;

  if (*(char *)(v36 + 47) < 0)
    operator delete(*v37);
  MEMORY[0x22E2A5D80](v36, 0x10B3C40B20F9A2BLL);
  _Unwind_Resume(a1);
}

uint64_t CompilerConnectionDestroy(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void CompilerFSCacheCreate(uint64_t *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  const __CFString *v5;
  id v6;
  int CString;
  int v8;
  char buffer[1025];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = operator new();
  *(_DWORD *)v2 = 0;
  *(_QWORD *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 24) = dispatch_queue_create("CompilerFSCacheSerialQueue", 0);
  v3 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v4 = -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject");
  if (!v4)
    goto LABEL_8;
  v5 = (const __CFString *)objc_msgSend((id)objc_msgSend(v4, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier")), "stringByAppendingPathComponent:", CFSTR("com.apple.opengl"));
  v6 = objc_alloc_init(MEMORY[0x24BDD1580]);
  if ((objc_msgSend(v6, "fileExistsAtPath:", v5) & 1) == 0
    && !objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0))
  {

LABEL_8:
    goto LABEL_9;
  }
  CString = CFStringGetCString(v5, buffer, 1025, 0x8000100u);

  if (CString)
  {
    strlcat(buffer, "/shaders", 0x401uLL);
    *(_QWORD *)(v2 + 8) = 0x10000000;
    *(_DWORD *)(v2 + 16) = 2097153;
    v8 = fscache_open_with_key();
    if (v8)
    {
      syslog(3, "Compiler cache open failed with status = %d\n", v8);
      dispatch_release(*(dispatch_object_t *)(v2 + 24));
    }
    else if (*(_QWORD *)(v2 + 40))
    {
      *(_DWORD *)v2 = 0x10000000;
    }
  }
LABEL_9:
  *a1 = v2;
}

void sub_227BF3BEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2A5D80](v1, 0x10A0C40E94E7A3ELL);
  _Unwind_Resume(a1);
}

uint64_t *CompilerFSCacheDestroy(uint64_t *result)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *result;
  if (*result)
  {
    if (*(_DWORD *)v1)
    {
      v2 = *(NSObject **)(v1 + 24);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_227BF3CA8;
      block[3] = &unk_24F05CC38;
      block[4] = v1;
      dispatch_sync(v2, block);
      dispatch_release(*(dispatch_object_t *)(v1 + 24));
    }
    JUMPOUT(0x22E2A5D80);
  }
  return result;
}

void sub_227BF3CA8()
{
  int v0;

  v0 = fscache_close();
  if (v0)
    syslog(3, "Compiler cache close failed with status = %d\n", v0);
}

uint64_t CompilerFSCacheGetShaderCacheKeys(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_227BF3D74;
  v4[3] = &unk_24F05CCD0;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_227BF3D74(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  if (result)
  {
    result = fscache_get_cache_keys();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

__n128 sub_227BF3DAC(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *(_OWORD *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v3;
  *(_OWORD *)(a1 + 48) = v2;
  result = *(__n128 *)(a2 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  v6 = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v5;
  *(_OWORD *)(a1 + 128) = v6;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t sub_227BF3DDC(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), data, len);
  return 1;
}

uint64_t sub_227BF3E08(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), data, len);
  return 1;
}

uint64_t sub_227BF3E34(const void *a1, CC_LONG a2, unsigned __int8 *a3)
{
  CC_SHA256_CTX c;

  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, a1, a2);
  return CC_SHA256_Final(a3, &c);
}

uint64_t sub_227BF3E8C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a1[6];
  result = fscache_find_and_retain();
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == 203)
  {
    ++*(_DWORD *)(v2 + 36);
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    return result;
  }
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = fscache_element_get_data();
  if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    syslog(3, "Compiler get element from cache failed with status = %d\n", *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    return fscache_release();
  }
  v7 = 0u;
  v8 = 0u;
  sub_227BF3E34((const void *)0x20, 0xFFFFFFE0, (unsigned __int8 *)&v7);
  if ((_QWORD)v7 == MEMORY[0]
    && *((_QWORD *)&v7 + 1) == MEMORY[8]
    && (_QWORD)v8 == MEMORY[0x10]
    && *((_QWORD *)&v8 + 1) == MEMORY[0x18])
  {
    (*(void (**)(void))(a1[4] + 16))();
    ++*(_DWORD *)(v2 + 32);
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    return fscache_release();
  }
  syslog(3, "Compiler get element from cache failed checksum, data corrupted!\n");
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  return fscache_remove_and_release();
}

void sub_227BF4044(uint64_t a1)
{
  _OWORD *v2;
  __int128 v3;
  int v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = 0u;
  v6 = 0u;
  sub_227BF3E34(**(const void ***)(a1 + 40), **(_QWORD **)(a1 + 48), (unsigned __int8 *)&v5);
  v2 = malloc_type_calloc(1uLL, **(_QWORD **)(a1 + 48) + 32, 0x7485F2AEuLL);
  v3 = v6;
  *v2 = v5;
  v2[1] = v3;
  memcpy(v2 + 2, **(const void ***)(a1 + 40), **(_QWORD **)(a1 + 48));
  v4 = fscache_insert_and_retain();
  free(v2);
  if (v4)
  {
    syslog(3, "Compiler add element to cache failed with status = %d\n", v4);
  }
  else
  {
    if (fscache_element_get_data())
    {
      syslog(3, "Compiler element get data failed with status = %d\n");
    }
    else if (msync(0, (*MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8], 1) < 0)
    {
      __error();
      syslog(3, "Compiler flush pages failed with status = %d\n");
    }
    fscache_release();
  }
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x24BEDA9C0](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

void operator delete(void *__p)
{
  off_24F05C808(__p);
}

uint64_t operator delete()
{
  return off_24F05C810();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F05C818(__sz);
}

uint64_t operator new()
{
  return off_24F05C820();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t fscache_close()
{
  return MEMORY[0x24BDE2C30]();
}

uint64_t fscache_element_get_data()
{
  return MEMORY[0x24BDE2C38]();
}

uint64_t fscache_find_and_retain()
{
  return MEMORY[0x24BDE2C40]();
}

uint64_t fscache_get_cache_keys()
{
  return MEMORY[0x24BDE2C48]();
}

uint64_t fscache_insert_and_retain()
{
  return MEMORY[0x24BDE2C50]();
}

uint64_t fscache_open_with_key()
{
  return MEMORY[0x24BDE2C60]();
}

uint64_t fscache_release()
{
  return MEMORY[0x24BDE2C68]();
}

uint64_t fscache_remove_and_release()
{
  return MEMORY[0x24BDE2C70]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFE0](a1, a2, *(_QWORD *)&a3);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x24BDB0870](ddata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

