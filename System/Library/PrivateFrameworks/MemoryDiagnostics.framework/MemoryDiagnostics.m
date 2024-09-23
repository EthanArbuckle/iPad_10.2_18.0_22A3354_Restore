uint64_t memgraph_from_task_save_immediate(int a1, unsigned int a2, int a3, int64_t a4, uint64_t a5)
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  void *v14;
  xpc_object_t v15;
  void *v16;
  const char *string;
  const char *v18;
  int64_t int64;
  __CFString *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((a1 - 1) < 0xFFFFFFFE)
  {
    if (a5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "memgraph_from_task_save_immediate";
        v5 = MEMORY[0x1E0C81028];
        v6 = "%s: Context is unused. Clients should provide nil.";
LABEL_25:
        _os_log_error_impl(&dword_1DC072000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
        return 0xFFFFFFFFLL;
      }
      return 0xFFFFFFFFLL;
    }
    sub_1DC073C50();
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "memgraph_from_task_save_immediate";
        _os_log_error_impl(&dword_1DC072000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Couldn't get RMEGetXPCConnection().", buf, 0xCu);
      }
      v7 = 0xFFFFFFFFLL;
      goto LABEL_23;
    }
    v13 = xpc_dictionary_create(0, 0, 0);
    v14 = v13;
    if (!v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "memgraph_from_task_save_immediate";
        _os_log_error_impl(&dword_1DC072000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Couldn't create xpc_dictionary.", buf, 0xCu);
      }
      v7 = 0xFFFFFFFFLL;
      goto LABEL_22;
    }
    xpc_dictionary_set_int64(v13, "MessageType", 3);
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_int64(v14, "ContentLevel", a2);
    xpc_dictionary_set_fd(v14, "MemgraphFileDescriptor", a3);
    xpc_dictionary_set_int64(v14, "TimeoutSeconds", a4);
    v15 = xpc_connection_send_message_with_reply_sync(v12, v14);
    v16 = v15;
    if (v15 && MEMORY[0x1DF0C0038](v15) == MEMORY[0x1E0C812F8])
    {
      string = xpc_dictionary_get_string(v16, "ErrorDomain");
      if (!string)
      {
        v7 = 0;
        goto LABEL_15;
      }
      v18 = string;
      int64 = xpc_dictionary_get_int64(v16, "ErrorCode");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "memgraph_from_task_save_immediate";
        v24 = 2080;
        v25 = v18;
        v26 = 2048;
        v27 = int64;
        _os_log_error_impl(&dword_1DC072000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: xpc reply error: %s: %lld", buf, 0x20u);
      }
      v20 = MREErrorDomain;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = -[__CFString isEqualToString:](v20, "isEqualToString:", v21);

      if ((_DWORD)v20 && (unint64_t)(int64 - 8) <= 6)
      {
        v7 = dword_1DC074A90[int64 - 8];
        goto LABEL_15;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "memgraph_from_task_save_immediate";
      _os_log_error_impl(&dword_1DC072000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Couldn't get reply dictionary.", buf, 0xCu);
    }
    v7 = 0xFFFFFFFFLL;
LABEL_15:

LABEL_22:
LABEL_23:

    return v7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "memgraph_from_task_save_immediate";
    v5 = MEMORY[0x1E0C81028];
    v6 = "%s: Invalid task port.";
    goto LABEL_25;
  }
  return 0xFFFFFFFFLL;
}

id sub_1DC073C50()
{
  if (qword_1F0346F38 != -1)
    dispatch_once(&qword_1F0346F38, &unk_1EA43FA70);
  return (id)qword_1F0346F30;
}

void sub_1DC073C90()
{
  xpc_connection_t mach_service;
  void *v1;

  mach_service = xpc_connection_create_mach_service("com.apple.ReportMemoryException", 0, 2uLL);
  v1 = (void *)qword_1F0346F30;
  qword_1F0346F30 = (uint64_t)mach_service;

  if (qword_1F0346F30)
  {
    xpc_connection_set_event_handler((xpc_connection_t)qword_1F0346F30, &unk_1EA43FAB0);
    xpc_connection_resume((xpc_connection_t)qword_1F0346F30);
  }
}

