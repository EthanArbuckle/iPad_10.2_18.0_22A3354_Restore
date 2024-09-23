void sub_20D67BB6C(uint64_t a1)
{

}

void sub_20D67BB74(uint64_t a1)
{

}

void sub_20D67BDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20D67BDE8(uint64_t a1, const char *a2)
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend_daemonPasscodeRequestOpinion_(v2, a2, (uint64_t)&v6);
  v4 = v6;
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "initial state fetch completed with: %d %@", buf, 0x12u);
  }

  atomic_store(0, byte_253E78B08);
}

void sub_20D67BEC8(uint64_t a1, int a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "daemonPasscodeRequestOpinion came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);

}

id _CloudServicesSignpostLogSystem()
{
  if (qword_2549C1AF0 != -1)
    dispatch_once(&qword_2549C1AF0, &unk_24C759A80);
  return (id)qword_2549C1AE8;
}

void sub_20D67C008()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sbd", "signpost");
  v1 = (void *)qword_2549C1AE8;
  qword_2549C1AE8 = (uint64_t)v0;

}

os_signpost_id_t _CloudServicesSignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1;

  v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

double _CloudServicesSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (qword_2549C1B00 != -1)
    dispatch_once(&qword_2549C1B00, &unk_24C759B20);
  v3 = mach_continuous_time();
  LODWORD(v4) = dword_2549C1AF8;
  LODWORD(v5) = *(_DWORD *)algn_2549C1AFC;
  return (double)v4 / (double)v5 * (double)(v3 - a2);
}

uint64_t sub_20D67C0D0()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_2549C1AF8);
}

id sub_20D67C0DC()
{
  return (id)qword_2549C1840;
}

void sub_20D67D610(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend_reason(v3, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, *MEMORY[0x24BDD0FC8]);

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v9, *MEMORY[0x24BDD0B88], 4864, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(v2 + 256);
    *(_QWORD *)(v2 + 256) = v10;

    objc_end_catch();
    JUMPOUT(0x20D67D5D4);
  }
  _Unwind_Resume(exception_object);
}

