id getLSApplicationWorkspaceClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)_MergedGlobals_6;
  v7 = _MergedGlobals_6;
  if (!_MergedGlobals_6)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLSApplicationWorkspaceClass_block_invoke;
    v3[3] = &unk_1E37BDEA8;
    v3[4] = &v4;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A03D31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASDLogHandleForCategory(uint64_t a1)
{
  if (ASDLogHandleForCategory_onceToken != -1)
    dispatch_once(&ASDLogHandleForCategory_onceToken, &__block_literal_global_12);
  return (id)ASDLogHandleForCategory_logHandles[a1];
}

void sub_19A03EBDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A03ED34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A03EE68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A03F094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A03FBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ASDWithLock(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  id v4;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "lock");
  v3[2](v3);

  objc_msgSend(v4, "unlock");
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(result + 48) = v2;
  v3 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(result + 56) = v3;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19A041340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A041544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A041B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14)
{
  id *v14;
  id *v15;
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v18 - 112));
  _Unwind_Resume(a1);
}

void sub_19A041BB0()
{
  JUMPOUT(0x19A041B78);
}

void sub_19A041BB8()
{
  JUMPOUT(0x19A041B80);
}

void sub_19A041BC0()
{
  JUMPOUT(0x19A041B88);
}

void sub_19A041BC8()
{
  JUMPOUT(0x19A041B90);
}

void sub_19A041BD0()
{
  JUMPOUT(0x19A041B98);
}

void sub_19A0422B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A044958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t static Logger.updates.getter()
{
  id v0;

  v0 = ASD_LOG_UPDATES();
  return sub_19A0AEE58();
}

id ASD_LOG_UPDATES()
{
  ASDLogHandleForCategory(39);
  return (id)objc_claimAutoreleasedReturnValue();
}

id ASDErrorWithDescription(void *a1, uint64_t a2, void *a3)
{
  return ASDErrorWithUnderlyingErrorAndDescription(0, a1, a2, a3);
}

id ASDErrorWithUnderlyingErrorAndDescription(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a4;
  ASDErrorWithSafeUserInfo(a1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v11 = v8;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2938]);
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v10, a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id ASDErrorWithSafeUserInfo(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v1 = a1;
  if (v1)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend(v1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __ASDErrorWithSafeUserInfo_block_invoke;
    v14 = &unk_1E37C01B0;
    v16 = &v17;
    v6 = v4;
    v15 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);

    if (*((_BYTE *)v18 + 24))
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v1, "domain", v11, v12, v13, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v1, "code"), v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v1;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_19A0473B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A0486D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void String.init(appStoreDaemonLocalized:comment:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  void (*v12)(char *, uint64_t);
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[2];
  void (*v24)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  char *__ptr32 *v27;
  uint64_t v28;

  sub_19A0AEE40();
  MEMORY[0x1E0C80A78]();
  v25 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_19A0AEE64();
  v26 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_19A0AEE1C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = &off_19A0B8A30;
  sub_19A0AEE04();
  v9 = objc_allocWithZone(MEMORY[0x1E0CB34D0]);
  v10 = (void *)sub_19A0AEE10();
  v11 = objc_msgSend(v9, sel_initWithURL_, v10);

  v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  if (!v11)
    goto LABEL_8;
  v24 = v12;
  v13 = objc_msgSend(v11, sel_localizations);

  if (!v13)
  {
    sub_19A0AEE94();
    v13 = (id)sub_19A0AEE88();
    swift_bridgeObjectRelease();
  }
  v14 = (void *)objc_opt_self();
  sub_19A0AEE28();
  v15 = (void *)sub_19A0AEE88();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_preferredLocalizationsFromArray_forPreferences_, v13, v15);

  v17 = sub_19A0AEE94();
  if (!*(_QWORD *)(v17 + 16))
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v23[1] = *(_QWORD *)(v17 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v26;
  v19 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v4, a1, v28);
  sub_19A0AEE04();
  v20 = objc_allocWithZone(MEMORY[0x1E0CB34D0]);
  v21 = (void *)sub_19A0AEE10();
  v22 = objc_msgSend(v20, sel_initWithURL_, v21);

  v24(v8, v5);
  if (v22)
  {
    sub_19A0AEE34();
    sub_19A0AEE7C();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a1, v19);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t String.init(appStoreDaemonLocalized:defaultValue:comment:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t result;
  uint64_t v16;
  _QWORD v17[3];
  int v18;

  v18 = a3;
  v17[1] = a1;
  v17[2] = a2;
  sub_19A0AEE40();
  MEMORY[0x1E0C80A78]();
  v5 = sub_19A0AEE1C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_19A0AEE64();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v9);
  sub_19A0AEE04();
  v12 = objc_allocWithZone(MEMORY[0x1E0CB34D0]);
  v13 = (void *)sub_19A0AEE10();
  v14 = objc_msgSend(v12, sel_initWithURL_, v13);

  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v14)
  {
    sub_19A0AEE34();
    v16 = sub_19A0AEE70();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a4, v9);
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

