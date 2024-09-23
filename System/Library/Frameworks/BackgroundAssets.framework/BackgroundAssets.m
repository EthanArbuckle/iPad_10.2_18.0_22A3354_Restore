void sub_21ABDB48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21ABDB5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__105(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__106(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_21ABDC338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ABDC6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
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

void sub_21ABDC984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21ABDD028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21ABDD2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21ABDD634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id BASystemLogObject()
{
  if (BASystemLogObject_onceToken != -1)
    dispatch_once(&BASystemLogObject_onceToken, &__block_literal_global_1);
  return (id)BASystemLogObject_obj;
}

id BAClientLogObject()
{
  if (BAClientLogObject_onceToken != -1)
    dispatch_once(&BAClientLogObject_onceToken, &__block_literal_global_3);
  return (id)BAClientLogObject_obj;
}

id BAClientConnectionLogObject()
{
  if (BAClientConnectionLogObject_onceToken != -1)
    dispatch_once(&BAClientConnectionLogObject_onceToken, &__block_literal_global_5);
  return (id)BAClientConnectionLogObject_obj;
}

const __CFString *BADownloadNecessityToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<Unknown>");
  if (a1 == 1)
    v1 = CFSTR("Essential");
  if (a1)
    return v1;
  else
    return CFSTR("Optional");
}

const __CFString *BAContentRequestToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("<Unknown>");
  else
    return off_24DDBF120[a1 - 1];
}

id NSErrorWithBAErrorCode(uint64_t a1)
{
  return NSErrorWithBAErrorDomainCodeUnderlying(CFSTR("BAErrorDomain"), a1, 0);
}

id NSErrorWithBAErrorDomainCodeUnderlying(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if (a3)
  {
    v10 = *MEMORY[0x24BDD1398];
    v11[0] = a3;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = a3;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    a3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  NSErrorWithBAErrorDomainCodeUserInfo(v5, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void NSErrorWithBAErrorDomainCodeUserInfo(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a1;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("BAErrorDomain")) & 1) != 0)
  {
    v9 = CFSTR("BAError");
LABEL_5:
    objc_msgSend(v7, "localizedStringForKey:value:table:", v8, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v11 = (void *)objc_msgSend(v6, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    objc_msgSend(v11, "setObject:forKey:", v10, *MEMORY[0x24BDD0FD8]);
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v5, a2, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15;
    return;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("BAURLDownloadErrorDomain")) & 1) != 0)
  {
    v9 = CFSTR("BAURLDownloadError");
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    NSErrorWithBAErrorDomainCodeUserInfo_cold_1();
  qword_255111848 = (uint64_t)"BUG IN BackgroundAssets: NSErrorWithBAErrorDomainCodeUserInfo() called with unsupported NSErrorDomain.";
  qword_255111878 = 6;
  __break(1u);
}

const __CFString *BAAppStoreProgressObserverStateString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("Unrecognized App");
  else
    return off_24DDBF178[a1 - 1];
}

void sub_21ABE2510(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21ABE27C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21ABE3188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ABE36DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

void sub_21ABE39A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21ABE3C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_21ABE40AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_21ABE6DD8()
{
  return MEMORY[0x24BEE4B08];
}

uint64_t BADownloaderExtension.downloads(for:manifestURL:extensionInfo:)()
{
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_21ABE6DF0()
{
  uint64_t v0;

  return sub_21ABE7EE4(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 1, 0);
}

uint64_t BADownloaderExtension.backgroundDownload(_:didReceive:)()
{
  uint64_t v0;

  return sub_21ABE7EE4(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 1, 0);
}

id BADownloaderExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  id result;
  uint64_t v7;

  result = sub_21ABE77D0(v4, a1, a2, a3);
  *a4 = result;
  a4[1] = v7;
  return result;
}

id sub_21ABE6E58(uint64_t a1, id a2)
{
  return objc_msgSend(a2, sel_shouldAcceptXPCConnection_, a1);
}

id sub_21ABE6E80(uint64_t a1)
{
  id *v1;

  return sub_21ABE6E58(a1, *v1);
}

uint64_t sub_21ABE6E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x58)
                                                                      + 16))(a1, a2, a3, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x50));
}

id sub_21ABE6ED0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;

  v8 = sub_21ABE9D58();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21ABE9D4C();
  v12 = a5;
  v13 = a1;
  sub_21ABE6E90(a3, (uint64_t)v11, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_21ABE7E60();
  sub_21ABE7E9C();
  v14 = (void *)sub_21ABE9D88();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_21ABE6FC4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255111798);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21ABE9D7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v4;
  v12[5] = a1;
  v12[6] = a2;
  v12[7] = a3;
  v12[8] = a4;
  v13 = v4;
  v14 = a1;
  v15 = a2;
  swift_retain();
  sub_21ABE71F0((uint64_t)v10, (uint64_t)&unk_2551117A8, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_21ABE70B8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);

  v8[2] = a7;
  v8[3] = a8;
  v11 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a4) + 0x58);
  v12 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a4) + 0x50);
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v11 + 24) + *(_QWORD *)(v11 + 24));
  v13 = (_QWORD *)swift_task_alloc();
  v8[4] = v13;
  *v13 = v8;
  v13[1] = sub_21ABE7158;
  return v15(a5, a6, v12, v11);
}

uint64_t sub_21ABE7158(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21ABE71B4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 48);
  (*(void (**)(_QWORD, void *))(v0 + 16))(*(_QWORD *)(v0 + 40), v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21ABE71F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21ABE9D7C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21ABE9D70();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21ABE7D28(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21ABE9D64();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21ABE7334(void *a1, int a2, void *a3, void *a4, void *aBlock)
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v8 = _Block_copy(aBlock);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = a1;
  sub_21ABE6FC4(v10, v11, (uint64_t)sub_21ABE7E4C, v9);

  return swift_release();
}

uint64_t sub_21ABE73D0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58) + 32))(a1, a2, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50));
}