void sub_20D67E0CC(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D694F88(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67E13C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67E1D0;
  v5[3] = &unk_24C759B78;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_getAccountInfoWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D67E1D0(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v5)
      v8 = v5;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "getAccountInfoWithRequest in daemon came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D67E4E4(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D694FF0(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67E550(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67E5EC;
  v5[3] = &unk_24C759BC8;
  v8 = *(_OWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_enableWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D67E5EC(uint64_t a1, void *a2)
{
  __CFString *v3;
  double Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _CloudServicesSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _CloudServicesSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v14 = 67240192;
    LODWORD(v15) = v3 == 0;
    _os_signpost_emit_with_name_impl(&dword_20D67A000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EnableWithRequest", " CloudServicesSignpostNameEnableWithRequest=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameEnableWithRequest}d ", (uint8_t *)&v14, 8u);
  }

  _CloudServicesSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(const __CFString **)(a1 + 48);
    v14 = 134218496;
    v15 = v9;
    v16 = 2048;
    v17 = Nanoseconds / 1000000000.0;
    v18 = 1026;
    v19 = v3 == 0;
    _os_log_impl(&dword_20D67A000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: EnableWithRequest  CloudServicesSignpostNameEnableWithRequest=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameEnableWithRequest}d ", (uint8_t *)&v14, 0x1Cu);
  }

  sub_20D67C0DC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("no error");
    if (v3)
      v11 = v3;
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_20D67A000, v10, OS_LOG_TYPE_DEFAULT, "enableWithRequest in daemon came back with %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v12, v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D67E8F4(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695058(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67E964(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67E9F8;
  v5[3] = &unk_24C759B78;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_recoverWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D67E9F8(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v5)
      v8 = v5;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "recoverWithRequest came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D67EC0C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6950C0(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67EC7C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67ED10;
  v5[3] = &unk_24C759B78;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_recoverRecordContentsWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D67ED10(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v5)
      v8 = v5;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "recoverRecordContents came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D67EF48(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695128(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67EFB4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D67F04C;
  v6[3] = &unk_24C759C18;
  v4 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend_createICDPRecordWithRequest_recordContents_reply_(v2, v5, v3, v4, v6);

}

void sub_20D67F04C(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "createICDPRecord came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D67F24C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695190(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67F2B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67F34C;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_disableWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D67F34C(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "disableWithRequest came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D67F54C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6951F8(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67F5B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67F64C;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_stashRecoveryDataWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D67F64C(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "stashRecoveryDataWithRequest came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D67F84C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695260(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67F8B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67F94C;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_updateMetadataWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D67F94C(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "updateMetadata came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_20D67FB20(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint8_t v6[16];

  sub_20D67C0DC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D67A000, v2, OS_LOG_TYPE_DEFAULT, "invalidating connection", v6, 2u);
  }

  return objc_msgSend_invalidate(*(void **)(a1 + 32), v3, v4);
}

uint64_t sub_20D67FB90(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_cachePassphraseWithRequestAsync_, *(_QWORD *)(a1 + 40));
}

void sub_20D67FCC0(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6952C8(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67FD2C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67FDC0;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_cachePassphraseWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D67FDC0(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend_invalidate(v3, v4, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D67FF30(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695330(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D67FF9C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D680030;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_uncachePassphraseWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D680030(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend_invalidate(v3, v4, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D6801A0(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695398(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D68020C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D6802A0;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_cacheRecoveryKeyWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D6802A0(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend_invalidate(v3, v4, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D680410(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695400(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D68047C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D680510;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_uncacheRecoveryKeyWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D680510(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend_invalidate(v3, v4, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_20D680654(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint8_t v6[16];

  sub_20D67C0DC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D67A000, v2, OS_LOG_TYPE_DEFAULT, "invalidating connection", v6, 2u);
  }

  return objc_msgSend_invalidate(*(void **)(a1 + 32), v3, v4);
}

uint64_t sub_20D6806C4(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_uncachePassphraseWithRequestAsync_, *(_QWORD *)(a1 + 40));
}

void sub_20D6807F4(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695468(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D680864(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D6808F8;
  v5[3] = &unk_24C759B78;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_startSMSChallengeWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D6808F8(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v5)
      v8 = v5;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "startSMSChallengeWithRequest came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D680B0C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6954D0(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D680B7C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D680C10;
  v5[3] = &unk_24C759B78;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_getCountrySMSCodesWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D680C10(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v5)
      v8 = v5;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "getCountrySMSCodesWithRequest came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D680E24(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695538(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D680E90(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D680F24;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_changeSMSTargetWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D680F24(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "changeSMSTargetWithRequest came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D681144(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6955A0(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D6811B0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D681244;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_backupWithInfo_reply_(v2, v4, v3, v5);

}

void sub_20D681244(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "backupWithInfo came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D681444(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695608(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D6814B4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D681548;
  v5[3] = &unk_24C759B78;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_backOffDateWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D681548(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v5)
      v8 = v5;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "backOffDateWithRequest came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D68175C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695670(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D6817C8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D68185C;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_setBackOffDateWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D68185C(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "setBackOffDateWithRequest came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D681A98(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6956D8(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D681B08(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_20D681B8C;
  v4[3] = &unk_24C759B78;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend_notificationInfoWithReply_(v2, v3, (uint64_t)v4);

}

void sub_20D681B8C(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v5)
      v8 = v5;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "notificationInfo came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D681DDC(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695740(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D681E4C(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_20D681ED0;
  v4[3] = &unk_24C759B78;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend_stateCaptureWithReply_(v2, v3, (uint64_t)v4);

}

void sub_20D681ED0(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v5)
      v8 = v5;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "stateCapture came back with %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D682188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D6821B4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D6821C4(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D694F88(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D682230(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D6822B8;
  v6[3] = &unk_24C759D08;
  v8 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_getAccountInfoWithRequest_reply_(v1, v4, v2, v6);

}

void sub_20D6822B8(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  void **v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "getAccountInfoWithRequest came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v6;
  }
  else
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v5;
  }
  v11 = v10;
  v12 = *v9;
  *v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

void sub_20D68261C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D68263C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695890(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D6826A8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D682728;
  v6[3] = &unk_24C759D58;
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_updateMetadataWithRequest_reply_(v1, v4, v2, v6);

}

void sub_20D682728(uint64_t a1, void *a2)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("no error");
    if (v4)
      v6 = v4;
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "updateMetadataWithRequest came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);

}

void sub_20D682A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D682A74(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D694FF0(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D682AE0(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D682B60;
  v6[3] = &unk_24C759D58;
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_enableWithRequest_reply_(v1, v4, v2, v6);

}

void sub_20D682B60(uint64_t a1, void *a2)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("no error");
    if (v4)
      v6 = v4;
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "enableWithRequest came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);

}

void sub_20D682EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D682EF0(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695058(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D682F5C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D682FE4;
  v6[3] = &unk_24C759D08;
  v8 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_recoverWithRequest_reply_(v1, v4, v2, v6);

}

void sub_20D682FE4(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  void **v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "recoverWithRequest came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v6;
  }
  else
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v5;
  }
  v11 = v10;
  v12 = *v9;
  *v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

void sub_20D683394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_20D6833CC(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695A54(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D683438(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_20D6834D0;
  v7[3] = &unk_24C759D08;
  v9 = *(_QWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 56);
  v4 = (id)v6;
  v8 = v6;
  objc_msgSend_recoverWithCDPContextInDaemon_escrowRecord_reply_(v1, v5, v2, v3, v7);

}

void sub_20D6834D0(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  void **v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "recoverWithCDPContextInDaemon came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v6;
  }
  else
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v5;
  }
  v11 = v10;
  v12 = *v9;
  *v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

void sub_20D683880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_20D6838B8(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695B30(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D683924(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_20D6839BC;
  v7[3] = &unk_24C759D08;
  v9 = *(_QWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 56);
  v4 = (id)v6;
  v8 = v6;
  objc_msgSend_recoverSilentWithCDPContextInDaemon_allRecords_reply_(v1, v5, v2, v3, v7);

}

void sub_20D6839BC(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  void **v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "recoverSilentWithCDPContextInDaemon came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v6;
  }
  else
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v5;
  }
  v11 = v10;
  v12 = *v9;
  *v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

void sub_20D683CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20D683CF8(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695C0C(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D683D64(uint64_t a1)
{
  void *v1;
  id v2;
  const char *v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D683DE8;
  v5[3] = &unk_24C759DD0;
  v7 = *(_QWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  v2 = (id)v4;
  v6 = v4;
  objc_msgSend_isRecoveryKeySetInDaemon_(v1, v3, (uint64_t)v5);

}

void sub_20D683DE8(uint64_t a1, char a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "isRecoveryKeySetInDaemon came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);

}

void sub_20D68413C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20D684160(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695CE8(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D6841CC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  const char *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_20D684270;
  v9[3] = &unk_24C759D58;
  v8 = *(_OWORD *)(a1 + 64);
  v6 = (id)v8;
  v10 = v8;
  objc_msgSend_restoreKeychainAsyncWithPasswordInDaemon_keybagDigest_haveBottledPeer_viewsNotToBeRestored_reply_(v1, v7, v2, v4, v3, v5, v9);

}

void sub_20D684270(uint64_t a1, void *a2)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("no error");
    if (v4)
      v6 = v4;
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "restoreKeychainAsyncWithPasswordInDaemon came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);

}

void sub_20D684580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D6845B0(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695DC4(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D68461C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D6846A4;
  v6[3] = &unk_24C759DD0;
  v8 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_restoreKeychainWithBackupPasswordInDaemon_reply_(v1, v4, v2, v6);

}

void sub_20D6846A4(uint64_t a1, char a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "restoreKeychainWithBackupPassword came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);

}

void sub_20D6849D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D684A00(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695EA0(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D684A6C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D684AF4;
  v6[3] = &unk_24C759DD0;
  v8 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_verifyRecoveryKeyInDaemon_reply_(v1, v4, v2, v6);

}

void sub_20D684AF4(uint64_t a1, char a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "verifyRecoveryKey came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);

}

void sub_20D684DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20D684E20(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695F7C(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D684E8C(uint64_t a1)
{
  void *v1;
  id v2;
  const char *v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D684F10;
  v5[3] = &unk_24C759DD0;
  v7 = *(_QWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  v2 = (id)v4;
  v6 = v4;
  objc_msgSend_removeRecoveryKeyFromBackupInDaemon_(v1, v3, (uint64_t)v5);

}

void sub_20D684F10(uint64_t a1, char a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "removeRecoveryKeyFromBackup came back with %@", (uint8_t *)&v11, 0xCu);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);

}

void sub_20D685140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_20D68534C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D68536C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695190(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D6853D8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D685458;
  v6[3] = &unk_24C759D58;
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_disableWithRequest_reply_(v1, v4, v2, v6);

}

void sub_20D685458(uint64_t a1, void *a2)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("no error");
    if (v4)
      v6 = v4;
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "disableWithRequest came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);

}

void sub_20D6856B0(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_20D6859C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D6859F0(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695468(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D685A5C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D685AE4;
  v6[3] = &unk_24C759D08;
  v8 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_startSMSChallengeWithRequest_reply_(v1, v4, v2, v6);

}

void sub_20D685AE4(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  void **v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "startSMSChallengeWithRequest came back with %@", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v6;
  }
  else
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v5;
  }
  v11 = v10;
  v12 = *v9;
  *v9 = v11;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14);
}

uint64_t sub_20D685D3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D685F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D685F48(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D695538(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D685FB4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D686034;
  v6[3] = &unk_24C759D58;
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_changeSMSTargetWithRequest_reply_(v1, v4, v2, v6);

}

void sub_20D686034(uint64_t a1, void *a2)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("no error");
    if (v4)
      v6 = v4;
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "changeSMSTargetWithRequest came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);

}

void sub_20D686368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D686388(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_20D6961B4();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void sub_20D6863F4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D686474;
  v6[3] = &unk_24C759D58;
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_backupForRecoveryKeyWithInfoInDaemon_reply_(v1, v4, v2, v6);

}

void sub_20D686474(uint64_t a1, void *a2)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("no error");
    if (v4)
      v6 = v4;
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "backupForRecoveryKeyWithInfoInDaemon came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);

}

void sub_20D6866F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D686714(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6955A0(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D686780(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D686800;
  v6[3] = &unk_24C759D58;
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_backupWithInfo_reply_(v1, v4, v2, v6);

}

void sub_20D686800(uint64_t a1, void *a2)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("no error");
    if (v4)
      v6 = v4;
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "backupWithInfo came back with %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v7, v8);

}

void sub_20D686C4C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D696300(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D686CB8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D686D54;
  v6[3] = &unk_24C759C18;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend_prepareHSA2EscrowRecordContents_usesComplexPassphrase_reply_(v2, v5, v3, v4, v6);

}

void sub_20D686D54(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "prepareHSA2EscrowRecordContents came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D686E30(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = (const char *)objc_msgSend_UTF8String(CFSTR("com.apple.sbd.passcode_request"), a2, a3);
  if (notify_register_check(v3, &dword_253E78AFC))
  {
    sub_20D67C0DC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "unable to fetch passcode_request token", v5, 2u);
    }

  }
  else
  {
    byte_253E78B01 = 1;
  }
}

void sub_20D686EC0(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D696448(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D686F2C(uint64_t a1)
{
  void *v1;
  id v2;
  const char *v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D67BEC8;
  v5[3] = &unk_24C759EB8;
  v7 = *(_QWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  v2 = (id)v4;
  v6 = v4;
  objc_msgSend_daemonPasscodeRequestOpinion_(v1, v3, (uint64_t)v5);

}

void sub_20D68725C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_20D687288(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D696524(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D6872F4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  const char *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 88);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_20D6873A0;
  v9[3] = &unk_24C759EE0;
  v8 = *(_OWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 80);
  v6 = (id)v8;
  v10 = v8;
  objc_msgSend_beginHSA2PasscodeRequest_desirePasscodeImmediately_uuid_reason_reply_(v1, v7, v2, v3, v4, v5, v9);

}

void sub_20D6873A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v14 = 138412290;
    v15 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "beginHSA2PasscodeRequest came back with %@", (uint8_t *)&v14, 0xCu);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v12, v13);
}

void sub_20D6875DC(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D69658C(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D687654(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D6876E8;
  v5[3] = &unk_24C759F30;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_getCertificatesWithRequest_reply_(v2, v4, v3, v5);

}

void sub_20D6876E8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v15 = a2;
  objc_msgSend_invalidate(v9, v13, v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D687938(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6965F4(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D6879A4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D687A38;
  v5[3] = &unk_24C759C18;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_saveTermsAcceptance_reply_(v2, v4, v3, v5);

}

void sub_20D687A38(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no error");
    if (v3)
      v5 = v3;
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20D67A000, v4, OS_LOG_TYPE_DEFAULT, "saveTermsAcceptance came back with %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v6, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20D687C58(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D69665C(v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D687CC8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D687D5C;
  v5[3] = &unk_24C759F58;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend_getAcceptedTermsForAltDSID_reply_(v2, v4, v3, v5);

}

void sub_20D687D5C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v16 = 138412290;
    v17 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "getAcceptedTermsForAltDSID came back with %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);
  v11 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend_count(v5, v12, v13))
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, __CFString *))(v11 + 16))(v11, v15, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, __CFString *))(v11 + 16))(v11, 0, v6);
  }

}

void sub_20D688040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20D688068(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D69665C(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D6880D4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D68815C;
  v6[3] = &unk_24C759F80;
  v8 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend_getAcceptedTermsForAltDSID_reply_(v1, v4, v2, v6);

}

void sub_20D68815C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v14 = 138412290;
    v15 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "getAcceptedTermsForAltDSID came back with %@", (uint8_t *)&v14, 0xCu);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  objc_msgSend_invalidate(*(void **)(a1 + 32), v12, v13);
}

void sub_20D6884A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D6884CC(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D6966C4(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D688538(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_20D6885D0;
  v7[3] = &unk_24C759DD0;
  v9 = *(_QWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 56);
  v4 = (id)v6;
  v8 = v6;
  objc_msgSend_moveToFederationAllowed_altDSID_reply_(v1, v5, v2, v3, v7);

}

void sub_20D6885D0(uint64_t a1, char a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_20D67C0DC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("no error");
    if (v6)
      v8 = v6;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20D67A000, v7, OS_LOG_TYPE_DEFAULT, "moveToFederationAllowed came back with %@", (uint8_t *)&v11, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v9, v10);

}

void sub_20D68885C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20D688884(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20D67C0DC();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    sub_20D69672C(v3, v4, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20D6888F0(uint64_t a1)
{
  void *v1;
  id v2;
  const char *v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_20D688974;
  v5[3] = &unk_24C759F80;
  v7 = *(_QWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  v2 = (id)v4;
  v6 = v4;
  objc_msgSend_knownICDPFederations_(v1, v3, (uint64_t)v5);

}

void sub_20D688974(uint64_t a1, void *a2, void *a3)
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  sub_20D67C0DC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("no error");
    if (v7)
      v9 = v7;
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_20D67A000, v8, OS_LOG_TYPE_DEFAULT, "knownICDPFederations came back with %@", (uint8_t *)&v12, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_msgSend_invalidate(*(void **)(a1 + 32), v10, v11);

}

void SecureBackupGetAccountInfoWithInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SecureBackup *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x212BA6BEC]();
  v5 = [SecureBackup alloc];
  v7 = (void *)objc_msgSend_initWithUserActivityLabel_(v5, v6, (uint64_t)CFSTR("getAccountInfo (legacy API)"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20D6890F0;
  v10[3] = &unk_24C759E48;
  v8 = v3;
  v11 = v8;
  objc_msgSend_getAccountInfoWithInfo_completionBlock_(v7, v9, a1, v10);

  objc_autoreleasePoolPop(v4);
}

uint64_t sub_20D6890F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void SecureBackupEnableWithInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SecureBackup *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x212BA6BEC]();
  v5 = [SecureBackup alloc];
  v7 = (void *)objc_msgSend_initWithUserActivityLabel_(v5, v6, (uint64_t)CFSTR("enable (legacy API)"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20D6891B4;
  v10[3] = &unk_24C759B50;
  v8 = v3;
  v11 = v8;
  objc_msgSend_enableWithInfo_completionBlock_(v7, v9, a1, v10);

  objc_autoreleasePoolPop(v4);
}

uint64_t sub_20D6891B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void SecureBackupRecoverWithInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SecureBackup *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x212BA6BEC]();
  v5 = [SecureBackup alloc];
  v7 = (void *)objc_msgSend_initWithUserActivityLabel_(v5, v6, (uint64_t)CFSTR("recover (legacy API)"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20D689278;
  v10[3] = &unk_24C759E48;
  v8 = v3;
  v11 = v8;
  objc_msgSend_recoverWithInfo_completionBlock_(v7, v9, a1, v10);

  objc_autoreleasePoolPop(v4);
}

uint64_t sub_20D689278(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void SecureBackupDisableWithInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SecureBackup *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x212BA6BEC]();
  v5 = [SecureBackup alloc];
  v7 = (void *)objc_msgSend_initWithUserActivityLabel_(v5, v6, (uint64_t)CFSTR("disable (legacy API)"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20D68933C;
  v10[3] = &unk_24C759B50;
  v8 = v3;
  v11 = v8;
  objc_msgSend_disableWithInfo_completionBlock_(v7, v9, a1, v10);

  objc_autoreleasePoolPop(v4);
}

uint64_t sub_20D68933C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void SecureBackupUpdateMetadataWithInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SecureBackup *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x212BA6BEC]();
  v5 = [SecureBackup alloc];
  v7 = (void *)objc_msgSend_initWithUserActivityLabel_(v5, v6, (uint64_t)CFSTR("updateMetadata (legacy API)"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20D689400;
  v10[3] = &unk_24C759B50;
  v8 = v3;
  v11 = v8;
  objc_msgSend_updateMetadataWithInfo_completionBlock_(v7, v9, a1, v10);

  objc_autoreleasePoolPop(v4);
}

uint64_t sub_20D689400(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void SecureBackupBackOffDateWithInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SecureBackup *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x212BA6BEC]();
  v5 = [SecureBackup alloc];
  v7 = (void *)objc_msgSend_initWithUserActivityLabel_(v5, v6, (uint64_t)CFSTR("backOffDate (legacy API)"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20D6894C4;
  v10[3] = &unk_24C759E48;
  v8 = v3;
  v11 = v8;
  objc_msgSend_backOffDateWithInfo_completionBlock_(v7, v9, a1, v10);

  objc_autoreleasePoolPop(v4);
}

uint64_t sub_20D6894C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void SecureBackupSetBackOffDateWithInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SecureBackup *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x212BA6BEC]();
  v5 = [SecureBackup alloc];
  v7 = (void *)objc_msgSend_initWithUserActivityLabel_(v5, v6, (uint64_t)CFSTR("setBackOffDate (legacy API)"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20D689588;
  v10[3] = &unk_24C759B50;
  v8 = v3;
  v11 = v8;
  objc_msgSend_setBackOffDateWithInfo_completionBlock_(v7, v9, a1, v10);

  objc_autoreleasePoolPop(v4);
}

uint64_t sub_20D689588(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void SecureBackupKVSState(void *a1)
{
  id v1;
  void *v2;
  SecureBackup *v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  _QWORD v8[4];
  id v9;

  v1 = a1;
  v2 = (void *)MEMORY[0x212BA6BEC]();
  v3 = [SecureBackup alloc];
  v5 = (void *)objc_msgSend_initWithUserActivityLabel_(v3, v4, (uint64_t)CFSTR("stateCapture (legacy API)"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_20D689644;
  v8[3] = &unk_24C759E48;
  v6 = v1;
  v9 = v6;
  objc_msgSend_stateCaptureWithCompletionBlock_(v5, v7, (uint64_t)v8);

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_20D689644(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D689A94(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend_processInfo(MEMORY[0x24BDD1760], a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v7, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_253E78B10;
  qword_253E78B10 = v5;

}

void sub_20D689ADC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20D689AF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_20D689B14(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_code(a1, a2, a3);
}

BOOL SecureBackupTermsInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_24;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_24;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_24:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id sub_20D68A4E8(void *a1)
{
  id v1;
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (qword_253E78B28 != -1)
    dispatch_once(&qword_253E78B28, &unk_24C759AC0);
  v2 = (void *)MEMORY[0x24BDBCF20];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v3, (uint64_t)v38, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v7, (uint64_t)v6, sel_recoverSilentWithCDPContextInDaemon_allRecords_reply_, 1, 0);
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend_setWithObject_(v8, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v12, (uint64_t)v11, sel_recoverSilentWithCDPContextInDaemon_allRecords_reply_, 0, 0);

  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend_setWithObject_(v13, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v17, (uint64_t)v16, sel_recoverWithCDPContextInDaemon_escrowRecord_reply_, 0, 0);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  v37[3] = objc_opt_class();
  v37[4] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, (uint64_t)v37, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v23, (uint64_t)v22, sel_restoreKeychainAsyncWithPasswordInDaemon_keybagDigest_haveBottledPeer_viewsNotToBeRestored_reply_, 3, 0);

  v24 = (void *)MEMORY[0x24BDBCF20];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  v36[3] = objc_opt_class();
  v36[4] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v25, (uint64_t)v36, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v24, v27, (uint64_t)v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v29, (uint64_t)v28, sel_createICDPRecordWithRequest_recordContents_reply_, 1, 0);

  v30 = (void *)MEMORY[0x24BDBCF20];
  v31 = objc_opt_class();
  objc_msgSend_setWithObject_(v30, v32, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v34, (uint64_t)v33, sel_beginHSA2PasscodeRequest_desirePasscodeImmediately_uuid_reason_reply_, 3, 0);

  return v1;
}

uint64_t sub_20D68A7F4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  uint64_t result;
  const char *v7;

  objc_msgSend_set(MEMORY[0x24BDBCEF0], a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_253E78B20;
  qword_253E78B20 = v3;

  for (i = 0; i != 13; ++i)
  {
    result = (uint64_t)objc_getClass(off_24C759FD0[i]);
    if (result)
      result = objc_msgSend_addObject_((void *)qword_253E78B20, v7, result);
  }
  return result;
}

id sub_20D68A864(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;

  v1 = a1;
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend_setWithObjects_(v2, v5, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v1, v7, (uint64_t)v6, sel_getAcceptedTermsForAltDSID_reply_, 0, 1);

  return v1;
}

uint64_t SecureBackupEscrowReasonReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

size_t sub_20D68B2F4(uint64_t *a1)
{
  size_t result;
  uint64_t v3;
  unint64_t v4;

  *a1 = ccrng();
  a1[1] = ccsha256_di();
  a1[2] = ccaes_cbc_encrypt_mode();
  a1[3] = ccaes_cbc_decrypt_mode();
  a1[4] = ccaes_gcm_encrypt_mode();
  a1[5] = ccaes_gcm_decrypt_mode();
  ccsrp_gp_rfc5054_2048();
  result = ccdh_ccn_size();
  if (result >> 62)
    goto LABEL_6;
  v3 = 4 * result + 48;
  if (4 * result >= 0xFFFFFFFFFFFFFFD0)
    goto LABEL_7;
  v4 = *(_QWORD *)a1[1];
  if (v4 >> 62)
  {
LABEL_6:
    __break(0x550Cu);
    goto LABEL_7;
  }
  result = v3 + 4 * v4;
  if (!__CFADD__(v3, 4 * v4))
  {
    a1[6] = (uint64_t)malloc_type_malloc(result, 0xA83F1E54uLL);
    ccsrp_gp_rfc5054_2048();
    return ccsrp_ctx_init_option();
  }
LABEL_7:
  __break(0x5500u);
  return result;
}

void sub_20D68B3B8(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;

  if (a1)
  {
    v2 = ccdh_ccn_size();
    if (!(v2 >> 62))
    {
      if (4 * v2 >= 0xFFFFFFFFFFFFFFD0)
        goto LABEL_9;
      v3 = ***(_QWORD ***)(a1 + 48);
      if (!(v3 >> 62))
      {
        if (!__CFADD__(4 * v2 + 48, 4 * v3))
        {
          cc_clear();
          free(*(void **)(a1 + 48));
          *(_QWORD *)(a1 + 48) = 0;
          *(_OWORD *)a1 = 0u;
          *(_OWORD *)(a1 + 16) = 0u;
          return;
        }
LABEL_9:
        __break(0x5500u);
        return;
      }
    }
    __break(0x550Cu);
    goto LABEL_9;
  }
}

unint64_t sub_20D68B434(uint64_t a1)
{
  unint64_t result;

  result = MEMORY[0x212BA694C](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
  if (result >> 61)
    __break(0x550Cu);
  else
    result *= 8;
  return result;
}

BOOL sub_20D68B460(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_20D68B434(a1) <= a3 && ccsrp_client_start_authentication() == 0;
}

uint64_t sub_20D68B4B8()
{
  return ccsrp_get_session_key_length();
}

unint64_t sub_20D68B4C0(uint64_t a1)
{
  uint64_t v1;
  unint64_t result;

  v1 = *(_QWORD *)(a1 + 48);
  result = MEMORY[0x212BA694C](*(_QWORD *)(v1 + 8));
  if (!(result >> 62))
    return v1 + 32 * result + 32;
  __break(0x550Cu);
  return result;
}

unint64_t sub_20D68B4F8(uint64_t a1)
{
  unint64_t result;

  result = MEMORY[0x212BA694C](*(_QWORD *)(a1 + 8));
  if (!(result >> 62))
    return a1 + 32 * result + 32;
  __break(0x550Cu);
  return result;
}

uint64_t sub_20D68B530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void (*a8)(const char *, ...), uint64_t a9)
{
  return sub_20D68B558(a1, a2, a3, a4, a5, a6, a7, 0, a8, a9);
}

uint64_t sub_20D68B558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, int a8, void (*a9)(const char *, ...), uint64_t a10)
{
  size_t v14;
  uint64_t session_key_length;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  uint64_t result;
  size_t v22;
  void *v23;
  char *v24;
  size_t v25;
  char *v26;
  size_t v27;
  int *v28;
  int v29;
  uint64_t v30;
  unsigned int *v31;
  size_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  unsigned int v40;
  void *v41;
  unsigned int *v42;
  char *v43;
  void *__dst;

  v14 = sub_20D68B434(a1);
  session_key_length = ccsrp_get_session_key_length();
  if (!session_key_length)
    return 4294967197;
  v16 = session_key_length;
  cc_clear();
  v17 = a5 + 44;
  v18 = *(unsigned int *)(a5 + 44 + *(unsigned int *)(a5 + 32));
  if ((_DWORD)v18 != 64)
  {
    a9("CKVR_SRP_SALT_LEN %d != packet_salt_len %zu", 64, v18);
    (*(void (**)(uint64_t, const char *))(a10 + 16))(a10, "CKVR_SRP_SALT_LEN %d != packet_salt_len %zu");
    goto LABEL_6;
  }
  v42 = a6;
  v19 = *(unsigned int *)(v17 + *(unsigned int *)(a5 + 28));
  if ((v19 - 257) <= 0xFFFFFEFF)
  {
    a9("hsm_id_len %zu not in (0,%d)", *(unsigned int *)(v17 + *(unsigned int *)(a5 + 28)), 256);
    (*(void (**)(uint64_t, const char *))(a10 + 16))(a10, "hsm_id_len %zu not in (0,%d)");
LABEL_6:
    cc_clear();
    return 4294967294;
  }
  v39 = a7;
  v22 = *(unsigned int *)(v17 + *(unsigned int *)(a5 + 36));
  v23 = malloc_type_malloc(v19, 0xCE03D9D4uLL);
  v24 = (char *)malloc_type_malloc(v14, 0x7237F347uLL);
  v25 = v16;
  v26 = v24;
  v40 = v25;
  v41 = malloc_type_malloc(v25, 0xAB07AF6DuLL);
  __dst = v23;
  cc_clear();
  v43 = v26;
  result = cc_clear();
  if (v14 < v22)
  {
    a9("pki_size %zd < B_len %zd", v14, v22);
    (*(void (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "pki_size %zd < B_len %zd", v14, v22);
    v20 = 4294967254;
    goto LABEL_17;
  }
  if (v14 > v22)
  {
    a9("pki_size %zd > B_len %zd", v14, v22);
    result = (*(uint64_t (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "pki_size %zd > B_len %zd", v14, v22);
  }
  v27 = v14 - v22;
  if (v14 >= v22)
  {
    v28 = (int *)(v17 + *(unsigned int *)(a5 + 28));
    v29 = *v28;
    if (v19 >= *v28)
    {
      memcpy(__dst, v28 + 1, *v28);
      v30 = *(unsigned int *)(v17 + *(unsigned int *)(a5 + 32));
      if (v30 <= 0x40)
      {
        __memcpy_chk();
        v31 = (unsigned int *)(v17 + *(unsigned int *)(a5 + 36));
        v32 = *v31;
        if (v22 >= v32)
        {
          v34 = v43;
          memcpy(&v43[v27], v31 + 1, v32);
          if ((_DWORD)v30 == 64)
          {
            v36 = v29;
            v33 = v41;
            v37 = ccsrp_client_process_challenge();
            if (!v37)
            {
              v35 = __dst;
              if (sub_20D68EF34(a8, (_OWORD *)(a5 + 12), v36, (uint64_t)__dst, v40, (uint64_t)v41, v42, v39))
              {
                a9("pack_srp_recovery_rec failed");
                (*(void (**)(uint64_t, const char *))(a10 + 16))(a10, "pack_srp_recovery_rec failed");
                v20 = 4294967291;
              }
              else
              {
                v20 = 0;
              }
              goto LABEL_18;
            }
            v38 = v37;
            a9("ccsrp_client_process_challenge failed: %d", v37);
            v34 = v43;
            (*(void (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "ccsrp_client_process_challenge failed: %d", v38);
            v20 = 4294967293;
          }
          else
          {
            a9("ccses->salt_len %d != salt_len %zd", 64, v30);
            v34 = v43;
            (*(void (**)(uint64_t, const char *, ...))(a10 + 16))(a10, "ccses->salt_len %d != salt_len %zd", 64, v30);
            v20 = 4294967294;
            v33 = v41;
          }
          v35 = __dst;
LABEL_18:
          cc_clear();
          if (v35)
          {
            cc_clear();
            free(v35);
          }
          if (v34)
          {
            cc_clear();
            free(v34);
          }
          if (v33)
          {
            cc_clear();
            free(v33);
          }
          return v20;
        }
      }
    }
    a9("unpack_srp_init_resp_rec failed");
    (*(void (**)(uint64_t, const char *))(a10 + 16))(a10, "unpack_srp_init_resp_rec failed");
    v20 = 0xFFFFFFFFLL;
LABEL_17:
    v33 = v41;
    v34 = v43;
    v35 = __dst;
    goto LABEL_18;
  }
  __break(0x5515u);
  return result;
}

uint64_t sub_20D68B99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void (*a8)(const char *, ...), uint64_t a9)
{
  return sub_20D68B558(a1, a2, a3, a4, a5, a6, a7, 1, a8, a9);
}

uint64_t sub_20D68B9C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void (*a8)(const char *, ...), uint64_t a9)
{
  return sub_20D68B558(a1, a2, a3, a4, a5, a6, a7, 2, a8, a9);
}

unint64_t sub_20D68B9EC(unint64_t result, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 16) + 8);
  v3 = a2 / v2 + 1;
  if (a2 / v2 == -1)
  {
    __break(0x5500u);
  }
  else if (is_mul_ok(v3, v2))
  {
    return v3 * v2;
  }
  __break(0x550Cu);
  return result;
}

uint64_t sub_20D68BA1C(uint64_t a1)
{
  size_t v2;
  uint64_t v3;
  size_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8) >= 0xFFFFFFFFFFFFFFF0
    || (((void (*)(void))MEMORY[0x24BDAC7A8])(),
        bzero((char *)v6 - v2, v2),
        v3 = cccbc_set_iv(),
        **(_QWORD **)(a1 + 16) >= 0xFFFFFFFFFFFFFFF0))
  {
    __break(0x5500u);
  }
  MEMORY[0x24BDAC7A8](v3);
  bzero((char *)v6 - v4, v4);
  cccbc_init();
  return ccpad_pkcs7_encrypt();
}

uint64_t sub_20D68BB60(uint64_t a1)
{
  size_t v2;
  uint64_t v3;
  size_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) >= 0xFFFFFFFFFFFFFFF0
    || (MEMORY[0x24BDAC7A8](a1),
        bzero((char *)v6 - v2, v2),
        v3 = cccbc_set_iv(),
        **(_QWORD **)(a1 + 24) >= 0xFFFFFFFFFFFFFFF0))
  {
    __break(0x5500u);
  }
  MEMORY[0x24BDAC7A8](v3);
  bzero((char *)v6 - v4, v4);
  cccbc_init();
  return ccpad_pkcs7_decrypt();
}

uint64_t sub_20D68BCA4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[4];

  v35[1] = a6;
  v35[3] = *MEMORY[0x24BDAC8D0];
  v8 = malloc_type_malloc(0x40uLL, 0x9E76ECD3uLL);
  (**(void (***)(void))a1)();
  v9 = sub_20D68BA1C(a1);
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(v10 + 8);
  v12 = v11 + 8;
  if (v11 >= 0xFFFFFFFFFFFFFFF8)
    goto LABEL_19;
  v13 = *(_QWORD *)(v10 + 16);
  v14 = __CFADD__(v12, v13);
  v15 = v12 + v13;
  if (v14)
    goto LABEL_19;
  v14 = __CFADD__(v15, 4);
  v16 = v15 + 4;
  if (v14)
    goto LABEL_19;
  v14 = __CFADD__(v16, 8);
  v17 = v16 + 8;
  if (v14)
    goto LABEL_19;
  v18 = (v17 - 1) & 0xFFFFFFFFFFFFFFF8;
  v14 = __CFADD__(v18, v11);
  v19 = v18 + v11;
  if (v14)
    goto LABEL_19;
  if (v19 >= 0xFFFFFFFFFFFFFFF8)
    goto LABEL_19;
  MEMORY[0x24BDAC7A8](v9);
  bzero((char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
  cchmac_init();
  cchmac_update();
  cchmac_update();
  cchmac_final();
  v21 = *(_QWORD *)(a1 + 8);
  v22 = *(_QWORD *)(v21 + 8);
  v23 = v22 + 8;
  if (v22 >= 0xFFFFFFFFFFFFFFF8)
    goto LABEL_19;
  v24 = *(_QWORD *)(v21 + 16);
  v14 = __CFADD__(v23, v24);
  v25 = v23 + v24;
  if (v14)
    goto LABEL_19;
  v14 = __CFADD__(v25, 4);
  v26 = v25 + 4;
  if (v14)
    goto LABEL_19;
  v14 = __CFADD__(v26, 8);
  v27 = v26 + 8;
  if (v14 || __CFADD__((v27 - 1) & 0xFFFFFFFFFFFFFFF8, v22))
    goto LABEL_19;
  cc_clear();
  if (*a2 >> 61)
    goto LABEL_20;
  v28 = 8 * *a2;
  v14 = __CFADD__(v28, 8);
  v29 = v28 + 8;
  if (v14)
    goto LABEL_19;
  v30 = (v29 - 1) & 0xFFFFFFFFFFFFFFF8;
  if (!is_mul_ok(v30, 3uLL))
    goto LABEL_20;
  v31 = 3 * v30;
  v14 = __CFADD__(v31, 40);
  v32 = v31 + 40;
  if (v14)
  {
LABEL_19:
    __break(0x5500u);
LABEL_20:
    __break(0x550Cu);
  }
  v35[2] = v32;
  ccsha1_di();
  v33 = ccrsa_encrypt_oaep();
  if (v8)
  {
    cc_clear();
    free(v8);
  }
  return v33;
}

uint64_t sub_20D68BF20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  size_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[4];

  v32[0] = a7;
  v32[1] = a8;
  v32[3] = *MEMORY[0x24BDAC8D0];
  v32[2] = 256;
  v9 = malloc_type_malloc(0x100uLL, 0xB3DD20A7uLL);
  v10 = malloc_type_malloc(**(_QWORD **)(a1 + 8), 0x12B6B1BFuLL);
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(v11 + 8);
  v13 = v12 + 8;
  if (v12 >= 0xFFFFFFFFFFFFFFF8)
    goto LABEL_21;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = __CFADD__(v13, v14);
  v16 = v13 + v14;
  if (v15)
    goto LABEL_21;
  v15 = __CFADD__(v16, 4);
  v17 = v16 + 4;
  if (v15)
    goto LABEL_21;
  v15 = __CFADD__(v17, 8);
  v18 = v17 + 8;
  if (v15)
    goto LABEL_21;
  v19 = (v18 - 1) & 0xFFFFFFFFFFFFFFF8;
  v15 = __CFADD__(v19, v12);
  v20 = v19 + v12;
  if (v15 || v20 >= 0xFFFFFFFFFFFFFFF8)
    goto LABEL_21;
  v21 = v10;
  MEMORY[0x24BDAC7A8](v10);
  bzero((char *)v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
  ccsha1_di();
  if (ccrsa_decrypt_oaep())
    goto LABEL_14;
  cchmac_init();
  cchmac_update();
  cchmac_update();
  cchmac_final();
  v23 = *(_QWORD *)(a1 + 8);
  v24 = *(_QWORD *)(v23 + 8);
  v25 = v24 + 8;
  if (v24 >= 0xFFFFFFFFFFFFFFF8
    || (v26 = *(_QWORD *)(v23 + 16), v15 = __CFADD__(v25, v26), v27 = v25 + v26, v15)
    || (v15 = __CFADD__(v27, 4), v28 = v27 + 4, v15)
    || (v15 = __CFADD__(v28, 8), v29 = v28 + 8, v15)
    || __CFADD__((v29 - 1) & 0xFFFFFFFFFFFFFFF8, v24))
  {
LABEL_21:
    __break(0x5500u);
  }
  cc_clear();
  if (cc_cmp_safe())
  {
LABEL_14:
    v30 = -1;
    if (!v9)
      goto LABEL_16;
    goto LABEL_15;
  }
  v30 = sub_20D68BB60(a1);
  if (v9)
  {
LABEL_15:
    cc_clear();
    free(v9);
  }
LABEL_16:
  if (v21)
  {
    cc_clear();
    free(v21);
  }
  return v30;
}

uint64_t sub_20D68C194(unsigned int a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9, uint64_t a10, int a11, int a12, unsigned int a13, uint64_t a14, unsigned int *a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int *v23;
  const void *v24;
  size_t v25;
  unsigned int v26;
  unsigned int v27;
  _DWORD *v28;
  int v29;
  BOOL v30;
  int v31;
  uint64_t v32;
  uint64_t i;
  _QWORD v35[14];

  v16 = 0;
  v17 = a16;
  v35[12] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a16 + 4) = 160;
  *(_DWORD *)(a16 + 12) = a11;
  v35[0] = a1;
  v35[1] = a2;
  v35[2] = a7;
  v35[3] = a8;
  v35[4] = a9;
  v35[5] = a10;
  v35[6] = a13;
  v35[7] = a14;
  v35[8] = a3;
  v35[9] = a4;
  v35[10] = a5;
  v35[11] = a6;
  v18 = a16 + 20;
  v19 = a16 + 48;
  v20 = *a15;
  v21 = *a15;
  *(_QWORD *)(a16 + 16) = 10;
  do
  {
    if (((16 * v16) | 8uLL) > 0x60 || (unint64_t)(16 * v16) > 0x5F)
    {
      __break(1u);
LABEL_21:
      __break(0x5500u);
LABEL_22:
      __break(0x5515u);
    }
    v22 = *(unsigned int *)(v18 + 4 * v16);
    v23 = (unsigned int *)&v35[2 * v16];
    v24 = (const void *)*((_QWORD *)v23 + 1);
    if (v24)
    {
      v25 = *v23;
      if (v25 >= 0xFFFFFFFD)
        goto LABEL_21;
      v26 = (v25 + 3) & 0xFFFFFFFC;
      if (v26 < v25)
        return 0;
      v27 = v26 + 4;
      if (v26 >= 0xFFFFFFFC)
        goto LABEL_21;
      if (v26 + 3 >= v21)
        return 0;
      v28 = (_DWORD *)(v19 + v22);
      *(_DWORD *)(v19 + v22) = v25;
      memcpy((void *)(v19 + v22 + 4), v24, v25);
      *v28 = bswap32(v25);
      v29 = *(_DWORD *)(v18 + 4 * v16);
      v30 = __CFADD__(v27, v29);
      v31 = v27 + v29;
      if (v30)
        goto LABEL_21;
      ++v16;
      *(_DWORD *)(v18 + 4 * v16) = v31;
      v30 = v21 >= v27;
      v21 -= v27;
      if (!v30)
        goto LABEL_22;
    }
    else
    {
      ++v16;
      *(_DWORD *)(v18 + 4 * v16) = v22;
    }
  }
  while (v16 != 6);
  if (v20 < v21)
    goto LABEL_22;
  v32 = v20 - v21 + 48;
  *(_QWORD *)a15 = v32;
  *(_DWORD *)a16 = bswap32(v32);
  *(int8x16_t *)(a16 + 4) = vrev32q_s8(*(int8x16_t *)(a16 + 4));
  for (i = 20; i != 48; i += 4)
    *(_DWORD *)(a16 + i) = bswap32(*(_DWORD *)(a16 + i));
  return v17;
}

uint64_t sub_20D68C388(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t *a7)
{
  void *v10;
  unint64_t v11;
  uint64_t v12;

  v10 = malloc_type_malloc(0x10uLL, 0x44F5BC83uLL);
  ccpbkdf2_hmac();
  v11 = *a7;
  if (v11 < sub_20D68B9EC(a1, a5))
  {
    v12 = 0xFFFFFFFFLL;
    if (!v10)
      return v12;
    goto LABEL_5;
  }
  sub_20D68BA1C(a1);
  v12 = 0;
  if (v10)
  {
LABEL_5:
    cc_clear();
    free(v10);
  }
  return v12;
}

uint64_t sub_20D68C47C(uint64_t result, int a2, int a3, int a4, size_t a5, uint64_t a6, size_t *a7, void *__dst)
{
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  size_t v16;
  size_t v17;

  if (!(a5 % *(_QWORD *)(*(_QWORD *)(result + 16) + 8)))
  {
    v13 = result;
    v14 = malloc_type_malloc(0x10uLL, 0xD464C02AuLL);
    ccpbkdf2_hmac();
    v15 = malloc_type_malloc(a5, 0xBA1B82CEuLL);
    v16 = sub_20D68BB60(v13);
    if (v16 <= *a7)
    {
      v17 = v16;
      memcpy(__dst, v15, v16);
      v12 = 0;
      *a7 = v17;
      if (!v15)
        goto LABEL_13;
    }
    else
    {
      v12 = 0xFFFFFFFFLL;
      if (!v15)
      {
LABEL_13:
        if (v14)
        {
          cc_clear();
          free(v14);
        }
        return v12;
      }
    }
    cc_clear();
    free(v15);
    goto LABEL_13;
  }
  if (a5 < 5 || *(_BYTE *)a6)
    return 0xFFFFFFFFLL;
  v11 = bswap32(*(_DWORD *)(a6 + 1));
  if (v11 < 0xFFFFFFFB)
  {
    if ((v11 + 5) <= a5 && *a7 >= v11)
    {
      *a7 = v11;
      memcpy(__dst, (const void *)(a6 + 5), v11);
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  __break(0x5500u);
  return result;
}

unint64_t sub_20D68C614(uint64_t a1, int a2, int a3, uint64_t a4, unsigned int *a5, size_t *a6, void *a7, size_t *a8, void *a9, size_t *a10, void *a11)
{
  unsigned int *v11;
  size_t v12;
  size_t v19;
  size_t v20;
  void *v21;
  unsigned int *v22;
  size_t v23;
  unsigned int *v24;
  size_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int8x16_t *v29;
  unint64_t result;
  unsigned int *v31;
  size_t v32;
  unint64_t v33;
  unsigned __int32 v34;
  unsigned __int32 v35;
  size_t v36;
  void *v37;
  void *v38;
  int8x16_t *v39;
  void *v40;
  void *v41;
  void *__dst;
  uint64_t v44;
  size_t v45;
  size_t v46;

  v45 = 0;
  v46 = 64;
  v11 = a5 + 11;
  v12 = *(unsigned int *)((char *)a5 + a5[9] + 44);
  if (v12 > 0x10000)
    return 0xFFFFFFFFLL;
  v19 = *(unsigned int *)((char *)v11 + a5[7]);
  v20 = *(unsigned int *)((char *)v11 + a5[8]);
  if (ccsrp_sizeof_M_HAMK() != v19 || *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8) != v20)
    return 0xFFFFFFFFLL;
  v38 = a7;
  v39 = (int8x16_t *)malloc_type_malloc(v12, 0x6F7FB0F1uLL);
  v40 = malloc_type_malloc(v12, 0xE57D1039uLL);
  v21 = malloc_type_malloc(v19, 0x9CB52928uLL);
  v41 = v21;
  __dst = malloc_type_malloc(v20, 0x86ADF1B3uLL);
  v22 = (unsigned int *)((char *)v11 + a5[7]);
  v23 = *v22;
  if (v19 < v23
    || (memcpy(v21, v22 + 1, v23),
        v24 = (unsigned int *)((char *)v11 + a5[8]),
        v25 = *v24,
        v20 < v25))
  {
    v26 = 0;
    v27 = 0xFFFFFFFFLL;
    v29 = v39;
    v28 = v40;
LABEL_7:
    if (v28)
    {
      cc_clear();
      free(v28);
    }
    if (v29)
    {
      cc_clear();
      free(v29);
    }
    if (v26)
    {
      cc_clear();
      free(v26);
    }
    if (v41)
    {
      cc_clear();
      free(v41);
    }
    if (__dst)
    {
      cc_clear();
      free(__dst);
    }
    return v27;
  }
  memcpy(__dst, v24 + 1, v25);
  v31 = (unsigned int *)((char *)v11 + a5[9]);
  v32 = *v31;
  v29 = v39;
  if (v12 < v32)
  {
    v26 = 0;
    v27 = 0xFFFFFFFFLL;
    v28 = v40;
    goto LABEL_7;
  }
  v28 = v40;
  memcpy(v40, v31 + 1, v32);
  if (!ccsrp_client_verify_session())
  {
    v26 = 0;
    v27 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  result = MEMORY[0x212BA694C](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
  if (result >> 62)
  {
    __break(0x550Cu);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  ccsrp_get_session_key_length();
  v33 = sub_20D68BB60(a1);
  result = sub_20D68C9C0(v33, v39);
  if (!(_DWORD)result)
  {
LABEL_29:
    v26 = 0;
    v27 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  v44 = 0;
  if (v12 < 0x24 || (v12 & 0xFFFFFFFC) == 0x24 || (v12 & 0x1FFFC) == 0x20)
    goto LABEL_38;
  v35 = v39[2].u32[0];
  v34 = v39[2].u32[1];
  v36 = v34 - v35;
  if (v34 >= v35)
  {
    v45 = v34 - v35;
    if (v36 <= 0x10000)
    {
      v37 = malloc_type_malloc(0x40uLL, 0xC53D78F5uLL);
      v26 = malloc_type_malloc(v36, 0xA4CD55CDuLL);
      if (sub_20D68CAE4((unsigned int *)v39, &v46, v37, &v44, &v45, v26, a8, a9, a10, a11))
        v27 = sub_20D68C47C(a1, a2, a3, (int)v37, v45, (uint64_t)v26, a6, v38);
      else
        v27 = 0xFFFFFFFFLL;
      v28 = v40;
      if (v37)
      {
        cc_clear();
        free(v37);
      }
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_39:
  __break(0x5515u);
  return result;
}

BOOL sub_20D68C9C0(unint64_t a1, int8x16_t *a2)
{
  _BOOL8 result;
  unsigned int v3;
  uint64_t v4;
  int8x16_t v5;
  uint64_t v6;
  unsigned __int32 v7;
  unsigned __int32 v8;
  unsigned __int32 v10;
  BOOL v11;
  uint64_t v12;
  int8x16_t *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;

  if (a1 < 0x30)
    return 0;
  v3 = a1;
  v4 = 0;
  v5 = vrev32q_s8(*a2);
  *a2 = v5;
  a2[1].i32[0] = bswap32(a2[1].u32[0]);
  do
  {
    a2[1].i32[v4 + 1] = bswap32(a2[1].u32[v4 + 1]);
    ++v4;
  }
  while (v4 != 7);
  result = 0;
  if (v3 >= 0x30 && v5.i32[0] == v3)
  {
    v6 = 0;
    v7 = 0;
    v8 = v5.i32[0] - 48;
    while (a2[1].i32[v6 + 1] == v7 && (a2[1].i32[v6 + 1] & 3) == 0)
    {
      v10 = a2[1].u32[v6 + 2];
      if (v10 < v7)
        break;
      result = 0;
      if (v7 > v8 || v10 > v8)
        return result;
      v11 = __CFADD__(v7, v10 - v7);
      v7 = a2[1].u32[v6 + 2];
      if (v11)
      {
LABEL_30:
        __break(0x5500u);
LABEL_31:
        __break(0x5515u);
        return result;
      }
      if (++v6 == 6)
      {
        if (v10 != v8)
          return 0;
        v12 = 0;
        v13 = a2 + 3;
        do
        {
          result = v12 == 6;
          if (v12 == 6)
            break;
          v14 = a2[1].u32[v12 + 1];
          v15 = a2[1].u32[v12 + 2];
          v16 = v15 - v14;
          if (v15 < v14)
            goto LABEL_31;
          v11 = v16 >= 4;
          v17 = v16 - 4;
          if (!v11)
            break;
          v18 = bswap32(*(unsigned __int32 *)((char *)v13->u32 + v14));
          *(__int32 *)((char *)v13->i32 + v14) = v18;
          if (v18 >= 0xFFFFFFFD)
            goto LABEL_30;
          v19 = (v18 + 3) & 0xFFFFFFFC;
          ++v12;
        }
        while (v19 >= v18 && v19 == v17);
        return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_20D68CAE4(unsigned int *a1, size_t *a2, void *__dst, _QWORD *a4, size_t *a5, void *a6, size_t *a7, void *a8, size_t *a9, void *__dsta)
{
  unsigned int *v10;
  unsigned int *v11;
  size_t v12;
  unsigned int *v18;
  size_t v19;
  unsigned int *v20;
  size_t v21;
  unsigned int *v22;
  size_t v23;

  *a4 = a1[3];
  v10 = a1 + 12;
  v11 = (unsigned int *)((char *)a1 + a1[6] + 48);
  v12 = *v11;
  if (*a2 < v12)
    return 0;
  *a2 = v12;
  memcpy(__dst, v11 + 1, v12);
  v18 = (unsigned int *)((char *)v10 + a1[8]);
  v19 = *v18;
  if (*a5 < v19)
    return 0;
  *a5 = v19;
  memcpy(a6, v18 + 1, v19);
  v20 = (unsigned int *)((char *)v10 + a1[9]);
  v21 = *v20;
  if (*a7 < v21)
    return 0;
  *a7 = v21;
  memcpy(a8, v20 + 1, v21);
  v22 = (unsigned int *)((char *)v10 + a1[10]);
  v23 = *v22;
  if (*a9 < v23)
    return 0;
  *a9 = v23;
  memcpy(__dsta, v22 + 1, v23);
  return 1;
}

unint64_t sub_20D68CBE0(uint64_t a1, int a2, int a3, int a4, unsigned int *a5, unint64_t a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int *v19;
  size_t v20;
  size_t v21;
  size_t v22;
  void *v25;
  unsigned int *v26;
  size_t v27;
  void *v28;
  unint64_t result;
  unsigned int *v30;
  unsigned int *v31;
  size_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *__dst;

  v16 = a5[14];
  v15 = a5[15];
  v17 = v15 - v16;
  if (v15 < v16)
    goto LABEL_37;
  v19 = a5 + 16;
  v20 = *(unsigned int *)((char *)a5 + a5[13] + 64);
  v21 = *(unsigned int *)((char *)a5 + a5[11] + 64);
  v22 = *(unsigned int *)((char *)a5 + a5[12] + 64);
  if (v20 > 0x10000
    || ccsrp_sizeof_M_HAMK() != v21
    || *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8) != v22
    || v17 > 0x100)
  {
    return 0xFFFFFFFFLL;
  }
  v46 = malloc_type_malloc(v20, 0xA07904E7uLL);
  v47 = malloc_type_malloc(v20, 0x9A086BB5uLL);
  v25 = malloc_type_malloc(v21, 0xF490ABE6uLL);
  __dst = malloc_type_malloc(v22, 0x14A4F6F7uLL);
  v26 = (unsigned int *)((char *)v19 + a5[11]);
  v27 = *v26;
  if (v21 < v27)
  {
    v28 = __dst;
    goto LABEL_12;
  }
  memcpy(v25, v26 + 1, v27);
  v30 = (unsigned int *)((char *)v19 + a5[12]);
  if (v22 < *v30
    || (memcpy(__dst, v30 + 1, *v30),
        v31 = (unsigned int *)((char *)v19 + a5[13]),
        v32 = *v31,
        v20 < v32))
  {
    v28 = __dst;
LABEL_12:
    v33 = v46;
    v34 = v47;
    if (!v47)
    {
LABEL_14:
      if (v33)
      {
        cc_clear();
        free(v33);
      }
      if (v25)
      {
        cc_clear();
        free(v25);
      }
      if (v28)
      {
        cc_clear();
        free(v28);
      }
      return 0xFFFFFFFFLL;
    }
LABEL_13:
    cc_clear();
    free(v34);
    goto LABEL_14;
  }
  memcpy(v47, v31 + 1, v32);
  if (!ccsrp_client_verify_session())
    goto LABEL_34;
  result = ccrsa_import_pub_n();
  if (!result)
    goto LABEL_34;
  v35 = result;
  if (result >> 61)
    goto LABEL_38;
  if (8 * result >= 0xFFFFFFFFFFFFFFF8)
    goto LABEL_39;
  v36 = (8 * result + 7) & 0xFFFFFFFFFFFFFFF8;
  if (!is_mul_ok(v36, 3uLL))
  {
LABEL_38:
    __break(0x550Cu);
    goto LABEL_39;
  }
  v37 = 3 * v36;
  v38 = v37 + 40;
  if (v37 >= 0xFFFFFFFFFFFFFFD8)
    goto LABEL_39;
  result = (unint64_t)malloc_type_malloc(v37 + 40, 0x9D32CC24uLL);
  if (v38)
  {
    v39 = (_QWORD *)result;
    *(_QWORD *)result = v35;
    ccrsa_import_pub();
    if (a6 >= v17)
    {
      ccsha256_di();
      ccdigest();
      result = ccrsa_verify_pkcs1v15();
      if (!(*v39 >> 61))
      {
        v40 = 8 * *v39;
        v41 = __CFADD__(v40, 8);
        v42 = v40 + 8;
        if (!v41)
        {
          v43 = (v42 - 1) & 0xFFFFFFFFFFFFFFF8;
          if (is_mul_ok(v43, 3uLL))
          {
            v44 = result;
            v45 = 3 * v43;
            result = v45 + 40;
            if (v45 < 0xFFFFFFFFFFFFFFD8)
            {
              cc_clear();
              free(v39);
              if (!v44)
              {
                v28 = __dst;
                v33 = v46;
                goto LABEL_35;
              }
LABEL_34:
              v28 = __dst;
              v33 = v46;
LABEL_35:
              v34 = v47;
              if (!v47)
                goto LABEL_14;
              goto LABEL_13;
            }
            goto LABEL_39;
          }
          goto LABEL_38;
        }
LABEL_39:
        __break(0x5500u);
        goto LABEL_40;
      }
      goto LABEL_38;
    }
LABEL_37:
    __break(0x5515u);
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_20D68D154(unint64_t result, int a2, int a3, uint64_t a4, unsigned int *a5, size_t *a6, void *a7, size_t *a8, void *a9, size_t *a10, void *a11)
{
  unsigned int *v11;
  size_t v12;
  size_t v14;
  size_t v15;
  uint64_t v20;
  void *v21;
  unsigned int *v22;
  size_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned int *v27;
  unsigned int *v28;
  unint64_t v29;
  void *v30;
  unsigned __int32 v31;
  unsigned __int32 v32;
  size_t v33;
  void *v34;
  void *v35;
  void *v36;
  int8x16_t *v37;
  void *v38;
  void *__dst;
  size_t size;
  uint64_t v42;
  size_t v43;
  size_t v44;

  v11 = a5 + 15;
  v12 = *(unsigned int *)((char *)a5 + a5[13] + 60);
  if (v12 < 0x10)
    goto LABEL_46;
  v14 = *(unsigned int *)((char *)v11 + a5[11]);
  v15 = *(unsigned int *)((char *)v11 + a5[12]);
  v43 = 0;
  v44 = 0;
  if (v12 > 0x10000)
    return 0xFFFFFFFFLL;
  v20 = result;
  size = v12 - 16;
  if (ccsrp_sizeof_M_HAMK() != v14 || *(_QWORD *)(*(_QWORD *)(v20 + 16) + 8) != v15)
    return 0xFFFFFFFFLL;
  v36 = a7;
  v37 = (int8x16_t *)malloc_type_malloc(size, 0x33FCE9BDuLL);
  v38 = malloc_type_malloc(v12, 0xE2B6800DuLL);
  v21 = malloc_type_malloc(v14, 0x7526E88CuLL);
  __dst = malloc_type_malloc(v15, 0x5DAEE1B3uLL);
  v22 = (unsigned int *)((char *)v11 + a5[11]);
  v23 = *v22;
  if (v14 < v23)
  {
    v24 = 0;
    v25 = 0xFFFFFFFFLL;
    v26 = __dst;
    goto LABEL_14;
  }
  memcpy(v21, v22 + 1, v23);
  v27 = (unsigned int *)((char *)v11 + a5[12]);
  if (v15 < *v27)
  {
    v24 = 0;
    v25 = 0xFFFFFFFFLL;
LABEL_13:
    v26 = __dst;
    goto LABEL_14;
  }
  memcpy(__dst, v27 + 1, *v27);
  v28 = (unsigned int *)((char *)v11 + a5[13]);
  v29 = *v28;
  if (v12 < v29)
  {
    v24 = 0;
    v25 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  v30 = v38;
  memcpy(v38, v28 + 1, *v28);
  if (!ccsrp_client_verify_session())
  {
    v24 = 0;
    v25 = 0xFFFFFFFFLL;
    v26 = __dst;
    goto LABEL_30;
  }
  result = MEMORY[0x212BA694C](*(_QWORD *)(*(_QWORD *)(v20 + 48) + 8));
  v26 = __dst;
  if (result >> 62)
    goto LABEL_47;
  result = ccsrp_get_session_key_length();
  if (v29 < 0x10)
  {
LABEL_46:
    __break(0x5515u);
LABEL_47:
    __break(0x550Cu);
    goto LABEL_48;
  }
  if (ccgcm_one_shot())
  {
    v24 = 0;
    v25 = 0xFFFFFFFFLL;
    goto LABEL_14;
  }
  result = sub_20D68C9C0(size, v37);
  if (!(_DWORD)result)
  {
    v24 = 0;
    v25 = 0xFFFFFFFFLL;
    goto LABEL_14;
  }
  v44 = 64;
  v42 = 0;
  if (size >= 0x24 && (size & 0xFFFFFFFFFFFFFFFCLL) != 0x24 && (size & 0xFFFFFFFFFFFFFFFCLL) != 0x20)
  {
    v32 = v37[2].u32[0];
    v31 = v37[2].u32[1];
    v33 = v31 - v32;
    v30 = v38;
    if (v31 >= v32)
    {
      v43 = v31 - v32;
      if (v33 > 0x10000)
      {
        v24 = 0;
        v25 = 0xFFFFFFFFLL;
LABEL_30:
        if (!v30)
          goto LABEL_16;
        goto LABEL_15;
      }
      v34 = malloc_type_malloc(0x40uLL, 0x2706A3B2uLL);
      v35 = malloc_type_malloc(v33, 0x1F223E76uLL);
      if (sub_20D68CAE4((unsigned int *)v37, &v44, v34, &v42, &v43, v35, a8, a9, a10, a11))
        v25 = sub_20D68C47C(v20, a2, a3, (int)v34, v43, (uint64_t)v35, a6, v36);
      else
        v25 = 0xFFFFFFFFLL;
      v24 = v35;
      v26 = __dst;
      if (v34)
      {
        cc_clear();
        free(v34);
      }
LABEL_14:
      v30 = v38;
      if (!v38)
      {
LABEL_16:
        if (v37)
        {
          cc_clear();
          free(v37);
        }
        if (v24)
        {
          cc_clear();
          free(v24);
        }
        if (v21)
        {
          cc_clear();
          free(v21);
        }
        if (v26)
        {
          cc_clear();
          free(v26);
        }
        return v25;
      }
LABEL_15:
      cc_clear();
      free(v30);
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_48:
  __break(1u);
  return result;
}

unint64_t sub_20D68D59C(unint64_t result, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  if (result < 0xFFFFFFFD
    && a2 < 0xFFFFFFFD
    && a3 < 0xFFFFFFFD
    && a4 < 0xFFFFFFFD
    && a5 < 0xFFFFFFFD
    && a6 < 0xFFFFFFFD)
  {
    return (((_DWORD)result + 3) & 0xFFFFFFFC)
         + (unint64_t)((a2 + 3) & 0xFFFFFFFC)
         + ((a3 + 3) & 0xFFFFFFFC)
         + (unint64_t)((a4 + 3) & 0xFFFFFFFC)
         + ((a5 + 3) & 0xFFFFFFFC)
         + (unint64_t)((a6 + 3) & 0xFFFFFFFC)
         + 72;
  }
  __break(0x5500u);
  return result;
}

unint64_t sub_20D68D604(unint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t result;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v24;

  v10 = sub_20D68B434(a1);
  v11 = sub_20D68D59C(a2, a4, a5, 0x40u, v10, a3);
  v12 = sub_20D68B9EC(a1, v11);
  result = ccrsa_import_pub_n();
  if (result)
  {
    v14 = result;
    if (!(result >> 61))
    {
      if (8 * result >= 0xFFFFFFFFFFFFFFF8)
        goto LABEL_14;
      v15 = (8 * result + 7) & 0xFFFFFFFFFFFFFFF8;
      if (is_mul_ok(v15, 3uLL))
      {
        v16 = 3 * v15;
        v17 = v16 + 40;
        if (v16 >= 0xFFFFFFFFFFFFFFD8)
          goto LABEL_14;
        result = (unint64_t)malloc_type_malloc(v16 + 40, 0xDABB50C8uLL);
        if (!v17)
        {
LABEL_15:
          __break(1u);
          return result;
        }
        v18 = (_QWORD *)result;
        *(_QWORD *)result = v14;
        ccrsa_import_pub();
        result = ccrsa_block_size();
        if (!(*v18 >> 61))
        {
          v19 = 8 * *v18;
          v20 = __CFADD__(v19, 8);
          v21 = v19 + 8;
          if (!v20)
          {
            v22 = (v21 - 1) & 0xFFFFFFFFFFFFFFF8;
            if (is_mul_ok(v22, 3uLL))
            {
              v23 = result;
              v24 = 3 * v22;
              result = v24 + 40;
              if (v24 < 0xFFFFFFFFFFFFFFD8)
              {
                cc_clear();
                free(v18);
                return sub_20D68F0E4(v12, **(_QWORD **)(a1 + 8), *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8), v23, **(_QWORD **)(a1 + 8), **(_QWORD **)(a1 + 8));
              }
              goto LABEL_14;
            }
            goto LABEL_13;
          }
LABEL_14:
          __break(0x5500u);
          goto LABEL_15;
        }
      }
    }
LABEL_13:
    __break(0x550Cu);
    goto LABEL_14;
  }
  return result;
}

unint64_t sub_20D68D78C(unint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, unsigned int a5)
{
  unsigned int v9;

  v9 = sub_20D68B9EC(a1, a3);
  return sub_20D68D604(a1, a2, v9, a4, a5);
}

uint64_t sub_20D68D7F0(unint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, uint64_t a11, _QWORD *a12, int a13, uint64_t a14, uint64_t a15)
{
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  size_t v24;
  size_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  size_t v33;
  void *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int *v44;
  const void *v45;
  size_t v46;
  unsigned int v47;
  unsigned int v48;
  _DWORD *v49;
  int v50;
  BOOL v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *__src;
  void *v61;
  void *v63;
  void *v64;
  unint64_t v65;
  _QWORD v66[12];

  v66[10] = *MEMORY[0x24BDAC8D0];
  v20 = sub_20D68B434(a1);
  v65 = sub_20D68D59C(a2, a6, a9, 0x40u, v20, a4);
  v21 = malloc_type_malloc(v65, 0xCB2D9E92uLL);
  v22 = sub_20D68B434(a1);
  v64 = v21;
  v23 = (void *)sub_20D68C194(a2, a3, a6, a7, a9, a10, 0x40u, a8, v22, a11, a13, 0, a4, a5, (unsigned int *)&v65, (uint64_t)v21);
  if (!v23)
  {
    v61 = 0;
    v63 = 0;
    __src = 0;
    v27 = 0;
    goto LABEL_5;
  }
  v24 = sub_20D68B9EC(a1, v65);
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v26 = ccrsa_block_size();
  v27 = malloc_type_malloc(v24, 0x6EFFC448uLL);
  v28 = malloc_type_malloc(v25, 0x4E98AB76uLL);
  v29 = malloc_type_malloc(v26, 0x8912AC10uLL);
  v30 = malloc_type_malloc(**(_QWORD **)(a1 + 8), 0xA920CADBuLL);
  (**(void (***)(void))a1)();
  __src = v28;
  v61 = v30;
  v63 = v29;
  if (sub_20D68BCA4(a1, a12, v65, (uint64_t)v23, (uint64_t)v28, (uint64_t)v29))
  {
    v23 = 0;
LABEL_5:
    v31 = 0xFFFFFFFFLL;
    goto LABEL_6;
  }
  ccdigest();
  v23 = malloc_type_malloc(**(_QWORD **)(a1 + 8), 0xA111B768uLL);
  v33 = MEMORY[0x212BA6A18](a12);
  v34 = malloc_type_malloc(v33, 0x3FD7E97AuLL);
  ccrsa_export_pub();
  v57 = v34;
  ccdigest();
  v35 = sub_20D68F0E4(v24, **(_QWORD **)(a1 + 8), v25, v26, **(_QWORD **)(a1 + 8), **(_QWORD **)(a1 + 8));
  if (__CFADD__(v25, v24))
    goto LABEL_43;
  v36 = v35;
  v37 = **(_DWORD **)(a1 + 8);
  v38 = (char *)malloc_type_malloc(v25 + v24, 0x65D2B1C3uLL);
  memcpy(v38, __src, v25);
  v56 = v27;
  memcpy(&v38[v25], v27, v24);
  v39 = 0;
  *(_OWORD *)a14 = xmmword_20D698810;
  *(_QWORD *)(a14 + 16) = 0xA00000000;
  v66[0] = v37;
  v66[1] = v61;
  v55 = v38;
  v66[2] = (v25 + v24);
  v66[3] = v38;
  v66[4] = v26;
  v66[5] = v63;
  v66[6] = v37;
  v66[7] = v23;
  v66[8] = v37;
  v66[9] = a15;
  *(_DWORD *)(a14 + 24) = 0;
  v40 = a14 + 24;
  v41 = a14 + 48;
  v42 = v36;
  do
  {
    if (((16 * v39) | 8uLL) > 0x50 || (unint64_t)(16 * v39) > 0x4F)
    {
      __break(1u);
LABEL_43:
      __break(0x5500u);
LABEL_44:
      __break(0x5515u);
    }
    v43 = *(unsigned int *)(v40 + 4 * v39);
    v44 = (unsigned int *)&v66[2 * v39];
    v45 = (const void *)*((_QWORD *)v44 + 1);
    if (v45)
    {
      v46 = *v44;
      if (v46 >= 0xFFFFFFFD)
        goto LABEL_43;
      v47 = (v46 + 3) & 0xFFFFFFFC;
      if (v47 < v46)
        goto LABEL_38;
      v48 = v47 + 4;
      if (v47 >= 0xFFFFFFFC)
        goto LABEL_43;
      if (v47 + 3 >= v42)
      {
LABEL_38:
        v31 = 0xFFFFFFFFLL;
        v27 = v56;
        v54 = v55;
        if (v55)
          goto LABEL_39;
        goto LABEL_40;
      }
      v49 = (_DWORD *)(v41 + v43);
      *(_DWORD *)(v41 + v43) = v46;
      memcpy((void *)(v41 + v43 + 4), v45, v46);
      *v49 = bswap32(v46);
      v50 = *(_DWORD *)(v40 + 4 * v39);
      v51 = __CFADD__(v48, v50);
      v52 = v48 + v50;
      if (v51)
        goto LABEL_43;
      ++v39;
      *(_DWORD *)(v40 + 4 * v39) = v52;
      v51 = v42 >= v48;
      v42 -= v48;
      if (!v51)
        goto LABEL_44;
    }
    else
    {
      ++v39;
      *(_DWORD *)(v40 + 4 * v39) = v43;
    }
  }
  while (v39 != 5);
  if (v36 < v42)
    goto LABEL_44;
  v53 = 0;
  *(_DWORD *)a14 = bswap32(v36 - v42 + 48);
  *(int8x16_t *)(a14 + 4) = vrev32q_s8(*(int8x16_t *)(a14 + 4));
  *(_DWORD *)(a14 + 20) = bswap32(*(_DWORD *)(a14 + 20));
  v27 = v56;
  v54 = v55;
  do
  {
    *(_DWORD *)(a14 + 24 + v53) = bswap32(*(_DWORD *)(a14 + 24 + v53));
    v53 += 4;
  }
  while (v53 != 24);
  v31 = 0;
  if (v55)
  {
LABEL_39:
    cc_clear();
    free(v54);
  }
LABEL_40:
  if (v57)
  {
    cc_clear();
    free(v57);
  }
LABEL_6:
  if (v23)
  {
    cc_clear();
    free(v23);
  }
  if (v61)
  {
    cc_clear();
    free(v61);
  }
  if (v63)
  {
    cc_clear();
    free(v63);
  }
  if (__src)
  {
    cc_clear();
    free(__src);
  }
  if (v27)
  {
    cc_clear();
    free(v27);
  }
  if (v64)
  {
    cc_clear();
    free(v64);
  }
  return v31;
}

uint64_t sub_20D68DD58(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, _QWORD *a12, uint64_t a13, uint64_t a14)
{
  void *v19;
  size_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v19 = malloc_type_malloc(0x40uLL, 0x79434952uLL);
  v20 = sub_20D68B434(a1);
  v21 = malloc_type_malloc(v20, 0x62E034ADuLL);
  ccsrp_generate_salt_and_verification();
  sub_20D68B434(a1);
  v22 = sub_20D68DEA8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, v24, (uint64_t)v19, v25, (uint64_t)v21, a12, 10000, a13, a14);
  sub_20D68B434(a1);
  if (v21)
  {
    cc_clear();
    free(v21);
  }
  if (v19)
  {
    cc_clear();
    free(v19);
  }
  return v22;
}

uint64_t sub_20D68DEA8(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16, int a17, uint64_t a18, uint64_t a19)
{
  void *v27;
  uint64_t v28;
  unint64_t v30;

  v30 = sub_20D68B9EC(a1, a6);
  v27 = malloc_type_malloc(v30, 0x96FEFA4uLL);
  if (!sub_20D68C388(a1, a4, a5, a13, a6, a7, &v30))
  {
    v28 = sub_20D68D7F0(a1, a2, a3, v30, (uint64_t)v27, a8, a9, a13, a10, a11, a15, a16, a17, a18, a19);
    if (!v27)
      return v28;
    goto LABEL_3;
  }
  v28 = 0xFFFFFFFFLL;
  if (v27)
  {
LABEL_3:
    cc_clear();
    free(v27);
  }
  return v28;
}

uint64_t sub_20D68DFC8()
{
  return ccsrp_server_start_authentication();
}

uint64_t sub_20D68DFF0()
{
  return ccsrp_server_verify_session();
}

uint64_t sub_20D68E008(unint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, uint64_t a7, _DWORD *a8, uint64_t a9)
{
  size_t v12;
  void *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int *v21;
  const void *v22;
  size_t v23;
  unsigned int v24;
  unsigned int v25;
  _DWORD *v26;
  int v27;
  BOOL v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v33;
  unsigned int v34;
  void *v37;
  _QWORD v38[8];

  v38[7] = *MEMORY[0x24BDAC8D0];
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v13 = malloc_type_malloc(v12, 0x889ACA9CuLL);
  (**(void (***)(void))a1)();
  v14 = sub_20D68B9EC(a1, a6);
  v15 = malloc_type_malloc(v14, 0x3758D87FuLL);
  sub_20D68BA1C(a1);
  v16 = 0;
  *(_QWORD *)(a9 + 4) = 164;
  v38[0] = a4;
  v38[1] = a5;
  v38[2] = v12;
  v38[3] = v13;
  v38[4] = v14;
  v37 = v15;
  v38[5] = v15;
  v17 = a9 + 44;
  *(_DWORD *)(a9 + 28) = 0;
  v18 = a9 + 28;
  v33 = a8;
  v19 = *a8;
  v34 = *a8;
  while (1)
  {
    if (((16 * v16) | 8uLL) > 0x30 || (unint64_t)(16 * v16) > 0x2F)
    {
      __break(1u);
LABEL_23:
      __break(0x5500u);
      goto LABEL_24;
    }
    v20 = *(unsigned int *)(v18 + 4 * v16);
    v21 = (unsigned int *)&v38[2 * v16];
    v22 = (const void *)*((_QWORD *)v21 + 1);
    if (v22)
      break;
    ++v16;
    *(_DWORD *)(v18 + 4 * v16) = v20;
LABEL_13:
    if (v16 == 3)
    {
      if (v34 >= v19)
      {
        v30 = 0;
        v31 = v34 - v19 + 44;
        *v33 = v31;
        *(_DWORD *)a9 = bswap32(v31);
        *(int8x8_t *)(a9 + 4) = vrev32_s8(*(int8x8_t *)(a9 + 4));
        *(int8x16_t *)(a9 + 28) = vrev32q_s8(*(int8x16_t *)(a9 + 28));
        goto LABEL_17;
      }
LABEL_24:
      __break(0x5515u);
    }
  }
  v23 = *v21;
  if (v23 >= 0xFFFFFFFD)
    goto LABEL_23;
  v24 = (v23 + 3) & 0xFFFFFFFC;
  if (v24 >= v23)
  {
    v25 = v24 + 4;
    if (v24 >= 0xFFFFFFFC)
      goto LABEL_23;
    if (v24 + 3 < v19)
    {
      v26 = (_DWORD *)(v17 + v20);
      *(_DWORD *)(v17 + v20) = v23;
      memcpy((void *)(v17 + v20 + 4), v22, v23);
      *v26 = bswap32(v23);
      v27 = *(_DWORD *)(v18 + 4 * v16);
      v28 = __CFADD__(v25, v27);
      v29 = v25 + v27;
      if (v28)
        goto LABEL_23;
      ++v16;
      *(_DWORD *)(v18 + 4 * v16) = v29;
      v28 = v19 >= v25;
      v19 -= v25;
      if (!v28)
        goto LABEL_24;
      goto LABEL_13;
    }
  }
  v30 = 0xFFFFFFFFLL;
LABEL_17:
  if (v13)
  {
    cc_clear();
    free(v13);
  }
  if (v37)
  {
    cc_clear();
    free(v37);
  }
  return v30;
}

uint64_t sub_20D68E28C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  BOOL v5;
  int v6;

  result = ccsrp_get_session_key_length();
  v4 = *(_DWORD *)(a2 + *(unsigned int *)(a2 + 28) + 44);
  v5 = __CFADD__(v4, 3);
  v6 = v4 + 3;
  if (!v5 && result < 0xFFFFFFFD)
    return (((_DWORD)result + 3) & 0xFFFFFFFC) + (unint64_t)(v6 & 0xFFFFFFFC) + 48;
  __break(0x5500u);
  return result;
}

uint64_t sub_20D68E2E0(unint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v3;
  uint64_t v4;
  int8x16_t v5;
  uint64_t v6;
  unsigned __int32 v7;
  unsigned __int32 v8;
  unsigned __int32 v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;

  if (a1 < 0x30)
    return 1;
  v3 = a1;
  v4 = 0;
  v5 = vrev32q_s8(*(int8x16_t *)a2);
  *(int8x16_t *)a2 = v5;
  *(int8x8_t *)(a2 + 16) = vrev32_s8(*(int8x8_t *)(a2 + 16));
  do
  {
    *(_DWORD *)(a2 + 24 + v4) = bswap32(*(_DWORD *)(a2 + 24 + v4));
    v4 += 4;
  }
  while (v4 != 24);
  result = 0xFFFFFFFFLL;
  if (v3 >= 0x30 && v5.i32[0] == v3)
  {
    v6 = 0;
    v7 = 0;
    v8 = v5.i32[0] - 48;
    do
    {
      if (*(_DWORD *)(a2 + v6 + 24) != v7 || (*(_DWORD *)(a2 + v6 + 24) & 3) != 0)
        return 0xFFFFFFFFLL;
      v10 = *(_DWORD *)(a2 + v6 + 28);
      if (v10 < v7)
        return 0xFFFFFFFFLL;
      if (v7 > v8 || v10 > v8)
        return result;
      v11 = __CFADD__(v7, v10 - v7);
      v7 = *(_DWORD *)(a2 + v6 + 28);
      if (v11)
      {
LABEL_32:
        __break(0x5500u);
LABEL_33:
        __break(0x5515u);
        return result;
      }
      v6 += 4;
    }
    while (v6 != 20);
    if (v10 != v8)
      return 0xFFFFFFFFLL;
    v12 = 0;
    v13 = a2 + 48;
    result = 0xFFFFFFFFLL;
    while (v12 != 20)
    {
      v14 = *(unsigned int *)(a2 + v12 + 24);
      v15 = *(_DWORD *)(a2 + v12 + 28);
      v16 = v15 - v14;
      if (v15 < v14)
        goto LABEL_33;
      v11 = v16 >= 4;
      v17 = v16 - 4;
      if (!v11)
        return 0xFFFFFFFFLL;
      v18 = bswap32(*(_DWORD *)(v13 + v14));
      *(_DWORD *)(v13 + v14) = v18;
      if (v18 >= 0xFFFFFFFD)
        goto LABEL_32;
      v19 = (v18 + 3) & 0xFFFFFFFC;
      v12 += 4;
      if (v19 < v18 || v19 != v17)
        return result;
    }
    return 0;
  }
  return result;
}

uint64_t sub_20D68E410(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  unsigned int *v5;
  size_t v6;
  size_t v8;
  uint64_t v9;
  size_t v10;
  size_t v12;
  void *v13;
  char *v14;
  unsigned int *v15;
  size_t v16;
  void *v17;
  unsigned int *v18;
  unint64_t v19;
  uint64_t result;
  size_t v21;
  unsigned int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t __len;
  unsigned int v29;
  void *v30;
  void *__dst;

  v5 = a2 + 12;
  v6 = *(unsigned int *)((char *)a2 + a2[6] + 48);
  if (**(_QWORD **)(a1 + 8) != v6)
    return 0xFFFFFFFFLL;
  v8 = *(unsigned int *)((char *)v5 + a2[7]);
  v9 = 0xFFFFFFFFLL;
  if (v8 > 0x10000)
    return v9;
  v10 = *(unsigned int *)((char *)v5 + a2[8]);
  if (v10 > 0x10000)
    return v9;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v13 = malloc_type_malloc(v6, 0xCF5A85EBuLL);
  v14 = (char *)malloc_type_malloc(v8, 0xD5D68D2BuLL);
  __len = v12;
  __dst = malloc_type_malloc(v12, 0x3FA2A04BuLL);
  v29 = v10;
  v30 = malloc_type_malloc(v10, 0x1F3039B4uLL);
  v15 = (unsigned int *)((char *)v5 + a2[6]);
  v16 = *v15;
  if (v6 < v16)
  {
    v9 = 0xFFFFFFFFLL;
    v17 = v13;
    goto LABEL_12;
  }
  memcpy(v13, v15 + 1, v16);
  v18 = (unsigned int *)((char *)v5 + a2[7]);
  v19 = *v18;
  if (v8 < v19)
  {
LABEL_11:
    v9 = 0xFFFFFFFFLL;
    v17 = v13;
LABEL_12:
    if (!v17)
    {
LABEL_14:
      if (v14)
      {
        cc_clear();
        free(v14);
      }
      if (__dst)
      {
        cc_clear();
        free(__dst);
      }
      if (v30)
      {
        cc_clear();
        free(v30);
      }
      return v9;
    }
LABEL_13:
    cc_clear();
    free(v17);
    goto LABEL_14;
  }
  result = (uint64_t)memcpy(v14, v18 + 1, *v18);
  v21 = v19 - __len;
  if (v19 < __len)
  {
    __break(0x5515u);
  }
  else
  {
    result = (uint64_t)memmove(__dst, v14, __len);
    if (!__CFADD__(v14, __len))
    {
      memmove(v14, &v14[__len], v21);
      v22 = (unsigned int *)((char *)v5 + a2[8]);
      v23 = *v22;
      if (v29 >= v23)
      {
        memcpy(v30, v22 + 1, *v22);
        v24 = a1;
        v17 = v13;
        v25 = sub_20D68BF20(v24, a5, (uint64_t)v13, (uint64_t)__dst, v23, (uint64_t)v30, v21, (uint64_t)v14);
        if (v25 < 0)
        {
          v9 = 0xFFFFFFFFLL;
        }
        else
        {
          v9 = 0;
          *a3 = v25;
        }
        if (!v13)
          goto LABEL_14;
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  __break(0x5500u);
  return result;
}

uint64_t sub_20D68E698(unsigned int *a1, size_t *a2, void *__dst, size_t *a4, void *a5, size_t *a6, void *a7, size_t *a8, void *a9, size_t *a10, void *__dsta, _QWORD *a12, size_t *a13, void *a14)
{
  unsigned int *v14;
  unsigned int *v15;
  size_t v16;
  unsigned int *v23;
  size_t v24;
  unsigned int *v25;
  size_t v26;
  unsigned int *v27;
  size_t v28;
  unsigned int *v29;
  size_t v30;
  unsigned int *v31;
  size_t v32;

  *a12 = a1[3];
  v14 = a1 + 12;
  v15 = (unsigned int *)((char *)a1 + a1[5] + 48);
  v16 = *v15;
  if (*a2 < v16)
    return 0;
  *a2 = v16;
  memcpy(__dst, v15 + 1, v16);
  v23 = (unsigned int *)((char *)v14 + a1[9]);
  v24 = *v23;
  if (*a4 < v24)
    return 0;
  *a4 = v24;
  memcpy(a5, v23 + 1, v24);
  v25 = (unsigned int *)((char *)v14 + a1[10]);
  v26 = *v25;
  if (*a6 < v26)
    return 0;
  *a6 = v26;
  memcpy(a7, v25 + 1, v26);
  v27 = (unsigned int *)((char *)v14 + a1[6]);
  v28 = *v27;
  if (*a8 < v28)
    return 0;
  *a8 = v28;
  memcpy(a9, v27 + 1, v28);
  v29 = (unsigned int *)((char *)v14 + a1[7]);
  v30 = *v29;
  if (*a10 < v30)
    return 0;
  *a10 = v30;
  memcpy(__dsta, v29 + 1, v30);
  v31 = (unsigned int *)((char *)v14 + a1[8]);
  v32 = *v31;
  if (*a13 < v32)
    return 0;
  *a13 = v32;
  memcpy(a14, v31 + 1, v32);
  return 1;
}

uint64_t sub_20D68E7F4(uint64_t a1, _OWORD *a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int *a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int *v16;
  const void *v17;
  size_t v18;
  unsigned int v19;
  unsigned int v20;
  _DWORD *v21;
  int v22;
  BOOL v23;
  int v24;
  uint64_t v25;
  _QWORD v27[8];

  v27[7] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a10 + 4) = 164;
  if (a1 == 16)
  {
    v10 = 0;
    *(_OWORD *)(a10 + 12) = *a2;
    v27[0] = a3;
    v27[1] = a4;
    v27[2] = a5;
    v27[3] = a6;
    v27[4] = a7;
    v27[5] = a8;
    *(_DWORD *)(a10 + 28) = 0;
    v11 = a10 + 28;
    v12 = a10 + 44;
    v13 = *a9;
    v14 = *a9;
    while (((16 * v10) | 8uLL) <= 0x30 && (unint64_t)(16 * v10) <= 0x2F)
    {
      v15 = *(unsigned int *)(v11 + 4 * v10);
      v16 = (unsigned int *)&v27[2 * v10];
      v17 = (const void *)*((_QWORD *)v16 + 1);
      if (v17)
      {
        v18 = *v16;
        if (v18 >= 0xFFFFFFFD)
          goto LABEL_20;
        v19 = (v18 + 3) & 0xFFFFFFFC;
        if (v19 < v18)
          return 0;
        v20 = v19 + 4;
        if (v19 >= 0xFFFFFFFC)
          goto LABEL_20;
        if (v19 + 3 >= v14)
          return 0;
        v21 = (_DWORD *)(v12 + v15);
        *(_DWORD *)(v12 + v15) = v18;
        memcpy((void *)(v12 + v15 + 4), v17, v18);
        *v21 = bswap32(v18);
        v22 = *(_DWORD *)(v11 + 4 * v10);
        v23 = __CFADD__(v20, v22);
        v24 = v20 + v22;
        if (v23)
          goto LABEL_20;
        ++v10;
        *(_DWORD *)(v11 + 4 * v10) = v24;
        v23 = v14 >= v20;
        v14 -= v20;
        if (!v23)
          goto LABEL_21;
      }
      else
      {
        ++v10;
        *(_DWORD *)(v11 + 4 * v10) = v15;
      }
      if (v10 == 3)
      {
        if (v13 >= v14)
        {
          v25 = v13 - v14 + 44;
          *(_QWORD *)a9 = v25;
          *(_DWORD *)a10 = bswap32(v25);
          *(int8x8_t *)(a10 + 4) = vrev32_s8(*(int8x8_t *)(a10 + 4));
          *(int8x16_t *)(a10 + 28) = vrev32q_s8(*(int8x16_t *)(a10 + 28));
          return 1;
        }
LABEL_21:
        __break(0x5515u);
      }
    }
    __break(1u);
LABEL_20:
    __break(0x5500u);
    goto LABEL_21;
  }
  return 0;
}

unint64_t sub_20D68E9B4(unint64_t result, unsigned int a2, unsigned int a3)
{
  if (result < 0xFFFFFFFD && a2 < 0xFFFFFFFD && a3 < 0xFFFFFFFD)
    return (((_DWORD)result + 3) & 0xFFFFFFFC)
         + (unint64_t)((a2 + 3) & 0xFFFFFFFC)
         + ((a3 + 3) & 0xFFFFFFFC)
         + 56;
  __break(0x5500u);
  return result;
}

BOOL sub_20D68E9EC(unint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned int v3;
  int8x8_t v4;
  uint64_t v5;
  unsigned __int32 v6;
  unsigned __int32 v7;
  unsigned __int32 v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;

  if (a1 < 0x2C)
    return 0;
  v3 = a1;
  result = 0;
  v4 = vrev32_s8(*(int8x8_t *)a2);
  *(int8x8_t *)a2 = v4;
  *(_DWORD *)(a2 + 8) = bswap32(*(_DWORD *)(a2 + 8));
  *(int8x16_t *)(a2 + 28) = vrev32q_s8(*(int8x16_t *)(a2 + 28));
  if (v3 >= 0x2C && v4.i32[0] == v3)
  {
    v5 = 0;
    v6 = 0;
    v7 = v4.i32[0] - 44;
    while (*(_DWORD *)(a2 + v5 + 28) == v6 && (*(_DWORD *)(a2 + v5 + 28) & 3) == 0)
    {
      v9 = *(_DWORD *)(a2 + v5 + 32);
      if (v9 < v6)
        break;
      result = 0;
      if (v6 > v7 || v9 > v7)
        return result;
      v10 = __CFADD__(v6, v9 - v6);
      v6 = *(_DWORD *)(a2 + v5 + 32);
      if (v10)
      {
LABEL_28:
        __break(0x5500u);
LABEL_29:
        __break(0x5515u);
        return result;
      }
      v5 += 4;
      if (v5 == 12)
      {
        if (v9 != v7)
          return 0;
        v11 = 0;
        v12 = a2 + 44;
        do
        {
          result = v11 == 12;
          if (v11 == 12)
            break;
          v13 = *(unsigned int *)(a2 + v11 + 28);
          v14 = *(_DWORD *)(a2 + v11 + 32);
          v15 = v14 - v13;
          if (v14 < v13)
            goto LABEL_29;
          v10 = v15 >= 4;
          v16 = v15 - 4;
          if (!v10)
            break;
          v17 = bswap32(*(_DWORD *)(v12 + v13));
          *(_DWORD *)(v12 + v13) = v17;
          if (v17 >= 0xFFFFFFFD)
            goto LABEL_28;
          v18 = (v17 + 3) & 0xFFFFFFFC;
          v11 += 4;
        }
        while (v18 >= v17 && v18 == v16);
        return result;
      }
    }
    return 0;
  }
  return result;
}

BOOL sub_20D68EAFC(unint64_t a1, int8x8_t *a2)
{
  _BOOL8 result;
  unsigned int v3;
  uint64_t v4;
  int8x8_t v5;
  uint64_t v6;
  unsigned __int32 v7;
  unsigned __int32 v8;
  unsigned __int32 v10;
  BOOL v11;
  uint64_t v12;
  int8x8_t *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;

  if (a1 < 0x28)
    return 0;
  v3 = a1;
  v4 = 0;
  v5 = vrev32_s8(*a2);
  *a2 = v5;
  a2[1].i32[0] = bswap32(a2[1].u32[0]);
  do
  {
    a2[3].i32[v4 + 1] = bswap32(a2[3].u32[v4 + 1]);
    ++v4;
  }
  while (v4 != 3);
  result = 0;
  if (v3 >= 0x28 && v5.i32[0] == v3)
  {
    v6 = 0;
    v7 = 0;
    v8 = v5.i32[0] - 40;
    while (a2[3].i32[v6 + 1] == v7 && (a2[3].i32[v6 + 1] & 3) == 0)
    {
      v10 = a2[4].u32[v6];
      if (v10 < v7)
        break;
      result = 0;
      if (v7 > v8 || v10 > v8)
        return result;
      v11 = __CFADD__(v7, v10 - v7);
      v7 = a2[4].u32[v6];
      if (v11)
      {
LABEL_30:
        __break(0x5500u);
LABEL_31:
        __break(0x5515u);
        return result;
      }
      if (++v6 == 2)
      {
        if (v10 != v8)
          return 0;
        v12 = 0;
        v13 = a2 + 5;
        do
        {
          result = v12 == 2;
          if (v12 == 2)
            break;
          v14 = a2[3].u32[v12 + 1];
          v15 = a2[4].u32[v12];
          v16 = v15 - v14;
          if (v15 < v14)
            goto LABEL_31;
          v11 = v16 >= 4;
          v17 = v16 - 4;
          if (!v11)
            break;
          v18 = bswap32(*(unsigned __int32 *)((char *)v13->u32 + v14));
          *(__int32 *)((char *)v13->i32 + v14) = v18;
          if (v18 >= 0xFFFFFFFD)
            goto LABEL_30;
          v19 = (v18 + 3) & 0xFFFFFFFC;
          ++v12;
        }
        while (v19 >= v18 && v19 == v17);
        return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_20D68EC20(uint64_t a1, size_t *a2, void *__dst, _QWORD *a4, _OWORD *a5, size_t *a6, void *a7)
{
  uint64_t v8;
  unsigned int *v9;
  size_t v10;
  unsigned int *v13;
  size_t v14;

  if (*a4 < 0x10uLL)
    return 0;
  *a4 = 16;
  *a5 = *(_OWORD *)(a1 + 12);
  v8 = a1 + 40;
  v9 = (unsigned int *)(a1 + 40 + *(unsigned int *)(a1 + 28));
  v10 = *v9;
  if (*a2 < v10)
    return 0;
  *a2 = v10;
  memcpy(__dst, v9 + 1, v10);
  v13 = (unsigned int *)(v8 + *(unsigned int *)(a1 + 32));
  v14 = *v13;
  if (*a6 < v14)
    return 0;
  *a6 = v14;
  memcpy(a7, v13 + 1, v14);
  return 1;
}

BOOL sub_20D68ECCC(unint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned int v3;
  uint64_t v4;
  int8x8_t v5;
  uint64_t v6;
  unsigned __int32 v7;
  unsigned __int32 v8;
  unsigned __int32 v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;

  if (a1 < 0x40)
    return 0;
  v3 = a1;
  v4 = 0;
  v5 = vrev32_s8(*(int8x8_t *)a2);
  *(int8x8_t *)a2 = v5;
  *(_DWORD *)(a2 + 8) = bswap32(*(_DWORD *)(a2 + 8));
  *(int8x16_t *)(a2 + 28) = vrev32q_s8(*(int8x16_t *)(a2 + 28));
  do
  {
    *(_DWORD *)(a2 + 44 + v4) = bswap32(*(_DWORD *)(a2 + 44 + v4));
    v4 += 4;
  }
  while (v4 != 20);
  result = 0;
  if (v3 >= 0x40 && v5.i32[0] == v3)
  {
    v6 = 0;
    v7 = 0;
    v8 = v5.i32[0] - 64;
    while (*(_DWORD *)(a2 + v6 + 44) == v7 && (*(_DWORD *)(a2 + v6 + 44) & 3) == 0)
    {
      v10 = *(_DWORD *)(a2 + v6 + 48);
      if (v10 < v7)
        break;
      result = 0;
      if (v7 > v8 || v10 > v8)
        return result;
      v11 = __CFADD__(v7, v10 - v7);
      v7 = *(_DWORD *)(a2 + v6 + 48);
      if (v11)
      {
LABEL_30:
        __break(0x5500u);
LABEL_31:
        __break(0x5515u);
        return result;
      }
      v6 += 4;
      if (v6 == 16)
      {
        if (v10 != v8)
          return 0;
        v12 = 0;
        v13 = a2 + 64;
        do
        {
          result = v12 == 12;
          if (v12 == 12)
            break;
          v14 = *(unsigned int *)(a2 + v12 + 44);
          v15 = *(_DWORD *)(a2 + v12 + 48);
          v16 = v15 - v14;
          if (v15 < v14)
            goto LABEL_31;
          v11 = v16 >= 4;
          v17 = v16 - 4;
          if (!v11)
            break;
          v18 = bswap32(*(_DWORD *)(v13 + v14));
          *(_DWORD *)(v13 + v14) = v18;
          if (v18 >= 0xFFFFFFFD)
            goto LABEL_30;
          v19 = (v18 + 3) & 0xFFFFFFFC;
          v12 += 4;
        }
        while (v19 >= v18 && v19 == v17);
        return result;
      }
    }
    return 0;
  }
  return result;
}

BOOL sub_20D68EDFC(unint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned int v3;
  int8x8_t v4;
  uint64_t v5;
  unsigned __int32 v6;
  unsigned __int32 v7;
  unsigned __int32 v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;

  if (a1 < 0x3C)
    return 0;
  v3 = a1;
  result = 0;
  v4 = vrev32_s8(*(int8x8_t *)a2);
  *(int8x8_t *)a2 = v4;
  *(_DWORD *)(a2 + 8) = bswap32(*(_DWORD *)(a2 + 8));
  *(int8x16_t *)(a2 + 28) = vrev32q_s8(*(int8x16_t *)(a2 + 28));
  *(int8x16_t *)(a2 + 44) = vrev32q_s8(*(int8x16_t *)(a2 + 44));
  if (v3 >= 0x3C && v4.i32[0] == v3)
  {
    v5 = 0;
    v6 = 0;
    v7 = v4.i32[0] - 60;
    while (*(_DWORD *)(a2 + v5 + 44) == v6 && (*(_DWORD *)(a2 + v5 + 44) & 3) == 0)
    {
      v9 = *(_DWORD *)(a2 + v5 + 48);
      if (v9 < v6)
        break;
      result = 0;
      if (v6 > v7 || v9 > v7)
        return result;
      v10 = __CFADD__(v6, v9 - v6);
      v6 = *(_DWORD *)(a2 + v5 + 48);
      if (v10)
      {
LABEL_28:
        __break(0x5500u);
LABEL_29:
        __break(0x5515u);
        return result;
      }
      v5 += 4;
      if (v5 == 12)
      {
        if (v9 != v7)
          return 0;
        v11 = 0;
        v12 = a2 + 60;
        do
        {
          result = v11 == 12;
          if (v11 == 12)
            break;
          v13 = *(unsigned int *)(a2 + v11 + 44);
          v14 = *(_DWORD *)(a2 + v11 + 48);
          v15 = v14 - v13;
          if (v14 < v13)
            goto LABEL_29;
          v10 = v15 >= 4;
          v16 = v15 - 4;
          if (!v10)
            break;
          v17 = bswap32(*(_DWORD *)(v12 + v13));
          *(_DWORD *)(v12 + v13) = v17;
          if (v17 >= 0xFFFFFFFD)
            goto LABEL_28;
          v18 = (v17 + 3) & 0xFFFFFFFC;
          v11 += 4;
        }
        while (v18 >= v17 && v18 == v16);
        return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_20D68EF18(unint64_t a1, unsigned int *a2)
{
  if (a1 >= 8)
    return bswap32(*a2);
  else
    return 0;
}

uint64_t sub_20D68EF34(int a1, _OWORD *a2, int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int *a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int *v14;
  const void *v15;
  size_t v16;
  unsigned int v17;
  unsigned int v18;
  _DWORD *v19;
  int v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v27;
  _QWORD v28[5];

  v9 = 0;
  v28[4] = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(a8 + 4) = 165;
  *(_DWORD *)(a8 + 8) = a1;
  *(_OWORD *)(a8 + 12) = *a2;
  v28[0] = 0;
  v28[1] = a4;
  v28[3] = a6;
  v28[2] = a5;
  *(_DWORD *)(a8 + 28) = 0;
  v10 = a8 + 28;
  v11 = a8 + 40;
  v12 = *a7;
  v27 = *a7;
  LODWORD(v28[0]) = a3;
  do
  {
    if (((16 * v9) | 8uLL) > 0x20 || (v9 & 0xFFFFFFFFFFFFFFELL) != 0)
    {
      __break(1u);
LABEL_21:
      __break(0x5500u);
LABEL_22:
      __break(0x5515u);
    }
    v13 = *(unsigned int *)(v10 + 4 * v9);
    v14 = (unsigned int *)&v28[2 * v9];
    v15 = (const void *)*((_QWORD *)v14 + 1);
    if (v15)
    {
      v16 = *v14;
      if (v16 >= 0xFFFFFFFD)
        goto LABEL_21;
      v17 = (v16 + 3) & 0xFFFFFFFC;
      if (v17 < v16)
        return 0xFFFFFFFFLL;
      v18 = v17 + 4;
      if (v17 >= 0xFFFFFFFC)
        goto LABEL_21;
      if (v17 + 3 >= v12)
        return 0xFFFFFFFFLL;
      v19 = (_DWORD *)(v11 + v13);
      *(_DWORD *)(v11 + v13) = v16;
      memcpy((void *)(v11 + v13 + 4), v15, v16);
      *v19 = bswap32(v16);
      v20 = *(_DWORD *)(v10 + 4 * v9);
      v21 = __CFADD__(v18, v20);
      v22 = v18 + v20;
      if (v21)
        goto LABEL_21;
      ++v9;
      *(_DWORD *)(v10 + 4 * v9) = v22;
      v21 = v12 >= v18;
      v12 -= v18;
      if (!v21)
        goto LABEL_22;
    }
    else
    {
      ++v9;
      *(_DWORD *)(v10 + 4 * v9) = v13;
    }
  }
  while (v9 != 2);
  if (v27 < v12)
    goto LABEL_22;
  v23 = 0;
  v24 = v27 - v12 + 40;
  *(_QWORD *)a7 = v24;
  *(_DWORD *)a8 = bswap32(v24);
  *(int8x8_t *)(a8 + 4) = vrev32_s8(*(int8x8_t *)(a8 + 4));
  do
  {
    *(_DWORD *)(a8 + 28 + v23) = bswap32(*(_DWORD *)(a8 + 28 + v23));
    v23 += 4;
  }
  while (v23 != 12);
  return 0;
}

unint64_t sub_20D68F0E4(unint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  int v6;
  BOOL v7;
  int v8;

  v6 = result + a3;
  if (!__CFADD__(result, a3))
  {
    v7 = __CFADD__(v6, 3);
    v8 = v6 + 3;
    if (!v7 && a2 < 0xFFFFFFFD && a4 < 0xFFFFFFFD && a5 < 0xFFFFFFFD && a6 < 0xFFFFFFFD)
      return ((a2 + 3) & 0xFFFFFFFC)
           + (unint64_t)((a4 + 3) & 0xFFFFFFFC)
           + (v8 & 0xFFFFFFFC)
           + ((a5 + 3) & 0xFFFFFFFC)
           + (unint64_t)((a6 + 3) & 0xFFFFFFFC)
           + 68;
  }
  __break(0x5500u);
  return result;
}

uint64_t sub_20D68F2F8(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  SecureBackupTermsInfo *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = objc_alloc_init(SecureBackupTermsInfo);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark() || !SecureBackupTermsInfoReadFrom((uint64_t)v23, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_35:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_20D6900A4()
{
  if (qword_2549C1B10 != -1)
    dispatch_once(&qword_2549C1B10, &unk_24C759AE0);
  return byte_2549C1B08;
}

uint64_t sub_20D6900E4()
{
  uint64_t result;

  result = SecIsInternalRelease();
  byte_2549C1B08 = result;
  return result;
}

BOOL sub_20D690100(void *a1, void *a2, _QWORD *a3)
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const char *v7;
  uint64_t v8;
  OSStatus v9;
  void *v10;
  const __CFDictionary *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const char *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v9 = SecItemUpdate(v5, v6);
  if (v9 == -25300)
  {
    v10 = (void *)objc_msgSend_mutableCopy(v5, v7, v8);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v6;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v22, v26, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v11);
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v11, v14, v18, (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v10, v20, (uint64_t)v19, v18);

        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v22, v26, 16);
      }
      while (v15);
    }

    v9 = SecItemAdd((CFDictionaryRef)v10, 0);
  }
  if (a3 && v9)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, *MEMORY[0x24BDD1100], v9, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 == 0;
}

id sub_20D6906E4(unsigned int a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  int v9;
  char v10;
  void *v11;
  int v12;
  char v13;
  id v14;
  id v15;
  const char *v16;
  const __CFData *v17;
  id v18;
  const char *v19;
  SecCertificateRef v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  const __CFData *v33;
  SecCertificateRef v34;
  const char *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  uint8_t v42[16];
  uint8_t v43[16];
  uint8_t v44[16];
  uint8_t v45[16];
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = _os_feature_enabled_impl();
  v10 = v9;
  if (!a4)
  {
    v12 = sub_20D691C34(v8);
    v13 = v10 ^ 1;
    if ((a1 & 0xFFFFFFFE) == 2)
      v13 = 1;
    if ((v13 & 1) == 0)
    {
      if ((v12 & 1) != 0)
      {
        v11 = &unk_24C75EBA8;
        goto LABEL_12;
      }
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v23 = objc_alloc(MEMORY[0x24BDBCE50]);
      v18 = (id)objc_msgSend_initWithBytes_length_(v23, v24, (uint64_t)&unk_20D698C05, 981);
      if (!v18)
      {
LABEL_53:

        goto LABEL_54;
      }
      v22 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)v18);
      if (v22)
        objc_msgSend_addObject_(v14, v25, (uint64_t)v22);
LABEL_25:

      goto LABEL_53;
    }
    if (v12)
    {
      v11 = &unk_24C75EBC0;
      goto LABEL_12;
    }
    v18 = v7;
    if (a1 <= 7)
    {
      if (((1 << a1) & 0x33) != 0)
      {
        v26 = (void *)SecCertificateCopyEscrowRoots();
LABEL_31:
        sub_20D67C0DC();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D67A000, v27, OS_LOG_TYPE_DEFAULT, "adding extra cert", buf, 2u);
        }

        v30 = (void *)objc_msgSend_mutableCopy(v26, v28, v29);
        v31 = objc_alloc(MEMORY[0x24BDBCE50]);
        v33 = (const __CFData *)objc_msgSend_initWithBytes_length_(v31, v32, (uint64_t)&unk_20D698FDA, 981);
        if (v33)
        {
          v34 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v33);
          if (v34)
          {
            v36 = v34;
            objc_msgSend_addObject_(v30, v35, (uint64_t)v34);
          }
          else
          {
            sub_20D67C0DC();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v45 = 0;
              _os_log_impl(&dword_20D67A000, v37, OS_LOG_TYPE_DEFAULT, "failed to create SecCertificate", v45, 2u);
            }

            v36 = 0;
          }
        }
        else
        {
          sub_20D67C0DC();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v44 = 0;
            _os_log_impl(&dword_20D67A000, v36, OS_LOG_TYPE_DEFAULT, "failed to create cert data", v44, 2u);
          }
        }

        if (v30)
        {
          if (_os_feature_enabled_impl())
          {
            v38 = v30;
            v30 = v38;
          }
          else
          {
            sub_20D67C0DC();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v42 = 0;
              _os_log_impl(&dword_20D67A000, v39, OS_LOG_TYPE_DEFAULT, "dropping extra cert, feature is disabled", v42, 2u);
            }

            v38 = v26;
            v26 = v38;
          }
          goto LABEL_52;
        }
LABEL_51:
        v38 = v26;
        v26 = v38;
        v30 = 0;
LABEL_52:
        v14 = v38;

        goto LABEL_53;
      }
      if (((1 << a1) & 0xC0) != 0)
      {
        v26 = (void *)SecCertificateCopyEscrowRoots();
        if (!sub_20D691A5C(v18))
        {
          sub_20D67C0DC();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v43 = 0;
            _os_log_impl(&dword_20D67A000, v40, OS_LOG_TYPE_DEFAULT, "skipping extra cert because terms were not accepted", v43, 2u);
          }

          goto LABEL_51;
        }
        goto LABEL_31;
      }
    }
    v26 = (void *)SecCertificateCopyEscrowRoots();
    goto LABEL_51;
  }
  if (v9)
    sub_20D69683C();
  if (!sub_20D691C34(v8))
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = objc_alloc(MEMORY[0x24BDBCE50]);
    if ((a1 & 0xFFFFFFFE) == 2)
      v17 = (const __CFData *)objc_msgSend_initWithBytes_length_(v15, v16, (uint64_t)&unk_20D698830, 981);
    else
      v17 = (const __CFData *)objc_msgSend_initWithBytes_length_(v15, v16, (uint64_t)&unk_20D698C05, 981);
    v18 = v17;
    if (v17)
    {
      v20 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v17);
      if (v20)
        objc_msgSend_addObject_(v14, v19, (uint64_t)v20);

    }
    v22 = (void *)SecCertificateCopyEscrowRoots();
    if (v22)
      objc_msgSend_addObjectsFromArray_(v14, v21, (uint64_t)v22);
    goto LABEL_25;
  }
  v11 = &unk_24C75EB90;
LABEL_12:
  sub_20D691C80(v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:

  return v14;
}

BOOL sub_20D691A5C(void *a1)
{
  id v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  const char *v4;
  _BOOL8 v5;
  _QWORD v7[4];
  id v8;
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v1 = a1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v1)
  {
    v2 = dispatch_semaphore_create(0);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_20D691E74;
    v7[3] = &unk_24C75A4E0;
    v10 = &v11;
    v8 = v1;
    v3 = v2;
    v9 = v3;
    objc_msgSend_fetchTermsWithAltDSID_reply_(CertOperations, v4, (uint64_t)v8, v7);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    v5 = *((_BYTE *)v12 + 24) != 0;

  }
  else
  {
    sub_20D67C0DC();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_20D69686C(v3);
    v5 = 0;
  }

  _Block_object_dispose(&v11, 8);
  return v5;
}

void sub_20D691B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D691C34(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;

  v1 = a1;
  if (sub_20D6900A4())
    v3 = objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("PROD")) ^ 1;
  else
    v3 = 0;

  return v3;
}

id sub_20D691C80(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFAllocator *v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  const char *v16;
  void *isDirectory;
  NSObject *v18;
  id v19;
  const char *v20;
  const __CFData *v21;
  const char *v22;
  SecCertificateRef v23;
  const char *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v5 = objc_msgSend_count(v1, v3, v4);
  v26 = (id)objc_msgSend_initWithCapacity_(v2, v6, v5);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v1;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v15 = objc_alloc(MEMORY[0x24BDBCF48]);
        isDirectory = (void *)objc_msgSend_initFileURLWithPath_isDirectory_(v15, v16, v14, 0);
        sub_20D67C0DC();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = isDirectory;
          _os_log_impl(&dword_20D67A000, v18, OS_LOG_TYPE_DEFAULT, "cert URL = %@", buf, 0xCu);
        }

        if (isDirectory)
        {
          v19 = objc_alloc(MEMORY[0x24BDBCE50]);
          v21 = (const __CFData *)objc_msgSend_initWithContentsOfURL_(v19, v20, (uint64_t)isDirectory);
          if (v21)
          {
            v23 = SecCertificateCreateWithData(v12, v21);
            if (v23)
              objc_msgSend_addObject_(v26, v22, (uint64_t)v23);

          }
        }

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v24, (uint64_t)&v27, v33, 16);
    }
    while (v10);
  }

  return v26;
}

void sub_20D691E74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;

  v5 = a3;
  v8 = v5;
  if (!a2 || v5)
  {
    sub_20D67C0DC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_20D6968AC(a1, (uint64_t)v8, v12);
  }
  else
  {
    objc_msgSend_firstObject(a2, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if (v9)
    {
      objc_msgSend_countryCode(v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)CFSTR("CN"));

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_20D692A6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D692A98(char *a1, ...)
{
  NSObject *v2;
  char *v4;
  uint8_t buf[4];
  char *v6;
  uint64_t v7;
  va_list va;

  va_start(va, a1);
  v7 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  if (vasprintf(&v4, a1, va) != -1 && v4 != 0)
  {
    sub_20D67C0DC();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = v4;
      _os_log_impl(&dword_20D67A000, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    free(v4);
  }
  return 0;
}

uint64_t sub_20D692B6C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D692B7C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v11;
  const char *v12;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  char *v23;

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = &a9;
  v23 = 0;
  if (vasprintf(&v23, a2, &a9) != -1 && v23 != 0)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    v16 = (void *)objc_msgSend_initWithUTF8String_(v14, v15, (uint64_t)v23, &a9);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, *MEMORY[0x24BDD0FC8]);

    free(v23);
  }
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v18)
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, v18, *MEMORY[0x24BDD1398]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v12, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, v11, v22);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void sub_20D694F58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_20D694F7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_20D694F88(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "getAccountInfoWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D694FF0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "enableWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695058(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "recoverWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6950C0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "recoverRecordContentsWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695128(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "createICDPRecord remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695190(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "disableWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6951F8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "stashRecoveryDataWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695260(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "updateMetadata remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6952C8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "cachePassphraseWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695330(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "uncachePassphraseWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695398(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "cacheRecoveryKeyWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695400(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "uncacheRecoveryKeyWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695468(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "startSMSChallengeWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6954D0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "getCountrySMSCodesWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695538(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "changeSMSTargetWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6955A0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "backupWithInfo remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695608(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "backOffDateWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695670(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "setBackOffDateWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6956D8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "notificationInfoWithReply remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695740(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "stateCaptureWithReply remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6957A8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup getAccountInfoWithError:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D69581C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup updateMetadataWithError:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D695890(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "updateMetadataWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6958F8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup enableWithError:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D69596C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup recoverWithError:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D6959E0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup recoverWithCDPContext:escrowRecord:error:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D695A54(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "recoverWithCDPContext: remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695ABC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup recoverSilentWithCDPContext:allRecords:error:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D695B30(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "recoverSilentWithCDPContextAndRecords: remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695B98(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup isRecoveryKeySet:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D695C0C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "isRecoveryKeySet: remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695C74(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup restoreKeychainAsyncWithPassword:keybagDigest:haveBottledPeer:viewsNotToBeRestored:error:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D695CE8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "restoreKeychainAsyncWithPassword: remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695D50(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup restoreKeychainWithBackupPassword:error:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D695DC4(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "restoreKeychainWithBackupPassword: remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695E2C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup verifyRecoveryKey:error:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D695EA0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "verifyRecoveryKey: remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695F08(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup removeRecoveryKeyFromBackup:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D695F7C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "removeRecoveryKeyFromBackup: remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D695FE4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup disableWithError:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D696058(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup startSMSChallengeWithError:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D6960CC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup changeSMSTargetWithError:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D696140(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup backupForRecoveryKeyWithInfo:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D6961B4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_20D689B08();
  sub_20D689AF0(&dword_20D67A000, v0, v1, "backupForRecoveryKeyWithInfo remote proxy error: %@", v2);
  sub_20D689B1C();
}

void sub_20D696218(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup backupWithInfo:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D69628C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup prepareHSA2EscrowRecordContents:reply:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D696300(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "prepareHSA2EscrowRecordContents remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D696368(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  sub_20D689AF0(&dword_20D67A000, a2, a3, "unknown passcode request state: %llu", (uint8_t *)&v4);
  sub_20D689B1C();
}

void sub_20D6963D4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "+[SecureBackup daemonPasscodeRequestOpinion:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D696448(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "daemonPasscodeRequestOpinion remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6964B0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SecureBackup beginHSA2PasscodeRequest:uuid:reason:error:]";
  sub_20D689AF0(&dword_20D67A000, a1, a3, "calling %s from the main thread", (uint8_t *)&v3);
  sub_20D689B1C();
}

void sub_20D696524(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "beginHSA2PasscodeRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D69658C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "getCertificatesWithRequest remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6965F4(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "saveTermsAcceptance remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D69665C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "getAcceptedTermsForAltDSID remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D6966C4(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "moveToFederationAllowed remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D69672C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_20D689B14(a1, a2, a3);
  sub_20D689B08();
  sub_20D689ADC(&dword_20D67A000, v3, v4, "knownICDPFederations remote proxy error: %ld", v5, v6, v7, v8, v9);
  sub_20D689AFC();
}

void sub_20D696794(NSObject *a1)
{
  int *v2;
  char *v3;
  int v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  v3 = strerror(*v2);
  v4 = *__error();
  v5 = 136315394;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_20D67A000, a1, OS_LOG_TYPE_ERROR, "No code for POSIX error: %s (%d)", (uint8_t *)&v5, 0x12u);
}

void sub_20D69683C()
{
  _os_crash();
  __break(1u);
}

void sub_20D696854()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_20D69686C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D67A000, log, OS_LOG_TYPE_ERROR, "terms requested with no altDSID", v1, 2u);
}

void sub_20D6968AC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138478083;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20D67A000, log, OS_LOG_TYPE_ERROR, "failed to get terms for altDSID %{private}@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_20D696934()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_20D689B08();
  sub_20D689AF0(&dword_20D67A000, v0, v1, "invalid request: %@", v2);
  sub_20D689B1C();
}

void sub_20D696998(int *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  sub_20D694F7C(&dword_20D67A000, a2, a3, "bad reqVersion (%d) not in [0,2]", (uint8_t *)v4);
  sub_20D694F68();
}

void sub_20D696A04(void *a1, char *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_length(a1, a2, a3);
  sub_20D689B08();
  sub_20D689AF0(&dword_20D67A000, a2, v4, "srp recovery blob too large: %lu bytes", v5);
  sub_20D689AFC();
}

void sub_20D696A78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "failed to convert srp init response", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696AA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "can't process recovery blob with no username", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696AD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "username could not be converted to cstring", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696AFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "recoveryPassphrase not provided", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696B28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "recoveryPassphrase could not be converted to cstring", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696B54(uint64_t a1, int a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  sub_20D694F7C(&dword_20D67A000, a3, (uint64_t)a3, "unknown reqVersion: %d", (uint8_t *)a1);
}

void sub_20D696B90(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2112;
  v6 = v3;
  _os_log_error_impl(&dword_20D67A000, log, OS_LOG_TYPE_ERROR, "srp_challenge_process failed: %d, %@", (uint8_t *)v4, 0x12u);
  sub_20D689B1C();
}

void sub_20D696C18(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_20D689AF0(&dword_20D67A000, a2, a3, "could not create priv key: %@", (uint8_t *)&v4);
  sub_20D689B1C();
}

void sub_20D696C84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "could not create local SRP recovery blob", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696CB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "Local SRP verify failed", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696CDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "decodedEscrowRecordFromData: failed to parse packet header", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696D08(void *a1, char *a2, uint64_t a3)
{
  uint64_t v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = 67109120;
  v5[1] = objc_msgSend_reqVersion(a1, a2, a3);
  sub_20D694F7C(&dword_20D67A000, a2, v4, "unsupported reqVersion: %d", (uint8_t *)v5);
  sub_20D689B1C();
}

void sub_20D696D84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "SecKeyCopyPublicBytes failed", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696DB0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_20D689B08();
  sub_20D689AF0(&dword_20D67A000, v0, v1, "verifycert failed: %@", v2);
  sub_20D689B1C();
}

void sub_20D696E14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "ckvr_pack_srp_init_resp failed", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696E40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "Server Start Fails (ckvr_srp_server_start_authentication)", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696E6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "ckvr_cylon_process_blob failed", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696E98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "ckvr_srp_server_verify_session failed", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

void sub_20D696EC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D694F70();
  sub_20D694F58(&dword_20D67A000, v0, v1, "ckvr_unpack_clubh_recover_req_pkt failed", v2, v3, v4, v5, v6);
  sub_20D694F68();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t SecCertificateCopyEscrowRoots()
{
  return MEMORY[0x24BDE8860]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x24BDE88B8]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecIsInternalRelease()
{
  return MEMORY[0x24BDE8A68]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x24BDE8AC0]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

SecPolicyRef SecPolicyCreateWithProperties(CFTypeRef policyIdentifier, CFDictionaryRef properties)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C88](policyIdentifier, properties);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x24BDAD358]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x24BDAD360]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x24BDAD378]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x24BDAD380]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x24BDAD3A0]();
}

uint64_t cccbc_set_iv()
{
  return MEMORY[0x24BDAD3B0]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x24BDAD528]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x24BDAD530]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x24BDAD670]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x24BDAD6B0]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x24BDAD6B8]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x24BDAD6C0]();
}

uint64_t ccpad_pkcs7_decrypt()
{
  return MEMORY[0x24BDAD740]();
}

uint64_t ccpad_pkcs7_encrypt()
{
  return MEMORY[0x24BDAD748]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x24BDAD750]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccrsa_block_size()
{
  return MEMORY[0x24BDAD768]();
}

uint64_t ccrsa_ctx_public()
{
  return MEMORY[0x24BDAD770]();
}

uint64_t ccrsa_decrypt_oaep()
{
  return MEMORY[0x24BDAD778]();
}

uint64_t ccrsa_encrypt_oaep()
{
  return MEMORY[0x24BDAD780]();
}

uint64_t ccrsa_export_priv()
{
  return MEMORY[0x24BDAD788]();
}

uint64_t ccrsa_export_priv_size()
{
  return MEMORY[0x24BDAD790]();
}

uint64_t ccrsa_export_pub()
{
  return MEMORY[0x24BDAD798]();
}

uint64_t ccrsa_export_pub_size()
{
  return MEMORY[0x24BDAD7A0]();
}

uint64_t ccrsa_generate_fips186_key()
{
  return MEMORY[0x24BDAD7A8]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x24BDAD7D0]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x24BDAD7D8]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x24BDAD7F0]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x24BDAD818]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x24BDAD850]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x24BDAD860]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x24BDAD868]();
}

uint64_t ccsrp_ctx_init_option()
{
  return MEMORY[0x24BDAD878]();
}

uint64_t ccsrp_generate_salt_and_verification()
{
  return MEMORY[0x24BDAD888]();
}

uint64_t ccsrp_get_session_key_length()
{
  return MEMORY[0x24BDAD8A0]();
}

uint64_t ccsrp_gp_rfc5054_2048()
{
  return MEMORY[0x24BDAD8B0]();
}

uint64_t ccsrp_server_start_authentication()
{
  return MEMORY[0x24BDAD8D8]();
}

uint64_t ccsrp_server_verify_session()
{
  return MEMORY[0x24BDAD8E0]();
}

uint64_t ccsrp_sizeof_M_HAMK()
{
  return MEMORY[0x24BDAD8F0]();
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

int pthread_main_np(void)
{
  return MEMORY[0x24BDAF8B0]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

