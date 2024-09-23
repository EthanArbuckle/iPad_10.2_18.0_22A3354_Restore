@implementation CTServerConnectionSilenceAssertionCreate

void ___CTServerConnectionSilenceAssertionCreate_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void **v12;
  const char *v13;
  const object *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[8];
  void *__p[2];
  uint64_t v23;
  _QWORD v24[6];
  xpc_object_t v25;
  uint64_t v26;
  uint8_t buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v3 = MEMORY[0x1E0C812F8];
  if (object)
  {
    v4 = object;
    xpc_retain(object);
    v25 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    v25 = v4;
    if (!v4)
    {
LABEL_5:
      v5 = xpc_null_create();
      v25 = v5;
      goto LABEL_7;
    }
  }
  if (MEMORY[0x186DBAE5C](v4) != v3)
    goto LABEL_5;
  xpc_retain(v4);
  v5 = v4;
LABEL_7:
  xpc_release(v4);
  v6 = MEMORY[0x186DBAE5C](v5);
  v7 = MEMORY[0x1E0C809B0];
  if (v6 != v3)
  {
    v8 = 0;
    v9 = 0x500000002;
LABEL_9:
    v26 = v9;
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if (!xpc_dictionary_get_value(v5, "kPosixError"))
  {
    if (!xpc_dictionary_get_value(v25, "error"))
    {
      v8 = *(_QWORD **)(a1 + 40);
      _CTServerConnectionSetTargetQueue(v8, *(NSObject **)(a1 + 48));
      v24[0] = v7;
      v24[1] = 0x40000000;
      v24[2] = ___CTServerConnectionSilenceAssertionCreate_block_invoke_61;
      v24[3] = &unk_1E1534350;
      v20 = *(_QWORD *)(a1 + 48);
      v24[4] = *(_QWORD *)(a1 + 32);
      v24[5] = v20;
      _CTServerConnectionRegisterBlockForNotification((uint64_t)v8, CFSTR("kCTConnectionInvalidatedNotification"), (uint64_t)v24);
      goto LABEL_10;
    }
    v19 = CTLogRadioModule();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18425C000, v19, OS_LOG_TYPE_DEFAULT, "error key set in reply", buf, 2u);
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
    v8 = 0;
    v9 = 0x100000001;
    goto LABEL_9;
  }
  LODWORD(v26) = 1;
  *(_QWORD *)buf = &v25;
  *(_QWORD *)&buf[8] = "kPosixError";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, __p);
  HIDWORD(v26) = xpc::dyn_cast_or_default((xpc *)__p, 0);
  xpc_release(__p[0]);
  if (!operator==(&v26, kCTErrorOperationBlockedTemp))
  {
    v8 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)buf = &v25;
  *(_QWORD *)&buf[8] = "kBarringEndTime";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, __p);
  xpc::dyn_cast_or_default((xpc *)__p, v14, 0.0);
  v10 = v15;
  xpc_release(__p[0]);
  v8 = 0;
LABEL_11:
  v11 = CTLogRadioModule();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_QWORD *)(a1 + 56))
    {
      memset(buf, 0, sizeof(buf));
      ctu::cf::assign();
      *(_OWORD *)__p = *(_OWORD *)buf;
      v23 = *(_QWORD *)&buf[16];
      v12 = __p;
      if ((buf[23] & 0x80u) != 0)
        v12 = (void **)__p[0];
      v13 = "false";
      if (v8)
        v13 = "true";
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_18425C000, v11, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionSilenceAssertionCreate() for name = %s assertion = %s", buf, 0x16u);
      if (SHIBYTE(v23) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v16 = "true";
      if (!v8)
        v16 = "false";
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_18425C000, v11, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionSilenceAssertionCreate() for name = %s assertion = %s", buf, 0x16u);
    }
  }
  v17 = *(NSObject **)(a1 + 48);
  v21[0] = v7;
  v21[1] = 0x40000000;
  v21[2] = ___CTServerConnectionSilenceAssertionCreate_block_invoke_69;
  v21[3] = &unk_1E1534378;
  v18 = *(_QWORD *)(a1 + 32);
  v21[7] = v26;
  v21[4] = v18;
  v21[5] = v8;
  v21[6] = v10;
  dispatch_async(v17, v21);
  if (!operator==(kCTErrorNoError, &v26))
    CFRelease(*(CFTypeRef *)(a1 + 40));
  xpc_release(v25);
}

void ___CTServerConnectionSilenceAssertionCreate_block_invoke_61(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___CTServerConnectionSilenceAssertionCreate_block_invoke_2;
  block[3] = &unk_1E1534328;
  v1 = *(NSObject **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v1, block);
}

uint64_t ___CTServerConnectionSilenceAssertionCreate_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

uint64_t ___CTServerConnectionSilenceAssertionCreate_block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

@end