void sub_21ABE7410(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = a1;
  sub_21ABE73D0((uint64_t)v6, (uint64_t)v8);

}

uint64_t sub_21ABE7470(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58) + 40))(a1, a2, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50));
}

uint64_t sub_21ABE74B0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v12;

  v5 = sub_21ABE9D58();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21ABE9D4C();
  v9 = a3;
  v10 = a1;
  sub_21ABE7470((uint64_t)v9, (uint64_t)v8);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_21ABE7560()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x58) + 48))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x50));
}

void sub_21ABE75A0(void *a1)
{
  id v1;

  v1 = a1;
  sub_21ABE7560();

}

void sub_21ABE75D4()
{
  sub_21ABE7DFC();
}

id sub_21ABE75F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for _BackgroundDownloadHandler(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_21ABE763C(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x60)]);
}

uint64_t sub_21ABE7668(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21ABE76CC;
  return v6(a1);
}

uint64_t sub_21ABE76CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id sub_21ABE7718(uint64_t a1)
{
  char *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  objc_super v7;

  v2 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1);
  v3 = v2[10];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(&v1[v2[12]], a1, v3);
  v5 = (objc_class *)type metadata accessor for _BackgroundDownloadHandler(0, v3, v2[11], v4);
  v7.receiver = v1;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_init);
}

id sub_21ABE7798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for _BackgroundDownloadHandler(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_21ABE7718(a1);
}

id sub_21ABE77D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v12;

  type metadata accessor for _BackgroundDownloadHandler(0, a2, a3, a4);
  v12 = sub_21ABE7798(a1, v5, v6, v7);
  v8 = objc_allocWithZone((Class)BADownloaderExtensionConnection);
  v9 = v12;
  v10 = objc_msgSend(v8, sel_initWithPrincipalObject_, sub_21ABE9D94());

  swift_unknownObjectRelease();
  return v10;
}

uint64_t dispatch thunk of BADownloaderExtension.downloads(for:manifestURL:extensionInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of BADownloaderExtension.backgroundDownload(_:didReceive:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_21ABE78F8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_21ABE78F8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t dispatch thunk of BADownloaderExtension.backgroundDownload(_:failedWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of BADownloaderExtension.backgroundDownload(_:finishedWithFileURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of BADownloaderExtension.extensionWillTerminate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_21ABE796C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for _BackgroundDownloadHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _BackgroundDownloadHandler);
}

void sub_21ABE79E8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _BackgroundDownloaderExtensionConfiguration(255, *a1, a1[1], a4);
  JUMPOUT(0x220753A3CLL);
}

uint64_t type metadata accessor for _BackgroundDownloaderExtensionConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _BackgroundDownloaderExtensionConfiguration);
}

uint64_t sub_21ABE7A1C()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_21ABE7A24(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void sub_21ABE7A54(id *a1)
{

}

uint64_t sub_21ABE7A7C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_21ABE7ADC(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t sub_21ABE7B18(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_21ABE7B60(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_21ABE7B9C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x220753A3C](&unk_21ABEAFF8);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220753A30]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21ABE7C08()
{
  id *v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21ABE7C4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (_QWORD *)v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_21ABE7CE0;
  return sub_21ABE70B8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21ABE7CE0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21ABE7D28(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255111798);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21ABE7D68()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21ABE7D8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21ABE7CE0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2551117B0 + dword_2551117B0))(a1, v4);
}

void sub_21ABE7DFC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_21ABE7E28()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21ABE7E4C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_21ABE7E60()
{
  unint64_t result;

  result = qword_2551117C0;
  if (!qword_2551117C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2551117C0);
  }
  return result;
}

unint64_t sub_21ABE7E9C()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2551117C8;
  if (!qword_2551117C8)
  {
    v1 = sub_21ABE7E60();
    result = MEMORY[0x220753A3C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2551117C8);
  }
  return result;
}

uint64_t sub_21ABE7EE4(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x220753A0C](a1, v6, a5);
}

void type metadata accessor for AuthChallengeDisposition()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2551117D0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2551117D0);
  }
}

id BAAppExtensionInfo.restrictedEssentialDownloadSizeRemaining.getter()
{
  return sub_21ABE7F94((SEL *)&selRef_restrictedEssentialDownloadSizeRemaining);
}

id BAAppExtensionInfo.restrictedDownloadSizeRemaining.getter()
{
  return sub_21ABE7F94((SEL *)&selRef_restrictedDownloadSizeRemaining);
}

id sub_21ABE7F94(SEL *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(v1, *a1);
  v3 = v2;
  if (!v2)
    return 0;
  v4 = objc_msgSend(v2, sel_integerValue);

  return v4;
}

void NSErrorWithBAErrorDomainCodeUserInfo_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "NSErrorWithBAErrorDomainCodeUserInfo() called with unsupported NSErrorDomain.";
  _os_log_fault_impl(&dword_21ABD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

uint64_t sub_21ABE9D4C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21ABE9D58()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21ABE9D64()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21ABE9D70()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21ABE9D7C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21ABE9D88()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_21ABE9D94()
{
  return MEMORY[0x24BEE3A20]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t ba_is_current_process_extension()
{
  return MEMORY[0x24BED3448]();
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x24BDAD9C8](a1, a2, *(_QWORD *)&a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x24BDAFC10]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