void sub_1DC073CF0(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  BOOL v4;
  const char *string;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = MEMORY[0x1DF0C0038]();
  v4 = v2 != (id)MEMORY[0x1E0C81258] && v3 == MEMORY[0x1E0C81310];
  if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81270]);
    v6 = 136315138;
    v7 = string;
    _os_log_error_impl(&dword_1DC072000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Got xpc error message: %s\n", (uint8_t *)&v6, 0xCu);
  }

}

void ReportMemoryExceptionFromTask(uint64_t a1, char a2, const char *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  BOOL v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD);
  int v28;
  char v29;
  unsigned int object_addr;
  unsigned int object_type;
  int x;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if ((a1 - 1) >= 0xFFFFFFFE)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MREErrorDomain, 9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v14);

    }
    goto LABEL_29;
  }
  object_addr = 0;
  object_type = 0;
  if (mach_port_kernel_object(*MEMORY[0x1E0C83DA0], a1, &object_type, &object_addr))
    v12 = 0;
  else
    v12 = object_type == 2;
  if (!v12)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MREErrorDomain, 9, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v11)[2](v11, v13);
LABEL_28:

      goto LABEL_29;
    }
    goto LABEL_29;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1DC074600;
  v38 = sub_1DC074610;
  v39 = 0;
  if (a3)
    goto LABEL_13;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1DC074618;
  v33[3] = &unk_1EA43FB28;
  v33[4] = &v34;
  if ((sub_1DC0746BC(a1, v33) & 1) == 0)
  {
    x = 0;
    if (pid_for_task(a1, &x))
      goto LABEL_18;
    if ((proc_pidpath(x, buf, 0x400u) - 1) <= 0x3FE)
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", buf);
      v23 = (void *)v35[5];
      v35[5] = v22;

    }
  }
  a3 = (const char *)objc_msgSend(objc_retainAutorelease((id)v35[5]), "UTF8String");
  if (a3)
  {
LABEL_13:
    v15 = strncmp(a3, "/usr/libexec/ReportMemoryException", 0x400uLL) == 0;
    _Block_object_dispose(&v34, 8);

    if (!v15)
    {
      if (SMJobIsEnabled())
      {
        sub_1DC073C50();
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = sub_1DC07429C;
          v24[3] = &unk_1EA43FB00;
          v27 = v11;
          v28 = a1;
          v29 = a2;
          v13 = v17;
          v25 = v13;
          v26 = v9;
          v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0BFF00](v24);
          v18[2](v18, 0);

          v19 = v27;
        }
        else
        {
          if (!v11)
          {
            v13 = 0;
            goto LABEL_28;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MREErrorDomain, 7, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v19);
          v13 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = CFSTR("RME is disabled. To re-enable use 'ReportMemoryExceptionTool --enable'");
          _os_log_impl(&dword_1DC072000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@. Aborting.", buf, 0xCu);
        }
        if (!v11)
          goto LABEL_29;
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = MREErrorDomain;
        v40 = *MEMORY[0x1E0CB2D50];
        v41 = CFSTR("RME is disabled. To re-enable use 'ReportMemoryExceptionTool --enable'");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 17, v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v19);
      }

      goto LABEL_28;
    }
    goto LABEL_19;
  }
LABEL_18:
  _Block_object_dispose(&v34, 8);

LABEL_19:
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MREErrorDomain, 10, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v11)[2](v11, v13);
    goto LABEL_28;
  }
LABEL_29:

}