const char *FeatureFlag.domain.getter()
{
  return "AppStoreDaemon";
}

const char *FeatureFlag.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "EphemeralAccount";
  else
    return "ActiveRestoreSupport";
}

BOOL static FeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FeatureFlag.hash(into:)()
{
  return sub_19A0AEEAC();
}

uint64_t FeatureFlag.hashValue.getter()
{
  sub_19A0AEEA0();
  sub_19A0AEEAC();
  return sub_19A0AEEB8();
}

BOOL sub_19A049768(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_19A049780()
{
  sub_19A0AEEA0();
  sub_19A0AEEAC();
  return sub_19A0AEEB8();
}

uint64_t sub_19A0497C4()
{
  return sub_19A0AEEAC();
}

uint64_t sub_19A0497EC()
{
  sub_19A0AEEA0();
  sub_19A0AEEAC();
  return sub_19A0AEEB8();
}

const char *sub_19A04982C()
{
  return "AppStoreDaemon";
}

const char *sub_19A049840()
{
  _BYTE *v0;

  if (*v0)
    return "EphemeralAccount";
  else
    return "ActiveRestoreSupport";
}

Swift::Bool __swiftcall asd_isFeatureEnabled(_:)(AppStoreDaemon::FeatureFlag a1)
{
  char v1;
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v1 = *(_BYTE *)a1;
  v5 = &type metadata for FeatureFlag;
  v6 = sub_19A0498C4();
  v4[0] = v1;
  v2 = sub_19A0AEE4C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_19A0498C4()
{
  unint64_t result;

  result = qword_1EE37AF18;
  if (!qword_1EE37AF18)
  {
    result = MEMORY[0x19AEC5D74](&protocol conformance descriptor for FeatureFlag, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_1EE37AF18);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_19A04992C()
{
  unint64_t result;

  result = qword_1EE37AF20;
  if (!qword_1EE37AF20)
  {
    result = MEMORY[0x19AEC5D74](&protocol conformance descriptor for FeatureFlag, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_1EE37AF20);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FeatureFlag(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FeatureFlag(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_19A049A5C + 4 * byte_19A0BDD35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_19A049A90 + 4 * asc_19A0BDD30[v4]))();
}

uint64_t sub_19A049A90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A049A98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19A049AA0);
  return result;
}

uint64_t sub_19A049AAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19A049AB4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19A049AB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A049AC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19A049ACC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_19A049AD8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

uint64_t static Logger.activity.getter()
{
  id v0;

  v0 = ASD_LOG_ACTIVITY();
  return sub_19A0AEE58();
}

id ASD_LOG_ACTIVITY()
{
  ASDLogHandleForCategory(0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.appCapabilities.getter()
{
  id v0;

  v0 = ASD_LOG_APP_CAPABILITIES();
  return sub_19A0AEE58();
}

id ASD_LOG_APP_CAPABILITIES()
{
  ASDLogHandleForCategory(1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.appInstall.getter()
{
  id v0;

  v0 = ASD_LOG_APPINSTALL();
  return sub_19A0AEE58();
}

id ASD_LOG_APPINSTALL()
{
  ASDLogHandleForCategory(2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.appUsage.getter()
{
  id v0;

  v0 = ASD_LOG_APPUSAGE();
  return sub_19A0AEE58();
}

id ASD_LOG_APPUSAGE()
{
  ASDLogHandleForCategory(3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.arcade.getter()
{
  id v0;

  v0 = ASD_LOG_ARCADE();
  return sub_19A0AEE58();
}

id ASD_LOG_ARCADE()
{
  ASDLogHandleForCategory(4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.cleanup.getter()
{
  id v0;

  v0 = ASD_LOG_CLEANUP();
  return sub_19A0AEE58();
}

id ASD_LOG_CLEANUP()
{
  ASDLogHandleForCategory(5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.clips.getter()
{
  id v0;

  v0 = ASD_LOG_CLIPS();
  return sub_19A0AEE58();
}

id ASD_LOG_CLIPS()
{
  ASDLogHandleForCategory(6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.daap.getter()
{
  id v0;

  v0 = ASD_LOG_DAAP();
  return sub_19A0AEE58();
}

id ASD_LOG_DAAP()
{
  ASDLogHandleForCategory(7);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.daemon.getter()
{
  id v0;

  v0 = ASD_LOG_DAEMON();
  return sub_19A0AEE58();
}

id ASD_LOG_DAEMON()
{
  ASDLogHandleForCategory(8);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.daemonOversize.getter()
{
  id v0;

  v0 = ASD_LOG_OVERSIZE();
  return sub_19A0AEE58();
}

id ASD_LOG_OVERSIZE()
{
  ASDLogHandleForCategory(20);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.download.getter()
{
  id v0;

  v0 = ASD_LOG_DOWNLOAD();
  return sub_19A0AEE58();
}

id ASD_LOG_DOWNLOAD()
{
  ASDLogHandleForCategory(9);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.eventsExtension.getter()
{
  id v0;

  v0 = ASD_LOG_EVENTS_EXT();
  return sub_19A0AEE58();
}

id ASD_LOG_EVENTS_EXT()
{
  ASDLogHandleForCategory(10);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.extension.getter()
{
  id v0;

  v0 = ASD_LOG_EXTENSION();
  return sub_19A0AEE58();
}

id ASD_LOG_EXTENSION()
{
  ASDLogHandleForCategory(11);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.framework.getter()
{
  id v0;

  v0 = ASD_LOG_FRAMEWORK();
  return sub_19A0AEE58();
}

id ASD_LOG_FRAMEWORK()
{
  ASDLogHandleForCategory(12);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.general.getter()
{
  id v0;

  v0 = ASD_LOG_GENERAL();
  return sub_19A0AEE58();
}

id ASD_LOG_GENERAL()
{
  ASDLogHandleForCategory(13);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.library.getter()
{
  id v0;

  v0 = ASD_LOG_LIBRARY();
  return sub_19A0AEE58();
}

id ASD_LOG_LIBRARY()
{
  ASDLogHandleForCategory(14);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.metrics.getter()
{
  id v0;

  v0 = ASD_LOG_METRICS();
  return sub_19A0AEE58();
}

id ASD_LOG_METRICS()
{
  ASDLogHandleForCategory(15);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.migrate.getter()
{
  id v0;

  v0 = ASD_LOG_MIGRATE();
  return sub_19A0AEE58();
}

id ASD_LOG_MIGRATE()
{
  ASDLogHandleForCategory(16);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.odr.getter()
{
  id v0;

  v0 = ASD_LOG_ODR();
  return sub_19A0AEE58();
}

id ASD_LOG_ODR()
{
  ASDLogHandleForCategory(18);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.offloading.getter()
{
  id v0;

  v0 = ASD_LOG_OFFLOADING();
  return sub_19A0AEE58();
}

id ASD_LOG_OFFLOADING()
{
  ASDLogHandleForCategory(19);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.performance.getter()
{
  id v0;

  v0 = ASD_LOG_PERFORMANCE();
  return sub_19A0AEE58();
}

id ASD_LOG_PERFORMANCE()
{
  ASDLogHandleForCategory(21);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.privilegedTask.getter()
{
  id v0;

  v0 = ASD_LOG_PRIVTASK();
  return sub_19A0AEE58();
}

id ASD_LOG_PRIVTASK()
{
  ASDLogHandleForCategory(22);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.progress.getter()
{
  id v0;

  v0 = ASD_LOG_PROGRESS();
  return sub_19A0AEE58();
}

id ASD_LOG_PROGRESS()
{
  ASDLogHandleForCategory(23);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.purchase.getter()
{
  id v0;

  v0 = ASD_LOG_PURCHASE();
  return sub_19A0AEE58();
}

id ASD_LOG_PURCHASE()
{
  ASDLogHandleForCategory(24);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.push.getter()
{
  id v0;

  v0 = ASD_LOG_PUSH();
  return sub_19A0AEE58();
}

id ASD_LOG_PUSH()
{
  ASDLogHandleForCategory(25);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.qa.getter()
{
  id v0;

  v0 = ASD_LOG_QA();
  return sub_19A0AEE58();
}

id ASD_LOG_QA()
{
  ASDLogHandleForCategory(26);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.repair.getter()
{
  id v0;

  v0 = ASD_LOG_REPAIR();
  return sub_19A0AEE58();
}

id ASD_LOG_REPAIR()
{
  ASDLogHandleForCategory(27);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.restore.getter()
{
  id v0;

  v0 = ASD_LOG_RESTORE();
  return sub_19A0AEE58();
}

id ASD_LOG_RESTORE()
{
  ASDLogHandleForCategory(28);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.scheduler.getter()
{
  id v0;

  v0 = ASD_LOG_SCHEDULER();
  return sub_19A0AEE58();
}

id ASD_LOG_SCHEDULER()
{
  ASDLogHandleForCategory(29);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.signpost.getter()
{
  id v0;

  v0 = ASD_LOG_SIGNPOST();
  return sub_19A0AEE58();
}

id ASD_LOG_SIGNPOST()
{
  ASDLogHandleForCategory(30);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.skAdNetwork.getter()
{
  id v0;

  v0 = ASD_LOG_SKADNETWORK();
  return sub_19A0AEE58();
}

id ASD_LOG_SKADNETWORK()
{
  ASDLogHandleForCategory(31);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.skanner.getter()
{
  id v0;

  v0 = ASD_LOG_SKANNER();
  return sub_19A0AEE58();
}

id ASD_LOG_SKANNER()
{
  ASDLogHandleForCategory(32);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.softwareMap.getter()
{
  id v0;

  v0 = ASD_LOG_SOFTWAREMAP();
  return sub_19A0AEE58();
}

id ASD_LOG_SOFTWAREMAP()
{
  ASDLogHandleForCategory(33);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.sql.getter()
{
  id v0;

  v0 = ASD_LOG_SQL();
  return sub_19A0AEE58();
}

id ASD_LOG_SQL()
{
  ASDLogHandleForCategory(34);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.storeKit.getter()
{
  id v0;

  v0 = ASD_LOG_STOREKIT();
  return sub_19A0AEE58();
}

id ASD_LOG_STOREKIT()
{
  ASDLogHandleForCategory(35);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.storeKitInXcode.getter()
{
  id v0;

  v0 = ASD_LOG_OCTANE();
  return sub_19A0AEE58();
}

id ASD_LOG_OCTANE()
{
  ASDLogHandleForCategory(17);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.subscription.getter()
{
  id v0;

  v0 = ASD_LOG_SUB();
  return sub_19A0AEE58();
}

id ASD_LOG_SUB()
{
  ASDLogHandleForCategory(36);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.testFlightFeedback.getter()
{
  id v0;

  v0 = ASD_LOG_TESTFLIGHT();
  return sub_19A0AEE58();
}

id ASD_LOG_TESTFLIGHT()
{
  ASDLogHandleForCategory(37);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.testFlightExtension.getter()
{
  id v0;

  v0 = ASD_LOG_TESTFLIGHT_EXT();
  return sub_19A0AEE58();
}

id ASD_LOG_TESTFLIGHT_EXT()
{
  ASDLogHandleForCategory(38);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.vpp.getter()
{
  id v0;

  v0 = ASD_LOG_VPP();
  return sub_19A0AEE58();
}

id ASD_LOG_VPP()
{
  ASDLogHandleForCategory(40);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t static Logger.xdc.getter()
{
  id v0;

  v0 = ASD_LOG_XDC();
  return sub_19A0AEE58();
}

id ASD_LOG_XDC()
{
  ASDLogHandleForCategory(41);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_19A050110(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ECFFA990)
  {
    qword_1ECFFA990 = _sl_dlopen();
    if (!qword_1ECFFA990)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NRPairedDeviceRegistry");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ECFFA988 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A052500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_19A0527D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_19A0534DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_19A055280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A057D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A0599B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A059C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A059F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A05A1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A05AC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19A05AF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19A05B9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19A05BCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A05BFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A05C26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A05C52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id _ASA(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

void sub_19A06A4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06A630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A06A938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06AB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06ADA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06AF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06B17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06B400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06B7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06B9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06BD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06BF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06C350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06C5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06C7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A06C99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t ASDIsDaemon()
{
  return __IsDaemon;
}

uint64_t ASDSetIsDaemon(uint64_t result)
{
  __IsDaemon = result;
  return result;
}

void sub_19A06F620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A06F968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A06FE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t ASDInstallAttributionVersionCreateFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[.,]"), CFSTR("."), 1024, 0, objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1ECFFAA88 != -1)
    dispatch_once(&qword_1ECFFAA88, &__block_literal_global_11);
  objc_msgSend((id)_MergedGlobals_37, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

id __ErrorWithUnderlyingErrorAndPredicate(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a2;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "predicateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("Failed to execute query '%@'."), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2938]);

  if (v3)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASDAppQueryErrorDomain"), 1, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t ASDAggregateClusterMappingDataReadFrom(uint64_t a1, uint64_t a2)
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
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char v84;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
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
        v16 = v10 & 7;
        if (!v15 && v16 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = 0;
              v19 = 0;
              v20 = 0;
              while (1)
              {
                v21 = *v3;
                v22 = *(_QWORD *)(a2 + v21);
                if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                  break;
                v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
                *(_QWORD *)(a2 + v21) = v22 + 1;
                v20 |= (unint64_t)(v23 & 0x7F) << v18;
                if ((v23 & 0x80) == 0)
                  goto LABEL_95;
                v18 += 7;
                v14 = v19++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_97;
                }
              }
              *(_BYTE *)(a2 + *v5) = 1;
LABEL_95:
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v20) = 0;
LABEL_97:
              *(_DWORD *)(a1 + 128) = v20;
              goto LABEL_135;
            case 2u:
              if (v16 != 2)
              {
                v61 = 0;
                v62 = 0;
                v63 = 0;
                while (1)
                {
                  v64 = *v3;
                  v65 = *(_QWORD *)(a2 + v64);
                  if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v4))
                    goto LABEL_133;
                  v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
                  *(_QWORD *)(a2 + v64) = v65 + 1;
                  v63 |= (unint64_t)(v66 & 0x7F) << v61;
                  if (v66 < 0)
                  {
                    v61 += 7;
                    v14 = v62++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_134;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v31 = 0;
                v32 = 0;
                v33 = 0;
                while (1)
                {
                  v34 = *v3;
                  v35 = *(_QWORD *)(a2 + v34);
                  if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
                  *(_QWORD *)(a2 + v34) = v35 + 1;
                  v33 |= (unint64_t)(v36 & 0x7F) << v31;
                  if (v36 < 0)
                  {
                    v31 += 7;
                    v14 = v32++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_53;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
                PBRepeatedInt32Add();
              }
              goto LABEL_93;
            case 3u:
              if (v16 != 2)
              {
                v67 = 0;
                v68 = 0;
                v69 = 0;
                while (1)
                {
                  v70 = *v3;
                  v71 = *(_QWORD *)(a2 + v70);
                  if (v71 == -1 || v71 >= *(_QWORD *)(a2 + *v4))
                    goto LABEL_133;
                  v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
                  *(_QWORD *)(a2 + v70) = v71 + 1;
                  v69 |= (unint64_t)(v72 & 0x7F) << v67;
                  if (v72 < 0)
                  {
                    v67 += 7;
                    v14 = v68++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_134;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v37 = 0;
                v38 = 0;
                v39 = 0;
                while (1)
                {
                  v40 = *v3;
                  v41 = *(_QWORD *)(a2 + v40);
                  if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
                  *(_QWORD *)(a2 + v40) = v41 + 1;
                  v39 |= (unint64_t)(v42 & 0x7F) << v37;
                  if (v42 < 0)
                  {
                    v37 += 7;
                    v14 = v38++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_66;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_66:
                PBRepeatedInt32Add();
              }
              goto LABEL_93;
            case 4u:
              if (v16 != 2)
              {
                v73 = 0;
                v74 = 0;
                v75 = 0;
                while (1)
                {
                  v76 = *v3;
                  v77 = *(_QWORD *)(a2 + v76);
                  if (v77 == -1 || v77 >= *(_QWORD *)(a2 + *v4))
                    goto LABEL_133;
                  v78 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v77);
                  *(_QWORD *)(a2 + v76) = v77 + 1;
                  v75 |= (unint64_t)(v78 & 0x7F) << v73;
                  if (v78 < 0)
                  {
                    v73 += 7;
                    v14 = v74++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_134;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v43 = 0;
                v44 = 0;
                v45 = 0;
                while (1)
                {
                  v46 = *v3;
                  v47 = *(_QWORD *)(a2 + v46);
                  if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
                  *(_QWORD *)(a2 + v46) = v47 + 1;
                  v45 |= (unint64_t)(v48 & 0x7F) << v43;
                  if (v48 < 0)
                  {
                    v43 += 7;
                    v14 = v44++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_79;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_79:
                PBRepeatedInt32Add();
              }
              goto LABEL_93;
            case 5u:
              if (v16 != 2)
              {
                v55 = 0;
                v56 = 0;
                v57 = 0;
                while (1)
                {
                  v58 = *v3;
                  v59 = *(_QWORD *)(a2 + v58);
                  if (v59 == -1 || v59 >= *(_QWORD *)(a2 + *v4))
                    goto LABEL_133;
                  v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
                  *(_QWORD *)(a2 + v58) = v59 + 1;
                  v57 |= (unint64_t)(v60 & 0x7F) << v55;
                  if (v60 < 0)
                  {
                    v55 += 7;
                    v14 = v56++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_134;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v25 = 0;
                v26 = 0;
                v27 = 0;
                while (1)
                {
                  v28 = *v3;
                  v29 = *(_QWORD *)(a2 + v28);
                  if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
                  *(_QWORD *)(a2 + v28) = v29 + 1;
                  v27 |= (unint64_t)(v30 & 0x7F) << v25;
                  if (v30 < 0)
                  {
                    v25 += 7;
                    v14 = v26++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_38;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_38:
                PBRepeatedInt32Add();
              }
              goto LABEL_93;
            case 6u:
              if (v16 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                {
                  v49 = 0;
                  v50 = 0;
                  v51 = 0;
                  while (1)
                  {
                    v52 = *v3;
                    v53 = *(_QWORD *)(a2 + v52);
                    if (v53 == -1 || v53 >= *(_QWORD *)(a2 + *v4))
                      break;
                    v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
                    *(_QWORD *)(a2 + v52) = v53 + 1;
                    v51 |= (unint64_t)(v54 & 0x7F) << v49;
                    if (v54 < 0)
                    {
                      v49 += 7;
                      v14 = v50++ >= 9;
                      if (!v14)
                        continue;
                    }
                    goto LABEL_92;
                  }
                  *(_BYTE *)(a2 + *v5) = 1;
LABEL_92:
                  PBRepeatedInt32Add();
                }
LABEL_93:
                PBReaderRecallMark();
              }
              else
              {
                v79 = 0;
                v80 = 0;
                v81 = 0;
                while (1)
                {
                  v82 = *v3;
                  v83 = *(_QWORD *)(a2 + v82);
                  if (v83 == -1 || v83 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v84 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v83);
                  *(_QWORD *)(a2 + v82) = v83 + 1;
                  v81 |= (unint64_t)(v84 & 0x7F) << v79;
                  if (v84 < 0)
                  {
                    v79 += 7;
                    v14 = v80++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_134;
                }
LABEL_133:
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_134:
                PBRepeatedInt32Add();
              }
LABEL_135:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_135;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19A073C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A073DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A073F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A0740E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A074324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A07448C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A074764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A0748B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A077754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _autoUpdatesEnabled()
{
  BOOL v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[15];
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("AutoUpdatesEnabled"), CFSTR("com.apple.itunesstored"), &keyExistsAndHasValidFormat))
  {
    v0 = 1;
  }
  else
  {
    v0 = keyExistsAndHasValidFormat == 0;
  }
  v1 = v0;
  if (!v0)
  {
    ASDLogHandleForCategory(12);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19A03B000, v2, OS_LOG_TYPE_INFO, "Auto updates disabled", v4, 2u);
    }

  }
  return v1;
}

void sub_19A078690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19A078810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19A079B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19A080D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A080FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19A08119C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A0812F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A083698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_19A088070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A0882E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19A088478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19A088790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19A08D8E4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_19A08DA78(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t ASDDebugFileLevel()
{
  if (qword_1ECFFA960 != -1)
    dispatch_once(&qword_1ECFFA960, &__block_literal_global_40_0);
  return _MergedGlobals_21;
}

uint64_t ASDDebugLevel()
{
  if (qword_1ECFFA960 != -1)
    dispatch_once(&qword_1ECFFA960, &__block_literal_global_40_0);
  return qword_1ECFFA8F8;
}

void ASDDebugLogV(unint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  ASDRollableLog *v6;
  BOOL v7;
  ASDRollableLog *v8;
  ASDRollableLog *v9;
  void *v10;
  void *v11;
  __CFDateFormatter *v12;
  CFAbsoluteTime Current;
  CFStringRef StringWithAbsoluteTime;
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  if (qword_1ECFFA960 != -1)
  {
    v17 = v5;
    dispatch_once(&qword_1ECFFA960, &__block_literal_global_40_0);
    v5 = v17;
  }
  if (_MergedGlobals_21 >= a1)
  {
    v16 = v5;
    pthread_mutex_lock(&stru_1ECFFA900);
    v6 = (ASDRollableLog *)(id)_MergedGlobals_1;
    if (v6)
      v7 = 1;
    else
      v7 = qword_1ECFFA948 == 0;
    if (!v7)
    {
      v8 = [ASDRollableLog alloc];
      v9 = -[ASDRollableLog initWithLogOptions:](v8, "initWithLogOptions:", qword_1ECFFA948);
      v10 = (void *)_MergedGlobals_1;
      _MergedGlobals_1 = (uint64_t)v9;

      v6 = v9;
    }
    pthread_mutex_unlock(&stru_1ECFFA900);
    if (v6)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v16, a3);
      if (qword_1ECFFA958 != -1)
        dispatch_once(&qword_1ECFFA958, &__block_literal_global_23);
      v12 = (__CFDateFormatter *)qword_1ECFFA950;
      Current = CFAbsoluteTimeGetCurrent();
      StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(0, v12, Current);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ [%d]: %@\n"), StringWithAbsoluteTime, getpid(), v11);
      -[ASDRollableLog writeString:](v6, "writeString:", v15);
      CFRelease(StringWithAbsoluteTime);

    }
    v5 = v16;
  }

}

void ASDDebugLog(unint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ASDDebugLogV(a1, a2, (uint64_t)&a9);
}

uint64_t ASDDebugSetFileLoggingOptions(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  pthread_mutex_lock(&stru_1ECFFA900);
  v2 = (void *)qword_1ECFFA948;
  qword_1ECFFA948 = (uint64_t)v1;

  return pthread_mutex_unlock(&stru_1ECFFA900);
}

uint64_t __ReloadDebugUserDefaults()
{
  int has_internal_content;
  BOOL v1;
  int v2;
  int v3;
  Boolean keyExistsAndHasValidFormat;

  has_internal_content = os_variant_has_internal_content();
  keyExistsAndHasValidFormat = 0;
  _MergedGlobals_21 = CFPreferencesGetAppIntegerValue(CFSTR("DebugFileLevel"), CFSTR("com.apple.appstored"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = 1;
  else
    v1 = has_internal_content == 0;
  if (!v1)
  {
    _MergedGlobals_21 = 3;
    CFPreferencesSetAppValue(CFSTR("DebugFileLevel"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3), CFSTR("com.apple.appstored"));
  }
  qword_1ECFFA8F8 = CFPreferencesGetAppIntegerValue(CFSTR("DebugLevel"), CFSTR("com.apple.appstored"), 0);
  CFPreferencesGetAppBooleanValue(CFSTR("LogIncomingHeaders"), CFSTR("com.apple.appstored"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v2 = 0;
  else
    v2 = has_internal_content;
  if (v2 == 1)
    CFPreferencesSetAppValue(CFSTR("LogIncomingHeaders"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("com.apple.appstored"));
  CFPreferencesGetAppBooleanValue(CFSTR("LogOutgoingHeaders"), CFSTR("com.apple.appstored"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = 0;
  else
    v3 = has_internal_content;
  if (v3 == 1)
    CFPreferencesSetAppValue(CFSTR("LogOutgoingHeaders"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("com.apple.appstored"));
  return CFPreferencesGetAppBooleanValue(CFSTR("LogXML"), CFSTR("com.apple.appstored"), 0);
}

id ASDLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AppStoreDaemon.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:localization:", v2, 0, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_19A08F238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A093EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A09889C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A09D9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A09DC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19A09F264(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_19A09F71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1EE37C9E8)
  {
    qword_1EE37C9E8 = _sl_dlopen();
    if (!qword_1EE37C9E8)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LSApplicationWorkspace");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  _MergedGlobals_6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A0A3D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  id *v12;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A0A4240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASDErrorWithTitleAndMessage(void *a1, uint64_t a2, void *a3, void *a4)
{
  return ASDErrorWithUnderlyingErrorAndInfo(0, a1, a2, a3, a4, 0);
}

id ASDErrorWithUnderlyingError(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  return ASDErrorWithUnderlyingErrorAndInfo(a1, a2, a3, a4, a5, 0);
}

uint64_t ASDErrorIsEqual(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  v6 = a2;
  if (v5 && objc_msgSend(v5, "code") == a3)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t ASDErrorSearch(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a1;
  v6 = a2;
  if ((ASDErrorIsEqual(v5, v6, a3) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "underlyingErrors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    while (1)
    {

      if (!objc_msgSend(v9, "count"))
      {
        v7 = 0;
        goto LABEL_12;
      }
      -[NSMutableArray asd_pop](v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((ASDErrorIsEqual(v8, v6, a3) & 1) != 0)
        break;
      objc_msgSend(v8, "underlyingErrors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v8, "underlyingErrors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v9, "addObjectsFromArray:", v11);

      }
    }

    v7 = 1;
LABEL_12:

  }
  return v7;
}

id ASDErrorBySettingUserInfoValue(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v5;
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v6, "length"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v8, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v8, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addEntriesFromDictionary:", v12);

      }
      if (v7)
        objc_msgSend(v10, "setObject:forKey:", v7, v6);
      else
        objc_msgSend(v10, "removeObjectForKey:", v6);
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v8, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v8, "code"), v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id safeUserInfoValue(void *a1)
{
  id v1;
  id v2;
  id v3;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t v35[128];
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ASDErrorWithSafeUserInfo(v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__15;
    v39 = __Block_byref_object_dispose__15;
    v40 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __safeUserInfoValue_block_invoke;
    v30[3] = &unk_1E37C0210;
    v30[4] = &buf;
    v30[5] = &v31;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:", v30);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v5 = objc_msgSend(v1, "count");
      v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      objc_msgSend(v1, "subarrayWithRange:", 0, v32[3]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v6);

      objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v7 = v32[3] + 1;
      if (v7 < v5)
      {
        do
        {
          objc_msgSend(v1, "objectAtIndexedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          safeUserInfoValue(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            v11 = v9;
          }
          else
          {
            objc_msgSend(v8, "description");
            v11 = (id)objc_claimAutoreleasedReturnValue();
          }
          v12 = v11;

          objc_msgSend(v3, "addObject:", v12);
          ++v7;
        }
        while (v5 != v7);
      }
    }
    else
    {
      v3 = v1;
    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1, "count"));
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __safeUserInfoValue_block_invoke_2;
      v28[3] = &unk_1E37C0238;
      v14 = v13;
      v29 = v14;
      objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v28);
      if (objc_msgSend(v14, "isEqualToDictionary:", v1))
        v15 = v1;
      else
        v15 = (id)objc_msgSend(v14, "copy");
      v3 = v15;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v1, "count"));
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v17 = v1;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v25 != v19)
                objc_enumerationMutation(v17);
              safeUserInfoValue(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v21, (_QWORD)v24);

            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
          }
          while (v18);
        }

        if (objc_msgSend(v16, "isEqualToSet:", v17))
          v22 = v17;
        else
          v22 = (id)objc_msgSend(v16, "copy");
        v3 = v22;

      }
      else
      {
        if (objc_msgSend(v1, "conformsToProtocol:", &unk_1EE37DC20))
        {
LABEL_3:
          v2 = v1;
LABEL_4:
          v3 = v2;
          goto LABEL_5;
        }
        ASDLogHandleForCategory(13);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_19A03B000, v23, OS_LOG_TYPE_INFO, "Dropping value from NSError.userInfo that could potentially cause problems: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        v3 = 0;
      }
    }
  }
LABEL_5:

  return v3;
}

void sub_19A0ADFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

id ASDErrorWithUserInfoAndFormat(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a3;
  v12 = (void *)objc_msgSend(a2, "mutableCopy");
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = v14;

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, &a9);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB2938]);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASDErrorDomain"), a1, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id ASDErrorWithUnderlyingErrorAndInfo(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;

  v11 = a1;
  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if ((unint64_t)v13 | (unint64_t)v14)
  {
    v16 = (__CFString *)v13;
  }
  else
  {
    v14 = CFSTR("An unknown error occurred");
    v16 = CFSTR("Unhandled exception");
  }
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = v17;
  if (v15)
    objc_msgSend(v17, "addEntriesFromDictionary:", v15);
  if (v11)
    objc_msgSend(v18, "setObject:forKey:", v11, *MEMORY[0x1E0CB3388]);
  if (v16)
    objc_msgSend(v18, "setObject:forKey:", v16, *MEMORY[0x1E0CB2D50]);
  if (v14)
    objc_msgSend(v18, "setObject:forKey:", v14, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v12, a3, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id ASDLocalizedTextForUserPresentableError(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((unint64_t)(a1 - 1) < 2)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ASDAppName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      ASDLocalizedString(CFSTR("SIGN_IN_FROM_WATCH_APP_WITH_NAME"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      ASDLocalizedString(CFSTR("SIGN_IN_FROM_WATCH_APP"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[0] = CFSTR("ASDLocalizedTitle");
    ASDLocalizedString(CFSTR("SIGN_IN_REQUIRED"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("ASDLocalizedMessage");
    v15[0] = v10;
    v15[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (a1 == 10)
  {
    v12[0] = CFSTR("ASDLocalizedTitle");
    ASDLocalizedString(CFSTR("DOWNLOAD_ERROR_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = CFSTR("ASDLocalizedMessage");
    v13[0] = v8;
    ASDLocalizedString(CFSTR("NO_NETWORK_MESSAGE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

void __safeUserInfoValue_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  safeUserInfoValue();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v9)
  {
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(v9, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v8);
    if (!v7)

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

void __safeUserInfoValue_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  safeUserInfoValue(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  safeUserInfoValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

void sub_19A0AEA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_19A0AEE04()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_19A0AEE10()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_19A0AEE1C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_19A0AEE28()
{
  return MEMORY[0x1E0CB0BD8]();
}

uint64_t sub_19A0AEE34()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_19A0AEE40()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_19A0AEE4C()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_19A0AEE58()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_19A0AEE64()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_19A0AEE70()
{
  return MEMORY[0x1E0CB1A30]();
}

uint64_t sub_19A0AEE7C()
{
  return MEMORY[0x1E0CB1A38]();
}

uint64_t sub_19A0AEE88()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_19A0AEE94()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_19A0AEEA0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_19A0AEEAC()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_19A0AEEB8()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AMSError()
{
  return MEMORY[0x1E0CFD800]();
}

uint64_t AMSHashIfNeeded()
{
  return MEMORY[0x1E0CFD850]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1E0D034A8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1E0D034B8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1E0D034C0]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1E0C98488](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSUnimplemented_()
{
  return MEMORY[0x1E0CB33D8]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1E0D82E00]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1E0C81740](__key, __base, __nel, __width, __compar);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1E0C82A98]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1E0DDFEA0]();
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