void sub_1DC074274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC07429C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD handler[4];
  id v17;
  uint8_t buf[12];
  int v19;

  v3 = a2;
  if (!v3)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      v19 = 0;
      if (MEMORY[0x1DF0BFE40](*MEMORY[0x1E0C83DA0], *(unsigned int *)(a1 + 56), 0, &v19) != 15)
      {
        xpc_dictionary_set_int64(v5, "MessageType", 2);
        xpc_dictionary_set_mach_send();
        xpc_dictionary_set_BOOL(v5, "WithMemgraph", *(_BYTE *)(a1 + 60));
        v11 = *(void **)(a1 + 48);
        if (!v11)
        {
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v5);
          goto LABEL_14;
        }
        v12 = *(_xpc_connection_s **)(a1 + 32);
        v13 = *(NSObject **)(a1 + 40);
        if (v13)
        {
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = sub_1DC0744CC;
          handler[3] = &unk_1EA43FAD8;
          v17 = v11;
          xpc_connection_send_message_with_reply(v12, v5, v13, handler);

          goto LABEL_14;
        }
        v10 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), v5);
        v14 = *(_QWORD *)(a1 + 48);
        sub_1DC074514(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DC072000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Timed out on authenticating. Skipping sending corpse to RME for analysis.", buf, 2u);
      }
      v6 = *(_QWORD *)(a1 + 48);
      if (!v6)
        goto LABEL_14;
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = MREErrorDomain;
      v9 = 15;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 48);
      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = MREErrorDomain;
      v9 = 6;
    }
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v10);
LABEL_13:

    goto LABEL_14;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
LABEL_15:

}

void sub_1DC0744CC(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  sub_1DC074514(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

id sub_1DC074514(void *a1)
{
  id v1;
  void *v2;
  void *string;
  int64_t int64;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (v1 && MEMORY[0x1DF0C0038](v1) == MEMORY[0x1E0C812F8])
  {
    string = (void *)xpc_dictionary_get_string(v2, "ErrorDomain");
    if (string)
    {
      int64 = xpc_dictionary_get_int64(v2, "ErrorCode");
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, int64, 0);
      string = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MREErrorDomain, 7, 0);
    string = (void *)objc_claimAutoreleasedReturnValue();
  }

  return string;
}

uint64_t sub_1DC074600(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1DC074610(uint64_t a1)
{

}

void sub_1DC074618(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*a2 == 2063)
  {
    __strlcpy_chk();
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t sub_1DC0746BC(uint64_t a1, void *a2)
{
  void (**v3)(id, _DWORD *, unint64_t);
  unsigned int *v4;
  _DWORD *v5;
  unint64_t v6;
  mach_vm_address_t v7;
  mach_vm_size_t v9;
  mach_vm_address_t kcd_addr_begin;

  v3 = a2;
  if (!(_DWORD)a1)
    goto LABEL_12;
  v9 = 0;
  kcd_addr_begin = 0;
  v4 = (unsigned int *)MEMORY[0x1E0C83DA0];
  if (task_map_corpse_info_64(*MEMORY[0x1E0C83DA0], a1, &kcd_addr_begin, &v9))
  {
LABEL_11:
    a1 = 0;
    goto LABEL_12;
  }
  v5 = (_DWORD *)kcd_addr_begin;
  v6 = v9 + kcd_addr_begin;
  v7 = kcd_addr_begin + 16;
  if (kcd_addr_begin + 16 > v9 + kcd_addr_begin
    || v7 + *(unsigned int *)(kcd_addr_begin + 4) > v6
    || *(_DWORD *)kcd_addr_begin != -559025833)
  {
    MEMORY[0x1DF0BFF90](*v4, kcd_addr_begin);
    goto LABEL_11;
  }
  do
  {
    if (v7 + v5[1] > v6)
      break;
    if (*v5 == -242132755)
      break;
    v3[2](v3, v5, v6);
    v5 = (_DWORD *)(v7 + v5[1]);
    v7 = (mach_vm_address_t)(v5 + 4);
  }
  while ((unint64_t)(v5 + 4) <= v6);
  MEMORY[0x1DF0BFF90](*v4, kcd_addr_begin, v9);
  a1 = 1;
LABEL_12:

  return a1;
}

uint64_t SMJobIsEnabled()
{
  return MEMORY[0x1E0D8CA28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1E0C83D30](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, refs);
}

kern_return_t mach_port_kernel_object(ipc_space_read_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  return MEMORY[0x1E0C83D50](*(_QWORD *)&task, *(_QWORD *)&name, object_type, object_addr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1E0C84AF8](*(_QWORD *)&t, x);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x1E0C85840](*(_QWORD *)&task, *(_QWORD *)&corspe_task, kcd_addr_begin, kcd_size);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1E0C86378]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

